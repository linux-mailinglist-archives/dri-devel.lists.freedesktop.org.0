Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB8AAC03F7
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 07:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65DB10FD57;
	Thu, 22 May 2025 05:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ape3lkr5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2083.outbound.protection.outlook.com [40.107.95.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A5C10EF36;
 Thu, 22 May 2025 05:24:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jThtcpFrHJYNm8WC55vvyLbckkDAze8Yrl5zm8epJWuXtbQiwbyrLLQpe9nJrIuMtMIFNR1co1JLursszRDhmT7zydMAghU3wwSkIP6rqE8JblB9LflkNHO9H8ODXU82sSQTh7P9doLiiDt1HWzSXxW9kSRpFcaGAurpVfw7zbNtzd61YcWrxsh7DUaOMXaIEGGyz+4rOz2wsnrPbWSOaok5II4fi5ycqESnmSFOvtX2koTGFvHm0c8lSInv3fnuXnaMuf6JzR6g+qkkKBAzw5ev20jwgXTI1G2nF0GWhRl16c/1bxgLKz90jwTvIT6cXrm81lKcJN6NsbYK7Mdgdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYmHvpc6hinHd+u/h3k5WdtDsoPplWdCsCskZTPuqsM=;
 b=QiJ2mZWS+JX+uO3a9YmQQ+nZ8Y5/YddKhg/Vz4cn88zA8wXWTgfRupXxE7ZI0uAo7gMHlZWmUkZBbfj3hILdYLjkWFbvLX1jyO/HKYh9yJgmLe/R37qINOSZ4vj0O2IAVDPks2UtIHQc6htnAjjIF+5z7km/O08zyTMpw2h+7eD4Bke53a6qCSgmLMI7MSm8ZrOCJN0PNWmZePbGJc1LlFJLkpFruf4F2SY9iufyo/lKaXBA0vkBqZvg2mD6xAIrfckjeLddzrR8lm2wjKCDY+7453BqEPZKcdW1dJXoVWLyAtuDwYUM0TAGtD0dZCq0dmW7k74c1sLqEMdabEyLHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYmHvpc6hinHd+u/h3k5WdtDsoPplWdCsCskZTPuqsM=;
 b=Ape3lkr58Hc2vNiiDznJMT2wgyYuzXVdFfQ59ys3QsG4IwDfLYSc0U+vm7KcA50koy7ykG2mveXvDDeFuAvR8wmOhYfKnJB6Oou/Bo7BD9OnH7NpmEwGRQPF28xg0jarwv/ASXgfk6S3c/M1Nkzjf+QOSWZa5DLzPX1tLNUnPEdJ1R2xLXKsUPMK5wzSS6s+6t9o6iDnST0xerwP1yi3GG11WZkDByOdxSpu3WHXtIp5Tk5iDklvnWD3npHixG8CTTcocR09F/rDoW789OmKQ8SvbwumL6Zy90aGy/GFKfSLQ3Y7BC+XKBo/ToFtSv3wB8kWUz4IpS3OJNp9ix4sPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6536.namprd12.prod.outlook.com (2603:10b6:8:d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 22 May
 2025 05:24:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 05:24:47 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 14:24:44 +0900
Message-Id: <DA2FTITEUO0A.1P71929C3T04C@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 01/20] rust: dma: expose the count and size of
 CoherentAllocation
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-1-05dfd4f39479@nvidia.com> <aC2IG7amsKLk6G0a@pollux>
In-Reply-To: <aC2IG7amsKLk6G0a@pollux>
X-ClientProxiedBy: TYCPR01CA0148.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6536:EE_
X-MS-Office365-Filtering-Correlation-Id: d0ca733c-6a93-4e68-79f7-08dd98f0f7b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVhnd3pPdkUycUlQUXdWeHM1bzBqaXhOOFo2YklCbHZzY0tIaHFtY1FqSm9T?=
 =?utf-8?B?SzJCWHI5bUNyM0RPalNnSG1TOFFXTkR6YURQWW9lNEtWemxGSG9weUdwK2tY?=
 =?utf-8?B?b2VyZ3pjbWhXa2t3YzZ5YTZXMStkbVhMa1Y2NDVIMVgycXNtdnh0Mm1MRjhq?=
 =?utf-8?B?M29PQUwyN24ycDZ4QStUd28zWmJ1MDNDeVorY0RjV3hmTUt5WXl5YXFHckIw?=
 =?utf-8?B?Sm9DdXBaMktsVkM0ZDNCNy9HV2VZWnIyMDZmS2xaZ3Bka1Z3eVdET0xIZysr?=
 =?utf-8?B?YU9HcXczd0gweWU5c2hEVXhjcU80YjJ4V2pwMnd0cllRZjVCMC96bnFmek9W?=
 =?utf-8?B?R0p0NlhxTVo4TEFzbGgvcmtqdTBKYTh3U3BBSWJsMG9BMDFrYXh2Uk1pZkly?=
 =?utf-8?B?c0RCQ09qakFmWE42c3JUTkc0Tkx6ZlBzeVY2M016ejBvaDZFcXdoRlpoSlk1?=
 =?utf-8?B?eXpldG1wcFRGeEJ3d1ppcWVnTHZlSnZKVGVsYVRBVFZZYTNxZ1lLN3ByUGQy?=
 =?utf-8?B?cHFMc0NJRzlDSTJORDBET1dmOFFNcXo4SWpuZlZ6WjFpSWc3SW9XUW42MnBV?=
 =?utf-8?B?WWpzcllPTWRaWVdsbjQvRlJDV1JrVjhFWDRyWVNGczluZGFRT3l3emNwY3Rq?=
 =?utf-8?B?SDdGRGhtUytIcDdEbzJ6TEpLcUYxK1hGVGRjSHE2aENLamkrTHdtQmtWT0xv?=
 =?utf-8?B?aWY1RmxSRkZ1S21OaUU1SkRXT2xwREVyYks0cWw2Z0tlNGFEZER0L3ZqWGVQ?=
 =?utf-8?B?WjdhVHphZjNkWkk2OHZHMkY5Rk9rb0RxLzF0TEp1N2tuV0w2ZHdFVGZzZ0Vq?=
 =?utf-8?B?RnhpVUU3THNoVTVoZEdReE1tMnYxZi8vU1RDZmZrNHp4L0ZVRUdZTXhCTThC?=
 =?utf-8?B?YzhpZndCRk1XaDlMQkxvaWlzZEZOaTVTYURtVUFTT25ad2p5aXZsTkhtY0Ez?=
 =?utf-8?B?ejJwNkJpN1NLOFJGNktoRlcxZWVwOVBXS2RNdit5QlZuOXh5MFF4WlFzamZK?=
 =?utf-8?B?bnRPMmk2SmdOR1VicXlQVkpQMHpoMktneUZGRHpBTFB3K04ySDBNNmphb2xK?=
 =?utf-8?B?TUllQXUvWFB2T1g1eHIxaHRCbnlOR0ZQR0J4elY4RjFlT2VQVVhHbmZYTGUz?=
 =?utf-8?B?dzRpZ3FPbVFCQ2pBVmJCMTFnRis4L1dpV01aK3dQTHRaVldvNm03M082ZTd2?=
 =?utf-8?B?aGlBM0l1cE4wVytoMFZiclpBa2paQ1l5ajA5QXg1bE1Xa2tvSHRqT25IVVRK?=
 =?utf-8?B?bUJSYkFiZzhZRTVYbzlhS0w2eGRPNXppQThsN21kRmJMK0U1WHNqU2NRQzEx?=
 =?utf-8?B?eXhHWmtJbkpoU29sVXVYRkJUK01pZ3BFbkhGOW04UDJmZXNuMnNQOVBuV2VB?=
 =?utf-8?B?NVJYQU5QNmdWVFpoSzNRQldjREg2MDE5SDduZEhHZ3FPSjlFNGwxTjhWK2pX?=
 =?utf-8?B?bWpKbkxjdmdVb2VDbHVDRlZaOGFablpNakoyYXVlTFVrMUlrQS9RNk13L1dx?=
 =?utf-8?B?WHhIOWYwM1pLRVJzTW9TZ2pDQkdrbVNFK1E0cmExcnlWOVl1aWYvcldLbm1Q?=
 =?utf-8?B?eFZxU1oyajFnWmdSSDF5U2gyVmJQOEFVdjIrL0pKTjR6ek9TVFdVQ1drWmZO?=
 =?utf-8?B?S0ZlaUMyU1pwRmlSUVFiWExLOU1KNURhVnJoK050c3k4Q2lCMG8wYUVZZFZM?=
 =?utf-8?B?dkJzTmNRZE5pRUZBWVdYbUZFQWFzSDBEdGxWeHJjRUl3NVozWUFhd2ozQ3Zj?=
 =?utf-8?B?aFZhU0FTMW9Jd3VNSVA2MGVhNytKNEUwaW9zY1NCeW9yVEtaMG9VdGhKbkk3?=
 =?utf-8?B?ZUFlOHJvbUhOVmwxYlNwdEFGSklibE5LajU5QkxyYnlpZi9HOFN5NzU3UlNF?=
 =?utf-8?B?YTZCSFZCT0pQVUF6Z0ZjcStHL0ZEUUd2dGZlckFyVWNaNEpaME9XU2ExamZN?=
 =?utf-8?Q?XLleYYdCYwA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXA3dXhnbkVvMnV0KzRJVTFnZXFqSGVWM0c1a093dlVEZGRCUUxkV2tMUXB0?=
 =?utf-8?B?Q3JZSzdUVEFEZzY5dmxNbE1JcUxEdzU3QkV3QWo3eDF3V0p3L1ZvS2VqdW9K?=
 =?utf-8?B?M3lzbjdRWk1TTUZybTVHdVVNV2hQdUlPZXRxM004amUwM0J0ZlZSZDBBQWRr?=
 =?utf-8?B?MzRkSlBqdlRPMUNxd21xaHVyY2xXdjBEdTIxa01JRUV6T0VHYzhuRnpKMlZH?=
 =?utf-8?B?bDRDb3p6R25GRHBDSW4zV045dnRaNU5BeW9sVGZZN1cwdTZjL3JjeVVUS2JC?=
 =?utf-8?B?Z1BsQnpSYUxzQS9NVFIrakxwdXlEbmNSbTYvL1dtc1Z3NjVIUXltOTlHUGdB?=
 =?utf-8?B?TU9Cb3UxRzJUOVVEOHp4VFZZbmdybHRrMnZhM2tjSTRTMWMydzB3Z3d5NmI5?=
 =?utf-8?B?dmdqdDRjcy8wdWEzZVlQb0UvcjZzOEJ4RytFU01EVXYrYng0WGI3L2trcHlU?=
 =?utf-8?B?SGUxY0dxeVJGRnR4bkVnbGtDVmZiQU9lK1cvRFhoR2JDQ1hrWmFKN2Y1Yk1U?=
 =?utf-8?B?dGVkVlVuVUo2YUthcGRoRUxGMHg1ZnRZemRTZFBFYlR4MkhPTllpOUs4U0Vi?=
 =?utf-8?B?V3FqSVk5L3JvUlBrdEkzYUJNWnptOGlTL1BzZXhLa3BNcGZsYUxDc2J4YjIz?=
 =?utf-8?B?VjM5c2ZpSUlzOGNmSnE2K2J5ekR6TGtZRDVRZEdKbVlCditTY1V6V20rUkpY?=
 =?utf-8?B?enRBalc5cEc4b0dzWHhsOUJteE1kY2hzQ0N2RWVmWGZhLzVDbFlMY0p1Z2Fl?=
 =?utf-8?B?eEpzejVJK09XN1J4ajU5MllqVW1GbzJaR0dTT3pDN21aei9NanQyb3RMRTJh?=
 =?utf-8?B?dFpCRk9xNVM5WjBaeS9XOEFaSUNrTFZIeGF1WXdIM1d5OHJGRUJpRDlmZVZj?=
 =?utf-8?B?OW5hVnFwTDd4cmhwcXNWb3hJMjZTU1lLUjRhak5YY0FhNFpwUE5mb2ZSdlZk?=
 =?utf-8?B?N25MTWxwRGRKbm5uVWF3ZjlaU1VMczFXR24wSFowYU1YTFFkYWVwYnZHVTdL?=
 =?utf-8?B?WW4xZlJnOU1Oa0V3dW9tRkt3STVXdy9WZW9tUENlOUVFZUdjRE9ZQldudHdY?=
 =?utf-8?B?NGFGaWttQkJ6aU9ZNnFyUStDT3FTL3hhQ1pteDRTN2hjOWJ3M0Q0d3kxaE1Q?=
 =?utf-8?B?bi90RmhDNk5HTTlWc2RVeFNON2NlN1hkUC9XNnJqcThONk9DZVJsUWJVVGRM?=
 =?utf-8?B?R2FIWHJPdzFXU3JoUFQ2Q0JBai83WTZDSUJYMkZ0bmpGY0IrNWRzeTE5ZWtL?=
 =?utf-8?B?eGJKQkl1UFNKQXlEVlQ5dU1WeXI5V1lqcE9sMUdUL1NYMkIvWlE0S0tDNUFX?=
 =?utf-8?B?QmNQa0RZSEZRSnBNVVpneHpocEZxdjNObndNWGtNUCs4MTNDdW5zSW15RzNY?=
 =?utf-8?B?YlN0R0xPQ3pMVWpyeVRNTHNIQWZ6SzdVdE9mc2Rrdis0ZVhSTDk2QUpGZG0z?=
 =?utf-8?B?UlBlYXNQUHJ5TU9BcXh5RUpxR1pVSm5UZk1aQm82OW9MVEpNZHNrSkorRnkx?=
 =?utf-8?B?aWJUQndJaDR4TDFwR3ducVliT3VZSkhtRUdFOFJFK1FxQnhuU3Zwb2pzaENL?=
 =?utf-8?B?cDN1d25mbTkybHZ6ZGNlbHN4aC9CRW5rQTJhQ0lQbHIvWDZOc1FQSm5vdVRo?=
 =?utf-8?B?U0pub0w5bWVuMExCa2NXRGNLYUtKcVh2NnowU2JSNFplRnQvUkZ5SjBGRDND?=
 =?utf-8?B?Z1hkVHlmWm5HcDc5RGx3c3RncXJWbHB2TFJJNTBvVWRieVpMcis0Zm9PdWJ1?=
 =?utf-8?B?QzUrZ1lnWDB5VUtta3JjVWFZUEN0V0g2b0JIV1pYU2pEN0xIeTlzWTQxQ2R5?=
 =?utf-8?B?ZjF0WlRqMGlEb0xuaTg0OXEwalVFOTQ0UnhhVkdGR0lCaWxvanZiOXM2M3o2?=
 =?utf-8?B?ZERxRHRqRHlVL3hYb0tEWk14UG9vY3VINXRjUGMxajlXcnJkTk9vckJieUZa?=
 =?utf-8?B?RmY2bTZrelBST2txcDRuUmpScXE0ZTNEcUY1MTk3d05PNGcrcFRCMXlaWHFJ?=
 =?utf-8?B?c2F4RnNiTjk3bS9zWUtLM1kyTWxZU3JpcHJjTE9JcExlOGZONGZvajlobDVz?=
 =?utf-8?B?TG5rcWNiTlIxL00xUDZublM2aGV0VFZ1WExnV09tdEFOVmhJdmt4aVl4VUFU?=
 =?utf-8?B?bXN4NFg2YXljcnAyOEVMb2QvTGp1Z0w0Z3J6YXVTRWgvc0hYWXpCcmZJcGli?=
 =?utf-8?Q?8wpQslald3XuAQqMvqBG05lzCjdq+iCQ3OkNXQ3FwrYM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ca733c-6a93-4e68-79f7-08dd98f0f7b8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 05:24:47.6889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SV19+PuWk1ogv2+4wD2WZOSePSdTe4e6iFTTtlDlnPwhZvu7L5vrupXPKdXR8IuczBI8A6/TmOzc5HHAMjIbLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6536
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

On Wed May 21, 2025 at 5:00 PM JST, Danilo Krummrich wrote:
> On Wed, May 21, 2025 at 03:44:56PM +0900, Alexandre Courbot wrote:
>> These properties are very useful to have and should be accessible.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/dma.rs | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>=20
>> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
>> index 605e01e35715667f93297fd9ec49d8e7032e0910..2a60eefa47dfc1f836c30ee3=
42e26c6ff3e9b13a 100644
>> --- a/rust/kernel/dma.rs
>> +++ b/rust/kernel/dma.rs
>> @@ -129,6 +129,10 @@ pub mod attrs {
>>  //
>>  // Hence, find a way to revoke the device resources of a `CoherentAlloc=
ation`, but not the
>>  // entire `CoherentAllocation` including the allocated memory itself.
>> +//
>> +// # Invariants
>> +//
>> +// The size in bytes of the allocation is equal to `size_of::<T> * coun=
t()`.
>
> I think this also needs an invariant comment whenever self.count is set.

self.count appears to only be set in the constructor, added a statement
to the INVARIANT comment there.

Also noticed that my `# Invariant` section was not at the right place,
fixed that as well.
