Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C08DFA96BFF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 15:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A5E10E599;
	Tue, 22 Apr 2025 13:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OtWs5pn1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD6110E599;
 Tue, 22 Apr 2025 13:06:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/H7NS+E60nvoGXOIKQozzFaotKv2opQhbFkSP0RAlwatIf1Egw0U0WqIOqBRJvfuVGE1guFSh/oBbnu1qTaXjdWJ1NpYlTSO71tKuqyILKiNs5X50Q3jLKjak9QOp9dBw07zIA26OmyVNWzdBGxobRBCyQjFfOyhV7zi+XGbNBN4LHtx3FLCgQg3beZAZVDmDHGAt6l9yBINX+3hS4M1OisDq1ht/VvpbM7sW1UCMsGvpjL99MrlIuh+YFzVg3tlYSZvLKBoRxIjqFi2YZEQJD14I+dOEI+qMSLXR8eZIk4MVcLPZuCH+UPxiDe/6uv2BbwfsToZnZie8/F0kqE+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBMIhY/BV38RffgaGGfngAzdUbQcgbwHFS4lqP6pr94=;
 b=Uxw0i5CMRmqNZQcyM8cQzbv2mulZREJRuW7QbLmNWlQD1q56BEFe/GNcaCOfghcuigmPT779eMa2CgZHYYLYLOd2vNmb6qp/4dWDwHXd5bYP/9g2LPiEhXpjG656T8UeZGN+8X4JUjcKnPkWXFn+6w2/07QwVSzAW/UKx/dlke66PNbVjQ0kvMZioHBo7SP30KopJldTww6RPdrEaMnIvNs9gMF78Kvx8V0kRQwPaAkTenOtLGL6OynYeo6ZcQ+be8tG1+6aNl5I68CiLfxCIPGN3b83o41SpyJJxGnOx06hUXsQ1PS1oW5tLNSzY2DuG/xiJyUT3J4D1ZmcNAX39A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBMIhY/BV38RffgaGGfngAzdUbQcgbwHFS4lqP6pr94=;
 b=OtWs5pn1S2S7Ja4mz8qPD0U7BlbAAcEBhE8yHdZ3ZVdbUAsBgRyqJ52r1RYysmaqAbiC9fKu9LOrjCobGcV1WzEFEe5eb558lSmA8jMOW5wwQa/1voaO65kuO5XynMKqg/97L107HEQKIPaER4otUcU64up29FY/hX5+lkzfl36gYiZCAXyB6XQJ7EOTI7jU8p+U1YUGtqUbn7YykvnEeAN5QKuvZTEvv4lY9yGk3YhirSYbPQHcZjV9MeERJjwcpjVtgpl4dh3o8caNW6gXo+RGb6pOPSkMDbkmHrvk6RHOhzfsH8GXYkQaojhv4cgFI4aPSJCmpfKjT+564KdRFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB5660.namprd12.prod.outlook.com (2603:10b6:806:238::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.26; Tue, 22 Apr
 2025 13:06:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 13:06:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Apr 2025 22:06:00 +0900
Message-Id: <D9D6UCL4PMJY.1MBEFIIHWT5F5@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>
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
 <bskeggs@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 08/16] gpu: nova-core: wait for GFW_BOOT completion
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-8-ecd1cca23963@nvidia.com>
 <64d869aa-587f-49c6-8626-d2085441bb3b@nvidia.com>
 <aAd9ZlV5_qokiFYn@cassiopeiae>
In-Reply-To: <aAd9ZlV5_qokiFYn@cassiopeiae>
X-ClientProxiedBy: TY2PR0101CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::27) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB5660:EE_
X-MS-Office365-Filtering-Correlation-Id: 94127901-35b2-4a3d-bfb2-08dd819e6f6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0NhMFVJUUlnL0dVOG5WVUFLS0lJd0ZBVzRMRlk1UnB6TFFyYzJhbVg4WUJ6?=
 =?utf-8?B?T1FQdWw2WDRPTGdiUGQ2K1VuSFZPeTZqYWxuZ0pzbmoremxKSXFBZExNU0VB?=
 =?utf-8?B?NEd1bThPSVBpUEF4RFpYSXk0TVJFUnR0c0V3VFhXem8xcTFySWtLQWpiZGYw?=
 =?utf-8?B?MUVxOWJWTG9aa2IrbDhTMmdFR3BLWFArejNQdE54OXBoQnlWM05hWktaQ3oz?=
 =?utf-8?B?USs4NGtMYXZ5Vml4UWpLZUtJcldvaVdjcFRZc2RxU3NLN2kwbEduS3VUMjRi?=
 =?utf-8?B?UXF6VkFuZmNReUY3SS9nOXh1b0xFU3RGSjdkTlFxVG9NUXQ5d2RKZkRMcE1q?=
 =?utf-8?B?WHBnaHZKMXBRUFdIdEFweE1XRnpCaTRZc0ptWDVuRDNVc3I2ZkVuVWVxUHFZ?=
 =?utf-8?B?SGlSZUZhcnNOREZmeE1TTTVEZDZwTXNUNWFlWEhEV2Y4NDlZK0FETndBU3VH?=
 =?utf-8?B?S1ZpOC9IdkZCL09Nc3VwNytyMnNOa3Yyc2krdzZwNHRBaVBuME1CQ1Y4VTNn?=
 =?utf-8?B?bmQ0SFdEQTB6SmNvZEFMbzRXMlpHNUFJbkhTUW9TQVlzblh5K3BydnV2RjZo?=
 =?utf-8?B?NGpFb3NSb1ZCU0ZuM2xqTlNONXlGVG9QeW5RbW5BNk9lOWxMYVFRa3RHZFZB?=
 =?utf-8?B?S3N1QXhUZGJ5NisxSUlSY25YT0paWWJLM1gvK29QdHhtVDF2b3U3SU9Vdm1J?=
 =?utf-8?B?bUV3SHNYM2NrQmpvZDNjREJ1QlhnK0NQbkhSS0NqczlwdE9KY1JTQUlNVHRx?=
 =?utf-8?B?NmJSeGVlNWJERzNmREZ2MS9oWlA0UnVnVTlyMGpObXlMNmdzV1ZhT0hHVWgw?=
 =?utf-8?B?SFJsaURrL3VESk5UZnppRytIRWZjY1JuOTdrZzBqQTZJemNsRUcvOThYc3J3?=
 =?utf-8?B?dTlmeFpoRTJ1SUorVTloLzlNN1E4amNaVTZMUFViLzZiWnFyRXhnd2NveUpn?=
 =?utf-8?B?bXgwMlFXM1hpcmNhOGhCbThLVENnSjhSaVQ2RVFaRHluYzlqR21VQnNsSC9H?=
 =?utf-8?B?b2JoSkZTZTZrb0JtYVA4M1lENG1rN0U4MU5TZ2xVSEp4NVhDMDdVSXlyYk04?=
 =?utf-8?B?bHdVQzZKZmEvejlZcVVmUDhZYmI4dGVObnN1OWltOGk0TWx6cU1FdTE0NU1V?=
 =?utf-8?B?VmpsRGN6eVU0L0NoZzlac05aZm5UOSsxaklSMFNoejRQN3ZwSzNENGY5ZmFo?=
 =?utf-8?B?aHY4blA0NEZYTHVLM1h0TS9nWDV3NXRPbmpCNEF0YTk5cGQrenBhNU9wRmNL?=
 =?utf-8?B?czhBekc4L0lvZHplNVZhb3VjdEVNRkFpemhFem5mZDNnTitXK2xHS2Vmd3h1?=
 =?utf-8?B?UHY4R2RiN1FLUGtTd0hINTBQS2VxMnZTeW4veSt6S1RyTWw4bWpDWEdUempX?=
 =?utf-8?B?QkwyVEZWWEZvWkpDdmNWQmhGVmZ4SEZWaXhUM1FGY1dRallGN3h4cWZOWTBw?=
 =?utf-8?B?ajRld0lqYzdnWENaazBMVkpZSU5YUTlQSFBabWtYR2hxeXRqUTZQQUtvK0tz?=
 =?utf-8?B?dHlZY1JPc3hSeThxRzh0QjJUYlg5a0ZvZnlabTF2Zlo1VjZXZ3Rvb2ZDblVH?=
 =?utf-8?B?QU9aVVlGbkRPbCs5WEpjU1d6VWhqUktNeGI0anUxOHJNMUZma1U4dnhmZ1FG?=
 =?utf-8?B?Y2hySUtKUE9nbzZXV1lIUlhVdmtpM05rSDI3b1hDUFlNT012OE9vZ3A1cm1E?=
 =?utf-8?B?SzlPRnV4dTFyMEZwanJoait1WHk0Ti9OK1dYYUJwZWdIZjRKRmRrQmxpQTBp?=
 =?utf-8?B?Z1p4dXpyVENDOHNJYlJNMVZIaDhYWU8zTE94Rm1TVjZjRG8ySHk4QjdUZmhE?=
 =?utf-8?B?RlJmckFJVHZrSlRkK2VXMU5QRmFiRVkxaC95TzNzRGMwVVdCQnppU1Z3eTA4?=
 =?utf-8?B?MTVrWDFlMVcrSXRualBtUUFxQUJDTjByV3BVSDNsMFRFSkx2VFIxYXM2Sjlz?=
 =?utf-8?Q?lEzgrkv7mWs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0pRN2V0bWd5R3NFeE1KWEI2VVFld0ZHcFlMYjlWcmg2K0p4VFhGQ2VUaDRs?=
 =?utf-8?B?ZjFIblZQR3hKSXV4NEh5UmIxTWgxODRvbjhYMFdLRTdmZjV5UWV3ME9jbnI4?=
 =?utf-8?B?bEpSTjUvQ1MvVXluNmVGVWFnQXF1TW45QzVaUE8vR3M3SGhTcTJZbzRaSFg1?=
 =?utf-8?B?RnJmdnU1OCtxZTVmYW1NZ2JDVlJDMXdtZ3pKMjAzV3hXeGVKOU91cFJETzEw?=
 =?utf-8?B?RFdoNTR0cHlOa0FvZEdOODRHQ1hiMFQxWDk5N3hQUGdTNjkzTFpsQ3BQVVBH?=
 =?utf-8?B?ZWlsU3lsdnVlOHl0Zm1ocXZjN1l1M0tibFQrWnN6VFhMMzBYTFo0VHRoOTgx?=
 =?utf-8?B?dmZkeVZITUIrQzh3UTQ4RDJFWnh1aG5uQmYrQytKejJuRXZlVXp5RFBpQ1NS?=
 =?utf-8?B?YXd2WWY3Uk1Lc2xGUmtIY3MxVVl1N0xTaEl5TmxFMWlIdDR3b05YYTN4Ym5i?=
 =?utf-8?B?V2FYQVBXOVF6TGxuOGJidFF3dERBVXJIdEMwa1g3d2x4MHJ6YmJyVXZ0T0JM?=
 =?utf-8?B?QnJiV0IwUlJoME5DRWlxYnppMGZlanY2T3YybnpoSUZWck84Tnc1dlp6NXl4?=
 =?utf-8?B?V1RST05YVnJFSG1xM2tKZ1psN2dTajRHMG0wdytBblNLaXY1d2JUVDhlbm5o?=
 =?utf-8?B?Tk9rdVlWYnBleDR3TFhCbkExN0hHR25DRG1ScEd6UWx0ZTdYNkZDdnVZOXNl?=
 =?utf-8?B?VHFxdWFPbzBJVXdBWlduQVdXUHQ5RTRPZTMxTWhKZjVkNmdFYXhXWmQreS8w?=
 =?utf-8?B?TTE3NEJmSUc3ZWw5YlMxVTZSNWVPcFgvTmlSV0FyVW9DV21menRYV0pyUWMx?=
 =?utf-8?B?OW5CdlZOKzUyMEF0Z0M1ckVWUDB4YTExaWdVV2xFVTVqK1ozb3dFNmFUbHJY?=
 =?utf-8?B?Q1B1RTZQaDN4S1ZUd3FOKzFHS3o0a0JNaDNyWmVlUEJoOUY4cmt3dEVyeDJY?=
 =?utf-8?B?SzIySnBCVmRsVC9tdTNwL1FiZWE3cy9veFcrMStMWGlkMDBqTUFZNVQ2TUh2?=
 =?utf-8?B?T2FPSzhqeFAxRWMxOGs5Q1U3NWhIeDZGVkc1ck5FOHloV25LWGdwNDh3U0s0?=
 =?utf-8?B?b1Q4N1VRMGc3VDludWJDRXRLUHloMk9QdHNvU3dKY1VFc0tobWpqLzY2NUtX?=
 =?utf-8?B?dm4zMWpEVUR3TDVyVGp0cklUbzgrR1RRUkhaUWEwRkdqMXpXekthUzcrNTY0?=
 =?utf-8?B?MU9HczZ1WVgwWmhPSHhIRWFVTmd6VU5kbHZ2OVVFaFhRWE5WTkdkdnF6cGJ3?=
 =?utf-8?B?NUd1ZFNoRGtXVXBnWGJGWloyWEFoN0p2M1IraDdURTBISkZzRUNoUGFXeGNE?=
 =?utf-8?B?N3F6MjlzbklXQ3NHZGpFTS9tUkRkejZmQlY5WTc0anVFNkhSTUUwY0ZkQkc5?=
 =?utf-8?B?aVJvQUtzRjhOZlY4V0pXQ2g1ZjBmUWdPWFFtYnhrUytVc21Tc0QveTRqVjJw?=
 =?utf-8?B?Q3FsK2ozREw1bi8rRER3eTRFb0VjUlJGYWZRbEtRUVU3SVlpSmEvNlVvNm83?=
 =?utf-8?B?bU16VmhXUEhJOWw3NDdRN1lNVmN3VndFYnFCSWxRU0FlQVJUZUpqb1ZCa1Fw?=
 =?utf-8?B?YnBRa3ZQMXVaL2ZaKzVsMUdYMFpEQTFqY1h3UGI4alBEakZlM2hpVW4xRXZB?=
 =?utf-8?B?Yk9uSFg1a1FQUm9zVjFrZFpHQVpOTE0vdDIzRUY0ZkRCek5MYURqMmlGUTlK?=
 =?utf-8?B?Sk81RG95Z1lQeC8yUm1vRHJONnV4QURyWndvRU9SN3ZSWVBxMGliem1NNnB4?=
 =?utf-8?B?cjlZa3V4UDA5TnFjL0NrZjVtQzlNdzhXYjdVdUlXLzFQZGJLRWRQcSt6Q1dW?=
 =?utf-8?B?NjQ3NmNNNXI0Y1VTZVlHR283YVFuWkZsVkJFVUYwNmVZYkdUVWNVR0l2TjZa?=
 =?utf-8?B?T3p3aDY4L0pySTIwczRUMHdMRHNlQ21sQUlmUW5UTmh1YkdGSWZmM1hYZThD?=
 =?utf-8?B?MStXMElrLzFKY3hEd3JKc1drSlJFa3dHQ0xNY2R4YTF0WmJETVRGT0VGQUs4?=
 =?utf-8?B?dE1EZlBRTzloZnVPdm1CajFJZGQ2cE9NU3k0MWVWV0VSTmpIOTBnNW9sOHVF?=
 =?utf-8?B?MVJETE54YW5YcUFGOFltSjBBMWJFcE9ibjNjN2FPZGRpTHN0Nld6a1JGaTBl?=
 =?utf-8?B?RzBLUXZvajIzekd0dUV4N3ZYMW5LV0JhMW11MXB2MmhYVkdiOWdwWld6NUE5?=
 =?utf-8?Q?nay1liB8w1AmYd/dgMfPtbDq5oJgRkVrAfg/4CU+zwbk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94127901-35b2-4a3d-bfb2-08dd819e6f6f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 13:06:03.2841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22uhPO1zD6N27CDv61dr2RAGj/py5W4krR0mIeHJ89gnbEqHgXzWorfQba3/rbWYAIY4MkVdynBXK2YOGNHZbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5660
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

Hi Joel, Danilo,

On Tue Apr 22, 2025 at 8:28 PM JST, Danilo Krummrich wrote:
> On Mon, Apr 21, 2025 at 05:45:33PM -0400, Joel Fernandes wrote:
>> On 4/20/2025 8:19 AM, Alexandre Courbot wrote:
>> > diff --git a/drivers/gpu/nova-core/devinit.rs b/drivers/gpu/nova-core/=
devinit.rs
>> > new file mode 100644
>> > index 0000000000000000000000000000000000000000..ee5685aff845aa97d6b0fb=
e9528df9a7ba274b2c
>> > --- /dev/null
>> > +++ b/drivers/gpu/nova-core/devinit.rs
>> > @@ -0,0 +1,40 @@
>> > +// SPDX-License-Identifier: GPL-2.0
>> > +
>> > +//! Methods for device initialization.
>>=20
>> Let us clarify what devinit means.
>>=20
>> devinit is a sequence of register read/writes after reset that performs =
tasks
>> such as:
>> 1. Programming VRAM memory controller timings.
>> 2. Power sequencing.
>> 3. Clock and PLL configuration.
>> 4. Thermal management.
>> 5. Performs VRAM memory scrubbing (ECC initialization) - on some GPUs, i=
t scrubs
>> only part of memory and then kicks of 'async scrubbing'.
>>=20
>> devinit itself is a 'script' which is interpreted by the PMU microcontro=
ller of
>> of the GPU by an interpreter program.
>>=20
>> Note that devinit also needs to run during suspend/resume at runtime.
>
> Thanks for writing this up. I fully agree that those things have to be
> documented.
>
>>=20
>> I talked with Alex and I could add a new patch on top of this patch to a=
dd these
>> clarifying 'doc' comments as well. I will commit them to my git branch a=
nd send
>> on top of this as needed, but Alex can feel free to decide to squash the=
m as well.
>
> Fine with both, whatever you guys prefer.

If that works with you, I will put Joel's patches improving the
documentation right after mines adding the code in the next revision. I
know this ideally should be a single patch, but researching this stuff
(and producing a proper writeup) is quite involved and a separate kind
of task from the quickly-translate-code-while-peeking-at-OpenRM work
that I did.=20

>
>>=20
>> > +
>> > +use kernel::bindings;
>> > +use kernel::devres::Devres;
>> > +use kernel::prelude::*;
>> > +
>> > +use crate::driver::Bar0;
>> > +use crate::regs;
>> > +
>> > +/// Wait for devinit FW completion.
>> > +///
>> > +/// Upon reset, the GPU runs some firmware code to setup its core par=
ameters. Most of the GPU is
>> > +/// considered unusable until this step is completed, so it must be w=
aited on very early during
>> > +/// driver initialization.
>> > +pub(crate) fn wait_gfw_boot_completion(bar: &Devres<Bar0>) -> Result<=
()> {
>>=20
>> To reduce acronym soup, we can clarify gfw means 'GPU firmware', it is a=
 broad
>> term used for VBIOS ROM components several of which execute before the d=
river
>> loads. Perhaps that part of comment can be 'the GPU firmware (gfw) code'=
.
>
> Yes, we should absolutely explain acronyms as well as use consistent and =
defined
> terminology when referring to things.
>
> I think we should put both into Documentation/gpu/nova/ and add the
> corresponding pointers in the code.

SGTM.

>
>> I find this Rust convention for camel casing long constants very unreada=
ble and
>> troubling: Pgc6AonSecureScratchGroup05. I think we should relax this req=
uirement
>> for sake of readability. Could the Rust community / maintainers provide =
some input?
>>=20
>> Apart from readability, it also makes searching for the same register na=
me a
>> nightmare with other code bases written in C.
>>=20
>> Couple of ideas discussed:
>>=20
>> 1. May be have a macro that converts
>> REG(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK) ->
>> regs::Pgc6AonSecureScratchGroup05 ?
>> But not sure what it takes on the rust side to implement a macro like th=
at.
>>=20
>> 2. Adding doc comments both in regs.rs during defining the register, and
>> possibly at the caller site. This still does address the issue fully.
>
> If that addresses your concern, it sounds totally reasonable to me.

Sorry, I'm having trouble understanding what you guys are agreeing on.
:)

The most radical option would be to define the registers directly as
capital snake-case (NV_PGC6_...), basically a 1:1 match with OpenRM.
This would be the easiest way to cross-reference, but goes against the
Rust naming conventions. If we go all the way, this also means the field
accessors would be capital snake-case, unless we figure out a smart
macro to work this around...
