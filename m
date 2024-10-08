Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA1B9958CD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 22:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86DE910E5BA;
	Tue,  8 Oct 2024 20:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZWMJeUy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2227C10E5BA;
 Tue,  8 Oct 2024 20:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728420880; x=1759956880;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tINMsimPSxeBA2R09TMsR6FpkKY8E+9t2EVBOBfMBRg=;
 b=RZWMJeUyTFTKt0W2QsxRNJ9LHdwa3cIs+s4iYqfov4XytD2zwJnF1F57
 Fy7EdJapIuurlJ6qqPSIXpwjiZBY9EYu5At9LiGwH7cGBQ8tkX8PvpWnt
 zgaPmpBwp3w/X8FB/Pa6pmPkj5euau/4p1/pV512Ih4FRX/MAwrbhpJbX
 ZEPssyyBnAMgEy2eMhS5kcJGe/LdXzqz+NvdTr45qh3vsXvaZuSl7UoyN
 Rcx8xbud85JyDdCiwoRxZFumStixGE9AGJsueM90a+5GG24/6bU9hD1U7
 Q1fzpGVzc1+2/MxemO0bGLynati5zQQYRwxqd5Xd10+ouNFZGkx+TtY/e A==;
X-CSE-ConnectionGUID: yZt+Dbo6TeCqkQKRF9EcMQ==
X-CSE-MsgGUID: byF0qcndRxy8TVDObvozXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27552870"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="27552870"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 13:54:40 -0700
X-CSE-ConnectionGUID: gHPNvD0ZSKCEEY//K+opPw==
X-CSE-MsgGUID: tu2vHzb3Tp+aMg2JGnyytw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="75566050"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 13:54:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 13:54:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 13:54:38 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 13:54:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 13:54:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JW7Lgnip5CKYbZOLosSoiCj4M0VxzLULO9QTRdjcwnOxMbKAjoVF9sYPFIumiSK/PImPkvFRRw8ylr7/63+lL0T0uWlqq6fEPX0mIqoQ6hzD0VHxG9Ssl//jHZDhDhcxxOYwRxC+GjBdkrpre83fc792EWPu/Vk/P/jNfrea+BNmU+nUhVGd5zgeS+FRqFxK9LEbvGGFszix2PX598XB1t2Ojtl8sPEY6QEsgqXUDRU6tleVRN1NbYjfn1V2GxJnWkB7FaiKfAT0Pt9ZfunbB7TSsK0IIvCqqOvIu265cB4sIAkxch2bSJarmJKxaotfMjKcKdncskGgnrYwhy3KrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmDMfeerQN3fDMJWXbkLyFGugqEc0PjILywj+t/2aqw=;
 b=lGhfCaCKiuxQ4ssnB9xyYCEo1tZlA3T7wGEKbG51WtZCV4lK4j9nTaDMYjCJ29+CEpUWLvqdxF4tB3zgxiXq0ScPaYUddtRGMh5ZFiDEKI0gEipYno/Zoxz6Et2CdNmjFauxKKkoZsxq3paEaFol720Yp8pG8u3u8sIreT6SHFdUOFO/6NtS3OmniIKI45CTd12KrFhdi25EteN/hZdpbQY6F0PikWBmI41IZVSRmUsSxBiGEV+t81Gxt5dNDGZcVlgGmV1ZUuqqzEbsdtoZGRjgogZ2niNnzdWbWp+YCXAOx8qzHDcODWdel9LTvJZXLYLTfnMhhuo+aXAudmTS8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB7278.namprd11.prod.outlook.com (2603:10b6:8:10a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Tue, 8 Oct
 2024 20:54:31 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 20:54:31 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>,
 "javierm@redhat.com" <javierm@redhat.com>, "jfalempe@redhat.com"
 <jfalempe@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 02/12] drm/xe: Select DRM_CLIENT_SELECTION
Thread-Topic: [PATCH v3 02/12] drm/xe: Select DRM_CLIENT_SELECTION
Thread-Index: AQHbGXqk02oy0KZccEqQWQCGFp1nS7J9R0kQ
Date: Tue, 8 Oct 2024 20:54:31 +0000
Message-ID: <CH0PR11MB54441D331F841CF1973440F5E57E2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241008120652.159190-1-tzimmermann@suse.de>
 <20241008120652.159190-3-tzimmermann@suse.de>
In-Reply-To: <20241008120652.159190-3-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB7278:EE_
x-ms-office365-filtering-correlation-id: ecbaa831-0f74-46e4-75f4-08dce7db685b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?BbjPG1ygz7Vx/8j5pdI4W76dyBuvGA7xjuqnkL59ZzQfHg7oEwtEc4bBxG?=
 =?iso-8859-1?Q?yhGIVvCboQD7+sIpPMimQSPHGZYLNsz3V2cfwwWhJNrFcRsVtep3JoPx8H?=
 =?iso-8859-1?Q?irfWYdw5Vlvx4ItDBNY7RxDAzE2IZOUJl+U9IP+sEwgyd8jnMsxDAhMzW2?=
 =?iso-8859-1?Q?/L2k0Qa3N+oNjByAAkITReF/YD1sfpvEiEZQaLHzV6Om2B42rNcof6e27L?=
 =?iso-8859-1?Q?0er5zaVbbRorUN0+CbbE48sybfZdV+2be3lWHmmBfBFXirHLkZFELOzTlQ?=
 =?iso-8859-1?Q?M+kxntHS89k0/fXSeYtJ+r/PuJOZWqWgvIdI+Zrn+z2VyWKhE1po+o1C+g?=
 =?iso-8859-1?Q?4v9eS7Y98eDwHX/MTeFgCHTJ8VxDGK3TNHctJnGQ1fOKZeikzmAyaNPGK8?=
 =?iso-8859-1?Q?cZDkuNigSJRiRnI2SdFELnjYQvTNGMW/ERenTdNwkb3fS82SXIKD+3C2zt?=
 =?iso-8859-1?Q?Q8ttQW0JJd+Nyxt8JeDpdfDFbioikm3C9gR4uHsd2y1QnSR7bdA5VXWwzh?=
 =?iso-8859-1?Q?Ak8/bkJGrubvPj9w04R/iEE/JQOgo+tu1ynUcev15mxidmB6l6qclTT0Jn?=
 =?iso-8859-1?Q?ta9QSm76FscC+hCQc4288uPshTGNHLIFt40O6pdszyTIqF5w2khOsYe9vQ?=
 =?iso-8859-1?Q?6eRjX3M1otL6ePKeTPPi9Oy1ypEyOfurafRlh3naQn3eE82A9j07lqbX/6?=
 =?iso-8859-1?Q?5ZnCRnGZYDVHMSAh9lgVaLCFi96vvjk2FTz2P/jrqplTkpY2IyGgpz50qy?=
 =?iso-8859-1?Q?2vH+8juFfcThxrjxd/h24GO3DDJAv0L4bQps7kWMTpqwBzlAExeb8b37c1?=
 =?iso-8859-1?Q?fHkFLN1DdZnzer4dgBYiFCqXYNUuHZilhqPKbWS8peMM57A1j6ytw1+/Uz?=
 =?iso-8859-1?Q?pkeakYZD2EVWRHpr8+2oruGUlspzYquGlerSI8/e7OAPDS3D/n3IaGwcba?=
 =?iso-8859-1?Q?vS6tjQwHD83GE+F0B7dKWNSNDIpVv2smrFKatKaswkK9YokPuu66jLA8e7?=
 =?iso-8859-1?Q?xtQ8kZrTLLGSIDzMbMTFZR5ZpfuMoIcuR2G0LcF50fMMeirTvPK3Ht56iS?=
 =?iso-8859-1?Q?TtWJ+lkhh8OBWP+zNnZSzGxYs8a36pouX8wpkEsIR2z+piR0k2nRrzHMPS?=
 =?iso-8859-1?Q?iyH3uhLUbaUsnh/6o+hZeNgMEMHlWEb2zTAGyn4/WtEjdStcL/zatKhr3Y?=
 =?iso-8859-1?Q?a1wGxPG50EhrV03o66RKhyQrEBAxcthM0CZgvLq+4t3IsdD6evHphkvoh0?=
 =?iso-8859-1?Q?NcJsIoKAwmqmImVarNptw9Ec5N1CsFUi4ovTInnH7sn+N61M604Klsccft?=
 =?iso-8859-1?Q?ltVze7Ka0KsmVIPyAzinlkvzeWXLrLuXbLfYsUYGS1jM1yrqru09N86lul?=
 =?iso-8859-1?Q?b4TQknee/8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?G3Lv6h61edlGqq5lnOibXqSLTLibEy/nXUyXmzu7omUXQXWVxxgRrRKM4P?=
 =?iso-8859-1?Q?K/c25t4BH4V5VWAd1C7UFx1pO89MrfNVpecxmp0/pDgAxSUFeREe/2h0IB?=
 =?iso-8859-1?Q?xbz+TqvxshOOT4fhlGaNmWvD1w9mepcxmO61ehHSB9ZYQIUX9HxRPzjUJc?=
 =?iso-8859-1?Q?06s5B1L1WjcnurEXUOEca6zbFljiwC57jJoMO+gyJe2nUMIeIDUOSUplrN?=
 =?iso-8859-1?Q?FRjwlnFcRxZ6Pttsu3FdYalimarkd9rKz/6U5BXV5wecIWcwhqLeEgnnmf?=
 =?iso-8859-1?Q?paADXR47qFLI0mBPBmhhdkyPJr0yXLOaLv/HmxM1YGmDGhALZuI1sDlEvy?=
 =?iso-8859-1?Q?ObOdK946q5HoqeBez0w7BLg9l6sZSR3SwLWTpwb4d1ZjeAgL09HQiDioo6?=
 =?iso-8859-1?Q?LVrj0UVBxx+k2m4AKe7iSgRA0YB5AQiRIzvbmo425svszjEF6yPljyip3K?=
 =?iso-8859-1?Q?CJ3kUnOwdXEO3hucp06VLYiBilWOVaMMsUUxwWTig7IJP4cnw1gL9g5YUY?=
 =?iso-8859-1?Q?mCK5KLHsKqeg24uxY4rRjJgg5g/mmTEil5PVU/dwHOU0P1jiJB/QuVtKZj?=
 =?iso-8859-1?Q?gLFTTXvmTA8K85LVIoGRq4bmeXPuuGORtDiJ9tPYwG1tw5tL3MFybTY5hr?=
 =?iso-8859-1?Q?bujZdpEk+onHrpSVUf9B73GB3sNJLoX1KmNTHG/MqnXjwZNMzGoVjUUEXJ?=
 =?iso-8859-1?Q?nnqKwjovBBzqpHpiP86Qq1hm9ekWN0A1DKT1v4KPB7GYIOWTKX7Ori3lPK?=
 =?iso-8859-1?Q?YAqepLkFygPHgEQQcngj/L4GTl14OkBZtjFx6mBmZjGr/Vd5s0QnMF8+MT?=
 =?iso-8859-1?Q?Q6nsiQQuureQP/MIgfdkvW2Mp0p5hKekb/ZWTrNTQdfD9lrqSPUVsHr/Z3?=
 =?iso-8859-1?Q?bMV7D16Ye6ZqkN2ONKVwnQYpU3refkon+FpHbCH2HFEaDR9JwyTmdlS3gJ?=
 =?iso-8859-1?Q?j0FvWUvsfqioJcmnZCKTZyl3pl48tdOqkogqqzx7RnJ4GwACn6+W2hrKJU?=
 =?iso-8859-1?Q?9WwmoSGIMA1IkXcT+Ee7/3kphXrTWzueGBBZdLdrmh9EISGAp9sBi6tlBq?=
 =?iso-8859-1?Q?n0ACY6EVPVZZdgLMFjtIiIsLsKwv28Y9U0CEQthUa6G+MgP71SzOJYVc9O?=
 =?iso-8859-1?Q?VLIVIMvGD+XpfuSovRP7uA0ivAdVFGu+x9qsh5B5xi++o/eJCFKtdsnZG6?=
 =?iso-8859-1?Q?ExJsYGhCKN+wUQ7p259l1358y5vdED1jU25TeVAKbUk2E+0e8a3V+ZfpN+?=
 =?iso-8859-1?Q?XdQ/FYI96l4psoFWH+fuhylhYKstl/SYpLuAv56JOTKTzKWs1AC2UZLolf?=
 =?iso-8859-1?Q?OZ/m2EzI2LpZPJPNf/ko9Or6JCQq9QPaeUiLQVFi39NC2GkzG53UyBP503?=
 =?iso-8859-1?Q?xdqGIOMpZACPO9LY0koxo4yjnVezFP+jniFaDtcZyVpQf136PLs/vOuH7f?=
 =?iso-8859-1?Q?GMxmG0lLOS+iWpRsPOfYfnDjtWHyYg9RJYDdAUY3vw0NLd9DiP6xoG8EGY?=
 =?iso-8859-1?Q?aW9NFVNXWXMMhFpxMgWGxAV+DSPEn56X52Iz1dyWBZWMfW3P4QWjCrM+R1?=
 =?iso-8859-1?Q?+4nSzPIiThWXrkFmZ75kChecTrdbPNjUFl2qYi9OIaXuxJyf910bC86169?=
 =?iso-8859-1?Q?Db6A9SXluNClKU2+7TlCQAF6J6I/64sPAWA5hy2AydhgvO3PCW9P2N3Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecbaa831-0f74-46e4-75f4-08dce7db685b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 20:54:31.4406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kqsYtDAyVEXxh2tJ5oLGzopYELRRp63+7m836A98XRHptEC3Ff5YFwUH0/A/m/C5VSPgpZE2hmdDP9CZOz1RWPr/fx8tYCrn7+UBO0PGaVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7278
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Thomas=
 Zimmermann
Sent: Tuesday, October 8, 2024 4:59 AM
To: simona@ffwll.ch; airlied@gmail.com; javierm@redhat.com; jfalempe@redhat=
.com
Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; intel-g=
fx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Thomas Zimmermann=
 <tzimmermann@suse.de>; De Marchi, Lucas <lucas.demarchi@intel.com>; Thomas=
 Hellstr=F6m <thomas.hellstrom@linux.intel.com>; Vivi, Rodrigo <rodrigo.viv=
i@intel.com>
Subject: [PATCH v3 02/12] drm/xe: Select DRM_CLIENT_SELECTION
>=20
> The Kconfig token DRM_CLIENT_SELECTION will make DRM clients
> available to drivers. Select it from xe.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellstr=F6m" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

LGTM.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index ebd0879e04d4..bac96c0dd66e 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -8,6 +8,7 @@ config DRM_XE
>  	select SHMEM
>  	select TMPFS
>  	select DRM_BUDDY
> +	select DRM_CLIENT_SELECTION
>  	select DRM_EXEC
>  	select DRM_KMS_HELPER
>  	select DRM_KUNIT_TEST_HELPERS if DRM_XE_KUNIT_TEST !=3D n
> --=20
> 2.46.0
>=20
>=20
