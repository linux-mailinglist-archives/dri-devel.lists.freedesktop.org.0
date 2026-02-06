Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKvdLUoRhmk1JgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 17:05:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D2E100021
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 17:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF46310E82C;
	Fri,  6 Feb 2026 16:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nnW+VO3g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010053.outbound.protection.outlook.com [52.101.61.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DAB10E827;
 Fri,  6 Feb 2026 16:05:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVcVJtHs77SZwx/46ejByi6q9HzMsDtsXcK3sLDGrMotGeggziOOLV/GWuLkzRwJTQjbVOQqdSRKJqqPe3z/HtF+H04pKzyIHsLUPBp34bY5H7mi9TvWKrp0dZ9IcR2LEsyXBzA4Il2YAgXOH0TZ/CoaZjJElUodtuFWPbgNlXtGYDZEADwGVU2svYN7PjUqobpUnZMHQFSQioMWqW3X86kliIkJi5iOc9rxGRQpCiQj+sUJKDFI/VX6XFPZel6Oiydkm9xx3g0DPjvv0rFMb6+ceyYHgTjhXK7q7in77+KcFbMvOriS2qHViwS1DJ5o8Pa6YYeMKi7GwSc1aQ37kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqB46ZS287u2vTW4KrM1+L8gzNUase3P4/kDIzmoXSE=;
 b=HbmlqCOiiMEyxOC/j8tf1MQFkcoE/+FE8os1phToe0WAFoaKTVKUeNxY2G7RM/ymQcMpZfb++kZYTGkx0nCEsuqXOsukr5+3tN+1VoxE7bFOpUPbfXzqwhbjG3bqkbi49U4lXjSfqvu/ZxXn3i2MQDCE8lMDj6xIB0kVXoKiBz6Bujo6xg0gLeW2XSu/MFLURmeqB4s/+jARAK9ciZRBTGPyntRI54P3LBNkGClCMSrqSyYMBnRQ1zk4XQwUzGt1JWwITl4Dif+dy1hkdBtELMnDmaNrelR6+1HH/Oscsfr7LFzNW0YOA6g7Z2gNYvmQE9qH20N2eJzGrGP4ckkfFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqB46ZS287u2vTW4KrM1+L8gzNUase3P4/kDIzmoXSE=;
 b=nnW+VO3gR8HR1M2gmNAcpmqOEFersNMNJhVWGMSNKyIKI5KYdBgD94BJaOiVAvQUpEe8pWYbIDWVO8qnF20NcWRjbypZztnJKul6P+QlfT2pWeU/OvZEszAQmfCe0gund5oAOXCVd9bajo11rl1dZ3p5qcox2aE9dakOxQ+VloZz9mCNaItsgByJDvX9kTxQKQceeEFD8l7vt0BXdyUclHxCbFlvUQdSbYReELkRRSFfqrFnxhYSbh9ePKrxKohV1WDd15cMubXwjLi08y9JL03Ux6KqHWNNQjHXpH5c9/yLb7R3xDEOV80MqIXMXAqq95wq63qq7Y/k4xp5Dkg5aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6838.namprd12.prod.outlook.com (2603:10b6:806:266::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 16:05:17 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 16:05:17 +0000
Message-ID: <77ac3274-a962-469d-a2f6-6ccc0670988a@nvidia.com>
Date: Fri, 6 Feb 2026 11:05:13 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 1/2] rust: clist: Add support to interface with C
 linked lists
To: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>
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
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20260206004110.1914814-1-joelagnelf@nvidia.com>
 <20260206004110.1914814-2-joelagnelf@nvidia.com>
 <DG7ZF1UT98RQ.3F42J3ULGV2OC@garyguo.net>
 <DG800TDA6OXQ.275PMMS19F1EX@kernel.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DG800TDA6OXQ.275PMMS19F1EX@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR01CA0051.prod.exchangelabs.com (2603:10b6:208:23f::20)
 To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 826d255e-0d31-4f5d-9ecd-08de65998521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nzk0RkVTQjBGb2xzM1JlUGtVZkVWT0xocUdYeVFLK1N2QVZyWDQ4ZHJuYnND?=
 =?utf-8?B?SDRpSm1jNnBTc2JqMEVGTXloaXZNc25KV1J5N2ZKVGpKaklNRkZWcDZwdU9i?=
 =?utf-8?B?RWxYai9vbE5tbHpMRk1acFM1VGxqR1BBV05MMzUxSlZlRndxQkZmRWRHbFdl?=
 =?utf-8?B?VHZqV0NYWmIxd0tGcm5wNWZyVndVazBndzU4VFNJZ3Faa1NlV005SlFNREhQ?=
 =?utf-8?B?M1ZrdmszcUtVUXljMFU3UEdWWUx1Z05jTmFOWUJDc1RwWm5Ea0drUkJJMlFW?=
 =?utf-8?B?UzIxOVN2S2REYnFYNk9WRGZhTUJyUFRUdTdkS3lpTDdHMnI2U21zeUhZUGk4?=
 =?utf-8?B?QzM3NHVmNU81SGg2djlSVzQ5NEpkS0t3SDkwQmhyUkVnNDVIMnNTaWZDTDM5?=
 =?utf-8?B?NG9JMVIwbXNvNGdLdEs0QVprT3plTS9OV3p6RkxrZDNTK2NXWkV4ejlYbVh2?=
 =?utf-8?B?SXJuSFB1cVpuU2wvZml2U0hsSG9OZ0RJclJnOTRaMEtqY3h5czF4R0gwQ0VJ?=
 =?utf-8?B?aUhNQUx6cFRmTUJIcHpVVWZvVTE4QTA0ZmVLT1B0ek5SK2ViL3kxakJzM2Ix?=
 =?utf-8?B?NzNkUmtqT3ZaUVhoQzQ4S1UwRVlaVGFva01ZTEVZTXB2cU50Z1owQjN5bk9H?=
 =?utf-8?B?OG50UXcrNGFOeEFaV2xqRzdaQlQvUWdGSjBKTDdwZVRCRXMxNnFaMW94ZzJ1?=
 =?utf-8?B?Nm5wV2lqVEY2RmdUQ2FNWGYwUzluQlY0dzFNNzZsM281aVN2U1NFVXNPRkFz?=
 =?utf-8?B?TUZYUmRGRTIzeVlONTFiMUs3Z01WNjFzcnlYN3BFYzA2d2FnNitHOHJ5bXQ5?=
 =?utf-8?B?TDZCQUE5Z1Z0Yi9kckFmd25iNlErU1dQV1V6ckZtOWxQU2R0RFF2OWUvZWZm?=
 =?utf-8?B?dmZNcHphZGlHRVVvMGJGWkQ5TWZhSC9kU29neTJzKzAzNGNWbkpSdlNKU2dP?=
 =?utf-8?B?bVJZSm80bndRdzdLVk40QjFDL3JlY2VlTGx2cUF3c0NDUGxRRnFGU25tYWg0?=
 =?utf-8?B?bE1YSEFpZHhJaUF0WjJFV0U4Z2JDcG1FV05ZOXEvMHNzYlAwMGJXcVZxV1pr?=
 =?utf-8?B?dk9mM3U0MGxidnJPRDdGdncwN2FTeDA5eDRYZnZBbzRhcHoybGVRR1VYYktL?=
 =?utf-8?B?c3J6TFRSeVFkUDA5T2crSlV6MGZjdGJxMzdSSEdvSWdvQjBYTXVXQTQyckcx?=
 =?utf-8?B?MlJITG9aV2hEcEoxK2p0b0dHKzQ2ejFHNUJVMmxWOXBaUjN1a3JGTXV5RGF4?=
 =?utf-8?B?NEI2YUhtUng4cVF1WC9abjMwNUw3Y1VUVkc4eGNKQ1dBbzNnR0ltRkVZRXg3?=
 =?utf-8?B?cUlvTTJFblc5ZE1BQ1VwK3FUcHo4UjdoSUhETzVTUDhZazE4akc1OXNVeUg2?=
 =?utf-8?B?M0ZsREk1THcwdlVHWWlCNGtnb2lEZ3p0SlBSMElrQzlXNzRKNExhMnJwQTBF?=
 =?utf-8?B?dlFnSGVtNmVpbjlBRHRTTytFMlRRZWs0VVdJajRKeTJkUHFqMnc5ei8zRTVt?=
 =?utf-8?B?ZVZKaWVubVVKdGRWTXI5dk1QT2dReHlkSFRtNFQxcThUa21tUU9scWNxY2V4?=
 =?utf-8?B?cnNuVitsTmE0azM5TjgyN3c2OFpHMXFCbi8rdFdRNE03a0dPYk51SU43UUp4?=
 =?utf-8?B?bjhNeDlnM3RVUTF1a2xYaTZlYjBUTEY5czgzSVlzTWNsUDZvQTVFa2t6OUVo?=
 =?utf-8?B?Z043K3k3aWxvYXNFVzlRbW1RTlNCNWw3NDNuVnRXU29la0dSUEF6RmRHYzJU?=
 =?utf-8?B?anQ4cXVlWDdlZWsxMGNEM0NFN2tHSHhTL3FSZnRFeHdldklZa1ozaWhPOVEw?=
 =?utf-8?B?bmJTZWkyOTNjYk5uYVd6S3RFS2NNUzdYaTBQUVorblJ2Wm5jamI5Ni84NUF6?=
 =?utf-8?B?NjVmaWI0MWs0K0hBdFRubGVncWJodkNmUHhqUGdoSlh4OVQ1VXlCOVdSR0FG?=
 =?utf-8?B?MEJwaTJlaDVUU1pYSzVkVnpZSGtHLzdCaWlnVmdoVmdZWG12NUhTamxJWHda?=
 =?utf-8?B?aTVlcytuL2lUWjFybVNhK0t2dmtET093SXkvYW1yYzd6U0RGd3NuK2pqNFl3?=
 =?utf-8?B?TUVCVndUeUs5SFVWZGp4OWgwUE1ET2N1OHhTV3M4QzFCSjRneGtManBIRFJv?=
 =?utf-8?Q?X2S8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S042SktuUUVDQU1NcjFnSFVvam5wc21Yb2d4OUFYd1hFaVZkbFNvOXAyVFpH?=
 =?utf-8?B?MG0xYVZtUklzR2VKZGJUbUlYZ1Q3VzEzK1U3MzlrZTRMWldsSTltRFdxYlg2?=
 =?utf-8?B?RzF2WWQ1NjNjMFlXN0wvUGZOV1VaQndoYTFCY0g2TEYxSWZsVWRVeGZ5VEtI?=
 =?utf-8?B?YVZQRGxVUXNNbi8yN3AzM24wUkcwRzRKRDNObi8waXNFdmFydFVCVFBIbjRx?=
 =?utf-8?B?T3pkSmZkeldoSnpCTXAraHI5ZEJmeUxrdUtxVUE4ejlDU0FvN1NPMEN4RWtk?=
 =?utf-8?B?d0hWMmRkS1ZUeVQrQWw0L0ZvRERkb2NOOVNseWlOdjQ3T0kySXdWT0t1aGxR?=
 =?utf-8?B?NTRLUlJRQnhIc0ZNOVFzWkZsdXhNeklvUUNjWFlUM0MyZlZHaFhXNDM1Q2p0?=
 =?utf-8?B?dWR5MFFoRk9EWnU3eU9Udy9taXF1aTVNY3k0Mk0zV3ZvVGlubkdWelMzK1Zj?=
 =?utf-8?B?eDVBcVFsV0ZRRCtsSG9obkV3ZitROEY2YllhbGVmUGFkYk13eGFUQjBWenhD?=
 =?utf-8?B?Y25iTVlnbE5kQ2NzVlZ1d3dGbFFTZm1XUzFBazhJb2lUTG44V25aTmhiSjY3?=
 =?utf-8?B?bm5ZenR6M1BhRWJvMGw2NHRUTmxzdkJSVjJiYTQ4NVlTcjdmbnJDbnlOUFdR?=
 =?utf-8?B?QkRiZGZhaERLaEdtRmM5U0RHTFFDc21wbkhUMkUzMGhiVzZGSGhFWTFiR2FX?=
 =?utf-8?B?Z0dkT3A3amtJcTB2Uk1wSU5GMUxhNnZOTkVhN0k5WXNvbmorMjllUXIyWjUx?=
 =?utf-8?B?UmFpUlcwa3RPUTJ3amdLT1J0SFFqVndRNE5mSUVzaHIzOEdmQUJKTlV6VUNC?=
 =?utf-8?B?Z2xOWUJIV2JDbXl6ZjZ1Q0NJU2ZRMTQ2dDh4V0Z5QTc0Z3VsMnU1bnF6MVZT?=
 =?utf-8?B?NlBobFc5VVZzeGVVbW1UMER6UFNnMkFKK3ZiN04wdG5sZFFyK3JxYjVvRm5y?=
 =?utf-8?B?cC9xRVlZUyt4bFpWdDFvUzV5UDZPNXZmTWpHejBMcHdsSlR5WEFEVW04NmZE?=
 =?utf-8?B?S2ZBQ09sVU9IenNacG5Eb3V4cGdWTTBocTlQUDRnRnJhVmJhZFVkLzY1SDRR?=
 =?utf-8?B?VnhmenE5MWhiK1hOSTFNL0tTWlV3TEtKcEV1enlJa2Z0SEh6YU1uZjRKWnBQ?=
 =?utf-8?B?eXMzUzg3dmhQejdjU0JqRWZ0NEpnN2h3TFBKREV1UTBnNllYMUY0RHU2ZnpX?=
 =?utf-8?B?SEZGZ2xybWQ4aHQyYTFVa3NScDV3dDBKVVlld2NzcXo3cFJabUlibGkxL1Fh?=
 =?utf-8?B?bEQydE5uL0VUWnZCay80SkFUK2k0dTloTitGUlBxb0xHTk5iMU5BZldPYnJU?=
 =?utf-8?B?Y3F2TDRiZ1JyS0Q4RkxJZlNoUE1pN0tVSm9tdVdBeSsrNnBZdzNVcVpxdnpL?=
 =?utf-8?B?Mm03Z29XQ0xpQTlnMTVPcFVLM0o0WmI3TWpnVXNsZzkwZEErVmZhcVNqbFh1?=
 =?utf-8?B?aU80UG1Yd0NCWnIwRmg0QmJ5SHI5SkdrdGZQeXB5NTBseTllREtOQzllMTll?=
 =?utf-8?B?MUREa1NZWUxvNHRvcmEwV1V2d1o1VDIwaXZvQ0p0TkJGZXE1QVBYeG9SV1ZB?=
 =?utf-8?B?WE55RWo0OG5Bek9BaFZqWit6MnB5RVR6bGNBcFIxdWtxa3o4ZGZia0lZcnpr?=
 =?utf-8?B?ODR2ckkzVkgzWS9sbGcxT0NRTklBQkRwU1UxQmFhL3gxMDZ0Uk5IazRjN0R4?=
 =?utf-8?B?S2ZYUzdUOWVzUk96WVVoY2F4K0x6TkFJOW9WQWZYWEVyV1BwYkZQU3F6MERJ?=
 =?utf-8?B?ZUdtWjNLWUpteWU2Q3NObHcxSEpvblljYTRyTTlvdVhubHZpSitrcXZ5N2ZZ?=
 =?utf-8?B?dTRhcFpleFdocUtWT2E5NGNMbEw3S3RMYkhQMEFXTE90VjdJOVM5Y0poU2ZY?=
 =?utf-8?B?ZDNncmNwcjV4SWI3NTFkdVdsTVY5V0t5SEVjQVljaVo1OXYvVWRVS29NTTFz?=
 =?utf-8?B?SGNGVUd4aGdFQTM2STJxbGh0V2h4L0Z3U0JlNkxrNHp5cU1CelpabTU4Y3Jy?=
 =?utf-8?B?ZDNtSmtVbkxzRFY5dW5xUUxOMXRFbXdlTjZkSlFQT2t1QXdleDljZ3J3Ti9S?=
 =?utf-8?B?N0pDWWhoZzJrWTM2UnNsWEg4VGhTNDBtQzZrYVVCUGswWVlzOUkzbmdYS2R0?=
 =?utf-8?B?NXZOTTk4Z2FhSjE4bWxPTWRvMC9kWFc2SElydDU3aURFYXg2UUpUblBZOGlj?=
 =?utf-8?B?cmUzQ0NLa2lGZ3RSc1dKNGdOSWQzNEdPZWN2WDNzTWxaS2NXQURFeEp5ZDM3?=
 =?utf-8?B?SXB0czNUSTA1M3VBZUVqMDJTQ0FqbzFTZjUrQ0czTEVRNkRNZDV4TTB0eTVm?=
 =?utf-8?B?bzdtMkIxVEVUTnM4ekF4NGNlZ215YXJZVzdQb2l4SzEzb3VzTytNUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 826d255e-0d31-4f5d-9ecd-08de65998521
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:05:17.3364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcl/2FzcFII0th4Rsp9rlD9rGyHi+XO/L4Hpv/utsZSNsg4TX/FzWZ4ARpC+zWfFYGZJT7hec0nbNk9ni8XhGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6838
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
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: 02D2E100021
X-Rspamd-Action: no action



On 2/6/2026 10:53 AM, Danilo Krummrich wrote:
> On Fri Feb 6, 2026 at 4:25 PM CET, Gary Guo wrote:
>> On Fri Feb 6, 2026 at 12:41 AM GMT, Joel Fernandes wrote:
>>> diff --git a/drivers/gpu/Kconfig b/drivers/gpu/Kconfig
>>> index 22dd29cd50b5..2c3dec070645 100644
>>> --- a/drivers/gpu/Kconfig
>>> +++ b/drivers/gpu/Kconfig
>>> @@ -1,7 +1,14 @@
>>>  # SPDX-License-Identifier: GPL-2.0
>>>  
>>> +config RUST_CLIST
>>> +	bool
>>> +	depends on RUST
>>> +	help
>>> +	  Rust abstraction for interfacing with C linked lists.
>>
>> I am not sure if we need extra config entry. This is fully generic so shouldn't
>> generate any code unless there is an user.
> 
> I also don't think we need a Kconfig for this.
> 
> In any case, it shouln't be in drivers/gpu/Kconfig.

Fair point, I believe I was having trouble compiling this into the kernel crate
without warnings (I believe if !GPU_BUDDY). I'll try to drop it and see if we
can get rid of it.

> 
>>> +
>>>  config GPU_BUDDY
>>>  	bool
>>> +	select RUST_CLIST if RUST
> 
> If we will have a Kconfig for this, this belongs in the GPU buddy patch.

You mean, in the GPU buddy bindings patch right? If so, yes, I will move it there.

Thanks.

-- 
Joel Fernandes

