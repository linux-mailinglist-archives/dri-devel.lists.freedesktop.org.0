Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E75BE6F6B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 09:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251F710EB36;
	Fri, 17 Oct 2025 07:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="okKHZJgr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010019.outbound.protection.outlook.com
 [40.93.198.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1D110EB34;
 Fri, 17 Oct 2025 07:38:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRheAvMgf30yNrrBOFQMeGHZmai4uGzbYGDWBmbr+FN862luc1+trzgm8XYWPuOH1BLnPrO9Wddg8kJ3xYSzsNyoFC9xwVH4dgEg0hzWiPu019SLpkRm3iDLrldbywXkLCFbq2YcGyMn0HfARIijAepNc0KK84eQ4tUpcvunWDVWqEa5P8AIoYQTQS+4ivZTa8clX78L1qxK3O/rbkfl++8abxlDb4rg5i61L6b/B4y1vBWxHJQgs/Q5vOtvLsjLH+or7DE9iJHUtV0cDNIqv6nSvJBLdu76caU4lAfJqjikKQOpjlvOTMvSumgqhTPFkILVCPiYx53DVaVG2u0Xgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2cx84eQ6cYNAv/gcg+7SNLGoHkhJsQakZiuHQ2UC7U=;
 b=bIMCQ7dEjUHFjv6rA0y7UBrdFW/ec0a8tJEc87m/sp6edRQ8dJNXImUvISf+Zna9B6OVSFYp2bG8SndMFPfixsrMpHovZGhBQY7tS0T4CkHd716S+OY+AhOB1DYNwJEey7UgArf/FYg4usiAunEfhhp5TsRKKQG3nC6jU5BIjwsVeyA7SAT/ea29w+u+p+uEqc23ZUQoBMSsFwm2ALptTvWvc/340rbB+eWBkwAjPiJ2xh2wkBtLDUc8PUZWAZU/OKTKAnfhg+UUOpAGrPPkK/TICY9DCYGx4d8opPQuVwbsCp7/SneMzitFNpu9oz5uROKLFyn/Kx01YFQFW/nSjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2cx84eQ6cYNAv/gcg+7SNLGoHkhJsQakZiuHQ2UC7U=;
 b=okKHZJgrEPsWQHRIYcKrzL1pr/s3mC7iLn/K68NHHNAlZyEEUspdNRRnBVqhWBHDeBExIvzKo5dRD7BpFavegJvQ150D8quSGBcF2D/5Fbko4k6i4QwUA4ZuqC8240Y60yCSH+zbrG0QuYk20SvwXdK638pdaG2mwwNNc8Ae4pT+VuW0ArgVI+vLOlrHja8h3qZeTVsBxq47pz3E+YGT8LfbjcDfPdEaeOb3XBPSeL11xW7BO+WhTukbF13cUXwnSrk53MSpDdpK2qcwu+SoNlHEH37ryXuxVcau58cCNemf6Bo2y3wsZH6PbvwiB8AyJuV+7UjkKnBkQE9HeFtBsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB7311.namprd12.prod.outlook.com (2603:10b6:303:227::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 07:38:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9228.010; Fri, 17 Oct 2025
 07:38:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 16:38:29 +0900
Message-Id: <DDKFCK1FGMBJ.1SZESNKE2GZPK@nvidia.com>
Subject: Re: [PATCH v5 04/14] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, "Lyude Paul" <lyude@redhat.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-5-apopple@nvidia.com>
 <DDJJ4P7ED3LJ.6YD2M62RB5VY@nvidia.com>
 <CANiq72kpgPT8=-UPj8Bez_ui=MTVauCPg7CabDau=jxOB8qdow@mail.gmail.com>
 <kddcagu44v2a3lbxvid6wppm26wkx6ippxwa4nkaqppci5unna@oguriptlzthn>
In-Reply-To: <kddcagu44v2a3lbxvid6wppm26wkx6ippxwa4nkaqppci5unna@oguriptlzthn>
X-ClientProxiedBy: TYCP286CA0082.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: 054c8e82-4567-4445-653e-08de0d502c49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUpsSmhtSjdQdjBXMXU0eHJBYVVRYTNucnUrN2U1WGNYdU9QU0tON016TzdO?=
 =?utf-8?B?SkV2dkVqcEltZ0xCZTNSQUVhZHRuZkh1WWFUMy9FZXdoalFSRUxSOTJWaGNw?=
 =?utf-8?B?WERIUC9ickxuUlRWK2FJV0o5WDVmQ2R1WDU1QmZ3a3FnWHMwNTFUZzdGMDdJ?=
 =?utf-8?B?ZC8xMHpqQ1ZRSU4wVUN4N1BYaEZxOW42eXcvQTlPTHZUaDZQSm5SL3hYR2dY?=
 =?utf-8?B?ZGh4L0dxV0VJbjJYOWMvUTlxenptd1ZjZW5JelJBWWwzYXRxYzVlWlEwc1ZF?=
 =?utf-8?B?eWFudVBQaDAzTTA4NXlXdzREbDdHa04zVi9keWlkTXJxcmVzWnJsOFhvV2x5?=
 =?utf-8?B?Mk9YbzlpSW9aQTFtTS9CcDhqWG1DZHVnV3NVeVcwYlQrUU9yeVNaL2FGdGtR?=
 =?utf-8?B?Wk5GVlBOUWdqL2tMTDVueUZOdkh2VnlMQWFEdG5ndDVXeUd5cFhWRlhNVG90?=
 =?utf-8?B?dE1BbW9ZaEJXaDM0QVRHSHVXaCs0bW1GaEpDdUsxWUFzU21CZlZITHNlb0RX?=
 =?utf-8?B?TWI4SjNwZUZvS0tIWEhsNHFKcEtMWHRvS1lYbVo3MENreXBFL1FvUGozcU1S?=
 =?utf-8?B?VFRHc2s2aEh2RkM2Z2ZJTlJTUS81Yk5YRHA3eVRkUk92ejlJL0RVbmROVFBr?=
 =?utf-8?B?UGdUOWdnZkc3ZXh0ZFE1eVlZSC9OTmdUeFN0OUhlRzQzMWFGdzlIeWFDRVhI?=
 =?utf-8?B?YnZvVXhjdTR4SHNqWEhXMHg0L2RJREZ0K3hiUFNZdzR5NkN1SlJBUGg3WXh3?=
 =?utf-8?B?bXR6L014M0M5Q1oySlViVFlkNjliYzZkTGNzalhJSXR5L2cxcCs3QjROd3Nh?=
 =?utf-8?B?dktBcWp4L3pqaDlBdTB1dThUays2UlpUZDRtb05jRmc4YVFldVgwbnpBeVdC?=
 =?utf-8?B?YVBSci9pM3FMdTFzdzBxSFVnc21nYXV4UndwejZSRjlGZkdIemtFcVJMZE5M?=
 =?utf-8?B?OGhyelNRYUVJSUZLOEpHNlBGQWd3U0MwSm5mZjJtNzVEY2VjMno3cDdOaHNm?=
 =?utf-8?B?Z3VOLzA1YW1LRHpCTVVnWFhZRWR2QndBS3NTL2FISW1pM0FZQytQUFQ2eXZl?=
 =?utf-8?B?UGVTL0xTODlCYVl3NkNRZXZaRTRTeTJGN1RjWGJhRktpazhDLytXWGF6bERu?=
 =?utf-8?B?dG5SNTVYTDJOT0hCbDY1S1plVjUxNHczYTZzYTRaMmZSM3RpNEtBTFgrVW53?=
 =?utf-8?B?b1kwS0ZVNUlBOWo2Sko0aFpaVW5VSysweHlRc2RydDZ1K2IyQzFQV3dyWjF3?=
 =?utf-8?B?WkhYYkxWakp1YWc0dW4xcFV1bzlvOUg5bE51SEd0dGkvVTRvdXMxZUtKQ0tC?=
 =?utf-8?B?RDhFM0FZZ0g1UDhrZ3UySjZYMHZzUlY3OThVUndwQlhKeDVrdHduVnJJNHpw?=
 =?utf-8?B?cmVQZllyN2ZKejd4TmZqT3BRdWNNenk4Sml5TDBFVGpnelBaS1NhVzY5S0Fa?=
 =?utf-8?B?Z2x4TFhXZHk0VFNqOEIvR0tVVDR4RXBPRmxIVkR0VjZid2J1SlJoTjBsMitV?=
 =?utf-8?B?eGR0YXRFOEVCdkV3NlNldVkvWlZuMkFTUXhZNGZzczZWTkNPa3hnQjVIZlBR?=
 =?utf-8?B?MUIwOEVld2ZJdWtSNkVQQlMzZEtNVmdlYXd2RmVhZ2RrUHVSOUhmMjZqSFlM?=
 =?utf-8?B?TnJHSXlYYjZTKzZVdFpyWFdZYlY0aDRFVVBseDBvQ2JMTXhTakV0akNCQ05m?=
 =?utf-8?B?bDVYYWJNU0E2NXdORzRZSkxVblJSYmZ0TjRISUdQVktkTXFBNXMwMXUzZWdS?=
 =?utf-8?B?aDBJVWU3TVBwcUdMU2RzUFJxclBta2NuaXIvcEMrWTNER2JZZU03QlJTcy9m?=
 =?utf-8?B?RlhrMmIrbVRTbWRsdGVtcWdpYm9sM3V0dXQ4c1N6d3VEb2lpdEV6ZTFBaHhH?=
 =?utf-8?B?TjBkaU9FYStaWVhwUmM3OUxkZFJhazAweXVVYWQ0VTNoWVl6UnIwb2RTOXBw?=
 =?utf-8?Q?/vEx8M/opG6VLhKQRdZHCXBqDGOpdZxS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXpNeDg2cEhjRFplcmlrcWRqNFRMb2E1L0pzbDV5c2pZVWplaHdkSEVqTit4?=
 =?utf-8?B?T1RoRElMYWxtc3R5aVFLUklLcXFPYVJ4TU8xUVZFR0ZLb0g3c0R3S29uMjRV?=
 =?utf-8?B?RGFIQUhDUE44TmJjNFV4bVpRaExNaWwzZXp4cXBta3NyYVZuMVVPZlpXVHZR?=
 =?utf-8?B?WGVVU0MwSXBLT3lscXArdld3TTUxWDMwaWFzL0d1cWk1YWRSb2dSMUpvTk90?=
 =?utf-8?B?Vy9IK3VUbkRnclhQWTFWbEJ6aVprVkNCTkFKak9EblVWUFgrQU5kTnB2WkNZ?=
 =?utf-8?B?eUQrLzZPYmx6VzNyOEswZjJlTEdyQWk4OXRKNVpmQ3kwYzYzeGtwaXpVSTdo?=
 =?utf-8?B?NGEvOXdheVN4bjVuV1ppbFdJZTh6eGNkTHpTMXhOZGI1QXR3OWJhUDBLZEdU?=
 =?utf-8?B?b0kyVHpxNGd4aFd3cXV0NmNrTTN6dUkvNDZNWDZWbmhiTk90eGtNV2xnZG1p?=
 =?utf-8?B?RWxtZzVQU3N5UU9wN29tYyt0S0ZFVXNFVERaMDB5Um9jTit4ejNmbHp6NFVG?=
 =?utf-8?B?cWNHZ0tWVEVPdElxTFNVTnB4czliYXArcS9yMjBlQTVXdUh3eTZTVU9CaVNr?=
 =?utf-8?B?TzlQaVRhbThIcThwdDZyQmthN1pJY3RlY09qL29IRGswMFR3RWwwRkEzVVd3?=
 =?utf-8?B?ZEdkNG5wcndtUk12ZytSOGFlTlhDcjFuUWlXNFVFZXUydUZweXpITmx0eXcz?=
 =?utf-8?B?OFVqR2lHZ1lqMUpvQUlLeGhsOTVxQ3BwbjRPZ29WNmx5b0MxaXFKS0ZMWWd3?=
 =?utf-8?B?T1hid05VVFJkbzFlOWJmcWVJcE1OenllUC9BRGEwZVkxQVpVc1pJQUpVKzR6?=
 =?utf-8?B?SzY2Vmt4c2NHekNsUzhDK2VjdnRUb3JLNjRnUEEvd0JVelJaZWdWN1BwUkkx?=
 =?utf-8?B?L2ZyKzU1K3hzWFNEcUc0L0ExRW02dFMyYUppeDEvRDh5dTZocmlIWDdraDM3?=
 =?utf-8?B?U29tQzQrNUdnZnJFLzNERW5HbjNYQm9DL2hTcFZGanhidGxSajd1ZGExWU43?=
 =?utf-8?B?N0tNa0czdHJ3YXg4M0VSOWlscVArS2FCS3BBc0RsNUFNdEpwVnJMWTFyQjl2?=
 =?utf-8?B?aE5GdEp1TDV6OWttRERoTWpPNXlFbCsxVkxCN0w3aFhtNGhYZGUxSWQrdnJ3?=
 =?utf-8?B?OEJXbUJCaDA0Zk51YUhoaGxsNzBIaFc4T2xRa0duakpEakt3NnE3LzZiQzZ1?=
 =?utf-8?B?T21pa0ZhOXl1Y0NZTUlkODBIbElnWEpEemNGem54V05NZ1ViZlQ1UzhtT0pX?=
 =?utf-8?B?aXd4TEF6UE5ab1IxMW51dHBYZnJJbHRZc2dkZll6bWwzbVJlTFZzY3J0cG04?=
 =?utf-8?B?a2xwZnJXclZISkdCajBiR29lZ2VvbjNXRElodjNWUU1UYnl1VzRSdnhzYzVV?=
 =?utf-8?B?L2lMWHB3MS8ybFFlN3FXeEFMc3VDa2xsdEE5T2dielcyaFU2Nnd1endiNlRQ?=
 =?utf-8?B?SWhnV2x6N1A2L2VjcC80QUlXSEY3KzRBelh2aE5nR21SSnRLWXMyVWNOY0dF?=
 =?utf-8?B?U2E4TGlOaVJiSlBKZ0IzUUIvd1JDZloxbWpZNnl3TGtvZTZ1Z1VMYitZOUtC?=
 =?utf-8?B?L05xN2k2K21jMFJOajZ3V1k4VUlHaXRxck5lTjVuMlJvcy9USG5RVC9aU0tU?=
 =?utf-8?B?MDZxVmhsYzl6NTRzV0pGUUdsUlEzeWJlOGxrQVhDc3g2d0pLdm5Yc1IxbCtr?=
 =?utf-8?B?cll4SWE2MjV5TThYSmIvOTJESEQ3RGdWOENaYVQyQmJLNmh2VUNJOGJ5MGU4?=
 =?utf-8?B?NU9aaGR3emoxZXlyYWt6bHBLZnE4b2ZHMm9LTDJxUmE4NGZXYXFvbEJudCtV?=
 =?utf-8?B?enJCaU10cFdjMHNlQ3I4SEtSMXdkMENtV0JVQTRKUkVxNk1sZGdYY0JoQ1Ar?=
 =?utf-8?B?b2tNZWQyS1MyS3lMckoveVRjSk5HdVI5N0x5SHl0Y3JVMXcxUnN1OWlLNHd0?=
 =?utf-8?B?T25VUnFXQUVWY0ZFWGRIb3RsTE1nckNLQnoyeThoMVI0RktlSGFXeG4rRmVz?=
 =?utf-8?B?Q2Q0YUtwVVRxeE1lK0JIMHFFc1dhSVN0ZGxCTUh3RmNVL0Rud2g5d2t2L3h0?=
 =?utf-8?B?Z2hndTd1aGt0WG4zOUFFNkhlSi9kVEhrdTBaTnU0UXh5QVo0eHVxNEJkVU1j?=
 =?utf-8?B?OEdaTGJlQkNlMG9RU21mNHdTazJVeHlvQlBYVkRRckthbFlocXRSOGdiNW9t?=
 =?utf-8?Q?yMbRo0VdD9wx9pxPeUbEQ7KHK7ZsEReaQyqg21EfXdjk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 054c8e82-4567-4445-653e-08de0d502c49
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 07:38:32.8598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rNlbSlHwFLr91slGhIgDjPIVClUXvxP7dX/zFfjBxaEGuI+xosqUmFrhA+8EY2HuClZrChq4wa5lgSMIZlIRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7311
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

On Fri Oct 17, 2025 at 1:45 PM JST, Alistair Popple wrote:
> On 2025-10-17 at 06:18 +1100, Miguel Ojeda <miguel.ojeda.sandonis@gmail.c=
om> wrote...
>> On Thu, Oct 16, 2025 at 8:23=E2=80=AFAM Alexandre Courbot <acourbot@nvid=
ia.com> wrote:
>> >
>> > On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
>> > >
>> > > +/// # Example:
>> > > +///
>> > > +/// ```
>> > > +/// let mut buf1 =3D [0u8; 5];
>> > > +/// let mut buf2 =3D [0u8; 5];
>> > > +/// let mut sbuffer =3D SBufferIter::new_writer([&buf1, &buf2]);
>> > > +///
>> > > +/// let data =3D b"hello";
>> > > +/// let result =3D sbuffer.write_all(data);
>> > > +/// ```
>> >
>> > This example doesn't build - there are several things wrong with it. I=
t
>> > is also missing statements to confirm and show the expected result. He=
re
>> > is a fixed and slightly improved version:
>
> Argh, you're right. I cut and pasted then edited the wrong thing from my =
test
> build. How are you building these? The `rustdoc` target seems to ignore N=
ova (or
> I'm doing something wrong).

Indeed, rustdoc doesn't consider anything outside of the kernel crate
for now, although this is scheduled to change so we need to be ready for
it.

For now, I just copy/paste the test code into some function elsewhere
and try to build. ^_^;

