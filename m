Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7BFBE60D3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 03:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D43810EADA;
	Fri, 17 Oct 2025 01:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BVA0W5fx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551A310EADA;
 Fri, 17 Oct 2025 01:41:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxSJ8Nltm0iaIsLc5pTN1E2i11fUs/VcghoA7Zv3ccvRjs/AJO1LV1egN35JOgDvkvFw9kZXRjOcz8/d3jDX0qT7ZLedndLCiWN+cevi3gFZAoni3TjnAD/jcOMoVw+3lzRlfbKnI5688Q4PdWfhEhTs9bYCOMl8dX+9PFc4E48F2k6pKN4FnK1k59zOGEGdYW1779L18wMjhMW7hoaUlA3pOQvbik6ANj7+zW49JWXZ0xnoY8RhaxAtJgn44Rr62PKqwKGXc5SLqq6cuMeTW2xTUH4el7w3cWmj7gMhjIdajUqU0lGMABKd3nOE+wiWS7w7Myp50ZbvL4OXP5tqHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHIeLh3e8AB3alB4toSW0uokBSSefQyzajwmm0EKfw4=;
 b=dDmXPhwNmnc5t3P/oK00T9Ofs5T8z366P90+eXXAB9oOkoNx2ueQFV5RmIWlS23D90TnZHl4GtELAVT5SxaFYucVZA1HUDF3V8JwhyM9xc2LZEm0WG2hrlBTDer8iBbWzj6jxmcqnaNE2L0uY6WSQXn4euJpYI4hPHt+LaD0PLTizPEcCWLZ2p2wyaqW5kprZwyRJ2qCfvr5hDiPTp1J6rRYpQ3MsDKTpI8eO/b0EEgWLVQAozxK9E0WQEfZV0FjNK1Xgb8OSUeZXIMmBTvvE6k9f+3oiV6k55djQM6BwlkX59n4HhsDhIz2ajV0B791P06kyU0u6SFH3Ywk/+eqaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHIeLh3e8AB3alB4toSW0uokBSSefQyzajwmm0EKfw4=;
 b=BVA0W5fxRYQnT0n5jVwiv4PTRWk3yAIfBq7pHtOovZ5GhYRgkEOA0QGg5baAaZCJp8Ox4/2Dp6yGco+rL06ToQuVJxF6ujSI7v/8K3xPjUNAm/DyvhiQoodnIbMAMbouleSUMbe9YiXWThi1AaVbByhuOzC/qfyF2vE0b3GiZrETJ1EatE5IBW/p+zzO3RrW48qTuR/GFpSCsnb0Wof1oXTyJYrO4lqylkrAR7xlaeiGN9p0T7jKe8NfP2mSoajkApveiVBZalcZLMJiR5jladYrR4Djh5GNSr45aXLK8JOgKcfXI3FYy1KYONNr4wbX88eAaTxaEdN/r77F5/CJYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB7213.namprd12.prod.outlook.com (2603:10b6:303:22a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 01:41:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9228.010; Fri, 17 Oct 2025
 01:41:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 10:41:29 +0900
Message-Id: <DDK7R7X621Y7.4D5CSTY8BOG2@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
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
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 09/14] gpu: nova-core: Add bindings and accessors for
 GspSystemInfo
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-10-apopple@nvidia.com>
 <DDJJ5GJI5HJ8.2388S19QXO8G0@nvidia.com>
 <5jw63qwbeb2g7ngxpapn3prgv4dbceb7uhmw6ddntljznkxiks@ppnp6gknek2z>
In-Reply-To: <5jw63qwbeb2g7ngxpapn3prgv4dbceb7uhmw6ddntljznkxiks@ppnp6gknek2z>
X-ClientProxiedBy: TY4P286CA0054.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB7213:EE_
X-MS-Office365-Filtering-Correlation-Id: 3383ffc7-e3ff-43fc-5edc-08de0d1e4d53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1NXLzUyekpvbURBZjVaaDBXc05wdEFyTmRPVXY1TFJNcFg0ZE9MSVNRVE5Z?=
 =?utf-8?B?aXM5SkphZGNXOTM4TDZZbjhxcVFFSjdJeGFFNzF5QitWem1INTNGT2toSzNC?=
 =?utf-8?B?a1NLMnVPMVlLTEVjTjhtamxZcjFzdFJtMjhxQmM2RW1JZEtoWERuLzMvSldM?=
 =?utf-8?B?b2hvL2hLSnA0VmJibXl6VXdvNTkxRE5odVg0bGpMTURhaGRicWc5cmVlM1BP?=
 =?utf-8?B?akxEVTRmcGR3OTZmZkdOa1B2Q0xPS2p5alJLaktvZTFjbUpzM1E4b0RVNnUx?=
 =?utf-8?B?ZDhaUlc1MjBtOXNmeFZkOWg2STNvbVlxSWlaUm1UVVZVY0Y1ekZKYzl2Mitj?=
 =?utf-8?B?WEJrY2hLbGoyTlF3MksrTzVaQ1lCUUVXVXhQalduNGNZR2dWdHR4NnVaQzJp?=
 =?utf-8?B?aXZwR2FhcFdqVnRBVDZ5WnQ5R1dZQzZBcUZuZUY5ZUJuSkJGL2pGS2dHUVNp?=
 =?utf-8?B?OFBoelpPNitFTmVNU21JTGdndmcycVFWKzFMeFB1L0gxKzE1SlduMURnalVY?=
 =?utf-8?B?MUxyYUtKR1VLR1NyVy90MFU1L3BiOGlsQzNJNWYvNHo0LzZsOUVYQ1RPU1Vn?=
 =?utf-8?B?bzdzODFJL01WdHBoSTJXWXdxY3pDZXYrcUM4RERDWGtyWXFYd05sdHVhUXpz?=
 =?utf-8?B?aW4wUEo1cDZIOXdseVVWS2kyUFVmMGZmRVNBYTU1aWpvcE9xSkF6UHluZW4y?=
 =?utf-8?B?MGRoTjhxQkVZazlZNFJ6d2lUdzRaOEl3VzFQQUhWOTNwR0dFYjhTWUs4dGhY?=
 =?utf-8?B?eFZyWjVGTVBzMnVCajlCajB1czRwcmxOaFdXN1BpNEIrcUU0VXk5OFhBdS9j?=
 =?utf-8?B?U0tUNHE2SHNRRFFTMlVlQkRqU3JtNWFxYUZaaGN3NXdlYnRWQnBXQW1GZ0ti?=
 =?utf-8?B?MUZ4R3hzZ01zQ1VJa1NwTVJnZytUeGNHS3BIQlVPMmJGR3dIdmVGK3k3akIz?=
 =?utf-8?B?ajZqVnNLRHVsdlQrejdianpXa0xhRzJUMHpCalhVSEJJU042cUxJUXVNeStP?=
 =?utf-8?B?WGZLSlRZL1VUUTFrNGZDYk5jRVFrOXM2dFFnWjBkY3ZWblRYSlNVbkVxMkoy?=
 =?utf-8?B?VGlqQjZFSmV0Sy84Mk9JTHhMeGRxcE94YnoyWm5hd2VDazJXcFE3MWVPQzBV?=
 =?utf-8?B?MlJiT0c1b1Y3aWZ1UUkwRWtaNldLUlBUd0k0Rk1TTjVZTmpueHh2RnVUZzBU?=
 =?utf-8?B?aFI5ajNCNXFkSndDOVNyTE1sWHlMQ2hXbzhGRjVOOTNvWExPeTNZQ3ZyNjlJ?=
 =?utf-8?B?dU1RQzVsaXN2a1VReDRFWjRLOE4rM1ozZVBXQ1FBV2JNaXlVUVRmcEExMnBD?=
 =?utf-8?B?QnN1QVRLZTNIRE40UWM0eVZHaUFIYzhBY2M1ZVlBbkRFNlVLSjJDMmRiUEJn?=
 =?utf-8?B?WDZITGNmYzVWRDJlcUZ0eFlUY2I3cnBQSGp4OHNVc2lNMlY1N0JYOFpVUU1r?=
 =?utf-8?B?V2JDdFVjc1o1WmxrMUZTM3RvMDhzVi9BTm9FUDVyTTh4MlhWZjZsaHJhdjVV?=
 =?utf-8?B?TEg2YlB1aWhjTjN2eVVoL0crYjBVTmpvU3FLb2JHNmMwVGI5NGpYRVMxSXpL?=
 =?utf-8?B?MWE5Q3Z2MjFaanFhUFczcUxnZUFPSndFVmdVRDhhL01DdjNkMlZaM1ZPbllt?=
 =?utf-8?B?citycnVRMVpjcWY2bE9McWsyOEpLbTRtamJIUFRWY29uS09oOC9KUTh3SGt4?=
 =?utf-8?B?WkhpZmpPMnB1RWxzYUk0NS9JQmtKMDl5Z3NwcnVWVWtVMlVTYTVUM2tBK2Zh?=
 =?utf-8?B?SEpQNkVyS0tZbW5tU1NPZnpBZVZhTXdCRno4S0k1TC9uZkk1NEtsTXQrSytQ?=
 =?utf-8?B?RVV6anQ0QmgwMjErSTBPaHU1SUY5b2pBQkJGanh5c0djSGNVcmhqdWZlci9V?=
 =?utf-8?B?eHBQVi8rY25CQmhaL3VTUHNhanpQTGVHR3pMZXJtWnl5cWZiNVdPSHd5Y1J2?=
 =?utf-8?Q?vMf62EKLZsBlhGgz795vkaJ1jWsjMPCH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjJVUTl2UXJjTTg1c3hsaU05NU5MQXFUUWVMSTBYeTBGQ0cvSnhYbzEvL0VS?=
 =?utf-8?B?SU9EVHhwMSs2UUplb2lmUm5TMW1HU1l1eExHQnNDMVdjWUh1dkFOamVZTXNm?=
 =?utf-8?B?cGNLMndJeGkwZDd6V0UwK2gxWUZVcXp5ek5UdE0wYnU3a29wNkpVT1pRUDdq?=
 =?utf-8?B?dG54VE5WajgrSVh4VFZ5RE85d2lVaEZiRGR3ZlNzOEoyclVJT1RQbzU0cWQw?=
 =?utf-8?B?S3dYMFYzMGZIUGd5T0E0RVNQVTkzbndLcEtWR0FUM0FVRTVSSTZWc0Jod3JG?=
 =?utf-8?B?cXlkbmMyNS9objkyR0h3ZXNDclVNWHJaWTNnbVFrR0hTYTdncE5Gc0c1bVR5?=
 =?utf-8?B?czdJYm1kOFZPWDFKZENxZUwyM2tGM3c5UW5qN0crTWxWVzlUdWNScVRHTHU1?=
 =?utf-8?B?ZWQvZTg0V21lclRMbzhVMVY1citiRE5PbHl4UlA0dllSV2p0dWYzOWRHTFQ3?=
 =?utf-8?B?MHovQnlpd2tFclg1QXJEeWVYd212K1FxbzBENWhxOEpidnZrTCtrYWpFcDIr?=
 =?utf-8?B?TmtGemF1cWZhL3RHYnJtU2RlTE9Za2VjM2RpSU9ycDMwbjV3YUs0TkJsNk5R?=
 =?utf-8?B?N1N1Zkp3ZnR3blpOYkUvTzZINk9iYkg0UHVOcGtCM1E1empjZjJuMXdwN1R1?=
 =?utf-8?B?aldhTXZjRUw0WE0rcjBTaVpkcWxCQTRqVGthY1R5RlpTT1B4NC9tL1kvR1Jq?=
 =?utf-8?B?VzB1bDBhNUxQc2FBVDA3b3ppdnQvSmRoN3J6MHdhd1VBSzdjWmtUYkFVV0RM?=
 =?utf-8?B?ZXdmVHZSS081eG8rNWp4NlozV29EMko1bDRvaWhHczVWU25RR0hkOENWVE92?=
 =?utf-8?B?M0lFQ0JLSW5HVlNsWFVIK3k1dEw2RU4zcXVrR1FnK0l4MnM2dEFyWnNDOW9P?=
 =?utf-8?B?V3F5MURJNzE1b0REM0RWK3IyMURBMWN1VkJDQW5ETzgyZFVaRHRFSkVYVFFn?=
 =?utf-8?B?Z01yU3lmOWh5ODJqSmwwVGZ4RzdrK2g3VjhXUWNndGFWdTYwL0FmcVc5VkNq?=
 =?utf-8?B?dy93ZE5leHBaa2MxMlRsdEovb0N5SitnOVRBUGZYeThTUWNNQ1A5blUxeE40?=
 =?utf-8?B?YmxPcG5halZ2QnBsU0VoQmNTOWFYb2N6Q1hGK0tPblg4VEd0SlZqZHdoUEl4?=
 =?utf-8?B?Ym42OElRNW1tMERHKzhHWDMwTmQ1NUIxeVBoYUtIWUdQV1pWUENzWlpDTW04?=
 =?utf-8?B?b2RON3pNb3hraGF1cWowb2ZEOWtBQ0ozOWtxRFdYYUJKbXVkSFY2ZWkwVzJ3?=
 =?utf-8?B?VW1YVGtNa2dtTE5JZ0o5OWtXc0JXRlZVOFlHWmh2blZGMUs0RS9xY2dRWGNQ?=
 =?utf-8?B?Q1VQMG5FMmJIT2J2bHhPdWJLMmh6dE9xVGM3TkNyVFZ2RmRyemM0TlgycEQ1?=
 =?utf-8?B?d1JoMStDTDV6NlBqU25QOTdsaXVxWnJCcjFYdWFvY2tjeWFFL2RUc1Ztc3VK?=
 =?utf-8?B?UUU4V2lHN0dhdXRsdEZWQXNJN0o3ak01WWY2ZUNuOWY3Y3gzODNsNkV2RFFU?=
 =?utf-8?B?ZitvTmZzamtkQ2pGV042U084V1FZdWJ1ZzlHbDlZQkxDMnEzREF4YkFicTRI?=
 =?utf-8?B?YkdLdUF1bFgxWkpVTitlZzJ4NVRpRlc4ZU1TZDNPWmtieG1LK1AzU0xyZnFW?=
 =?utf-8?B?NkNZMW1jUHlrQTdFSU9pM24vNThOaU8yZGFTTFpSUzJPQUZ1bUYvU0VqZlB5?=
 =?utf-8?B?bHFMZTdhQjdZcFJ5eDhPc3hzR3J1TjRCYzh0czJkOXh1RW9vRWxHbGNMUnIw?=
 =?utf-8?B?UTEwSEdzOGc3WkRyOUoyM3ZMWUl1NkhpNkJlZ3RnMFJ5cXhFUkRqWHVtT1dS?=
 =?utf-8?B?Mk1kQXdYbUxjUW1XKzV6ajJNMVBSbEYzZ1pRc3h2dDFMbEE3Tmt0bUo3aExW?=
 =?utf-8?B?ODU2anc1VXNSand6UXhFNXp5QU5wdkRwWk5sRDhUNmd0S1d5YUx6WnBkc3ZL?=
 =?utf-8?B?OVRJekFScGhLZFdBT3haZTRKbEZueEYxRFZvbVBVblJZOVVXTkdNcVR2cWpj?=
 =?utf-8?B?bDBGS0Q2Q0JaMGNRN0hVaFBMM2lJeTlxMXdvUlBwV3lzSldKVjBOd3ZVMUR1?=
 =?utf-8?B?eXVuTzk2WHBidmgzWkxmbTNNWHVwMkdsM0k1OTVWdENLNnVCNXo2RGZmTHQr?=
 =?utf-8?B?WkJDU2FHMlRwYzNVQ2p0ZDNmL3kxRHpTcTJOT0dLeCs0d1ZqTlBTSWN1YlhQ?=
 =?utf-8?Q?xSTxQ5T/+vK48aTXvZBeKR+7lvzAcVKTu3W+nNXvXDAo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3383ffc7-e3ff-43fc-5edc-08de0d1e4d53
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 01:41:33.1928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPguYVO42tjKbBvaotm7coohfoU8ost5GHS702TdOzCW0FUkVFJkk38ThyxvxNkzEOZwrU4XXl55AFWDK5v5Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7213
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

On Fri Oct 17, 2025 at 9:56 AM JST, Alistair Popple wrote:
> On 2025-10-16 at 17:24 +1100, Alexandre Courbot <acourbot@nvidia.com> wro=
te...
>> On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
>> > Adds bindings and an in-place initialiser for the GspSystemInfo struct=
.
>> >
>> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>=20
>> I am getting a new unused warnings on this patch - we should either
>> annotate or merge.
>
> Yeah there are quite a few unused warnings. They're a pain to deal with d=
uring
> patch revisions and rebasing/rewriting so I was waiting until all the com=
ments
> settled down before dealing with them as it's pretty tedious work adding =
lint
> statements in one patch and removing them in the next.
>
> As you say the easiest solution is just to merge patches, but that just p=
romotes
> larger patches. I wish we didn't have to make that trade off, but I guess=
 if we
> want clippy bisection to be clean we have to.
>
> I will probably just merge all the bindings into the patches that use the=
m.

Miguel's suggestion of adding a temporary, file-global `expect(unused)`
directive would also work very well if you want to preserve the patch
sequence.
