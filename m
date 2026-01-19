Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A4ED3B01D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 17:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4347B10E4B5;
	Mon, 19 Jan 2026 16:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="0FwElR+n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO2P265CU024.outbound.protection.outlook.com
 (mail-uksouthazon11021106.outbound.protection.outlook.com [52.101.95.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782B310E4B5;
 Mon, 19 Jan 2026 16:12:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WltvoFjGdvEz4RP4ZO4cT4LDKCJqt3eP8QYl0m/nLjjX/8rsDCLJmpg9AfbSTcwUx/M1yMrCuTpoumYtTkJFbMMI3rUgo9q8DAWo4cwpdHbq/lXgtgQGSmo200OFBOOrtvMfCGpl+zoutlqbKLcjLrq4k5ALrXPs22yfsPs7ed1jLDX9Nj3VOsghf9uFlNI+0vuWctVHuJdYHsGlZsUqVPA9IYospJiLfGm3qPcEyEktfpXBDh2CywsXlH/Xhnfhe/4p7LRSy2vBM6oo46SfWehp9A9vBlurrocv/Vwh9LbDbb/WZhT7wgMKqApt5KY4QYZgfnEFTpYv35RoOGl7xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cp5Kq72W4AustkAa+qkZqAmqWqMQM6EbXnDp9A5fFsA=;
 b=g2nY8nnCjzeGhOWGNrj2jRR9J70/8wzkyA7XKXvA+90VytIEi6KWRfqRTKbQWBt/GQxpFKzAMuSvRUe27ytLn2SDbuxseETJh8pz2b+ZOK3/6gVvKFNRacvQCP57kYgXZ5q1hfz4gS72ScGY7platvYJ1BTcNterq4FXByMLUrz0yR+/CSEmWykgoGBMy5n/1uiYFTXBnLsP/6jr2rxOeNjNq3f9B2wf7Lh0GmaIvRsf+BDoLydta0HUUiozgkewlySgHzHISogXylOPy1Kbsxp0X5ea3JrsA3K9ZPkxfcPHOFjk2/YJg5ZAbB6teAiZwf0fLRnQ2NBsiXWuPH8Dzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cp5Kq72W4AustkAa+qkZqAmqWqMQM6EbXnDp9A5fFsA=;
 b=0FwElR+nicdtVpqb658g9lvsZ8YlOv3q/hQxCR3qsqHwHZNCw39EWRoyr1jPu+t1HMFGQbkUAzNNv0IzKj9IZVkcfRoYuf2STvjrfZIxTlfN982ojldKeOCePNuLg/zC1y2uHLn747O01ku/KtbUQiHDV2tesuDcbvnrscNK8q4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB5227.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 16:12:01 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 16:12:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 16:12:01 +0000
Message-Id: <DFSP4YBRRLV7.30HJRBZN03QAQ@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Lyude Paul" <lyude@redhat.com>
Subject: Re: [PATCH v2 04/10] gpu: nova-core: gsp: remove unneeded sequencer
 trait
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
 <20251216-nova-misc-v2-4-dc7b42586c04@nvidia.com>
In-Reply-To: <20251216-nova-misc-v2-4-dc7b42586c04@nvidia.com>
X-ClientProxiedBy: LO4P123CA0632.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB5227:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa1e2c4-6eb8-46f7-4e6e-08de57757ae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|10070799003|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzNWalp6R1YxVzA0QmZ3eTYxT0pJdGFId25aNG1SYjM4aTFodURFbXRuV0Z1?=
 =?utf-8?B?R1dnbjNaN1FNWk1GNFVkSGFHYTY1T1ZjZW9OYmNSd0lrUmhIOS80MXo0QUFs?=
 =?utf-8?B?cDMya01seWZOZStYQWl3L2J2WHl0RDhrM0J1LzlPZlhSRlJ1K084dHlmbjQy?=
 =?utf-8?B?TUJtMXFEaTdweTMyYm84YjhZWkgwanhZWVE0WktWcFVsNFk5QmRjYXhmRW9s?=
 =?utf-8?B?UVZpNVZNT0ZoVEZEcitQbFJncU9GNkFxME1mNXdpNUo3cDFGQlNGMGcxRmZk?=
 =?utf-8?B?ZWJKczhSOXpkQjZYK3dZYVJBTFF4akJlREY0Sk9Pb3VRODgwZExINkswMXlp?=
 =?utf-8?B?b1RtNnlkY1Ztd0I3ZjBFejk4dEdWUmZGbHQvblQwK1BNWFY5WDdvT0JESmsy?=
 =?utf-8?B?L2ZpZWQxeDlTNHUrSUFVaEhDQmRJMTZLb0ZGVUhwUlZDNmFOSjY1NXk0ZklV?=
 =?utf-8?B?YmFXV2VGQ2o2eGkrc3IxWmhoTkxXejFvclZsQlp0SnNyd3RVZjlOSmNTRXZU?=
 =?utf-8?B?VzlVT3dnaXZRendSSERTSmY1YXpxTnVldHVOUEVLYW9IWTdxWjNjZy9Oa1l1?=
 =?utf-8?B?ZzNBaXNpbXlyYUdmOE93WnNOOENCeEplT2NKa1IrT2lWSExUUDl1SkZ2TnV1?=
 =?utf-8?B?M3pZRkw0c1lvd2YvY2QxWW44a3R6Ymk2MTNNV2I1b24vYnpXeFVIM1I0MmEv?=
 =?utf-8?B?d2JzWWNvVzZCQ1phNVE0L0ZMSFI3VFdPNFZFT3BGRGJvdDUwUmwyRzdPaGxF?=
 =?utf-8?B?ejIyRWdIQjZBNE80ZGloRWJyQk9VMTRnRWpuYWFvOVAxQkV1RDBGVUV0WFdx?=
 =?utf-8?B?ZElZRlQ5ZWFob3RjNUt0UXFrM3diN3Fnbm5VU2oxSENYMGowSCtSaW5aSGFa?=
 =?utf-8?B?QXdHU3dsMFpjUUgwaXVSVC85VElvUmtHUUc0NmlHRU9xSmNPbHpVZ0RGT1Ez?=
 =?utf-8?B?ckNoWjhXM0pzc01LUUJ2c1RvcHFUOVB4cEdLd0swbHB0Z3RtMGd3REtaSnZ5?=
 =?utf-8?B?eGVVSjNHNHlhWmswWldnVG8zYVRGdTFEdzVNSkNCS1hRNC9YS0RUMnhHMWFX?=
 =?utf-8?B?aTJEUG5EdTg2UHpMa3RjNUZmMVhiLy9EUi9BRE1ZaUY3M2VNWXNnYXRRWlp1?=
 =?utf-8?B?eW1vcTdDMEdnZXhjWHJFV0pRL0NVUTJrTmt0NEREeDR5KzVkdCtmUy91T3NZ?=
 =?utf-8?B?bXkwYlNwZGppRE1PNDlCZ2laMi9MdGpxZ0FTTkZNMjRGeDdJOWFLdzYxbUFr?=
 =?utf-8?B?QUNzdmFJMWJGeHU4NzVxTTZVQWFnZldFUmtrSDF0aytGazFZN3J3RDIrSFBq?=
 =?utf-8?B?ZUhxTGxqUWRGN3VKeTRTQUFTQzhuUFF5TXc5U3I1TVZsY1V1S0Z5UW9rSVpk?=
 =?utf-8?B?VkNQWWpZMDNQdHJ1eGNTbTRMcFFzSGc5eldUZmRXQnlUTk9UZTNNSVdGY1NO?=
 =?utf-8?B?RzdvbnRKOWdya1gyNXpsOEp3dlF5MllGY0ZRZmRwblRmMEVRRkVIQ2JhaU5S?=
 =?utf-8?B?aHQ5eVJTZ0c3MWYyQmRyVDVqM3UrREZwWm8wSEFESmJmRndaYWhiL3Y4OUc2?=
 =?utf-8?B?cENIMlQ1UHlOdGp2Vmc4UXphZUFPVER2c210Q0FmZUY2T3NjZDhBUllOWnhs?=
 =?utf-8?B?amFXMFl6clV6U3RQUi9TRkZTRzE2Yk5VTmpkWXIxNHdQYm1qYlhpMkFJRmE0?=
 =?utf-8?B?ZVgrcklaemxrTXgyNmpiY3dwUnBxWW0wamtkRG9QRHRjNFByRERwS1NRUGJp?=
 =?utf-8?B?Tmg1Y1JCZGxZN3FpTVBuK0UzOVFGVEFKMWRmaFhnRE1oYTNkVTZWMWc5cnVQ?=
 =?utf-8?B?d2M2a25BbGRrRXdDZVlIRFMrZWYyUFlWWUFaOUw1TGpjVnVxamplc1VXY1lI?=
 =?utf-8?B?c0NJR3lVbVR1ZUtwS3FvdzJ1Lzc0QVk4a0VaVy9XQ0xIdVkrSncwUWdwRjZk?=
 =?utf-8?B?RVplZDlnQXp2NEMwRXVKRHZBdXBBUW5EZE41TkpnUFJqZ3EzWFFDdllVdzQ0?=
 =?utf-8?B?Y3VRd0dlQ3BpOWdYTWdGMk45cjZjRXpqbGFtU21zQjRwaHJ1VEFkcmEvY0VM?=
 =?utf-8?B?VEdiOWUyNHdQNzA4VFd5UE0vYm51UzU3bTBKb1ZEakN6ekZldG1TNDhZMm91?=
 =?utf-8?Q?QSSo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N09yYTI5TEptSEhqVis2dUJhTm8ya3F4ZnlIZklYUUVMcnNxOE82bVR4aC9m?=
 =?utf-8?B?YjVnMXVKbG81Q04vQW1CZFM4aDN2U2JzeE9PcWtEK1BXV29XSlF3ZWE5ckl1?=
 =?utf-8?B?dm9qa0UyWTRBMUZQY3gvMnU5aC8xK3YzY0IyeSsyU1ZyQU0zM2h5WkZoMmtz?=
 =?utf-8?B?V24zeStiMUplZ2puVCttdUFEZi93QUY0UDZuMURIZ1NLcXF1cFpRSWRGTloy?=
 =?utf-8?B?b1hjVnEwT1UzT2huU0s0VU4yS2NsWGVUOUpnb3lzak9Yd0JCM1d5WWd2aTdt?=
 =?utf-8?B?QWw2SkRYL2xtSm9WN3JFMjR1VFRGaXVrdzk0dTZpbmREdUFoQUd5Q2UxV21j?=
 =?utf-8?B?STVlZHVsZm1nWGdza3lCZWJGSm1xRjBrL0QwMlpSM2psT0NGb0FGQUxnWFM2?=
 =?utf-8?B?dnlxY1EwNW1KQm1MSUNNdkpZZTBKa0o3Wm1RNzlScXoyYThDeElId0NKRmJ2?=
 =?utf-8?B?Mkh4c3FxN1IxZVRUOHVYVExtaWhKZzB5KzJBcVhvaEoyenYraHlrbHlwV0hQ?=
 =?utf-8?B?T0VTNVc0c28zWU5IL21DelJPVmVtZGZiRFJUSzlWRTVaODZJVmw5QUlhL1hH?=
 =?utf-8?B?MVZoaUVHS01jNG1tVGN1WUJOYjhzTWFkY256SVp3a0ZhbGp6NU9RcmlSSDJ6?=
 =?utf-8?B?dnVxajZUQ2xScm9ISExVS0N4SU1uOU1tSXJBWUtxbEVZVTB0cHB1UVR4M3F5?=
 =?utf-8?B?SS9MUDV2dU1UdzI4MWY1V3FlS1JiZkdTZnhrUGMyNHFOOVdqWEZLS3dwQVdC?=
 =?utf-8?B?WVoxTVBMZmhmV3o3UU5Bem1WeDZtQmV0T2QvSmJHb2RCbkZYM1lnT1ZGWXRL?=
 =?utf-8?B?R3dxd2dGTXBHT0JaKy9lbloyalEvVEdLYUlyL3paNnQzNzkrTi9hK3VtQk1U?=
 =?utf-8?B?NXA4Zld5NmhWMzJrdHpzRUJPeDlEeHQraUZNaXN2UHlEZjNKUS90S2YzL3l5?=
 =?utf-8?B?cnpicHQ5ckY4T2QvVjl3Lyt3UGxqUkRPWGpST0FUSGdWQk9tdnNZQU5pcmsx?=
 =?utf-8?B?NmdIWnJHeW1rZ21PNXN3elB5ZmhWNGFkQ1ZsZHptM0xLK0U4KzBwZUxMcUJs?=
 =?utf-8?B?U0VzNkFKenZEOHI1aURWM2duaHdERWZHNmpJcVNUdVV3L0c3dXJWbXZJK1FH?=
 =?utf-8?B?bW45U0s3T1hjaG90eVhpWTdqNVVrbDJ6eEZDUXF3L2lRbTZMb0RqOHBaUllr?=
 =?utf-8?B?dDFvWk9hUEVzWk1kRldYaHFkUzhRMjVEZHZuTXJZYytOY051V2xNOWt6djVZ?=
 =?utf-8?B?MDFEZlFDZ0JYMWZKTmlVcEpRT3BDMGE2RCtxWGZVRVN0aGRObmF4bVBpbHBB?=
 =?utf-8?B?clMwdVBOeUVsMHNJL3R4eFBEWi9VK001ZXlFNFRhTXBjekJFWXM1UEpqY0c3?=
 =?utf-8?B?VjF5RmhMaTJDY0xvVWRRZUYydE9UWjNIUFNYRlNUdWsxUmU5bXYrQnZudFhF?=
 =?utf-8?B?N0tiRFB5bEJyZFdGbHVEY0s5UkZodFpGYUpEcGM3Q1RKQ2tNeDdldmRIRVRC?=
 =?utf-8?B?UmsxS1JXa21ubm91SnpJSThCSE9aTkVtMkd3VlBvRGlqMm1EV3I4NEZoS2JI?=
 =?utf-8?B?UGRnR3JtQ0Q2MEpXUGtuWUd5N056b2RtK1JRVGd1Snl5KzZJckZzN2Z4bE5S?=
 =?utf-8?B?aWhoQjN2Q1grV3FSM0RpRnc5bkl5OC9QYUZpNml3a2ZPZFkxcFFMQ1k0Ty81?=
 =?utf-8?B?UnN6RlZqK2F4U1MzYm1FQlpyeVRXYVBidWJoQWdZNnQ0S3BMUEs5WERJVGp2?=
 =?utf-8?B?aG1hV0M0dGcxZWdsU3IwSWxtMzErR2dvZXduNzNoYmhmU1luVE1rbjhSRmJh?=
 =?utf-8?B?Z0pibzZyOXF1TVVhZ0NXajI0R0VQcG9xcUNGWnNqcHNOMGJRMGxRQWNtMGM4?=
 =?utf-8?B?MDFvRmFZanNtQmRaN0tRd1YvMVQ2Y3I3S3ZzU21SYUgxTVY3RnpyMGNWMnVq?=
 =?utf-8?B?QlczSnYrNW9qYWEwQ0JNb0I3ME9MODZxYStITndVMmxHblZsOUhTcmhHckhO?=
 =?utf-8?B?RWM2dlhFL0F6MWlycE5uU3d6OHdSMEtvS1dHdjJOOXJFUXhrSnQ5R0U5NjdW?=
 =?utf-8?B?aGR5cmpmTS9aOXZrL1Z2RkJCbG92d2FrVmpLaFdsUFFOdUs5WnU2OEhtRk9j?=
 =?utf-8?B?SFNBUkludjJ6RFgwSEV6eFVZOUtsOXJTcVphMXpMSzNETFJXakh6KzJBS1Uw?=
 =?utf-8?B?M0QyRlI5SkEranUvYXJYY0JwRHJoTXJrUTdPUjFNcU51aGVmdmhpb3NxV1RT?=
 =?utf-8?B?L1Z6RnRndkR4VXBiM0k0MnNPRlF5LzNvZlpVMVBFZ1M4LzdtMHh5OU5FdlU1?=
 =?utf-8?B?TFlNWk40ajZMb00zd3FUUjQ1cWpNU3RxU0NjWjk4OWpsa2dadzRnZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa1e2c4-6eb8-46f7-4e6e-08de57757ae7
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 16:12:01.8547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W33o8LtguzfrVkIAxUIO50I+ajmlqsrKVoedlZny3fVRYU/9XoyI+XlIHPrM4ae4OM/RIYXds9wqjMJwNFB6BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5227
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

On Tue Dec 16, 2025 at 4:27 AM GMT, Alexandre Courbot wrote:
> The `GspSeqCmdRunner` trait is never used as we never call the `run`
> methods from generic code. Remove it.
>=20
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/gsp/sequencer.rs | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)

