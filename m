Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8388AC08BF
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 11:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA1C10E200;
	Thu, 22 May 2025 09:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qEXcKL4T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F3110E200;
 Thu, 22 May 2025 09:31:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhxKcXLdILZ4L8HFHnovsfKOoLFYZMukjzOqEWARkZxgr8mtWZcgCPxvfbFslTjTqmjo2KtSweTQ7ojGbXF1HlGUwPNtR1MMLZjE1HwsZws7JclhTf0rPuE4vWmliDRechZkJmDBzJl8mkyYCgBeCV0H/J9uxu21348787OBBfkzO3Rs5GG2svdexZB1YyPW/+yKorkjJfTlO8ZsRF3dxV5Pqy062+dfmIjoBBI+yZKSP+94vYOjdOY5jFSivN1oAIiLCzER5jSl3UdXa05sxw8iGUfteVTSvcIzGGIPSHPJyBJP++XW0rsbIdVmHAApNF6D0/VyUMjdiz1jI3ZrCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7epp4AdYoBenimOmfcMrKkbbmlb68XyEvRatlPJiNiU=;
 b=zIj2IPi22zVnol8+9NAD4M1yV3vBSH535HkopOv17kyADWmoMk18u7ikQ0zKARZKenUwLB6XetpZV/npqw11FoN4rKg4Oapb5wUTS82AzHjNXQJvkKySBOhLtOoUSPbYYzdcbismtgI73QAPEbkpycVhG1PGIKclcETG723uxzvJlQ42h7qcwVxCh3sZUQhCpogzm0tMlxyv3pI31/hEcCnXbr3lhLEakq0c0jWFSaoFSRVqwkuiYf8jSReeIw2IbgIgYq/f0w8ivAVtNahvhz5v+E1C6bhc2w1Sua4oDSpfpTeyo1kFBh0P1FIb5S+LrUTWE7NjpevGaheLVXmKow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7epp4AdYoBenimOmfcMrKkbbmlb68XyEvRatlPJiNiU=;
 b=qEXcKL4TpEKiD/K8p9QmgnY+RCPbk4mwxIPIkuj8hccgdjErXbdiaUGaSepzUBQQNNb3U9Nk7UlBYhAO1P/CHlDXvx140svfmg6bZsGNlEsAUchxjkFSBFYHet6HfdiqjlQ4HadHfWdg+4+8/x5rTMmeKZW93QsFQ9DLGFluc7225K/k5puVhXNTsmhgUOUd7reRbWO7mjo9CTCVC6CwOat96XxT1xe6Lmdos3AYQ8T3T3E/2wcoVzRV8Hs94jnxaZSVAAuSou7RR5P+H3/E3fyprQOJAiK+Fe0O8Ib8K0zluscmfs60RzTU0EUCTrTICbxtOqTQxFTLBc/avO3YsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB9544.namprd12.prod.outlook.com (2603:10b6:610:280::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 09:31:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 09:31:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 18:31:29 +0900
Message-Id: <DA2L2GAOD145.RU9FFI13VWCK@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "John Hubbard" <jhubbard@nvidia.com>, "Ben
 Skeggs" <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 04/20] rust: add new `num` module with useful integer
 operations
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
 <DA2E1BNC668R.MMCARZ3K2NTS@nvidia.com>
 <CANiq72nQwxqeRGWBW2WSHijUKLs4c26UGQvJFjt-_SpnJJaaYQ@mail.gmail.com>
In-Reply-To: <CANiq72nQwxqeRGWBW2WSHijUKLs4c26UGQvJFjt-_SpnJJaaYQ@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0365.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB9544:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ae3274b-f3e0-4bc2-bbc2-08dd991370b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UThGcjZIR1E0UFdpUlYybjBneGZJT1VZR3pPb05QQkJVYm9WRlBjZWJCdm9u?=
 =?utf-8?B?QWhPMWVrcC9yd1IwVG5YTVhsQ2tkQ1Fta2pVQTVwZFZxNkJER1o2OEZwVEVz?=
 =?utf-8?B?V0dQa1JoNkIrVktyQ2FIWkFOSkZqMk1ZMW1haDFKT0U5L0hDMnVKZnlia283?=
 =?utf-8?B?ZXo3TFNqUUVqa1B1OEtTckxxMm1CRjQxRktKMUNkUlJiNHFjWTR0MlZWWlNU?=
 =?utf-8?B?ZEc1aGtPZkt6eHlKTU96eTlnNVZyRWZuUUoya3BIYkhiT0djZ1ZYMEZ5NGw4?=
 =?utf-8?B?RDZDNVdHZ1R0NkVkbWdrSnBpSlA3VGZYK0hkTW5scS94SDBrdlZrYXRTMURK?=
 =?utf-8?B?Zm40WE5vWTBSZjFQQXN1emI1ZEFTZm1FUEQ0MXoxSGZaT0pBejNTcTlzRklh?=
 =?utf-8?B?M1gxZkZLWUxRT0UwTFRDanlnek1tcHpvdzFNVW9NNG94V2lrK0hGM1NkUW5h?=
 =?utf-8?B?R0lvTnZIaUFFdVhvSmpGeWpRQ2t1MnFDMWwrbk94K0N0WXczdkRHZ1cyVDBT?=
 =?utf-8?B?Rmg5TTJJOTNvMWk4UEFyMDBWSEF6azlnT05IaDhIZ3ZTNHpHRU5iV0d1Tk9H?=
 =?utf-8?B?WlNvenpOaDIxMVN1RVEzVWdjMG9UNEpwNHRjeUxNWGVOZlBPVE10cWtjZjgz?=
 =?utf-8?B?OEE4am5hVklqM0grT20yZlNzVXBUaDk5L0FGQkcwa0VvNzVac1gwWThmT014?=
 =?utf-8?B?cmlLR0xJZlQzc3FWbkZyQVU5OUI1Vktrcnl6alNaZkE4dVhOcHNzYXhuQVl2?=
 =?utf-8?B?OEM0dkxlNnNPY1Vqc0ovck15eHdLdEw0TGlna3c2WmRUd3I1WWxzVzNLL0JY?=
 =?utf-8?B?M0w2azZZVEVmZ2lxZ29Eek10QVc0QThNLzNxcVNJcjJUVmlGMmxZR3dJcjlE?=
 =?utf-8?B?bUtKSGRiN3B4MlBsNk12SS92cE1vUUtFSmRXL3RlazVzNktWdExGQlVRdEhB?=
 =?utf-8?B?c0o5RlN0WlFCM2lZRnFLbnB6SVZpNUZuUDJMR2Z5c3I5MGNIdExRclBjeW95?=
 =?utf-8?B?c3ZxM3BGNVQ0d3lUK3dwWDlxQkE3a3dOQ2dnbXdld04ySXY0aXF6WmZocHZK?=
 =?utf-8?B?WjNsME5MK0NjRzN4UlA1dFI2UzMvMEE5b2VNVFNUZk9id2VEY21VSXNJbUdF?=
 =?utf-8?B?T1hBVTZHYjlBUGNTbUYxLzcweTU1clR2YS9iNGhuQnBnRmVHNjJHcXNTZncx?=
 =?utf-8?B?L2p1U0tJcFN0MlIyYlNHdlJrOWtSalZHZHpaeHYvQXZEY3ptbG5rclJad3VC?=
 =?utf-8?B?TU1PallmYUpndlBUTVUrQ2pNdWJCeSt5dmIrS0pGNU5xamNrVHZhMVRqOGR5?=
 =?utf-8?B?REV5NzJrVE9aT3BVQ1dSa2s2c0VBUWY2RE54b2ZJdVB5ZXhxTDBwSXRBNFRw?=
 =?utf-8?B?Y0VqRGdpN3ZYeUtUaHlCcVVhRnAza25CcXNyTHhwYnlDaU5ORk16RGF3MFkz?=
 =?utf-8?B?R2FIbFlTRG1hUFpCaEFJMmJ0REdXN2JQVzZtdWJYbFBRWkg0MER3QlhuTS9Q?=
 =?utf-8?B?ZXVpNXArb2phRkc3MzlLRWJiRExucDBMSmNSUlJpVUFDb2Z1SnM2anFmZWNv?=
 =?utf-8?B?WUcxUUdZcmtaYmFyMDVza1lRVCsxRjVzSFhKbGx6alB3UEIydmV5TFFwNlp4?=
 =?utf-8?B?dmZwQ1pVeC9ETUQzaVZsOHVleGRhR1krd1kvQ1g4NGNrOHIyMW9xOElFK1A0?=
 =?utf-8?B?VEllZ3I1d1lmL3JGdmVUUldpMWlCWUFiNG4zNXhJMTNYSFI2cU95Y1pTTUdO?=
 =?utf-8?B?WXNyNEp5ODJKaTF2ZnF5NDhYdlJjcENmdEYvSmV4YzlxcHhLQ3dOY01hNzh0?=
 =?utf-8?B?UGxpK3ErSlQwWEZQcEZDY2NmcVFrbko2cjN0VldlYmgxQmJsWjV1TGc0RUxs?=
 =?utf-8?B?SUNkN01nSXJMeGptS3hnQ1NKVGpCOVFLME1vUEFOdDdVNHh3NGl6QmhmQmdi?=
 =?utf-8?Q?wMv7elHsEFM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjgvSVlQcndhMG03QkxwOFA0U3NRcWRvU0xITXJPUExuSVhIaG5kd3ZmdGx0?=
 =?utf-8?B?VTRNSE9YSnhyZGgwQnF6cy9vZU15K0JRbFpWbS9scEpQRnc4TFNLSkFUeU01?=
 =?utf-8?B?MlphREp2bkdPSFU5RmEwTFI1dFJiWmMwaDRRcUtVUVVHdzljQkNxSy93d3c2?=
 =?utf-8?B?M3EvQWk3TzFRb2FxUTlkbzNIRjhvdERpNi9RUjJ5UGVTeDI1Vit1LzZUMTM3?=
 =?utf-8?B?aS9vZzVNalFONjlDWkcrRHBSaXBqanJCZ0tTbnc1TkpmSHR1Vk9jcC9IL0Fq?=
 =?utf-8?B?TEU3RXMrK2dPWVc5TENpVmcvVkNzOXI1MHBFbTk4SHNiLzErTksvUytHYmpu?=
 =?utf-8?B?cWtVU3FCdkJjdGxIM2dKZjk2UFhKOENmV3YvUWtIVW1ESDhvTlBXcWFIeXlH?=
 =?utf-8?B?V1pzSlVNVUJQUy81c3pBWHZjVnJxYSs1NDBCL1dCOGNET2xFTEZoNFJmempW?=
 =?utf-8?B?bTJjR25WTkpiNkljdWI1N0drWGlqOTdDU0lGYXUrU0tYNlR4MEVBaFFSblBK?=
 =?utf-8?B?eG9JQUt4MThGY3VIMXh0aEJKQjFlMVFaQkJQUE5VSnc3OUxXU0VpbFAvc3pj?=
 =?utf-8?B?NEY2TVplRzVRdXJscGJFNkwwbUpYM25PYVdGaWlzUmRwcE94ZHdzTmp2YnVN?=
 =?utf-8?B?Nm9VM3hZbEpoV09tM1h1RUtQMzV4VEkzUWx0MFhPNDhsSGRFbXJJUlNmbVBk?=
 =?utf-8?B?UitERjJnWWdrUkJxSG9NaUhvU2xNVHVUaGVEUXZOeldpRGNRczF5RVNveitF?=
 =?utf-8?B?WHE2NkZjUEtOeW93NEo4S2lhUHdDY1dLaEZOVzN1K0VtWFdNR29GRFdwVkdV?=
 =?utf-8?B?SlVNYWsxUGhIaFpsNUlxRGxrU1JTeDhiT0NJYU1JZVlYeEJHTXp0Q0ZhUy9p?=
 =?utf-8?B?aCtRcXZLUC9JQTJsRUpvck9oM1pUajB1VHZEalIwcVpBeCtjcE5CRDR0TmxK?=
 =?utf-8?B?STgvY0tvRGlTd2pQR3VvT0hob3BxRnMwWjQ4TmtmODJ5eitlMzBYaE5KTDFr?=
 =?utf-8?B?bU51Y0hYMmZNMGFYcWU0TERWT3R5azNzNllYanhNYWs1NWlNd0dCMndIV2ty?=
 =?utf-8?B?OGNJakwrSDZQMHBtRjZ0cXhtYlJZQVNYOTdsQXM5Tm5lRzVtN3JpK2hYaWlT?=
 =?utf-8?B?NmNtZ1c2eFhQcGtJd0FJY1psRHJ4S2NYa0hnWml4YkNnUFRib1I4L3d5UXN3?=
 =?utf-8?B?ci90L1R5Y0pWTGQ3eFYxVzV5TDZKWlROODlpV3gzT01ucU1DOVRRdklOZm9k?=
 =?utf-8?B?YjEwUzJQclAxK1RGYmhJNTlWUVZuOVJzSVNnK0tsQ3owektER2VvMUVody9y?=
 =?utf-8?B?YTdVLzU4NTk4bExYMnl1QUQ1dFZqZ3ZTSmJ3ckkrYzk0THZVOThWOXVnSDVl?=
 =?utf-8?B?UThLVmd0MmZSWVpqV3l3bVJsRnJVeVd6UTlGTjRzMWl1SjdhNE02bUVnN0JW?=
 =?utf-8?B?MDRsTHdueFpwdWg0YVE2cmtOYWphb1NNNEYyZzVkY3BvdzVXTjhVNkhJQWRx?=
 =?utf-8?B?S3pFZWpvMW9XMlRaOGhCRWIzQ1l2OUhrQ1hLV20xT1psbk12amtmcXZ1RnRt?=
 =?utf-8?B?V1YzTDJxVDZvQUxlSmxTY20wTFNMMVFaYzZsUWVWdGZkQ291d01sQjdiNUFP?=
 =?utf-8?B?azQ2bXVUT1VxQXFuNnZlUHgzMlB5aGNzZU1NRXhCU1VGUzM3aVAzWG5wY3Jl?=
 =?utf-8?B?LzBJcTU5YjVlRWM0Uzg1QU82ZlBQR2dGaDk0WkJzWkwxTmNzamNkQ0hIN29t?=
 =?utf-8?B?TnZQK0R0UGl5bHAzWHFQU1BKZ0JDczFJM3k0SG8xSUQrMENtdDZYYlNTcDZP?=
 =?utf-8?B?ayt6QWk0c3JZVnNPQ3BxWVd5TXpjK3UyR1F2MXFYN3RRUGpXZXZJM0IwTXYy?=
 =?utf-8?B?RkQ2K0ZSUVA1ZWw4S0ozc1doVURDN1ZqRXdVRE9DY2pMMjFjMC9uVVZubXJi?=
 =?utf-8?B?c1krOXkreUk4V0FMNnd4TTZSdmRMVUVlY1ZPb09qLzdxSkJrbTIzVG8vOFpH?=
 =?utf-8?B?SWZxVXdsRXdqR3F3clpmZDhYVGdJSFJWVFkxVTZWSGR1dGNnWW9NZFdwcTV3?=
 =?utf-8?B?L09wdTFwTFBLL1VGaitoaGQ4YnNQbVdtYVB2NlVDSzYrQ1J4ZjBkemZNelcv?=
 =?utf-8?B?aCsvYjY2WHRFYUhoWm8wNVRwVHJQUG5LT09ta3VNeWhiN2hYbU84WFQ1R0Na?=
 =?utf-8?Q?sGz7G2f14yks7x3sh5nj3+JddkqjqqubeIlsoimk6gD1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae3274b-f3e0-4bc2-bbc2-08dd991370b2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 09:31:33.4957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwkgCpAbAe6Ul/7St+ueIkQz/zy9YyhQvqPZb/56HUsae0dySWLkgxE3E179duruk2SKYpoGZWdzh6cTZGNfNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9544
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

On Thu May 22, 2025 at 5:44 PM JST, Miguel Ojeda wrote:
> On Thu, May 22, 2025 at 6:01=E2=80=AFAM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> Either that, or we enable `#![feature(const_trait_impl)]`. I just tried
>> and with it we could indeed define and implement `NumExt` as const,
>> which looks like the cleanest way to do this to me.
>
> Hmm... I think that one is actively being worked on, with a possible
> syntax change in the works. We would need to speak to upstream Rust to
> see when we could reasonably stat to use it, and consider the older
> compilers (e.g. if the syntax changes).

Yeah that could be a problem. Which is a bit sad as with this approach
we only need one method name instead of having multiple const functions
suffixed with `_u8`, `_u16`, etc. for each type we want to extend.
