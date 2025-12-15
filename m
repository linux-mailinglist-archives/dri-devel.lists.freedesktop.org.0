Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434A0CBC55E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 04:38:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54E310E08F;
	Mon, 15 Dec 2025 03:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="J3r001YQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010045.outbound.protection.outlook.com [52.101.85.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9515A10E08F;
 Mon, 15 Dec 2025 03:38:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQ+PBX2o+h2HoaC3N3UM+S92ASUR2YGcPNLNn/6sG3PzDTdPpl1DsOVwauKQkv/U5UGo58Bq4AoL+5ao3HZhuADmvCtc6nknHItoG4xowq0hpsskQapJk931Hro1YG0jvw0R9442gI2HCtnKSKq4/QeFE6q1/OcSpYtZ1v660BjJllHKvhk5zf+oFH8Af/43SLoNv/IaXkdnMuffI2bHk/RKQN/154hzZBGbc58CghtLKeoTT6t3tuHRDFWD0z9s8hxN3LYj/cmY2BfHpopbL11xgN8jFTIoihPg6kWXrC/nPC63BFrxBD4k8t+ZCI4w3ZnDP+86XeEVtCf5GtRbFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aySW5ZCg6rr++e16xaFHquDLUJ1EUlP1wwjy1AiFuDU=;
 b=M3l8XVZrOT1TaQO/zfKFTGsF50Si1TLjmYV+lGLAcwOmRlnCZhAaCiO/mwM/6oWpIkfP1przLyXm+5QQ5aCvtZAPZG6AV5lGJ5ZfteL5KkxvMlqTtGNQuVUJVoAOUxxTgiKxBgW8ihpfEZMgJYHF6VswNHqqcXR48NMzka9KcoYSBoC1XxQszEJBp6BbObw6phR8oWw35z7ktwRHI8XiWyZqe1WIhTuxlwgWM32YYFG9cPwwUyUOPbidLWCRks/hPNp2G60lvXxD3RXFfpF2dmN49nK1PQxD9q8QPglSWufk1NQnL9e8umOsj0PRg8KY8PtJx6CguVi/zQ6b6lvy/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aySW5ZCg6rr++e16xaFHquDLUJ1EUlP1wwjy1AiFuDU=;
 b=J3r001YQA4lTMV1D2vHBqHOkldwijXIjspUh9ZPCReaSerdPNS50nQxTFXyoqSE6lY2grdtioDUQPhhHTDikZ3+SVD6vFHz2ayj5iwjU3U9QVkdn5n+GHN4yBvtG6GSzA+wusBf1uYzoz7X2pBJPVgjyh6zhSwwfRXl6ML+3PCoXxxEwKji5/oS/ulOLc66FpY9uTHXRdqwgvsuCjVqkl6OmayDQqhL2gIFJjRAStdQzhfHO2Z6439BFkgjQzjWUiPb5jfldMoFNJ4rc/6x/JrTm98Zi+vYOsDkYZzgWYeQ1o3z0rdrOX0c0iAxZdva4YGlQHb+kJlqauFu/pxQCsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6377.namprd12.prod.outlook.com (2603:10b6:208:3b0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 03:37:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 03:37:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Dec 2025 12:37:53 +0900
Message-Id: <DEYH6HB5A8GV.EYH4ZAMXIFUC@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/4] gpu: nova-core: gsp: Fix length of received messages
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>, "Dirk Behme" <dirk.behme@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
 <20251122-nova-fixes-v1-2-a91eafeed7b5@nvidia.com>
 <504C636B-FB96-4B54-B9CD-C506026CCDB1@nvidia.com>
 <25aa90a7-e9f4-471e-9d93-c61b9a7a429c@gmail.com>
 <lgncc2k5klyqxzlz52dzia5v5ly3nfnjbv5if6esniulruahnz@b5fc5bfyltny>
In-Reply-To: <lgncc2k5klyqxzlz52dzia5v5ly3nfnjbv5if6esniulruahnz@b5fc5bfyltny>
X-ClientProxiedBy: TY4P301CA0123.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 02734c05-9d07-4052-1074-08de3b8b562a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emZncEJPQzZxdDFZdzZEUEhGMXR6VFByU0l6TldYYzlrSWJGM20yc3hxTG1a?=
 =?utf-8?B?NTNlYTJJMzhwYi9zNDhjRlprQ0l5UmxlcmprNnFIclFSalNuZVBWb1paNnlK?=
 =?utf-8?B?M29vRU5XZGFqbEducHlDZ1FkZWJ4citDR01ySW9TcXNPQTFsaTh1UWtQV3Bm?=
 =?utf-8?B?UlQ1TmNtZDYybnJEK0lTRWR4RDcrcHNFVzh1ZnRTY1plbFBTdk1hNzlrQ0VH?=
 =?utf-8?B?OGNZSUkra2NidngzRWpNZjVtdG9UK01iNXo5TWtWTTF0bUFNQk01cXZ6anIw?=
 =?utf-8?B?SlhCakNvdzVBdEFWZkh6a3pUQ3BPQWNLU1l4M1J5V1ZEeS8wbTNIQTRjZ3JS?=
 =?utf-8?B?UDVYWnZxek5tYWMvNHdrc1JZakVGd1lNTVp2Z1o1bTB0dWFET0NwTyt6V1Zi?=
 =?utf-8?B?L044ZzhXSTM2ank5aHp0d0VydzhTSG9uVjJpUEFPYlloaVduTmk0R2V1K2Fp?=
 =?utf-8?B?VllDWFQ2NG9YeE9COWlmUVR5cWttRVF1cTY4NllPNDJYeS8vU0FRUTFiL0Vy?=
 =?utf-8?B?T28rblo3aWVYcTJnWjBGaTlBOXhjYkdpeHBHMnhMRHlyanFzK2Zna3ltbzl0?=
 =?utf-8?B?M3NWYlFvbW40UGlMcjJiaWxoZCttT091T1RITDdmNkRyTkNPVjVueE9ldCs2?=
 =?utf-8?B?ZUNuYldnNllaekFGMjY2aE5aYXRQbXgvUjBOeXBhZWtYL3NqUm1PT3JTZGd3?=
 =?utf-8?B?bFF2NWtVeEFsVm1LdXhGK1R4TmxvckZRWUEvUjZua2VPR0hFellRdURMZEFr?=
 =?utf-8?B?a0NsQVp5MGlIQkxSa1B2ZlNOc3RPOE9Rd1VNZk1uU2E3MmlHc0hPeGs1Q2FT?=
 =?utf-8?B?NEdCVkhGbkZNTUkwRnNSaDRpaVhYMmExalJRZ3pqOEo2VmZqNjd6WWYyN2xG?=
 =?utf-8?B?UExjUU1MUC9BQmhlSjhURk1MREczbW9tQjFjT3FOUENnUExBZVZUMXR6ZTRV?=
 =?utf-8?B?cld6RWd3U1JxaGJFWktOSk9zY3NBQVcvOUNiNUhuWVVPbWlvMkNVeHQyWnFt?=
 =?utf-8?B?bkZQV1E0UkpSVjZRT0FkMmhXK0pvcmt6b0FCVXBJQ3JnVU5sNng2MnE0d2Ny?=
 =?utf-8?B?YVhYWWY5WXBYUWMwNmg1eGx5VHRYSE9WUmpwYlRDd1Jwa2tlM0QvbHIrbVFz?=
 =?utf-8?B?R2lUOXI2MkgwVU1KRkNqNTFiTHJMajRzcTZUVTNmSGdIUVYvTHkzM2kxS1Mz?=
 =?utf-8?B?YWNSdFVDOGZFMER0STgwTmhHb0dsR3l3bUJuRVlmbXUzN3dhdDM0dXdJc0lq?=
 =?utf-8?B?MjB5U084akdyQlZzdDVaU2luaU02VVBlTVZxVnhxMVJpaVgwSGhSeE5zRGtx?=
 =?utf-8?B?eXo0TzBQc01oNGtTbnRkNlhPT2RyaDZZOVlHbTI4ZE1QQ3NDdTFsMFZkOTRx?=
 =?utf-8?B?dk9zdFE1bzBMdGUzYVlZT3lLNWlvby81S05CRXZWSGZOVVgyc1VKeTY1Snlu?=
 =?utf-8?B?YTVxRmFocEpQaUNRKzl5NXpqbHRieDZwOWpPdE1lZC96V2NKOWVoVThxOEtZ?=
 =?utf-8?B?RkorQkNrZmNSTmpxVVZFQjZzWVMxYXhNWXJjYnZHd3drWEoyTUhBdmFxcmxP?=
 =?utf-8?B?NHVIaDVCZ2FLNDE3M2xkandKcStBa1BheHhZTThPR2FSdlRqcWZWUWYvMlV1?=
 =?utf-8?B?ZEdJQXNISlVhUWpMYkhsRTJNT3JydGdzL3BIQlVKNFBlNmtITXBmZ1FvbkJw?=
 =?utf-8?B?Qks5NUdCKy9RV3c0RHVPVVVjODR2eWN5Wk5xR1J2UmR5YTJyQWxzYTFFMnlM?=
 =?utf-8?B?MXB4ekkwelRsK3ZwV01RK0FSbGpwMnMxd2x2SVVnRUQ1ZU1xMlh3dGRiTmVO?=
 =?utf-8?B?Nks1d3FZQzhuNng0aDlWV0ZlNHRBcWp5ZFJDTmNyYVd6SDdDcm5WUmJsM28r?=
 =?utf-8?B?azJHQmJDUUxRZWdmRmgyOGUxb3owa0t2NEtVd2h3Z1BLQU9pM2hpaUlqYk15?=
 =?utf-8?Q?Slui8sa0pSKLjwim0030tEQXj9ZWNT3v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWZueVlZZkZhZWVSM0lKMEFvRjVPcnFmWklkWkZsOEtkR2M2NllFaDBRSFAr?=
 =?utf-8?B?QWwrbnQ3a05lSnJ1SzVMWXg2R09UL08ydGQ1T3pZU1Bob2JYVlAyUnVlb3VM?=
 =?utf-8?B?bElHVFV0dWF6aTJMQ3NLQmFEYVp0cHlEOG1UMFFYU3J5MTMwQXJGL2FkZ05Q?=
 =?utf-8?B?S2F6dVpHY2VqR3hGNUNoaXJlbWpFOEs3aCtIZzN1NVZOTUhMbWZ6R3lOMGxQ?=
 =?utf-8?B?emVSWFBaYjg5QkZBV0lTZjFubGJ5b2t0RXNETVE4UmlhcXVIOE5vdFB5M0hm?=
 =?utf-8?B?OXhtZVNsT2N0TmlkRU9DODdEV3JPdEZyK0ozRXVtc1UrNnBrR1RXTXpZSXBs?=
 =?utf-8?B?SmJFM3BvV1VQTFIrTWt5ZWxsWHNZM3phQk5jYWs4N3MxeHFCVlBMUm9VUFQ1?=
 =?utf-8?B?NGxSdFdGS2VEQk9NUG1JQ3lnV3c1ZHcxRTZHZEpVVUUzQ0ZZV05HRjdsWUlN?=
 =?utf-8?B?R1FacnZjc2R1dTBTTitDSzZKd3h0MjBGd1dPazdHV0xZYm0wUzErVU01R3ph?=
 =?utf-8?B?TXlWSjdLcHRqeno5UStEc0VlV0pqOGNaRkpXTmlydERzN0U1aFZ1Zjd3dnVh?=
 =?utf-8?B?emFiWmEvSmxPdjhlN2ZQajViS2xSc3VQdzRMek1jd1lwSnZMMlBZNTJSaXhs?=
 =?utf-8?B?Q0JwbXJtaU8yWDc3L1VkZHRWSmhrL1lIQmQzcHVLeEFyZWFLcHFXTU9BczZW?=
 =?utf-8?B?eHNET1o3anpKanQzeDQ0UGFKVUcwaVRibVNBanAxL3BLSGt3Y1h6OXN4c2RS?=
 =?utf-8?B?ekJvM0RnODBIR2x6UWMwd1Vsb3NRdmZ4ckNXMnZtQ2t6bkp0c3dtcU1TbFVP?=
 =?utf-8?B?YzVWTHlwRHdVYjNMQUdyenRzRmc4K0JXeGloNUlNelpxUHVTR2lrT0Q4MjMv?=
 =?utf-8?B?RitEaENLVlE0UDJDVEcwUnRvV0w0M09mY0x6akFTd3BtZGx4cFlwamFOQmN3?=
 =?utf-8?B?QU5ITzRORFpUOTZpZXdZa1F4ekVET2pyTlE3MjFabEFjWTRSK09WWFRiNUZj?=
 =?utf-8?B?UEdIaC9uUjVLcGVtbms2ejVNZkNPNDYycktJQ2tYNHdCUEVZcERxd1NMcW9q?=
 =?utf-8?B?WVpBSHJDcDFWR0dOUGE5bitpSEkzOEhUL09NQi96d2VFVFdiMUZwVWpHREFr?=
 =?utf-8?B?T2twR29DYUY1OVFvSEMxalhobHBWWWVYa2tScVJtaURnbVVobEVqQjVpQXRV?=
 =?utf-8?B?SHNkTGljNVJwdnZYOC9NWXVWUFI4Y1R5ODJyYk04NVlnNFY5SG9KQmVFUTFi?=
 =?utf-8?B?VzJ0SUp6UUMybVFIMzh4MHhkTFQvdm1ubmp1M1IzMk1TVlZ5R2NqWFJDam9I?=
 =?utf-8?B?VysxeW9XTGVqUEhPeGZTcU9yYjh4UHRTYjBWNEFUV1dLakpVTHBWWVRtdStL?=
 =?utf-8?B?SEd4UlluQTZGZVNJZ0pYV1J0QUQxTURQZ1VxUElTdHNJSVJwWUJFbUJPUlhY?=
 =?utf-8?B?OXN5Yy9samJzVlBFblZORUF3QnpzeVdPSStiSE5GSW84cFNTbnc2MGovWkp1?=
 =?utf-8?B?ZG1vbDlpUFJwNi90NVhVZER2RFNLNWU5cjRGRDRrdzJIUWlPdU05RWY2cmVn?=
 =?utf-8?B?Ti9MOXAvT0prRmN2bDFmUUtGb2RTT0t4d0ZnOTZHWCtxUEc4emFtSk9DVjFm?=
 =?utf-8?B?OUxrb3VUN1ZzVEhlUkdLNWFGcFBjaEpreE03S2dtL1dYM3BvVnFkc0dTc2cx?=
 =?utf-8?B?YkR3RVM0ZGFrazRWQ2xtRlI4ZldhdmFvOVg2WGxMclNJVE5NRjYrdDFob2g0?=
 =?utf-8?B?TCtiUmFrbjh6VFBpSWRTbHF4dEdIb3lIbExYMXhhV211eXNrelhGcHZ4RGhP?=
 =?utf-8?B?dFRLaGdGa3h0UjNnd0xQUmZ4MW5lZGhXWG9adTJrcVRFZnZldlAyblg5ZXpI?=
 =?utf-8?B?TSs1UGluWU9Dckx3WXlvbDRaUzQrS2RqZ21pWlg1NUttUHJ3RFFhV3d6MjZD?=
 =?utf-8?B?TWUxTHlaSUtuUGdZTnh2VjRyS0NjY1RyRTkwTFJNakhucnhwa3BTT211NUNM?=
 =?utf-8?B?T2JtT2ZvbGlhU2hEbkVTRmxpMGpYNXJ0RGQ1YXowZlZjeWsydEZwRG8wSUxa?=
 =?utf-8?B?UDJlUk40MUlqN1VrS3FITVlpL3Q1WHZtKzFTYSs0TjNDTkJ5VytrdFM0Uzcx?=
 =?utf-8?B?NmlFQzhRc1BEMGEyM2NReFdJNUQ4QTdtTGV1Z3JJZExyckovTWN4TFJnMkQw?=
 =?utf-8?Q?P/bwKhQjtsykBkj49/oC3o3ty13WKk/pkT70NgOWaREU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02734c05-9d07-4052-1074-08de3b8b562a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 03:37:56.9023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJ/qykLHsgDD+zBDFcA3XXWnxZiSdOm5M7N6lbEfTZzncGPHOu24YSQHrsKOVLOJaH1znI3vVvjRaQwjs+5ZVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6377
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

On Mon Dec 15, 2025 at 8:43 AM JST, Alistair Popple wrote:
> On 2025-12-12 at 19:10 +1100, Dirk Behme <dirk.behme@gmail.com> wrote...
>> On 12.12.25 08:59, Joel Fernandes wrote:
>> > Hi Alex,
>> >=20
>> >> On Nov 22, 2025, at 12:00=E2=80=AFAM, Alexandre Courbot <acourbot@nvi=
dia.com> wrote:
>> >>
>> >> =EF=BB=BFThe size of messages' payload is miscalculated, leading to e=
xtra data
>> >> passed to the message handler. While this is not a problem with our
>> >> current set of commands, others with a variable-length payload may
>> >> misbehave. Fix this.
>> >>
>> >> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> >> ---
>> >> drivers/gpu/nova-core/gsp/cmdq.rs | 11 +++++++----
>> >> drivers/gpu/nova-core/gsp/fw.rs   |  2 +-
>> >> 2 files changed, 8 insertions(+), 5 deletions(-)
>> >>
>> >> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-cor=
e/gsp/cmdq.rs
>> >> index 6f946d14868a..dab73377c526 100644
>> >> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>> >> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>> >> @@ -588,21 +588,24 @@ fn wait_for_msg(&self, timeout: Delta) -> Resul=
t<GspMessage<'_>> {
>> >>             header.length(),
>> >>         );
>> >>
>> >> +        // The length of the message that follows the header.
>> >> +        let msg_length =3D header.length() - size_of::<GspMsgElement=
>();
>> >=20
>> > Is this immune to under flow without one of the checked subtraction wr=
appers? Either way, we should not tolerate the underflow I think. Which mea=
ns it can panic when the rust overflow checks are enabled. Since the header=
 length comes from firmware, this cannot be guaranteed to not underflow in =
the event of a malformed message.
>
> I think we're guaranteed not to underflow here - check out the implementa=
tion for header.length():
> =20
>     /// Returns the total length of the message.
>     pub(crate) fn length(&self) -> usize {
>         // `rpc.length` includes the length of the GspRpcHeader but not t=
he message header.
>         size_of::<Self>() - size_of::<bindings::rpc_message_header_v>()
>             + num::u32_as_usize(self.inner.rpc.length)
>     }
>
> So the above calculation expands to:
>
> msg_length =3D size_of::<Self>() - size_of::<bindings::rpc_message_header=
_v>()
>             + num::u32_as_usize(self.inner.rpc.length) - size_of::<GspMsg=
Element>();
>
> Where self.inner.rpc.length is guaranteed to be >=3D size_of::<rpc_messag=
e_header_v>() by the construction of the type.

That's correct, although it defers the possibility of underflow to
`length`, albeit using two constants. Still, doing this as a const would
catch any potential issue at build-time:

    pub(crate) fn length(&self) -> usize {
        // `rpc.length` includes the length of the GspRpcHeader but not the=
 message header.
        const RPC_LENGTH: usize =3D size_of::<Self>() - size_of::<bindings:=
:rpc_message_header_v>();

        RPC_LENGTH + num::u32_as_usize(self.inner.rpc.length)
    }

This length computation has been the subject of debate between me and
Alistair back when we were writing the code, so this part can be subject
to change if doing so limits the amount of potentially panicking
operations.

>
>> Would this be a possible use case for the untrusted data proposal
>>=20
>> https://lwn.net/Articles/1034603/
>>=20
>> ?
>
> Responding here because Joel appears to have sent a HTML only response ;-=
)
>
> I agree with Joel's points - this does sound useful but as a separate pro=
ject.
> I'd imagine we'd want to it one layer lower though - ie. in the construct=
ion of
> the GspMsgElement.

How would that be beneficial? We would need to use `unsafe` to access
the data, but then unless we can encode the guarantees that we verified
in the type itself (or its invariants, but that would quickly become
cumbersome to manage) we would still have the same ops ongoing.

IMHO the simple and safe way is to use checked operations with data that
comes from the GSP.
