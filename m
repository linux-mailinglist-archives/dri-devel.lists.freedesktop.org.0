Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7556CC13873
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 09:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BC410E5AE;
	Tue, 28 Oct 2025 08:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cZWqEFWO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1D010E5AE;
 Tue, 28 Oct 2025 08:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761639929; x=1793175929;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o5XNQHQv/EvBvFKeME+FuomjALYxRYLlP8jkxrMfzwU=;
 b=cZWqEFWO//x/lyc4uiTR0gXD6YCcJGhQBXkaD6vg7SUHFHWA1S2w/+to
 i0jdaG2d4mamDGP/Cd0BeecPGz/9fHmRqrhDOZQqPZEtRFExFGdgEeJCs
 mfkQ1WbJ97lbTyiHyyeuAKaOZvZ36i+zKNtMquz1eken2HQz95k/HA5u/
 WUjnRPAJft4H2XYX1meoPUYwljB9MT+E7V6+Uhwvh4CoP2h10C3wsxQYX
 XLciB7L8SOt5ewb3q9En9chbMCKmA4grKJXFXH9EcJ7+p+Lr4oDqLFf9P
 Z+xi3nzy6BjpC+2Kq5isSAb7MoHMaXnL6q+pIfAe6GAmp5q3v0jbqfPER g==;
X-CSE-ConnectionGUID: S+qDDWXlQnywPRFC7qlaug==
X-CSE-MsgGUID: 5bAZ6eZgTCKmcP9zrBqKBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86359541"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="86359541"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:25:29 -0700
X-CSE-ConnectionGUID: zJyc7o38TZqGgQlwYkTorg==
X-CSE-MsgGUID: 5qH//DXQT82+tJNRPva/ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="185196663"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:25:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 01:25:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 01:25:27 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 01:25:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKyG2M9EUvC8qeNnjX4mpIGqvpaAQzJnufFrfBrEZzL9trdOjgf4EermaiNy2Xa/VxgTtCoDdSczaxcDYNhY3/+hJ4HdeiDAnOMKjVbj9bieuEVJkV1cNG4AlZb+PGQYHxQ0DyBKxd/7FQl6/Dt+vL+5xZ8zqsRZcfheF3HQGQJDhV6J3Rmaxkfm4efchVc0GTIg1CvfIOXxKTErfnU/IclYsyIo1lr2djPUKfjBLgPS44MMs7HcFfyg1r/iecXnlQwX6iRAvSfo0Ys5eQ4HbKuCzEoJej6oI2iwe1dw1fe/Ex/7NHUnpAGqHyLDy1H7aDUGQ5R47HhSrggWmtJ1bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cfTCkQZiC6AyQxBFeEMXadTxlACTFiahuKFy7JVt6U=;
 b=wcBnwaBynDNnrLOiewT1/paYcOu5ubk8KkQ24vVfCQs06QhefCk2MgLTIgRTZHXNyfkzAhlSYNvEdUL0SBMSkzH9rPnUVIXDpKKf2QUXKNgenBADm9cAYYZnCN2QbwTqFiqX68pWZ5TpAQ+EkguOuZ+O1VBUiCTPwbmoleribEDdj0Y7dYLbSKujVR0CFArqee+DV569r9ftKEDCtjKtmQL2O1owEJdyeLVJAE5Xa8zgG4gLcyTDBZjJ86hcJ+JUMymyTrzj9jW7gM6f7hJS7AM4huBeMCyt8D0S7SHF/LrXOls4OFHhVeVmYIZ7y/MUEFL8HGaBmZlPercFOx0TbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CH2PR11MB8836.namprd11.prod.outlook.com
 (2603:10b6:610:283::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 08:25:19 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 08:25:19 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
Subject: RE: [v5 20/24] drm/i915/color: Program Pre-CSC registers
Thread-Topic: [v5 20/24] drm/i915/color: Program Pre-CSC registers
Thread-Index: AQHb6zD8o61TKcRKFUu2glE+bfRawbTX8efg
Date: Tue, 28 Oct 2025 08:25:19 +0000
Message-ID: <DM3PPF208195D8D1C297E1726689AB7000AE3FDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-21-uma.shankar@intel.com>
In-Reply-To: <20250702091936.3004854-21-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CH2PR11MB8836:EE_
x-ms-office365-filtering-correlation-id: a8120d4f-b516-43f4-50ff-08de15fb8822
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?gAwadWmuCBDGopj8gVsBcQ9EKt9V0IqmrXXHlikCNDLd9jLfUCAN0ou1KzfD?=
 =?us-ascii?Q?pq+9qXnfr0vBs9O175joyBgyFa9CqNhaFxnDAIEGs6+x4OI3n/w0IQR78uST?=
 =?us-ascii?Q?u9xYBh3n0QUjYr8xMrCFE3N2TwPQz/fkAJRrRsIfIBF5RGIWIjdGZpFANLSE?=
 =?us-ascii?Q?HPZ1wiHrvjm/Iulwxs5PjN1fpCYlhZF0GgaFat/DKxbxQf5Xouq1kdbvMH6x?=
 =?us-ascii?Q?7eluWf15TJbNa3lWaa/Uyf8xJfSit7I6bc3pxg0zhAx/ujHoYK99qxlyzW7q?=
 =?us-ascii?Q?SejrjGp8o3Ghq+lTu07qf/BfRtobl1JtpyNlqq3YEbaLiy7vZIFxZBkXBCL6?=
 =?us-ascii?Q?OaElxOuQMRDxCnZe1Q652t8dZoDrkc69RchSjTFqYFzOHXKTxyBGanzSpZu2?=
 =?us-ascii?Q?75Hk/eJvI9Oj32DYMDzXNBulFgUW/a/JCoocf6sktPRwHtPR4ZotBHa+8BIW?=
 =?us-ascii?Q?HSPAdfcRUSwjdeTuSYRad2pcJAYWmrY+tj98gE5Uj//o3weYbPiTEMGMFGyi?=
 =?us-ascii?Q?pqoig6/Ed86wO+fD3xD8vICP5ZntvsWAGIKpAu//adMQbMO0iMUPLjSiogDj?=
 =?us-ascii?Q?5t17/E5wzwknUWV0bBVZtyIBJuMjZuVp+KSX7m0iPKN7QOgdVsalMvWpjG/7?=
 =?us-ascii?Q?rJA6QrchVPVuGaAhhtvOv3gsY5f5d2oMX7AMmWmidi4mqBOkExf8k+QUTI09?=
 =?us-ascii?Q?60PA0zoZ+ep/ve4iidtIHRBS45jJtp+vYnY2B9MAoNo7EloyxpbzFmfOEYII?=
 =?us-ascii?Q?cxJ1kQdeiNj2n/4hexHYJ9icGYmTHdU6KDOA6tSqzYNKFODWC989SaEZeavQ?=
 =?us-ascii?Q?j1kKbAsNbfIAGgHqraUfddysd8wr0AZueDkoD1evmg0wzWAL6vFz+x9Z80fe?=
 =?us-ascii?Q?AUKJf44bnygrCz1QMX1oRUm417z7oC5DvX2VBiG/ApjliMsZ5eCaE8UoZ5iE?=
 =?us-ascii?Q?qZder08UuEo77b74gPWvt1flHw9mE4teugiZYSbB6U8MoY8M2sQgBWlz1bBY?=
 =?us-ascii?Q?FzMNIVk1KnPLjPGG8Mv3e0hNR15VY0Li9+ZhjyAZVrR9rtHcTc6vE41/RYtM?=
 =?us-ascii?Q?P7oe7b3e+jo7sQAihAspqgZH3AHIBdlNPp3VW93frCUms8X/L+LKHfvMErfj?=
 =?us-ascii?Q?LVfPf6zl8kcM+8iOFDfp992UaHi+tvPYjosc5P4fdsBz0RtfoIAJsnO4i+1o?=
 =?us-ascii?Q?Z5DV1FCJbedPYstOBpoMdgDjzpgdB1bo752ro3PCvi2SZz/39ko58rXDRGKu?=
 =?us-ascii?Q?0SkR5pw6jOs9MhxZslFSeU7mPZGkNpJVPj9XOEqp3fIpkUwlJ+EnQCs04mhH?=
 =?us-ascii?Q?7G8yTw6liSkS+y7E9e3ODVKooYx0LqNnY/sU16KsBDoUHRWDBse5VWeW6BbO?=
 =?us-ascii?Q?Ceh3/Hx74fc9fMVl8mk3BK6Px1EUgeLA7J71i9mk1ckO8rzqoojUw6xckPG1?=
 =?us-ascii?Q?IlddXzVB1nmszFcFSh9x2XYxIeQtt21z19fntJ02hAKGcyPWAPAWgguGsLzV?=
 =?us-ascii?Q?fE9vyYo10FlQH+E3u6loYA7cZUphvIsVwWhS?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Cm4KRHxFxP+4ncu9OKcGwooHhNRVtLoIc7ZlM4xnCoYEXHvWTc2tlH6MUj23?=
 =?us-ascii?Q?wx34rKteLnrRVLfqEzeUv9AHs5hVHHJECo1mt50zk2vU19mIywWnExRzI5l8?=
 =?us-ascii?Q?CmD11wpjO83Dat5ZvPJo5VtXzK9molTApqspjngGIIOpSx3ls9hcO++hatI4?=
 =?us-ascii?Q?av4gVtdAjs41DNmT2yyd2K/Cw23y2LnYH5Zf0SJHlKAGm60Q/ztAMWgD6nhR?=
 =?us-ascii?Q?PxA9+C++HvKHqjz+bELsGvEpluhweCI1FJVgz2c/behHUdVxyWR5XaLuuCLL?=
 =?us-ascii?Q?EQolUOmI3kZBmA51sOEqGI+47NwUU/YLFOdU9Omqs4yJltLk3wCnVN6Ogz0p?=
 =?us-ascii?Q?jInxVmDYkbtOB/y2NEAqBXK7fFHQtpSG3zCQnd5UlHdZJTiDH6BkOCt/HMG1?=
 =?us-ascii?Q?Td8jE5OKXnQiHihnj7HbslA6PNbC0CT9C0QcTWlLhDC41NJtaqTtYOu3jFSp?=
 =?us-ascii?Q?RiDKwGBayXVFwTlWq/3seYVV1Sq7EDvQt3ZTzcpBGN0tGABYU8L325WanbPI?=
 =?us-ascii?Q?/L/LQNSWKV+sChY9ppOxnP07y4cW5FodvdmdaGSkeFjTF7u3J1pM3SwGtv9f?=
 =?us-ascii?Q?aMQj+JJ5A2FtuXTuD9kdIge3htmBYtAHdVT9FRCv+n8ipbax1mA/RJ1qSM7D?=
 =?us-ascii?Q?4y7eUFc9lqptH8CuTn2qSlHQqyS1mNYYqof3DyUmVI14kUD4oWrHOMRULjpB?=
 =?us-ascii?Q?ajCt85SHtN8WY+r49J7R/bPGyAPlWFCXit0yxhFRPcLK5Gi57qDQtCuzdhMP?=
 =?us-ascii?Q?o4nHhFfxHuBnjL0ikNfv981XU9PpXq17kAxBFc5Q3x7odpspVLh7GV7JlUir?=
 =?us-ascii?Q?wFcHCSFGK3ILfJl8wyTIgcak00cTepxI0keFDn/X4RUlxS2/IgcmErZcF876?=
 =?us-ascii?Q?z3ugIOoZZ4oa1cptzDLO6OAQ4z1Izy5AVoo7dNe3fHIgMXduAzd88+X42zDe?=
 =?us-ascii?Q?lqCOvZQBDxiYrNdVxfFNEOPlWp0zTjfyfuMICcpkB+pRjy2i1GdcLxIKz7Wz?=
 =?us-ascii?Q?K4WaF68UfBA0+WOeAHrv9NlPlDK+Fnm2wfycMBWKdYihgCziDEyjwiwghFfH?=
 =?us-ascii?Q?kLfRHrgOYbMJWcG1JXWaia2tg7HGPNC57dWEcnRMIniguaci1dGN0y6I1wdm?=
 =?us-ascii?Q?IjWP9W+TwE9aEgAR9/GBMmmLbC0GFYeb8t949F+8BXVwYnlxm7Nv1Du9IHbn?=
 =?us-ascii?Q?U3GIsCfevdEkS/ekAyuB6zClPOdNuKHzIJ39V9a1OcyN8GoDQugMlf233lN8?=
 =?us-ascii?Q?ayEeGVqoSCqp3q9sCLvDvIva9Q25JqA3mTWW8gGjr2JHz0G5/mLpwcrJpg3f?=
 =?us-ascii?Q?UWAJebKQE9sXohgi5Sc99c7617de+/FhFbGp4BJcl7ecKhJsr6y3POdIrUC9?=
 =?us-ascii?Q?mwFPxZ53VZEfa+Xv6b9nuzSA/j4feWM+ei/fvVsjTholLemLe8S/wa/xSMRk?=
 =?us-ascii?Q?IynGAStKQ3QGnD6VgPbqQ9IpAOenajLvxVJl4SkEw5xD8PoNyzXIz2890mTg?=
 =?us-ascii?Q?SM6CifRpMzZjbbd48qOjk6ZXzgVfndfDhT25ekcEtpy/tpeqA8fAYst8xxix?=
 =?us-ascii?Q?aTLzBUGWB8mhp7euT5ii7ed2BpYM8vpjsQAH7sok?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8120d4f-b516-43f4-50ff-08de15fb8822
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 08:25:19.7772 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xHHkGcivGmp0K2fBEwzmh7VBN3c8buAS13IJDHuQmOBMkdV7T79Db7HBJWaMsDBaibrRI0sWveKGCtP3qdjRWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8836
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

> Subject: [v5 20/24] drm/i915/color: Program Pre-CSC registers
>=20
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> Add callback for programming Pre-CSC LUT for TGL and beyond
>=20
> v2: Add DSB support
> v3: Add support for single segment 1D LUT color op
>=20
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c | 104 +++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> b/drivers/gpu/drm/i915/display/intel_color.c
> index c7378af8fbdf..75981fe232bf 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -3945,6 +3945,109 @@ xelpd_load_plane_csc_matrix(struct intel_dsb
> *dsb,
>  			   ctm_to_twos_complement(input[11], 0, 12));  }
>=20
> +static void
> +xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
> +				const struct intel_plane_state *plane_state) {
> +	struct intel_display *display =3D to_intel_display(plane_state);
> +	const struct drm_plane_state *state =3D &plane_state->uapi;
> +	enum pipe pipe =3D to_intel_plane(state->plane)->pipe;
> +	enum plane_id plane =3D to_intel_plane(state->plane)->id;
> +	const struct drm_color_lut_32 *pre_csc_lut =3D plane_state-
> >hw.degamma_lut->data;
> +	u32 i, lut_size;
> +	bool is_single_seg =3D drm_color_lut_32_size(plane_state-
> >hw.degamma_lut) =3D=3D 128 ?
> +			     true : false;
> +
> +	if (icl_is_hdr_plane(display, plane)) {
> +		lut_size =3D 128;
> +
> +		intel_de_write_dsb(display, dsb,
> +				   PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe,
> plane, 0),
> +				   PLANE_PAL_PREC_AUTO_INCREMENT);
> +
> +		if (pre_csc_lut) {
> +			for (i =3D 0; i < lut_size; i++) {
> +				u32 lut_val =3D is_single_seg ?
> +
> drm_color_lut_32_extract(pre_csc_lut[i].green, 24) :
> +					  (pre_csc_lut[i].green & 0xffffff);
> +
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> +						   lut_val);
> +			}
> +
> +			/* Program the max register to clamp values > 1.0. */
> +			/* ToDo: Restrict to 0x7ffffff*/

TODO format is wrong also space before ending comment

> +			do {
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> +						   is_single_seg ? (1 << 24) :
> +						   pre_csc_lut[i].green);
> +			} while (i++ > 130);
> +		} else {
> +			for (i =3D 0; i < lut_size; i++) {
> +				u32 v =3D (i * ((1 << 24) - 1)) / (lut_size - 1);
> +
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
> +			}
> +
> +			do {
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> +						   1 << 24);
> +			} while (i++ < 130);
> +		}
> +
> +		intel_de_write_dsb(display, dsb,
> PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
> +	} else {
> +		lut_size =3D 32;
> +
> +		/*
> +		 * First 3 planes are HDR, so reduce by 3 to get to the right
> +		 * SDR plane offset
> +		 */
> +		plane =3D plane - 3;
> +
> +		intel_de_write_dsb(display, dsb,
> PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, 0),
> +				   PLANE_PAL_PREC_AUTO_INCREMENT);
> +
> +		if (pre_csc_lut) {
> +			for (i =3D 0; i < lut_size; i++)
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
> +						   pre_csc_lut[i].green);
> +			/* Program the max register to clamp values > 1.0. */
> +			while (i < 35)
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
> +						   pre_csc_lut[i++].green);
> +		} else {
> +			for (i =3D 0; i < lut_size; i++) {
> +				u32 v =3D (i * ((1 << 16) - 1)) / (lut_size - 1);
> +
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0), v);
> +			}
> +
> +			do {
> +				intel_de_write_dsb(display, dsb,
> +
> PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
> +						   1 << 16);
> +			} while (i++ < 34);
> +		}
> +
> +		intel_de_write_dsb(display, dsb,
> PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, 0), 0);
> +	}
> +}
> +
> +static void
> +xelpd_plane_load_luts(struct intel_dsb *dsb, const struct
> +intel_plane_state *plane_state) {
> +	if (plane_state->hw.degamma_lut)
> +		xelpd_program_plane_pre_csc_lut(dsb, plane_state); }
> +
>  static const struct intel_color_funcs chv_color_funcs =3D {
>  	.color_check =3D chv_color_check,
>  	.color_commit_arm =3D i9xx_color_commit_arm, @@ -4004,6 +4107,7
> @@ static const struct intel_color_funcs xelpd_color_funcs =3D {
>  	.read_csc =3D icl_read_csc,
>  	.get_config =3D skl_get_config,
>  	.load_plane_csc_matrix =3D xelpd_load_plane_csc_matrix,
> +	.load_plane_luts =3D xelpd_plane_load_luts,
>  };
>=20
>  static const struct intel_color_funcs icl_color_funcs =3D {
> --
> 2.42.0

