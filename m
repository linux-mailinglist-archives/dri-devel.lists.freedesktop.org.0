Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58502A96E0B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 16:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3875610E29C;
	Tue, 22 Apr 2025 14:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="K5Vm7omB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519F010E29C;
 Tue, 22 Apr 2025 14:12:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLIPxbSkM+sdw7pzeVrmTejGk/zt9Z3QL3UNFXejIfs/NRcf86h8g4G/ykkk80eq+rmA6fC2/J+sxrUe7nAy0jHbjTbXGG27HUs3MOtqcoD5XfXk2tLe2rSgy+3eg9msq4OWSSFRY7qUMtC9mGtg6Jw1kjiYbfUALaDQfeb2+SfM+srya4CYnBLu0Tto9U4bgEefkHKqnm297NSvAEPQoI2qeK1nj1y2aDvB78Tx9osRGuuqpOO+rIwA7wWUymj5HnjzKw+e7OnzNPdZvBmvpwje6G1ATucAklLGwEaiW6qhOzxAtQJPhn0r3k5iZ1J11ZeGzobK0Jf31c+MM2NhYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIr7uJwjjSM1G2oS+MHFi/8BeNfSjgiFV0A2EJlM4fM=;
 b=LaRF0SRNobhVyGDAt3sY9LqBWobJwOkRxg85dRtVqxKwq2qGfxsQWygQstw1acYGu/FF/pHDWmvCGf6842MV/on+nUzPRwoUTBc5YJWKMOxkqOFuPguAjGjt0aXBiPg+7FE3ndEU2aYhDspTf4IL9boki0H5V0SnJe646OWjtZGF5dEcbRhP8rFQ+fl9pg6WihqRAgYkpLQgf5ndRB84ADkBbCuijhVQa8OUH0m8Q25v/VkDh+EqEwg2N7SqweZKgeOQZrGgJPPEotGSN2p9+jwe+U+v7y1JAobAv9+ycF08R828zWwlev3AKwC4x8v7wwdqtHkdFPauivFIA+5IBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIr7uJwjjSM1G2oS+MHFi/8BeNfSjgiFV0A2EJlM4fM=;
 b=K5Vm7omBrOkYrzCBh3vRMhhMhqMDptfQBFPYydO20kI72DYs9s55n4b/dKQhnLlmTjUlDRpRo3CcnxDHMZyYXORHICGp+YYlUFQ4pfiTEi+eV6pz//8/C5H4pxnuTzYAZkcHe6AzzperJcSEGdJHI+JVephmWjNFATDPTXKoWipcmv7HZQFvezS9FrsHy0VNdq56Gnco2ya0PM1JMfrbE2qkMda0y9QZzu547tJTByXCXaak3dJ+0c879bE9hthoYA4QshLHqNdeUFFcZPDZglHHMmS6fJeFX2tXWkuv5pPRrLHb3qTM23FlVd3dZ86AcNemAupzRR5z3lz2pA1U3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8822.namprd12.prod.outlook.com (2603:10b6:510:28d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 14:12:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 14:12:17 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Apr 2025 23:12:14 +0900
Message-Id: <D9D89276AUNU.1QJ33MPMV289R@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan Corbet"
 <corbet@lwn.net>, "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 =?utf-8?q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>
Subject: Re: [PATCH 00/16] nova-core: run FWSEC-FRTS to perform first stage
 of GSP initialization
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <aAdV4kkCzkSeMNXy@cassiopeiae>
In-Reply-To: <aAdV4kkCzkSeMNXy@cassiopeiae>
X-ClientProxiedBy: TYAPR01CA0155.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::23) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8822:EE_
X-MS-Office365-Filtering-Correlation-Id: f2fe6ea1-a783-4cf5-82d2-08dd81a7b02a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1V4RStSdTlMMWsxa2VwazRGY1E0ckpJWG1EMEpORk01M0xkNUJOR1Znd0xZ?=
 =?utf-8?B?WmxHa2FrN2k4OWE2NlJxcThIcTBzc1hpQy9CZFg1dThvL2Q3RVFYUUdlQnQy?=
 =?utf-8?B?UlhuRVpIYzF2YzBDL0UwS2NzYzZncEU2VUVCVC85Y1ZHZXdZZDRrcjZUUGkv?=
 =?utf-8?B?SDJIQmExMFh5RHFOd0pQeVIxYXhUNEdBdGR0b1FValdiaHlMbGRFdS8wNGZv?=
 =?utf-8?B?WFVnRFprMTYxUmMyNmdMSGRlZWtoNlRTenl5bi9ZNVRFK1A4cmtYVnFENXpu?=
 =?utf-8?B?dmF2ajBKVlhGa2pMS3krU0hXVUl5LytNeGpybVZYZmRLbzBqRXlVVmpLeUR5?=
 =?utf-8?B?Q3A0T3NxYmM0M0xndHpJTTU2azNuZnRaRW9qNkdEK3psYlZOSlpEcUpxVXVr?=
 =?utf-8?B?aHVhcDlsYWVJVWJoQm40T2Y0Vy9iMmhPRC9ueWtUL3lXT1B3a2dZY21Lb0Nn?=
 =?utf-8?B?VGFja1ZVQ3d0aG51c2JtY2dkM3lLSjFETDRKVi9oc3QwVWdUa25oOWZONG43?=
 =?utf-8?B?TFFBc0JmRWFRS1VkYzZKVnpKd0kwd1A1bmpjeDdNQ3FBTit6OS8yZ2R4ZUFW?=
 =?utf-8?B?MWlBVjZZRjlmbkNoYlFTSEJlRzJHVVFUaXpDQjllYzVRT25BcXViYTFsTE51?=
 =?utf-8?B?aUlWK1lRdENCWjFCNlVwVDE0SklSV2hGUUpranlKa01lTkVPWlNLUkg4TjFp?=
 =?utf-8?B?MzRzL0FaR2FEQWxaRGVsVjBtRXR2QUZXdUV3WUtFNFIxWGdIUGJ6UVNKNzNn?=
 =?utf-8?B?NHZ2eGZJWFd2eW1CMVhuSzNSSnUwMkRLaHRVTGtBNTUrelJZUkhkNWNuSmpt?=
 =?utf-8?B?MFIzbE5QQ2JzM0Y5Ly9CdGtRTUFqQ3BqNDZla2FObEUvWk56UksvWjRycS82?=
 =?utf-8?B?enFDMnk0dWVIcE90R1ZkV3Y3djlUUzhNUjVOOGFXMmJFdnkwbFRGaGJzRnRJ?=
 =?utf-8?B?dlJyVVNDL0Z4cDB4V3kwVEc2bmdaMDZVanFvZlpkRFlHTVdBYk9YSkgzS2Z4?=
 =?utf-8?B?SFVHZHpFd2RCdVB4ZG1vMi9Fa2IyVnJPbjJ2L2NoQ0VsQXN5OFRUWEJXbVFx?=
 =?utf-8?B?ZW05NHRHdVNtR0NRdmRHOG91cXhFa2VaNm1MM2p6SXpVYmh2SHF0NWtIREdB?=
 =?utf-8?B?UGFXcWpoS3lBOVhRYkxRalBsQzAyL2FQMFBKay9ITk52aGp4VHVrdVF4MXE0?=
 =?utf-8?B?U0g4bDE1MTRMdEVWd0NzTjdTT2dBUnRVSDVQV3A5c05IY1Y5bk9mYmxaZ0x3?=
 =?utf-8?B?aFAyMFBpOGZTMCs3NXBmYTRKTVZkTit0azNxYVZXT3lwdUVCNGtZWWJNb2xl?=
 =?utf-8?B?WGp2bDQzdUVwc1FpaUtsbVJQaUh5c3FmR0syRVNlaSszM1ZpYWN0SkJ0Ym8r?=
 =?utf-8?B?ZG04OXdSVTgyMHloMEg5dVVTQW9MY0V3RzVNK0xSc0lVMmd0dDcwQWlCZVlM?=
 =?utf-8?B?WS9scEhDVUFMeGExUG1qRWFmUXVoTVAvTURMZFF6c252cUZlanNHc3Frb1Z1?=
 =?utf-8?B?WTdmM0djdW0vVTdwMytVbmNUcHp3K2J0eTZUSzJMUTFIQW05cFNHelArR0Na?=
 =?utf-8?B?djBLNGRVMlBzOHgvYm5KdmR6OWZDZVVBQ2JoMHBzUlVmenZzSkczSFVIL2U4?=
 =?utf-8?B?Q0MxUkRhYTNzZlJhU3ZpR0xCUXNxUlVrZmZHS3VEUXp2empZSXNNZnJKWWZ2?=
 =?utf-8?B?dlJIZVJIa0RnazNGVjI4eVF2Vlc5bmdyb1VCVmZMYnIzcVRpZWF1UllhVTFk?=
 =?utf-8?B?NXVKRkJDdVRrOWJQRXBSRi8zYmhhd3lTWENPUERpUElFSkdFVnlMZFVieVFs?=
 =?utf-8?B?N09FY2ZmSjREQ08yNWFQVTRMZUFsWitIM0p2TEowcHhEUkZaQ24wTWUvSWJE?=
 =?utf-8?B?S00rZmlsWG9mTURKaHFiQ0x2TmYzVHo5RUpaeHptQmJzNXE4dnZWTHdFQmMw?=
 =?utf-8?Q?PwDyBQ+YgYY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NG1yditTRlV2T1JXczZZVmowNUhtZWtDZUtwSzRCUmpPM204Y1hvNXhqN3V4?=
 =?utf-8?B?MWY0c3gxQ0lMbmxlaEVLZ2FwMTNJdnIrM1ZiMGh3RWh0WEdKSVRkTGRJNUFi?=
 =?utf-8?B?KzN2bi9NWGNtSW1XVUFEWlYyMzd2MkYyVlQ1ZmprZzdFbG9iYzBtL1lFMkFN?=
 =?utf-8?B?UjV6ekVyWlhyVDFGOGtzanpKdjdpQ0h5VzRaa05OL1FhTmN0WXR1aEpDZVgr?=
 =?utf-8?B?djJjalJxTVRiNjR4cE5yY0lzQUF1SU4zcTByeXU3alNlYXArcUdoU3E1akx5?=
 =?utf-8?B?SmV4L1dneWhld1VmM3RKbDdOKzlFM2xRYWxMMVlOZlJLYTZkREJvZFBiVHU4?=
 =?utf-8?B?VlRXcWQ5OGppZHBFKzU2QjZxVkFpekNSUll0MlZacHpMeFlZaGVRNldVTFhB?=
 =?utf-8?B?dTFSQ0V1bGpIVWcyWExINU1WQ1J3dEc5V08vRG9XbktveFNDVEc4T0NaQjNF?=
 =?utf-8?B?eGh6VXdqTTBYclh1UE1pS0VoVzdHemoyM09TdTZMVlkzT1J5a2RpTWpSUGlQ?=
 =?utf-8?B?SHdoa0RYMDVBWkZhY2xHdHZyUzZsQWpYcXZiVUVDakV1Z21sZzNrZU0zZHBx?=
 =?utf-8?B?ZkhEOXcxQmpzSXQ3ZXdIR3FGZHMvVDFJekRtZEdsM3piMVlOd3NaZk13VW1h?=
 =?utf-8?B?eFArQ0FySHVhK0ZZSVpDNTRRU0xTcG1TeUYvcEQ4UXhpSEF5a1dMMDU0a3E5?=
 =?utf-8?B?eWNVSmF3WDdOSFp1M1E0UjhxNlhuVTczbk1IaWhtcG5QcnhpVmJzVGZUb1Bo?=
 =?utf-8?B?eFQ5VXptU2ZQb1R0VUFvTWl4V0NOODRWWFJLNFo3cUNpYndhWlgwU25kcGRJ?=
 =?utf-8?B?SkN0akR5TXBtNTdOWjVPMjZQUjJOU2JjNzBoWWlaMElPcGNGWHQxTXc3VE56?=
 =?utf-8?B?SlVzZzcwVXFPem9jNURJelVOSzIrOGNieEJQbTQzZHQ5cXcvQUhGUnRDV2Rl?=
 =?utf-8?B?UVZPZ09ZZUxyZ2U5WStpT0lxQm1xUDJlcXQrNFJPVjhQT0R2NEErQzkvanlu?=
 =?utf-8?B?SkxRU1pGY3BuRTBycHpCOURscU9wckZVOURDZXB0MkpnM0pkREpFcTIweWxa?=
 =?utf-8?B?eFQyY25UZUV5blE5WEVJTGZyWnM3ckdXb0Rla0VYdzVlbzZ6K0c4OElhRWtS?=
 =?utf-8?B?VHc0Y0FJdEJuVEZZNEpUNVY2NzFycmtZWVJ2R0J0T3Q2UHRBdlZHbDVGdDNv?=
 =?utf-8?B?SXFxQzFPRzVMOFlSTVB2T0xIM3k2NkJ0bmltNitYUmZaa2xKSUM0KzhRMk5Z?=
 =?utf-8?B?VkVBRERnMU55L1BoRWRrdURuWUwyOG9vaUh0emRCU2QxM014MlBaanhGdDFu?=
 =?utf-8?B?ZzRubDdQQUF4ZTI3cUFITFlYYUFHTVdwYlpla1R5b0pIc0wvM3NaQlNGbnY0?=
 =?utf-8?B?NGc5K0wrV1BCT0ovWXhpUFM1clg0R1lDYnNCT2E5SUhNdzh4ajd6bE1kTGVU?=
 =?utf-8?B?aS9rdm55U2t5RE9uZkRmYVZZMGk1VURobnFyeGFOOE5LMzY0aG1tSDhLWlZS?=
 =?utf-8?B?NTUwSGhjNE5LNk9uTjdXVXJpUEY4Q2tLS1piKzM0Q1lVWFhiWGJmZlYzd1Nj?=
 =?utf-8?B?YlpTSFhRMFhEQjg2RFliUVgxRHZ2aG40bFdiUmsxZDljQkY5U1JNbVB1dU82?=
 =?utf-8?B?STloa3pZZzdGL2ZJTUpnelZIQTViRittVWtaWXg2QlF5d2hHaERZOVJIUTZz?=
 =?utf-8?B?M3l2c2NpMU1iY1hjNmcxLzIvNE1XL0djTjg2ZHZ4bmlqV1YzcmUzZGwzZUdt?=
 =?utf-8?B?UFFFdis1VmRON3p4TVZuTUN1QmxablRQY25QL0pBR28wNGRPNjVaMTR1UXNX?=
 =?utf-8?B?cjRqcUwwbUNDQnV1cWVzbGtLckd1UDA5c01pazgzMVEyMXV0ZUlvRmxpVjVB?=
 =?utf-8?B?QUphVjdmWlpCZ3BqbzJhdjI1WlN6UGxEU1N4U0JqdVZ5WjJFeUkzeUZFbFp6?=
 =?utf-8?B?U0ViQXpqZFhqeE11bDAzYXBseFN2S29LY3JDOVl0OVY1b1YrM1Q1Rk1tUHF3?=
 =?utf-8?B?RWpCS3MyYjZoYUs5WVFTbm5jYW0vcDBSdU1rZllmT3pWWTNoRHRXcDNGeWxY?=
 =?utf-8?B?RWVJSVh3MUJsNEwxTVZwcWdIWlNLWTE2aE54bVQ1NmtuVTdSUjlsdlpVd09L?=
 =?utf-8?B?UHlNVW5QYkpsOVNtRW1XN2tQNDFXcXNIWmlqeEtSMTJiUG4vZk9EcFF6Tmw5?=
 =?utf-8?Q?NYcIJCX9LgAuEE2RKveqcSDdYFFT4AYves5zHEGBhPPd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2fe6ea1-a783-4cf5-82d2-08dd81a7b02a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 14:12:17.2958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UA2xsOWjFraqMmo8zyLrnk0E0UrgD9OC4cIjq6K4IjIMZ67fc2k7IhIyagyEOO4AapPw11ZaEPqbFBt/rw5Qkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8822
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

Hi Danilo,

On Tue Apr 22, 2025 at 5:40 PM JST, Danilo Krummrich wrote:
> On Sun, Apr 20, 2025 at 09:19:32PM +0900, Alexandre Courbot wrote:
>> Hi everyone,
>>=20
>> This series is a continuation of my previous RFCs [1] to complete the
>> first step of GSP booting (running the FWSEC-FRTS firmware extracted
>> from the BIOS) on Ampere devices. While it is still far from bringing
>> the GPU into a state where it can do anything useful, it sets up the
>> basic layout of the driver upon which we can build in order to continue
>> with the next steps of GSP booting, as well as supporting more chipsets.
>>=20
>> Upon successful probe, the driver will display the range of the WPR2
>> region constructed by FWSEC-FRTS:
>>=20
>>   [   95.436000] NovaCore 0000:01:00.0: WPR2: 0xffc00000-0xffce0000
>>   [   95.436002] NovaCore 0000:01:00.0: GPU instance built
>>=20
>> This code is based on nova-next with the try_access_with patch [2].
>
> Please make sure to compile with CLIPPY=3D1, the series has quite some cl=
ippy
> warnings.

Indeed, I just tried and it wasn't pretty - sorry for the omission.

>
> I also noticed that there are a lot of compiler warnings about unreachabl=
e pub
> fields with rustc 1.78, whereas with the latest stable compiler there are=
 none.
>
> I'm not exactly sure why that is (and I haven't looked further), but the
> corresponding fields indeed seem to have unnecessary pub visibility.

I'll try building with 1.78 and fix that.

>
>> There is still a bit of unsafe code where it is not desired, notably to
>> transmute byte slices into types that implement FromBytes - this is
>> because support for doing such transmute operations safely are not in
>> the kernel crate yet.
>
> I assume you refer to [3]? As long as we put a TODO and follow up once th=
e
> series lands, that's fine for me.

Yes, that's the idea. Will do.

>
>>=20
>> [1] https://lore.kernel.org/rust-for-linux/20250320-nova_timer-v3-0-79aa=
2ad25a79@nvidia.com/
>> [2] https://lore.kernel.org/rust-for-linux/20250411-try_with-v4-0-f470ac=
79e2e2@nvidia.com/
> [3] https://lore.kernel.org/lkml/20250330234039.29814-1-christiansantosli=
ma21@gmail.com/

