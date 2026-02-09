Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDJXMHI4imkeIgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 20:41:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE531142F6
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 20:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA19610E371;
	Mon,  9 Feb 2026 19:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="W4dK3Lr+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010047.outbound.protection.outlook.com [52.101.85.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F400D10E371;
 Mon,  9 Feb 2026 19:41:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocCUbL1T+GtgJD1oFEMzNA6BEoDBlXqOIxT7FD7OKoPbd3CiNQeegWslBgQWrfAwt3+p5bkfCbRZQrb8ENTkHkoiLmb5L6GUNApHbVCiBLbc+7F9HMFCQCjUSybOHzwPO7XlwAkV5WvI1WbWMzju664RAXQrcW18QFTciEyzZOr6WSHVxAPGSfEBk2HBk2YtJ+PhJRgTJnZu6MUUf2+vd7uDkQ3S9oEKDnf/mUQrStUSopz4zLqP3vYVkBQD53/UCDvDXzCSTdzYTyfoQZ8BVOBUjjTT7354XuaxzqZ+sN+e9dzk4N51UzMzj+jjIhHBCrQ0VTs0ZbBVWeOxhRy4rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmCbmbZaUMg6dEt3/6LpYv/TocF0j85eJxxEHlHzJ2U=;
 b=BciCHqqIe7+B/KWZN86552oFLALvesHi6MlIPC3irGms52kwAK+2hEf47GTh4ehsJxiIK9qIqcEuczH7jEj2oQHCSbt5LhX1ecMftU9iCWVFMoePlLJNY6v5MFSakLPpw0PAxC4gzHhhw3NUaGFgzXCCkg/iRG9Rb4ritleuiGhAa/zPSf2YMnePrCuTpuSW+wdRDGYsg5/Bp+rRoyxOjKGM+pOL6IbeweF4UMbu6TPxy6ojWiJMy16TtL99zW5iSA5n6/m0Zv+8npjtBeTgNezoy029uvlO6ul9r0iEYvTgxi5SL4giDCa/Uah1FkwJR2m3tedVMGhdD1qXqIGN1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmCbmbZaUMg6dEt3/6LpYv/TocF0j85eJxxEHlHzJ2U=;
 b=W4dK3Lr+oZp/N3n9xKssUBSwPiLvncPxr0fi4shqfpcGFIzCfvCv4YWPMgAp4+6ZmW5ldZ+wE/DhhUHyRnEs8CUC8PHPh6jnCY1V6jO373qS9zG+CO73RhhIliih/rtEmpJH+GaboQO2YOSJbk9x/j0JAgCwilqTNbBTcjhR8+S2u1gIwlvy0ogwDwQIXe0XzY3hNMGB3cPJ9An4oWt5Zg8zSH40OcYN1oA6XXy76UV092CCCalwBIZaAxuRczLfIgZCZmui/QjCiVdgcoaltzvmM/Lwr6WhIDqeu7+2R1qID0AFJ39mqCj6bhD+D/Q8epnpyRAombqLX19FqGBERQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Mon, 9 Feb
 2026 19:41:26 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 19:41:26 +0000
Message-ID: <859dbf29-dafe-4c04-a0ea-d88c26fd4995@nvidia.com>
Date: Mon, 9 Feb 2026 14:41:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 1/2] rust: clist: Add support to interface with C
 linked lists
To: Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
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
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>,
 joel@joelfernandes.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20260206004110.1914814-1-joelagnelf@nvidia.com>
 <20260206004110.1914814-2-joelagnelf@nvidia.com>
 <DG7ZF1UT98RQ.3F42J3ULGV2OC@garyguo.net>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DG7ZF1UT98RQ.3F42J3ULGV2OC@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:208:52d::13) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|IA1PR12MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aee98ba-91ae-4020-ab79-08de68133695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmRJR1F1UWwzTWNJYTBXSHVsZEtxZWZyWjlDVWdhV0VmTC8ySWhVTk44K1hp?=
 =?utf-8?B?TGxRTlZ3bkp4WDBWSFBxdjd0VExOaUthNHBjQm9OeDNBTzlVaWtvZnRMa0tv?=
 =?utf-8?B?c2dxdWRjb2gwM3l6RlU1TU9YS00xQm80WDRYOGd3emhLYWUxU3lBSVIrOG1E?=
 =?utf-8?B?TThvWExTYzYxc0Qrck44d0NIUlc3MElBVTJSdWJtSmtjUGwzd203cGgramJt?=
 =?utf-8?B?NzkwSHMzV0RpOXRFTllMOU93VjhaNDJhUXNkcmdGTUNwUEhETWpjeTY3TXRZ?=
 =?utf-8?B?MHlGa2dSNmdZTWxTTjFXRXdMYlJzckg2b3ZCQ3dLZWVCR2dCVFpicVo2eGhq?=
 =?utf-8?B?LzZoZU5YN1h2MWNxdnY2SjQ3S0hKSndzN2cyeHZ5YktPRVJ6cmxzN0R3TGV1?=
 =?utf-8?B?QmNUMno5OEFHWmhKdmpENlNmZWpHdktnT2Z6dVAwUFgvci81VUxqclQxNGpT?=
 =?utf-8?B?dVdmS1JLWkRkdnYrdkRaQURCYVJoUEpRbkpxUEFYMGR5ZXg5WUl3RUNxVVpV?=
 =?utf-8?B?N05UeHRzWDQ4OW9DTVl0SEFCMUVPZ1AvN21SU2J0czZTV2FjSU05NFFIUFVQ?=
 =?utf-8?B?YmV4RUhRaGFST2J5M3RLOXFRekpqNDF3WTBHZDVtdk1WZVowUEZRQTRGMHNy?=
 =?utf-8?B?K2xnd2FsRGYvNnVORGFidzk0d2Z4OFVmVnZFUUR5ajg4V01BSFdkdnk0NEV2?=
 =?utf-8?B?ZGY3SCtHbmp4STY1Q0h1eGgwMlBBMlNOaFNkZHlXbDVZWVAzSmcrMVNTNzhP?=
 =?utf-8?B?SFdLZTRXSk4zVTR1V0NJcG4rNWQ0RTN4ckNMeWdtUGdSRjYvcFBDSFIxbU5p?=
 =?utf-8?B?YnNlN1h2ZmpOME9sS1dkcWpQbGQzUWJBSlBUeDdjTmlNdDRzQThhMUZMVTdj?=
 =?utf-8?B?am41c1p3TDdkeVdPYXpCS1JKWDhadVFCWXBzY2lmRHdrdjdNdEkyOEVJdkp5?=
 =?utf-8?B?UHI0Uk8vbG96TlUxaGlEdVBPeUpPUUpiU3hxbERWMHczZGkxQlNaVUJDRHVk?=
 =?utf-8?B?dUwrTDhPN1Rib2lBRmdTaXZsOURBbDJab3V4QUMreUprektDSnBaUVZHMGo2?=
 =?utf-8?B?aVJWNzBTeFFmakt2cU0xYmh5VmVpYWhaZTZxN0JESGpGYXc4L2NGQittSzAy?=
 =?utf-8?B?R2ZkSldpUEdEUlVxS1hxM1JqWThNL0UrR0VCOTFhQ2J5RnY4cElwd3FRYTNY?=
 =?utf-8?B?TTVIRnRLeVVVUTVNN1hFNDF1YzU4TEdhZGZWR3hxNUJhMThYUllKMVF5bjJ6?=
 =?utf-8?B?NWxTL2puTXdydGdveUJtd2dFbFVDOXprZk1HcVZURSt4L0V4b0VxUE5zc3JK?=
 =?utf-8?B?bnpaRHVIU1I2eHhsaVFHaU1iZHVlSCs1RERpRzRJcE10YlVoL1p4MzRVRm05?=
 =?utf-8?B?OENpMW1xOEhSYlpYNUFzait1UldleEtWa3ZMTkM5S1FIcE5TcWJZZ0o0Y21p?=
 =?utf-8?B?R0hJZXlvellFSnVYSWRhb3lFQWVzbzhIK3QxRHVSRzNjQlNiZlUxUGR5aUxB?=
 =?utf-8?B?REtEdW03Y0hiMG8rN09yRXRJUmVMUHIyYStnckNNSUtCbjZnUGplbnJwZnhY?=
 =?utf-8?B?SWtMRGFOeEZad1pPMi9VWldQcDhXdVhYN0VETnc2bURFL1VTa0pwdVBtb0xS?=
 =?utf-8?B?cHdEOWdzWWU4MExaVVFXenlwdXU0MTVKeGZ1OHlzTW51SWFVdktPMkRlY3Er?=
 =?utf-8?B?bUYwZVRUUVRkK2pKU0wvOVhVRmtJSW5QeVMvWmFVdGhvTUdyNzZyTklHc1Fv?=
 =?utf-8?B?MUtqbWUzYzNiek13TllHVEtrSitEVUNET3N0aElqMlZJYXRhSHdEemwydzFn?=
 =?utf-8?B?WmRCeHRLVmkyVU1uQlNzOHZYeGlncXRyTDFxZ25HUjNxOWJIL2dJVDNzTzAv?=
 =?utf-8?B?Rmp4SU9Ja2haclpGenlpUHczU0toSUVRYTVvaUhpemdWYlFyaStsYzd0SEcz?=
 =?utf-8?B?SGpDQWhhcCtHZGxCWW9aak0rblcrUGdBZkdQdWwzM21EcThYaUNCVmN5dGR0?=
 =?utf-8?B?bmhqeFhDNiticDZHVHBaSXlya2IxbFNIVGZTTk5NZHBlNzV0YXRVL01VM2hX?=
 =?utf-8?B?VGRkWU1jb1FGUitvK1JwcWtCVnd6L2Q3dGRORk1xTU14MkQ1VjNIaGtPY0px?=
 =?utf-8?Q?RTfc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUJkaUg4TVpmVmFrbFJsYWRlTzdIaHlCOWo0Ty9HbXJIRTMrWWRkZTVpdVVv?=
 =?utf-8?B?QjZScWRaV05iczFyYWVPVGFPVmJYb0VyNUIwUi9PR3RrOWlaaUxwZ1FTd0wy?=
 =?utf-8?B?OWFTYkxIVEVUK3pQTGhlV1loRnhJalgyUHlFeGZCUHRrbEdJT3hORTQrZkd0?=
 =?utf-8?B?MkF6alg4YXRkS0ozdVIwVmlpcjVsUzdKeDc1cG1hdHY5RVcwUWVTajFDR2hF?=
 =?utf-8?B?am1YOERMVWpSVFBuVXh5bm1KbFRlNUl6TkZ0UGZ4NXZFeEdZZkN3OHdqRU9o?=
 =?utf-8?B?eWxRTTFIeGpTRWNYVTN2MVBadVc2eFBobE1ua3krNTNEdGlpU25PV3dRTnp3?=
 =?utf-8?B?d3RGMEVEUGErWmdaRkp2bTQ5UDBhNEl3Lzl0TS84blpjazhFcWx6Z0wrVXVt?=
 =?utf-8?B?OHR3bVZMVkdCWXdnSXJoYVNHWWV1RmdNblFicW5Ld1hwcWc3SXpobWRob1BN?=
 =?utf-8?B?NE93MkpFN0NqbVZwbEJ2QlBtRmtGS016SG9Dd3c3Skd0eU5TRzY1a2l6YUJC?=
 =?utf-8?B?TElwanR1SnNjYjlQamlzTTBPbHJDSHBBNDBhaGhjLzB1dUVwNkRoQlc2UERa?=
 =?utf-8?B?Tmp3bUw5T2sxTUR4c1Uyb0htbVBLSXdSaDA0RXA5M0gxMTVxOU82b2RrMHF0?=
 =?utf-8?B?ZDY3aUdvSkZmWkNtK1YraVhseGphVGYvVXBxQlRNRm0weExwY05VU2p0Vmx0?=
 =?utf-8?B?dHBSVGJvVllqaXdhcnovSXViNW41M3FseVNiWmFCcXIzUU05bEVrQmZEVkdi?=
 =?utf-8?B?ZXNPL3dOb0g2N0FZWEFkWGtkSmhzY3hHWmZPeXJ4ZG9KOGwvaDYrMUxGNmgy?=
 =?utf-8?B?c1RSakNURWZLd2JSa3FKWjIrNzZsWVExeUtmdlFWWUg4NTloNWNEY1lWS1Vl?=
 =?utf-8?B?dlRYK29lUVkrTnhMVERvZEh5eXRPbjVxVmovM3BZTnE5cElGTy9RWGV0TERM?=
 =?utf-8?B?Wjdxd3FPT0RlL0FHaTFxZ3Byd2JDMVU3ZVhkZXNZdjhqeFRYc090UmF2ME1p?=
 =?utf-8?B?RndrUjJkS29NVFBCSkt2UWhkSlNBUXZDVjJNQThPUStRelFVSzZlV1pGZE90?=
 =?utf-8?B?aVNlYkdxekE5UWl0cHhVZUNIOE5aTkJTRE1JN01oWFZ5NlRCS0xwWmNVRlIv?=
 =?utf-8?B?VERhNUNLN3FqcWdUcU1NNjlZNlB2WGc0aXFzS1ZUamQ3elg2OHBhbUZBMXJE?=
 =?utf-8?B?b3VlTVNvRDlOM1QwTkE5ek1Nc0x0OWhhd2hXYTU3QWZPNXFQRkIxOVh3K2Q1?=
 =?utf-8?B?SzJnN3Y0WkIvVllwdXIzM2hnWU5QdnYxL1U0VFZCeWtXaDBYakFUUHFoeVhx?=
 =?utf-8?B?Q3hpbGkzWVdPbnNHOG9sb3BmdHZVZ1hoMnVETHZWK0l4RW9wRG5UcUtEbHYx?=
 =?utf-8?B?QUhIcFpMVk1zNGZ6VWZtQlozN0xhQUxDdEZuOUVFSVRwSlhOZTJKUWVuWWZt?=
 =?utf-8?B?cEpRTHZHSDBKaGhNTExvaEpSeEFHVldFUVdiMWlhWEp2ZFVVaDJPT21oOXlN?=
 =?utf-8?B?ZXE3RjBUaWFoQUs4QXlpb296YzlIQUNkMTR6NCt5MHE5WTVOSERjS2ZLa3Vq?=
 =?utf-8?B?b25yM253UjE1VmFyU2NpMDNuK3JCYVoyUDFFT0hrOFBva2FBSkpvaFNCTVVj?=
 =?utf-8?B?aG1ycnlNakJuNkVZT0lNZ1RTNVlTeThKN0pmOGh2OUIxZllkM0x5RmJoRVA2?=
 =?utf-8?B?ZzRyOFZJYUpZcC9LamRzdnVUTXF4b29DWkVWVUdQQ0wwa0FNbWlrNzE3eXU0?=
 =?utf-8?B?NU05OUhlVk1Ia0pmTjRsWEo2b3U0U3FNUU9ubEhlZCt3QU05aUFwa2hqalMx?=
 =?utf-8?B?OGxUM0YvUXNKSURvUGQ1U2xORFk3U0U0YUhuZ2JtOXhBaFpMdlNQK3hOcHBV?=
 =?utf-8?B?aERzVWNQNkNLQUhxYU9qek1EY0tvMjFSdDRNSkNRdnR4VXY1Z3dOcWFtdUl4?=
 =?utf-8?B?KzlzOThSSnRwOHBkNzVTR0d3dW8rajRQMjErcGdMNGZkV2hKc0pIZFdWZTJ5?=
 =?utf-8?B?WTlKQWJGOXdmSGFPcnNEUXJ4U1dxZFp2V3NPSlVvamcyUFpnS3ltZGwvMmFv?=
 =?utf-8?B?WWhoSUFlWk9lYm5SWDQ4YVFmYW9pajRwWWYzWWJYZ1lpY1ZXbmJna0Y2YnVi?=
 =?utf-8?B?SXI1Umg3Y2J3L0JNWmJDdDJTTW9LTkgxK0F0bGtHdktiMWIrVGVHa1hPQkI4?=
 =?utf-8?B?bXlGMHdiR3QxWnpNUHd2VzRrbWpYUXBaN1FubkVtWHRyWG1PMDhNc3Y4R3Mw?=
 =?utf-8?B?RjlSSURyaFA5RnlOSHFEU2tDVUMvd3FPakZBeG1kY2V1QnBIWjZIVGc0NjZ0?=
 =?utf-8?B?NFYxczRiY2xsUWtHUGlhdlJjd2ZUR0VQRWdoa0lkZGJvQVlkL1ozdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aee98ba-91ae-4020-ab79-08de68133695
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 19:41:26.5131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oechHnPuJAHGpzlqApaP179VUFqW+OpgrVYsLYPQTkUJfbg1KllZzGoYrV/WGNq0uaXRPheny6rxybS4nToBkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6329
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,garyguo.net:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,auristor.com:email]
X-Rspamd-Queue-Id: 1BE531142F6
X-Rspamd-Action: no action



On 2/6/2026 10:25 AM, Gary Guo wrote:
> On Fri Feb 6, 2026 at 12:41 AM GMT, Joel Fernandes wrote:
>> Add a new module `clist` for working with C's doubly circular linked
>> lists. Provide low-level iteration over list nodes.
>>
>> Typed iteration over actual items is provided with a `clist_create`
>> macro to assist in creation of the `CList` type.
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>>  MAINTAINERS            |   7 +
>>  drivers/gpu/Kconfig    |   7 +
>>  rust/helpers/helpers.c |   1 +
>>  rust/helpers/list.c    |  21 +++
>>  rust/kernel/clist.rs   | 315 +++++++++++++++++++++++++++++++++++++++++
>>  rust/kernel/lib.rs     |   2 +
>>  6 files changed, 353 insertions(+)
>>  create mode 100644 rust/helpers/list.c
>>  create mode 100644 rust/kernel/clist.rs
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 900fc00b73e6..310bb479260c 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -23204,6 +23204,13 @@ S:	Maintained
>>  T:	git https://github.com/Rust-for-Linux/linux.git rust-analyzer-next
>>  F:	scripts/generate_rust_analyzer.py
>>  
>> +RUST TO C LIST INTERFACES
>> +M:	Joel Fernandes <joelagnelf@nvidia.com>
>> +M:	Alexandre Courbot <acourbot@nvidia.com>
>> +L:	rust-for-linux@vger.kernel.org
>> +S:	Maintained
>> +F:	rust/kernel/clist.rs
> 
> I still think we should try to work on a more powerful list infra that works for
> both C and Rust, but I reckon that is a longer term effort, and shouldn't
> prevent a simpler version from getting in and be used by abstractions that need
> it. So
> 
> Acked-by: Gary Guo <gary@garyguo.net>

Thanks! I also replied below.

> 
> Some nits below:
> 
>> +
>>  RXRPC SOCKETS (AF_RXRPC)
>>  M:	David Howells <dhowells@redhat.com>
>>  M:	Marc Dionne <marc.dionne@auristor.com>
>> diff --git a/drivers/gpu/Kconfig b/drivers/gpu/Kconfig
>> index 22dd29cd50b5..2c3dec070645 100644
>> --- a/drivers/gpu/Kconfig
>> +++ b/drivers/gpu/Kconfig
>> @@ -1,7 +1,14 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  
>> +config RUST_CLIST
>> +	bool
>> +	depends on RUST
>> +	help
>> +	  Rust abstraction for interfacing with C linked lists.
> 
> I am not sure if we need extra config entry. This is fully generic so shouldn't
> generate any code unless there is an user.

Yes, I am dropping it now. As per the other discussions, I will change the
module level and all the items in the module to pub. And then we will not need
this config.

> 
>> +
>>  config GPU_BUDDY
>>  	bool
>> +	select RUST_CLIST if RUST
>>  	help
>>  	  A page based buddy allocator for GPU memory.
>>  
>> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
>> index a3c42e51f00a..724fcb8240ac 100644
>> --- a/rust/helpers/helpers.c
>> +++ b/rust/helpers/helpers.c
>> @@ -35,6 +35,7 @@
>>  #include "io.c"
>>  #include "jump_label.c"
>>  #include "kunit.c"
>> +#include "list.c"
>>  #include "maple_tree.c"
>>  #include "mm.c"
>>  #include "mutex.c"
>> diff --git a/rust/helpers/list.c b/rust/helpers/list.c
>> new file mode 100644
>> index 000000000000..3390b154fa36
>> --- /dev/null
>> +++ b/rust/helpers/list.c
>> @@ -0,0 +1,21 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/*
>> + * Helpers for C Circular doubly linked list implementation.
>> + */
>> +
>> +#include <linux/list.h>
>> +
>> +#ifndef __rust_helper
>> +#define __rust_helper
>> +#endif
> 
> This shouldn't be needed.

I had to add this because a patch was missing in the DRM tree it depended on. I
believe I should not need it anymore, so I will drop it. Thank you for pointing
that out.
>> +
>> +__rust_helper void rust_helper_INIT_LIST_HEAD(struct list_head *list)
>> +{
>> +	INIT_LIST_HEAD(list);
>> +}
>> +
>> +__rust_helper void rust_helper_list_add_tail(struct list_head *new, struct list_head *head)
>> +{
>> +	list_add_tail(new, head);
>> +}
>> diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
>> new file mode 100644
>> index 000000000000..1f6d4db13c1d
>> --- /dev/null
>> +++ b/rust/kernel/clist.rs
>> @@ -0,0 +1,315 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! A C doubly circular intrusive linked list interface for rust code.
>> +//!
>> +//! # Examples
>> +//!
>> +//! ```
>> +//! use kernel::{
>> +//!     bindings,
>> +//!     clist_create,
>> +//!     types::Opaque, //
>> +//! };
>> +//! # // Create test list with values (0, 10, 20) - normally done by C code but it is
>> +//! # // emulated here for doctests using the C bindings.
>> +//! # use core::mem::MaybeUninit;
>> +//! #
>> +//! # /// C struct with embedded `list_head` (typically will be allocated by C code).
>> +//! # #[repr(C)]
>> +//! # pub(crate) struct SampleItemC {
>> +//! #     pub value: i32,
>> +//! #     pub link: bindings::list_head,
>> +//! # }
>> +//! #
>> +//! # let mut head = MaybeUninit::<bindings::list_head>::uninit();
>> +//! #
>> +//! # let head = head.as_mut_ptr();
>> +//! # // SAFETY: head and all the items are test objects allocated in this scope.
>> +//! # unsafe { bindings::INIT_LIST_HEAD(head) };
>> +//! #
>> +//! # let mut items = [
>> +//! #     MaybeUninit::<SampleItemC>::uninit(),
>> +//! #     MaybeUninit::<SampleItemC>::uninit(),
>> +//! #     MaybeUninit::<SampleItemC>::uninit(),
>> +//! # ];
>> +//! #
>> +//! # for (i, item) in items.iter_mut().enumerate() {
>> +//! #     let ptr = item.as_mut_ptr();
>> +//! #     // SAFETY: pointers are to allocated test objects with a list_head field.
>> +//! #     unsafe {
>> +//! #         (*ptr).value = i as i32 * 10;
>> +//! #         // addr_of_mut!() computes address of link directly as link is uninitialized.
>> +//! #         bindings::INIT_LIST_HEAD(core::ptr::addr_of_mut!((*ptr).link));
>> +//! #         bindings::list_add_tail(&mut (*ptr).link, head);
>> +//! #     }
>> +//! # }
>> +//!
>> +//! // Rust wrapper for the C struct.
>> +//! // The list item struct in this example is defined in C code as:
>> +//! //   struct SampleItemC {
>> +//! //       int value;
>> +//! //       struct list_head link;
>> +//! //   };
>> +//! //
>> +//! #[repr(transparent)]
>> +//! pub(crate) struct Item(Opaque<SampleItemC>);
>> +//!
>> +//! impl Item {
>> +//!     pub(crate) fn value(&self) -> i32 {
>> +//!         // SAFETY: [`Item`] has same layout as [`SampleItemC`].
>> +//!         unsafe { (*self.0.get()).value }
>> +//!     }
>> +//! }
>> +//!
>> +//! // Create typed [`CList`] from sentinel head.
>> +//! // SAFETY: head is valid, items are [`SampleItemC`] with embedded `link` field.
>> +//! let list = unsafe { clist_create!(head, Item, SampleItemC, link) };
>> +//!
>> +//! // Iterate directly over typed items.
>> +//! let mut found_0 = false;
>> +//! let mut found_10 = false;
>> +//! let mut found_20 = false;
>> +//!
>> +//! for item in list.iter() {
>> +//!     let val = item.value();
>> +//!     if val == 0 { found_0 = true; }
>> +//!     if val == 10 { found_10 = true; }
>> +//!     if val == 20 { found_20 = true; }
>> +//! }
>> +//!
>> +//! assert!(found_0 && found_10 && found_20);
>> +//! ```
>> +
>> +use core::{
>> +    iter::FusedIterator,
>> +    marker::PhantomData, //
>> +};
>> +
>> +use crate::{
>> +    bindings,
>> +    types::Opaque, //
>> +};
>> +
>> +use pin_init::PinInit;
>> +
>> +/// Wraps a `list_head` object for use in intrusive linked lists.
>> +///
>> +/// # Invariants
>> +///
>> +/// - [`CListHead`] represents an allocated and valid `list_head` structure.
>> +/// - Once a [`CListHead`] is created in Rust, it will not be modified by non-Rust code.
>> +/// - All `list_head` for individual items are not modified for the lifetime of [`CListHead`].
>> +#[repr(transparent)]
>> +pub(crate) struct CListHead(Opaque<bindings::list_head>);
>> +
>> +impl CListHead {
>> +    /// Create a `&CListHead` reference from a raw `list_head` pointer.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure.
>> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
>> +    #[inline]
>> +    pub(crate) unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
>> +        // SAFETY:
>> +        // - [`CListHead`] has same layout as `list_head`.
>> +        // - `ptr` is valid and unmodified for 'a.
>> +        unsafe { &*ptr.cast() }
>> +    }
>> +
>> +    /// Get the raw `list_head` pointer.
>> +    #[inline]
>> +    pub(crate) fn as_raw(&self) -> *mut bindings::list_head {
>> +        self.0.get()
>> +    }
>> +
>> +    /// Get the next [`CListHead`] in the list.
>> +    #[inline]
>> +    pub(crate) fn next(&self) -> &Self {
>> +        let raw = self.as_raw();
>> +        // SAFETY:
>> +        // - `self.as_raw()` is valid per type invariants.
>> +        // - The `next` pointer is guaranteed to be non-NULL.
>> +        unsafe { Self::from_raw((*raw).next) }
>> +    }
>> +
>> +    /// Check if this node is linked in a list (not isolated).
>> +    #[inline]
>> +    pub(crate) fn is_linked(&self) -> bool {
>> +        let raw = self.as_raw();
>> +        // SAFETY: self.as_raw() is valid per type invariants.
>> +        unsafe { (*raw).next != raw && (*raw).prev != raw }
>> +    }
>> +
>> +    /// Pin-initializer that initializes the list head.
>> +    pub(crate) fn new() -> impl PinInit<Self> {
>> +        // SAFETY: `INIT_LIST_HEAD` initializes `slot` to a valid empty list.
>> +        unsafe {
>> +            pin_init::pin_init_from_closure(move |slot: *mut Self| {
> 
> pin_init::ffi_init should be used for this.
> 

Will do, thanks.

>> +                bindings::INIT_LIST_HEAD(slot.cast());
>> +                Ok(())
>> +            })
>> +        }
>> +    }
>> +}
>> +
>> +// SAFETY: [`CListHead`] can be sent to any thread.
>> +unsafe impl Send for CListHead {}
>> +
>> +// SAFETY: [`CListHead`] can be shared among threads as it is not modified
>> +// by non-Rust code per type invariants.
>> +unsafe impl Sync for CListHead {}
>> +
>> +impl PartialEq for CListHead {
> 
> #[inline]

Will do.

Thanks,
-- 
Joel Fernandes

