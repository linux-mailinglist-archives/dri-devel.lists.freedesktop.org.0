Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D09AACAD1D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 13:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402B910E4F7;
	Mon,  2 Jun 2025 11:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zq5xrXb1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5A010E4F5;
 Mon,  2 Jun 2025 11:20:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9Kg5aqh2vtv789wBJSGM3NxG8sUEl/KY79RScSfSlvS4QFV2etM7/1euc4FT5eaDoX/7UxO1jo+is3Q97fSnQs4BXXkvE4csfh7BjOeKkgmJXOufmdp+32KHcFM0wEbvz2c1NjhJ7xxZZkfJcPJUz2J9X6MDshi9gDTpQccKTV9arM2CvPSM3YPGUsQMZg344lNKMvj0tQRDhKhvL7twjhNuTtWD86vgO9PWSzVT18tZqOW21DkYd1zUpzfwR9lfjpT/rZL3E+IqDHYW9YI9/3gf6G1vK0cU3oFlu2KT+APmxRMNCC/2q7EnThr1/wqVH2Dsx/GFws3wf6k1qTXOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=986HdkUUb2hVOV2+D9qxq/xSPIZXpsCYNOk0k6KDGIM=;
 b=e7vE4ucbqcrcQg1/lrHvHcbERiUVMG+Yx2AZMGsRXRjLqNW+i3onfzY6QIyRtYSjYVXNTXeaSo4G7MCfOKCUAFUqydqZoZpnaG9hAY4pcTngD53mpNtRkxIlKX/tr80WQl9RhsJXol65Uzb8NMn6Y9DJ5p9mCrTanMickKGIdHJo0yACvLGxDph3Ix2RIpnQEypOzKiFtIH01cT4dOjWqlgnmDbFVQof3gqyLPNjK7k1+BJGdv7c41yJsyBqDaBjdsT9VlP6m8lSt4WlLjc8z8l7gJMSMr+6LTMSgQEIM5nhIS3HEsibMILivb2qAdhIme589B3y53MoxEoixWiCEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=986HdkUUb2hVOV2+D9qxq/xSPIZXpsCYNOk0k6KDGIM=;
 b=Zq5xrXb1uqIMmq3hiT2YLtCBzaRCZ88ctufrz8aX6rLEnUVmYxzIXjJ57ReToVSCVnkuuTZAYmoL5b/C/wZywYaD7u6x0GqlvUkEzi2G5Uw6X8X24EGhid9km4pg+q4UoVX5b4pxOkjlgV0kXDbLPUnnKbxARhRHvHnq6MmYmstmHoe6P7uNyd+WOHkMGGif2rsCjks8QaYusb1fMcmfDF6mSDtEFTyMoJeIH5YBheD9PnoTtA57/JXGrzzwX793pGCsPZ1lenTPWGw/Gmg8Zuyp/7YkQ5cZdYUDIsBQA2sDmL9/BSnv6tkzT+qE7eJ1teRYvYqaZpgukp3KdpTjaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7250.namprd12.prod.outlook.com (2603:10b6:806:2aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Mon, 2 Jun
 2025 11:20:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 11:20:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Jun 2025 20:20:34 +0900
Message-Id: <DAC09YUQ6NAN.3KL0WKZQ40DES@nvidia.com>
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
Subject: Re: [PATCH v4 13/20] gpu: nova-core: register sysmem flush page
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Lyude Paul" <lyude@redhat.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-13-05dfd4f39479@nvidia.com>
 <44f13ec88af918893e2a4b7050dce9ac184e3b75.camel@redhat.com>
 <aD2Ge8RM1uTT726z@pollux>
In-Reply-To: <aD2Ge8RM1uTT726z@pollux>
X-ClientProxiedBy: TYAPR01CA0193.jpnprd01.prod.outlook.com
 (2603:1096:404:29::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: e68164fe-e89b-4969-f430-08dda1c78192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTBZMjljZ2lJcVZDSjQ1OVRxTG0vMGZ6TEtpbk1Pa04zNHI1bFQxSUdtNUNL?=
 =?utf-8?B?c2l6UldmSzZrcHVVTU9sbjNaQ0drUTVlNks0Y1A4aXpmOCtLLzZKTHdFNjRm?=
 =?utf-8?B?V2ZmbitVK1ZYaURkL0FidVZSejdPdFlVVzRIbE5iekRhdDdSMW81em5vVkhs?=
 =?utf-8?B?L2xtQ3ByRnBKa2w3ekZHQnRVTHBPQ2drMFZOUTFVZjRKU2VqeGQ3d29LLzBx?=
 =?utf-8?B?QVM4MVI5bVcvbTdUT2Z4bDNIWTltKzhBbTArQ0gzd3hPQTJGb2VscUZEUkhT?=
 =?utf-8?B?Q3NkbnE2NFQ4MElvQXBwc0hGaXRxWEJXTXo2ZDkvRG5ibWpLR2NpaS9NQW5D?=
 =?utf-8?B?TFlhWjg2Uk13QW8vSFpxMzVnQXU4TTN4KzhpN3pHczI4T1oxUmtsdTF2UFov?=
 =?utf-8?B?TlBQQ1JhdVVOUHBvdDI5aHlPTG9yUzRYdGltalNOcVBwVlhGemdoVlFSdENE?=
 =?utf-8?B?SWk1bkMzNU4xV2dhdWl0NlRuL01KRmpoaHRONGNZeXQ5eFRWZlgvUVpGMXBU?=
 =?utf-8?B?WlNocHdSVlVEZXRxeHJTUlYrR0dvaUJZZ0VZVGpJYTJ0T3dhc0RnWm1oS3NW?=
 =?utf-8?B?aWFHS085TG5mMUwzQ1UwM29keEN1QW9kQVFpS01yOFdOREVMaDkrZWYyc2Jh?=
 =?utf-8?B?eDhnY3JCNVo2NEUxN0pPeTVBNlBnem9aSnJsT2xqcm9vYXdzRE1XWGJ0eFYx?=
 =?utf-8?B?Z2pDa2EwWWpjclM5aWxFR0o3NVJHKzlSMEJydFdFQ253OXoycnI4eVpDWWxm?=
 =?utf-8?B?UnE0bEVCKzJBeXYzS3lVTEExQTVWN2lwVE0xVmRVemhhOHFFZHRtOU5qRFJu?=
 =?utf-8?B?UFhmME1aNGwyeXpuNHczZWZ0M2NRNWJSUzZaMkZ6dW4xb0pReFEzNHRidlpE?=
 =?utf-8?B?NVpHK3NRMXpVUFVVWkZBQWgzZUp4TmlFalNLU21MK1hVTUMrMExMQ0tpUWtm?=
 =?utf-8?B?U3FQQnpsUnBVTDNOL0ljOFNQTFFETlF6RG5YMjhpQ0dkaER1dnkyYTRqM1gr?=
 =?utf-8?B?L01jZ1hEODllelRydHJQYmdLaFFUdC80Y3FHMWVYYmxUSkphdnY4NDUreEhB?=
 =?utf-8?B?RWMvc3oyQU93bm9FakRxWFdQSGdvdlpiZkFMdnZrRjY1Wlg2b2dBZVZ5SHU4?=
 =?utf-8?B?a0NVU0tJaS9rdHFic3R1ZnZUdDNwZ3owN1JTQ0tIY3hseVJXbW5FR2huU21U?=
 =?utf-8?B?RDliUzc2OU9XV3ZyRmJjZGlrbmhXWm9vc0twTG0wK2orU3Z4ekpMOFVWWXdK?=
 =?utf-8?B?V0xTVVdCSTF0RHBnWWJtalN1dzRPNVZwcHhWbkRFTDhCTW01b0NWYjM0cEMw?=
 =?utf-8?B?ZTRzRlJmOGpKRTVaem1yM09oRHFBMGQ1b2JRZERPM2FRL2c2UVNTVGZOT1Ro?=
 =?utf-8?B?TndJZE9sT2l4SXBDU1ZRRDUzUUgwQ1Vnd21jSzJ4bGZLVmVIckVYQTVOWmZ0?=
 =?utf-8?B?cUVzZVFKMk84Qm0zZWc2Tkp0ZzZtbW5DZk9Ua3JJUVo4ZlNBd2ZwSEVhYlBJ?=
 =?utf-8?B?Umxrb3pQT0RMRThWYzRnRVJyRTlSWWZZRVJXYXdoSTE0WDJ1K0xPY09TdTlC?=
 =?utf-8?B?ZWpZRUhiMjRvL3pNNitYWVozOUJadnFKaFg2d3F5VTJTZUVjTWw2VWphcmww?=
 =?utf-8?B?ZSt1TUdNbnFMWk5RNDFUaW80QmtKVzk3TExUeExVa3hRU3NqV2p5dS9SK2pU?=
 =?utf-8?B?bEtzOFMveUVLMlZHeTJGSGZWMFdyRHdOTTFxVEJFQThkS0FzNXpheHZXVU9q?=
 =?utf-8?B?VVQ1KzRCN2huMWh6SERoT25LZzgvcXRnWWxWRnR2TDlLdWNob2cvQzNkbW1u?=
 =?utf-8?B?eVhHdE1EbHoxUi9tV1RaUzdoWEpZa1prZ3o5M0Vlb1ltOThjUkw4MHNDdm42?=
 =?utf-8?B?cWcwTStJSVVNQ001eVJxdzBZTHdwd0ZHZW5wbWFzazRXOExvYjVCU1c0THBF?=
 =?utf-8?Q?WdWuzJ6i6RM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXpnZkExOHY4ekptZlNKamozb0ViR0lmYzR6dUNid1FCbU5sYlBtWm1JM3dr?=
 =?utf-8?B?dVV4L3luVzg4enAvT1JRdERraEZOQ09MWTYrcG1kVy9pZ1A1VWZVVjhDNFVR?=
 =?utf-8?B?Rm5WMmt1aWszRWRMblJGQTRWN0lzMjFtcVdZemF6aFQ3VnppM0V3RW1FTTlG?=
 =?utf-8?B?MTNocVhwd2M4YXpFWTJKTndTU3h5ckhtNU5rWFJmK0lrNFo0SFhobEJDOGJy?=
 =?utf-8?B?THZ0RTRDV2ZNSXlzdllqN1NCUk9EWWVrWFBBZTJxVWVFUnIwNEtZSFVKdGVh?=
 =?utf-8?B?a3Z6M0RLWEhMdmd4M2FKZGpYcGFxN0Z5ZlBWaFZ5dTluc3BTNE1XbWtnUmRa?=
 =?utf-8?B?b2w5SUpEZ3I2S3BFeEc0KzVmWmhma3pVT25DN0FrVkEyWlQwUitXMkpmdGlP?=
 =?utf-8?B?ZXlxTlNqMzBZZTJYRjF1am81ZSs2NXYraUNWZ0RLNGJSUlRQZXZzdk9kRlhh?=
 =?utf-8?B?RlZyUlRQRC9GNklOK0dRMlZOVkhnNzEvb1BPczF2TldGd3U0TG81NjhKZ0ZT?=
 =?utf-8?B?NmFSZzdLTi84WWlrZDNyTmg0WlAxMkhrVVQ1bHNpa0hNMFVLZzd0bmxuQnVp?=
 =?utf-8?B?d3hJcmY4OU5FU2RXOFR5cUw4TXcya1doUHlMSEIxVnROc2J0MGZpRUNEdjNu?=
 =?utf-8?B?NnlQY09lZWJQamczaE9xclg2VEdSM0hnVGd0NVh0M3FCNUdhVkJ4bDVvaGFz?=
 =?utf-8?B?UUhkeWRtaWdzWStLR0Z0TUNDRmJFSnVWN2RlRDhuLzBqZVpZeW1Pc3NpdVRm?=
 =?utf-8?B?NzR6Z3FuU2lkejdrMmZPNDFzS09mZHovaEkzWGVuYzQyajFvWjdKNDFlQU5s?=
 =?utf-8?B?NjBEYlVlb2pLVDZTTW9rZFVoYzB3elo3V3FSbzY4NzlVYkF4R3FaMHJ5bGpR?=
 =?utf-8?B?MnJRRWRqWjBsaDdBSHc2dHZVeDVsK2V1MWxJYng5R0Y3YUN1b1NsSW9qd0lD?=
 =?utf-8?B?QTBUeVdGaUx4UFE2bkNTWEx5dDMvMElkaTB2QkhNVHFjbGJwNndZSXpiUUFI?=
 =?utf-8?B?dmE3Wlp3eEdQQ2FMV3lQWDZtMllFN3o1TGpjY1k4Y09CRXY2VWRGc29qZFBk?=
 =?utf-8?B?cEl4YStJRzdMZXNaT3d1aHAzSjVVc3JCTDNKSFZuYnl1ai8vTzB1cGhHY0xh?=
 =?utf-8?B?UWhrTGpEbjVoQk1mRFltOWlOaDNBWEYzaXRyZ1I1Vkl6QnlGNTZnSzl5R0hr?=
 =?utf-8?B?bStTUkx4UEZ5RG9pUVUwVGIyS2Q4akpwa1F0TERJVlA5YmhBUFNOVStCWUc0?=
 =?utf-8?B?ak55TUZ5SW9TWFVVTkNqZEh1NU0zVzhsT0w0OWxGcE0xZzhvT28zYjRad2Ry?=
 =?utf-8?B?QThqZlRhanQyR1l2aHd2NXNNTXA3NHloOG4yZWsyU05yVFhDZlZNUFFJOHF6?=
 =?utf-8?B?K1JMY1BiazNoUDNNRnlUbDJyYlhFbExtRldFTlBabDRQZFhJUmovcm9VemZw?=
 =?utf-8?B?QnhNNFdLK21wd2NPY2E5WGRkRVdkYVVBSnA1bzNtdGhDUDR1SStvMEdlUGw0?=
 =?utf-8?B?ZExoYTcwZnpDZXFaRlp6STJNM2tCK1hHTmROMlI4Q212NTAraG54WjBlMFRJ?=
 =?utf-8?B?WkRMdk1URzI4alhWQS9qMXpwcDVDVVlXOWx2NUFwZDI1Y3E1aEJyQXZ6bUdz?=
 =?utf-8?B?SlNnT2YxdHg4c0FMN3NDVzdGZW81aXFxc0FvcG5yb1FSRTlIa0JSMXpCTStO?=
 =?utf-8?B?RHR2N0ozYWpMTGRvSkNpSU1hbEN2RlFHTlV6UFZwZEYzdkJVQUVvMXZCSFNJ?=
 =?utf-8?B?VXBZY2pNZSttRVAwbmNweGZMK1lkV2JKWVRFMVZLYUNNeDBEdjV5Q2U1N2E5?=
 =?utf-8?B?VmFpMFlkc3A2TEFhRXdBS2xlOXFwalJKL3NtTmlIVG9DazlOa2ZxTEJiMm1R?=
 =?utf-8?B?djQvVDFTM29TSzhGQ3JEUXMyOTU5SHB4SjdQRmd2dWxWWmpNZGxycTdGZU1G?=
 =?utf-8?B?UlFQcjRwUGkweXp0Y3ozYmQyM2NvaVBwY3gweC9wbHZGYitJZ1R5ejlXZXBW?=
 =?utf-8?B?cGpRWjRYbnlqNWtZK2FOVytWcmYwZUlBdUJlYWxONmsyY0dkeXVUeVljcFM0?=
 =?utf-8?B?d0tXbDVsWGZRbjhQTDZvS2tkY3QwdUxRTVh0aHlML2tQV2JiemdVcFBLYXox?=
 =?utf-8?B?aHN6NWp0eWs1RzNLNm5GM3V1dXpET0lrK1poQ0dBVk8xUURHZHVMRXd6ZlZL?=
 =?utf-8?Q?Vx7B2jWcI3vrV2lG6/8AMW/1JW98pyhs8fy2SCQ2Si93?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e68164fe-e89b-4969-f430-08dda1c78192
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 11:20:40.3124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJU2YwQaGFnpc1SKs4WE8nosNhh7RjnS9tST905fLgn/lhg5Aa36SklCH3NvhyYvsr2W4RHDlT//fpDw91Ittg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7250
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

On Mon Jun 2, 2025 at 8:09 PM JST, Danilo Krummrich wrote:
> On Fri, May 30, 2025 at 05:57:44PM -0400, Lyude Paul wrote:
>> On Wed, 2025-05-21 at 15:45 +0900, Alexandre Courbot wrote:
>> > Reserve a page of system memory so sysmembar can perform a read on it =
if
>> > a system write occurred since the last flush. Do this early as it can =
be
>> > required to e.g. reset the GPU falcons.
>> >=20
>> > Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> > ---
>> >  drivers/gpu/nova-core/gpu.rs  | 45 ++++++++++++++++++++++++++++++++++=
+++++++--
>> >  drivers/gpu/nova-core/regs.rs | 10 ++++++++++
>> >  2 files changed, 53 insertions(+), 2 deletions(-)
>> >=20
>> > diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.=
rs
>> > index 50417f608dc7b445958ae43444a13c7593204fcf..a4e2cf1b529cc25fc168f6=
8f9eaa6f4a7a9748eb 100644
>> > --- a/drivers/gpu/nova-core/gpu.rs
>> > +++ b/drivers/gpu/nova-core/gpu.rs
>> > @@ -2,6 +2,7 @@
>> > =20
>> >  use kernel::{device, devres::Devres, error::code::*, pci, prelude::*}=
;
>> > =20
>> > +use crate::dma::DmaObject;
>> >  use crate::driver::Bar0;
>> >  use crate::firmware::{Firmware, FIRMWARE_VERSION};
>> >  use crate::gfw;
>> > @@ -158,12 +159,32 @@ fn new(bar: &Bar0) -> Result<Spec> {
>> >  }
>> > =20
>> >  /// Structure holding the resources required to operate the GPU.
>> > -#[pin_data]
>> > +#[pin_data(PinnedDrop)]
>> >  pub(crate) struct Gpu {
>> >      spec: Spec,
>> >      /// MMIO mapping of PCI BAR 0
>> >      bar: Devres<Bar0>,
>> >      fw: Firmware,
>> > +    /// System memory page required for flushing all pending GPU-side=
 memory writes done through
>> > +    /// PCIE into system memory.
>> > +    sysmem_flush: DmaObject,
>> > +}
>> > +
>> > +#[pinned_drop]
>> > +impl PinnedDrop for Gpu {
>> > +    fn drop(self: Pin<&mut Self>) {
>> > +        // Unregister the sysmem flush page before we release it.
>> > +        let _ =3D self.bar.try_access_with(|b| {
>> > +            regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
>> > +                .set_adr_39_08(0)
>> > +                .write(b);
>> > +            if self.spec.chipset >=3D Chipset::GA102 {
>> > +                regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::default()
>> > +                    .set_adr_63_40(0)
>> > +                    .write(b);
>> > +            }
>> > +        });
>> > +    }
>
> Sorry that I haven't noticed this before -- I think this should be self
> contained in a new type (e.g. SysmemFlush).

Agreed, a new type sounds like the best way to do and would also address
Lyude's comment. Note however that the destructor will need access to
the Bar, so somehow it will need to be called from the Gpu's own
`PinnedDrop` implementation (or the solution you come with to do it from
`Device::remove`).

