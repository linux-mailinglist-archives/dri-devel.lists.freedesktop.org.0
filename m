Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA98FAD6EB5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 13:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4118110E759;
	Thu, 12 Jun 2025 11:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MfRY+GaW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D3C10E0F0;
 Thu, 12 Jun 2025 11:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749726825; x=1781262825;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WMq3LbjrvFj4zs4gVOwYsmDKqZ21Ktu3Tp+j2mdhZW8=;
 b=MfRY+GaWGPjMYlXfNieEp8DfIxJKWONNcElS4EbSVyjJg2XBV9RIIeXD
 3L2uR2mJCpGlZjrlj17ASA0By9NIlUUKlP+fSw2//oBf/vyg/TKY3l42r
 Sk2KW0DYU1hixo8ZhO1fie14lXqyqk8jUj0YUp9CG1Wt+wTB/+UEeI7sA
 3kPNsHCtxGiLajup/m8Y5naJL4HFahuV0wiihub2LuEQ8iKKMM3nyBzcN
 KXy79HXdOHc4IqcrmzWoxmJHXk4AyoHPDrz8OFU9C8pIFCENkEoFkGVCX
 kIkFIxlB3R2JqKkY//FxMeuoNRbql455Vr5lzE76O1QwEL9tNwqwkg9Y5 A==;
X-CSE-ConnectionGUID: wctTK/puQeeiZGSUDkH/bQ==
X-CSE-MsgGUID: rWM1UsmfQ/am7PC6fHR1Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62177749"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="62177749"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:13:45 -0700
X-CSE-ConnectionGUID: iqjnaYInRf+cLGh8verz9g==
X-CSE-MsgGUID: xsjTYyp4T0eamTLBUbLPBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="147479643"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:13:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 04:13:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 04:13:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.54)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 04:13:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEOu4l5sRtzNbhzyJs7i/4Dsx4C1VY6aAex2jyNvF9V3wBPUveupDvRyixOQBSlrVsQm/idY5ANXpIPiWt0gc164RIQ14bI/GPHKyFnMhSdwt+TIbYAWqA8hF2lveiQwfPT48Bom6ndBkqHEpOd9HYWdswkLw58FKw2NEqwm6Ye4WaIA0HxwDshO+G+Whsmn8JVUERowTbuZgfwPSNeA8EplNLbeCAfF+twug/ELMKUEzirvehNPsGrTDCgNYqQ06eHef+/SJDn41MgWQqyTwudi+oKE0EED79s8INIl+cYr4y3+KGzCyxwIFZr1WWaMJTTbd1MtItIIJZ3hobNBvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuwDWHIpp5kvXRcMrSpEmJUsN1d3i9tPKcOerRn532Q=;
 b=pjcval21yWRiF+5RiVaAh33X77OLyoZmjPc64JAlgbik29PKXaLL6+Rv/bn5DTcoKg2nA8OAaa0KLUhyf4qtQP7YpohVICizm4FJthcUGZ5BZok8cBBHX2AUFjceVhpyMgGZ9Mk29K+66VG6/OXYbtfI4ni2/F2XAg3DLddNRcGlf2VjF5dV7deq14+Lr3t+F+ZJLRYeJViFf72mwKHUtav9WfSk/AZViuLE1BxsL9wyTvyDA9KEBUD78MJejSN5wYmgWaEYVuxmog81r2L2MHcuZit8sINe/1OXYHeMpclxe/cLzLZw3md5NXQs1JLedC5AGNsmoYE6nx5pwKqEOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS7PR11MB6062.namprd11.prod.outlook.com (2603:10b6:8:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 11:13:27 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 11:13:27 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 03/13] drm/dp: Add argument for luminance range info in
 drm_edp_backlight_init
Thread-Topic: [PATCH 03/13] drm/dp: Add argument for luminance range info in
 drm_edp_backlight_init
Thread-Index: AQHbrPQjxmDvPxxadkOJV/gto6LZRrP/W3kggABU6wCAAAreoA==
Date: Thu, 12 Jun 2025 11:13:27 +0000
Message-ID: <IA0PR11MB7307ED398EE421D9A54A686CBA74A@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
 <20250414041637.128039-4-suraj.kandpal@intel.com>
 <IA0PR11MB73072A82012F059738260626BA74A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <DM3PPF208195D8D82C92D58A8780E866EE6E374A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8D82C92D58A8780E866EE6E374A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DS7PR11MB6062:EE_
x-ms-office365-filtering-correlation-id: 303f4c41-0141-47af-29f4-08dda9a22801
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?sKLud2qUVNJNK01ZT+fHXxsoV8giP5gX2Ch5CwGEEcoi3zHBWMgQpqcbTsAR?=
 =?us-ascii?Q?fUOYQRQHVOvH9hYXgjSxAkbH5Io5oZhgHqsW+6P/RHGUyzpsl+wHXaPgl5os?=
 =?us-ascii?Q?hrZjl4nwcrjdoZVz9+AszraE3OUllKaNc9sY8333SPNcPGW3vGXQakNmEBiG?=
 =?us-ascii?Q?yj2suNBwHF69Jq7aSMVWjFhvMV3dIkBC/gfi6A/w9S+JWUsFAb9oVGhE3ldc?=
 =?us-ascii?Q?Eq35FfaTz4ZkqtuHywZO5nJIBMkmZqL9bEBUmjUpn1EBX854iPXdxRz1lX+P?=
 =?us-ascii?Q?10f2WkU6HRzYU9KgEjbAfnOwQt8oEQB2e0Xd8t6s7yf7fI6o+AxbVLrnDyvK?=
 =?us-ascii?Q?BN4clEfXlFA9W2AfmAwxHNLl9ykgN1Q+MlBcgV1fQykcBL8XCcyhdeXWaQk6?=
 =?us-ascii?Q?H3ehjIr84bLCxvW7vyZxszEX9Ng8/VK6MGQOgPn6drwKAs3KqbiZFiulRifK?=
 =?us-ascii?Q?1w3LRkyByfocjfjUOLJw9Vb4/87v2sdF9VyzQAt7QRRRgLvHI4LmvN+FHvpt?=
 =?us-ascii?Q?FZWxtjSBpBrmlxds1OAkpVZJNzl10lwxOOsNWWgV9DQ/JVBn39I1hLJWnk+8?=
 =?us-ascii?Q?oQVqK7eEvvM32AxtCAj1UTNkVb6xRgISGxInNklvZ75BcOY4k+M+/GHpq9OH?=
 =?us-ascii?Q?RbO+/L5pNwZQhKB/64SpsG4DHfLe6o5lAwaP9Wh40PCYJZ4qQ5g1K062Gpch?=
 =?us-ascii?Q?6qd8UV7VCwYZDGb8lxChzzEEuCA3KJoUTIgDXXKsLCx/aXGrTwZDC3kwsSBB?=
 =?us-ascii?Q?gJ3rNH7xqD+WMqdShLeuijnNJeDHiSemZjk1AvxPhw3zKvlx82vtGYyaqxfC?=
 =?us-ascii?Q?XdnMs/mp3kIZJKEzV1tqP6OvF4EGdgiJMpXZ50PEQF5YT/xmOHLdjWXFUE1+?=
 =?us-ascii?Q?19BBiAjnGLdMCccN8is6EtIDj34fKfdCdRgX89NXdXXJZWg1cTIAgKyC3BzG?=
 =?us-ascii?Q?bhaZ4oAZtnVoI4sVZLqbbho/2UJ5rh55fLbhIWi4C/F1tBY7mxVyX5ekLdli?=
 =?us-ascii?Q?WUxnFro0X+l36QNzdG3UePwaJYjv7KBItMKY0MXAUcCTNBtDgTw41geimhBy?=
 =?us-ascii?Q?kd1pm7oDWG7oFPEyubxJvJEHmnf10U59o+p6XUExalBJhJe+ym/zPl7YU8jV?=
 =?us-ascii?Q?NX0EOnA8FTYR30LiKC9dOi7ZAsAx26/iHDePy8hFK9OLOKrFQ/G8m+hi/pVZ?=
 =?us-ascii?Q?d2ds19sLg5wtPa80kLgVNkb3G9PQue6/vOP22F5TbxiSoehG146eULoccFfy?=
 =?us-ascii?Q?oNC0geASnpBoEMahFxC1IXsXPjT2dvnB07NgrTJusaDpYIA2LyWKVX6ZZDR7?=
 =?us-ascii?Q?PNUwh/MApkRdnSGaNAJz7MkN87y9tdL2OfX03opkqNHeb/CG9H1+f+3bWX7E?=
 =?us-ascii?Q?XZtk+vPX6tKmRwoSYw/oYuRnDu0WTchWmmAfRwWiIF/Wy1PgjFWHLwuLzG4D?=
 =?us-ascii?Q?cKWbjR3BHFVkIhmbZ+O+XZI3pNIpPyiIOcSuIBASAslZpaLeZ8A/6e+1knB3?=
 =?us-ascii?Q?qPdBNOUdNNHb6So=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UGo9mrbEIpsZ2F1TxJ4wNjAQpvEj09CSwSbRvP3f2RgI02gAoPMBKCR47gpz?=
 =?us-ascii?Q?yAQbKkK66v5xsYwVyhmc+xjPuTiyutXs4MGmBlCTEVVi20913EJB5SBUQDOP?=
 =?us-ascii?Q?MCFXNZiStLTXaR7BEwEGQjqQpDPqEveP3THQvOeXij9vA7iwxNOZjBuME5UT?=
 =?us-ascii?Q?U7EPxMqWOMQ4p/FNRQL4T2JYEeyGXLA2sItzCabboDkk1tXzXFwYtEw1fCvl?=
 =?us-ascii?Q?y7r3Jf8NW71VTgMIxL2xtAbrntplw1/qpiGsBapnGpalLqr7biq8xLq2JI76?=
 =?us-ascii?Q?h6Nsccf7fetzOAWRu+JtK712vIsN/QqT4DxUutc7cuTIUMrlKVKSSlMezCO8?=
 =?us-ascii?Q?rA4rFLzzyAuQ6ObsT1IkkBWYlZyUJTQsu7bZNhuzcuJHkiNhkFl0Mr2JOa7s?=
 =?us-ascii?Q?LMklE6ncZTjay41yu1XOc1yCXY7xMfHx717NIdR2On99bnS2OungxopcI8xo?=
 =?us-ascii?Q?6ODtiLBwtC3wgoKH46O3HnW0IJF6zpzc14vBgBRXBkQECVLrr3IA4cMl8dUD?=
 =?us-ascii?Q?Po+bVxuRQDXn0xyNwbwyNotsl0vJA//uvvFECQ76m/bwSkbwWaGex1rPvspc?=
 =?us-ascii?Q?jDWBpLOiB0i2C1vz0Neyk8ghDD0nBpWo3RMBUfu621QNTZ1EzHMUOHOplPkL?=
 =?us-ascii?Q?7I3KZvMwsO+24IKSpSjej5PkeD3O3uhg+zF9jj54/6knq2QLl/SMbG/dCGqR?=
 =?us-ascii?Q?6YAxHhD+uFNTUQdnAVVeXcpF4H9XH5l/rfIpBC7CTVnZPneOhj4ELfNn99VU?=
 =?us-ascii?Q?MtCGdN4S6yRWRNkdGy+iJ8ZcosBf7DrhAz74fE5WHvzMuGxyRqWUGrIaVf3V?=
 =?us-ascii?Q?CEhdJ9R1FldamyFfH6JLVK5/nZw3ZJYPVAHAkOcvOKZEW3C5cNL2kSd4Czf5?=
 =?us-ascii?Q?fURAmefimrCtUycJ9mXCLMv4FSbXLed0BEnOq0r3riqtFB4hNuLRw5LY5pU1?=
 =?us-ascii?Q?s/aCUEgHizQmGENNa0KXHDeCOCjCrYSZrGFurEOAH+yXi3fjxg0fh8aeFH1M?=
 =?us-ascii?Q?AnCNjPJ0a6uMzNFu4avzkEmRiHbN7GYJAmeF8AI5okw7siL4IikkUvuSjE06?=
 =?us-ascii?Q?zcsLY53ZZ2A4GYeq9IOk+HrNVcnHvHj8657XE7zYEbNOanKRDcDuKH//YBZL?=
 =?us-ascii?Q?I2zGrS7hCefdU3XpaQMIpeXfhJgN0CefdBcMbsHg8iutY6zH2gd0YiLB1pkI?=
 =?us-ascii?Q?tkpS4z37V1pmONu9xHKMmcJ6edkDJhYDHEzI87rVGVx7lQUBfOG/KrEKduof?=
 =?us-ascii?Q?LzkmiFP+A6xOdvOOWU3O8Xm60sHQafgjt7b6m9vLttXB04uXOndJEsv/Lh8L?=
 =?us-ascii?Q?S+nKG4Gz3j7guSB2Dwu1LzTW3mYB1syPpUXvwptGTuXLU/2nAX2p7VyEvHLz?=
 =?us-ascii?Q?JCaK27cUFUabliOyIsnOX0gvoboyVd3WzzK0ecTX2BXskQK4vSH9UmkB74w1?=
 =?us-ascii?Q?IqeUOPga8LADGPn2f4IktPezw70SCxp6OI/bTEcHJJHaz05zeYjbPqjiRNHU?=
 =?us-ascii?Q?dcy53G+SaJkSK3635ZJt3CkOMhGef+dTOyB5MD/WV2scJgN07Z9WWjyfuVWo?=
 =?us-ascii?Q?jdYRiXWxZvk2b2eY+lLzWOU07HDF6f67q9qf6Lzu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 303f4c41-0141-47af-29f4-08dda9a22801
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 11:13:27.7326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SaMGan48iX5vrIjW/Lfu+TVJ2ndhvQuRZJrNRBywu7frJgmE+xup78DkM4X5RYzXxFhi9Rg/IB2RrRFv2J0h8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6062
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

> > > -----Original Message-----
> > > From: Kandpal, Suraj <suraj.kandpal@intel.com>
> > > Sent: Monday, April 14, 2025 9:46 AM
> > > To: nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> > > intel- xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > > Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> > > <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> > > Subject: [PATCH 03/13] drm/dp: Add argument for luminance range info
> > > in drm_edp_backlight_init
> > >
> > > Add new argument to drm_edp_backlight_init which gives the
> > > drm_luminance_range_info struct which will be needed to set the min
> > > and max values for backlight.
> > >
> > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > ---
> > >  drivers/gpu/drm/display/drm_dp_helper.c               | 5 ++++-
> > >  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 5 +++--
> > >  drivers/gpu/drm/nouveau/nouveau_backlight.c           | 5 ++++-
> > >  include/drm/display/drm_dp_helper.h                   | 1 +
> > >  4 files changed, 12 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> > > b/drivers/gpu/drm/display/drm_dp_helper.c
> > > index 99b27e5e3365..3b309ac5190b 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > > @@ -4227,6 +4227,8 @@ drm_edp_backlight_probe_state(struct
> > drm_dp_aux
> > > *aux, struct drm_edp_backlight_i
> > >   * interface.
> > >   * @aux: The DP aux device to use for probing
> > >   * @bl: The &drm_edp_backlight_info struct to fill out with
> > > information on the backlight
> > > + * @lr: The &drm_luminance_range_info struct which is used to get
> > > + the min max when using *luminance override
> > >   * @driver_pwm_freq_hz: Optional PWM frequency from the driver in hz
> > >   * @edp_dpcd: A cached copy of the eDP DPCD
> > >   * @current_level: Where to store the probed brightness level, if
> > > any @@ -
> > > 4243,6 +4245,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux
> > > *aux, struct drm_edp_backlight_i
> > >   */
> > >  int
> > >  drm_edp_backlight_init(struct drm_dp_aux *aux, struct
> > > drm_edp_backlight_info *bl,
> > > +		       struct drm_luminance_range_info *lr,
> > Would it be better to have this drm_luminance_range_info inside the
> > drm_edp_backlight_info?
>=20
> The thing is we fill drm_edp_backlight_info struct in drm_edp_backlight_i=
nit
> Which means we would have to pass it anyways. So having a reference of th=
is in
> drm_edp_backlight_info didn't make sense.
>=20
The main intention for this ask is two xx_info struct passed as argument.
Moreover luminance is part of backlight and this new element is _info and t=
here already exists backlight_info. So wondering is luminance can be put in=
side backlight_info. The caller of this function can fill the luminance par=
t and then make a call.

Thanks and Regards,
Arun R Murthy
--------------------
