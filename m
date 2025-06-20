Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 594E9AE1333
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 07:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6362A10EADB;
	Fri, 20 Jun 2025 05:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U5BcBq8S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F1F10EAD9;
 Fri, 20 Jun 2025 05:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750398176; x=1781934176;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/BO4/XPy2qAgXQAPEh3vDYz7etfISYzzJtW113PGEKk=;
 b=U5BcBq8SdfUVhNAMFg6yNmqOATu1I2DsMyMt3Y8Elk8j0jFASDc+Y7Jc
 HyVHKvUh0BK29R1nBaC/TaGUITPDT/pxV/zhq+4qDzi8qqH004VqnfEsn
 ZMCQEJe4bx5uIYtUvsAJDowGiBg5svLMiXnguknjF/Gn7AAaU7dsbF264
 4vXlHltOMiIv0s673b9uYzIxmg2Sh31YAReZJ72R/fxvuqZ4jhjOYOc4Q
 PNCscoueCsocd9pFmrsvf2nEKCwbEQLMMPQs+fYe5P7NRa/QF5Z9XyhmX
 FS0lIkhJqfMl/ck2exG/tPF5GQbTnjjeAMvomsTFd20r2y8TbjlC37ieW g==;
X-CSE-ConnectionGUID: xFAvLMnLSJKgX0le2z6R+g==
X-CSE-MsgGUID: ygZanvhoSWSgJK6PpGHoMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70217617"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="70217617"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 22:42:56 -0700
X-CSE-ConnectionGUID: itgPsm08R7G9T5Q6Q0OAkQ==
X-CSE-MsgGUID: Vpeiy3xvR1WesVbSXocT5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="174432832"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 22:42:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 22:42:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 22:42:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.74)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 22:42:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDml/jWv9Wg8kaJg4rDxlRjkvwNBk3Kmbk5kt+OhadgFOjQcTm4JakfkZtMW4cnHLmMp5v4TROl1N7fTS56AqjsIfvfpxW/toPNUU86Km8kJh8RtnBeNvMZBxZ46JLDfqKpcge0StVWCoBrWeAe55Gbd4puUXqc0ixNO7Ots/BzxCRHL+Q9aeay4A/0uJurgJ2Qz6vRoMbVhRQAQWTUXPcVNQuJZKJnrAQAwlbB+ypUDBIgC0wyqWnPutPxou38XA82D3sLP1B1aXzPTd/PpsaB3Q0YVXebBhl2IhkDW0qkbuxS0oDW/DkOGmsh9tcoTARFQ4o24m/wGFnv9JVMNww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKza1MuHv3aRvH9v1Z9Kw9/szZOTzVaKpJcygxBauCA=;
 b=rpGsib1klI/tNtoAN5FFmbla7tLzKLoGYxao3zho3pfKz0FeCUwSePiy4pd06+eQlrGXtVccgkQIRHud9XQfWOqpXfKwueqZC3cBY7B3riZ05OPEtog1WxtQGVZyikSDmQ2U9UQxce/QJvUAmwZ8hRo28DEyEVTgWxX+n1nHvF9pQElC61nQrq6vP05CTJArjPEK2hga1oEhyRx4V8khf5eJYof/e8MD7zqWcnpZnFt1JOTsF/ZnyFAlDutjPVBpGH8Qn3qKahO318jhkNfmKOnOcWbp7R9uCisYTdMcMoa1JDn//5jiQ7MmEWZ/Hdsd1lIV/MacLR78gxFLPB4F2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by IA1PR11MB6099.namprd11.prod.outlook.com (2603:10b6:208:3d5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 20 Jun
 2025 05:42:39 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 05:42:39 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 07/13] drm/dp: Change argument type for
 drm_edp_backlight_set_level
Thread-Topic: [PATCH 07/13] drm/dp: Change argument type for
 drm_edp_backlight_set_level
Thread-Index: AQHbrPQnX9Sbh6Vk5ky3Ayid+hRFyrQL8iXw
Date: Fri, 20 Jun 2025 05:42:39 +0000
Message-ID: <IA0PR11MB73076B453D58B2A3FEE1A9E5BA7CA@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
 <20250414041637.128039-8-suraj.kandpal@intel.com>
In-Reply-To: <20250414041637.128039-8-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|IA1PR11MB6099:EE_
x-ms-office365-filtering-correlation-id: ee61ba46-6522-4173-dd77-08ddafbd44a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?BtNR2gVr6kGb/38Cahaaz3Dpuin69yyS8CO9P/b6lt6GiUe6c7fmTqlymmVH?=
 =?us-ascii?Q?n+1yJjUPa4JJ9oq/Q0kkHrjLpVdUECVNFPRmyoaDB96IUNwmFtKlpNlhv5+x?=
 =?us-ascii?Q?2nhw9sM4nX0IVyLvqeD6np6L8viN5Rf+dXhieEhFUl5jDYCTCLqP+wKYvKHX?=
 =?us-ascii?Q?mq6ALD49n2d+mPPYAQhOpI1baYpLGpsC1OD/fZTyb4VCyI2JBBYjMnLTN+Xc?=
 =?us-ascii?Q?uItXcgyx0dl9ctAQvYoxUEGwUYmTAg+lyvzUpa+/+H0Mswb9BBtZbD3eTT7t?=
 =?us-ascii?Q?GzOC5T35QyD1AnRuB+XrVbnfpOj0S4Zi+bq6LBEjz5omU4+DXeDhnfUpqgAv?=
 =?us-ascii?Q?xCOcqkGNCiVOP0vomJLD3gInbmVo2vAodMFyeCNIB93MgR+He9wVXaaX1gjg?=
 =?us-ascii?Q?DN6CUVIkEOn53pns87k/rEJKQIH2d8LeI9sOBqlWT3kGYvGkcBw3mVjbo16W?=
 =?us-ascii?Q?bzCkHkmbPgOvwvwe8Bmz7hT7H04caEqqvN/fu5XvZmet38UTFncQp61wzSLv?=
 =?us-ascii?Q?mNhTWkvsJwzCnz6Z5QQUUVWrF33iqFJas3wkyygbStZ9Bf9n3BAMxOQNiK0S?=
 =?us-ascii?Q?8F8H8hM9xHR3naain1Z5jL5vezmzisMvNhtWVMnKf9yWykCijMoT9mK7T3sz?=
 =?us-ascii?Q?ayeYQXjsL16M8iIn7yTiubuQ2KIopQraLah4FV6KdnPNc4vj2ZkePib67Lrl?=
 =?us-ascii?Q?DmFFdxxM3exVrDDgfdHxymRcvBXbBkLvUpXSeHQQeDIj7LfauHNa/WwYm0RJ?=
 =?us-ascii?Q?ALE71/siPMxAjd/Jg6+xotzQL6zGteW6B9KAS5EjzLOS3JuxtWgJkD+g4C/K?=
 =?us-ascii?Q?fh2mII59niJvKS7QBsVc29VLT/sITia80R3sp4Oky4IIr66T50DWG/7LJMyb?=
 =?us-ascii?Q?r8/VJClRXQgIbOqW0/tyvEEEKr+Wa7WeisZDeRb3jsY5zi5wr+NYwGClCNoM?=
 =?us-ascii?Q?wCY6ywxIzf8AFvRH5TPx/S41Z+k9AgsGdVzz3DFW4xY2BX1KLaiYwlbcC6Ka?=
 =?us-ascii?Q?VPWDd5t8jlOElrCz1e1teAAJz/GwIl3y0ErB/wH8sVGgiODCnHDaICsWCz7B?=
 =?us-ascii?Q?hEt3AP2eg5+C6ITShHgLhRTqDJvGj7j8T6i2ZaR/Kt+C29JLRssKzfiyrSig?=
 =?us-ascii?Q?A0HyRo5N3ja7wFKRzR58Jnvvho+8ORdo/RaeU3S35Xt7+jt8FNaUTB2eAwHN?=
 =?us-ascii?Q?j8rA9NEseNPEiyNvasYYYYOGbyLQx4+WoE/kiP1xqlTBpseFUGyYzUxw2nDi?=
 =?us-ascii?Q?ABTj/kLRFDIN2uFksEN10W5xtgRAEPns1kJNwd5+6iDn1K7b4hVXGdRSl7/b?=
 =?us-ascii?Q?RyNbG5pcUWTRTpHqpxa834Tzfu/LG6SuBFUXjmGcWdBUYd2m1OamHmJzC/fz?=
 =?us-ascii?Q?E9H3fn6N87PqsQ7QfDGZ0ZoIs/2YIAcbUqjZTFjIbuV1EvA8Hs0eZ7sM/56e?=
 =?us-ascii?Q?yMrus1Wm3LFyErZq6YxYRfXTcvAIpJXkhWzqkUFNtw5mkdiJTci9Q6r0Gfyd?=
 =?us-ascii?Q?A4NHdr31it1HdEo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oP35q0qYa+rpqQ+wU1T6EUOCzMcpHc/XBBxZ/1noFjg8ibjnMA68QaP0L+JF?=
 =?us-ascii?Q?iOvlzQ5qNYGN26LFYMqanAYcgfRyjSW0AIGD6a4nZUsJ+6V8NTBNm3EaADxs?=
 =?us-ascii?Q?SDdNXqVAoEmtTuD1HEZKwlPUcsEjXpWmrM2ojAa9WWL6LnhQ5RVQkvIX9qPl?=
 =?us-ascii?Q?tgmBIbVYRjrjkFQnkM13RySYMUnd2zoRqK8Nm8cfbjxBL/VOx/5/kiX5+m8X?=
 =?us-ascii?Q?dO/urJUxHShgHOGwPM5XBGuuRYZ3ZZoLTu262N9T604HoGpHu1sioh6JluMt?=
 =?us-ascii?Q?X0X4P4b9nS8dZC/VIrh/BKGmO502rPiapB2gdZmqOsbyN4CupNQ0NvjWQ2xI?=
 =?us-ascii?Q?HFb31s74HkI9Z+7ZTs7AKDNLgjFB2Sp0xPX7R2yudG8XwWEdWw6dmO1dZLZ0?=
 =?us-ascii?Q?zyZInf6OIqr2EmufsgkOphHg1d2jx/el2aQf6LUYc237jFACTr2beywMpSzp?=
 =?us-ascii?Q?+KERKO3Mz5JAEy/GDbPLcqKFrTl+7IVIxAzp+X3jJr2O2xaTtQSDDQfUAZHb?=
 =?us-ascii?Q?tJnbLLQcFWccUuUpPNJ4otMvXckdvIfx+CeINy+g38Iw/lvwFiypbq4r2au0?=
 =?us-ascii?Q?JctXFdvLeGg5XPayoyZN5qQE6+wML8Vo2gcoE//Gttm6EFLp/IkCoCZYamVC?=
 =?us-ascii?Q?x/5GfMUab98nHHUy5n7Mof5gZH7q+p+jsqGVSDAFlO+p2yHGeCaEVbK85Fqs?=
 =?us-ascii?Q?v/g1YqD0B4exwXXMQJVD3NNGL5G08YJVmCZdv/iuQxvrf1dQ+SQRsCcqb0X4?=
 =?us-ascii?Q?dm5uQlMAyAIPu7wds/6Fo+mM3kYFnUvihjwUMoBIQreHSkaEP0tJsrKUM4Lp?=
 =?us-ascii?Q?47Yx6hYJ95zyrfFaFsuOkdcJzUf+gjJ3SFxFWRYOZj2eCjavWcEcNnNc6oim?=
 =?us-ascii?Q?O4/hJO1PbywxfLvB24WlLGmVKBNH1VnkBb8ZC5SqjvMs43OKTd63NhsNBVDe?=
 =?us-ascii?Q?KQfcqph0N0yNDxZTGaW6uSg5UgEjIDqwHbUySqgMnzaVOFJGSqim1brNOLXt?=
 =?us-ascii?Q?qWDXc6WHMLmbl35QtmCK5AWH+uOGJofrYfrGdw9rS9Lw5l5zBKgP65sf8SMM?=
 =?us-ascii?Q?YfUQNnTDX9K75C7BzzwtVj9EDgPYVf5RiZanOLy9DiAzZ5ZjVcta0fT4RI7V?=
 =?us-ascii?Q?Rzuiw+a7vkA8kqq71tLAu/gsGgnF/HrBmY2nKaF2i26ShwYIFCOKMiCR7x06?=
 =?us-ascii?Q?MOxKcSv3OazwZl/D7+JdKbcCHQ5rNubMT/0ctaD59aoHTZRKDU6mtBMl2T65?=
 =?us-ascii?Q?9nw4gTwU8GDpuinZUV21AuV5Z6lD7XWl9ty8hDb5I40uWobiIU7KQAtpPS0h?=
 =?us-ascii?Q?kM0SeeAnEMMGmfsVRjXq6bGl4JD7EzFIt/5TlDRSFzNR9q01rlPDVBRku78B?=
 =?us-ascii?Q?w5ytys2ekNntjkk3xE3a4XtkMude9u/m+iLE0Hz/VwIPx0/1sRPrTZtgZkOV?=
 =?us-ascii?Q?SXOUfxuFiDIHpQ4RZuAu9P+rUMte+RQXFR5yIzJutGioduESaJ7ky9uJue5u?=
 =?us-ascii?Q?ZjEWo0eLbn+Bt41a+RNa/o9NLfe9HAokd0uLql8XRdXBvkn0TaNLLziC7qCA?=
 =?us-ascii?Q?tMCPUIMasNUkS74POD4LcAJhDvPct87bRDoNM+pzqY/DzUCNCYBoOC16IOBL?=
 =?us-ascii?Q?9NaueCAqYE727qSnebzheDgCSlVKiu2cxN1pEVDtgef6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee61ba46-6522-4173-dd77-08ddafbd44a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 05:42:39.1786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OI469R4w0HDSzSQB1gGHkEFwvvdjsSpXWtT2vcFV7haDZ2+em6UNFIkE8DxD/XfEKNhAiPT1KIBaSsqWN9/zpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6099
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

> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Monday, April 14, 2025 9:47 AM
> To: nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org; intel=
-
> xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH 07/13] drm/dp: Change argument type for
> drm_edp_backlight_set_level
>=20
> Use u32 for level variable as one may need to pass value for
> DP_EDP_PANEL_TARGET_LUMINANCE_VALUE.
>=20
> --v2
> -Typecase is not needed [Jani]
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

>  drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
>  include/drm/display/drm_dp_helper.h     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> b/drivers/gpu/drm/display/drm_dp_helper.c
> index bb1242a1bf6b..c4c52fb37191 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -3933,7 +3933,7 @@
> EXPORT_SYMBOL(drm_dp_pcon_convert_rgb_to_ycbcr);
>   * Returns: %0 on success, negative error code on failure
>   */
>  int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct
> drm_edp_backlight_info *bl,
> -				u16 level)
> +				u32 level)
>  {
>  	int ret;
>  	u8 buf[2] =3D { 0 };
> diff --git a/include/drm/display/drm_dp_helper.h
> b/include/drm/display/drm_dp_helper.h
> index 62be80417ded..6bce0176efd3 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -853,7 +853,7 @@ drm_edp_backlight_init(struct drm_dp_aux *aux,
> struct drm_edp_backlight_info *bl
>  		       u16 driver_pwm_freq_hz, const u8
> edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
>  		       u32 *current_level, u8 *current_mode, bool
> need_luminance);  int drm_edp_backlight_set_level(struct drm_dp_aux *aux,
> const struct drm_edp_backlight_info *bl,
> -				u16 level);
> +				u32 level);
>  int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct
> drm_edp_backlight_info *bl,
>  			     u16 level);
>  int drm_edp_backlight_disable(struct drm_dp_aux *aux, const struct
> drm_edp_backlight_info *bl);
> --
> 2.34.1

