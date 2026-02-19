Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id K2msDuValmnteAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 01:35:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 782CB15B2DB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 01:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A01710E0A9;
	Thu, 19 Feb 2026 00:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="r0JHxlEh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012009.outbound.protection.outlook.com
 [40.93.195.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594C810E0A9;
 Thu, 19 Feb 2026 00:35:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vM+ayE8fCbKjNYTJFsXOMvdfMqbcyZtlrXwSyTYxtW1co5jQVrt0rHGPoRDgCrU4pjC3jT5JDhpyZ8wtyHf+uk1Bgat9t5XNRJVc7KUhK5b9SDGZh0AhYTDWYPfCQNVXPPZXz5EYySTH7u2ZLwwzGUViM4HEQnrKZoW7bYkDtKyDA6qH0x0F4HYu1BCKIJoj4nwJGGfhG/Ba9mISlAgWHCEL6ffwE4s94WQ+rVF5zDHUpLTbyiyWrQSifkpfga2InQfF1B0tQRtuCUfl/p9GXEdx+B1EJiSJ5eqvTsAjMQPCmGsLrCzkMCpg2ZDy6GGC8U83qy9B0zJ4ZgThwQ+y6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVgZogcuJAmHAeMl/9pa7LzHGPF/PccsJeT/2CPZTo8=;
 b=Fq//vuXPEDKd9HGi5qTGnFjcPVOr7Hu1AtswdllKf7Vp1akTuRM5yPO+V4e2VozgN7bFcxqL0nIY7GqEDzfPHXTO7fce0bmcw1htB3x6amK6QASXF8+nGM7Iz51GPI2avijhbJy6TumA9V6PrrCbPDYEKwqHIB2bnYdRB3SgTYso4NhahnCOtUHGsjM7M1efuGFwOWLIo8v21a9pTlYis8gmXJIbSpAW3XEuXFlW/pMYH/IiZ4RydoGyH5tiXtzwiRokStjBTif7q1ZwjUMYoKDoU+QkswSYT1pKpyGv7f5ZPf93eHyg74wDtCubIVrWCE+aF0an0ZvtegpBBmHWpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVgZogcuJAmHAeMl/9pa7LzHGPF/PccsJeT/2CPZTo8=;
 b=r0JHxlEhjqP+dr7pT+jOTAcv3QsYGfXJlAmDI5oWINOPx+EnX3NqR4k88ZBAh/oiPgnWuWHpZoIwg2S6m3joWFcjFwYJTc6rVulCOg1NWDvHJRI+8fYZuC1VViJ2JBqBfDMpi80u+nfed3K8qxsZe8a651y3kKmcEOy90ObDMNrWznAafqgJ8M8kTd1b8yERzJg8i/5JiVMV5JgGHFldWtf0LNLFoyCXWs/n1mWw/vO6kHaDmQzqFTWv8KP2HB7d1csST44jYoEac53KQTd/xeGFxM+fmllhi2Jt73pxpsVnPyNvyF8nB/qDWMwzoz5qmtKu8uLL66dp4vhB4V7WQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by CY5PR12MB6154.namprd12.prod.outlook.com (2603:10b6:930:26::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 19 Feb
 2026 00:35:35 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%3]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 00:35:35 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 09:35:31 +0900
Message-Id: <DGIIMT4F1GWA.12UFBEUAC80VW@nvidia.com>
Subject: Re: [PATCH -next v9 1/3] rust: clist: Add support to interface with
 C linked lists
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Helge Deller" <deller@gmx.de>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Alistair Popple" <apopple@nvidia.com>, "Andrea Righi" <arighi@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>, "Elle
 Rhumsaa" <elle@weathered-steel.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <joel@joelfernandes.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
References: <20260210233204.790524-1-joelagnelf@nvidia.com>
 <20260210233204.790524-2-joelagnelf@nvidia.com>
In-Reply-To: <20260210233204.790524-2-joelagnelf@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0063.jpnprd01.prod.outlook.com
 (2603:1096:405:370::17) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|CY5PR12MB6154:EE_
X-MS-Office365-Filtering-Correlation-Id: e2c0f73e-a614-4aeb-8721-08de6f4ecbe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGJFaDZEYmpHdHJBcUNIbU15K3Z2aEpKVzR5UW5pRTl1OGl0dWVSYjNJN0FV?=
 =?utf-8?B?eUdyMS9XdmErWnlJT2pLc2l0Z051UTZHQk1DRVBTUkRBYXFFZFFVTjRkSzVa?=
 =?utf-8?B?cXIzVVY3UkVRYVVWeHgraVR5VnY3SHRZNXBqd2RVeDhvUWNFY3BPbHdiMUJH?=
 =?utf-8?B?TjUrQzFLZGtHVy90V3EzaDhvODdFOFhUVTNXdkZSQk1kQkVRbDFzUDlZMExI?=
 =?utf-8?B?T05GQWZXMGlDNkpKTm1YalR2UkJXa0xTeTRrZ3VTNWQvcHlYbmwyalNYVXJH?=
 =?utf-8?B?d09aRkVIanZZQ3NTdjRYeHE2Q0JxQUFTSFNxRWhkaXR3bVk5V3JaZ0w5MGFw?=
 =?utf-8?B?VVNsUmRnZEMxQlg2Szc4Q2pvRkV4RDd6U2svMmZWZXZjcXAyQTFBaGJvOUta?=
 =?utf-8?B?Zjk5WjlKVEdVZmtTYlJ4ZUFWY1RNajNzUE9BWGtFNlRvdGsrK2lWWHhTLzg1?=
 =?utf-8?B?RDgyMTZkcDJGMERHaFZBdlBSL0VKSmYvL0JKUllDNkMrd2xyYURVVWRFWUxM?=
 =?utf-8?B?YVRUNVl2aEw3NEhMNXdxbmM4WVVNRHBOWWhYYldvVVJJVytZTkVxbzVCVXdv?=
 =?utf-8?B?S1ZVOFBVQnE2VzN2VmFLL2psTlRsYzc4L0hHTTRUTVdSSDJIdnZROFFtMnNO?=
 =?utf-8?B?MTE5TFpzODIvZksxUTlIbWhURG9Qd1VkTVdPdHM5SmZVOTdTSUhyM0JTRlBs?=
 =?utf-8?B?cHNwZHFFNUlQSm9UWkRjVGVxYXcwM21qdFk5NzZaU1BzeG9YQnluWncyTHhZ?=
 =?utf-8?B?MzJ0d1B4MWxmZHZEQ29ybE1EWEh2cVcyd09qcGhlTTVQQ2JPSS8yQUM0ZGM1?=
 =?utf-8?B?aFZETFpWQzR5dUFCU3V4NEVIcVZoOXdQakNNNDJLcEQvMCt3c21wNVpJdUhH?=
 =?utf-8?B?cmRqR3BqYm5JZmhmQzlOeS81UHZkbldiOTE2NmtFUnRnWWNJZGJQVi9EaGRy?=
 =?utf-8?B?ajdlZjBRQVpuT1NaRXFnSGFWQ2E2WUM4SjQyTDQ2S3dMc1RDYVEzaGY2enlK?=
 =?utf-8?B?a2JkUUNOVFVIM2kyYTdKa0tzTExXd3BIZmxwYmtoT1NBMTEwNnprREh4SDhD?=
 =?utf-8?B?Kzd1TngydEVUdllHekdWbnI4dENZUnY2QkNCL3k4Q0hCNWoxSFNLaDlVL21N?=
 =?utf-8?B?VFd6TEpta1p4OHpObnYwWTRpbVVHTUk0eFo0cS9qR3paTkRWdFBNZENqc2Fh?=
 =?utf-8?B?OW50WlJUZGp6dFREck9QVHlKbW0vdUx6YUZpTE12cGYzL2cyUHd4SXpCaytX?=
 =?utf-8?B?U3pIVFpRN2RhVjBRYVBvdytCeUY5dFk4TElDdS9KVDg2RUFqNHJ5dG41OW5V?=
 =?utf-8?B?MndZUCtESStKc25EWkpEZEVib2trbHVRdk9PWFA3b3hNMUJQbHE1bUk0b04w?=
 =?utf-8?B?d3ZNL0dLTmcyTVVyUlRoZkluNm5FME1LRHRvYVVtbUtxWFoxM2Q2c2pWOGdE?=
 =?utf-8?B?WGd2dDdadkw0RklmaTFCN3p0Wjg0LzNhUG1RU1ltdmc3ZXhBd0xsZUdTVXRH?=
 =?utf-8?B?blcrbGpPRndhazl4WWRzN05SQUlqZ0V1RzQveHFhaVpvWUwrUDZ6ZnVCTS9m?=
 =?utf-8?B?WkQreERGZEttSU81RFVsWENPZXE1M1o4OU9kWDJ0M2hCbUNXNTY5T2Z6N0xr?=
 =?utf-8?B?YjRDSWVQZyt2RDNLckh5M29HMW1Yc2ZMZE1sV0VreVdXNTBzdGxqN2luSS9i?=
 =?utf-8?B?bWFTVm16N3phYWh6ZjhXZW5FU0t2ZUNGdWE4aUlkemlnbWw5MzNXZzdNUFFD?=
 =?utf-8?B?UGVDeU16WDZXeVN6TmJ1T2h2blY1WVk3b2pTUEk4WTBvaUwzRmI2eXpqY2JY?=
 =?utf-8?B?UFAvczlqWGlzbUIwVm9jMkt6ZFJ1d3dUbk9YRE90VjRqem5kL0dzNzdOWFZx?=
 =?utf-8?B?aUhTbVEydGpWQ2llVlFqNmdQa1lwUVpsSlBVb2psQlNzZHAxbUNYZENBK1Jl?=
 =?utf-8?B?Z2hULzVZOXZDeGlKOXozVCtNUWtCRGJac0RsTzBaZy9ld0JDR1NLNTB4QlU2?=
 =?utf-8?B?RDR1WlZiUFN3d3BKUmsrQ2thQ3Q0MEtSZDB6MGhUL05HSTZOelkya0Q2d1pH?=
 =?utf-8?B?dTRMUjExZk4xVkZpbThobEpDRVhyYmduN1hZSXZtOFRwWjdEZnRNNzlpVFhM?=
 =?utf-8?Q?Z1hM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm9iMWZ3NnFqckFsYjl0ZHhJTFZXMi8zVmpMK1dHQ0xmMmZlNUxYNkgxeHky?=
 =?utf-8?B?cERYdndYczlqSzVJNk9aOStoZjlyV1VPYXY4ekg2OTFXaEJqYzdlZXlCV0ZD?=
 =?utf-8?B?R1hmRWlXaHhjWHRrZGVpWEQyVWR3QW9neExwTWNEOG1sdmRyV214dTA5SkZr?=
 =?utf-8?B?ZzJxWWVQUFhUZ3NoakV2OGFuNHZSeHI2L3RxMU9sZDl1czBhV21TUytXOWV3?=
 =?utf-8?B?dzFTSmUrSXRmbWgxN1FMam9McHViajVFVDFPaTUwblIxdElEQXNXbWM3R0V6?=
 =?utf-8?B?RDd2Y0FZTlJEMncvN0xvcGRWZ2NvT2lvOFd0aWhqTmJnR0w4Mk1UMUE5S09o?=
 =?utf-8?B?ZHpIaFlWTnl1V1FDL1lrVm1kVFQ3T1EvNVJFRDc4a0Y2YTY2RHovbGgwY1R1?=
 =?utf-8?B?MVdRRnZNd0NPcHp6OG5TVVZndjJ5ZFFXRTF4RVFWSXdvTURkZDJvNVFJS2dH?=
 =?utf-8?B?K0Q4WVlZdkl0cFpVZkUvNk5BempBM0pXNjBSMXlOQXB6Zk9lR2pqdXBseEZp?=
 =?utf-8?B?QkdEK0xUQ0loajdWSSt2cUNmMnJQajk2d0dLclE4enRqN1pFY1BPdVRRdGtR?=
 =?utf-8?B?TlVCRlpYT3c2WE1hbjV5bkF5OGZBeERqM05uWXN2d0VLM0NmNHpRSFYrVTBs?=
 =?utf-8?B?UDN3OUVXdEwrcEhQbTdMUlhrQS9aNk9JdHpQS1lta2hRUi9kSzFxSE53SUpY?=
 =?utf-8?B?UG1XUHZjek9zNC9SWDNMUnY1a2NyNHJxRUJRc25qa0dTOUxwTjJEY0oxWnJB?=
 =?utf-8?B?eGZYblZPT1lwRVZhc01zQXkrODVyc21Gbkptc1I1T2RUMk5LRS9IbEwraUZN?=
 =?utf-8?B?RndKOW5aMkRTRmtCOVNUdXU2a0VhT1lKeWdDTmsyM0FLTW42SXdLVWhRNUd6?=
 =?utf-8?B?cWxwK1RGTDJXbm83U2ZUMVczUithWjFsOHNabHFFS1ZJdGxodnhRQ1cwdSt6?=
 =?utf-8?B?ZmRFWjRmRVVjQ2d3R2RUZEhzSjVydEhCS0kyTXJsa2dUMnljeXc3Zi9oaU5t?=
 =?utf-8?B?Vm51ZXNvL3VHMXliVTNDYkJ0Y2JYY3JkaTVBSDdteTRySnhUbHA5K3ZoamV5?=
 =?utf-8?B?UldMRTZJNjJGTk5YTExmancwbXVjY0pSWi9zYXBDNDJEbFlacUs1WHZtd0dY?=
 =?utf-8?B?TVAzWnk3VjJoM1hMcHdTUEkya2lZcW1NR2draDVNekVLS1dRSk1HMytQUlJX?=
 =?utf-8?B?OFRoYTk4RldTR2xLa0tQa1o3RzMxRlhSSzZtTjQyNE9vcG41Qy9HbXNZUnlx?=
 =?utf-8?B?aFBnL0VrL1JHdlJiRGd0UzlJUjJtOWNCdVg0NWduU1RJWUI5bzhIcjhpTUZp?=
 =?utf-8?B?M00xSWF4U2tnRDc4WEtMS0FZbXYyeklUK0g3SklsTksxNUZ0N05FeGV4WWJK?=
 =?utf-8?B?Q3p4bVlxVERpSmNyRUY2ZTAvN3ZBandrVzA4VEVKWmNYRVRGaUNrVlFvSEFu?=
 =?utf-8?B?UVRZbUtVNlNLcEQwMDJPVUhaMTRMNU5PN1BybmIzQVM4Y1hJVXp5aEo3MWlF?=
 =?utf-8?B?YStuK2xOY0hSd1ZGd2ErM3FTV0haOG54aGg4R0pvdjhycktYMy9mR1FRTnNt?=
 =?utf-8?B?Y3k5Zm0rWTZBd1U5em4zZ2NEV1JESlhKaHRDWm9TV3U4ZU83MUF5NUNMN012?=
 =?utf-8?B?NzZhMTRxdmNCeWxDSlB4WnE5TXdWRnZJVW9VanJjbW4vdDRXQ2hhaFpmZG9k?=
 =?utf-8?B?WndlSkplQ2YzRFQ1V3pCS0l4ZzU2YllsS1ZKa2YyVFhwS0RueTI4Q2FXRkxm?=
 =?utf-8?B?SG9hTHA3eUFmcFIvbHIzdlBtRnVSNnVwS0I3M0lJTDBPeDA1RFFlN3A3UVVa?=
 =?utf-8?B?WjA2OHB5bTF1Q1ZwQ2NZQU00clczRUovY0NhaGF6UW5TY2NVQU1OZ0JUWDVS?=
 =?utf-8?B?bEpxbmtuVXZmRm9WdjZKK01QemFTY1cyMTI3cXR1cU1lMHpTaEJUa1RGRWNw?=
 =?utf-8?B?T09qaWlaMzNhN21lajRnanZneXhVcUZpaFZDRjFESkwvSE90QWhIZTcyS080?=
 =?utf-8?B?V0FXbHh1Q3I4akhiZTU0Ri9nMFFXNjhMSUpGWmt3RDhsSklRbHZzNElDU1lG?=
 =?utf-8?B?bkx1ejRXWjIyVVR6WURmcmYxYWIyR2FQaVRrUUJnS2NNM0hDMG8xbGJlbDc1?=
 =?utf-8?B?TUkyMEVWeGQycG5jbS9yM0NEL0loaFY1N2Fqb0pHTUhiUklJWHUwYi9uYzJw?=
 =?utf-8?B?UkFVQzg0UU9ndWFxcXhYMTBSNEV3Z2I1aWZZa09McjY0ditoa3RtYmZhVFNM?=
 =?utf-8?B?L01HNjZLT3cyeWFONFJkTUlRTmo4K2VJcVBOZDlWY1JLTVVwV1VxUmFvampi?=
 =?utf-8?B?aUMxd2FzRDRvNjFJblFVVTd0OW5OWVZjTkh5ekk1VDIvcWttV24vaGg3cTUw?=
 =?utf-8?Q?oCP4d+KxOeHKkE4R5tl0Gf5WpyEOAO1zG/ar8NdFQRIa7?=
X-MS-Exchange-AntiSpam-MessageData-1: KXNZDWph8pgbOA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c0f73e-a614-4aeb-8721-08de6f4ecbe4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 00:35:35.5094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YJXts1RqPrru5++EXy7tU5gfCIwCYJ5fFs+qWhaAbL/pOggcLKSHGWisPJ9WFaGaRiskO+JrCWkZyQZrn1t5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6154
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,collabora.com:email,auristor.com:email]
X-Rspamd-Queue-Id: 782CB15B2DB
X-Rspamd-Action: no action

I saw that v10 has been sent, but since the code is mostly identical
this review should still apply (I was in the middle of writing it before
going to sleep).

On Wed Feb 11, 2026 at 8:32 AM JST, Joel Fernandes wrote:
> Add a new module `clist` for working with C's doubly circular linked
> lists. Provide low-level iteration over list nodes.
>
> Typed iteration over actual items is provided with a `clist_create`
> macro to assist in creation of the `CList` type.
>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Acked-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  MAINTAINERS            |   7 +
>  rust/helpers/helpers.c |   1 +
>  rust/helpers/list.c    |  17 +++
>  rust/kernel/clist.rs   | 320 +++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs     |   1 +
>  5 files changed, 346 insertions(+)
>  create mode 100644 rust/helpers/list.c
>  create mode 100644 rust/kernel/clist.rs
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7cfb766112cd..b0050b478dc9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23205,6 +23205,13 @@ S:	Maintained
>  T:	git https://github.com/Rust-for-Linux/linux.git rust-analyzer-next
>  F:	scripts/generate_rust_analyzer.py
> =20
> +RUST TO C LIST INTERFACES
> +M:	Joel Fernandes <joelagnelf@nvidia.com>
> +M:	Alexandre Courbot <acourbot@nvidia.com>
> +L:	rust-for-linux@vger.kernel.org
> +S:	Maintained
> +F:	rust/kernel/clist.rs
> +
>  RXRPC SOCKETS (AF_RXRPC)
>  M:	David Howells <dhowells@redhat.com>
>  M:	Marc Dionne <marc.dionne@auristor.com>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index a3c42e51f00a..724fcb8240ac 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -35,6 +35,7 @@
>  #include "io.c"
>  #include "jump_label.c"
>  #include "kunit.c"
> +#include "list.c"
>  #include "maple_tree.c"
>  #include "mm.c"
>  #include "mutex.c"
> diff --git a/rust/helpers/list.c b/rust/helpers/list.c
> new file mode 100644
> index 000000000000..4c1f9c111ec8
> --- /dev/null
> +++ b/rust/helpers/list.c
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Helpers for C Circular doubly linked list implementation.

nit: "Circular" doesn't need a capital "C".

> + */
> +
> +#include <linux/list.h>
> +
> +__rust_helper void rust_helper_INIT_LIST_HEAD(struct list_head *list)
> +{
> +	INIT_LIST_HEAD(list);
> +}
> +
> +__rust_helper void rust_helper_list_add_tail(struct list_head *new, stru=
ct list_head *head)
> +{
> +	list_add_tail(new, head);
> +}
> diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
> new file mode 100644
> index 000000000000..8aa72b5d54be
> --- /dev/null
> +++ b/rust/kernel/clist.rs
> @@ -0,0 +1,320 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! A C doubly circular intrusive linked list interface for rust code.
> +//!
> +//! # Examples
> +//!
> +//! ```
> +//! use kernel::{
> +//!     bindings,
> +//!     clist_create,
> +//!     types::Opaque, //
> +//! };
> +//! # // Create test list with values (0, 10, 20) - normally done by C c=
ode but it is
> +//! # // emulated here for doctests using the C bindings.
> +//! # use core::mem::MaybeUninit;
> +//! #
> +//! # /// C struct with embedded `list_head` (typically will be allocate=
d by C code).
> +//! # #[repr(C)]
> +//! # pub struct SampleItemC {
> +//! #     pub value: i32,
> +//! #     pub link: bindings::list_head,
> +//! # }
> +//! #
> +//! # let mut head =3D MaybeUninit::<bindings::list_head>::uninit();
> +//! #
> +//! # let head =3D head.as_mut_ptr();
> +//! # // SAFETY: head and all the items are test objects allocated in th=
is scope.
> +//! # unsafe { bindings::INIT_LIST_HEAD(head) };
> +//! #
> +//! # let mut items =3D [
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! # ];
> +//! #
> +//! # for (i, item) in items.iter_mut().enumerate() {
> +//! #     let ptr =3D item.as_mut_ptr();
> +//! #     // SAFETY: pointers are to allocated test objects with a list_=
head field.
> +//! #     unsafe {
> +//! #         (*ptr).value =3D i as i32 * 10;
> +//! #         // &raw mut computes address of link directly as link is u=
ninitialized.
> +//! #         bindings::INIT_LIST_HEAD(&raw mut (*ptr).link);
> +//! #         bindings::list_add_tail(&mut (*ptr).link, head);

Is the `INIT_LIST_HEAD` line needed? `list_add_tail` will immediately
overwrite the initial values of `ptr.link`.

> +//! #     }
> +//! # }
> +//!
> +//! // Rust wrapper for the C struct.
> +//! // The list item struct in this example is defined in C code as:
> +//! //   struct SampleItemC {
> +//! //       int value;
> +//! //       struct list_head link;
> +//! //   };
> +//! //
> +//! #[repr(transparent)]
> +//! pub struct Item(Opaque<SampleItemC>);
> +//!
> +//! impl Item {
> +//!     pub fn value(&self) -> i32 {
> +//!         // SAFETY: [`Item`] has same layout as [`SampleItemC`].
> +//!         unsafe { (*self.0.get()).value }
> +//!     }
> +//! }
> +//!
> +//! // Create typed [`CList`] from sentinel head.
> +//! // SAFETY: head is valid, items are [`SampleItemC`] with embedded `l=
ink` field.
> +//! let list =3D unsafe { clist_create!(head, Item, SampleItemC, link) }=
;

`head` appears in the documentation for the first time here - it would
help to make at least its declaration visible, or add a comment
specifying its type.

> +//!
> +//! // Iterate directly over typed items.
> +//! let mut found_0 =3D false;
> +//! let mut found_10 =3D false;
> +//! let mut found_20 =3D false;
> +//!
> +//! for item in list.iter() {
> +//!     let val =3D item.value();
> +//!     if val =3D=3D 0 { found_0 =3D true; }
> +//!     if val =3D=3D 10 { found_10 =3D true; }
> +//!     if val =3D=3D 20 { found_20 =3D true; }
> +//! }
> +//!
> +//! assert!(found_0 && found_10 && found_20);
> +//! ```
> +
> +use core::{
> +    iter::FusedIterator,
> +    marker::PhantomData, //
> +};
> +
> +use crate::{
> +    bindings,
> +    types::Opaque, //
> +};
> +
> +use pin_init::{
> +    pin_data,
> +    pin_init,
> +    PinInit //
> +};
> +
> +/// Wraps a `list_head` object for use in intrusive linked lists.
> +///
> +/// # Invariants
> +///
> +/// - [`CListHead`] represents an allocated and valid `list_head` struct=
ure.
> +#[pin_data]
> +#[repr(transparent)]
> +pub struct CListHead {
> +    #[pin]
> +    inner: Opaque<bindings::list_head>,
> +}
> +
> +impl CListHead {
> +    /// Create a `&CListHead` reference from a raw `list_head` pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an allocated and initialized =
`list_head` structure.
> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
> +    /// - The list and all linked `list_head` nodes must not be modified=
 by non-Rust code
> +    ///   for the lifetime `'a`.
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Sel=
f {
> +        // SAFETY:
> +        // - [`CListHead`] has same layout as `list_head`.
> +        // - `ptr` is valid and unmodified for 'a per caller guarantees.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Get the raw `list_head` pointer.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::list_head {
> +        self.inner.get()
> +    }
> +
> +    /// Get the next [`CListHead`] in the list.
> +    #[inline]
> +    pub fn next(&self) -> &Self {
> +        let raw =3D self.as_raw();
> +        // SAFETY:
> +        // - `self.as_raw()` is valid per type invariants.
> +        // - The `next` pointer is guaranteed to be non-NULL.

Safety nit: the SAFETY comment should mention what guarantees that `next` i=
s
non-NULL. Also the safety section of `from_raw` has 3 items, but this
only justifies 2.

> +        unsafe { Self::from_raw((*raw).next) }
> +    }
> +
> +    /// Check if this node is linked in a list (not isolated).
> +    #[inline]
> +    pub fn is_linked(&self) -> bool {
> +        let raw =3D self.as_raw();
> +        // SAFETY: self.as_raw() is valid per type invariants.
> +        unsafe { (*raw).next !=3D raw && (*raw).prev !=3D raw }
> +    }

This will return true on a non-empty sentinel head - is that intended?

Since this is only used in `CList::is_empty`, and in the GPU buddy's
`is_empty` method, is this the right name? The code also mirrors C's
`list_empty`...

> +
> +    /// Pin-initializer that initializes the list head.
> +    pub fn new() -> impl PinInit<Self> {
> +        pin_init!(Self {
> +            // SAFETY: `INIT_LIST_HEAD` initializes `slot` to a valid em=
pty list.
> +            inner <- Opaque::ffi_init(|slot| unsafe { bindings::INIT_LIS=
T_HEAD(slot) }),
> +        })
> +    }
> +}
> +
> +// SAFETY: [`CListHead`] can be sent to any thread.
> +unsafe impl Send for CListHead {}

That safety comment is circular. I guess you mean to say that
`list_head` can be sent to any thread?

> +
> +// SAFETY: [`CListHead`] can be shared among threads as it is not modifi=
ed
> +// by non-Rust code per safety requirements of [`CListHead::from_raw`].
> +unsafe impl Sync for CListHead {}
> +
> +impl PartialEq for CListHead {
> +    #[inline]
> +    fn eq(&self, other: &Self) -> bool {
> +        core::ptr::eq(self, other)
> +    }
> +}
> +
> +impl Eq for CListHead {}
> +
> +/// Low-level iterator over `list_head` nodes.
> +///
> +/// An iterator used to iterate over a C intrusive linked list (`list_he=
ad`). Caller has to
> +/// perform conversion of returned [`CListHead`] to an item (using `cont=
ainer_of` macro or similar).
> +///
> +/// # Invariants
> +///
> +/// [`CListHeadIter`] is iterating over an allocated, initialized and va=
lid list.
> +struct CListHeadIter<'a> {
> +    /// Current position in the list.
> +    current: &'a CListHead,
> +    /// The sentinel head (used to detect end of iteration).
> +    sentinel: &'a CListHead,
> +}
> +
> +impl<'a> Iterator for CListHeadIter<'a> {
> +    type Item =3D &'a CListHead;
> +
> +    #[inline]
> +    fn next(&mut self) -> Option<Self::Item> {
> +        // Check if we've reached the sentinel (end of list).
> +        if self.current =3D=3D self.sentinel {
> +            return None;
> +        }
> +
> +        let item =3D self.current;
> +        self.current =3D item.next();
> +        Some(item)
> +    }
> +}
> +
> +impl<'a> FusedIterator for CListHeadIter<'a> {}

I asked this a couple of times ([1], [2]) but got no reply, so let me
try again. :) Given that `list_head` is doubly-linked, can we also
implement `DoubleEndedIterator`?

This can be done in a follow-up patch but should be there eventually as
C lists are often parsed in both directions.

[1] https://lore.kernel.org/all/DEGQCMSX1SGZ.2NQDPG5KUNA9D@nvidia.com/
[2] https://lore.kernel.org/all/DEOLRLCZQMBG.1WHBR4YL8SKYR@nvidia.com/

> +
> +/// A typed C linked list with a sentinel head.
> +///
> +/// A sentinel head represents the entire linked list and can be used fo=
r
> +/// iteration over items of type `T`, it is not associated with a specif=
ic item.
> +///
> +/// The const generic `OFFSET` specifies the byte offset of the `list_he=
ad` field within
> +/// the struct that `T` wraps.
> +///
> +/// # Invariants
> +///
> +/// - The [`CListHead`] is an allocated and valid sentinel C `list_head`=
 structure.
> +/// - `OFFSET` is the byte offset of the `list_head` field within the st=
ruct that `T` wraps.
> +/// - All the list's `list_head` nodes are allocated and have valid next=
/prev pointers.
> +#[repr(transparent)]
> +pub struct CList<T, const OFFSET: usize>(CListHead, PhantomData<T>);
> +
> +impl<T, const OFFSET: usize> CList<T, OFFSET> {
> +    /// Create a typed [`CList`] reference from a raw sentinel `list_hea=
d` pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an allocated and initialized =
`list_head` structure
> +    ///   representing a list sentinel.
> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
> +    /// - The list must contain items where the `list_head` field is at =
byte offset `OFFSET`.
> +    /// - `T` must be `#[repr(transparent)]` over the C struct.
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Sel=
f {
> +        // SAFETY:
> +        // - [`CList`] has same layout as [`CListHead`] due to repr(tran=
sparent).
> +        // - Caller guarantees `ptr` is a valid, sentinel `list_head` ob=
ject.
> +        unsafe { &*ptr.cast() }
> +    }

IIUC you can call `CListHead::from_raw` here instead of repeating its
code.

> +
> +    /// Check if the list is empty.
> +    #[inline]
> +    pub fn is_empty(&self) -> bool {
> +        !self.0.is_linked()
> +    }
> +
> +    /// Create an iterator over typed items.
> +    #[inline]
> +    pub fn iter(&self) -> CListIter<'_, T, OFFSET> {
> +        let head =3D &self.0;
> +        CListIter {
> +            head_iter: CListHeadIter {
> +                current: head.next(),
> +                sentinel: head,
> +            },
> +            _phantom: PhantomData,
> +        }
> +    }
> +}
> +
> +/// High-level iterator over typed list items.
> +pub struct CListIter<'a, T, const OFFSET: usize> {
> +    head_iter: CListHeadIter<'a>,
> +    _phantom: PhantomData<&'a T>,
> +}
> +
> +impl<'a, T, const OFFSET: usize> Iterator for CListIter<'a, T, OFFSET> {
> +    type Item =3D &'a T;
> +
> +    fn next(&mut self) -> Option<Self::Item> {

This method is the only one not marked `#[inline]`.

> +        let head =3D self.head_iter.next()?;
> +
> +        // Convert to item using OFFSET.
> +        // SAFETY: `item_ptr` calculation from `OFFSET` (calculated usin=
g offset_of!)
> +        // is valid per invariants.
> +        Some(unsafe { &*head.as_raw().byte_sub(OFFSET).cast::<T>() })
> +    }
> +}
> +
> +impl<'a, T, const OFFSET: usize> FusedIterator for CListIter<'a, T, OFFS=
ET> {}
> +
> +/// Create a C doubly-circular linked list interface `CList` from a raw =
`list_head` pointer.
> +///
> +/// This macro creates a `CList<T, OFFSET>` that can iterate over items =
of type `$rust_type`
> +/// linked via the `$field` field in the underlying C struct `$c_type`.
> +///
> +/// # Arguments
> +///
> +/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut bin=
dings::list_head`).
> +/// - `$rust_type`: Each item's rust wrapper type.
> +/// - `$c_type`: Each item's C struct type that contains the embedded `l=
ist_head`.
> +/// - `$field`: The name of the `list_head` field within the C struct.
> +///
> +/// # Safety
> +///
> +/// This is an unsafe macro. The caller must ensure:
> +///
> +/// - `$head` is a valid, initialized sentinel `list_head` pointing to a=
 list that remains
> +///   unmodified for the lifetime of the rust `CList`.
> +/// - The list contains items of type `$c_type` linked via an embedded `=
$field`.
> +/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has compa=
tible layout.
> +///
> +/// # Examples
> +///
> +/// Refer to the examples in this module's documentation.
> +#[macro_export]
> +macro_rules! clist_create {
> +    ($head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+) =3D> {{
> +        // Compile-time check that field path is a list_head.
> +        let _: fn(*const $c_type) -> *const $crate::bindings::list_head =
=3D
> +            |p| &raw const (*p).$($field).+;
> +
> +        // Calculate offset and create `CList`.
> +        const OFFSET: usize =3D ::core::mem::offset_of!($c_type, $($fiel=
d).+);
> +        $crate::clist::CList::<$rust_type, OFFSET>::from_raw($head)
> +    }};
> +}

I find it difficult to remember which argument fits where in the macro's
syntax (I have the same problem every time I need to use
`list_for_each_entry_safe` for instance).

Since Rust macros let us be more creative, how about something like
this:

    let list =3D unsafe { clist_create!(head =3D> Item, SampleItemC.link) }=
;

It makes it more obvious that we use `head` to iterate through a list of
`Item`s, using the `link` member of `SampleItemC`. There are probably
better syntaxes; the above is just an example.
