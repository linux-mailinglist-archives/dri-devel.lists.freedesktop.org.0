Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP2sKbK8emnZ+AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 02:49:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A209AAE14
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 02:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A4F10E2F9;
	Thu, 29 Jan 2026 01:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jPz0elCG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011006.outbound.protection.outlook.com [52.101.52.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3221210E2F9;
 Thu, 29 Jan 2026 01:49:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckI8i6ZYEhlsg56ls/Hu62Al2HRkjYng81x5ll5u5zjxe0KxM9hcD2bbwIifkUjRfkB/cIC8vt08tkO+Wp9P1G8UhPNUQfnpv6q2ZyK4vW46BeMp5ejkhOf+sbrQ9KX23wbR5pUJrehc7Z3vnUz6CkjBu3U0a8DvY2P5EvEo6RW/C/EXnbcg5Sbx3Dq0oPEwzP8PnmNt6pOPUfpbdXgwOoxFhQY42FhWZ7G0Wo10dYpHKi/6zv1dR+sdLibN4xOZm+Ii2I2RPS1L94hEpdPVEyNpbO7nqmM7/Ztjk6wEcg3jCiCW+0XfLlHT2EIpuc9UVkDFE1o0zLoDFRMZOLvooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRHOnXfnRbbUKPMpXr3o03owiOXdv1doWDazQgcdPks=;
 b=qM7jvwbzl2jAFxvqupzWG69jxr7KXFxfAaWoD/cLiAZHBBVS2aD7SnXirszI6KtvdoFrDP4rqc3O8DrGQJ8GEhTakMTgFx+0g303ZxMEzKcitnuozZuFFZCyX6clWMN6KRn4fJVrj7DIeTF+MBft7VvJX1/L+pSRuc4i299+zgQcKohWu+v0g9X4utlmdBDL4Lfl53P8HZh42wTx3p+G/EN23bnuB6xl2zsV2Gs+n8reXymCc2ZslF5/FdrRjmigQ4fQqx58rWtGp7ylMXIIgcUrP/gujNr+oSerF++okg1+oYY3m4qp+JGR6bYgdELwBK7mMba1U6R/+WfiRm4Pkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRHOnXfnRbbUKPMpXr3o03owiOXdv1doWDazQgcdPks=;
 b=jPz0elCGQOZBFCE/HjpZyg8vyDW/CbRlcIxP36ZqDTs8w6Jociqvp/4TazkwtX3wHMtiPkfRpkaWDCn4cjY5Y8hnPemmof7sLvlxrlokv4LxsBzOsWXqHpwocFUw9N3wDcGy9nqI9Oatw4VgKZT9hlwFnNh8d7adpkST2QBs7UY6tfpi4hlJMsB/kosWkx+Z7ZpR9n5GH0Xy5ODKCtbPh6LLHSypLdlOBNmXvGXiBjRj4WuOrfq/6gGNOMaIkM/+ch+4Q1GZKGIhf3WTm8SFzqH+dhMq5EmtIZnTzcGy9jISstTShrWw+31nfisQBkLttkPMb+FjX+IHfF34SVBa2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SA1PR12MB6799.namprd12.prod.outlook.com (2603:10b6:806:25b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 01:49:23 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 01:49:23 +0000
Message-ID: <051a0b2d-7fcc-4c6a-94b1-8d67334fbe3c@nvidia.com>
Date: Wed, 28 Jan 2026 20:49:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
To: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Zhi Wang <zhiw@nvidia.com>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-6-joelagnelf@nvidia.com>
 <20260121100745.2b5a58e5.zhiw@nvidia.com>
 <e186973c-ce31-405a-8bfa-dc647737a666@nvidia.com>
 <DS0PR12MB6486717785F6DD14EE1F1C46A397A@DS0PR12MB6486.namprd12.prod.outlook.com>
 <DG07HZN0PL87.X5MKDCVVYIRE@kernel.org>
 <c0a3ac65-e2e5-4b62-bc75-49b1599e160f@nvidia.com>
 <DG0MXC1R8IRS.Y5X6XDUBOGR5@kernel.org>
 <bd6fcda9-0d76-4208-b6c1-8df6f9f4616e@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <bd6fcda9-0d76-4208-b6c1-8df6f9f4616e@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0384.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::29) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SA1PR12MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: 142652ac-1864-4be3-7a59-08de5ed8a02b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjlTWnhqeWZEZmxaTG9SaUVGTDhuNmJqNVBOeW81ZWRJUURoUlRiam9YUDZv?=
 =?utf-8?B?NjRwa1NjTmdpVzNqVENTZGxmOGJiOXQweHhsOFRYUFc5cmdsMnFNQU4zSjdO?=
 =?utf-8?B?MU5OY3JvR3RLdmhpRm1WSU56aE1DenRxUVRBbmQxMjJyMW53dHQzNDQrYTNH?=
 =?utf-8?B?L0x1MFhvMUdFLzYwdUpneHZoWnpoMFhGRmRQRHVJLzR2OTJycU93RGVJcHRI?=
 =?utf-8?B?UHZ1ajk3NVNnVklQUlhQaFEwaTRwc28wZlB0ZW9iVE1IWlVsRVM0cS9GY1V5?=
 =?utf-8?B?N3hzK2JFUnAweGVBKzJYR1ZhWk5sb25iSDlNQ0xwdy9pNzBpS0FpNmRxeEVU?=
 =?utf-8?B?cGxYNVp4T1kvdHBka2VqZXJ1SXRMMWZyUXpFRGV6ZElOWHc2Y1Q4YWJxUGpM?=
 =?utf-8?B?cDN0anNac2d4bWZXeE9HYkV5dTRWcmdZMXhpQUNaTEZqckVDc2VZYjAxS2lR?=
 =?utf-8?B?WGFwUmFqSEtPZHhoeTF2Ry9lWEhJVlk3ZGs0YzRuOExYSFpRZzEybmxOQnNE?=
 =?utf-8?B?RlMzVHVYanhDUjY1ZXE0RTA4ZEpLK0h6Q0xIK05pbmsvTVg3UE9RQVFZNjB6?=
 =?utf-8?B?VWNmZEZQdkV4WGJ2Ly8zTnZTZnZwTGgzRkVHVzlZMHlMZXdrNlluMVNSejRD?=
 =?utf-8?B?Ky83LzM0VW1WYUlGOTRHU1NyNkViRGEwYlBwTmV4bjJpa1ZtYUR0NTVUYnB4?=
 =?utf-8?B?NUhiTHBVU2dlZHZ6UnE1ZnRCaXpuRTdVN0FqS1dmZ0dNVkd1dmhiemRQSVFk?=
 =?utf-8?B?YXc4dkxDbHVuZVFCTC9BbW02a1J6UE5LSEZmSUpkUzBVc3RkcWlEemIyZEcx?=
 =?utf-8?B?OUdLZUgwMFljeW9pVytvWk1IcTFIOTd1L3RuMCs4bDJUb2FpYW1ZV2g2UU5a?=
 =?utf-8?B?SkN1NU1Ha0hiaVVjeTZZd2pXN1dVZ05HajU1UlNLT2pPRjlFT1ZRNDVrRThF?=
 =?utf-8?B?eUE1OWcvVi9GNHNTZzNDV0VJendzS3VSeXJSQXliY0JWYmFKVU5yRm1NTWV4?=
 =?utf-8?B?VDZvZnoxUXRyUEE3Uytoc2xkY25ldWN1Z1NLRFp1NmdlNWY2UWExY241QTZL?=
 =?utf-8?B?Q2lKSHhwOU53NUdGLzdyTmJjMGcvQ3lxeDZ2YUNBUjZFaEJpdFZyMFp6a0Ny?=
 =?utf-8?B?UW1aNld4N2oyY2N3c1FTTXB4TXRWeU1uRVd3QnZhR0psRjhHaFQvSW1FUElr?=
 =?utf-8?B?bTJ3N1hLNk5pMWNhTW8xTVFKQm1qVEpCTU5lakwzdDYvZy9OVmlJRDVQcEhm?=
 =?utf-8?B?Unh1OXliQU51MUp2eTVyTUk0aDM3Tlg3YjVFc0hsU2dIN2xqTjJNeGVXcFk4?=
 =?utf-8?B?OG5UMEI3NlMyb1FJR05XRXZNYjRjTVJMNGh5b0lGZGNqTmJrQWJSL2d4Z3E1?=
 =?utf-8?B?ZmhkbnAvSzk0eDU3NWVIZVdHU0Ivem1MSXIvZDlnNEpxSlVScVloZFJuREdY?=
 =?utf-8?B?ZmxncWM5QUE5dEFKNE4wTjlRRHhmdDVncVhSTXJhZEQzZ2p5TFRZdVU4UlpU?=
 =?utf-8?B?RUx4RkZqQW9mMTFpWnA4N1VpSXNSdk84Zy85T1FqUjUvSU5WR1NiRVB0MTFl?=
 =?utf-8?B?bjhwSnZYUWV2RVc4UXJPRll5RFUrSVNiNXF4R2RlcGRHS1JhY2VueGV4VURz?=
 =?utf-8?B?TUxSY2pMRnFxT01ickVCb2ZZaXBFVkFuZURUc1JCKzVYeXdxNnZleXUzaTBO?=
 =?utf-8?B?OUt4dE9CRXg3OXgyZmZFNWxyNDBKYlNOK1RETjlxemhsZ1M2SXgzV0llWDFY?=
 =?utf-8?B?S0dRSEk1eHl3cTVIMHNxRHdTZlZ3YXRxd21VelRPSE5UTTB6aU1pb1BPNUph?=
 =?utf-8?B?am1UaWlFS2lxVWpxR2xnNGtqS2syRWpucEFETmpDTGdMbGR0SFF4NFNZdFVz?=
 =?utf-8?B?eXgvRWUvUm1sNlJmc2wyMnBDRzluQUwzendmUzI0a0RWelZCYzlsRzgzaU8z?=
 =?utf-8?B?dVQwb1dsQlQ5Vk5DRVBSKytuZWZxQ0szRmdNU0FMZk8xZnpNdC91VjdSZUxp?=
 =?utf-8?B?SzhoWkNVdnBuMnNDcm9lbWRXRWVFc0NHV2hwMk9CQ2FENzB1RGxabVNvK0Vm?=
 =?utf-8?B?WTIrZlRYTEtxcEhwTjkvTUhQZnNJYUNEcHorY09ZblNPazJMMTR4VEpNTVZN?=
 =?utf-8?Q?t/rs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0FqU1RaU2xVY05EQlJGSHFxcWc5SVlyZkQwNzdPdExiT3pCRnk2SXF5YXBH?=
 =?utf-8?B?cFZTbjRreFJDN2tZNjdNTXBqNzI5czVvTW5ZVzY3TzUzZ1ZMVWpVSERSdXE1?=
 =?utf-8?B?SzBZMjdQOXo4NXBieXZXbXhWU1JOVzBtWmtFdjlyRmt4dldpY01ZaWttcmxp?=
 =?utf-8?B?WCtQcmxveS9MTzUrK2NUa3JuUHhjMXNRV3dqWUk2U3N5eWR1SWZMT3YzdHhQ?=
 =?utf-8?B?WCtIUGk5KzJCYUh3eVcwTHJUZm5ndHVzck1sbG9mQVBkb0hraTJxNnY5TVpJ?=
 =?utf-8?B?em96VFZHb2hEcThpRDZRUnNKUFVhZERUWkNyWkJvMC9RWmo0UlJ6RzJRNFpF?=
 =?utf-8?B?QjhydDZGNHgzRUN6eVIwNUhORXpxbXRMSmZRRDRNbXNiaTRFTmZHMmN1WER0?=
 =?utf-8?B?cHZPdFovTmFGZmdNNk1Pbkx1REtXVnBtRVRWNWQwU28zTmFOWVVDOEhLbUN4?=
 =?utf-8?B?Mkhjai9CazBZOGZiUDVwOXp1WUxzQkwybzZ4N3NWYzBPWkVDSXF0WHc1ZzN5?=
 =?utf-8?B?eGErMkErRVFpTkFLc3J5SHpmRkZIajlseVpZV1R5S2pSSXBROUNNVnA4dmpn?=
 =?utf-8?B?NkMxdk82emlRT2RGUWN3SlZ4RVVWd2l3WTc3SFJLVWREc3NleWxVTjl3UlJE?=
 =?utf-8?B?WGh0ekt6cHViWWIycTVYUkNzOWN1Z0xITzIwVEN2dk1DUm9HTCtjc2hLVG5H?=
 =?utf-8?B?TmNQSjNjOTNzTmtkc2F4azVzemdSR1Z5di9QVzluN1VpWkVZRWFwcHcrMDRk?=
 =?utf-8?B?dHdFV3pZSGIvUFB4elRZSmRJZWxiaG0zUmxwQVRNT002ckxPcjJEdWQ3U3Y0?=
 =?utf-8?B?RHJQT3VmaDN4K0hXQkVWVDVSTDdIbGhheDloMm9FTGxSZjNoajh4NTdnUG4r?=
 =?utf-8?B?bGVCL3huOGVGRWJlOEg3bTdINDgrRkxwRHBjaE44cWFzWGhLZnBhNzM0ZjM3?=
 =?utf-8?B?YkNkalhGdzdKNDNmdTVXUnhFalVvS21leTZRZ2VVdEJWazViWXVBeVIzejBr?=
 =?utf-8?B?K0xPcUZTc1hEcDRQQTBzclQ1b2gzLzFNTGF0ZWlPNHVHb1M2Nkg2NEpzN0Nv?=
 =?utf-8?B?TXlLRTEzMDlxNUlFZTJGMEloR2h2c25EZ1oyWkxoejlrV2tqMkQ2c3h2czY3?=
 =?utf-8?B?UzdraGJ2MzhjWEludzVkd203QUNGZVptbmF0OUlPaXMrd0s0dWRHV3lBeUZ4?=
 =?utf-8?B?RGErZGFxd3IrcXIzTVEvcnQwcjd5anlaYVdsalVnTldLSENDMWRBN2doZjY0?=
 =?utf-8?B?cGtGNzB5cjhmRGQyNzR0YVNoU1owWlRZWnVjejE3RTk3M0J0SGkrMGt0eDFL?=
 =?utf-8?B?RDhBbVR1R3BvcGJDNUhRbUI2OXZocjEybExrekhZdUxiYmJYaS91NXIzQWl5?=
 =?utf-8?B?dGZtcVE5ZmFVYldFSUIxK0dQdndNNTAzNkVYREdJeEI5Tm9RckV5bFJEM2dV?=
 =?utf-8?B?ZVZwLzhnbnZ6QTFtT1QrRnNoYnBnTzZna3lXOFBiS3gydTQ2cGhHN1FreW9l?=
 =?utf-8?B?ci92R2V2ZWlUMDNTeWFtS2I4SXR4WVRtQmp3SW9XM3RvSVVxbkZxR3dvT1ZW?=
 =?utf-8?B?aUN6ckVleGNoNUR2ZzhRNis1TmZKUXZDQ3BWS0o5ZnNLcFFlNmFaS0FqZytw?=
 =?utf-8?B?QXFwVmtEQ3c3SVZqNXdkRjRHWEJWV2dBbnAwaEZzS3U1WndaWFZVVm9zblAx?=
 =?utf-8?B?R05oY1NSU0Fwa0Y3YXlNRWRUMTNHdlpLQ0E3cXI4MUE2c1BzUTMzWVBFZWIv?=
 =?utf-8?B?Y29OYUJmK1J4UE1uVzlwQW9meWZBc1A5dWdVTWp2VTQ1NmtXeU1hUHBRdFFQ?=
 =?utf-8?B?d29nTU9FZEJ0aDBtQzhLakUzUTBSUUZPL1pOemc5czhaZXpzcHdwNXhMZE5S?=
 =?utf-8?B?dWsyd1dFdHRVNGx0cUl5UHUvWnNvOHBWQ2lVZEMra3VjWVJ0bEdhVUR3Yk9X?=
 =?utf-8?B?aEpDQXMzdkpmMGZENjc3YVVuOFF5WklRM3JqSXZOVVhLbzFtZnpLazJQWi85?=
 =?utf-8?B?TkxHTS9wT1FBSE55OEgvZXhBTWJKK0hIVGFQcmtzcmxrakk5Y3dvL0hiaFBP?=
 =?utf-8?B?M2k5alZQeGYvbVJxd3N6YVcybDN6blB5WDU5NmlCRVJ4cEZmdHkxODlHNHJ0?=
 =?utf-8?B?OHRxamVHYVRFSFVDZkczVVRhYUtCWTJXWjJqajZibVcvaHE1Tmxnd2o1dlZI?=
 =?utf-8?B?Nkc4NXp3eGNvcUVqbkJRRHBsODdlaCtXbTN1L09tU0MzVTJLUWNKVVNqM096?=
 =?utf-8?B?SXRmM3pQTFp0WmZkZXRrTUFYajMyZnF5dzU0SE1VRUlNUG1FaUJzM1I5ZDR5?=
 =?utf-8?B?cmR5d2YzVnJ6K3FRVWdMSHYwTUNYVEVVS0lTSkJpNm1ZS3dVVFBuUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 142652ac-1864-4be3-7a59-08de5ed8a02b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 01:49:22.8406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/gJ/QInNGFVaRKdXfhcidU5imphh/MNLi5R0z0mJgVks5KWbRLZQfa4/SXBOpwjW1z7HA4M/BBM6JiuLZlsgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6799
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
	FREEMAIL_CC(0.00)[nvidia.com,vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,weathered-steel.dev,collabora.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 5A209AAE14
X-Rspamd-Action: no action



On 1/28/2026 8:02 PM, John Hubbard wrote:
> On 1/28/26 4:09 PM, Danilo Krummrich wrote:
>> On Wed Jan 28, 2026 at 4:27 PM CET, Joel Fernandes wrote:
>>> I will go over these concerns, just to clarify - do you mean forbidding
>>> *any* lock or do you mean only forbidding non-atomic locks? I believe we
>>> can avoid non-atomic locks completely - actually I just wrote a patch
>>> before I read this email to do just. If we are to forbid any locking at
>>> all, that might require some careful redesign to handle the above race
>>> afaics.
>>
>> It's not about the locks themselves, sleeping locks are fine too. It's about
>> holding locks that are held elsewhere when doing memory allocations that can
>> call back into MMU notifiers or the shrinker.
> 
> If you look at core kernel mm, you'll find a similar constraint: avoid
> holding any locks while allocating--unless you are in the reclaim code
> itself.
> 
> Especially when dealing with page tables.
> 
> So this is looking familiar to me and I agree with the constraint, fwiw.

Right, so similar to core kernel mm, we need to separate PT allocation from the
lock needed for PT writing. Essentially never allocating PT pages in the
dma-fence critical paths. We already have separate locks for both these (buddy
versus vmm), so it should be doable with some adjustments. I will study the
dma-fence further and revise patches. Thanks.
--
Joel Fernandes

