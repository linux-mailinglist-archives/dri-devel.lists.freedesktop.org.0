Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yObaKty8jGmisgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 18:31:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429481269E7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 18:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36CC10E637;
	Wed, 11 Feb 2026 17:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YJBuM2nV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011035.outbound.protection.outlook.com [52.101.62.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2244310E06E;
 Wed, 11 Feb 2026 17:31:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkaWXBMs91LRKeX0kh8zj7ys/Pq7NKpRN0fMMBjbNy47hCJPQsvuIA9LZ1caPcDlk0gqvC50SSVacHTNnZF3TOTcgPBA758OpJfzjHqTgw5OGHY2Lfj8Fwk5lUOSNEZgXXXZ/hKND9HEtxQsHbY2+cnrnzlxVPxrzLD/hsAUr5lYkwU96IP0O565Lp2HBdpvtDKYochhNf37v3kNlZOiuRa62DtP5lBubRfdmVK22ienW64NEbJ9BdeRTvSnKj49j/VxAk81z67TfpvwxLlN/hiHCjrXLswGd/4J24E4wgDSrckrDVmIZp0NNPKRJWX972y7Jr8JWNmpDOffRNdvfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcAdl4WMt5bvAy8bC9tV9sNdNSiBPbZLlYn75QcI95Q=;
 b=KAOceFGbx44GaVNzoys6aFn6Q+4t4v/7eEHPL+kQwmkB74hP3bmG/Guo6MP+Uf8jpjUQ7KOn6LE1vY3qVvC5mB+CEIu0TGF/Q7eb4SiLw6Jm92ViipEvRyrYXRMG5Pov71tWMQe8PwmSYxhikwbqX8rOSEVTigBUnsrG00Aikl2novijBSeStkQWocmCRO4jMmQhNRmLvprDEw052DInU84HtnVmdrPpuxmeiwkD65Vm4bbcFiHnuFYVpSmn1Cuvp6828yt8fMGHv6TWrosuf74Gq/rypKWOEtmXFzT0ZaxbUnDY4NTOx6Vo0Jav+RqtT6LcXwBgZb7bqqAx8K/tDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcAdl4WMt5bvAy8bC9tV9sNdNSiBPbZLlYn75QcI95Q=;
 b=YJBuM2nVnSLtGZOcCUZwgWBT+nGUjrHhpzy9ocTrvV9reS3eRKTu76X03f1tX5HnQtPLHqN7Nv6DGcH5dlMiPB9eyOBySSBtQa1cNMDgM6jnTrfzrPnMgfPQt6yj22EsfZWWD/7XORFHoVF/BQwMRxaKIQwvHG8IbNYtvrp7B+087k8bfcWKCp7gwzLZoQlC7jQyflIcD0i85mGGik4xF6X+2+n6RU6NDyACAqKAFOh2o+1b/LMff23jKdUOe++4ZXxNB8ep6rP6dORHUnJeYGjI70RtwgWW5ujwU96/7KRCrXeaI92AmDYpvl5jHO8xOTvApWS6U/mBkvY2/l1B8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SA3PR12MB9180.namprd12.prod.outlook.com (2603:10b6:806:39b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 17:30:54 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 17:30:53 +0000
Message-ID: <79a18ee5-4746-4b4d-84ab-88f0d4010523@nvidia.com>
Date: Wed, 11 Feb 2026 12:30:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v9 0/3] rust: Add CList and GPU buddy allocator
 bindings
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
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
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 David Airlie <airlied@gmail.com>, Edwin Peer <epeer@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20260210233204.790524-1-joelagnelf@nvidia.com>
 <DGC0RDIBDEYB.195QJ6S6GF9WL@kernel.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DGC0RDIBDEYB.195QJ6S6GF9WL@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR11CA0029.namprd11.prod.outlook.com
 (2603:10b6:208:23b::34) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SA3PR12MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: d9eef77b-075d-473d-e7c9-08de69934e64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkF2Rlg0T3pZWkZjL0FDaFVReFhBMjNRbFg0bzFKb0FMSC95cUIzcUlhbWo0?=
 =?utf-8?B?NXppQzJoOEhXV2pMNktDOGhGSHgrdlZBOXVlc1lHTVowL05oQzdxNGhvYWw4?=
 =?utf-8?B?d0gybU8zNU1VU0pHZ1h0Q2dGUGRXb2o5YnhyRmd2Y0l3L3J6WXhHOXgvZ2tZ?=
 =?utf-8?B?K3d5QThSbGxkT2pRNU5LK0ZiRE9BYnJLRGtHRFZRUXhWUWJ2QXA5SEt0VDJN?=
 =?utf-8?B?N1pxaHlYQ3E2WUZYRnJPYkk3ekRYL0xDK3hIMW5jUTlkeUEwMlhhSUI0cUVZ?=
 =?utf-8?B?bVcwazJITzZqREhSbHNGZ0FXeG9MM0dlNklSUkRMLzY2ejgwNFVTOEowYjg3?=
 =?utf-8?B?NWp2c2JVaU1WblN4aWhDZUNBYzBCR1ZwZ1FlWlhyUG16RHJlT3VyMEZkQ08y?=
 =?utf-8?B?ZlAreVlJb1BYK0tKbjdaQ3kyc2VCMlJRMWtBS2VJRm4yeERRcmdybWdsYTUw?=
 =?utf-8?B?RHpQekNjMVFVcW9aY0ZWc0xmSmMxYzBVeExBNkoxNnh4N3o5MXBCMkZQWnhy?=
 =?utf-8?B?blZhUE56OU9DR0R0N2hoU2lpT2R5dFNuTDVTeG5NWTN0NlU3SzNNRVh5N092?=
 =?utf-8?B?TG9KemFjS1BpWk5wVzhPS0VwOWJpOEtRVGYvTmlzSkVBWlJGTTBBU2pFM3Z0?=
 =?utf-8?B?a1dJSHlqWTliTVpkVlJjL2t1TXlwUDR4TE5CRHdwUnBMcUJ4ekJhMVJDMDA2?=
 =?utf-8?B?aUdlM1VFREhnVlpqOW5qY3RBMURqdUtkbmQ4TFo1QWJabm43SFN3TG5KUk5x?=
 =?utf-8?B?akRpV1Qzd3BZTVJzZ29CVWs3d081d0xwV09UdXJxSkM1QWtleHhEdVFrQnVl?=
 =?utf-8?B?ckxoZVJWdkorMmptUVhjR3ZaU1VRQTM4RkcrL2lvZ3NIaUI4TXNyK1UxUGJq?=
 =?utf-8?B?ODRLSlFnZVNaSnlOc281a1pnVTNmK25HNnMxbTdVa09DbHkrbk1hZi9NY2p6?=
 =?utf-8?B?SlVWUWxqY29VcndockY5Q2VIVGo1S3djUVlZd0JCc2VnbmNvNnpxRVEzSlA3?=
 =?utf-8?B?anZRUTFOTGY0UmxDaUl0K0FFbkZlV1lyR20zT1o1Rm1sVUdOR05zL1NYcFlW?=
 =?utf-8?B?dVlBanE1YWlaVUsyYkZ4cXdmSm91WGs3N0d5N3hoYjZEWTh3TGMzOVpXM0x5?=
 =?utf-8?B?cGtaNlV1NURBSC9jT29uRDFGbkQ2bC8vc0tDZlVRZ1IyM1N1eVNkU1l5cGp2?=
 =?utf-8?B?ZGxrUlJicWRSaEptTzJhZkp6WG9HUXlXYlVoV2RKZFVFTFdKblM5TzVRVkpB?=
 =?utf-8?B?OEtCMlJMbWoxczFlb0QweGk3M3NqdktpMTlUclIyVGRPVzVZSnlRcWdiMTRH?=
 =?utf-8?B?ZkVLbGF3K1NTQyt6UTdNTXdoaHVhbDRFK0trN0dLNDRtQ2FJSkR6Q3ZCaGt4?=
 =?utf-8?B?RG9rd2VEWEJTZ0p0K3VTREFKL0RNZ20zclp2c3dqcUhBOThmRG9vdTI4OTdu?=
 =?utf-8?B?MnJNNDYxY3c2akR3c0V1bmJWNmRCVnB0S0FnVkJDU2x5YzlxaW9hWXI4Mlph?=
 =?utf-8?B?OXczYVFUK2dxTkJSSWZhUmdxRVZsU05ocGxnM1BDYlc4Q24veUg1Z3NhVTIw?=
 =?utf-8?B?eUNzbnNzNnRKaHJIbnhVdFNqb3g0Y2JrbzUwbHNjYTNkZ01vRFBoeWkwUjUx?=
 =?utf-8?B?R2VvRStWSmhySkhtaEhFTi9tb1UyOUFDOTErSDZkNGRCQm1OOWp3YmpJdktU?=
 =?utf-8?B?d1cwcDBNaGcrMDVSRndGaTREM0swMk9jOFB6eERYbFlvckVnbjRmOFdpS0Rv?=
 =?utf-8?B?VTB0bVFOM0pZK0ZXMjIyWkNkaGpCdmE3b2pvUEg0Q2hZYkQ2VnFOMUN4dGlp?=
 =?utf-8?B?QlNXTU5zYW9sTllzVXZQWmVtSnlHT3Z1YkJMbkZnZWwvWkV3WU1wNGJyYkdK?=
 =?utf-8?B?alcwNU5QTTBONCsxUjFIZzRacU1ZemZveHJKeGlDS29lb1Q0RUNoUEl2eFJB?=
 =?utf-8?B?NXBnWHFGNmNmMzU2Y2xPOW03M01GYlpKckNHS1ZlczNrcVlqZ2M0OFJ6b1Zq?=
 =?utf-8?B?QUE0T1RFT3ByN2tKV3FQOE5LbFpxeUNLeWRsRkJZNGNHdHlIdUxSWmZsYkg3?=
 =?utf-8?B?RitmSXhaN3hMb24vMUNvVnFHVkc4N2JpbGVjSmJOTmZRSFE5THRuWnhUM1d2?=
 =?utf-8?Q?c0c8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHVIbmpXV0FETlVjTExTRGxpWFFXaC8wM1VDTytnTEY4MmNKQVQvL2dXWFd0?=
 =?utf-8?B?Z2k3SGVDTllQUzhJaUdZOHBUazBVY3ZOM3Zoa1FHSXdaN3UyUitBWDJ3ZzhE?=
 =?utf-8?B?cGd4UFRqeWpwU1BHUTdnTzBvWVArZFNla3Z3My9GcndYSkxudmtlMTFvQ3h1?=
 =?utf-8?B?RkJnSG1mOVdjcUcyU0VOZDFPOTlBc1E1NG8xRHdhTFpwUDFXNHhNVmxmdTlr?=
 =?utf-8?B?VTdpVmxFZEgwdlR4dXI3dGR6RU91MndxMWJQdzB3OG5hRThRSUYvQXJ2S05M?=
 =?utf-8?B?VmxjMDBzVzdZR2dTZS9ua1BBMC9iTFpibUdSQnlIVS9EblFhdDFabkxuZVB6?=
 =?utf-8?B?cWdyQ2dScmZFY1h6TGs0ajBncXR6NmVGTXo1d0x3bGVTU3BPRXhrYVE0VE1X?=
 =?utf-8?B?eXZRMGhjcUdGOEMzQTBvVUQrYWhMQjBJaVh6WGxjbGlGd01MalV6WjIrM2gx?=
 =?utf-8?B?RjBYR2g3RXF5Y2RFU3dZekhVTitCQ3pldXVyN2UvenNZMkJYbkoxbklOd1JT?=
 =?utf-8?B?Yk5acGxVb2RaUWRVZVpiT1p0M05sSzFQaFZUOG5Rb0pHWkYwZC9BL1BjRHVa?=
 =?utf-8?B?a2JkZDltTFVhOWI1RFh6OU1qYXlIa2JXNUFKd01TcmJ1ZFd2OGxOd3VaSHlO?=
 =?utf-8?B?MjBzemJIWC9MNGZCVjBzNVd4TThXekw0cFk5YTYybW00TkpoOXczRFVpY1pU?=
 =?utf-8?B?Rk9sZ3hvQTB2cVZ4emRvTWlmYUNOa25QU2UyQlhraHdOOEIybmJRRzc4alRI?=
 =?utf-8?B?SXVHNWp3S3JuTWYzUEt3U1FrYzZlNERLakRUUzVLQVBSamMya3VmSWZnYXRl?=
 =?utf-8?B?eTdEN0QzSG5sU2lZS3ZCRmJDeCtVQTdYR0sxUDFaOUhlOVRZNzY3UzhXOG00?=
 =?utf-8?B?K2NMekV4YklwOUZ1MkNNWGhOWENNMXJvV0J4ZmE2VHk2VmVHRG9TbnQ4TjE5?=
 =?utf-8?B?bkFOdGtMV2c1Y2NEM1FpSW9YZWQvcWdUOWMxeDY5V3VpQktmU1RLQThXZ0RX?=
 =?utf-8?B?QTdoc3ZNalQ4bDRSYllLeTVEamZJYTh2MFF6SkZvSHp6aDJwdHg3bE1PaWlG?=
 =?utf-8?B?UlVRU1Y0SFowdDBjbmhySXdUZU9PY3RiMGpFLzY0MEcrZ0JHRDAwL0V3UmdZ?=
 =?utf-8?B?ZnlqTGR3NUxaV2FGMWV1MFh2eW9hdXlHTXU3Rk05cFQyb3I3Q0hyR0o5NVBK?=
 =?utf-8?B?UUl6ak1OQ0pxdjhHaU5ZN1JHSmtUMEtQZkNkVkgxbnpFWjJHaDZxV2xsY1dw?=
 =?utf-8?B?TWdRb3JMd3pGc2F5VGk5ajZWQ0lQQkE3eVo3VHFPei81VHBpbFRSMGpoYWww?=
 =?utf-8?B?dmhJM2kzWTgrekpsTE9WWHdROTVIS0ZjZ2Rla3JGNjdXWFVsS2VoUXdLcmh5?=
 =?utf-8?B?aG9qS3ZuNWFmcW8wbitPVWI2U25OVnhNd1RuN2ZMcWxwc2hhcWVveVpUaTFT?=
 =?utf-8?B?NnpaOFZkbGNnVHpIVG5lR1VlcGpDMi9BWkl5K1Vxa3lkbWh1ZzIveVFkVkkw?=
 =?utf-8?B?TWg0a1BlVFE5dUIwamRBUmEwQ3VwTGYxK3J0Q0FEQVpNRHFBTG9FTHY3TWtL?=
 =?utf-8?B?bkRtWkxPYUxhdDV2N2xXdlQ0MmFyMkh4REE1dWNyRGpZdG5QNTdDVjIxWExh?=
 =?utf-8?B?TFhKQUY1RTd3aTB1MERTdXIwN1Z4KzVRaXoxeDZTQVJLQUdoVm8xSWpXRzY5?=
 =?utf-8?B?cG82U29hVW5YYVhSajVXVllBSXVpZm9JV01uUktIckszNlc2eEZpSFg0MXVq?=
 =?utf-8?B?MUxQLzU0YXNQK2pha0tpYVhjcnBiTDZHaDZoVFZWK3JmU0FJc2t0RWI4ZGRu?=
 =?utf-8?B?ajc2RVRNS0NwR2tyeldTeUNEOXJGRTJ4b3pxMjlEaXNBWmFqOGc0MEVzdG94?=
 =?utf-8?B?b0lHSjJ0VytNR1dDMWNZcXVTa01PcGY2eWx4NmIrSlR3T1MzMTZWT2g3NFhP?=
 =?utf-8?B?ZlpZUVdCbCthOEthZEhmVk94eXRDKzZXY05mSE1nRDN0cmxZWTJJM2FiWlUz?=
 =?utf-8?B?N1NwK1B4ZlNzUGZVaHdiUnl2d0tSQnhHSDgvcUhBSS9vRmZLS1dLU1Y3VXpW?=
 =?utf-8?B?Y3BpZmtBMEQyUUpkM0pzbFh5dGd6b0NteGhtaFB3OGF6ZklZUzZvM3IxQ0Nl?=
 =?utf-8?B?VkZrYVUrODE3dTYrbk9SeDFaZTg2M2VRYy9UOUNvbTFoVU9QUUlqSTI4STNC?=
 =?utf-8?B?b1JNNVc3eE84WWNNRWo1YUEyazlHQzZNOVZCcmRWRnFqa0VZSEpDTDNFMEwr?=
 =?utf-8?B?QzM5VTZnNFVWMGkvZytMVnhFb2lGSVFiVzRDOHJjYW1PRGh4UUtzRVBzMVky?=
 =?utf-8?B?MFZhUXEvU3RDMitFQVRIRFZjNjFIVWQ3TlJhZHZjaEF4bnVMNG1lUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9eef77b-075d-473d-e7c9-08de69934e64
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 17:30:53.1189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/0qpuW+Z6ZIFbjwuR8kLuuOCW7vKISmhaJqWdO5o9ApWvFTjwc+tSh+7lyFUSVywAPOeJsCNY1y9RhSkYeCGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9180
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 429481269E7
X-Rspamd-Action: no action



On 2/11/2026 4:19 AM, Danilo Krummrich wrote:
> On Wed Feb 11, 2026 at 12:32 AM CET, Joel Fernandes wrote:
>> Link to v8: https://lore.kernel.org/all/20260209214246.2783990-1-joelagnelf@nvidia.com/
>> Link to v7: https://lore.kernel.org/all/20260206004110.1914814-1-joelagnelf@nvidia.com/
> 
> I already asked about this in [1], can you please add a changlog to your series?

Sure, I will do that. My bad. (I did include good cover-letters in earlier
series, but missed on this one). Thanks for pointing it out.

--
Joel Fernandes

