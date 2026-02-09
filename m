Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAPBCOA1imm0IQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 20:30:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE40B1141BF
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 20:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6338B10E477;
	Mon,  9 Feb 2026 19:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kCVs1H6/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012024.outbound.protection.outlook.com [52.101.48.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B354210E471;
 Mon,  9 Feb 2026 19:30:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xpk687j6uu7gYGRn6zWpVvz1ytD7lO+0vtImh2DNNjyJbrw39Ptt+SbQAEXowL7+4kGVmqGDatBjA4HD4UekXdfxDSaOK40tcVu76RUbU8uv6EHYFT9NNh15IzJITJVdGesjUEBwggTQCN7YWnvguAjdaqRmcA5AgihpXxAAhQrnEOdpAX8uyERRLO6a934OHc9AAPYJvE8R/s73X2FTszCeD4kbYbesEZ1pEh3sqjDsYkSHM4FnIcIby9/r59GjrXPX5cvmI6b+SaUhIPjHFHH/dKw/zHR18jOMDkYoY2n5KK9YLQ3ohobTbMpZI02j4w47cvPQ8toTFkuDGiYteA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9WvxH+r0WJBpKZJeuDwO685Df2t92ws83LH91vtD9g=;
 b=YeFQ8ptK0iixJ53ev5zFcn4F1u79ms7XhiheBjBKHQjEdnThxPXRzJqJ70EHy4DUjXMcMYGb3UHveAAROg1tC5vwxuXN52wKU/8s3RKSISPTCbn750SRVfekTJQ0kX3bBSxAoSUgjJ74j0ql76okEb5J7LyEI2WTTUj+vuwAKPmuWeB6hOv/g3lFfklaldNEzkngR1yF9L000eVQMFnPC87YVAVQFx5wMWYcwkRtYcJfsVyayBhfVsx3g9dgy5GYw7etwZskiyQ18/z2f4qtS28tn6TE+gvUPuuE+G6cVvIOBpc9ZAR30IrdkbHKT+bYqQronb7uEtEQ3kdQY5Nalg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9WvxH+r0WJBpKZJeuDwO685Df2t92ws83LH91vtD9g=;
 b=kCVs1H6/jR+P2Y3bj4aovfLC+Uq/XdQRhQs9VwCuTxVENl7zmlgvMLqDGgOToNkGYZpGHvlu7+YWUzeD1oEDX9RcMsQqBxUR3A9eJG1ZVDcROW6psif/msTRPA3pSKphtSnfGHJZ+ihb9yVl4RrX99GQlOzKa5e2oDxg6DuuBzY5enSHJU68jU3yaHLoLPeHrllB0tvntGDaxhoXAO9iUiyqzABy19K1OossrCuTIVCniNfYf/D4u5PlxEcoNjlN+ICgZyEYEReZL5JhMrA4Vsjk4mT3TLCiC23LeoCYcaXBO80I0IBZELDPdHQcHSv8ii3ph1ZEtOnJvMyqkIAOsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 MN6PR12MB8566.namprd12.prod.outlook.com (2603:10b6:208:47c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 19:30:27 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 19:30:26 +0000
Message-ID: <e144b7d0-cb1b-430c-95d1-fe0253e66acb@nvidia.com>
Date: Mon, 9 Feb 2026 14:30:23 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] gpu: Move DRM buddy allocator one level up
To: Dave Airlie <airlied@gmail.com>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Alexey Ivanov <alexeyi@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>,
 joel@joelfernandes.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20260206003451.1914130-1-joelagnelf@nvidia.com>
 <06ff773a-06bf-4d60-bd0a-75a0359ce41c@nvidia.com>
 <CAPM=9tw=jzQxGvVrsUSv14RxQtnaw2rH6K2b3Gxh_UUHnOGTkA@mail.gmail.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <CAPM=9tw=jzQxGvVrsUSv14RxQtnaw2rH6K2b3Gxh_UUHnOGTkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR11CA0019.namprd11.prod.outlook.com
 (2603:10b6:208:23b::24) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|MN6PR12MB8566:EE_
X-MS-Office365-Filtering-Correlation-Id: edffff0b-3fae-4408-3830-08de6811ad67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDYyY0QyODFUMjZuQnVoK0N2UHkydWkzcG1zaFJrQ1BNOWtEVkR2ZzhrM0NO?=
 =?utf-8?B?aWpiMnllSHlkclNiUjBMWmpXRzRBeHZ5UzIxYkhVaWNVblk4ZXJnaU1YUVFx?=
 =?utf-8?B?bGw4YUF3KzQxN0Y4cFg3eTF2Sk4rUjJNRkMxTEVlMWlyY1BtWWRpVW1Ma1hZ?=
 =?utf-8?B?emZ5NExibnFhUEsxSkw1bWh1a20vT1dsMnB3K3ArZUVTOHUxUTkveUl4MjF5?=
 =?utf-8?B?RWdaQWxOYkcwWEZKWnRmNXRrR0w4WmNLRGpkZVVUdm5VQ2RjOS96VXFlMmgr?=
 =?utf-8?B?dk1veVBkcnYxY0RYQXdPNFlaZmFuTG1lWTgvcmRGUjVpNGpSd09XbzZrZ2Ji?=
 =?utf-8?B?VDVWU3UyZWMxVWtMSVFmckVXeENIZGV0M2NQM2pIZEJkTzFqaC90RmJwbXkv?=
 =?utf-8?B?Q0dEWTF1NmE2NXpVT1RoL1hzcHpXakJOdWw4NThxUExxeDNwTkhQRUNhS1Jj?=
 =?utf-8?B?dGxBU0hjenZ0Z2lnQjZGdklUakcraFRvcURtYi9pMkZQQzg4Y0F6Ri8vc0xG?=
 =?utf-8?B?YkhkbE1aUy8vd2ZZZ1EyelowcjdGeUR0Vm94T2c0RFFLei95bDlIcmpHU0dx?=
 =?utf-8?B?bTM4OFRSYUgycE1ZS3c1ditORWtuTGxBSVVXZ1htWUtteVBrVHExa1dpMXZD?=
 =?utf-8?B?Y0pCVmYzUHZneWVTd1E3V0RITDd5ZXVubUVZR3RHTVdoSTc5NmJBbkVUVTF5?=
 =?utf-8?B?Mmc5aTFHYWVBakhLM3Y2VkcrOXBiNDNCYmwvV2hJTzJIa3ZFTUtqajJ3WDBs?=
 =?utf-8?B?WHFBOHhBYUtWaVpPOThIcXFmWU1YcjVnSjByVHA2SmJENVh4UFdVM1lhR0dj?=
 =?utf-8?B?N2wvR0xzTWI1QWNzRkY0S00vek5yMFZTNlN5YXlTRk56RTJKK0dtZTEwcVNh?=
 =?utf-8?B?TDVYV1Q5ejJQY1BUU01weEE3d2VnSDFBMktCSmJ3NU8yTWlDeW9FMHlWdy9a?=
 =?utf-8?B?MGtjclNFTGJ6VUs0UDdyVEdmRkg0TXVCUGNPOU52aUU1NTFrZ2lKNG9iRDlE?=
 =?utf-8?B?RE1uWXNwL0dkbTRaV1ZzTVh6VzBScm12ckduQjU0cUhaUXlENS8waXBleVhh?=
 =?utf-8?B?QlhJTzMreE5XUDRZOGxnakFjRzFHNTFxc3NxYko4UVFYd29Gd3ZuWGRmVEZy?=
 =?utf-8?B?czhOMFhlVEN2T1k0SFhKYlVLUVlmVys1TnErWHZDZy9qSEM4VkFGZk9DRDVE?=
 =?utf-8?B?dmxvcHRVOUphbmZwUklmbzhpRG5JYzF0L0o3Nmc5U1FTVHdTZDNjMjJWVlAv?=
 =?utf-8?B?QnJXM3pnMVB1aXNDdk1nZXZxRXFwVHJkTW1oVnRYbGtPMU9MZ2F1VFhnajFT?=
 =?utf-8?B?c2ZRMlVGLy9LRTR6SVRyTENDNTNaWVczbW5iQStmZERHZXc5KytJekdJTUk1?=
 =?utf-8?B?WHo3NEFUSWFybFBxck5aZkRuRytWS095RjBuaFJPcUpmMVNXVCtmT0Y2QThw?=
 =?utf-8?B?NHBzMTJlOG9zb3ppVFJ4Y1NIZlEyTjhZRFRUSHgyMFBOaWJtZjRqOFprTUJO?=
 =?utf-8?B?alcxZTlYR09acnVYVzFtMGFSMlVKLzJSbnQ3UFRhdEltYlJPVlRtZ0paVVl2?=
 =?utf-8?B?Y2lxcTl2YXlPZFJSODFDM3pSbkFqRWpaaDNvblRiQVR2bUZpQmVIWklZVyt0?=
 =?utf-8?B?cFlNRTQzM0NiU21tQ2RtS2Rwcmg4UmF2aXVmQ3RWVllua1FTY3VIZjl6UnJ1?=
 =?utf-8?B?aGsyUkxsUE1ycTNFRFBmQzBXOTgxMG9TaWJweDNheTE5cjYreDl5cVlqajRs?=
 =?utf-8?B?bzVoNTVTVm4yM3UxYWZwRnZXSENtTHBNakNtRXMzdHJlaFNFc1VRamIwNkhK?=
 =?utf-8?B?cjh2eFNjcVFxdHVKdXR2MElPeDVURG9QRmFZK1lyRnJPT21DaSsvUnEyaElr?=
 =?utf-8?B?MTF5cW1sR0tmNzEydEVXN3hiWVhoVW55N212N2RGSzhsa0FuWE5lZUUzNEk0?=
 =?utf-8?B?RncrL0VlZUtZdFByT2RrZlBlQ1lGNEZvZXJhcXJob1ZlR3haYmtveGpxc3RF?=
 =?utf-8?B?U1RRMzd5TWRBeVlvdW5xVk9NeEhoT3dVZU5CN3NpYW9lblJjY0xuQndlbVgz?=
 =?utf-8?B?RS9TMFBnMUpWdTZsM0ViSHFxVmYzVk53S0JKMzFWOFozeS9kOHRzRGs0TlE5?=
 =?utf-8?Q?ogAU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVVKa3lLWlU2MUVWVlBRWHpwUjl0Z1RtT0hSeDAxbG9qOXFNaDdudmdGTmVw?=
 =?utf-8?B?cTdLTkJCSlVKbHJSVzFjSGx0V0dVUGF5eDRvRDJKU1Z3M1NMWEpOMmFrUzdj?=
 =?utf-8?B?RkhCS1d6U2hMMDlyMUwzQ0p5Mkk5WGI2SzhHaXIrODQ5c3JqM1ZzQjBHdi9C?=
 =?utf-8?B?MnFxWndlbkY1SzI4dEt3bFBTZGJMbWswRlpzem5mWWo4M3hqaUVTdGxnM1gy?=
 =?utf-8?B?enBXQ1EvQjIzVWl6RStKc085VGpDNlNHNEVFQ0R1WlFTNG1TTzFvVFZEOStw?=
 =?utf-8?B?VGxNblJCNHVrL1B4aytzZEpYZDRCajdacU95VUxZVmdTaHBnV0I5S1NHSTZ1?=
 =?utf-8?B?dTFQSWVRdHF5UkNGY2piblU2ZklJZ2ZyMmVkUzh6ZUxNejBEbXFKNWpSdENB?=
 =?utf-8?B?d2t0ai9oam1tYzN0MlpEMENDdlVVY3BZc1gvY2V1a1F2RVEzRTZvWHgyVGNz?=
 =?utf-8?B?MjZoWHNuaE9uZzBqNGR2WVBTK0pxZEh4Vld5akVmdjlpRC8rcXkvZmFUaWo5?=
 =?utf-8?B?S244OFNhZGg4c09UQnVmVnlsbkVjbVk1cStsbEZFUFJZOFlQak1VbE9wRDRo?=
 =?utf-8?B?ekd4MExRU1pRNFBBYUxoWFFhaEQzQ1RMRndnd21xeEtFV0gzOTFZR2ZFZ1ow?=
 =?utf-8?B?Ny9MYUVLK3JFNHhMaUl4UDUrVTJMMkQ5VCsrbk0yMHI2ZFB4djlnVjNtTkY1?=
 =?utf-8?B?b0xjMS84RFMxbWhmSmVqMFF2NURGaXEreExMc3pjWTd2VzJFMDhKQ0dGZ2Rp?=
 =?utf-8?B?U1VudFFUNDUvTFlSa0dyMEE2ZXE5Z2NSTkl0eks5czJ3ck55dmpUU2hnNVc2?=
 =?utf-8?B?SGtzZVVnUjhLZzVJQzhhMXVwc2YxdVdZVVdVWUFjNmVBTDJUNHdVMEpIakhl?=
 =?utf-8?B?bnRFUlVXUjNvcUpGVkVBNHQxdlkvTGVHMi9FRGk3OWRkMSs1cGkxYlh4ak9W?=
 =?utf-8?B?Z2F1UjdkVmJJOUNpZ1NIOEsydDVqeGZha2puVG5URldFaFY2a2g0d0cveXZa?=
 =?utf-8?B?R0prcGJEWnR5emRhR1JrMzdMK2RVSXBFVzFnOC9nYXJMOHh0SFZqWjFKSFpq?=
 =?utf-8?B?bzJYd2kreDM3SWN5cmpNbTJKaEhYTHdmRXlXSXlDZ3gwd240VER3dENwMjhy?=
 =?utf-8?B?OTB4U2JlRjcrMEVNMVBsY2NSZ1lzRHNOTkNOVW5EcTh5SkhMWGljV2ZQaUZR?=
 =?utf-8?B?a2dKL1RLQ1MydFFRWTJSUGlLUnc2anMzalRtbnI5THRKakNleFgvbElaM016?=
 =?utf-8?B?c0dNeC9XV0ZCaFJRSDZTc3o1TnY4L0w2aTFTNjFZcHhtY2RlRm9tMzBvRExS?=
 =?utf-8?B?cyttNnc4NjNGR3REazY2OW9XZkNWeEFsY3M4RHVwL3FrMWFBUjU4U0Q2YlB0?=
 =?utf-8?B?QWp3UWUvVnpBcW05aFhmR1dwZGw4NjB6ZVhFbkxyTG5hNWpSMDZUQ1F2T2U0?=
 =?utf-8?B?YUd0eUkzSVlncGxMbEo5UHVEM2xmVHBNT09uK1ZyRzMxU1hnblVudUF6Z29U?=
 =?utf-8?B?SlIvVmg1Zmt2U2RNbkNZamw1YXBNTm1HcnNhcnljUmpWMWt6d3kxWlhlYWo1?=
 =?utf-8?B?aFE0WWVWK2NKdTFkWW9yTU5nYVMzMTdSVE1OV2I1QUk4MHV2Vjg0WXJqcytp?=
 =?utf-8?B?VHk4WkkvNjZWWDVKU1ZNSkFpNXRFY2tJdUdzSWd2djFoS0E0UXU2OUpnZllQ?=
 =?utf-8?B?VkRlaUh1RFNKTjdFVDFhTHRhZHAxclhlalRDOEc1bm5hbER5a2dnOHJzNUVE?=
 =?utf-8?B?bHR0aTliaDBzNzhuTTBRL1NueEh3eStaOWh0UlhLT0ZtL0lQL0NVVmFtUWly?=
 =?utf-8?B?QmxCelAyRnBycmlrRTdQSnBMdXdLVnBySmZ4bkM1Z1B4TzE4VER5OUxCaDJa?=
 =?utf-8?B?WmFXTjVKNURWWWx3YTRETDlVVVJoQStlRVpsd1pUU0VrVjNiUk14WUpYRS9P?=
 =?utf-8?B?N2VkQzF3blRSNzBkKzhyYnAwVU9TVnM1VXdvRkdkckJDb25ITXdXYzVEMDJ1?=
 =?utf-8?B?SG5GYlNWWHEzdGdsUWRZRkJXWmRjbW9wR3c3OUEvMWRseG1IdDV0K0hwYzVj?=
 =?utf-8?B?M3RzSEM5UTlrajNPa2dLendWWXJhb3lyK2hvelZGSEphM2l1ZzcvOFMzbWpm?=
 =?utf-8?B?VUFkWC91RVVaYkVuak80K25YNzhrTlB2cU15Tk14OFZVNTRNTzh2VUM3RHpF?=
 =?utf-8?B?WWRhL25QN3dvN0xKS1Z2LzZENzQ2WWgzMytmaGkzZ3ljd1ZWazJ4WXVhYnFV?=
 =?utf-8?B?QUdESmllbmUyczBrYkVUM3VDZ1JZdXFhdkVxZXNQaXR3UFhvaU9YbjNaSC9n?=
 =?utf-8?B?R3FwV3NlamJkYm5jYWh3cmc4a01wblFNVDBPT3N6dEdOUDBCQ3FyQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edffff0b-3fae-4408-3830-08de6811ad67
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 19:30:26.7824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cgcvlfm9N2C7mUi+I1pVQltPGrbsDi7FzfOLx/zR9u35T6ZKefelsD24pryvDp8T+TO5fdtGQcvkO67LkUclHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8566
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: AE40B1141BF
X-Rspamd-Action: no action



On 2/5/2026 8:48 PM, Dave Airlie wrote:
> On Fri, 6 Feb 2026 at 11:06, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>
>>
>>
>> On 2/5/2026 7:34 PM, Joel Fernandes wrote:
>>> Move the DRM buddy allocator one level up so that it can be used by GPU
>>> drivers (example, nova-core) that have usecases other than DRM (such as
>>> VFIO vGPU support). Modify the API, structures and Kconfigs to use
>>> "gpu_buddy" terminology. Adapt the drivers and tests to use the new API.
>>>
>>> The commit cannot be split due to bisectability, however no functional
>>> change is intended. Verified by running K-UNIT tests and build tested
>>> various configurations.
>>>
>>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>>
>> I forgot to add Dave Airlie's review tag here from his other email. When you
>> apply, could you add it?
>>
>> Or, let me know if I should resend it. Thanks.
>>
> 
> This one was a bit messy, so I've taken this into drm-misc-next now,
> it doesn't quite end up in the same places as yours, but it looks the
> same, and I updated MAINTAINERS at the end.
> 
> Now you can just care about the rust side of it.

Nit: I think you used spaces instead of tabs in drivers/gpu/Kconfig? Suggest
changing to tabs to keep it consistent.

Otherwise it LGTM, thanks for adapting it to the tree!

-- 
Joel Fernandes

