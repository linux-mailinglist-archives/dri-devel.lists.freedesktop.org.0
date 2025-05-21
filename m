Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D67EABEC18
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9956E10E639;
	Wed, 21 May 2025 06:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BiDetCFn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626D810E643;
 Wed, 21 May 2025 06:45:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DkZFnoUIhWuKpc/fa6mTxpQvYXK/nF7ovJro6iFCAf6UvyfUMmPTGy+wN2ZuE26lHeiriw9YS8+6ewTkjtQ5ufpnfbcZja37OhjyQs+0/AJX/xY+uEp5jd3eIdTYU3UN2yxqBHmQ1PZrXxWpS2AS4FMv2kDHl/8Q0hwTXE7Gevr4Iz1gUk/pQ92GlZ9hbpO1mId/FaSmAd6GJvbajIsAhhxLpdcio/JJ/ptQdPJu/m/ieS3e+0JKv/97pfLxCfrTuYoF9bnO3nhdIf0ZvPveNDUVg1kqWA7K17kgmXf63IUclTTR4UN3/uB4K4Gnc7nyCz/ZTWmHdyuKCXdWfA9X8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qg4xVxc6lgksYKhe8xiGVOEd1/Rq6iivtZbqA6G0GrY=;
 b=o6d7n9xso7bpQouqld9I4E5lOsxQXnojpw+kDxjCzGdwAIOP3E5F+O7PJW2CNJsehuyq3tn7OygrSS3MHGpw5cqv1tvj6SaMwZrYiQ37dj4UyB2trnA57Hvp0Q7g5Pq7PHZal9GAQrv18bNLZFMw4aAohB4Q9Fkby3Y/HkwoNtRLk8qyTW8KEvTOmoP4LAWf8AP6SvbBQlCqIdx8pJc+2xc9lsnJIWgk+CETOpON8TAQrS8mewX3PeM3UafuSeB0AAvWwBK6k4Twz4vVubLpoXwV/s3Gi39OobUJSOEXVTYBTiHUyMZ4+jPUCxt1lKxY5oxNAIVN0pDN0Rz/UpVpWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qg4xVxc6lgksYKhe8xiGVOEd1/Rq6iivtZbqA6G0GrY=;
 b=BiDetCFnestXcHe3mcb/GsSUfsMYu5ZhbEtKThsh8Ti1Hn37S7Ty5VZficjqbFH8id6xvjGYH5/dPgmfOi16Kbir6LsUUNgvKB9yRZ8LaolXYkrtGmNP5Xj71WuhftO/s5gzWhsvlCxS7f9niji5NLUiTGUm6ifxE07ZWH2LlFjzQC4pFj5Yzui6tqHisZ6tAgFXgGOxREbBIPpT3lDEL4zcEiGoqtTihGtpJ/0TGLhl8ZaQn6gIfDJpi3bvSRDXnALqMqPJUrAVCi3TTrggZ3CPIYUfGFm2RpjJlUNPNcP+CtnX3SQfiX2Aa792jtJZlB2i6xFvES35/jMDgkbmVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 06:45:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 06:45:01 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v4 00/20] nova-core: run FWSEC-FRTS to perform first stage
 of GSP initialization
Date: Wed, 21 May 2025 15:44:55 +0900
Message-Id: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGd2LWgC/2WPQQ7CIBBFr9KwFgMDLcGV9zAuKB0sC1uFSjRN7
 y6tJq1x+X/mvZ8ZScTgMZJDMZKAyUffdznIXUFsa7oLUt/kTIBBySRXtOuToS4MkeoKHWhtagR
 L8v0toPPPxXU6f3LA+yMrh7VsfRz68Fr2Ep/brxrYRp04ZRRtw601IHQljl3yjTd721/JrEmwo
 iXjWxQyWkvDheKqFEL9oWKLbh9KIqPO1gyU1KqUzQ86TdMbmIFMoC4BAAA=
X-Change-ID: 20250417-nova-frts-96ef299abe2c
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Shirish Baskaran <sbaskaran@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0080.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: ee14bd89-aca8-4ab9-02f7-08dd983302a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUtJOXZQamw4NkE2Q1prU3FLQ1dMQ01uT05KT3FsalNncDI4bWF5dk8rSm1S?=
 =?utf-8?B?OEtPbXNvR2dXTXR3dG5qTzY3M1pNZTYyWEpFY251TVRCR2N3QlBUeDVKaDVL?=
 =?utf-8?B?V1pWT3JNUkVSWWErckhsN3RrdnhkdGRxeTFTTnF6UzBMZHhwU2tYREJVWUUy?=
 =?utf-8?B?bE9oLzhWWlVNdkFYRm1rdjg2TGpnQnBhY0FNK1NIalVuVHgwZTZNcDZFa3RY?=
 =?utf-8?B?cXVGcWZWTzFVMm5yZ3ZxL3hLdERXL2s1SDNwZ3RmZ1BCS0NUYWEzUHJxZ0V2?=
 =?utf-8?B?cXpKQ0lJWmlBUXR3d2hxbWFMUkFFTmliTm5FM3UyWDVaNjVBRTZIMExaYldp?=
 =?utf-8?B?bmdDN0hiRStkOXFja2hlRnYyZjFCdVNIS05sbnRWTVU0NUZJWitYakVNQVpJ?=
 =?utf-8?B?M1hxSWxyZXhweVJFQTYxRHZWbngzUWdnRGV0RERNaXk5YTlZL1pybno1Si9I?=
 =?utf-8?B?WElmSUdHTmJveUo4NzVUY3I2ckFzUTRtb0x2OHlMMDFVUk9qZkJTOTF4bWdS?=
 =?utf-8?B?Q2QrRjVzMFBuWkpxWjRWeC9ieXVPVWxjOWUrSGh1cWF3VnhmTFcwM0JXSDNG?=
 =?utf-8?B?NFpuSXRVRzFHdmlJeG9LWXRGeUdxUm5LTW5VV3RxYkVJOVA1WUx4NDgrWnF6?=
 =?utf-8?B?VWtlbVp3SWNIc00rNXh5Q2dqb0NMTTFpT1ZqTlBVUkNqYXBOekRidnVkWm9P?=
 =?utf-8?B?UkdnM3E0TUlKdmtFQ0FBNHNMQi9NRnBodUtNNlI5Y3E1dGtPYWlPVXhncEIw?=
 =?utf-8?B?TkJYR0wyUWplakVXeE9RRi9vT1U4alhKQVhsYmI2RlpUdGwxQUFUQTZtQ1ZR?=
 =?utf-8?B?Wlh2UERmd2ZGWjlVVng2M29Fd3lNTmdVWi9BWXhDNUZpUFBMbWRXTzNVZTNu?=
 =?utf-8?B?bk9keFEwWk1DNEdvcGhqQUVsVjk4amlkeHRzNWllQXE5bEdXSFFSK2JIRlMy?=
 =?utf-8?B?cHJFWGtQSk5sbklVcS9GMTAwZzBhUloxaW5yNXcvLzZ2NzRjUUtleDZCejNp?=
 =?utf-8?B?UGx0bkJSTC9IbEZLSjlOQ3pEcHJzN2dMRGNPcjlwVmQ4djVoMFJkb2VOSnJZ?=
 =?utf-8?B?QU1mZk5kRUpCWlgyRFZqSDROWlp5eFBzY29uM29hMXpBNlJQMFF3MEpraGVY?=
 =?utf-8?B?MklvajlaTVVlRnA2ZUl3cHQwYlRORk8zdVgzUFpnaVBSWTZISW50SEdnWWR0?=
 =?utf-8?B?TUxheTBKSGxreENTR1ZGRWZtWE9hZ2dFT1dXd1BRRnE4V0tjTE9KWW54VUVB?=
 =?utf-8?B?NW04RmlMODRvTVN3cHRCS0FLYUdTVXhmQnZhVWIyN29zRlRSZ3NoYWVNbjVo?=
 =?utf-8?B?MkF6VUIySzNRemp4NjJZY1IxTFNvTitJZitvMnpRUy9ZNXA0UEJWNVFXbVFD?=
 =?utf-8?B?MFlKQnJIT1FSS1JmSGc2b0MrVkhlN3l3RVZraUxmVGlaZS9lYWJJMlNIZEZo?=
 =?utf-8?B?NC9HS1Bocy80K2RnYWhLQ2VuRzE4SytiZFQzQlA5dmRaREpYKzNQMDhHYnMw?=
 =?utf-8?B?Rit3bTlYWWNidWFmaytkZ1JSeGlhM2hJdXYzL1VBMmRLTy91MVM2dFNDdElq?=
 =?utf-8?B?UXdkRGhWcW5EYXFVNnVreVV1cjc3SnEzWmN1OG4wQUo1M3FCYU9oWERRREs4?=
 =?utf-8?B?SHJndWpWYzdFa0NSd2hHaW82d3dwcTlvZ3RSQW5Ock5uSGRDMGw5ajlzRk1j?=
 =?utf-8?B?TTRpUXlQMkJpa3kyYkhTenIvZENGSWFlMGxNUTQyZ1Z2SzFQT0pGdWIvNTdm?=
 =?utf-8?B?RjdFTXIzeHgxQXlBRjdIV28wbnZCbGNNSHNHbmV3SnBBb2dSYVBXcnJCY01O?=
 =?utf-8?B?Q3BSa1I0OWJOY043T0VSM2tEWXFPN0duYlZ1VUpFdGVidjZNeE5sVTZWNHZX?=
 =?utf-8?B?V09Cam5BZjhTV3FIOFkwSmZPelh4UjJYbm5UcUNNMWpBRUkrWjV3ako0dUpp?=
 =?utf-8?B?SWUyZVpuZ0pCZDVUaHc3YUFjcDh1QXZUTW85dzI1bjNXVWVvdEtYRmVYOUl5?=
 =?utf-8?B?bXhrV3VQY3NnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTQ2eW4zTnQ2bmdMRnZUTWFHL0Y5NHhzb3lzWncveXN6cWpJSkQrUWpNRlZN?=
 =?utf-8?B?Y3Z1UjVUaGI5WDZzaVV0L3g3c1puSTRUemJSbng2N1Z1b2RLRlBZd3ZZaSs3?=
 =?utf-8?B?a1lodU95MHNTRm12REpRMHhxdFVQdExwVm9qdGx4RTUreVA4cGdsUythYnBL?=
 =?utf-8?B?WEJEamN0NGJUSVJlY0gwbEU2RDN6M3l4UTV2OXlLbERldWdzQjVOS3EyT1Bj?=
 =?utf-8?B?aHRiN01FMDY4TnUvNEJIdTFmeEhwNzBpaXFCTVQwNXZBekV1Q3pwR01LWVht?=
 =?utf-8?B?by9tODBEUUdWTm1BRlYyTktCcm5FVmtJNEtKcFM3YUcwanU0TVBpWndhWkI0?=
 =?utf-8?B?YW5TbUFQNlVRWXVTTHBaNnJWbmVJd3RaWlhZVDlncXU0NGdjLzQzOVVaSnNG?=
 =?utf-8?B?a1p6aTlHZmtwVC9PYlN5dnZjMmpkcVU2L3JUbm4ydElvUlJYTVdBbEZNRWNG?=
 =?utf-8?B?UVRHc2QrSEF0eTlRZGZhZ1NteWZiSUdoL2taU0RFWTVTb3RCOWZROXBpdDRV?=
 =?utf-8?B?clE5TFBlOU1NKzFVZnlrQko0amVJV0d2WmRuZkltVFd6V1VzNFJPL01TaEls?=
 =?utf-8?B?b2lOdHVFVGJhRXlKdVNTSFcvSHFnNVVXMlRjZDE4emYxOWs2KzFMRGhCNGpm?=
 =?utf-8?B?ZXF2ODVkT0FsZlJqMkRpR0FHV3FTelhOd09heE16bU54bG10VEx1VVM4dU9R?=
 =?utf-8?B?TXAvZlF2dG1BTmlrNDl6MFp6K3R1Nk45NzdYeHFVS0djNHFNVUlyNkpaZjBE?=
 =?utf-8?B?Tm56QTFxbVkzRUxDaFQzdWw4RUlIY2Mrbzkvb250YUo4bGtDTndxYmhZODRu?=
 =?utf-8?B?bERJTzJ6eEtIc0JLNDVlcjk3Mng2c0gvQS9nV2ErVDJ3UzVMRUZQSHRxUkVq?=
 =?utf-8?B?MnJxWU5VMTZ4L2FoN3NwZlZBNnV6eHFTUHlxMHBJV0JjVFJ5TzBkTG8wVlRu?=
 =?utf-8?B?QnpMUlRnajVJRFRhVG1KZ3dhczlmZFZCZXE0MGhnNit0T056eWlxRy9Tdi96?=
 =?utf-8?B?SzJSK3BvRjNuZ2xLWDdOWTFwbXhWK1NzS0ZVRUpaNjNJUHNDT3NjNW1vTkJt?=
 =?utf-8?B?ZVo2eEg1NTBTdVN4MXRhQnFiaFp6Nm5WMzUzNzBzVnlRR2U2bDd0K21DbnF4?=
 =?utf-8?B?SkJJenRNY252Q1ZHV2xQNkdzYnN4M1dXWlZ0YTFEM3BZdkp3YlFQYUxVYjB0?=
 =?utf-8?B?MU54a2RURGltZWdvc0lCVTZ3SEM2QUdoMWNpQTNtZVRpSnFQYnM2eGtDTHl4?=
 =?utf-8?B?RHFFTWxNL00wc3NocVhudWR0SDF3ZnZUQThueWkzK3ZsR1lheldQaVVMMkdx?=
 =?utf-8?B?Tm11dnpDdis4R2haNW5HWlpIZ3hnK29LSTdDbU9uTEh6YlgwaEFXakluWit6?=
 =?utf-8?B?SG5HZFN0eFRWY1FieGJXNHBzUkl6Umo1c3M3Ujl0MXc2OWl3Z1NwZ3dTWDBh?=
 =?utf-8?B?MllFWSttRVNpQUorU0tzRjd0ZDVlRG1rdnRQS1RBUmxDeVFaN09LNUVocGVH?=
 =?utf-8?B?d25JRTRkSi9TYStYaEtqbWFlSmlQTG9vRUs1SDRQMlpSQStIN3J0Yzl1a0FZ?=
 =?utf-8?B?VHFVMUI0a1Zha2p6cEtkaU1pZ0FEaGdOVDc4eHYzdlAzN1V4cWQ5OGVjKyti?=
 =?utf-8?B?enB1KytNTXd1VGtCQmhuTkxwZnlTaEpiZWQ5WkZhUzVoa3FyM1k4N242Zkd0?=
 =?utf-8?B?L09MZG1RTlpRVEdaclpiSDJRUXJVcDhKV2duS2Uydk5XbDlZRHJVSnJBZTc1?=
 =?utf-8?B?dzJrSWhFaVBqM05JNHlUK3kzamNyNDlUeW12RStWUTZ3VGJjT1g5Kzk5cklH?=
 =?utf-8?B?c2czbkVkcWxJU2k5RWVrTk5qYmpBQjdLTUFPUjh5SGU0S1loK0Y5ZmdpVmZo?=
 =?utf-8?B?bWd4OHVOaGpwOXVCMWJ5UXVmTFYxL2lFVk1rM1ZnKzQ0Qk91VDBpdGx2K0dz?=
 =?utf-8?B?YzMwc2hYdEhyVE9DUkVDS3JxNFJTeTJlRy9YZFVsK2lxRENZRzlnZCt4Q1cx?=
 =?utf-8?B?b3JpaDVFbWVWVlZIdTJzMkdhTS83dFdZZVJMMG51cWo3VDJzMXlBUGhRa3pX?=
 =?utf-8?B?NDRQRUYxNGdMRndkanYybXEzVTMwcVhpY2tzT2Zra04rRzZ2Z3ZnZzduay9Z?=
 =?utf-8?B?QzNGaW1kK0JzZXF0TzdhS3B2aktRYnQ0a0FHSUJ1alY5cGl3a3JWemFzMlJM?=
 =?utf-8?Q?JQFzRr7O9aQdS6wCdaCidMLzB4a6cqi9bxaRhFf5V6dp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee14bd89-aca8-4ab9-02f7-08dd983302a2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:45:01.5617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Es3EcwyIcm07ytmPHZI3LUYkIJujQd7bsf3kfLS8o2RY4aQZSgr0hgj55PKrdnynGQgBnOswnsz/Jn9LWmIGmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

Hi everyone,

New revision addressing the feedback received on v3, and then some.

Notably the `register!` macro gets a few new features that add clarity
to the code (like register aliases), and the `vbios` module has also
been reworked according to feedback. We also now have a HAL in the fb
module.

The newly-introduced `num` module provides some very common operations
(i.e. `align_down`, `align_up`), so it might make sense to consider
merging it early.

As previously, this series only successfully probes Ampere GPUs, but
support for other generations is on the way.

Upon successful probe, the driver will display the range of the WPR2
region constructed by FWSEC-FRTS with debug priority:

  [   95.436000] NovaCore 0000:01:00.0: WPR2: 0xffc00000-0xffce0000
  [   95.436002] NovaCore 0000:01:00.0: GPU instance built

This series is based on nova-next with no other dependencies.

There are bits of documentation still missing, these are addressed by
Joel in his own documentation patch series [1]. I'll also double-check
and send follow-up patches if anything is still missing after that.

[1] https://lore.kernel.org/rust-for-linux/20250503040802.1411285-1-joelagnelf@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v4:
- Improve documentation of falcon security modes (thanks Joel!)
- Add the definition of the size of CoherentAllocation as one of its
  invariants.
- Better document GFW boot progress, registers and use wait_on() helper,
  and move it to `gfw` module instead of `devinit`.
- Add missing TODOs for workarounds waiting to be replaced by in-flight
  R4L features.
- Register macro: add the offset of the register as a type constant, and
  allow register aliases for registers which can be interpreted
  differently depending on context.
- Rework the `num` module using only macros (to allow use of overflowing
  ops), and add align_down() and fls() ops.
- Add a proper HAL to the `fb` module.
- Move HAL builders to impl blocks of Chipset.
- Add proper types and traits for signatures.
- Proactively split FalconFirmware into distinct traits to ease
  management of v2 vs v3 FWSEC headers that will be needed for Turing
  support.
- Link to v3:
  https://lore.kernel.org/r/20250507-nova-frts-v3-0-fcb02749754d@nvidia.com

Changes in v3:
- Rebased on top of latest nova-next.
- Use the new Devres::access() and remove the now unneeded with_bar!()
  macro.
- Dropped `rust: devres: allow to borrow a reference to the resource's
  Device` as it is not needed anymore.
- Fixed more erroneous uses of `ERANGE` error.
- Optimized alignment computations of the FB layout a bit.
- Link to v2: https://lore.kernel.org/r/20250501-nova-frts-v2-0-b4a137175337@nvidia.com

Changes in v2:
- Rebased on latest nova-next.
- Fixed all clippy warnings.
- Added `count` and `size` methods to `CoherentAllocation`.
- Added method to obtain a reference to the `Device` from a `Devres`
  (this is super convenient).
- Split `DmaObject` into its own patch and added `Deref` implementation.
- Squashed field names from [3] into "extract FWSEC from BIOS".
- Fixed erroneous use of `ERANGE` error.
- Reworked `register!()` macro towards a more intuitive syntax, moved
  its helper macros into internal rules to avoid polluting the macro
  namespace.
- Renamed all registers to capital snake case to better match OpenRM.
- Removed declarations for registers that are not used yet.
- Added more documentation for items not covered by Joel's documentation
  patches.
- Removed timer device and replaced it with a helper function using
  `Ktime`. This also made [4] unneeded so it is dropped.
- Unregister the sysmem flush page upon device destruction.
- ... probably more that I forgot. >_<
- Link to v1: https://lore.kernel.org/r/20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com

[3] https://lore.kernel.org/all/20250423225405.139613-6-joelagnelf@nvidia.com/
[4] https://lore.kernel.org/lkml/20250420-nova-frts-v1-1-ecd1cca23963@nvidia.com/

---
Alexandre Courbot (19):
      rust: dma: expose the count and size of CoherentAllocation
      rust: make ETIMEDOUT error available
      rust: sizes: add constants up to SZ_2G
      rust: add new `num` module with useful integer operations
      gpu: nova-core: use absolute paths in register!() macro
      gpu: nova-core: add delimiter for helper rules in register!() macro
      gpu: nova-core: expose the offset of each register as a type constant
      gpu: nova-core: allow register aliases
      gpu: nova-core: increase BAR0 size to 16MB
      gpu: nova-core: add helper function to wait on condition
      gpu: nova-core: wait for GFW_BOOT completion
      gpu: nova-core: add DMA object struct
      gpu: nova-core: register sysmem flush page
      gpu: nova-core: add falcon register definitions and base code
      gpu: nova-core: firmware: add ucode descriptor used by FWSEC-FRTS
      gpu: nova-core: compute layout of the FRTS region
      gpu: nova-core: add types for patching firmware binaries
      gpu: nova-core: extract FWSEC from BIOS and patch it to run FWSEC-FRTS
      gpu: nova-core: load and run FWSEC-FRTS

Joel Fernandes (1):
      nova-core: Add support for VBIOS ucode extraction for boot

 drivers/gpu/nova-core/dma.rs              |   58 ++
 drivers/gpu/nova-core/driver.rs           |    2 +-
 drivers/gpu/nova-core/falcon.rs           |  557 ++++++++++++++
 drivers/gpu/nova-core/falcon/gsp.rs       |   22 +
 drivers/gpu/nova-core/falcon/hal.rs       |   60 ++
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  122 +++
 drivers/gpu/nova-core/falcon/sec2.rs      |    8 +
 drivers/gpu/nova-core/firmware.rs         |   86 +++
 drivers/gpu/nova-core/firmware/fwsec.rs   |  394 ++++++++++
 drivers/gpu/nova-core/gfw.rs              |   37 +
 drivers/gpu/nova-core/gpu.rs              |  135 +++-
 drivers/gpu/nova-core/gsp.rs              |    3 +
 drivers/gpu/nova-core/gsp/fb.rs           |   77 ++
 drivers/gpu/nova-core/gsp/fb/hal.rs       |   30 +
 drivers/gpu/nova-core/gsp/fb/hal/ga100.rs |   24 +
 drivers/gpu/nova-core/gsp/fb/hal/ga102.rs |   24 +
 drivers/gpu/nova-core/gsp/fb/hal/tu102.rs |   28 +
 drivers/gpu/nova-core/nova_core.rs        |    5 +
 drivers/gpu/nova-core/regs.rs             |  265 +++++++
 drivers/gpu/nova-core/regs/macros.rs      |   63 +-
 drivers/gpu/nova-core/util.rs             |   29 +
 drivers/gpu/nova-core/vbios.rs            | 1173 +++++++++++++++++++++++++++++
 rust/kernel/dma.rs                        |   18 +
 rust/kernel/error.rs                      |    1 +
 rust/kernel/lib.rs                        |    1 +
 rust/kernel/num.rs                        |   82 ++
 rust/kernel/sizes.rs                      |   24 +
 27 files changed, 3315 insertions(+), 13 deletions(-)
---
base-commit: 276c53c66e032c8e7cc0da63555f2742eb1afd69
change-id: 20250417-nova-frts-96ef299abe2c

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

