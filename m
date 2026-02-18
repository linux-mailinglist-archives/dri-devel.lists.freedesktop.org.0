Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJ0WJW4tlmm5bwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E3C159F37
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E9510E681;
	Wed, 18 Feb 2026 21:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XWW//QiO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010005.outbound.protection.outlook.com
 [52.101.193.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1A010E669;
 Wed, 18 Feb 2026 21:21:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nsg7yutQs1rkARTahg4n6Vce6bdehwRNT3xg8JPUxeS+92rj01M47tHbyIf9qO0aystL0b5IhTj638Fo4mN343Di0/X+GEeKZ+xoqSTYPuLXJRX0FpD5c+FSgZ5TNEqx+3LdOq9GP6Lfdd8wZbdStIzVyHQLm4u1VsxMiGRngkmn/rxGANlWnKU9Ps34BjqFHhDkGREoXfJDU8eY0V0aMCI3zvCVSGw12aBv1wn1y3YyWX5OIwXJfRu2l4b0r6caRC2OI99av2bAJ2NmFPtoDoyKrsJlhqDRZabSnGksAekzFP7uGVLJgckchxBoMX6oRd5LHo6742hQVP40Ju05DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lV0Tmup9jTUjNGCSO4uJh074QDi6mCrTIysebtuSLUw=;
 b=bZbhsexjAQqaewtadbxhvBJeE95tKfLccEmtrypPrTMgna270f7f7hgNbCRV2aYtilx4P37VOgbvHFDR/uzNuw83h752btcgds4kw03vUNl6btbF3BBaqAAkJ8ZAsYaQ8yo4IU5mbS4wNENsnqg7afjM4cbcdnAzPFnu9uu3zvSxQuWU3RNfPyYs4k63A5bboWeS4mRBz/FQnUFXaixwGV0m0o0kkNJwAziYznWOGRD7y4ouIIpaQssVfX83HBE3E2PsPrbpmlb1iKKq+HSegqUtCT9UrvBMgpKsuJZr7y/UU44vIeOpKAUTlNxE+lUOfb2q+eTsqrQiBOHkSf5Deg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lV0Tmup9jTUjNGCSO4uJh074QDi6mCrTIysebtuSLUw=;
 b=XWW//QiO7qUdEBfvr6QeGv7QDXAcFF769iHBh6BYY0xHWfBVPvPk+JF/dPUreWOheV+utFSyyDw7uIVvPf0abVkazaXEiP4Imd2Sx17hJqBT3E/epN8vHvtJztYjMqsJZOgVOCWVWnXqdxL4Z4Diwk5o3wRcM2r2MwUt2r7OB817g1x35uRAhZL2IGeWigfoLlIpfZ2v6fFad/BHFO8WERY/U+6+8RsJTDOv7nwT8U0BVtocHo+ATv+12qxOx4yfr+ATMUQs6iPSZ0aylGPkzpzjzifJx3NvNC6/uSu/Hh0dO6+tzTjZd5tPoEkdSq9cXNmNCKjU7R1Ts5K/RmvzjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SJ0PR12MB6805.namprd12.prod.outlook.com (2603:10b6:a03:44f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.16; Wed, 18 Feb 2026 21:21:37 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:37 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>, Nikola Djukic <ndjukic@nvidia.com>
Subject: [PATCH v7 20/23] nova-core: gsp: Extract usable FB region from GSP
Date: Wed, 18 Feb 2026 16:20:17 -0500
Message-Id: <20260218212020.800836-21-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0260.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::25) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SJ0PR12MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b396135-6d3e-4bbb-8676-08de6f33b317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+60Kpy+FN+hgRP9JgiNurphiDbfchGKd/5RDnUZo1MzAou59+PWnc74JxWtK?=
 =?us-ascii?Q?GpZkt2a+OcwYiDO49BODHvZ7UDQGvZoZ5f/B/7WiK9iBNdixGQu1H7c6+plB?=
 =?us-ascii?Q?qAJUc1dA3+uAKizRRCoQESjmc5bM4r09bXVAJlS9fwWIj21IjpvEtE26GnBS?=
 =?us-ascii?Q?4N80q00H84fPQhTmZ8fP65Bg3o4IvK0Li3p2dpIMAMdf64aLE/FsesVgHwy9?=
 =?us-ascii?Q?uqpZwZhNhfsb8CMvcZYuaVlOalnlTYCfY2KDAXUilcrHKb+KzcUP8Hd07Z9e?=
 =?us-ascii?Q?A/wy6H60jU5TfEJaW9Mv2qOaamyvAnoKdIU8T+krOtUouffXfg7PwxUg+19p?=
 =?us-ascii?Q?MBV5PL4QKDqxp5Cr5mM5BACvqIi/EZxcM5mHXIsgEbQqdd567ID473h0Y8Sb?=
 =?us-ascii?Q?ZtwyWDJWwO2hoEubavFa+xbxn5VsXShPd1vwBTcJmkuuPpf3AUbjUFVmqa9Y?=
 =?us-ascii?Q?vGX99gw21ari74WYx/JWagWLuVSGAWuTBWW+G6wPL22c1gQv2U5x9JfwZ/qj?=
 =?us-ascii?Q?rzJfdA+xj91a65Ftt3UaS5yp35SfY9YvHiGJTOd3Ooto7518EZTh29d75R4a?=
 =?us-ascii?Q?35OMzSh22X7cq3qlLHynowVmTybdI4F5mX5jHbE52jHwHaTTxA14pRpKGmLV?=
 =?us-ascii?Q?qDemUaRDU9DGMUHjIfZUYZ7eyTpEpzDxP2wdXfFygjP4JOhCj/kyrfiiMnWy?=
 =?us-ascii?Q?goU5EqWWawm0A0vTme/LPN9jOKubkcBl7Q0NOcK1T4dlW9RWrvjGhvZCQqg8?=
 =?us-ascii?Q?RBK5dPljA7m0y6BO16El0D15x8+GPxDe6t4F3gEihZx35qYwfIJV1xMdkBUV?=
 =?us-ascii?Q?6SUOsHb2SYFkBu0BXjb7NOJGix2qlRJFKWz8JwDb3UpvwRAZtcbCaqPrHRBY?=
 =?us-ascii?Q?BPvmLIqNyOKZXmxaiDuyl11In1bhmdmF9QSaWFtHLpDoz6X5icgYb0CyUAXE?=
 =?us-ascii?Q?UaQnVFTKgl5PCZnGgVBdOPcG7C83VkGTiYFdVTnHqFSJu3sgCUJJ+r+xSNzz?=
 =?us-ascii?Q?tujUrFmNBcs6AGpS4kC6eVQQIHlBoW35UlFNkKdGMY80qEjb1qYsx+4EG3fy?=
 =?us-ascii?Q?THHrH6tXqbo0BRL/LxqRyCG8fo0iiKMHYtsPRU2qVVj4tF6noUz084FqND/M?=
 =?us-ascii?Q?lz1c8Hdkm6XqkVozXedU9HkB7VAoSFmSfbGu1m6bbZFxaObu7ghB19CqkqTp?=
 =?us-ascii?Q?KAaJwTQkdhKCKvQnCmp0fmse3JQfgw5/962IXL17T6QQ52TzXTS6staqkoWP?=
 =?us-ascii?Q?/5/aQB3DlPsNMyDBGaC+PJ8TC8WWxpFKCRBkS5tOpiDMquHPPxOCXAOAgB39?=
 =?us-ascii?Q?/rHzGLxV3goL1nUaUEMnYRdAH/LUiI4Xu6nTaEbi4LdIPT0faRnBeupGywDP?=
 =?us-ascii?Q?1TSz50ixLX+8C1Jkc8HfIbd2XaTy0h0ZpLOoTPXUIPN9dUZlnfUeGBP51lxc?=
 =?us-ascii?Q?VXvjID4hL4wEJ2jdcMzShiNGxDZgKV080PFR4uRzS3QQGEZaa4E7l7pUlYcS?=
 =?us-ascii?Q?wpLRAlkhJvibxMRvwtHRIRkt/naa2KqD5D3aVacR3L/82jcQsdKw0onm6kle?=
 =?us-ascii?Q?ts9Q/khCTF6dROA8KWY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KaMjDGzSOmZoZvyfhmpWKdbEbnPvzJ5+hNzciLBEfdfdnxsenVWrjtMkDCUf?=
 =?us-ascii?Q?LG+l2nslECNoUyvDJMLqQa1I312Ie2V7r3oThcAFM6zUUdvrXjaozAX9WWER?=
 =?us-ascii?Q?uGIFbeSB8HGOg/7bngfF3PzeH8mqo3JH/k09+wP4K8tUVoUcjP0ZQ73EZ6KR?=
 =?us-ascii?Q?QXRmQgWwWVmxpbeZwewD0I0KP9uA2gxxBTp37KCTlHq/vuIY8sEYHOw24+xP?=
 =?us-ascii?Q?a8J2h2iLT6/ns3v2Vpgvx0vR5dbGGuILGLHrkbZFjIv4utNCkbPviIIGfw41?=
 =?us-ascii?Q?5lTylDPFwdYHO/eyErf340hzRgZ9DgwxHK0drsODesKIgmWsyQvfrvrVIEvF?=
 =?us-ascii?Q?sdk6P8T3fUNtCq1MSmSHHSG2rLVdYMmC0mr4vV6oPDxT36GwHrtbouTpyfB/?=
 =?us-ascii?Q?zJxjawVUnrgLsVx9T1XgQx3E3VA4HcqHe4tUD1Xn2U4ohryzH1FshRGigx8F?=
 =?us-ascii?Q?5W5dvVxpau7XJ9gVWuhmfglYTp1NsP3BaG3cyYktAVUBPdiQZf7WvgT1v21g?=
 =?us-ascii?Q?9c7iTfK27OsbrpPBmev1zyJRK5vr26KX8rq8gCiG4/uiL6K7LOU/Hc1OvIZb?=
 =?us-ascii?Q?8VGq7WnquaZoSAMxZybxUwWrnwO7nlhiydcajubPNSGnIk7NxS+jJj1LUfVS?=
 =?us-ascii?Q?5msSpwUtBsJa6jmdArAE7RrENi7MPzWfuox8ZxYwB6SmvvGWuKCaFC+lwwA3?=
 =?us-ascii?Q?GEzaEGU18BCBAHVcXtPjLCXAsabiAQevynwnAwbj1hRDB8hecAJtK9pBMD8g?=
 =?us-ascii?Q?iNEEd0jeNZRbxkoUJwnZFAobUQxN071ttE89R8wy1hua8GZ7KMLR32LJ7kPR?=
 =?us-ascii?Q?zDoSaQjw5rkT9VZTAkjIDNIqj70+317Yxphn8PhqAjbxHbd47pHU9r+2p+Y/?=
 =?us-ascii?Q?Dhq1ehDIJTdc1fbHWwP5Pj4gMlBFka9V8XlWjpNR1pF/gN0G6F6Y+ycQ2WLt?=
 =?us-ascii?Q?wNVmJNpnpa0xsS2BJwPuuMih32EoS9JhUCMjX9djfJdfuc7EJx5c1hrld/9V?=
 =?us-ascii?Q?xSq+c9BF5ZjJz0MyqsiihewuwsHsoxkJGUgV1Z/4UmTB8q3Lwu1pkyLJ7ENJ?=
 =?us-ascii?Q?DKDk+ZNk4qwYj4ScoO7Yd0070bzee4unmMKfbMs72XWR+IaLkClSe+dZrQye?=
 =?us-ascii?Q?Fif+1O32U3+mOHQy2EaPMleYMWtnjQImvtd1C+vssf9kOp1Fw4A8ZB1Ad1hq?=
 =?us-ascii?Q?iSfgx1qddXqGh+0o/+j42HYd3vFrtsF2Mpgv2pAp6KvXrF1kc03upZ4JoyoE?=
 =?us-ascii?Q?ejxn49PahJWBc2ZZV20AIuG8yXxnnecAo2KhKzGcIGPvM5yXJ53cM34sEmyG?=
 =?us-ascii?Q?CS0grYDR/C6nc4gvPhd5pQYlq3HTGptDLfvbPY1WY/ByrlVcp/02jvxdfDr2?=
 =?us-ascii?Q?BU2LHK0wpV1Cn2TB3XdKg9vuO0uvnalKJGuzlGdWlH3mPwnKNHa9ir0+INLD?=
 =?us-ascii?Q?djEdGJoxNHsU2OrNDIeqbxxvCtfa88dXjAWMmEmQID/3DRS+s0GJfH96HGCn?=
 =?us-ascii?Q?86tjNQpW1lS+Ap953NY2AFawTsLtzA6LNmkaODb6Up2ebajoz8nQywdgWnYK?=
 =?us-ascii?Q?IgkR5yat+GmD/P9HuawRek5jmhB7meMJ7FjORxxApa7uSdDxYA3whCgCcLCO?=
 =?us-ascii?Q?OlwbId0FD1YZk8iSY0asbua77PUhMMjGU9rMV8m2Yah3XYsE/7icqGpurOeR?=
 =?us-ascii?Q?NyqEyPkpAnticgdwnYN5k2g4yQ+Qiusq2eKC4Kmi+VemHGq7XKappgSzI15h?=
 =?us-ascii?Q?Tblk+17g8Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b396135-6d3e-4bbb-8676-08de6f33b317
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:37.3423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lV0jk49Ssu9oGne/jYcSqC3ckw0rGJ8fOZ/9ivvUKYTcuT4r7WwdOGM7WheM0VmvQIKlzJHDifZxNv6Yv06BIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6805
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[53];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,reg.limit:url,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 44E3C159F37
X-Rspamd-Action: no action

Add first_usable_fb_region() to GspStaticConfigInfo to extract the first
usable FB region from GSP's fbRegionInfoParams. Usable regions are those
that are not reserved or protected.

The extracted region is stored in GetGspStaticInfoReply and exposed via
usable_fb_region() API for use by the memory subsystem.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs    | 13 +++++++++-
 drivers/gpu/nova-core/gsp/fw/commands.rs | 30 ++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index bf9e3086565f..44f8b08683f9 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -186,10 +186,13 @@ fn init(&self) -> impl Init<Self::Command, Self::InitError> {
     }
 }
 
-/// The reply from the GSP to the [`GetGspInfo`] command.
+/// The reply from the GSP to the [`GetGspStaticInfo`] command.
 pub(crate) struct GetGspStaticInfoReply {
     gpu_name: [u8; 64],
     bar1_pde_base: u64,
+    /// First usable FB region `(base, size)` for memory allocation.
+    #[expect(dead_code)]
+    usable_fb_region: Option<(u64, u64)>,
 }
 
 impl MessageFromGsp for GetGspStaticInfoReply {
@@ -204,6 +207,7 @@ fn read(
         Ok(GetGspStaticInfoReply {
             gpu_name: msg.gpu_name_str(),
             bar1_pde_base: msg.bar1_pde_base(),
+            usable_fb_region: msg.first_usable_fb_region(),
         })
     }
 }
@@ -235,6 +239,13 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
     pub(crate) fn bar1_pde_base(&self) -> u64 {
         self.bar1_pde_base
     }
+
+    /// Returns the usable FB region `(base, size)` for driver allocation which is
+    /// already retrieved from the GSP.
+    #[expect(dead_code)]
+    pub(crate) fn usable_fb_region(&self) -> Option<(u64, u64)> {
+        self.usable_fb_region
+    }
 }
 
 /// Send the [`GetGspInfo`] command and awaits for its reply.
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index f069f4092911..976eca5a59c4 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -122,6 +122,36 @@ impl GspStaticConfigInfo {
     pub(crate) fn bar1_pde_base(&self) -> u64 {
         self.0.bar1PdeBase
     }
+
+    /// Extract the first usable FB region from GSP firmware data.
+    ///
+    /// Returns the first region suitable for driver memory allocation as a `(base, size)` tuple.
+    /// Usable regions are those that:
+    /// - Are not reserved for firmware internal use.
+    /// - Are not protected (hardware-enforced access restrictions).
+    /// - Support compression (can use GPU memory compression for bandwidth).
+    /// - Support ISO (isochronous memory for display requiring guaranteed bandwidth).
+    pub(crate) fn first_usable_fb_region(&self) -> Option<(u64, u64)> {
+        let fb_info = &self.0.fbRegionInfoParams;
+        for i in 0..fb_info.numFBRegions as usize {
+            if let Some(reg) = fb_info.fbRegion.get(i) {
+                // Skip malformed regions where limit < base.
+                if reg.limit < reg.base {
+                    continue;
+                }
+                // Filter: not reserved, not protected, supports compression and ISO.
+                if reg.reserved == 0
+                    && reg.bProtected == 0
+                    && reg.supportCompressed != 0
+                    && reg.supportISO != 0
+                {
+                    let size = reg.limit - reg.base + 1;
+                    return Some((reg.base, size));
+                }
+            }
+        }
+        None
+    }
 }
 
 // SAFETY: Padding is explicit and will not contain uninitialized data.
-- 
2.34.1

