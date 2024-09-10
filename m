Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F8397441F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 22:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214B210E917;
	Tue, 10 Sep 2024 20:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RdBIQe8v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBA510E917;
 Tue, 10 Sep 2024 20:37:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIQjcMUfADcbGvSxinr5Ut/JdvE+quqnD7+9byKSxkbgi8hNyGXLc8Q0R38ho4iRuh3xNQ7V6MbJCGpU61p6BCBJU6Xc1y4n6xFpE5B+83rOrEeVtFgLslkeijHAY+7NojW3AlaR2BEkn8hvTwrhXzJOyc7UtYFnsEWgjQJMpUetQQ3IixRo/7UlCp+KV+895McGmKmgzkElI9OxZ5S91rmW+uSHS1/tC3K6IgMhiLhAGK5uNKLS7lD+0szesc/j8SJXZg5eyCkExg1/ROZvBtxwgv/AYA5eUfqAyBAQd9QJE5hfHqJ/2avENPtvmcf4jSJa4VPHUQ0fVrz2rhBy8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3xg7fJn6GWprdPLI7eOHuOgiwqyfCb2PppytJGbdrU=;
 b=IakgIOsMwkb6nbp6RV8vCB+A7ZLwX9mnlzI3XVFUN7vZsS7Ko5VkgMV2qdczA2z7L/JKmC+xwDm0N/uYrnZkwfeRSIidjj3sS+cDTr7YIw8miwc4Z8z3nVgn2hwQV6hmVFfsZZwsGfYZHCgZCIMEu0BGQWZ6LVpkihg8RWFC9uz3J+I9+xduP9V1SxEKHY9VX7Xt+PrVKA0mzOsHWLJarVmo2bJwa88XLYwvKtJECynaKLssWNxcWkNUET6q50OQe/ckRi5dHDdEDnnLTNv/oCBGpO1bDl1TKd4KKXve3b5Jgjhez0wLNe+feXuDyXWB21R0lHxYOxEaka0fQ1fpsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3xg7fJn6GWprdPLI7eOHuOgiwqyfCb2PppytJGbdrU=;
 b=RdBIQe8vEKNbrvzeqwkDG2tzN2apXHrUudhz2hlk+Lj/ifX4jT2trPHE2FfUlZA2NtGaID22RP51TGjsHh4h/nvGaOBAk/8cRHdO3LiC9ZdCeKwKEmRNEwadkpc9s/cpWbEMEjPbFn26qRZqWOCw8ZrN2XRkctvBEEX1rouBvfX4R0SGwTU42cf13EsTREUxN+sXihHs3XjwA3xyvld8i+my2yXNpxDZ1Copzjoa4ZuKAfEX25ireoDTRC8aIBv4m/AtEkPHd20Y8HPYhzjpuYZIHKK3HKnIURcP3aje4rg7QNW9/hp0ffeAuiCA5j74vqWJ9mDHvd+MKJ98w1Z9Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7)
 by IA1PR12MB6162.namprd12.prod.outlook.com (2603:10b6:208:3ea::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 20:37:17 +0000
Received: from IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::d4cd:4112:1ce8:7f3d]) by IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::d4cd:4112:1ce8:7f3d%4]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 20:37:17 +0000
Date: Tue, 10 Sep 2024 15:37:14 -0500 (CDT)
From: Alex Goins <agoins@nvidia.com>
To: Harry Wentland <harry.wentland@amd.com>
cc: Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org, 
 Ville Syrjala <ville.syrjala@linux.intel.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Simon Ser <contact@emersion.fr>, Melissa Wen <mwen@igalia.com>, 
 =?ISO-8859-15?Q?Jonas_=C5dahl?= <jadahl@redhat.com>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 Shashank Sharma <shashank.sharma@amd.com>, 
 Joshua Ashton <joshua@froggi.es>, 
 =?ISO-8859-15?Q?Michel_D=E4nzer?= <mdaenzer@redhat.com>, 
 Aleix Pol <aleixpol@kde.org>, Victoria Brekenfeld <victoria@system76.com>, 
 Sima <daniel@ffwll.ch>, Uma Shankar <uma.shankar@intel.com>, 
 Naseer Ahmed <quic_naseer@quicinc.com>, 
 Christopher Braga <quic_cbraga@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Arthur Grillo <arthurgrillo@riseup.net>, Hector Martin <marcan@marcan.st>, 
 Liviu Dudau <Liviu.Dudau@arm.com>, 
 Sasha McIntosh <sashamcintosh@google.com>, 
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: Re: [PATCH v5 00/44] Color Pipeline API w/ VKMS
In-Reply-To: <07cfa0ee-9160-4a99-82dd-0a0b11af243f@amd.com>
Message-ID: <3a6a5a7e-ea86-74b6-788b-b7d76651fd8@nvidia.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
 <CAFZQkGzLjCOSPvk0kYYXyJm8E6Szdw9PJUcUQzew-EBfQjzz_g@mail.gmail.com>
 <07cfa0ee-9160-4a99-82dd-0a0b11af243f@amd.com>
X-NVConfidentiality: public
Content-Type: multipart/mixed;
 boundary="1372433909-882346267-1726000637=:424203"
X-ClientProxiedBy: SA1P222CA0197.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::6) To IA1PR12MB6604.namprd12.prod.outlook.com
 (2603:10b6:208:3a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6604:EE_|IA1PR12MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ce5b731-7683-432a-142b-08dcd1d85c5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGo0N2hCNm02MmZZcFN6N05VK04rSjNRRDZaOXUwamxKRWdDY011WkhUcjdr?=
 =?utf-8?B?UWJRaVF1YTJ3c0JlREVFNlY4UHNUUjUwOG1IY2R4UlBhTFRid3VWODZ0YXVS?=
 =?utf-8?B?OFhCT3p5Q0dWbFgrenNUNkp3UVRRZkF0Y2VUUlA3RnBOZVk1elFTMjZ2dEc0?=
 =?utf-8?B?NUQ5dWV3OHpIYk9vS1gyVlZxRnY2aDJHc0VRWXVuWEtFc2YzNExDTG12ZmVU?=
 =?utf-8?B?S1BQZjNveTNRVzNzbjJRNS93SlZXUHNoOUU2Z0ZWNmUwM0x4RWtOTlZsa3gx?=
 =?utf-8?B?ejhqeWwxRytKMndDTkcwYm56eTlKU01ZS0dha0ZxTWNnQWtiOHVONm5mbU02?=
 =?utf-8?B?OE5oODNwV1ZkVnY5clYwTUI2ME0zUGEvTjNkODFJcmx3bk84dDZINzNkWTZz?=
 =?utf-8?B?a3F3MnhHR1h4T3JvZjZ5b1Vna0NUd24yMitxMHo4YW1tc3R2bkp4OUR3Skl2?=
 =?utf-8?B?ZGV5Z29pdWxnVFJLQllMK0VPTGxiU0FUTXViamJ4Q1EvNzQzd3dnYmVLY002?=
 =?utf-8?B?MWpWcHJYaGg2amM2TmFsYS9xcVllbmpmYmhNeU5VNFBnZGtXWjFrMjd2cHdx?=
 =?utf-8?B?WldTVDVtYTNKajlKQmdLSEJpYXB3SzAyN1FoTHptNTFWUWRGWm5hNG8raURU?=
 =?utf-8?B?cDdOdGlwZ2RtU29xVmx2V3VHcnpsbnhGSFNpOUlHM3paaTI1M0xEcjEydlk1?=
 =?utf-8?B?Wjc2OHB4aFB4cy91Z05NVFdNdGw0b1lJTjAraWl0ZmN0anhRWnBjbUNKZy83?=
 =?utf-8?B?KzYwUytoRjdVTHBiNkRVR1ZwWExzQS81MHMwUFNJWTBFNlpnSGN6Z25GZmxt?=
 =?utf-8?B?ZzdZbS9QSXgxZTM2SS90SFQwbjFsY09aMFR1c1M2SExybmRBRjgvMEFwdFNa?=
 =?utf-8?B?cGJSVTJKY1FPZkRjUGdySEZzanJJQlgvQ3I3Qi9lb1c4M3BJT013YTVnN1VY?=
 =?utf-8?B?cFJBMnVWL1g1VkJOTFUxVnN2SXltQzk0M1QwT1p2QWR4Wlk3NWtMcis5dlpy?=
 =?utf-8?B?OHpENldmbDFsT0R1M0RPNzdZWGRTenNHaXpuWDgxNmxyU3hranYyViswR1lC?=
 =?utf-8?B?ZzdOL1pPeUQySU9rSnJhRFZwNStGcXI5cTl0bkxINktRQkZQZDZoZWRMWWFl?=
 =?utf-8?B?d1N1bW1Hc1hxRGM1TGhZNjVVQUNtNHQ2WnF0eHpEM0dhVkxDYlhDNTcyLzdr?=
 =?utf-8?B?cU5QZHlWRzZMbklQdFVwMld3Q2NtMVRBVTB1bkZhV2d2Nm54azdiVTNUVEtu?=
 =?utf-8?B?L0xOL0krVmtuZmhXdnJBdWZvRml1eVZkdkdDVXBpajZUajRxRjFvdjR2VjZu?=
 =?utf-8?B?RTFKZGRPTk1UMUdXWk1jTVlYZHFGYUtiaERMaVBaZEJKNElVRTRCRkNWUnhC?=
 =?utf-8?B?UUxMTTJEUkJrS1BwMGZYcHBuazlIbG1jWlVidFVSSzJNWVFXdnhXZ202T3Jw?=
 =?utf-8?B?UTRuUXJNTkt3S2IvVHpBcW1iQVFsUStwdWFTVnlTbXdtOTZBTTNONElQY0E3?=
 =?utf-8?B?bmhDTkdjQkhzbGhoSGlEbE10TnBZcGs0VllYWW1MSnJPV2w2bFRBcXdZUEh4?=
 =?utf-8?B?RU9RaXhXamV4ZHVadHoxaDNuaDB5eWp2eDBpMENIZ2hidTF2d0tqQmRac1RY?=
 =?utf-8?B?NEFRRFF2SVRjZCtHazZ5bUNjdkZIMWJjdnBNV3BnL2VoaEptRGtnb1ZFKy9L?=
 =?utf-8?B?cjZCUGZBc1FNZnhVQmJUZldhaXNobVJqV2xzUS9HTlRlRkFFeHZRN1JjUWpK?=
 =?utf-8?B?aktwVmxpd1NKKzNLVG00eTdoa0JYaHNPdjZpWjBZZVpYSUpuOWlFR3g4Yk9L?=
 =?utf-8?B?N1JBdEgrcjE1Tko4ZzBnQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6604.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTJOYzFOK0dBbXh2K1N2U2d1cVJyU04rc1YxNzBSZXVvS1FiaTBJTWxKZmpr?=
 =?utf-8?B?YVloUmQ3VDY1ZWphVGluRmUwQzBhTHEweFg5Y1NhK1I5Z1JqRm9pQWt2cTJ2?=
 =?utf-8?B?bU1xTklvREdjRUIvdmpDdnZGOWlONjFlRFBLb3ZIMUo2R0VTNllZclZWRjNm?=
 =?utf-8?B?VnhHTXI0Z25ZbFpncHNvY1Z1OFhDYjF2Y1pycDgvM3pqZXc4S284RTBHd3JW?=
 =?utf-8?B?MExIenhjbXNFSk9OMm9yelZFQ2N6a3hLWFFPVDFacXhMWENGYTl1WUlqZnph?=
 =?utf-8?B?dmtmdVFKVU1pdnZpL210cjFydjEvTkVlLzhGaHl3Zi9EOE0vdzIvRjFLdDJQ?=
 =?utf-8?B?aUpUYUpFalZRb0VVM3N1M3hON2hhR3BXVXFSVEozdkF2MXcrbWQvRHhkYkUw?=
 =?utf-8?B?MWRLaTB6R1Q2K0pGcDhqTGV5NUd3dWRneDd6OTdLNXozWFpIdXdtVVV4Yisy?=
 =?utf-8?B?M0lFYWc4cTVIdld3MDlHcUJBMG5xWlErTmxoelR5VCtxbXd0UHBWN09hUHB6?=
 =?utf-8?B?ZkZyVFNTc1VrUXNVRG9kcU42cVJEK0dUbWx2aGdaTTVVd052RCtnbzRGWTFX?=
 =?utf-8?B?b28wN3FPNlVScHZkd0xlMUJIQXMxK3hQalBBVTJEaExNdllNamcxakI2Wi9y?=
 =?utf-8?B?Sjh1V2E1WDVQOFVVYy9jc3grNDJISC9tRXRzWFE4OW1ncFdZT2NmSWttWHB3?=
 =?utf-8?B?QWlsZjh1enZ3ZytiTHc0dUZ0cDUyRzFCb1hLeU9tYWdsTElhbjdGQ2IvcHNK?=
 =?utf-8?B?LzJ5S05RSUJhM1ZXVUVNZFRpTEhwTytwamZBbGMzdEZJbEphaUVrUXg2ZjRp?=
 =?utf-8?B?R0VObmVKT1JnakFycUNYd3dYQTZnREtNL01GRGRJVm42Z1dkYVBtbFhIc1NR?=
 =?utf-8?B?QlJPRFZtUDdKMVp0M1BYQldFazUrbFdEdXZnUDFOM0N6d05XeWE4czBDS1pw?=
 =?utf-8?B?ZXEzNU9pTUtkSFl3TXhZUjd5TVcwUGtVR0x2Q0tuM29mcm11MHRYZXRmVFJI?=
 =?utf-8?B?ckVQWmRCQ25EaHNPT05URjVJT2wwVklEWnBabVFRRlZnT25EQzVrNkVCNk10?=
 =?utf-8?B?bVFVZG5Pem56dHlBTEpHL3hHNG83a1lCN1orU3plWGdNUC9nVzdubUMya0xj?=
 =?utf-8?B?RTJaL1lTRExWVzhUZW1OMmdVei9SQ1Z5TjF2MmREU3NtN20wZEgxaEt3ck1E?=
 =?utf-8?B?dVRjdkdDb1FTVnZ1dk4rZ0ZpTUkzZGdCcDZHQ3ZMVFVPL0RYTjRDNG1PNXEy?=
 =?utf-8?B?VVNFb2UrVThRUXQ1dFFsbGNQUE5tSm9lbWVOUVNsZE9aVWlwUXBDN1J5VEtY?=
 =?utf-8?B?VGlDeGNDY2tORGFoaGt2aVRQeThxUlNoYk5FUUdCb3Y2WlI0U2VhMlZTbFgw?=
 =?utf-8?B?amNJRkRiYlJpVSttOG16RlFUaTFKcVNnam5IS2ExVW8wZGF1MXB6eFd5Rjda?=
 =?utf-8?B?WS85QXozOVVoMzhudUZNUkNqQU1obiswTnBZRURkdjU0czQ4eWNtMTYvejRG?=
 =?utf-8?B?Y29xME9MVk5lOFBCZlptYnRJWGFnNndqeUVGOExHblhqNUlDMUZqS3dHRUI3?=
 =?utf-8?B?Nm1yK2c0UHFKenc2MHFJUTdNTDdnQUFzc0s2NlFCc1Q5SDd2K2pqanBzWUU0?=
 =?utf-8?B?MDFLS3A3SVM1Q3dGSE84WjdtbHFKUjZjbURhMHlBL2tUL2NzZFkrY1pHVllq?=
 =?utf-8?B?cTF5OGRyZlFKT1RtYXEvaGdGNFluTlFYN2FBckl6TTZ1cW4wN2VZbWJTVXBJ?=
 =?utf-8?B?aWh0MkRiams1ZkdNVStJTGEyT1I1RmdDUWFHVis3eEczSmo5a1FsOUJaM0Vy?=
 =?utf-8?B?NFU3YU9xRWpCQ0FzbzBEbFYxekhrZjVVSEc2QkhydHJ3enBzOHQ2OU5aQ1dB?=
 =?utf-8?B?Z2Q3bEkrMHc2Q0RIYUFGWlVHeEJmMEJ2OUVHZ05nUHRvVjNNVE1ydGZjTTYy?=
 =?utf-8?B?Q2x5RjFQL0lNRytvbmpDZnA4RWVXbkRXd1kyVHprYU1pZmNEYXZLU1RubEpv?=
 =?utf-8?B?aGJqdklFdUZkcjVpVFNlYWFMTStuanZBc3NnN1ViMlRnY3VoeTlDMEh4dHhp?=
 =?utf-8?B?aEh2K3I1eVBoZTlLNS9lVmZobjNkS3NDeUJhUEpSdWZvKzYxb3RxckNaQzB6?=
 =?utf-8?Q?ufXUg0EhphCcGWlmxRxAZKEnO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce5b731-7683-432a-142b-08dcd1d85c5d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6604.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 20:37:17.4570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p75qWrosfBjz9UQ6rhx7dseUl9dco148uYbK47/IlEqB2qOxibWCpIKr3dgoVB5UZdNs+FEXjJsFWVBisexQiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6162
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

--1372433909-882346267-1726000637=:424203
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hi Harry,

Thanks for this. I just want to remind about a few things that would be required
for NVIDIA hardware, as discussed at the Display Next Hackfest -- fully
understand that they aren't currently included in this series because they
aren't required on AMD hardware. Allowing color ops to be non-bypassable is a
big improvement in this direction.

In each of these cases, it should be possible to represent NVIDIA's color
pipeline using the existing color ops, but it would rely on rejecting invalid
configurations in atomic check, with no way to communicate the limitations to
clients.

- Tag IN_FORMATS for a color pipeline (as you have mentioned).
    + Required to communicate that the first NVIDIA pre-blending LUT is
      incompatible with FP16 inputs.

- Introduce a single-channel 1DLUT color op, or add the ability to flag
  individual channels of an ordinary 1DLUT as read-only.
    + Required to handle NVIDIA's 1D tone-mapping LUT designed to operate only
      on the intensity component of ICtCp.
  
- Allow marking color ops as read-only and non-bypassable (halfway there)
  and/or allow marking a color op as requiring a modeset to update.
    + Required to handle specific LUTs that can't have their entries changed
      while in use without visible glitches/tearing, yet must be enabled to
      support tone-mapping and pre-blend scaling.
    + In lieu of the first option, it may be suitable to just use the existing
      1D curve colorop with only a single curve supported, marked as
      non-bypassable. Allowing modesets as in the second option would allow for
      the possibility of selecting different curves, however.

Thanks,
Alex Goins
NVIDIA

On Mon, 9 Sep 2024, Harry Wentland wrote:

> External email: Use caution opening links or attachments
> 
> 
> On 2024-08-29 10:55, Xaver Hugl wrote:
> > Hi,
> >
> > I have a WIP implementation of this for KWin at
> > https://invent.kde.org/plasma/kwin/-/commits/work/zamundaaa/drm-colorop.
> > It maps KWin's color pipeline to the drm one to get (primary plane
> > only, for now) direct scanout of HDR content on SDR displays while
> > doing tone mapping (or SDR on HDR, but that's been possible before).
> > It currently uses the two 1D custom luts and the 3D lut for this; once
> > I add support for named 1D curves, it should also make use of that and
> > the matrix. I haven't tested the Intel version yet, but if it can
> > match the pipeline, it should work the same there.
> >
> > In testing your amd-color-pipeline-v5 branch I get two crashes in the
> > kernel though: https://invent.kde.org/-/snippets/3217
> > The null pointer dereference only happens sometimes, seemingly
> > randomly, but if I make KWin generate new blobs each frame, I can 100%
> > reliably reproduce the list_add corruption problem by just opening
> > glxgears in fullscreen while the color profile of the display is set
> > to "built in" (which makes it use the 3D LUT for gamut mapping).
> > Here's a branch that generates the color pipeline each frame and
> > triggers this: https://invent.kde.org/plasma/kwin/-/commits/work/zamundaaa/drm-colorop-list-add-corruption
> >
> 
> Thanks for the test branch. Got a repro and will investigate.
> 
> Harry
> 
> >
> >
> > Am Mo., 19. Aug. 2024 um 22:57 Uhr schrieb Harry Wentland
> > <harry.wentland@amd.com>:
> >>
> >> This is an RFC set for a color pipeline API, along with implementations
> >> in VKMS and amdgpu. It is tested with a set of IGT tests that can be
> >> found at [1]. The IGT tests run a pixel-by-pixel comparison with an
> >> allowable delta variation as the goal for these transformations is
> >> perceptual correctness, not complete pixel accuracy.
> >>
> >> v5 of this patchset fleshed out documentation for colorops and the
> >> various defines that are being introduced.
> >>
> >> VKMS supports two named transfer function colorops and two matrix
> >> colorops.
> >>
> >> Amdgpu advertises the following pipeline for GPUs with DCN 3 or newer:
> >>
> >> 1. 1D Curve EOTF
> >> 2. 3x4 CTM
> >> 3. Multiplier
> >> 4. 1D Curve Inverse EOTF
> >> 5. 1D LUT
> >> 6. 3D LUT
> >> 7. 1D Curve EOTF
> >> 8. 1D LUT
> >>
> >> The supported curves for the 1D Curve type are:
> >> - sRGB EOTF and its inverse
> >> - PQ EOTF, scaled to [0.0, 125.0] and its inverse
> >> - BT.2020/BT.709 OETF and its inverse
> >>
> >> Note that the 1st and 5th colorops take the EOTF or Inverse
> >> OETF while the 3rd colorop takes the Inverse EOTF or OETF.
> >>
> >> The 3D LUT is a 17^3 tetrahedrally interpolated LUT but the mechanism
> >> exists for other drivers to describe their own 3D LUT capability.
> >>
> >> This mirrors the color pipeline used by gamescope and presented by
> >> Melissa Wen, with the exception of the DEGAM LUT, which is not currently
> >> used. See [1]
> >> https://indico.freedesktop.org/event/4/contributions/186/attachments/138/218/xdc2023-TheRainbowTreasureMap-MelissaWen.pdf
> >>
> >> At this point we're hoping to see gamescope and kwin implementations
> >> take shape. The existing pipeline should be enough to satisfy the
> >> gamescope use-cases on the drm_plane.
> >>
> >> In order to support YUV we'll need to add COLOR_ENCODING and COLOR_RANGE
> >> support to the color pipeline. I have sketched these out already but
> >> don't have it all hooked up yet. This should not hinder adoption of this
> >> API for gaming use-cases.
> >>
> >> We'll also want to advertise IN_FORMATS on a color pipeline as some
> >> color pipelines won't be able to work for all IN_FORMATS on a plane.
> >> Again, I have a sketch but no full implementation yet. This is not
> >> currently required by the AMD color pipeline and could be added after
> >> the merge of this set.
> >>
> >> VKMS patches could still be improved in a few ways, though the
> >> payoff might be limited and I would rather focus on other work
> >> at the moment. The most obvious thing to improve would be to
> >> eliminate the hard-coded LUTs for identity, and sRGB, and replace
> >> them with fixed-point math instead.
> >>
> >> There are plenty of things that I would like to see, but they could
> >> be added after the merge of this patchset:
> >>  - COLOR_ENCODING and COLOR_RANGE
> >>  - IN_FORMATS for a color pipeline
> >>  - Is it possible to support HW which can't bypass entire pipeline?
> >>  - Can we do a LOAD / COMMIT model for LUTs (and other properties)?
> >>  - read-only scaling colorop which defines scaling taps and position
> >>  - named matrices, for things like converting YUV to RGB
> >>  - Add custom LUT colorops to VKMS
> >>
> >> IGT tests can be found at [1] or on the igt-dev mailing list.
> >>
> >> A kernel branch can be found at [2].
> >>
> >> I've also rebased Uma and Chaitanya's patches for the Intel color
> >> pipeline on top of this to show how I envision them to mesh with
> >> my changes. The relevant branches can be found at [3] for the kernel
> >> and [4] for IGT. There were some rebase conflicts in i915 and I'm
> >> not entirely sure I've resolved all of them correctly, but the branch
> >> compiles and shows my thoughts for the new DRM concepts to support
> >> Intel's pipeline.
> >>
> >> [1] https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/amd-color-pipeline-v5
> >> [2] https://gitlab.freedesktop.org/hwentland/linux/-/tree/amd-color-pipeline-v5
> >> [3] https://gitlab.freedesktop.org/hwentland/linux/-/tree/amd-intel-color-pipeline-v5
> >> [4] https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/amd-intel-color-pipeline-v5
> >>
> >>
> >> v5:
> >>  - amdgpu 3D LUT
> >>  - Don't require BYPASS
> >>  - update RFC docs and add to TOC tree
> >>  - add drm_colorop and COLOR_PIPELINE kernel docs (non-RFC)
> >>  - add amdgpu color pipeline doc
> >>  - define SIZE property similar to drm_crtc's GAMMA_SIZE
> >>  - various minor fixes and cleanups
> >>
> >> v4:
> >>  - Add amdgpu color pipeline (WIP)
> >>  - Don't block setting of deprecated properties, instead pass client cap
> >>    to atomic check so drivers can ignore these props
> >>  - Drop IOCTL definitions (Pekka)
> >>  - Use enum property for colorop TYPE (Pekka)
> >>  - A few cleanups to the docs (Pekka)
> >>  - Rework the TYPE enum to name relation to avoid code duplication (Pekka)
> >>  - Add missing function declarations (Chaitanya Kumar Borah)
> >>  - Allow setting of NEXT property to NULL in _set_ function (Chaitanya Kumar Borah)
> >>  - Add helper for creation of pipeline drm_plane property (Pekka)
> >>  - Always create Bypass pipeline (Pekka)
> >>  - A bunch of changes to VKMS kunit tests (Pekka)
> >>  - Fix index in CTM doc (Pekka)
> >>
> >> v3:
> >>  - Abandon IOCTLs and discover colorops as clients iterate the pipeline
> >>  - Remove need for libdrm
> >>  - Add color_pipeline client cap and make mutually exclusive with
> >>    COLOR_RANGE and COLOR_ENCODING properties
> >>  - add CTM colorop to VKMS
> >>  - Use include way for kunit testing static functions (Arthur)
> >>  - Make TYPE a range property
> >>  - Move enum drm_colorop_type to uapi header
> >>  - and a bunch of smaller bits that are highlighted in the relevant commit
> >>    description
> >>
> >> v2:
> >>  - Rebased on drm-misc-next
> >>  - Introduce a VKMS Kunit so we can test LUT functionality in vkms_composer
> >>  - Incorporate feedback in color_pipeline.rst doc
> >>  - Add support for sRGB inverse EOTF
> >>  - Add 2nd enumerated TF colorop to VKMS
> >>  - Fix LUTs and some issues with applying LUTs in VKMS
> >>
> >> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> >> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> >> Cc: Simon Ser <contact@emersion.fr>
> >> Cc: Harry Wentland <harry.wentland@amd.com>
> >> Cc: Melissa Wen <mwen@igalia.com>
> >> Cc: Jonas Ådahl <jadahl@redhat.com>
> >> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> >> Cc: Shashank Sharma <shashank.sharma@amd.com>
> >> Cc: Alexander Goins <agoins@nvidia.com>
> >> Cc: Joshua Ashton <joshua@froggi.es>
> >> Cc: Michel Dänzer <mdaenzer@redhat.com>
> >> Cc: Aleix Pol <aleixpol@kde.org>
> >> Cc: Xaver Hugl <xaver.hugl@gmail.com>
> >> Cc: Victoria Brekenfeld <victoria@system76.com>
> >> Cc: Sima <daniel@ffwll.ch>
> >> Cc: Uma Shankar <uma.shankar@intel.com>
> >> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
> >> Cc: Christopher Braga <quic_cbraga@quicinc.com>
> >> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> Cc: Arthur Grillo <arthurgrillo@riseup.net>
> >> Cc: Hector Martin <marcan@marcan.st>
> >> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
> >> Cc: Sasha McIntosh <sashamcintosh@google.com>
> >> Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> >>
> >> Alex Hung (13):
> >>   drm/colorop: define a new macro for_each_new_colorop_in_state
> >>   drm/amd/display: Skip color pipeline initialization for cursor plane
> >>   drm/amd/display: Add support for sRGB EOTF in DEGAM block
> >>   drm/amd/display: Add support for sRGB Inverse EOTF in SHAPER block
> >>   drm/amd/display: Add support for sRGB EOTF in BLND block
> >>   drm/colorop: Add 1D Curve Custom LUT type
> >>   drm/amd/display: add shaper and blend colorops for 1D Curve Custom LUT
> >>   drm/amd/display: add 3x4 matrix colorop
> >>   drm/colorop: Add mutliplier type
> >>   drm/amd/display: add multiplier colorop
> >>   drm/amd/display: Swap matrix and multiplier
> >>   drm/colorop: Add 3D LUT supports to color pipeline
> >>   drm/amd/display: add 3D LUT colorop
> >>
> >> Harry Wentland (31):
> >>   drm: Add helper for conversion from signed-magnitude
> >>   drm/vkms: Round fixp2int conversion in lerp_u16
> >>   drm/vkms: Add kunit tests for VKMS LUT handling
> >>   drm/doc/rfc: Describe why prescriptive color pipeline is needed
> >>   drm/colorop: Introduce new drm_colorop mode object
> >>   drm/colorop: Add TYPE property
> >>   drm/colorop: Add 1D Curve subtype
> >>   Documentation/gpu: document drm_colorop
> >>   drm/colorop: Add BYPASS property
> >>   drm/colorop: Add NEXT property
> >>   drm/colorop: Add atomic state print for drm_colorop
> >>   drm/plane: Add COLOR PIPELINE property
> >>   drm/colorop: Add NEXT to colorop state print
> >>   drm/vkms: Add enumerated 1D curve colorop
> >>   drm/vkms: Add kunit tests for linear and sRGB LUTs
> >>   drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
> >>   drm/colorop: Add 3x4 CTM type
> >>   drm/vkms: Use s32 for internal color pipeline precision
> >>   drm/vkms: add 3x4 matrix in color pipeline
> >>   drm/tests: Add a few tests around drm_fixed.h
> >>   drm/vkms: Add tests for CTM handling
> >>   drm/colorop: pass plane_color_pipeline client cap to atomic check
> >>   drm/amd/display: Ignore deprecated props when plane_color_pipeline set
> >>   drm/amd/display: Add bypass COLOR PIPELINE
> >>   drm/colorop: Add PQ 125 EOTF and its inverse
> >>   drm/amd/display: Enable support for PQ 125 EOTF and Inverse
> >>   drm/colorop: add BT2020/BT709 OETF and Inverse OETF
> >>   drm/amd/display: Add support for BT.709 and BT.2020 TFs
> >>   drm/colorop: Define LUT_1D interpolation
> >>   drm/colorop: allow non-bypass colorops
> >>   drm/amd/display: Add AMD color pipeline doc
> >>
> >>  Documentation/gpu/drm-kms.rst                 |  15 +
> >>  Documentation/gpu/rfc/color_pipeline.rst      | 376 ++++++++
> >>  Documentation/gpu/rfc/index.rst               |   3 +
> >>  drivers/gpu/drm/Makefile                      |   1 +
> >>  .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
> >>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +
> >>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 581 ++++++++++++-
> >>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 196 +++++
> >>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
> >>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  32 +
> >>  drivers/gpu/drm/drm_atomic.c                  | 184 +++-
> >>  drivers/gpu/drm/drm_atomic_helper.c           |  12 +
> >>  drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
> >>  drivers/gpu/drm/drm_atomic_uapi.c             | 175 ++++
> >>  drivers/gpu/drm/drm_colorop.c                 | 562 ++++++++++++
> >>  drivers/gpu/drm/drm_ioctl.c                   |   7 +
> >>  drivers/gpu/drm/drm_mode_config.c             |   7 +
> >>  drivers/gpu/drm/drm_plane.c                   |  52 ++
> >>  drivers/gpu/drm/tests/Makefile                |   3 +-
> >>  drivers/gpu/drm/tests/drm_fixp_test.c         |  69 ++
> >>  drivers/gpu/drm/vkms/Kconfig                  |   5 +
> >>  drivers/gpu/drm/vkms/Makefile                 |   4 +-
> >>  drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
> >>  drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 449 ++++++++++
> >>  drivers/gpu/drm/vkms/vkms_colorop.c           | 102 +++
> >>  drivers/gpu/drm/vkms/vkms_composer.c          | 115 ++-
> >>  drivers/gpu/drm/vkms/vkms_drv.h               |   8 +
> >>  drivers/gpu/drm/vkms/vkms_luts.c              | 802 ++++++++++++++++++
> >>  drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
> >>  drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
> >>  include/drm/drm_atomic.h                      | 130 +++
> >>  include/drm/drm_atomic_uapi.h                 |   3 +
> >>  include/drm/drm_colorop.h                     | 427 ++++++++++
> >>  include/drm/drm_file.h                        |   7 +
> >>  include/drm/drm_fixed.h                       |  18 +
> >>  include/drm/drm_mode_config.h                 |  18 +
> >>  include/drm/drm_plane.h                       |  19 +
> >>  include/uapi/drm/amdgpu_drm.h                 |   9 -
> >>  include/uapi/drm/drm.h                        |  16 +
> >>  include/uapi/drm/drm_mode.h                   | 156 ++++
> >>  40 files changed, 4595 insertions(+), 34 deletions(-)
> >>  create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
> >>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> >>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
> >>  create mode 100644 drivers/gpu/drm/drm_colorop.c
> >>  create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
> >>  create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
> >>  create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
> >>  create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
> >>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
> >>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
> >>  create mode 100644 include/drm/drm_colorop.h
> >>
> >> --
> >> 2.46.0
> >>
> 
> 
--1372433909-882346267-1726000637=:424203--
