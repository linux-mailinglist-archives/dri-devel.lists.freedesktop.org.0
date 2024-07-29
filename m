Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E0E93ECC0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 06:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F4610E060;
	Mon, 29 Jul 2024 04:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PY1HrrJI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A0710E060;
 Mon, 29 Jul 2024 04:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722229159; x=1753765159;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3GXyj510KkcmQrOOfI6/qvdnGnOLq1UEgQudIyFDGeQ=;
 b=PY1HrrJIsEQoZ0oFwEABRh5DTq4NshbV2Z0OS5i/XTuEmPBw3kBe2rjv
 h1q4feTTbf5006UF57yFpA30SkPUxdT3tGzxwUlnLt+YNYHKNUcMokQ7S
 kpTDb4/idwlnmsjBlUd3hCwjK1QgYEGpHVxGvgb9dHbUiFLFk2bVkvTnC
 EOIHMzAYaAsAPdx1A8XSkAF2NZCAyQ/R3ERrMq50RfQw6jantZqHwQF/1
 YPMqlsuHchZmIvb2AIlx49S6u/N7Pu2EglzCh7K3q2c2+emmrqFrer8Wk
 veD/g6+hGgpAVvi2+/IzRaV3MqeQIMPLUdJru01mAhnQ+k4JCxqxwz5Xk A==;
X-CSE-ConnectionGUID: 54bRsehlSL2ENAwlby495Q==
X-CSE-MsgGUID: xlWvdQ22SPaIBK+/K+I6/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="12759722"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="12759722"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2024 21:59:18 -0700
X-CSE-ConnectionGUID: Iw7zQ2dsTkmyv+w54KucNg==
X-CSE-MsgGUID: nuQIcgqzSbaQdMpW2spJDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="57978582"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jul 2024 21:59:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 28 Jul 2024 21:59:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 28 Jul 2024 21:59:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 28 Jul 2024 21:59:16 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 28 Jul 2024 21:59:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWBnqSJdfGGWID5B/ipbC3xzKdPlyGlF7Pf7wr2AhuzrZHz7RTrMHpmIZq9/g29HvcIKaAHHcKHvgnEwz3T8kE8D/o/Rqxs34JH70JEqJA47lIrUQPqEDQ5ksruShKe/Q9fnShTvHiY3JI7G6n2WcLstZOPn6E3VwHWbYegbIzCjXecSeiyZ4aTMijScG15w2LjOPWZDjO/ujlBj6HCjWLXe3JU9EJ4IH+ruBEfEvurzo8H90tIy3JE+FVIiy4aGwimzpEyRdwbUzI9BSTNVBioqn3J2qvguBb1bnRijQZj7D4dikHFIyPyWjG3Wvdab80AQ30SprZ+CnQbr1prTyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpZ9LGD70r5R7+UBOmcJr1qWF+NtJX/FNljp/4HkkiY=;
 b=VQDI+DS/ZUo+2iokIVQDpOCugY3nGnANQNq3AoLVStAMUZFbEM5ai+Gn+YA6XvC5J5E0lUjTIXlHJ2MgNrnJv4MMMmzyRiAM5OUOqThl9qqVVqi2AFfKoaksUaGVUwliIc9y9QZ6lGqKiqQ44EL1ot1W2C22p3UiFb/BY7TBa9dFz0NAxVseFhUFG4445dguIx/bl/mj9oU0xqYXMuvnaO74VuusqunGlNn1n3OKIu8RTmgQJ7C7MlQWpcNaAaMiarl8BC5cJ2BO3BA6N9bwMk6gwP6XEe/XsUlD7KuWr7oOhNZeTulOUyLGM1bRGakijyTKZMiUkXSSlFJ1P6MYKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CY8PR11MB7243.namprd11.prod.outlook.com (2603:10b6:930:96::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 04:59:14 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 04:59:14 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] RFC: drm/drm_plane: Expose the plane capability and
 interoperability
Thread-Topic: [PATCH] RFC: drm/drm_plane: Expose the plane capability and
 interoperability
Thread-Index: AQHa0dWUAPOk7QcYUEWdXvrZAsOcWbINRD1w
Date: Mon, 29 Jul 2024 04:59:14 +0000
Message-ID: <IA0PR11MB7307E4F207A125F53A23342BBAB72@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20240709074656.1389387-1-arun.r.murthy@intel.com>
In-Reply-To: <20240709074656.1389387-1-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|CY8PR11MB7243:EE_
x-ms-office365-filtering-correlation-id: 32db46fe-1791-43e8-2ad2-08dcaf8b3188
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?5sw29Il/bMra0zABfkP5h7Sx5+xD4Vgzf8doZy/LMgyeSxOUkfRK+cqdHmyh?=
 =?us-ascii?Q?N1E9xgG1Qu4sZvfjx67MU0WzqvwypHexmX5vGIdkLr2c1Sszrq6BB4lBWcdg?=
 =?us-ascii?Q?w/So+LYqz9vn2rxmMUoEhGjz3PUrChHNPkNiNDeNfLjqzhs74ObOFoQmlxer?=
 =?us-ascii?Q?QGo7OKcszzDKcuKs2nH+dZafyqUvs4oq8fIPKSO+bYVh6BgKUj5mn2EmDmZK?=
 =?us-ascii?Q?KfDhFe7kV2nMHbC0LyRF0HmzC+MwKofhb0Kuqz8Z04msUqplnZTUdHmmIfAa?=
 =?us-ascii?Q?YgZkmu3DXFQRcmp0OIEJeVADsqHXI0l/mvD6GBMkFaw6XwNZ2GqAhVPDgXda?=
 =?us-ascii?Q?6G1e4T39p6aGmfgt0dpqukLdtjLXNIS4sghe9Cp1+7UfU1AWK6K6dMOnC9xB?=
 =?us-ascii?Q?gq5Omw1iqn0k6/W/NMNto/VzROGKO1HNjVoZBKO1ZY4uCY7vUCK6+7Fq0B5f?=
 =?us-ascii?Q?JSZiQ7BUYqVhKOdGR8XGa97J9WLh9KyBa1IBzmusZ4KrWVJuH0AVAiTbaULg?=
 =?us-ascii?Q?hjUDUEIRyxb88RkwM2w+LRknnAHGoe1GmkffuG668mlFhD36+6F4spb3O4k7?=
 =?us-ascii?Q?HAX0X3N5yywdSDhgePYrqYn3JX90UO/vVw+pqS7LE5UUeETGhFFbTje5KJCA?=
 =?us-ascii?Q?g/GdNvb0EAqemTQMXTqYjZvo2clk7LWJRF8O/LAsrf5fUlRuvtFHnHagFNNo?=
 =?us-ascii?Q?kwv9JIon5YlIsucdGBjZPI1q2t/CFs4auHpw4UJ/6v2NB/+1oHc8p+brsoaN?=
 =?us-ascii?Q?VpLR+XM4ArJ4HzpQh3q5N66/jNb+yB77hD8QuEIpOc/9k/5m6FHdq1udhPRw?=
 =?us-ascii?Q?U7Y52G3Lcn7JBcj7VcYVpJ+HCmwT/MMU3+q6oaOf/sbwTO7ZhUIAFeoORrtS?=
 =?us-ascii?Q?6OBu3dt0MIlgG+AU7BqHPDpVyT3JCQ1Ki1HFM1WcYnkMj+E9MqlNs1ILsRMW?=
 =?us-ascii?Q?kisla93ur8PaPCmlaVnAKGu0HQnI0Cb2EhEklGNfz+iZdHUg/2/EL4cZSJSR?=
 =?us-ascii?Q?auoYo24y9n/frOJMY9Kw6w3Gt7/nhoa++kq0Q/kA2Xx2apPB6ZFyZhHVw0pw?=
 =?us-ascii?Q?7RotQ9DYj35Wzj7JpyBwUfu0PtPMQkEmud8gHBZwyADBuNhdUznK0HdOwe83?=
 =?us-ascii?Q?Yjm+29C3NzxMg82MMuvt+97vB5nOLDNY2pL223YBO1tUcBYk6a/sElVVUSdu?=
 =?us-ascii?Q?emt6nqQbZM9+xnpAjAywt2noaSBY77eZz2M8Z1gcwZ1ZAm1a6UhkPFbJb2zl?=
 =?us-ascii?Q?wMWqYFchdJQezY1XUAYfYVDMxac4tz8fkvY+p08CfAmtfkKtWmn7IdCE0mF/?=
 =?us-ascii?Q?zQx+DQqsdQMCse3AtR+uIwrsHr0bCClTUN2rpa577tBYrGbklH7I5C+6cqP4?=
 =?us-ascii?Q?YqdBeC1jS07GYq+v2Q+I/DIqesy6KmyjKGUsyQNwCrOyv3Pvww=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OmCf0aFcrDLs9nPh+GCMmHPkFXrxgHDArmUeUVSQUk6LNlSHomnJXCSCl4EJ?=
 =?us-ascii?Q?b59+nRE/SijIxh0Y1PJkoRrBHS9ZkUE73uQJvC+Z/zCxI5B2phrHbIDQoW/a?=
 =?us-ascii?Q?ErMAviWorQyR+YcJgTVAEyLIIHuf6GjncQnhV046j4F8Oe4l6yLJgkIBFuFv?=
 =?us-ascii?Q?vW/mdOYVJNzrKIjVaNo9+CCDl2OIvF9Eyk8Y3mgNWkWnw0xrSQ/4i/Qd0Ht5?=
 =?us-ascii?Q?uB4NXCQ7q965wSTxhZ2Lhf65pNolcyoPgOph0/bAc5sdgwQDXZUS8+APYAWC?=
 =?us-ascii?Q?j/6xiKREy5S9eu8uH+Tw+XPsc2F85e3vH+GaYTA2arwMULiC4WxPiSLpFB7E?=
 =?us-ascii?Q?EjmMQQ6RtSbjhyBg5Whr0Vac1EwQkYQSvDzo+aPQZxvx68wx5yKZW0zCbAab?=
 =?us-ascii?Q?uPAnLFx4R2wIWIcBrTvDF+ZjiY+vXYkxuPv5M0883K8tBIl4LziWgNcHmQcq?=
 =?us-ascii?Q?EHaSQmNbsqnn/iJjuXy2jBrs7pFeb7U7d/QeWWuYDfCf+gGBNpWdVHrdfDKL?=
 =?us-ascii?Q?I+S1VZ3Q/S9dhK88lj2wEjEc4SJHPuqho/4Hue1bGhhNfZ6h9kUEUJBLibqN?=
 =?us-ascii?Q?ygdk0rZGXGeM/GOi8vprASrteq4FCCx0BbARrdUml/nhMmWOV7g2zRCyWK87?=
 =?us-ascii?Q?JUkxl0X/ctfcMcNOIcBnS/6q/sSrZ+Zg3NsjJhzlUShPIPXD2T0/QOJROyYT?=
 =?us-ascii?Q?tw6BFsDPDVY/ZOsb6iaF1MqJjoYbrt8ZWscsM1BotWDbFx+Iv3l3ptuYiKsR?=
 =?us-ascii?Q?Vaea83r+Ujlqh3S7z4LQAc5XXfIt72k+s6FXfVIH39AO+8DrAUdIPmIe043R?=
 =?us-ascii?Q?/WtBtUbOZ3wbjjBuBHpab2c08QfJoK86/z+Ue0wI4MhtswmXRzCRdGzn1kAl?=
 =?us-ascii?Q?CZSyvDwCmBpe8nn51owLQZaw0tE5MIPY7+RPTQCE05tD86JkGcvUY9lpbUbX?=
 =?us-ascii?Q?pnxy4lZHbiYsPMxynImpgscLVxiMurjAAqB3OKvdaMINJSM2oDOSoqarwkFs?=
 =?us-ascii?Q?JJsVmI0SJJHM+Taqa6pk6kpjhXeH5pGxAXghtKgvoVmoTdPf3jnVhTQZc2r8?=
 =?us-ascii?Q?Io6ADuNzhPUcxfPoFC6/KV5KAZapXVYjXKBKPKpyyVXH6i6SunpjK+N1M9cg?=
 =?us-ascii?Q?gIIMcuIUUp3CGcfDqRtTPMYfoN8BsTUcbMelLeFjtiydE3Bi8mVzkeRtYrTP?=
 =?us-ascii?Q?zgXGu/1eevt2nn4ukKq8y5TVj/5cUQA1NWiyTJFFK9tOpOx2qJMQdfWPSjkS?=
 =?us-ascii?Q?C4gjSzU6TSjL6OU+X4tW2QQ9lsMAUiWqFyZO69na0poeJkHPIIe3KEQY1tld?=
 =?us-ascii?Q?RvJWe5zP++tM1YWsPsK6/SkbdUNEZmDCrgB1g/lCb/eHJwf4p8OeGOWN8D4c?=
 =?us-ascii?Q?FtR8G44HFGxJUX4bOs14a6OzsSmNUTbn40lmdCpAWUfuNTlu8QwDdQ1WGEx7?=
 =?us-ascii?Q?mfGwBUPBQteUIl1XJPCWck9mtB/izKbgJQkBBUHBzlMRQR+uR/yjjqHBbpT3?=
 =?us-ascii?Q?R8IPiBHV7rJdiQKy150k6NuFpNnszXLXfaJxgiJZ+/LC/Jj9NLqtbbXO/zia?=
 =?us-ascii?Q?l77NkITTV3iTVic3HuK+Cl+Fqwj/yzL133VBREt0yd2RrwXaOagmRjx+B80u?=
 =?us-ascii?Q?hnq4zfSOUXSOj9LmGbgUdnNpdItnFoPrUMbAQ/KUOFVO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32db46fe-1791-43e8-2ad2-08dcaf8b3188
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2024 04:59:14.5620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GW2+e4kr9vDPGhbOuZAsRi16R6RV2sqoX9sgG+hPTI7vnLJjdYZ8b6K5M/wpijgbIx0KTIt46jwoeRhD9Mzb8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7243
X-OriginatorOrg: intel.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Gentle Reminder!
Any comments?

Thanks and Regards,
Arun R Murthy
--------------------

> -----Original Message-----
> From: Murthy, Arun R <arun.r.murthy@intel.com>
> Sent: Tuesday, July 9, 2024 1:17 PM
> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCH] RFC: drm/drm_plane: Expose the plane capability and
> interoperability
>=20
> Each plane has its own capability or interoperability based on the harwar=
e
> restrictions. If this is exposed to the user, then user can read it once =
on boot
> and store this. Later can be used as a lookup table to check a correspond=
ing
> capability is supported by plane then only go ahead with the framebuffer
> creation/calling atomic_ioctl.
>=20
> For Ex: There are few restiction as to async flip doesnt support all the
> formats/modifiers. Similar restrictions on scaling. With the availabililt=
y of this
> info to user, failures in atomic_check can be avoided as these are more t=
he
> hardware capabilities.
>=20
> There are two options on how this can be acheived.
> Option 1:
>=20
> Add a new element to struct drm_mode_get_plane that holds the addr to the
> array of a new struct. This new struct consists of the formats supported =
and the
> corresponding plane capabilities.
>=20
> Option 2:
>=20
> These can be exposed to user as a plane property so that the user can get=
 to
> know the limitation ahead and avoid failures in atomic_check.
>=20
> Usually atomic_get_property is controlled over the state struct for the
> parameters/elements that can change. But here these capabilities or the
> interoperabilities are rather hardware restrictions and wont change over =
flips.
> Hence having as a plane_property may not make much sense.
> On the other hand, Option 1 include changes in the uapi struct
> drm_mode_get_plane. Shouldnt have impact on backward compatibility, but i=
f
> userspace has some implementation so as to check the size of the struct, =
then it
> might a challenge.
>=20
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
>  include/drm/drm_plane.h           |  8 ++++++++
>  include/uapi/drm/drm_mode.h       | 20 ++++++++++++++++++++
>  3 files changed, 31 insertions(+)
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DOption 2=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> b/drivers/gpu/drm/drm_atomic_uapi.c
> index 22bbb2d83e30..b46177d5fc8c 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -631,6 +631,9 @@ drm_atomic_plane_get_property(struct drm_plane
> *plane,
>  		*val =3D state->hotspot_x;
>  	} else if (property =3D=3D plane->hotspot_y_property) {
>  		*val =3D state->hotspot_y;
> +	} else if (property =3D=3D config->prop_plane_caps) {
> +		*val =3D (state->plane_caps) ?
> +			state->plane_caps->base.id : 0;
>  	} else {
>  		drm_dbg_atomic(dev,
>  			       "[PLANE:%d:%s] unknown property
> [PROP:%d:%s]\n", diff --git a/include/drm/drm_plane.h
> b/include/drm/drm_plane.h index dd718c62ac31..dfe931677d0a 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -260,6 +260,14 @@ struct drm_plane_state {
>  	 * flow.
>  	 */
>  	bool color_mgmt_changed : 1;
> +
> +	/**
> +	 * @plane_caps:
> +	 *
> +	 * Blob representing plane capcabilites and interoperability.
> +	 * This element is a pointer to the array of struct drm_format_blob.
> +	 */
> +	struct drm_property_blob *plane_caps;
>  };
>=20
>  static inline struct drm_rect
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DOption 1=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index d390011b89b4..0b5c1b65ef63 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -312,6 +312,20 @@ struct drm_mode_set_plane {
>  	__u32 src_w;
>  };
>=20
> +#define DRM_FORMAT_PLANE_CAP_LINEAR_TILE	BIT(0)
> +#define DRM_FORMAT_PLANE_CAP_X_TILE		BIT(1)
> +#define DRM_FORMAT_PLANE_CAP_Y_TILE		BIT(2)
> +#define DRM_FORMAT_PLANE_CAP_Yf_TILE		BIT(3)
> +#define DRM_FORMAT_PLANE_CAP_ASYNC_FLIP		BIT(4)
> +#define DRM_FORMAT_PLANE_CAP_FBC		BIT(5)
> +#define DRM_FORMAT_PLANE_CAP_RC			BIT(6)
> +
> +struct drm_format_blob {
> +	__u64 modifier;
> +	__u32 plane_caps;
> +
> +};
> +
>  /**
>   * struct drm_mode_get_plane - Get plane metadata.
>   *
> @@ -355,6 +369,12 @@ struct drm_mode_get_plane {
>  	 * supported by the plane. These formats do not require modifiers.
>  	 */
>  	__u64 format_type_ptr;
> +	/**
> +	 * @ format_blob_ptr: Pointer to the array of struct drm_format_blob.
> +	 * Specify the plane capabilites/restrictions w.r.t tiling/sync-async
> +	 * flips etc
> +	 */
> +	__u64 format_blob_ptr;
>  };
>=20
>  struct drm_mode_get_plane_res {
> --
> 2.25.1

