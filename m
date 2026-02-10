Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDrUNXDpimkuOwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 09:16:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE2011826B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 09:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5AA010E050;
	Tue, 10 Feb 2026 08:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Z99asS4U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011040.outbound.protection.outlook.com [52.101.52.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0BB10E050
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 08:16:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8SMaCXJ419janu1QkrlXjp7ptSK1ckjrwi9WB9AeKFYsp1O3LV8+y2DFqNh6Jrh+QUcAQDc5X60vU4mjNOzQZNJPu8GrssUPGDxC/C2JRwcZcAvaHqnUdhbI8kFvbEoXVG5AaX3cjl/+Ffj3pLIsEO5yk4feppY+RCg7ep/7Po1CLm2I+L+xC7DzyGQyvvDSApD6CYls2Y0XFUwxQvdv4yduZ5K2/v8K8BS8i7ouKpyDnWZJe0g60PZ4wafA0N+bztQexR8eHO3D1Z7NaVS/QRJZAEOurEY7n+GPshvvTjB+iXbx95OWm6NR8M0vMWSeMZyjSeABXuzHM4gSflGfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cO7t9QA9vJAnyUJepicTQ4FEQQFT34xs8XmsSaOyj7s=;
 b=oxYVAYpF1PMEMhxh47/HuJGJ0BJOcBCzuqwQBooT9rsZHWovh49kPNya02Rd8L33iGuWHc/ACS6OgRbU+9OciuFDqBcdWvCzucRqDhfRrAcdwrqib/dqUp4CQXkE5xkuSIIEtgV2GvrvNyDJgQgRYVQL8hwWQnW7PWb2IU+MccPo/UDKu6h0QIJQjsVVp8dJDSEsEFdsyV/QMtL7fe5WYCPQkAz4GFfTukOM+Xm4QbwueAUHYQNxDmZJH/c+I3uHRsO95hjpricGZoDU2btHGqfK+8HwJQUXBbcNYhkfFr2m9ShuN3Tp2wyj9782qescuBaXCMQ+NQh8/KkZEJuA4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cO7t9QA9vJAnyUJepicTQ4FEQQFT34xs8XmsSaOyj7s=;
 b=Z99asS4UX8ywcNUu849YD8Rj6anNreG/xI1Oem3weZnUV27Lj7Y50YJtIM3om/xWlJJ1VXGTaukreN18ddPqo6iXwFon1yGHLlncZozU7SEUqpRplmj5u+5Sa/IrUVe6PSvWBAZ0w/KhpBHdDb/VlBOzXjjKuPWhjyaZ2wSAU48=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 08:16:40 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 08:16:40 +0000
Message-ID: <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
Date: Tue, 10 Feb 2026 09:16:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-4-phasta@kernel.org> <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260209155843.725dcfe1@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::20) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|IA1PR12MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: ac75cfdc-8c9b-466a-695e-08de687cb790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTBITFR6RjhYK1EraU1GdVNvTGlyT2dmNDlFVlBFdEwvMmgwenpsNEV5ZjNn?=
 =?utf-8?B?YUZVVVNXNE5tZnlmcU9jKzY2czZ0SXl0QXVPdmpack95bDBHK1o3SkZHZHJa?=
 =?utf-8?B?VEdWaFBEQnkydWFmZFFqcUhvMk8yNk51UEptK2ttMzhUbFR3bEtDUmplMkpz?=
 =?utf-8?B?eFlhdTVuNEJFcVEwMlJHY0NDaklRNHNBVXlBMlk3MHNYUkNIdmlDZ0lDYVVO?=
 =?utf-8?B?S25SUi9ITEYzZGhmRkZTWGd3S3FodmgrZUtIaVBPdGQ5NGJncEpNZTBJOEMx?=
 =?utf-8?B?bnNma21nS3p5QkJ2YkNkMEkwNm50R3d5dkM0OG00U3M4TWVKaVg0TXdvUVU0?=
 =?utf-8?B?WjhqYmNIR1BVeHh3cHNjMUFVUTFtcm05WEtrVGEwRG14bGh1TGxmSkVXSGcx?=
 =?utf-8?B?RGlvZitzOVJsYjRaSHRzdDUzS01qdFRBblN5aSswNmVwRnM4cVV5NktocVRj?=
 =?utf-8?B?VTBxNnp0Z2thSkxzblZTSDNoOTYrWFY1T3BPV2hhQVlmQ0tScXdIWEQrdlQ1?=
 =?utf-8?B?K3ZJR1ZWQm1Ra1djdGJ2cEtTTXhMSWVKbWlzWUxvL0JIUkJudmpjaEprSFhD?=
 =?utf-8?B?MjFEVU1xVUI4SkQ3SnhkYjUxVlRUOXpoRW9IUU82RzUyZ2cvSm9PM3VudmdY?=
 =?utf-8?B?WHIzdTdmdm0vbHVUWUF5YmVEWXVOdk9PczlCLzRvcUh1blJBdnpNSDRxS3Iz?=
 =?utf-8?B?M1dZZm52bzNmL0tuVDRXaTFhL1FYY0xvdjBYN3NzSWR3bkw0TS9aRXdqS2lm?=
 =?utf-8?B?RnJIV2pHN090akEzVjJ1bVJSUUZiQ090aktzUEhvNm13SmRLaE5BRUZLSmZL?=
 =?utf-8?B?V0xZYWQzTTgvcGk2RWlpRjNwMTkxWnVnNHkwU1I0V2l6SlE5Z2dLdFBGMVFs?=
 =?utf-8?B?dnRGenFLY0ZiTXZSclBCT1pDcEZNV2haWmwvekh3OVNqMzR1dlFwRVB0eXln?=
 =?utf-8?B?T3phYmk0djNXdTA4VlpFTVUxWXkwU3U4WG5ENGNiVWdmVUt3N2ZIRTJrd1gr?=
 =?utf-8?B?Ri9DUHhRWXBjT3F0bTg5bXVjcStlRDBSeHVBRzUwa2U5OHp2SkNmY3NUUFBy?=
 =?utf-8?B?SDFneUw5a3FmUnE3Mm9CMjkxdFVoVjQrT1lqUmk2Rm1oRUpIWmZHZUFtNHha?=
 =?utf-8?B?ZU5xZlpZZDFtY0FiV2h4TlVVVFZGMWpkQ3QwK3hRbmp3ako2U2FQc1NwcjNS?=
 =?utf-8?B?NFJKaUFxQWJXYWxNeW5zTWlzdW1vbElWSi9wQnByeVBpWWlNd2Y1QVFXOVEv?=
 =?utf-8?B?QjB5TGgrdjhSVGNlZkZISnFvTlhFazZKd1RZVjZoYThUdEZBbU9wbXFMWDlz?=
 =?utf-8?B?WXl4NDcyRFllUWowQzZPUW45NXZIZzlHdmdYUG01ZGdaMmpCdUQ5MDlIdXNP?=
 =?utf-8?B?WEJqTU5TRGNWWGcxekhsazU0OE9ZWkZiaWtxSlZlZWV5TmZaNU5FTXdLT3Q3?=
 =?utf-8?B?SWFodERlMFovOEgvcXZPZUxobnk3K1ZGZHFIVzNFSXBBV1FoQkxpSm1UWHFI?=
 =?utf-8?B?UzV1U0h1K2pHTm5tMEpBMGhFOEpwZ01vV2lHNkJmRmpCRzUvZ1BDUFNncFhr?=
 =?utf-8?B?SzdlWHpGOTAxZlpFU3BuanhrZ3BTU1hFemFieTlGMTlzSzFIMFFxemowZG80?=
 =?utf-8?B?TDI5ekpLRHFNYktnYjFjYjZtKzdmUCswMHpKd0ZIZVFCV1o3R1RaeVBFZDkr?=
 =?utf-8?B?bEtzOXdyTUtzdVNqeUJlcmRGUzh3MlJwQmRuVHBEYU50MVZ1Z0sveG9TVmNi?=
 =?utf-8?B?M01rTzRyRXdJblBMcXZWUnhIQ2pZZmlvVU5PeEtSazdzMFd0cVh5VnFBSlRC?=
 =?utf-8?B?MDQ2TTN6TWh6UHpPWDRvdklER1hKWFd6dFUvaTdHR0EyK0xHcXBmUHl6WlZj?=
 =?utf-8?B?N2lCMmdhaUR0UnlzRGdWUXdBSXZGZytvL3JhZW9kSGo5SG1mUkJEZ3BrczVy?=
 =?utf-8?B?OW93TWdSaDhMY2tXdk1pNWdETHowcHF2TS9LNC9YQWphZzZnTGZxdXhRZUs2?=
 =?utf-8?B?WUtoWWszSG81bTdBM0hheUVmSGRQNXcyRW5HWndOT1RHNzBPZ1p3dDYzc0ZS?=
 =?utf-8?B?c2N2dE9FM2FkblQ4Y2FkcThRMXVheFkzTjMwVWtCL0J3R1BPWFBhVURKVFlY?=
 =?utf-8?Q?Ls9E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk1xLytBODJVSndra1M0RjBTN1VSa3JtRGQ0Y1Y0UjBBeUl0SmRGUUpkYW8r?=
 =?utf-8?B?bFg3K0k2RXFkemxpcjV2TVJXaU53ZkQ0My9XQmJCb2xXQzNXcHEydXNQQkxW?=
 =?utf-8?B?M3hxMmQrRld5WGpvd2JNK2M4QS9xVlpseXJnR2grRVRpOUJ2eFR6NjkrMUZz?=
 =?utf-8?B?R2h5TWlIQjFSQkFBcWdJQkJtVVp1dHpxMXJhQVFzVUpaK0p4NUZKMUVXbmhU?=
 =?utf-8?B?RzRSZ1BZckllb2ZCcjhudXkxUkREdGI0dUh5T1VkWlJMWGtKMHBMOXhtR2dY?=
 =?utf-8?B?UnZZYTBUbjVCZmZaSHVpOHArZlF6eEVSZzQ0M095b0hCbC9td20vM09qYzBt?=
 =?utf-8?B?RDlaQ0FoTGo0bDFSNTVtNHBOeVVrbjY2blRIQjZxQjZkYW5tQ0cvTmJuUXlM?=
 =?utf-8?B?QnhWVGxnREpkUU15VTJiaks2Q01oeC9NTHRnMVkwZjVXcHdOb2JWUkhHc0x0?=
 =?utf-8?B?YnpKQThuSDZmV3k3VWRUNnU1eUZzbGV0OVdlRXFuWFpLaVBSTjFRQ2RzemZL?=
 =?utf-8?B?YzFlaDJ1WnBwSDgzbElwR2JCV1lySWREQVdXY0JpcU8wVjBBSzJrSDU4OEpY?=
 =?utf-8?B?RDkrMWlEaGQvZmZqcGJ3NkdhbHhTeERVeGVicGN0eDhET2hnUCtNNlpwaW1h?=
 =?utf-8?B?VW4xWStPMHpxL1hsSjAvU3BEd1NQK012LzgrQTBvRHcydmxMdlRqMkh2Nm00?=
 =?utf-8?B?TjlqblUrZTdrczYrZitUSUpNTC9BaGE2Y1lmL2pXSVBjTWpuYjgwUnpUekwy?=
 =?utf-8?B?c3JoekVrcUFlOW9IOG5ab25LOUJORnY0c3g3RVpwUFI4TlZzM1pEQ2ZQRzRh?=
 =?utf-8?B?dGhMNDZWWFdJZmhqTTJpeEkzSHB1bk9Md0RRQXFab2djNFhBTHVJRTdSNmN3?=
 =?utf-8?B?WGdCSXY5NmJsMjNxQTJsY3dVRFV0UGY4bG9Nd1FaZ0ppUkFwNThuT0hKUW5J?=
 =?utf-8?B?cnpvZUFlRGlIT3gvc0JLT1kzRXhZaXpSTElaNkp5bEYyQ1hvT2hpc2FIZmtM?=
 =?utf-8?B?YXF6S0ZGUWEvZHR5Y21hNjlDNUMyZmJaVHI3Q0w1VjROOG1ycGhBZnZZRTdy?=
 =?utf-8?B?WnhMd3c3R3hHRDdpZDZHVHFrV0VKN0FYcFRzV1RWZnhVWjhLY1F3SEJwRWFH?=
 =?utf-8?B?SWdxSFRsdzVqdjZmNXdIVENURXNqQ3VUZkNUSDg0cW5vY0hIaVZnajJMUFFV?=
 =?utf-8?B?aXNZUDFRTXBVZFZGT0F5M2wxV1EwN3BQcU1kT2ltYytZY0xsNGtKZXlsMTBI?=
 =?utf-8?B?Q3B6NlY1YlFRWVEvcTNQWEVvMzVaWTdwVytUQUhuQnBUZ2JGd012WGRzdldW?=
 =?utf-8?B?aHU2NXd4SC9lelpMNDRIMkNpUUFMR0JFWVUrU1hXM2NXZUgrWlUvQnRSMStD?=
 =?utf-8?B?bGVmRmR6UTR2ZzhRMENlRm1XU0xibHJiNk96SkhuZnRyTWFuWENoR05aYnpR?=
 =?utf-8?B?V0tOSU1ZaXc4dytjOHZXa1B5c0tRTmlmakZVNisxM2FpbmxFbWMzSjZCRU1H?=
 =?utf-8?B?d1UyYkU0NE15eDVlQ0VUTFVkbGx1WGdGVzFsTlFJUERYMDJNZm02TXlFdWx3?=
 =?utf-8?B?MG9XM3R3REp5TGxBbTZEcjdDczFxenlXdjExdUhyeU16bUU3MTVITzNhWUdX?=
 =?utf-8?B?cGRvRWtUb0lyQ0ZhVDlCOHhTbThRMEFkRUpabmVOb2hTejZhWkdrN2k0OGVM?=
 =?utf-8?B?QnhNcndDU1dBUzhGdk9kckM5b0hpelEyd2phWkdIeDUraTdVaFdtRUNiYWYx?=
 =?utf-8?B?cXpPQUJoOU1OR0VmVjlxVnVDTjFDWnVQVk9GczBla1lnKzIyWVBTMU9CVFBn?=
 =?utf-8?B?dE16UlV6M0JvQ1BjWVJyOFBrd2liNkZ2TjlabnM5VUczNy9GNXB1ODBYVXVI?=
 =?utf-8?B?WHpRMzJmeWorU252VDk1b0ppRzJGaVQveklCeW0xbHN5aG5wM0NBbDdtTEQ2?=
 =?utf-8?B?RFZUOHJTYWtiWUluY1o4UUxadWwxUEg0QTNPYm9zREx2Wk54cU90dS9HVXBT?=
 =?utf-8?B?OEYyYW1xQkxnOWcwdG5zT3JPRkw3bk11UnhwN3BkbVM4RWtna1ptTC9wVU9Q?=
 =?utf-8?B?N2lTbm5uVElReE01bG1mckJHTGsyamJQdUlrRmZqdXhRTXhQSmp5MVNFVUdx?=
 =?utf-8?B?TmxsN0NLRStCc2N3cEN6b3Urb1BZenp0dGZiMy9MNnllQVlxd09PcjErMGcy?=
 =?utf-8?B?T0dJb01PTll4L09kV0U4YjBkN25kWDdWT0c5UXlwSzR6Q1NBdWIwK0orK0M4?=
 =?utf-8?B?V3BZOVJWZXlPQ2IzaXhJVGo3UEtBTFdqbS9oTURhTVpNRjNMZTczVitES0M4?=
 =?utf-8?Q?F6Q4pq3ccCVFPE1Lzz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac75cfdc-8c9b-466a-695e-08de687cb790
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 08:16:39.9661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1UXsTcMp475urbJcRR50aAxtFZVVEoaQEtM6yco2MwKUF3TDEC1PtReiVLrlO3NX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6259
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:phasta@mailbox.org,m:phasta@kernel.org,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:aliceryhl@google.com,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,ffwll.ch,google.com,garyguo.net,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,mailbox.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2EE2011826B
X-Rspamd-Action: no action

On 2/9/26 15:58, Boris Brezillon wrote:
> On Mon, 09 Feb 2026 09:19:46 +0100
> Philipp Stanner <phasta@mailbox.org> wrote:
> 
>> On Fri, 2026-02-06 at 11:23 +0100, Danilo Krummrich wrote:
>>> On Thu Feb 5, 2026 at 9:57 AM CET, Boris Brezillon wrote:  
>>>> On Tue,  3 Feb 2026 09:14:01 +0100
>>>> Philipp Stanner <phasta@kernel.org> wrote:
>>>> Unfortunately, I don't know how to translate that in rust, but we
>>>> need a way to check if any path code path does a DmaFence.signal(),
>>>> go back to the entry point (for a WorkItem, that would be
>>>> WorkItem::run() for instance), and make it a DmaFenceSignallingPath.
>>>> Not only that, but we need to know all the deps that make it so
>>>> this path can be called (if I take the WorkItem example, that would
>>>> be the path that leads to the WorkItem being scheduled).  
>>>
>>> I think we need a guard object for this that is not Send, just like for any
>>> other lock.
>>>
>>> Internally, those markers rely on lockdep, i.e. they just acquire and release a
>>> "fake" lock.  
>>
>> The guard object would be created through fence.begin_signalling(), wouldn't it?
> 
> It shouldn't be a (&self)-method, because at the start of a DMA
> signaling path, you don't necessarily know which fence you're going to
> signal (you might actually signal several of them).
> 
>> And when it drops you call dma_fence_end_signalling()?
> 
> Yep, dma_fence_end_signalling() should be called when the guard is
> dropped.
> 
>>
>> How would that ensure that the driver actually marks the signalling region correctly?
> 
> Nothing, and that's a problem we have in C: you have no way of telling
> which code section is going to be a DMA-signaling path. I can't think
> of any way to make that safer in rust, unfortunately. The best I can
> think of would be to
> 
> - Have a special DmaFenceSignalWorkItem (wrapper a WorkItem with extra
>   constraints) that's designed for DMA-fence signaling, and that takes
>   the DmaSignaling guard around the ::run() call.
> - We would then need to ensure that any code path scheduling this work
>   item is also in a DMA-signaling path by taking a ref to the
>   DmaSignalingGuard. This of course doesn't guarantee that the section
>   is wide enough to prevent any non-authorized operations in any path
>   leading to this WorkItem scheduling, but it would at least force the
>   caller to consider the problem.

On the C side I have a patch set which does something very similar.

It's basically a WARN_ON_ONCE() which triggers as soon as you try to signal a DMA fence from an IOCTL, or more specific process context.

Signaling a DMA fence from interrupt context, a work item or kernel thread is still allowed, there is just the hole that you can schedule a work item from process context as well.

The major problem with that patch set is that we have tons of very hacky signaling paths in drivers already because we initially didn't knew how much trouble getting this wrong causes.

I'm strongly in favor of getting this right for the rust side from the beginning and enforcing strict rules for every code trying to implement a DMA fence.

Regards,
Christian.
