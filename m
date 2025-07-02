Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7253AF1164
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 12:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C2F10E6C0;
	Wed,  2 Jul 2025 10:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ugh3ETJf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D2510E31F;
 Wed,  2 Jul 2025 10:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751451257; x=1782987257;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+aux09fve9TTHiJ3uG5rH2R7UX3c4FOtLDgtyq495U4=;
 b=Ugh3ETJfjt6Ip5NV6sWzudUrNLxTDHW+ltE/CM71S/ol5PcosqCHjOOY
 7CwE0jsRxMIWYTBqdlEWXB9x5hbBwx6SA1Th7OxsjDqcFS6w7o0R2ucKm
 3aoysIUKR7ryXoQP+DBm17gpP1oo9riaUhlkAK1Kph6Nr0nZGwB6/D1C8
 GuStO0ndkCTbAk7FZZnLSfa5R5WWgfkVmomHBX0mJdOO4Ns5UavpnbuO1
 tmu0BmQIp5d9+JqHvmT1okhLxhDaR/k0rbvJhSS00fCUJJQhps+JGJB8I
 knNylIaXeO9dJYIb7xAwLjFjfckNjqCTZifzNgmplLJjLRw631cHPnU1d A==;
X-CSE-ConnectionGUID: OepOXnqMThy3PfH8DEt6fg==
X-CSE-MsgGUID: E/RG64h3SZKAF5Vi4k9VbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="65087821"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="65087821"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 03:14:16 -0700
X-CSE-ConnectionGUID: Diauo6DnRL6JutxTw2mvGQ==
X-CSE-MsgGUID: 3Xk24VkiSo6OeYfb8PrVPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="158412574"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 03:14:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 03:14:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 03:14:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.79) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 03:14:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSMmZX1Qq8DqTv+Tdp9N0a/8ayjl/vg8ZRlkFOU1TalmVWX7E3CvCR6cB1mqPjjJcRqlG5Nog4bhnE0DPb310nst9H1Ef/CujiF6zA9Nvu7l9ztkxG9lU+i5aYpApfPmxw/HZVZGslNH0tzazuIRy6wn9As3COSz7TjpygJYCljCV4CXB3w7K1nb6dnQTDyUiSh7j1z+ddNlo+s1Kg42AEXnU0d70l7aBGVCJTdzdi7Tl9PBn/wpFcPIKCclGLCg3E4Q8TKwFm3x6a0f1u68SGFMAwnN2ttF0w2WbdmqGb+1j5540bERceEUXD3Iq9oKQNfq3zvQhNLRH5/DqBjmkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8dE6qOQwxGbn/DJJlh8LFVTpK0p1E0vYs5cZ7RcYHY=;
 b=Y8aEWod9c2ZDqKp/fcragR+1yb3A9nP8dq4sBEi278rPKwbLdvsxBoNurKk9lc86+tyfjGX+rzX+td7/47Bo5+CEgRsP4ZjRcdxxQx3C/OWspA3IMBwNAB1jccDrg/xrx2lHcPYi1CfuRvr7W4tgu8j4MrKHMF0nGMS0aGb0wE6MGnXAiG/4HNuRY1WTYJN8kN8AXoKZ6nnSFXvVugz63Tv0cyhpz8gQFkGerIsmJmgnaunVmcfLjTmgMl0YwWLJCtruDrCQEjwA9Hy4U7Ev5gf6TAkSuwU2pxpiC3bidufFBx7zld19b0TOI/t8qO7exHxhZM8QOx726rErTplkKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM4PR11MB6357.namprd11.prod.outlook.com (2603:10b6:8:b5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 10:14:00 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8880.029; Wed, 2 Jul 2025
 10:14:00 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>
Subject: RE: [PATCH] drm/dp: Add documentation for luminance_set
Thread-Topic: [PATCH] drm/dp: Add documentation for luminance_set
Thread-Index: AQHb6mVbYTlVB2ViOE6NW7AhYuRzbrQenveQ
Date: Wed, 2 Jul 2025 10:14:00 +0000
Message-ID: <IA0PR11MB730767CB19AD87F933EED7BDBA40A@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250701085054.746408-1-suraj.kandpal@intel.com>
In-Reply-To: <20250701085054.746408-1-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DM4PR11MB6357:EE_
x-ms-office365-filtering-correlation-id: e2d38140-9eed-4927-f31d-08ddb95129e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?/onLqQK36bWQhMRIPn/KCg3e7Le90khlVJZAwEApbrbw7bZtJFEgWqtrwdWo?=
 =?us-ascii?Q?CM357qvNris9ZpZaJdqj6yCsfarcsmy9rL/w0rfJuR+WL310l+IlbstABCYF?=
 =?us-ascii?Q?I6E9GGVDPE9ouDs9aqjf/5gNa/yzeinYQuXN+UiJiC+m9Dnd/yseEnjtcYgy?=
 =?us-ascii?Q?tVNjaVebaG45j8bYfmfe17qHDcfg5zAhAbCNoMG4s5ni9skKe8NtcO5JH0sd?=
 =?us-ascii?Q?k9SzIvtwTZjUJxMF0Lw//n7mulQ8l57PZki72R/eWtsTwBFs3zLlSjZZp9hM?=
 =?us-ascii?Q?PGzpRirf/ZEiPXRQQwI0AX3tboHdNoI/axWJFKDWqB9HhnrqAFsNu8T2uxaP?=
 =?us-ascii?Q?gY/gbDA3ULa49EH2L6i4FEa3eCTw9NSa4Y10r4FwCbsowgtskPUdgiqXchY9?=
 =?us-ascii?Q?dYdAYrJy9JmniW3F6m+pAvkCX54PHy24WS/S/H6CzaWRT9rPFXgAI5SaJMA/?=
 =?us-ascii?Q?/qBMsFvFL+ObSsDyNk7T0sfypYzJ/g8LHEDQHXXY6uUk2gbms45ii7Jx7bbB?=
 =?us-ascii?Q?WDThOqS/eUIehe95X9UWXmRUfr4snOW5yHA9lz6fmIswIrbHmlmdoKzBc0SR?=
 =?us-ascii?Q?5Bq3LFbanMoPgZ2SujjNetUNGYGS3qa1UvwK2Zpg40caJOfm0X16blWuZbxr?=
 =?us-ascii?Q?oja0scbK0VM8TyC0bJR2BKRZgATcR1VprTsAXL/pOTsgI8uQOM3/vYurvOtY?=
 =?us-ascii?Q?TEIxcJNeU2Wex3U6YnXr6aiEm71hTrJ4hre+UqtN7mhcYYEveLoqmh/lTcD7?=
 =?us-ascii?Q?Bk675WeBX8UNb06voIkc5/AfK2M6ZOTN7rXojP7mL/2miKERu+PCXJZRvE+/?=
 =?us-ascii?Q?6FrwNHw+Di1YwCItDyP+6Vwn0ef1AIODQbEk5mGml9c7C0x2vQj1bNZxOsUu?=
 =?us-ascii?Q?bqOznrSCv+QFUViKClB+dPwj68wilMG86+r6AvZmP3Gda32ty30SBte18Q6j?=
 =?us-ascii?Q?77lZn+jsUkdGD3hWuGYtmi7199bd6St66Nx1nD+D+OHHFHqj7H9r886zs7H3?=
 =?us-ascii?Q?d0sZ3k7Va3rOEq7p28aRAZ8isGETE9Df59oNqTSxiaLCOnXwPrwJ+0S5m2AE?=
 =?us-ascii?Q?NqG9YwkhXSulcxK9J7TC9XvgU/wl6gcaABe5Z9CsroDCiXIePPEJMzwnAPa4?=
 =?us-ascii?Q?xX1cQfPNRwm5gZibPkXfORH4xTEkcewe7LkMy+CfzUI2U0ePjE8QTZyEvikB?=
 =?us-ascii?Q?oJS6wtp3A+0QRNTdtNCu1ZFE8OxovnlJBLPgRqZry4A3AzKLoYHQ/9PGsZ+A?=
 =?us-ascii?Q?A8LuPBdlkPU/OBVqVBnBJh0UkycVMOiybVIOOWoU6E8ksMx7J4PlBKaDsOnU?=
 =?us-ascii?Q?uOIBYtP3Y5jp9wRoK+LTfnvQs4FmF5M9KPALrMeSMrP9R7idfCLQdbX5wenf?=
 =?us-ascii?Q?pAa0thqr/mwSxKAEpmfwMuUPONQM76A+0MGqxEMGf4GzpPiwVQgUWf7MnVRe?=
 =?us-ascii?Q?Xtm9xHSxm91UaoJKJFKYLK3fH74CNcicPv3llE9TdZppPOo0hTqL/PenJKJF?=
 =?us-ascii?Q?xR1KvaOysrsERvM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Vr0Tqbi6wFQOMZgvBZjnkvxDD2yCbUQKK2Mjp4QDzWv39kZ3gz9B0orMQYmp?=
 =?us-ascii?Q?n7DDj+Y++c+rMmtwsiedL9kQpYcIM7Ha5dG3mhSsuwzlr/rEsWHNUOUcZCyM?=
 =?us-ascii?Q?HDbMvELdxLHNuIAwnIiKh7hyZi+glRl4W6vJ6y5TUEomgPuF3E3A2dIGU56E?=
 =?us-ascii?Q?G62C8oXInmrRxgGtRfC6cXOWvmGL/nnMSzVjw5fm43/29nBubq5/Gw5gkTPA?=
 =?us-ascii?Q?g3LQACq49IfWLUjrKr30B87X5FRvHSv0AUp5fJRB15DnFoz1pF3HUTrwAhpT?=
 =?us-ascii?Q?ik5MYJ6R06bd53S1fOCCIsBGhyrWqVng3LrmO7/TpwELCnEAkuHoldu18Jqz?=
 =?us-ascii?Q?rXT2sPpMJExEl0YOYY8F7FPP2ThDpbF47Ndpngl32mm1RBisZOOEdvNdPVyW?=
 =?us-ascii?Q?br2OBl5pacmF9ZF1OYURy46HRMeM983+KnooZUwUDL2vrT+5JnRXOCGaOH3r?=
 =?us-ascii?Q?pveLJq3KpdbliaFN0+0XgxsoosbpMZ6DXzpRLS22JXr40BKNetSKHphLL0RZ?=
 =?us-ascii?Q?cBGPxxGH/4Q9m4R+7Og97tmDeRjhMIOSHdYgUAJKe4Xnz7vynTxq5juZq09A?=
 =?us-ascii?Q?KsC1eVfej5Z+tWgDoF5M3Au32pnc4j9oiT5/5FljUtMoQKf+liyqYEWzFpr8?=
 =?us-ascii?Q?Ig1muGnaeXHF2bfMHF6X187tYDp3Y45VvZeaUGz5TCetbqg89zgK0lwhAzHZ?=
 =?us-ascii?Q?rt0k45q0xLMeo4CHPKchzhDxlfQpnH8cl7TA8QABsqtQbgg/2CDvUIzlntMy?=
 =?us-ascii?Q?bHlzRgNcS0LJSLFQDz/cD2GMvzH9u5gCKt7DSXCokL36pRDe6U7TjKy2RRUC?=
 =?us-ascii?Q?JimcLr0PE9RXnAu2SKBObeJ1/8BKBEck5rZRswzGDVsYH3joEufKbXvl8U12?=
 =?us-ascii?Q?XdxDhF7/QuRACKmT7zGF82Cz9/7XWi/QM3iLEEV7XDs1eaSVKagPJZwqHvz5?=
 =?us-ascii?Q?qscmSaY7NErzLlv6voDx7k00QbOcKnv0Ebl9tBugmk31WUIVeFPl47oiZHsS?=
 =?us-ascii?Q?8NjWZ+GO8pH4lIN3zIcNsveCvW0vs0p4voBl7Hvr4DEgidAr7xf9uDF+ltib?=
 =?us-ascii?Q?nnY5mfofh4p6XInSng5QSeaJ/OtOe+5ju76UoWiSIGrThPDMUJ4yVIRNcZyV?=
 =?us-ascii?Q?s6PviXEl9tDuqRyk3lf19F5ndxXC0uYsVRYNO0zNNrkE4hdrMNXSqCtI+kjM?=
 =?us-ascii?Q?WhKZS+Pnw8R9uaNovad71vYBo6TJiVIpFL1OyPLwOM2hZybQqpC0HVb5/5N7?=
 =?us-ascii?Q?6ZLkpaTOnd4SEsl/O6t95SJ1o91+jp8E6oLPXMPSWBzf1MJB/QOO/FxjEyd3?=
 =?us-ascii?Q?vj+C+p9uOTvU63hwrqrwxUcnFdOaruzsDyQ1veTC0x8Yq94i5e1tW9RK6X8s?=
 =?us-ascii?Q?Fe/ROr+xDkhwBBnKGCq0SNep8PWUz8rai0S5wF+AnMtL1KD441vP548ETdAX?=
 =?us-ascii?Q?gOrqKxhsymg41JhHu79pWyBOmT9iXZP3eYKjpfqWqGM8L8lg4LVDaDblxot2?=
 =?us-ascii?Q?brI+Wq5v5hVVazNpZl/rpRL7QbjCoAgL6JXhbTnJQFkfRcXV8cbuM0lDnA97?=
 =?us-ascii?Q?Wp/v/HflLCL0OyTnCdETfkCbqpJNKsnHfuiO7PON?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d38140-9eed-4927-f31d-08ddb95129e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 10:14:00.2467 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pvXJyNJDV/VD4CsFvmM1EViQe+8ZBpqVTVNcnLOFnAOqWELExWqSpVwN0FTqJ03nG8GwWMs3hZVo2CiYH337fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6357
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Su=
raj
> Kandpal
> Sent: Tuesday, July 1, 2025 2:21 PM
> To: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; inte=
l-
> gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; linux-next@vger.kerne=
l.org;
> sfr@canb.auug.org.au; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH] drm/dp: Add documentation for luminance_set
>=20
> Documentation for luminance_set for struct drm_edp_backlight_info was
> missed which causes warnings.
>=20
> Fixes: 2af612ad4290 ("drm/dp: Introduce new member in drm_backlight_info"=
)
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@gmail.com>

Thanks and Regards,
Arun R Murthy
-------------------
>  include/drm/display/drm_dp_helper.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/drm/display/drm_dp_helper.h
> b/include/drm/display/drm_dp_helper.h
> index 774c6d3e2001..87caa4f1fdb8 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -843,6 +843,7 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc,
> enum drm_dp_quirk quirk)
>   * @lsb_reg_used: Do we also write values to the
> DP_EDP_BACKLIGHT_BRIGHTNESS_LSB register?
>   * @aux_enable: Does the panel support the AUX enable cap?
>   * @aux_set: Does the panel support setting the brightness through AUX?
> + * @luminance_set: Does the panel support setting the brightness through
> AUX using luminance values?
>   *
>   * This structure contains various data about an eDP backlight, which ca=
n be
> populated by using
>   * drm_edp_backlight_init().
> --
> 2.34.1

