Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F56ACD078
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 02:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D9A10E628;
	Wed,  4 Jun 2025 00:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="A0ecVM5w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FFC10E610;
 Wed,  4 Jun 2025 00:05:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ueO4h2AJnJJ1U2gjw07XkH6/Se0LCQe8ztfZunMtq8S/kAIkVesQWa5/bvl5HOOksT+jgzFOKE9EfQsJ9I6Jz1haKvj0boFGsCzp2Bih9/YBydRm8R7fRnBzoT20Y9IaeoDOhqsXTs8myn+WnAFm2x1UY+5S6PwCn1qSQPksjuUcSUTO2lyLdZsfqO77V7UTJh4wq8Xpy47p1KyOea6ce7+YABCvDleyQxrsFb2P0E2+bK6lnDtRs0e92GvWFQxOxhx2YjIsJmvN9Hxrzuu4IHXidwMKcdMtpu2ComasKW/Xar+/BPdJmuApA3etOhPw+NQTuKb8z+z5D6GLlY+FoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3TQlKCmmaR3pyD3eUhRtgvBdFeWGK0VaFKPIqLOJsI=;
 b=b6CPNGv/2Q0cqLh5aqcbyNSuervoaxOkZ7H++sNq558bF3J7zR7Sf6JcUhEbqw0AaK37g9M4M1VfzyQoDt+yskAQJRAL0vOuVkHehe/blDdBVUCPqid8mctaUgWRYDvUnFZSSDomG+VdysBiozhjPp59NWrvxU/Xw2JXsw1uGV0eGp4/6dEmuK+k2p1mCO5zBBm9xY6BNbpvgs+1pad+R5Z9dBdT1t4QhOoP7jvVjaZMsy9Bux1GMCJq/vqcLJY5eOpAq8nBl3PgqQg1vYsCyr2rhj6QmjYYTCIjq1sbaXEr+dv46g9iferUurZIb9itP62LRvCKCuf3iYRbD3NPsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3TQlKCmmaR3pyD3eUhRtgvBdFeWGK0VaFKPIqLOJsI=;
 b=A0ecVM5wREq126mWypoGsK4rzgBzbsy8JXMxEMiacy/tocvgROYfUUn2w4bU/OlpvGfc+/rdYU/PF0hfod8maVSRowQsRKStBJOxEnEdFbIpq1LqqANb5PLmdfWLOvFdzw7S76jaTFLu9oFpxklwhAb7dGC6bYLZxqSf2nLFpo2nQvy/1NC3vvBaUf2x/M8nYP82kkDCxZrBk4G8qQvJT7iDTffA6tkkfWn37TBSyGbmA/beZ1egQMhPWxDz22J0dLDVGsBJOIYyE7l8kDMKhBSW9BoRKix6YTt8c3AfWNpFo6FSWuEsdCdlARncTxZZsE5nFwi5pSTLTG/9zMLVzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB7248.namprd12.prod.outlook.com (2603:10b6:806:2be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Wed, 4 Jun
 2025 00:05:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 00:05:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 09:05:34 +0900
Message-Id: <DADB6892Z31G.12LB1BVSGTEAQ@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 04/20] rust: add new `num` module with useful integer
 operations
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Benno Lossin" <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
 <DA82KFLNAOG7.R7YT4BHCLNZQ@kernel.org>
 <DA88YHU4AZT7.B8JGZHW9P9L9@nvidia.com>
 <DA8GTD7LT7KO.1A3LBQGEQTCEW@kernel.org>
 <DAC2L6ZKR6U2.WOMERUJIOENK@nvidia.com>
 <DAD9TNUBUGPN.1ED519FYR29U4@kernel.org>
In-Reply-To: <DAD9TNUBUGPN.1ED519FYR29U4@kernel.org>
X-ClientProxiedBy: PN4PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26d::12) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB7248:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f26421d-099d-4bab-9f2f-08dda2fb8a5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TitHQ3JVcVJUQU83UmRyeVdTdDltVUhLcEdIMDVrQnJ6b1FjL0tVeHVnRjZH?=
 =?utf-8?B?SU5SREZJU3ZVcVQ2RTQ0ZU04bkNaTWJlMmEySVFsUU9XY2pmWUtEQnJiQmFp?=
 =?utf-8?B?N09WRTVuSVVObFpaOHdFZlM1M2pjb05DZlgzU2pzSzFoNDJDVlM5OGduWS9l?=
 =?utf-8?B?d05ZQmQxRnlPNGZGUTVqbzZCTzIxcU5mQnhPQlFpNDllMm1PdEhqYmZLY2Jh?=
 =?utf-8?B?SE90cVNMVjNjcjVjS0FKaEsxR3dZek9JVWExNXRoTjFYNm56aTZ3UHpMM25y?=
 =?utf-8?B?aTU5ZEF6Uk9TbkRsZW9peUxlQ2V4ZWVMZktCREREUDdyWEYzcUFUQ3BzS0ZP?=
 =?utf-8?B?YjBzNTBnbVlRbkEwWnA5R0VjM05ld05PQW82c0F3dktyQzFtV0NVM09hL3Jt?=
 =?utf-8?B?SW1keTZhalpHWG5tSTFUbUFJa2sxVGluQUo0N3VLSVZrbE5GcWNRNnp1K0F2?=
 =?utf-8?B?RWExZ3l3N0RET3ZzbzBPbzJYVkFHSnRtSWlpczEwVTRKOWlQRGdaWDdYVEJs?=
 =?utf-8?B?MitCb0sxakM0bDVjM2RTTDBKMlV0Rlk5VTgveDk4NjUvanpmc00xUzJybjg3?=
 =?utf-8?B?bW5YL25NUzRrd2JidncrWk9QV1p1TURjcFo4TXNieEtSakV2eTRRTGJ5WXNS?=
 =?utf-8?B?YnAzdFZjWXBHdk1DcTUvUkRWUWZlbk1rNVNhVkhyWVluNjFKeGZHcW1xY2Yw?=
 =?utf-8?B?SS8vTXVORWxoZnpWNENCcXdkNTBvZWlYNlFWYTg5MEVHWGRCdTNCSTQ0R3Zk?=
 =?utf-8?B?RjJ2dlFwTTNJVVZiSDcvV2U3VllzVUlCVUNBOXZ1LzIvMDl3UHFmVTVYbUZV?=
 =?utf-8?B?RmsveTQ2eFNUK3JkckRzeEoxRmpuMWZURHllejJqNTFBd0p5bkJOaDZUZ2tK?=
 =?utf-8?B?U1M0Rm44UHNZWFM0amU1eU04S0Z1N0R3QmxaVHN1bXdVUFJZOEhGV0JYUi9Y?=
 =?utf-8?B?ZzlsYTd5b1kwS0pnb05DUTZGYVBEdVpqcGFWNElOUmlsa0lodjY2ekpkWWFP?=
 =?utf-8?B?aWswUWpLeE5YdFp2aTFhZ3B4TTNoRCt6THN4SFpEd3VDcWh4K25nMFNMbDdX?=
 =?utf-8?B?dE5lSnBIM2hJaUJEeEdyWXMvZXozNnIvTE9QV3ZnSGo4Y0FnbDVHdGhKZW9i?=
 =?utf-8?B?WjVNeWxsVkFUZjd5RFVweUc1TEI1R2xUT2dDeG1xVmZKdmtOMkxxcnRNMDhl?=
 =?utf-8?B?RUZkWEliQ3ZrRDE2M2dhemNQWkgveTBLNkFvNHpsbisvZjBONmhlK1E3V1NL?=
 =?utf-8?B?c0xvRjRIalVXbHNwaDJ1NWd4T2JnYWozc01jYnN6TXQxUWFtUytZZWRabUNx?=
 =?utf-8?B?M256b2ZvTTZhMDc4MndtYzNCS2pNcFQwYWRBbFZHL0NmOEpES2RYNTRYQ3lW?=
 =?utf-8?B?QVNWZFBmTkwxVGh3a0dHWURtaXByVGJackRGL3FtN0tmdktoZDFBUWFpNFk4?=
 =?utf-8?B?aWM4cWllSVJXWUtCU3VYQkREZzE1RHE1bCsvNzd1M0lCQUVTempuTDBVUFVB?=
 =?utf-8?B?NWlHZTlYMnhaQlNxeFRqN213V3pOV0V1STNYRTdBSG1xaEFvZ0dYclM3bVhL?=
 =?utf-8?B?RGJzcDJpa2swUlB5cHZJYllneWc2amQ4L1FITWFFeUMxbHowL1dwK21mcFRp?=
 =?utf-8?B?b3RkdGg3T1pWaktjRitNZnpkTzVyd3RLekFOMlRFL2RGQ2VubFA5dGxMWDlF?=
 =?utf-8?B?YlNEeEY3Q2lYTnZqLzhRbVBNbllORUlGV3BxWHdRK3hLSmNUSVo0cnV4SGF2?=
 =?utf-8?B?UHZXWG0weDl0UnN2L3JhN3ZiYjdtVjhGR3RxM3U5V01SdWJrVXBMSU1PTjNH?=
 =?utf-8?B?YXpFckVLMXZabDJLRy8ycldwa015MTRUQlczVGY2alVNemFMZVZRKzRnSmow?=
 =?utf-8?B?dlJMRG9kTHNtTnFrSno4aUhlUUgyL2NjZnQzdUhhNk5hcyt3NG1NNlNJVkRY?=
 =?utf-8?B?YlJnZUs2R0N5QkowRFl0NUhXM3l6MUJQR0Q3OWFDbklCQ20ydGxyT1pGaFlW?=
 =?utf-8?B?a05YdHVVS0pRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NE96ZUhxUDBURXVhUFZFOWx1OWVNeUtlaW4raHFBSGlzejQrMWZsWkpsQ082?=
 =?utf-8?B?WFpIVC92R0Q1YWJ3SDZxd29qMmovK2ozS3M0L3RRY3ZJTWE5Zi9UbERCTnd5?=
 =?utf-8?B?LzZNdllhL2xibktCQjgwdkw1TzFjR2ZWK1IvMENtaGVmcWZBcGFkbUNSMkl5?=
 =?utf-8?B?ZXZKQ0YzUE12TkZtTVVCaGJOZ1FKY3JBTUxxUTV2N0ZOL0RXckFialZXMDFj?=
 =?utf-8?B?RGZVTWp2b2hOTkJPdW9Zd2FkYWZBSlVmQ2REcE9lKzNzbDNWTTlUZzV0cUYx?=
 =?utf-8?B?WnJoeG9xZ1N3ZVNvNWowZ25lL3ZOODArRW1xVGNHenNNS3RZbUZVbWJxTzZq?=
 =?utf-8?B?SUlHMFJDNytaKzJ1aXlXRlBpYjFzMjJpWnMzdnovVVl1WGdqdzdNM01meTdw?=
 =?utf-8?B?c01DRWgvTnlGa3d1TEI5YUtyUExwVG5kcGxxVUFnS21rb1o0VVExV0ZjaEhG?=
 =?utf-8?B?S01uZGhodTd5RXNSOGRUeUhoOUI0dVJDWTk4ak5Sa0xiNXRrWWFULzYwOXVw?=
 =?utf-8?B?QXZ5L1NQQ2dhYlpBMmdCVURlaFBGbko2OVYwV0tIODZPWkFxR1F2QXd0TlJC?=
 =?utf-8?B?RkZUY0FMK3V0MVBPcVJwMXI0WmVjVmQ4UTB5MU54NVU1cXRiUFg4TlNXejFD?=
 =?utf-8?B?NUE2dG82OFViMC93RzJ1b0FDR0dNSUpDQ1pBVCtPQXB6d01aV0t0YytCZlRj?=
 =?utf-8?B?K0dZRE40akpHdTlpS0FRZHVSRjczLzFuaW55cEhmcmpoV3dtUWh1ZEIwd2py?=
 =?utf-8?B?djhacUhrNy9kV1JsT1pGaTVRVkFLUGJ5UnRaZFNyOEVxQ0tvSHkrWFlZd25U?=
 =?utf-8?B?S204MDRad0hGU3ZtSnB1VTJpSC8zTVVna0h2TzdPVEZid3NXN2ZkMmZubXJa?=
 =?utf-8?B?MlZBOFlWZno0V3hyOTh3U0VvbW5TblVRWnkxVVlCbUZzbEZrcmRjMmVBb3c1?=
 =?utf-8?B?U091WTNoWFNLNjJyNnh6WHZvdEh6M3lRdFNENlNESDVEcVhMeG9PSUJiTUUw?=
 =?utf-8?B?Uk1XSkVDejdwLzZkSXBVY2Y3Sk5VVmQ3TXY4c0c4aXhwa1lZMlFieS9MbUVR?=
 =?utf-8?B?QTBpRmhwdzlaM0tpdXlhQVEyNXVIZ3pxSnJmeUE5VlBkNmJONWNXSm5adnkv?=
 =?utf-8?B?OVNYZ1pxU09aRVdsc2E4MjFrQk5TeW9lQkQ5dEYvZ0dVbGFFQWJpU1cwWXhw?=
 =?utf-8?B?K2VQSUNGNWh3b0JiNWQ1QjJBMXVGbysvU1NwTzZ5NHZtbGhsQS8zbzZvRENr?=
 =?utf-8?B?cVpPazJSTlByMjZUNUFtMnNWYU5PYi8rZGJDdXN4dGhTNlU5RlRSdFBhZllt?=
 =?utf-8?B?aGRXYXg3RnJMenRHTzFQRUFVVHJYTWJhUnJYMXVmcExjZDh4Z0Vqb1JBd3RI?=
 =?utf-8?B?QlpLVW5tVm9yUW43KytwUDM2UkpCT25pZU54c1lCaVlKSlJFNlh1OWw0bDhQ?=
 =?utf-8?B?OVRjTUdNZzEwQ1A5dnVSaDdNMndlYXhORUJDY21wQ05XeFY1SXBGalVmbUsw?=
 =?utf-8?B?d2FEclpGYUNYL1BzYVpraE1QdndySkM3cmtVQ1Ixdis0RVFsMmNoclBYK2ZR?=
 =?utf-8?B?TjF1YW1HU0p0M212N1hBOEVyVUdhcFZVd1hNQ0tvaEplZDZocEtnOGsvSksw?=
 =?utf-8?B?cjE0cnlKbXBFUmtsa3hQeUlqVHNBRGx0WXVMb3VTNytHL0dRSlkwdzQ1bnFn?=
 =?utf-8?B?eGExaDVxY29QODY5WXVZSXM2S2MvL0JVaDAvT0Mrb1AvcDFPdmVPT1RxMURl?=
 =?utf-8?B?bVdGSy9wQnRObkpwWXowa3Y4NUJ4dzVFdk0yVy9qb2pjQVpEQlR5NnpIVnFN?=
 =?utf-8?B?TEpwZldXRFBmK2lPODF2ZkhzQzVzOXVJL1RUWWZXOFdBYWUxSWg3Rm9vRTFM?=
 =?utf-8?B?ZVlOQTVpQlBPVHRuWm1qK0hXcWdKbjZQcnNBZmlYbjNJRFBVcU4wMjVkVVFI?=
 =?utf-8?B?UFhtMk8zdHdwL3A3cjBoNmZ3bnRlSGE4eGtZMWc3OEVYaFBSUndXRCtLUzBj?=
 =?utf-8?B?WDl1b1NPZ0F2QXJHZVljT09FYUx3bHBneHkzNjAyalJjMjgvdkZVcnQrNjls?=
 =?utf-8?B?YVEwb1o2WnB1U21zV2ZRazR2WW5UR0lvRWEwQ3pkZUUxQlNhNi9lci9lTEkx?=
 =?utf-8?B?VHlGSHcyRmpFb2x2bm12alMvSm1pZjNhNVd0WWs2cEdGUkNXSUJYT0xCeDUy?=
 =?utf-8?Q?4rBb5J3ZSwRNLBHS1S2wsUzPBGD7SdRYvjJpt59BYMrY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f26421d-099d-4bab-9f2f-08dda2fb8a5e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 00:05:40.3822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UU+DYIk0mm3oSh6vFv89PngFHQAhBjv9/VOtWKzvj5eed5lA+95VGkDvUM+bTRNQwRxPt3u+ISqpDVqmPaBi8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7248
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

On Wed Jun 4, 2025 at 8:02 AM JST, Benno Lossin wrote:
> On Mon Jun 2, 2025 at 3:09 PM CEST, Alexandre Courbot wrote:
>> On Thu May 29, 2025 at 4:27 PM JST, Benno Lossin wrote:
>>> On Thu May 29, 2025 at 3:18 AM CEST, Alexandre Courbot wrote:
>>>> On Thu May 29, 2025 at 5:17 AM JST, Benno Lossin wrote:
>>>>> On Wed May 21, 2025 at 8:44 AM CEST, Alexandre Courbot wrote:
>>>>>> +    /// Align `self` up to `alignment`.
>>>>>> +    ///
>>>>>> +    /// `alignment` must be a power of 2 for accurate results.
>>>>>> +    ///
>>>>>> +    /// Wraps around to `0` if the requested alignment pushes the r=
esult above the type's limits.
>>>>>> +    ///
>>>>>> +    /// # Examples
>>>>>> +    ///
>>>>>> +    /// ```
>>>>>> +    /// use kernel::num::NumExt;
>>>>>> +    ///
>>>>>> +    /// assert_eq!(0x4fffu32.align_up(0x1000), 0x5000);
>>>>>> +    /// assert_eq!(0x4000u32.align_up(0x1000), 0x4000);
>>>>>> +    /// assert_eq!(0x0u32.align_up(0x1000), 0x0);
>>>>>> +    /// assert_eq!(0xffffu16.align_up(0x100), 0x0);
>>>>>> +    /// assert_eq!(0x4fffu32.align_up(0x0), 0x0);
>>>>>> +    /// ```
>>>>>> +    fn align_up(self, alignment: Self) -> Self;
>>>>>
>>>>> Isn't this `next_multiple_of` [1] (it also allows non power of 2
>>>>> inputs).
>>>>>
>>>>> [1]: https://doc.rust-lang.org/std/primitive.u32.html#method.next_mul=
tiple_of
>>>>
>>>> It is, however the fact that `next_multiple_of` works with non powers =
of
>>>> two also means it needs to perform a modulo operation. That operation
>>>> might well be optimized away by the compiler, but ACAICT we have no wa=
y
>>>> of proving it will always be the case, hence the always-optimal
>>>> implementation here.
>>>
>>> When you use a power of 2 constant, then I'm very sure that it will get
>>> optimized [1]. Even with non-powers of 2, you don't get a division [2].
>>> If you find some code that is not optimized, then sure add a custom
>>> function.
>>>
>>> [1]: https://godbolt.org/z/57M9e36T3
>>> [2]: https://godbolt.org/z/9P4P8zExh
>>
>> That's impressive and would definitely work well with a constant. But
>> when the value is not known at compile-time, the division does occur
>> unfortunately: https://godbolt.org/z/WK1bPMeEx
>>
>> So I think we will still need a kernel-optimized version of these
>> alignment functions.
>
> Hmm what exactly is the use-case for a variable align amount? Could you
> store it in const generics?

Say you have an IOMMU with support for different pages sizes, the size
of a particular page can be decided at runtime.

>
> If not, there are also these two variants that are more efficient:
>
> * option: https://godbolt.org/z/ecnb19zaM
> * unsafe: https://godbolt.org/z/EqTaGov71
>
> So if the compiler can infer it from context it still optimizes it :)

I think the `Option` (and subsequent `unwrap`) is something we want to
avoid on such a common operation.

>
> But yeah to be extra sure, you need your version. By the way, what
> happens if `align` is not a power of 2 in your version?

It will just return `(self + (self - 1)) & (alignment - 1)`, which will
likely be a value you don't want.

So yes, for this particular operation we would prefer to only use powers
of 2 as inputs - if we can ensure that then it solves most of our
problems (can use `next_multiple_of`, no `Option`, etc).

Maybe we can introduce a new integer type that, similarly to `NonZero`,
guarantees that the value it stores is a power of 2? Users with const
values (90+% of uses) won't see any difference, and if working with a
runtime-generated value we will want to validate it anyway...

(I can already hear you saying "send that to upstream Rust!" ^_^;)
