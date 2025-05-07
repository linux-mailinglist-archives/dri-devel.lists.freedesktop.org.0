Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9C6AAE14C
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46A910E7C1;
	Wed,  7 May 2025 13:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WYApacyw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E062210E36D;
 Wed,  7 May 2025 13:52:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sL279KkE16yiQsVa9hi8pEMjTlMaWU76h7vkZKsjcS4Shy26T0B9btZ9wtydmVyCDPnUT1nuYCbD/wx7lt1M2LVzfFwCUEWR8rhSG6HDPXCrrDGs6aKOXchhc5qr3Zm6ab8rkFlGmizOtpwW1zCBCKdAeqnuX/7UTN1cV22NkVCbcAMu9M4scWw8UTL0YIrqqcMRyen92ALsc5GIPVlqlMcCw2yTCxSYhwzwhleY+SVq/R8rHh2iedc1auI1RUmYb+i5+R9PmatXrnK164DyjFiKunp3gnMEE5jBqIOY1UnECMSJDY0rNRutrxv93d3RMecgpx2bo6y3dtYO07nmlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5fn5BOL5M1i9E9djBbdLHqZ4DTyMzx3e+L+XnmzFq4=;
 b=tUKMaOe/SWOz7o/sq9nFZIjgV/7Ofn7aULq4bibkdIpsnzRQD2Uj9r0HxGqddbdUvllJEH4Aphb765Z4PsgNtcNp3vCLUoQAZv546CKvNY4ZDMRb5ezj2oki4mDk/MdJhmj7sHe9xjgwrx7iSFb2t4VNy14lHLeT7uZEmjkaa9WENgGdsGxyt655s5dtYKPHB3JENe6eKKjzumgpcCwLMNJ1aH2szlBtwu/8ELQHhSvkVUNS8b0qf6YQRO/nVRWXkZ53/Lz8m1IaEI1rr2NFRlZhgt8YaPMuUpkcsGk7rnPYNtZfZaIp9HF8D8r1BSRSlNlV3Zsy6CqCoU6BWnbowQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5fn5BOL5M1i9E9djBbdLHqZ4DTyMzx3e+L+XnmzFq4=;
 b=WYApacywBLcTr+ayvK/i32sCocEmZOBwtFzmY8g5oMZuVFGzcFG5B7vv/BZCy5+2QHCV59iA5hEQ8LyhD9SK480Zx4XiatHMO97DxcX+c9Cql3yzk0QAPXpISkzZmXpKxCmhgWFOPDIf/KR3GixzuYwU5AGq3WXH2Z1JvRjih+o/8eAsA6JxR1Jcu2XStQMypAHAfZexnlfvksuTTUB2A+HOLK9pI0KH/DTDKFy26d0PCDxBn0W/G9tV/JXjVB1mFo02w9R/B8UyiLcsab1Ewo/CxeqJNmB2ZwWjkkm2DAU3QuMJ/XDG/VBB0WpcC1dciZWUyThs5VoqOZChcWprjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 13:52:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:52:45 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 07 May 2025 22:52:28 +0900
Subject: [PATCH v3 01/19] rust: dma: expose the count and size of
 CoherentAllocation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nova-frts-v3-1-fcb02749754d@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
In-Reply-To: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY4P301CA0031.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cb2cb4c-2d17-4ee5-21b7-08dd8d6e71e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVNsODdGY0pqblROWHZUMnhmYkxTOTJZb0FpREg5cUg2WXZxR2NXTytPTGtM?=
 =?utf-8?B?L2RUd0VzdmJCTEZyZXNITTgvV2ttS2plZWpXUW5tb3FqK3RFNTczZmZ6dGdT?=
 =?utf-8?B?MlBtK1IxMkp4ZzhnM2FzWVFJL0dEbVRBTmJ3NzNxOHFrRE9zaHlvTFpuaWg2?=
 =?utf-8?B?RGNlRTRsMkg1aFBmN1pSUGUxSVl2Yi91K0ZpaVIySGlOemp0cDhDa3JvbDh6?=
 =?utf-8?B?V1Y3SjFPYnFtTkxZMERiNEJjVG54M0JyajhGdngwR0MxT0NEYjB6Y09QM2ZV?=
 =?utf-8?B?SEJBbEJPdzJUMDM2K2xTbEtVcllzQWlwT3ZzUFU1UmNXTFFNTmhQMEVid1Jo?=
 =?utf-8?B?NTJHc1VGQThXci85ZlZ3NEszWXEwRVUyL0V3ODRWWGdaYTg5alVnMDR2NC9s?=
 =?utf-8?B?endqV3YzREhoUDdQZzJPRFBMdUZBbG12MTRMYlpFazNLZmhxYjIxUFdSVURM?=
 =?utf-8?B?aVhrMWJrSDg4dTFvM0lYaFRreUYwbThzbUMrV0sxRkhSTEkzT05Uem1TQXRL?=
 =?utf-8?B?WXpyaHpoYjVmckEyd1h3TFdWU3BkNUZRYUdmVFVpK09VZnhnYjh1eFo5SE5j?=
 =?utf-8?B?WWJ5SU13dmRGMkZrRzllWnBEZjRSNTNiVHl2S3hndzZGWkJvZElmZ3EvemQ1?=
 =?utf-8?B?VGNkN24xM083a0ZEQi9sWmZ3UDJSUHdmTm5CUW1WUHE1WDVpamllVnhNVTha?=
 =?utf-8?B?ajBQR1liN0JXNGtNRUo0bkNDYUsvSVVtZnNHSWYydkFseEYwcG10RkdnSnZG?=
 =?utf-8?B?ekZrZEp5aWtHV0VuejQyVjErZkwwSW12akNqVmRxZGNHZWFFWjNOT3lFbnAr?=
 =?utf-8?B?R1hWVWZncEtQc0ZiYXpaNjhxQ05qRE9hdWIwUXVkbXhubW1XRHVRdW5SczRC?=
 =?utf-8?B?NkJaRGhxQ3IwZEIvOW5LZFVjL01GTnhhelB6TmhrdE5nOFJYcjY3cVZHclNh?=
 =?utf-8?B?c2N3RGpqSTBjTTlYUUdsQ29FcEM3VC9zQnc0bjFnbWxtdXkyM2NXSXo4c3Ri?=
 =?utf-8?B?cHBYSUhuV0VZQ2V1R3pRMEp2VFZRZWZLaFFyVjhoVmNZeCs2ajFHTkpocVZi?=
 =?utf-8?B?S2hiSjJzM0J2TTJic3ZmT0k3S0tudG1sMUZ6ditBN2RaeGZCdGJmLzl6VkND?=
 =?utf-8?B?cnZ3MU1udjByS2FzQzRLOUtqTTRucnh6empyYytyR3A3d3dKWStIWUxZRDNB?=
 =?utf-8?B?MjI2TDNEaVJ3cHg4cXQzVmt2QVNuTE9aUnZiQUlzUFVjU2RLL1U2L3ArOHRF?=
 =?utf-8?B?MGhBSmlCNjV2VHFoQUhsUmNRWSthNzlyWGMySjBGa3NHa3pzN0xzbWVjczlk?=
 =?utf-8?B?WUhjT2M0UzZwTUcraXZhREhsL05MNWFPbXc1TTJGd2ZSNGVzUmdqQWQ5VzIy?=
 =?utf-8?B?RnhXNWg2dUV5cmIrKzJ2QVpkazh3YmhsQlU1NG04NWZJanNpMDNUOGlUeURV?=
 =?utf-8?B?RWVwQmRGNWxlMWdxZXgxekZkOEhrSUNnUkl5ZzlYYjNkTUpqeUZYb05Da3c2?=
 =?utf-8?B?c2dYRnZZa0RlL2xOeFcwb3NqZ09vYmUxSFpPOWJpRzExWVFKb2xVKzZvaTFT?=
 =?utf-8?B?TWt2UFFiUkV0NTZYYmpYZTNDdzRBeGJDSTRlbVlGTnFnWGp3WW9ydFlyV2Ez?=
 =?utf-8?B?Nkwva3dnbVc0ditseXl2UGdPcXNmZVRRQWthWjZYR24raVJ0cUdBQi9SZGE2?=
 =?utf-8?B?NVhnbzkwUFlQaE9XNlNrVHNSOXZvRUtJbVo0Y2IxQ1FjYW5OaVF1a3lpTnFP?=
 =?utf-8?B?MzZlRmRkdTU3MVRscEJLRkhrWlkrUG9wQXdpa2p0b1gzUnFYOTYvOXFGY1pa?=
 =?utf-8?B?dkI1dDllRFFCSEpPOEdPc29TWVRPaWhvV2plR1ZJajd3OTd5RnlJZ2hxWlJv?=
 =?utf-8?B?VTZqWmZ6SnYwNENxVkhEWTh1WFpNL1JxUHdWYXZKWDZNLzVTQzR0bWdaT3hI?=
 =?utf-8?B?ZWM4RXNIZ3Y2SGh5M2dZSWx4aHJDYnVsZlFSRDZyL01YOENoSTRjYi9NeXZ0?=
 =?utf-8?B?R096d3NyNlpBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXBGSTlENVN1aXZYWHFUTVJlcE4zT2srTFp0cGhPZzNIL21kYVpXVmo1TXBj?=
 =?utf-8?B?ZTBJZE1FNE5SUWVUNHZNVzhPZEVNMWF4Sjl5aFgvcEZIK245dGxvZkRYd2RD?=
 =?utf-8?B?V0FvOU9jcjE0YkRYNHI2U3BoNVpzcU0zR055VndoTnE1bTVrVjdKOGZHNDdR?=
 =?utf-8?B?eXVLK0pDWkNwTXBxMEh5cFliSW5wK2JlNm0zWmQvbG1QcEN5RlhSMzdZWDB3?=
 =?utf-8?B?VmhxMmExRmgxQ005QXk5WWhIa0RPR2RHNkU0QmpqbE1SSHRiREpZenptR0p2?=
 =?utf-8?B?YzZ4K1J1VHVydXN0L0Jqckovd2puRytrcXVHa0VzZVJQQWJwZjBPNlBqRlo5?=
 =?utf-8?B?V0xqanlDd1l1Z1AwMG1VNng1dWE3UXhiVnp5ZFdxVGpPbHRVbFAwRzdxNUpm?=
 =?utf-8?B?Sm5YVE1XNmNaZEFiUXhObVRDWVBrSXIxczFhcUdqQXZsUHlzcVRlTDdUNVJR?=
 =?utf-8?B?QzVhSlp3eUhGejJEMGQ0UVFlOHg3ODZPdzF6TU1XT2V5d3crVEZuY29xY2pw?=
 =?utf-8?B?Z3c1U0RMOC8rdFFlNndJbW5uVmROZVN1UVF0eTZXQmttTlJXV3p3bVMzNHZE?=
 =?utf-8?B?Z2w2cFFaNjZoSGUxNHd4bkpIYUp4bjBXYy9MZ3ZvcWRlbkYrck1qWmJUWk0w?=
 =?utf-8?B?ZXJpckxRSWZDRnNvb3JMY2ZsZVlObFFYWVltMHNYZXVCUUIwY1ZnQ0dQOUc1?=
 =?utf-8?B?SVUzdTFycTEwSDUybkQ0amhHcWsxRndLMjhyaXVhMDhTd2I3R0RpRnN6TWFW?=
 =?utf-8?B?QlFNMUNXb0NOajFibm5ia2hVb0RUZGxiOHFMMUN1OVJKb0NEczhGRG4vbjlB?=
 =?utf-8?B?Y250STdnOGpydXpRQVdlelJNdmZUeDJkenNvZGZsVGxvT3BlUlNjdGE4R1A2?=
 =?utf-8?B?ZXp6QXlWSkYxbU5sakpleDlnRjd5dDUzdGMrZ2lSeEViQXZpU2ZxZ25QTzBX?=
 =?utf-8?B?MmxlMk9URHd5Qk9uT29iVkY0OTdyQnRhZkZtMlMxS3FLWXVIU1d2Zm95N1RB?=
 =?utf-8?B?L1plR3cxekExM1c2MWFjUDZONHM4Qlc4aFhFSy9QVUJTc2FrbmpodDBMZHk3?=
 =?utf-8?B?SEt0Smw5SUx6c3lodDZ2MFNyTmV1ZGRtSk5mcVFvOHJkWGU2TklMZUE3bnVM?=
 =?utf-8?B?OEVkUUZQQk5WSUNtK0FPU1FQNUxnaE41MURzVkdVdURhSmw3ZnVXaWxld1lx?=
 =?utf-8?B?eERHWHhqN2h0Q3AySUIzUmw4Vi9kOTJHSnVXaHJ3cjJwdTZ2SnNHYTZYbEdj?=
 =?utf-8?B?a01icFlvMEg3bFBrT2hNbjlhcWtwM2lkSG5LQmNwSXJROEwrTnpNS2FYalp6?=
 =?utf-8?B?QURrc1UxNFRKV3d3alBldGJiSU9FcXBEenJzVnpZL2FNZC82UHlqaTZQUkFm?=
 =?utf-8?B?WnlJNnQvWk5NRFFGbGZySE16cVh1UUFOLytOcHFrZXNGdkhhU29tQlBCOFNv?=
 =?utf-8?B?akZYL2gyVmdpQnpRMm1RcWx4LzZyRDZMRVJSSzVNM0Fob2FIdnZlVmpYZXFR?=
 =?utf-8?B?VU5aQlp1UXBhWU01Zk12N0tQWFNSYkp1VDhvT2pSclRwdmJuQnd6azgrR1Fh?=
 =?utf-8?B?NjdlZTYwUVBHRGRlbCtpR2gvZU9wV2RxTGMwOFN4UXg4NjRYd0VBOVhkdlNZ?=
 =?utf-8?B?U1ZKWm1saXY5emljQXgvd1VQeHlUeXlpZWhFeHhKZVVkOGNLU0x1Q2tpRzRW?=
 =?utf-8?B?NFVicUE4Nk9ET293OUhKMnZXamdaQ1F6ZWdCanR0Qm1HN05oVDBCYkNZV25F?=
 =?utf-8?B?VDNpR1JSYi9iWEN4Z3RYMm9aYW5YNG04MzNNMGQyVml1b3l6OEZ0UDMrWXJ2?=
 =?utf-8?B?dmhnNFhCcEo2aklVSURLTlNaMWgxOTR3WEhnc3UzTWVzZ290cXp6VEttbDl5?=
 =?utf-8?B?WThOcVRPQmZ6N1Y0NHVCQkdvVWc2a3dudStkSklsQXI0OGZhWnFhK0VOZ3VI?=
 =?utf-8?B?cWVibi9ZaGRTMFhWRnBTbUJ3bUxZVkJmVTBPRHhMUlFyUUtBMGJEemlLVHhX?=
 =?utf-8?B?eTVZcWUvVmRJbExLbUEwN2YvMW5reCtWdXVRVUk5TDEvUGJ4ZWJURmpJcFJ5?=
 =?utf-8?B?d3dtS0FVVTFpR0puTU53Q2d4V2tQUjVNNEpHcVJwSExSUjh4OXdCV0xKYnpz?=
 =?utf-8?B?SzRlRE9naFNBaEN6OW9FU0tDQTM1T1BOZm9ORmN2V20wTStOdFNDanhIelN4?=
 =?utf-8?Q?4hNFWPU3pTCGAw3PeuduLe9wKXGXPoM3TP5hn6pI9+mW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb2cb4c-2d17-4ee5-21b7-08dd8d6e71e3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:52:45.4411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ybk04sucz+rhEIVdo/+Zpdkf/bxXFWIHXZcnlkFXtC+9p4GAHLJRuuMEtYPWh4pMFZkzArFPz5mGzQvf878U0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761
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

These properties are very useful to have and should be accessible.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/dma.rs | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 605e01e35715667f93297fd9ec49d8e7032e0910..18602d771054fceb80c29278b1945254312ed7c6 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -201,6 +201,20 @@ pub fn alloc_coherent(
         CoherentAllocation::alloc_attrs(dev, count, gfp_flags, Attrs(0))
     }
 
+    /// Returns the number of elements `T` in this allocation.
+    ///
+    /// Note that this is not the size of the allocation in bytes, which is provided by
+    /// [`Self::size`].
+    pub fn count(&self) -> usize {
+        self.count
+    }
+
+    /// Returns the size in bytes of this allocation.
+    pub fn size(&self) -> usize {
+        // This is guaranteed not to overflow as the same operation has been done in `alloc_attrs`.
+        self.count * core::mem::size_of::<T>()
+    }
+
     /// Returns the base address to the allocated region in the CPU's virtual address space.
     pub fn start_ptr(&self) -> *const T {
         self.cpu_addr

-- 
2.49.0

