Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90875C0F0F3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 16:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A6A10E4E0;
	Mon, 27 Oct 2025 15:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PgzPstt1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010041.outbound.protection.outlook.com [52.101.85.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4850310E0DC;
 Mon, 27 Oct 2025 15:52:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hx59h/cmtzk9Ts1M3Zuwfb/+ehsIA2E4kh2dx4xu9CifxtiH6Cjpd4WWxS/VDVHPy2e/seZplgi90vcWxJtRNE1D2bqCzFEje8fgfdkClBjyt2hN057e61ucnPhR452dysL9do6CfWjxrfgdUQS3mgAetckpIxPyGay8ElBcWEpe12wlvt0GXzqXEYSSw0ymmtcDw4Zs4K96Bb9UHGWGHY3ynrelq0YbMRxs+yR66VLo50wpRRZ5s+oyXvZWkOFFwJPHso9Rwsmvytb27GX+fBdqthip0/5ALUW/eLo2YmADCFHIttcNruuEvA/oTPyDs7hKQMZU+zihqMq4YMjusA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDBU/Ck+cVKGmmRC9bq/IXW3SZ4QriYaDjTIkPEhNOo=;
 b=PT4W95QEaFo53XuMq3EUbgw29wy+lrNyZo1aNVcV9s8+97k7jqu9n9YB2E79HmU9WtUyRuEfHdPXvQ8FPFmdA9IqX3GGDY5OIK3/PVnX4iUOqVxDZoMzXj6BYgi4nCe2pCuLPM1DwURS40jIWP/7GzxmEAnA7AzpmeW628YGeyPxwLvpmas1/fLHnlGT+xjxbeM0waKFA3OetMQUR9fajpTeK31BS5C3qKqvJTx2NlBudd3Zk5ODAVRo9X979/yf+w2DgbIBG9+ZKrv8b/7+MGcKgTQnzpLj82EP+LJ+sDI6O5xlSWC3ZmENr+EZiLyVbbq8zxTQQ5nzmF0Zf9oDVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDBU/Ck+cVKGmmRC9bq/IXW3SZ4QriYaDjTIkPEhNOo=;
 b=PgzPstt1rPZqkTMab9NTKjh/2/yXuyqfExf1caAQ4U8mUOxmw38/0TYV1UsQrUWDH3IbSZ+b9wSNVw8Ap4pUSe0+quv9fLdfhLLPq7bpBN9ksJpzaWYZNvafFL331e2IR7rryjfA1stplqfuf6pVKaQJw0Vrq8duzFaoVUPlIaE=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by PH7PR12MB6586.namprd12.prod.outlook.com (2603:10b6:510:212::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 15:52:28 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%4]) with mapi id 15.20.9253.018; Mon, 27 Oct 2025
 15:52:28 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Koenig, Christian" <Christian.Koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>, Lyude Paul
 <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Limonciello, Mario"
 <Mario.Limonciello@amd.com>, "Hung, Alex" <Alex.Hung@amd.com>, Antonio
 Quartulli <antonio@mandelbit.com>, "Nirujogi, Pratap"
 <Pratap.Nirujogi@amd.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>, Dmitry
 Baryshkov <lumag@kernel.org>, "SHANMUGAM, SRINIVASAN"
 <SRINIVASAN.SHANMUGAM@amd.com>, "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>, 
 "Khatri, Sunil" <Sunil.Khatri@amd.com>, "Zhang, Jesse(Jie)"
 <Jesse.Zhang@amd.com>, =?iso-8859-1?Q?Ville_Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Liviu Dudau <liviu.dudau@arm.com>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, Arnd
 Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@kernel.org>, Liao Yuanhong <liaoyuanhong@vivo.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, "Liang, Prike" <Prike.Liang@amd.com>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>, "Paneer Selvam, Arunpravin"
 <Arunpravin.PaneerSelvam@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Chai,
 Thomas" <YiPeng.Chai@amd.com>, "Xie, Patrick" <Gangliang.Xie@amd.com>, "Liu,
 Xiang(Dean)" <Xiang.Liu@amd.com>, "Skvortsov, Victor"
 <Victor.Skvortsov@amd.com>, "Sun, Ce(Overlord)" <Ce.Sun@amd.com>, Dave Airlie
 <airlied@redhat.com>, Jani Nikula <jani.nikula@intel.com>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Imre Deak <imre.deak@intel.com>, Ben Skeggs
 <bskeggs@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/3] drm/amd: Remove redundant pm_runtime_mark_last_busy()
 calls
Thread-Topic: [PATCH 1/3] drm/amd: Remove redundant
 pm_runtime_mark_last_busy() calls
Thread-Index: AQHcR0O4f4fFeL6wWE2A1XIJtLj0/rTWJDNw
Date: Mon, 27 Oct 2025 15:52:28 +0000
Message-ID: <BL1PR12MB514490DCB870F296D1554C14F7FCA@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20251027131440.392052-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20251027131440.392052-1-sakari.ailus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-10-27T15:50:12.0000000Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|PH7PR12MB6586:EE_
x-ms-office365-filtering-correlation-id: 06a75bbf-55c6-4301-9d1e-08de1570d4c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?h74wJ4u0yIqRNXV6AGVzzVAxQ+RgtptnySsow/kXliZNp/kbHnEDc2i8Gc?=
 =?iso-8859-1?Q?8Ii2RrCXsfGoyEhqJkx41Rx3e8tE9AirCdJtJLrVQzPAs2qxUvKKrXjcYc?=
 =?iso-8859-1?Q?nduF7KHyvFtr7nsDEj8uzqCUONj1sgU6kiOB/S6hu6fuIi1jRWBqm4X/XB?=
 =?iso-8859-1?Q?UQh9n6URw9eMbJ/l+txoo+ss86SkuMhjixgUaq53hLYMyeB+HwzN9qfstu?=
 =?iso-8859-1?Q?aey4febxwvlAxzCJTPVeN/bL2Y5eukMmUXr2EoG5eJw1Vtv1eV8hKvi/4v?=
 =?iso-8859-1?Q?GdjPZCLDluwxHYORVEuQASka8yVWFXSFg7wTFKMKQSOwky6njZJMNX7jbm?=
 =?iso-8859-1?Q?UrmGrS7lf47XYhEUCURhz5Z6LxurRlHjuFYRcCFGBfDniUXXDB9SSqQIng?=
 =?iso-8859-1?Q?mCy6LxFsRsOOWM9flYY4n5AfCrLkLMYJGB6uYAKePJZpGwrf73c7dzIahl?=
 =?iso-8859-1?Q?OnvQXgRAqSnNVA7NgqSxa7H+Jg+O1RJ0OSLwybEDsb5UuK+XV0Fpioe/Ff?=
 =?iso-8859-1?Q?oBz96739R+Tp0B+6LNfCu7MrURP8wku0iAyiDnGiGLX3CIoGfsx6bZUR6J?=
 =?iso-8859-1?Q?pyFgoRfh0d4vGB2jzu7NX6+4m2qXIPEeNqrlAtcZOfYBHh7yTpadsLtdFl?=
 =?iso-8859-1?Q?+xrzPkAzjJMpLJko0B4X62tDW6P3XJvHiOsnc+jGUL2f3JC+rY3N++uZXG?=
 =?iso-8859-1?Q?lLPnMrAlTKd3WcOptqSgRs5eugMUdkRuq5to51zgJjRn0I+kcRibh9dSBF?=
 =?iso-8859-1?Q?CDzaRkRURynd24pK+BXJ48l965ttDyd2TtOG4xW3SY5vYHQgAKMautPkkm?=
 =?iso-8859-1?Q?EFrbwD6rTrY6JaV09kvctzZz37luKIRNWCFDBxkW43aOuHZDJ/GAa/KfQd?=
 =?iso-8859-1?Q?cHxD/j1qE7Yzp/6NObFzJvTt/p+TORs9ArypL7RtOk8ERy4QCoKjiJe57X?=
 =?iso-8859-1?Q?6Lm2PvziaTPw3C0A6pE7I9v+0NuVIUQaMZGFBv214nLpAp9h/SH3ECiSjK?=
 =?iso-8859-1?Q?sZUs3Yxb/RfiG/dpOrNaWX7hiWJ4JXvuEMd1hx7iSFUKqTt+bZ8lQoU2hN?=
 =?iso-8859-1?Q?e8I5wlJsTosi5FqLkflXm/trNuGDkVSaefIiP/41m8RwkCj7V3UXeVuAOa?=
 =?iso-8859-1?Q?BuyrMtFTeqlD1QTnlzASpDS0SLUvgukpwnyMHdZvKqguRvpXB9Otv1Smga?=
 =?iso-8859-1?Q?kDTbpKtiVZs3wY82PohdT91WL9ufbWRi7JGSr7qn4MWF0eGA4RArpRLIBT?=
 =?iso-8859-1?Q?gM7rp84OgMBHwQFsIipaMURP9f42g7iYDMt3bYh0bb5+PhhPZCMzWheEQv?=
 =?iso-8859-1?Q?Eds0kR96FXXsy21c07Y96air0/Pa8E0wYU2mHepHdZ5FXHzVG3Jcebcawi?=
 =?iso-8859-1?Q?xE1poEibTjQ4nta1JN+DyJJtB7H33E5cI1JPWiytQoh6RyxDmd8VL1O51J?=
 =?iso-8859-1?Q?WhToD02CWtZ2Ya1Y7OLKF76uRnSXR/7Vyv6yd2/NWxxBA8umY4P05UOh3J?=
 =?iso-8859-1?Q?IUYhze83dl4WTQVyoy+wGMdDWUYBVij7p76f05OGu1QvGYS3TItX9molH2?=
 =?iso-8859-1?Q?cwif6XbwpYweO5KrsZebuAzZHGYU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?9ykJgahVaIJ/2ZffZdZvzwsXwo4gf4MXQychjcf5s87c5EqLBOwr1L4eap?=
 =?iso-8859-1?Q?lqezNS3xJ/PYWvONj4dkU+0rDBQFc+I5/zyFKsthwwj1QytbrZ7SbZbynp?=
 =?iso-8859-1?Q?fyxvcg1/a/McUS3KNMLK0UASO4kquIY+wmFTGnqy8ePJ4WXTMkQFnyxhJ0?=
 =?iso-8859-1?Q?zWNWSxOwjZ/FIwdYM71k1MTtKEWLmTBJzkmRHodTed2k3eY8zjFghav15j?=
 =?iso-8859-1?Q?J+SzTjap2krL72QToSAyJBq1YkyaxthRn9x4i5IBDc5W6yNgnvUNxfHC3W?=
 =?iso-8859-1?Q?jeb0QU05UyeLCvy5Mh/7oPLkr7ZoSAcVuBi9dmGXrxY5NxfytTebv0bVQr?=
 =?iso-8859-1?Q?yU73V9225SGhFMnKSX12+giCRFEGLNZLBVKnLIQ/DL+lACEyzXjXtqIsRJ?=
 =?iso-8859-1?Q?skDISzAEXdHbz1TZpP8iHdjt/5BQNH6cHfhqohVmb+Fv+AgEGtoW9iGzbl?=
 =?iso-8859-1?Q?O4QZyz3UMfK+s70KPFC6TpexPtNO6tRBRUoWfEhSq+rk1U4kQ2k2i499Fp?=
 =?iso-8859-1?Q?xIolcbgXkpO8x/Gd3xoTgblAl4/CI1MlDnvcq0dYL9nJScSEMswK+Gndz0?=
 =?iso-8859-1?Q?bGAE0CWDszDQcIY7BCkwezZRJ0dCvqc6R9zDnajMDawPeMuyhaEdrS9Igi?=
 =?iso-8859-1?Q?8zKOywuyd0izFdjfSlUqduq9oJCSPFHtvO6HHE7NkF5jJ8Se5rrMZ4Aiye?=
 =?iso-8859-1?Q?RCHvvGx9JkBjPDZXkdn7Y+9XXlkWh/XXMdHAyCgd2n1Qh6Ir027WNbl3Nk?=
 =?iso-8859-1?Q?sU5JdXEWVbmUfASrbXLAbIBGC4F8wjoW+N4NbuPrph6JshjxpLPOpy+xPz?=
 =?iso-8859-1?Q?8yIh6bz+jsY4bcHho9+0YQbf3W3jAb45Z0M8Ms+Zs/vbTSnzyfrT6F86wo?=
 =?iso-8859-1?Q?1xDDOKd7KwvB3mWxt+fO7NQ3iaAIWASnGZjcarcQ7N57JpF71zesN4eCcR?=
 =?iso-8859-1?Q?XJtRyA7v/PzUg4r8htnAUznKokMoTDB02ZwNkgj/GmcmKTi2W74/x+s5mt?=
 =?iso-8859-1?Q?vw9G8OwgEz9YXUrTGanoQDD4TY1Nh2WYBoqBsmRQ8ELVp3lU7+3EzYjMax?=
 =?iso-8859-1?Q?nlmMXJtlle2czsy40PjfleyYnYWXZRa8MgPgTRVcNElcSrCkVjCDY1Op0V?=
 =?iso-8859-1?Q?JFvU2CRZFjuw1rZAWPxSrLWpzz5WUwgIVsFTCTpePAGr3XxKATcKBeIOUi?=
 =?iso-8859-1?Q?ZVhVPsq/6NAOMyL1rm8QYLZqH4Cuacd2JQaLXHrpXM8LPCJ7iX9/tquaAa?=
 =?iso-8859-1?Q?NrtjJifLp314+P5b3NM+Pj3Pu82doKPEe06bjXBKHKkO+05sSgjlUxOQ5e?=
 =?iso-8859-1?Q?3bQkJzIieK+5lT0UGTNR4Ue2VjvKWYLveFoQ0EqVnzIyS3q7C/c0wozQdQ?=
 =?iso-8859-1?Q?hjgZuqtYMC4u/oZgdpuAqeQEuyc+ISXzVjKggd91NM0xZc9q5g1gA81Y26?=
 =?iso-8859-1?Q?USSP6lA1t0gyjv/R/6nx+pdd7Tvh/ivOh7emoqCGXpNt2hoLFmgt27KI68?=
 =?iso-8859-1?Q?bOnc+YllqZ8zPmc0Q6mWsurdm5hFhisIRzh/IjCNx53PrwX+xJiolq8rbP?=
 =?iso-8859-1?Q?nn2txecGxlbaXkuWZ7bICrc04rY4okImQ5u2uds2HUXVdoD9CLiVeCCeDo?=
 =?iso-8859-1?Q?9yDnNB49K1/ZI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06a75bbf-55c6-4301-9d1e-08de1570d4c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 15:52:28.3205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zK1E/2pYSj4Ujn6AemHvTrRSN8V/T6SwpBk6gKiE2vzGpTjGT5iWQbxt/FK+YFbGWk7o9W3T8VlsyehLMei1gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6586
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

[Public]

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Monday, October 27, 2025 9:15 AM
> To: dri-devel@lists.freedesktop.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; David Airlie <airlied@gmail.com>; Simona Vett=
er
> <simona@ffwll.ch>; Kuehling, Felix <Felix.Kuehling@amd.com>; Feng, Kennet=
h
> <Kenneth.Feng@amd.com>; Lyude Paul <lyude@redhat.com>; Danilo Krummrich
> <dakr@kernel.org>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>;
> Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann
> <tzimmermann@suse.de>; Limonciello, Mario <Mario.Limonciello@amd.com>;
> Hung, Alex <Alex.Hung@amd.com>; Antonio Quartulli <antonio@mandelbit.com>=
;
> Nirujogi, Pratap <Pratap.Nirujogi@amd.com>; Lazar, Lijo <Lijo.Lazar@amd.c=
om>;
> Dmitry Baryshkov <lumag@kernel.org>; SHANMUGAM, SRINIVASAN
> <SRINIVASAN.SHANMUGAM@amd.com>; Wang, Yang(Kevin)
> <KevinYang.Wang@amd.com>; Khatri, Sunil <Sunil.Khatri@amd.com>; Zhang,
> Jesse(Jie) <Jesse.Zhang@amd.com>; Ville Syrj=E4l=E4 <ville.syrjala@linux.=
intel.com>;
> Liviu Dudau <liviu.dudau@arm.com>; Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com>; Zhang, Hawking
> <Hawking.Zhang@amd.com>; Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Arnd
> Bergmann <arnd@arndb.de>; Thomas Gleixner <tglx@linutronix.de>; Ingo Moln=
ar
> <mingo@kernel.org>; Liao Yuanhong <liaoyuanhong@vivo.com>; Rodrigo Siquei=
ra
> <siqueira@igalia.com>; Liang, Prike <Prike.Liang@amd.com>; Sharma, Shasha=
nk
> <Shashank.Sharma@amd.com>; Paneer Selvam, Arunpravin
> <Arunpravin.PaneerSelvam@amd.com>; Zhou1, Tao <Tao.Zhou1@amd.com>;
> Chai, Thomas <YiPeng.Chai@amd.com>; Xie, Patrick <Gangliang.Xie@amd.com>;
> Liu, Xiang(Dean) <Xiang.Liu@amd.com>; Skvortsov, Victor
> <Victor.Skvortsov@amd.com>; Sun, Ce(Overlord) <Ce.Sun@amd.com>; Dave
> Airlie <airlied@redhat.com>; Jani Nikula <jani.nikula@intel.com>; Gustavo=
 A. R.
> Silva <gustavoars@kernel.org>; Imre Deak <imre.deak@intel.com>; Ben Skegg=
s
> <bskeggs@nvidia.com>; nouveau@lists.freedesktop.org; amd-
> gfx@lists.freedesktop.org
> Subject: [PATCH 1/3] drm/amd: Remove redundant pm_runtime_mark_last_busy(=
)
> calls
>
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call =
to
> pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().


Typo: should be "now-redundant"

>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Patches 1, 3 are:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

When did mark_last_busy get pulled into the other runtime_pm functions?  Di=
d you want me to pick these up or did you want to send them via some other =
tree?

Thanks,

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  1 -
>  .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 16 +++---------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 25 -------------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  2 --
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  4 ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c     |  2 --
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c       |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |  2 --
>  drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c       |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |  1 -
>  .../gpu/drm/amd/amdgpu/amdgpu_securedisplay.c |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c     |  1 -
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  1 -
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c            |  1 -
>  14 files changed, 4 insertions(+), 55 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index 6c62e27b9800..d31460a9e958 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -507,7 +507,6 @@ static int amdgpu_atif_handler(struct amdgpu_device
> *adev,
>                               pm_runtime_get_sync(adev_to_drm(adev)->dev)=
;
>                               /* Just fire off a uevent and let userspace=
 tell us what
> to do */
>                               drm_helper_hpd_irq_event(adev_to_drm(adev))=
;
> -                             pm_runtime_mark_last_busy(adev_to_drm(adev)=
-
> >dev);
>                               pm_runtime_put_autosuspend(adev_to_drm(adev=
)-
> >dev);
>                       }
>               }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> index 47e9bfba0642..9f96d568acf2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -734,10 +734,8 @@ amdgpu_connector_lvds_detect(struct drm_connector
> *connector, bool force)
>
>       amdgpu_connector_update_scratch_regs(connector, ret);
>
> -     if (!drm_kms_helper_is_poll_worker()) {
> -             pm_runtime_mark_last_busy(connector->dev->dev);
> +     if (!drm_kms_helper_is_poll_worker())
>               pm_runtime_put_autosuspend(connector->dev->dev);
> -     }
>
>       return ret;
>  }
> @@ -919,10 +917,8 @@ amdgpu_connector_vga_detect(struct drm_connector
> *connector, bool force)
>       amdgpu_connector_update_scratch_regs(connector, ret);
>
>  out:
> -     if (!drm_kms_helper_is_poll_worker()) {
> -             pm_runtime_mark_last_busy(connector->dev->dev);
> +     if (!drm_kms_helper_is_poll_worker())
>               pm_runtime_put_autosuspend(connector->dev->dev);
> -     }
>
>       return ret;
>  }
> @@ -1146,10 +1142,8 @@ amdgpu_connector_dvi_detect(struct drm_connector
> *connector, bool force)
>       amdgpu_connector_update_scratch_regs(connector, ret);
>
>  exit:
> -     if (!drm_kms_helper_is_poll_worker()) {
> -             pm_runtime_mark_last_busy(connector->dev->dev);
> +     if (!drm_kms_helper_is_poll_worker())
>               pm_runtime_put_autosuspend(connector->dev->dev);
> -     }
>
>       return ret;
>  }
> @@ -1486,10 +1480,8 @@ amdgpu_connector_dp_detect(struct drm_connector
> *connector, bool force)
>
>       amdgpu_connector_update_scratch_regs(connector, ret);
>  out:
> -     if (!drm_kms_helper_is_poll_worker()) {
> -             pm_runtime_mark_last_busy(connector->dev->dev);
> +     if (!drm_kms_helper_is_poll_worker())
>               pm_runtime_put_autosuspend(connector->dev->dev);
> -     }
>
>       if (connector->connector_type =3D=3D
> DRM_MODE_CONNECTOR_DisplayPort ||
>           connector->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP) diff -=
-
> git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index d3a5189bd512..62d43b8cbe58 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -129,7 +129,6 @@ static int  amdgpu_debugfs_process_reg_op(bool read,
> struct file *f,
>       if (use_bank) {
>               if ((sh_bank !=3D 0xFFFFFFFF && sh_bank >=3D adev-
> >gfx.config.max_sh_per_se) ||
>                   (se_bank !=3D 0xFFFFFFFF && se_bank >=3D adev-
> >gfx.config.max_shader_engines)) {
> -                     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>                       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>                       amdgpu_virt_disable_access_debugfs(adev);
>                       return -EINVAL;
> @@ -179,7 +178,6 @@ static int  amdgpu_debugfs_process_reg_op(bool read,
> struct file *f,
>       if (pm_pg_lock)
>               mutex_unlock(&adev->pm.mutex);
>
> -     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>
>       amdgpu_virt_disable_access_debugfs(adev);
> @@ -255,7 +253,6 @@ static ssize_t amdgpu_debugfs_regs2_op(struct file *f=
,
> char __user *buf, u32 off
>       if (rd->id.use_grbm) {
>               if ((rd->id.grbm.sh !=3D 0xFFFFFFFF && rd->id.grbm.sh >=3D =
adev-
> >gfx.config.max_sh_per_se) ||
>                   (rd->id.grbm.se !=3D 0xFFFFFFFF && rd->id.grbm.se >=3D =
adev-
> >gfx.config.max_shader_engines)) {
> -                     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>                       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>                       amdgpu_virt_disable_access_debugfs(adev);
>                       mutex_unlock(&rd->lock);
> @@ -310,7 +307,6 @@ static ssize_t amdgpu_debugfs_regs2_op(struct file *f=
,
> char __user *buf, u32 off
>
>       mutex_unlock(&rd->lock);
>
> -     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>
>       amdgpu_virt_disable_access_debugfs(adev);
> @@ -446,7 +442,6 @@ static ssize_t amdgpu_debugfs_gprwave_read(struct fil=
e
> *f, char __user *buf, siz
>       amdgpu_gfx_select_se_sh(adev, 0xFFFFFFFF, 0xFFFFFFFF,
> 0xFFFFFFFF, rd->id.xcc_id);
>       mutex_unlock(&adev->grbm_idx_mutex);
>
> -     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>
>       if (!x) {
> @@ -557,7 +552,6 @@ static ssize_t amdgpu_debugfs_regs_pcie_read(struct f=
ile
> *f, char __user *buf,
>
>       r =3D result;
>  out:
> -     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>       amdgpu_virt_disable_access_debugfs(adev);
>       return r;
> @@ -617,7 +611,6 @@ static ssize_t amdgpu_debugfs_regs_pcie_write(struct =
file
> *f, const char __user
>
>       r =3D result;
>  out:
> -     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>       amdgpu_virt_disable_access_debugfs(adev);
>       return r;
> @@ -676,7 +669,6 @@ static ssize_t amdgpu_debugfs_regs_didt_read(struct f=
ile
> *f, char __user *buf,
>
>       r =3D result;
>  out:
> -     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>       amdgpu_virt_disable_access_debugfs(adev);
>       return r;
> @@ -736,7 +728,6 @@ static ssize_t amdgpu_debugfs_regs_didt_write(struct =
file
> *f, const char __user
>
>       r =3D result;
>  out:
> -     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>       amdgpu_virt_disable_access_debugfs(adev);
>       return r;
> @@ -795,7 +786,6 @@ static ssize_t amdgpu_debugfs_regs_smc_read(struct fi=
le
> *f, char __user *buf,
>
>       r =3D result;
>  out:
> -     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>       amdgpu_virt_disable_access_debugfs(adev);
>       return r;
> @@ -855,7 +845,6 @@ static ssize_t amdgpu_debugfs_regs_smc_write(struct f=
ile
> *f, const char __user *
>
>       r =3D result;
>  out:
> -     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>       amdgpu_virt_disable_access_debugfs(adev);
>       return r;
> @@ -1003,7 +992,6 @@ static ssize_t amdgpu_debugfs_sensor_read(struct fil=
e
> *f, char __user *buf,
>
>       r =3D amdgpu_dpm_read_sensor(adev, idx, &values[0], &valuesize);
>
> -     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>
>       if (r) {
> @@ -1094,7 +1082,6 @@ static ssize_t amdgpu_debugfs_wave_read(struct file=
 *f,
> char __user *buf,
>       amdgpu_gfx_select_se_sh(adev, 0xFFFFFFFF, 0xFFFFFFFF,
> 0xFFFFFFFF, 0);
>       mutex_unlock(&adev->grbm_idx_mutex);
>
> -     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>
>       if (!x) {
> @@ -1192,7 +1179,6 @@ static ssize_t amdgpu_debugfs_gpr_read(struct file =
*f,
> char __user *buf,
>       amdgpu_gfx_select_se_sh(adev, 0xFFFFFFFF, 0xFFFFFFFF,
> 0xFFFFFFFF, 0);
>       mutex_unlock(&adev->grbm_idx_mutex);
>
> -     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>
>       while (size) {
> @@ -1266,7 +1252,6 @@ static ssize_t
> amdgpu_debugfs_gfxoff_residency_read(struct file *f, char __user
>
>       r =3D result;
>  out:
> -     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>
>       return r;
> @@ -1315,7 +1300,6 @@ static ssize_t
> amdgpu_debugfs_gfxoff_residency_write(struct file *f, const char
>
>       r =3D result;
>  out:
> -     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>
>       return r;
> @@ -1365,7 +1349,6 @@ static ssize_t
> amdgpu_debugfs_gfxoff_count_read(struct file *f, char __user *buf
>
>       r =3D result;
>  out:
> -     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>
>       return r;
> @@ -1414,7 +1397,6 @@ static ssize_t amdgpu_debugfs_gfxoff_write(struct f=
ile
> *f, const char __user *bu
>
>       r =3D result;
>  out:
> -     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>
>       return r;
> @@ -1460,7 +1442,6 @@ static ssize_t amdgpu_debugfs_gfxoff_read(struct fi=
le *f,
> char __user *buf,
>
>       r =3D result;
>  out:
> -     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>
>       return r;
> @@ -1501,7 +1482,6 @@ static ssize_t
> amdgpu_debugfs_gfxoff_status_read(struct file *f, char __user *bu
>
>       r =3D result;
>  out:
> -     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>
>       return r;
> @@ -1701,7 +1681,6 @@ static int amdgpu_debugfs_test_ib_show(struct seq_f=
ile
> *m, void *unused)
>
>       up_write(&adev->reset_domain->sem);
>
> -     pm_runtime_mark_last_busy(dev->dev);
>       pm_runtime_put_autosuspend(dev->dev);
>
>       return 0;
> @@ -1721,7 +1700,6 @@ static int amdgpu_debugfs_evict_vram(void *data, u6=
4
> *val)
>
>       *val =3D amdgpu_ttm_evict_resources(adev, TTM_PL_VRAM);
>
> -     pm_runtime_mark_last_busy(dev->dev);
>       pm_runtime_put_autosuspend(dev->dev);
>
>       return 0;
> @@ -1742,7 +1720,6 @@ static int amdgpu_debugfs_evict_gtt(void *data, u64
> *val)
>
>       *val =3D amdgpu_ttm_evict_resources(adev, TTM_PL_TT);
>
> -     pm_runtime_mark_last_busy(dev->dev);
>       pm_runtime_put_autosuspend(dev->dev);
>
>       return 0;
> @@ -1762,7 +1739,6 @@ static int amdgpu_debugfs_benchmark(void *data, u64
> val)
>
>       r =3D amdgpu_benchmark(adev, val);
>
> -     pm_runtime_mark_last_busy(dev->dev);
>       pm_runtime_put_autosuspend(dev->dev);
>
>       return r;
> @@ -2014,7 +1990,6 @@ static int amdgpu_debugfs_sclk_set(void *data, u64 =
val)
>               ret =3D -EINVAL;
>
>  out:
> -     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>
>       return ret;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 51bab32fd8c6..eca8443d9256 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -332,8 +332,6 @@ int amdgpu_display_crtc_set_config(struct drm_mode_se=
t
> *set,
>               if (crtc->enabled)
>                       active =3D true;
>
> -     pm_runtime_mark_last_busy(dev->dev);
> -
>       adev =3D drm_to_adev(dev);
>       /* if we have active crtcs and we don't have a power ref,
>        * take the current one
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index a36e15beafeb..f159515b7d95 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2228,7 +2228,6 @@ static void amdgpu_get_secondary_funcs(struct
> amdgpu_device *adev)
>                                               adev->pdev->bus->number, i)=
;
>               if (p) {
>                       pm_runtime_get_sync(&p->dev);
> -                     pm_runtime_mark_last_busy(&p->dev);
>                       pm_runtime_put_autosuspend(&p->dev);
>                       pci_dev_put(p);
>               }
> @@ -2474,7 +2473,6 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>
>               pm_runtime_allow(ddev->dev);
>
> -             pm_runtime_mark_last_busy(ddev->dev);
>               pm_runtime_put_autosuspend(ddev->dev);
>
>               pci_wake_from_d3(pdev, TRUE);
> @@ -2934,7 +2932,6 @@ static int amdgpu_pmops_runtime_idle(struct device
> *dev)
>
>       ret =3D amdgpu_runtime_idle_check_userq(dev);
>  done:
> -     pm_runtime_mark_last_busy(dev);
>       pm_runtime_autosuspend(dev);
>       return ret;
>  }
> @@ -2970,7 +2967,6 @@ long amdgpu_drm_ioctl(struct file *filp,
>
>       ret =3D drm_ioctl(filp, cmd, arg);
>
> -     pm_runtime_mark_last_busy(dev->dev);
>  out:
>       pm_runtime_put_autosuspend(dev->dev);
>       return ret;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 1fe31d2f2706..c7843e336310 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -250,7 +250,6 @@ bool amdgpu_fence_process(struct amdgpu_ring *ring)
>               drv->signalled_wptr =3D am_fence->wptr;
>               dma_fence_signal(fence);
>               dma_fence_put(fence);
> -             pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>               pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>       } while (last_seq !=3D seq);
>
> @@ -928,7 +927,6 @@ static int gpu_recover_get(void *data, u64 *val)
>
>       *val =3D atomic_read(&adev->reset_domain->reset_res);
>
> -     pm_runtime_mark_last_busy(dev->dev);
>       pm_runtime_put_autosuspend(dev->dev);
>
>       return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> index 29c927f4d6df..8b118c53f351 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -1670,7 +1670,6 @@ static ssize_t
> amdgpu_gfx_set_run_cleaner_shader(struct device *dev,
>
>       ret =3D amdgpu_gfx_run_cleaner_shader(adev, value);
>
> -     pm_runtime_mark_last_busy(ddev->dev);
>       pm_runtime_put_autosuspend(ddev->dev);
>
>       if (ret)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index b3e6b3fcdf2c..6ee77f431d56 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -1471,7 +1471,6 @@ int amdgpu_driver_open_kms(struct drm_device *dev,
> struct drm_file *file_priv)
>       kfree(fpriv);
>
>  out_suspend:
> -     pm_runtime_mark_last_busy(dev->dev);
>  pm_put:
>       pm_runtime_put_autosuspend(dev->dev);
>
> @@ -1539,7 +1538,6 @@ void amdgpu_driver_postclose_kms(struct drm_device
> *dev,
>       kfree(fpriv);
>       file_priv->driver_priv =3D NULL;
>
> -     pm_runtime_mark_last_busy(dev->dev);
>       pm_runtime_put_autosuspend(dev->dev);
>  }
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
> index 123bcf5c2bb1..bacf888735db 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_rap.c
> @@ -101,7 +101,6 @@ static ssize_t amdgpu_rap_debugfs_write(struct file *=
f,
> const char __user *buf,
>       }
>
>       amdgpu_gfx_off_ctrl(adev, true);
> -     pm_runtime_mark_last_busy(dev->dev);
>       pm_runtime_put_autosuspend(dev->dev);
>
>       return size;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> index ff34e1c0d9e2..c806d4af8c05 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -4099,7 +4099,6 @@ static void amdgpu_ras_counte_dw(struct work_struct
> *work)
>               atomic_set(&con->ras_ue_count, ue_count);
>       }
>
> -     pm_runtime_mark_last_busy(dev->dev);
>  Out:
>       pm_runtime_put_autosuspend(dev->dev);
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
> index 41ebe690eeff..3739be1b71e0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
> @@ -159,7 +159,6 @@ static ssize_t
> amdgpu_securedisplay_debugfs_write(struct file *f, const char __u
>               dev_err(adev->dev, "Invalid input: %s\n", str);
>       }
>
> -     pm_runtime_mark_last_busy(dev->dev);
>       pm_runtime_put_autosuspend(dev->dev);
>
>       return size;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> index 9d4751a39c20..3f75d5daa5a8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> @@ -479,7 +479,6 @@ amdgpu_userq_destroy(struct drm_file *filp, int queue=
_id)
>       amdgpu_userq_cleanup(uq_mgr, queue, queue_id);
>       mutex_unlock(&uq_mgr->userq_mutex);
>
> -     pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>
>       return r;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index ddfe30c13e9d..9e30b9df6d53 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -1083,7 +1083,6 @@ static void kfd_process_destroy_pdds(struct
> kfd_process *p)
>                * for auto suspend
>                */
>               if (pdd->runtime_inuse) {
> -                     pm_runtime_mark_last_busy(adev_to_drm(pdd->dev-
> >adev)->dev);
>                       pm_runtime_put_autosuspend(adev_to_drm(pdd->dev-
> >adev)->dev);
>                       pdd->runtime_inuse =3D false;
>               }
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> index c83d69994380..c88a76cce401 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -174,7 +174,6 @@ static int amdgpu_pm_get_access_if_active(struct
> amdgpu_device *adev)
>   */
>  static inline void amdgpu_pm_put_access(struct amdgpu_device *adev)  {
> -     pm_runtime_mark_last_busy(adev->dev);
>       pm_runtime_put_autosuspend(adev->dev);
>  }
>
> --
> 2.47.3

