Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBABBlFUhmlzMAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 21:51:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB369103432
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 21:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A03210E928;
	Fri,  6 Feb 2026 20:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rBnUtnez";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E7F10E903;
 Fri,  6 Feb 2026 20:51:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y68MHQkPyVFzVSmVxPpRGphioA3RjtycPC6naeLEL1X9LG+tnt/HjSglzvyVycIiOeNDjHon+G5HBEED3HsnX7CQeLRcOzVCbxM4HAXFCY29SflxJOLYsv61m36d10kMg2LNwGhItfE8RvgizcLdUv7cQX3MsEugDFAn4V5Mbu03q4ajhqbfYzcOlThWmAAaWqHChbQaqY2VFFrKSpdf77BhlwMFSEXVQyl6wsO8rPlIn2RXZJ8Ex5LQo8c3D4dVFgzxo38WwlJOI5OwERkYlNIA2EmyINZgnYyi90yPtzo825bTpSyn7Lgyn3oP2/c8ccg8FiZtrxhKE2IW1ak/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTwHNmerBaA6Wu+bTQEltBiMh52fkD4F3nSkiIcYE2Y=;
 b=BQrken7rtHPLhXZGwzcbQBKJ/3OgGNAsjzmPt9iHuh0xSSaRw0c4G6PAde3kbE2IhF4wTyeNffxjJGDa3ThEE+q23pcwB01SaLMb2m7nFshx1ElebIbE8KooUA1eHs8ScYVW4q09WPXMin1aDNEkDSmq0RZYjfyvcWTGq7DB3cOqhZz68zH9FKKq80CXWub2gdoOtmu2z02IxHZ0bpbsG58cQB9JCVFhXHttYLD/yjJO7ak2otxm6Q2+Xo+kDiMNgeXYbM2dZFcRQdV1NvuEVItGaTpvIYfoAwYp9bnYCojZC/rbhAWakWy/OdAixNs2BaLO6OMhIh83+yO+B4ZBtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTwHNmerBaA6Wu+bTQEltBiMh52fkD4F3nSkiIcYE2Y=;
 b=rBnUtnezZE8hsIEboOacybJNGJRliLiyKaGu+l7jeJDkA039iY4ygwAahlYmEffagakUBxa85Ync9pHPwa1qeM82qZ68MScwRHbYbs0h3W36q5HggYvSK7Q6bPmFCElZBxVa7HjojGFGcH9qoqrUUnzCiZXkLGopS2rn68cIfwulNO8oHd4ZDzIqOua/SLYJ3TX82E2hzLR63BqQVoN7PPiUxVtKU9/VbTjmHxHT6QOGOlV1EEyfePSF0x+W2+b47OB0Hk/0ufAhNdXbMd0WGwFwjtebDcJWZCAQBcCHJE/5X37mx0atYEkpFhhBckHlOJACFeQ1fZwNbIOqbR9zCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CH1PPFC908D89D1.namprd12.prod.outlook.com (2603:10b6:61f:fc00::623)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 20:51:12 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 20:51:12 +0000
Message-ID: <7ed85eca-2a5e-4e8f-8356-e7fbbf7d3a8f@nvidia.com>
Date: Fri, 6 Feb 2026 15:51:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 1/2] rust: clist: Add support to interface with C
 linked lists
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20260206004110.1914814-1-joelagnelf@nvidia.com>
 <20260206004110.1914814-2-joelagnelf@nvidia.com>
 <73B64D35-6574-4776-962D-865465C40226@collabora.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <73B64D35-6574-4776-962D-865465C40226@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P222CA0027.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::32) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CH1PPFC908D89D1:EE_
X-MS-Office365-Filtering-Correlation-Id: 653b3bde-66a2-45fc-f6d7-08de65c17669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z21yck9GQng0QytlZzdhOTVQay9sTHRCalJ0MVUrRXZHRmMzOHVaWGZ0bnBx?=
 =?utf-8?B?cU15eDFVRFQ1UkNlNUNyL3pOM3pOYU9xc2pNV2loTyt2eCtKNUYxMkhyZEVu?=
 =?utf-8?B?R3hEV3Npa2NhMHB2OGxtQ2ZmKzdLbGtHL1hWQzFXd21JSWNaRzZiZVlUUGVJ?=
 =?utf-8?B?TjlhbVcvVG1pLzlmMUVyOUxqajZ2Qmx5cXhiZ1NrbHdud3Rpa2lBNkxldU5s?=
 =?utf-8?B?WG5kNUxRMVhMNm9Ia1RjeFZvVkxqN3EwMmdXRWs4K2ZRVUgyUFVJa2dKTWRa?=
 =?utf-8?B?MjdOMGM4SlZkZEFYMExGTHIvRzkzN1VlRUJ2Q041M1BlSCtGUU5ERUlWWW5O?=
 =?utf-8?B?allDeHlGU1hRUE9MbHpGNC9SaVdWbnRUcStaWnQvNzBpV1gyUTE4Z296Y2U0?=
 =?utf-8?B?WGhrQThnUStwa21SZlZNbXdObE9NbnBZRnZSNHJSWllnUDg0QlhRTjBES2E5?=
 =?utf-8?B?Vk5sSjRzUFFGZGxJYUs1SW5ldWFINGd2MzNqMXhzV0hkZDhkQnJiVzNiVzFV?=
 =?utf-8?B?cEl0TVJkTjZ4NWNudnR6ZDRPUzlIZlIrY3lkd1N1SGFGZGlTQXpaZS9OWjcv?=
 =?utf-8?B?cDFMK3hOSENJdnUxanBXNVhiZTY1NStnc1lhdDNEczlHTmozbS9YVkh0Z0Zo?=
 =?utf-8?B?d3Q5T1FjLzNtaHIxRmQxdFhTajdWUHlyQUNDTGl4aFEzcmVkQmdsek14ZVQ5?=
 =?utf-8?B?VjJ0MVVIdUJvV3h2cTFvWnNtdUdpdlJWYnQ1T1RMWS9ObnNrdms2clBxSElm?=
 =?utf-8?B?QncwL2YzSHRlZmh0MUlPMGFpcjNMV0twU2I0VEs3T1N4MVZYZnM5dUltSERq?=
 =?utf-8?B?dk9obTFqZnJxWm9MMERidVBRWUZLd1IvaUxCalluNlBXTkRNQVNHM29mTmZj?=
 =?utf-8?B?OUtoUUE0Wk9pYmFrNVU2RytWc3B0WnNPSVVQZEVyVUFPcnZ3MURKWjUwbS9m?=
 =?utf-8?B?blYrcFdEL2VFTnlQU1dlWUFmd0R4dTE3ek1xMnRZVEZMNnJMak95OVRLQ0xI?=
 =?utf-8?B?ODBCUklwZGhyWUx3OUJEN3hqR0w3VGc5bXgyei9QUXF5cWRXamJUcWtBYWow?=
 =?utf-8?B?bk5TZ3lXcXU5SXVTbFVHNHR4cnV0T2s3M3lBT290Y3VlTzJIMDRjdzVpNTM2?=
 =?utf-8?B?bHNqTFdjTGFadEFPUnl3MkFyQStVSDNRb0twVHhzcWVIaFZhSFhrYm5qNnhv?=
 =?utf-8?B?eDgzaytZUlhPaUFPbjYwUm1PUUV0VUpsTnkvRS9XQzZ1dVJaL1NFUFRhallz?=
 =?utf-8?B?bU9VOVEzVk1PdWhsYi8rMnRiVlhQcmQ2ZGJtVDQvakxubGFGcHBIcnZsWmpi?=
 =?utf-8?B?T2Z6SSt1V1dQRm9haDVHdWswWStRNEIyQjI1Y0N6L0Y2WVVOd2FwK2ZNb0d4?=
 =?utf-8?B?Kzc0T0cvQjI2K2U2cjlRVDdsL0ZEVWxrQTFvaUd6TTJ2Tm1TSGo4UTRUdmZ5?=
 =?utf-8?B?QzA5SDRrR2dFNDlTOWdsUkt5QTNUN0xrUzBQb2xDeE1oUi9zdm9iTzRYa2lL?=
 =?utf-8?B?Wmx5SUtZZ01DV2NZblFvc0U1YVcwTWtBV1dFTlVqUFhCUUtZVC9QM2dFZjBw?=
 =?utf-8?B?dFV5cURNbW0yOSttQ0ZZUW1sVjhDc1Byd2cvaEdGaWpJZmVqbmEyd2xXY0FY?=
 =?utf-8?B?dGc5bGc2QlNXcnBZWFo1bCtXMndJclphZ2ZqdUJaSnRKZjMvL2c1elY2MEoz?=
 =?utf-8?B?czloSXV6SGhLdjBhcks4SDh3YWJNcnBEOC9idWlmT0UvTFM4ZXNma3dMbk1v?=
 =?utf-8?B?UDIvZTJFVVF6VU1sQjFaWEo5RVhYYkZOeGk1d2pZOG5qbGNubGp0RGhQNGIy?=
 =?utf-8?B?Um1NR2ZiNjdreFJvRlBQQy9YWnE4OFlPQVQ4LytDVWorZlRBdkJtSHZhNm8z?=
 =?utf-8?B?NnVmRXFrT2tLSnZsNGhoTG1QUXdSd1JuUEZ2blNuWG5RZ2V2K0tYNkx0N1RQ?=
 =?utf-8?B?Z0s4d2tkR2kwSDlOczBxb0ovT0d3UTA1Ri9qMk1YNllCQnBmYkh6NHROdmpM?=
 =?utf-8?B?cUZ2QU0wclR3alpEd1RDakxHWWYwamczTkZHRkx6eGFBZzBuM3RQSFBMczFx?=
 =?utf-8?B?d3lVNU4zYTl5VnBIMnlEMEVEY3o1c1FCcjcvS0o4MjREUjkxUGt0b2pUNFBy?=
 =?utf-8?Q?tudc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWxxNGRYcis0dStwdTVMdi83dDd2cUxFcWZnSTVjZmhqK0d6czA0ZXlzbmtB?=
 =?utf-8?B?ZWtNQWhFNHZFdGNBZ0VhSjVXcWFVT1NCNkZVN3oxdmZWME8vdXpKN0daTXZz?=
 =?utf-8?B?YWQzSi9LR0V5RXdkR2RTVFQ3bHF3a29DelRCRjBya0NDdVU1dUlVNTlaUFRQ?=
 =?utf-8?B?aWhxYWRxUGVrMUZBNGhvdWlZM0hsZ0l4Zkc1Y1JZck1USDh0eHBETVFDRmFR?=
 =?utf-8?B?Zm02V20yVmF1Yk5OS0gwa2pZcUdsWTh2NzQraXVzMXNvUFV5TzdXalIvYloz?=
 =?utf-8?B?Rk9md3d1c1Z5dXI2VHhnRDlyZmhtcFpBZlpYTHlUR0M0UW5HZXZsM1A0S2la?=
 =?utf-8?B?UjNuRUtBNDNJZUhZQ05XVk9oSG9pU0dqM0cxdkcwcTFKTU9DazBjTE54WkM4?=
 =?utf-8?B?MXRVTXQzYTFtYXNyL0xvZXNwUXRXdTFMaWVIRHlENHpSS09LbVdxQzBOdjZZ?=
 =?utf-8?B?RWthZ0NRL1dwbDdjdTN2Q2VYSDA0SjlzQ1MxbjdsZ0o5NGNFc3M3bWZWbG9y?=
 =?utf-8?B?NytiUVN5Q25vaVpOc2VFVzRGSTVDenBzbEp3WElFaUJDSzBaanoyVlNOVXhX?=
 =?utf-8?B?R2thRExaMStWMDRDRG1RbmV2SHB1Vzc1WE5FU2ZaMURMdUM1MnphQlh4Slg3?=
 =?utf-8?B?VW5xR3B6OHB5L2E3Zm9sNEIxQ2NwNk1DL0RyMkFMOTZ2eWxYT0EydmxqMmlQ?=
 =?utf-8?B?RmthTzBHQUxUdVp1b2cwWDdoQ0FOL3F5V0pVREtTVFdWY0xxMWxjVmsyQzRp?=
 =?utf-8?B?emY3Zm5VSkFMQ0JCMlAyb1lYd0ZGS3o3MFd2QURONzdnQ3pWZ2NHNlJHUXZM?=
 =?utf-8?B?RTVOTjNlSlo2WGtuNEI5WHo4UlEzcUR6NlFkQm5SSzl1VS9yZGRDdWI4Z2N3?=
 =?utf-8?B?MjFOem94M09HU2FOb2VvWmRUUVR6SUw2UnAxZXdZUzBCRmFDaUFSMm10N2Vh?=
 =?utf-8?B?ZDA3Z0Z2NFN0UWZIMmtxVmkwblViYXNCL20xSGVneFQycW05MGxrN0FyWHB4?=
 =?utf-8?B?UEUveDdtc2tsaHUzYlI0dkdsRkQxQU1Sc3dONEpPWmNwc3E4TVpMTWFGRFQz?=
 =?utf-8?B?NExkOHN4ZGpoUWZ1UUR3V0JNa1NveGhESTVnYk1saEI4S1FyMXFTdXNZaFZj?=
 =?utf-8?B?T0Vxa2NhSjRlaVhLZ2thd1hFQ1JvL3BnRitUWlhaajEyWGhlZlJZOWJvN1Nn?=
 =?utf-8?B?c0VRSTNpZVBCSVlOQkowQUhadnU4TGYwQ2M3S0lWTyt3djJuK1RWanBaRGFj?=
 =?utf-8?B?cXVPZmpVZ1VTQ3paSURiOGtjdkVXUFFneUJyVFVVTG5yVm94dUdjNjZua0lH?=
 =?utf-8?B?bWtUN1creGFqdTdhRkVHbkMwV1dXcFFPRTBxbzdGNHFQenFCVE41Vnd6MlhJ?=
 =?utf-8?B?NmQvWlBPa3o0djg3R3g5czlpakVsTHhtSUVVMTJKL0VFUWhsTFpudE5meWNG?=
 =?utf-8?B?eFBRUU5YZkE4SDM2emNPNHdJNExEZXVSaFdoUndnNFduTVpMZGgvUkp1RUMr?=
 =?utf-8?B?clBsUnRMZEgyNDhFd0MxRGJYcjcyOFNpL0xiRWc2MXpYamQ3L1l1LzgrWFRh?=
 =?utf-8?B?Qk16S3FWZW4yNkNDZUt1K2dnYkZXOEZ4ZW5KNVAxUzhWWWlaZklxTTZvTHAw?=
 =?utf-8?B?SlkwOUp4ZWhRbXFYVWNHTWxYeDY4aUxwUldHdWFyMlg4Y21DZnU2V3RCN1dS?=
 =?utf-8?B?SWNsRFVSVnFQeTg3NzVSNkZlcWlBbDFDc2lIZEJBWjNKak9VM3QzQzdjVytk?=
 =?utf-8?B?cGV5RzlNMTB3ZThDM1dlOEFCWVdmNzZRMjZhVEY0ZllpYTRtZVRvZUhaa0Nn?=
 =?utf-8?B?N0pPd1JZajhxdW81Q2RROXN2WU52djd2T0lDTzA0TXlreGtNRzFES0cyZ2pU?=
 =?utf-8?B?LytCL0Y2SGs3VnovbFIwNVFiL3pFZm9uSUxGbXNyMW9TOE45TG1Ub25yOFcy?=
 =?utf-8?B?NTdTZnRidnhhNkFXZlVxWWtEVk03MnFHVXRPMThONU5Xa0p6a3RkWUZRQ3lz?=
 =?utf-8?B?bGl5c2s2a1pkQWUzSFE3T1ZnNW1pOGVCZUdtNE5YaTJBcGJlS2RHaUxzYUJH?=
 =?utf-8?B?OHdqWkhMZHpHcGU3bVEwSjJqZFlpbGpoSk1EQ3U3b1BQNWtTVXlwdFVFSHdr?=
 =?utf-8?B?b1dBOUZWSTlwby9uWVl2b0h3S3JtRUx2S2dvY0JlOVh0Q3F1T3dDSDRtTktq?=
 =?utf-8?B?bG8rK0IwZGdyV0ErL0NOZm9iTlFHSmFOKzhBWUFldGszSnhkelZWdjg3bkp6?=
 =?utf-8?B?bkltNXV2Vk9Nbm1sSk9DQ2VBZVdSTEpoeDVHZDIzL3BBelI3WjljOXhHWkJZ?=
 =?utf-8?B?ZWpRbDNDMVI5R3g1UStOTkhYeFJxa3dVVWdHVnF6YkZBdThSUjNwZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 653b3bde-66a2-45fc-f6d7-08de65c17669
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 20:51:12.4963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7GeVV/d4C9CPwrxsudJGb5N0piYUnE6gF1jeMPkbCu8QHCIVP1W6oJvqTusdoyWjvu6DPzbA7U1wGj5YQP/6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFC908D89D1
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,joelfernandes.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AB369103432
X-Rspamd-Action: no action

Hi Daniel,
Hope you do not mind me replying piecemeal as I can reply more quickly. Thank
you for all the comments.

On 2/6/2026 12:49 PM, Daniel Almeida wrote:
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
>
> Can you expand on the two points above?

This is basically saying that a C `list_head` that is wrapped by a `CListHead`
is read-only for the lifetime of `ClistHead`. modifying the pointers anymore.
That is the invariant.

Or did I miss something?

-- 
Joel Fernandes

