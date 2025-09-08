Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACB2B49682
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 19:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A621E10E57D;
	Mon,  8 Sep 2025 17:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CABbl/43";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719D410E57D;
 Mon,  8 Sep 2025 17:06:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPsHjOt8b5Ah+ogLenztF4d4ZigVxqvrxtnFkNl4DOlKfAXul/IddrneJieoVgIaxz4WgJPET5lvpHbLXPQan2nn0H9deDEKaazKbQsywD0Lu9ZZel2onrr5Q+DNrY7pSB6JV/3bOY9ZoK9aCX/uAySFCjYcBVeb59t8KkRgHQWbX57FzTyNtn67HBuoLElFzUH21e+UDIvvF3KpsKb3sEgNnQs9laY7h3d1ptBLUR/VKNmYWg+LpTVoT1c6LwzlAyA/pG2RacP3AW9/8Knz2ypxdquRBL5dX2OpYdB6sBFfdnAzG8Y5BK0oR2zBgTjdIlQZLH64++QBk8FVWo8lVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLuOiVhGX1fDuN23SRuIKwdcLbhwK8HA1GZoAjZ5C6U=;
 b=pf+9jdLdORuPXieQI88U33L15Ijge3KOFwrCnMz0fEtTiD1RQZtHwtleNmeXFAxUbT5niN0gca9pkqjKjO6gkD05xi2lY8hRq+/YIXx5xJWLxRdVfqVRUroCWY6weVCnz3UVBnen2KxxF2Co+OEKK1SQ8mn3pUAPqlc4YcV0Sowngh1KgfwNe9Ie5JuDNNx2L4BFXaWRN1FPkhbL3GcKjSTTRbXSmR/maSU+bfnAwauNTwnyaGbOi4JJWoChmCR2T1dtZcimyZcrnYYVogrfh0EK5lEvg/lTRonKBDsN8yDCGOg5/INKerwXPcLAGiLSGPtAT/zlXi/EKP/N+Nh19Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLuOiVhGX1fDuN23SRuIKwdcLbhwK8HA1GZoAjZ5C6U=;
 b=CABbl/43SddfJrUEMOLPO20HFtvXmjPekckMOlChqtDH/Q+nKb/HRwYuOGb4ck4kFAi9VD+GCMMWAsNuB/P/UsJdYGVM5IQXGDO+WrphvYyR/wOu3s8U53GxynojbRbTkEZ5R9jb8PZhc3W4EZlDuqCDhEEnhLdMkdPKQFz9djVo1BA8sTJpF1PzXBoAICkuJSrX+31FNmnnz4eE0fARP2CKEWOGn+ZCmC9ud8hJV/Z6Vxj8JLO4hm/aPOpCskIAddASluJoftP7rGWQu0W+cC5oTafFHNDnJAnzMaIyKwbcemE3Zl6uhYbfV8dVPkr0vs316sEZmYAxRYj6IDgbIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BY5PR12MB4083.namprd12.prod.outlook.com (2603:10b6:a03:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 17:06:18 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 17:06:17 +0000
Message-ID: <a2c990ff-e05c-4d09-aaeb-5a2fc16ecb77@nvidia.com>
Date: Mon, 8 Sep 2025 13:06:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] rust: Move register and bitstruct macros out of
 Nova
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-5-joelagnelf@nvidia.com>
 <CANiq72mx7NA1KD5fw98kba+3oENHW44QXVGO1VmvPPUKin2LPg@mail.gmail.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <CANiq72mx7NA1KD5fw98kba+3oENHW44QXVGO1VmvPPUKin2LPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0155.namprd03.prod.outlook.com
 (2603:10b6:208:32f::13) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BY5PR12MB4083:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a3a0237-e071-4ff2-1194-08ddeefa066b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RW9tQTJMQWxyQjR2SHRnaTdneHlXeU5RbExYRmdEbjZsbkRhNk1yS0IwNTI3?=
 =?utf-8?B?OXB1ZGtQaXZBTU5QWUVMSmpkNDQ5M2Jsa1pHVzQrN3FWMzJqRytzT0svRDFT?=
 =?utf-8?B?MDhuT3o4TnBEeGFjSHJRWFA3aVIrY096RE9YNjJ3V1VrV2Z3M2lZUVdTTXlq?=
 =?utf-8?B?NVhpOVphV3V3MDN0WkUvRURsT09nVUtURzNNWW10Z2tteGo2Q256UWZHa2J1?=
 =?utf-8?B?akdTQmVzRzFUZmtMcjZoTGNnMS83QVRpS2R3RVl1SWcwRVVJRUJ1NEVVVndJ?=
 =?utf-8?B?b3lGOG1uUHpIUTZETEdWc2M4c05FZDhDZmk4Z0EvMlAzeEpEd1ZYVFJvWnFW?=
 =?utf-8?B?eU8rOWkxb201MzIzRFk2OVhxOG5qbnJOVnZNVDRYVUlVMUNUM0x4MDNyRk83?=
 =?utf-8?B?ak8wUktRcm5WWHZHT2hvenM2K0tPbFVHRHFRNG12czc0TGx4eHpGWCtIY1dC?=
 =?utf-8?B?a3RzQzBnTjRhVlhCVU1vTmlkVFRFd2hHYzVjbWNzcTc1RDBmVFIwQ1ExSTRu?=
 =?utf-8?B?S0U3N0Rhbko2a0F5Q3c4Z1U0YWN3UlFaZGQxOE1WZHBJUjJQZDhYdjZtQmlj?=
 =?utf-8?B?bFRSdGdqK1FiSWdHOWZ2ZW1QNDE3R1luRmFHeVpCbU1oRTIzdm0veER1SWxa?=
 =?utf-8?B?Qm9iR2E0TDRnZXl4RzZDbVErdFAvZDJhTjNiT2l5VTdhZFdlVXJ5d0gzWDFD?=
 =?utf-8?B?VjVvTVpyb0ZRUTJLSHo1TXBzOVVpTld2cmd1bGhKcjlDRVFlZlZ5NnI3SkdF?=
 =?utf-8?B?UFpoaHNjRnNjaHk5bEM0dWJwc09haForbDVFTVVJdlEvNXhnZVRGMkl4WWJQ?=
 =?utf-8?B?TDlpUlBiaDcwUFN0cjRRSGxQSUlKY3JzVjlDS0FZS2FUR2ZUcCtURkhaUS9K?=
 =?utf-8?B?NTh1aWNja1BONnd2MURNVVAvbHlYaXExTjZNTWVpSWZYY0Y0czJkRnJjeWky?=
 =?utf-8?B?dnRJOStjeWg5aGhTemkrRy9sSWdKVjhmRU03OUlKVjlCRHFNQXFTOHBvU3Zh?=
 =?utf-8?B?cjZidUZEeWE5RlhZc29GK2J2K3ZnOEdpYTNhNVE0TzRhdSsvWGprTHo2TjRv?=
 =?utf-8?B?Q0RCeUlPRy9NVVZqTzVmak1FTU1iS3Q0WityOWF6eWpjK2F3c1NXRzh3MTJM?=
 =?utf-8?B?WmlYaTBoQUMra0ZkTHk3M2Q2VE1rQnA2VzUvN21JYnJUcldQby80bjlHZW9r?=
 =?utf-8?B?T0dCS2FROExqV0o3ckJ5YW1sYWxsZ3VIYmcxZkhtby9yQkFHY2F5T2dHbGcv?=
 =?utf-8?B?cWNaV1pET0llb08yL2ZNSDZWQWc1VFRTNHlybGpkbEtBSzVYQVk1TDk0UWcw?=
 =?utf-8?B?citkNDltMy9uRzZhUkVmL2J3ZkxJdG9GaWFqOHF4d2p6bHN5WWI5Y2QvUVNU?=
 =?utf-8?B?WEU1TmRjSG1YbnlnRVNwN0ZlUmNsZXg1b1Y4M0E5aXFCUEpYOGplVjZUVEYw?=
 =?utf-8?B?SThKVXJpMVN4WUEyYVhIcVduSDJxbktWaXhDK2Q2VWQ4MXQ3MUl2di9HemNW?=
 =?utf-8?B?bzlYbTdCYUZzNlJQblBKRU5FZ3pEaEx4TWhaN2x4Wm9vcTFlcWZZclhtTFJQ?=
 =?utf-8?B?NTNETmxia1F6ZHdUV2hMdVA1RE5vTGcvUjNxc1B5Q1BXY1Q4ZCtwN1BLR3ZF?=
 =?utf-8?B?eWwwWHgrRlVQMCtjRVVtWkZER0hrYnoyS3crNlpqNWJyR2laNFdabkZVaTFB?=
 =?utf-8?B?cWRNRVY3VndvdnRORlN4RGc1WGZ2SXAvOCtHQXlpRFpHVEJmNStnckVMOWpp?=
 =?utf-8?B?c2MxYnRrb29od1luNkNacEg0YStac1dRUlR6VlI5WHNSQUo1TXpBMUxiWmQw?=
 =?utf-8?B?ZHRxeG02emdKUXJiVHZ0cXIvejcrK1JmTHBKY3djbkdmYTl5blpCVTdmN2Y1?=
 =?utf-8?B?eklUWCtoM0M3eGFyOEltZEJUTWh2QktqMU9hekVmekxVYmxCamhQVXg0QVk3?=
 =?utf-8?Q?bSNa8bTiXT4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEV2dkRrcnpqODd1eEZvbTZiV1JHdFpmUzM3cG9SS1hGbUpUSjk1R1hJYmI5?=
 =?utf-8?B?cmlDTEw2V2FIcWUrSTdkZzNCWFZXNUFwMFc0d1krTm1WU2FFS3FkUmU1d3Y5?=
 =?utf-8?B?NEx0TG1qb0tzQ2VRMUxVWkM1ZmNONVZia1YzeTA2ZGE3Szg1aFUzd1VpV1F6?=
 =?utf-8?B?eGRJUFVTU09odUZveGg5UllZZzdHZjczeXRDUjVxU0JDTGJPYVRxSnB6Qk9Y?=
 =?utf-8?B?OTB2WGNBUkhFbWwrNFNPNllSc2hKTEd4ZjBwcFY3U25EYUxqU3NjYWI2WTRH?=
 =?utf-8?B?aDFpdjExYW9jTGZIYXQwUXJ6UENXWU4zVkEvRVc3K1I1WW5BZGpSR1BrZWMw?=
 =?utf-8?B?MWViVzdqclVBNzdLVnFJSWFTNnhvalNnVWZrN0JZSWZ1bXZzdG1wdnM0ZHRj?=
 =?utf-8?B?WWt4VEhzdVY3SXQveWthb1JPemxrVXFUOEh6TEF6S1RHNlRLZHg3RjFhN25K?=
 =?utf-8?B?ZVBNUUtYcWNXOWNQdDRBbEFLVEM0ZnBuZWtlMHNMUVZtbzV6WVV2T3NFMGk2?=
 =?utf-8?B?cGhXWFF0KzV0Uk53bTltMkM1WUI4WitJeW1sUDdQWUFuZmdEYjVKTWhocUZG?=
 =?utf-8?B?cGRSdHcxSWUwbmtRQVF1L2ppMnZkVUpQc2czWkFUdGFQbkk3REVoRkx5dGlq?=
 =?utf-8?B?eEltOXgyaCtQR1dVa1l5S2RLaERvdUJYM056OWlWK3JQYlVoQnFWMzJMMWlZ?=
 =?utf-8?B?K1R1SzZqcFlKWGI1bFIvbkZyc2JiWmJuZkFhOUVqeEt3Z3FmOXJEWG1vVW1r?=
 =?utf-8?B?N2NPZkpOUnlrOWdHRWF2RS9zWjduYWpZa25oU29JdFJLMk41RHU1UGt1cis4?=
 =?utf-8?B?TmlUMmRTdU15SGhDYWRpRm1kWTd4S0ZHVmVrbGZuc0FsYklsWXJldXFrNjVz?=
 =?utf-8?B?a1Y5ZStSODRuNVI3K00xM0c3V3VsUldCOVRmd3F2ZnNuL0RVVEFyNUFjRDRL?=
 =?utf-8?B?S1FrTThiWVUwRWphVEg3VDN4emhEOUlpQ1lqMTQxdFB2YlprWE0yd3pxakFp?=
 =?utf-8?B?d01QRGZwL05mYWxLdlNrQXJvK0poR2IvQjkwQzlkUVlkbGZ1cDdHcUprcFpx?=
 =?utf-8?B?ZkM0aU1WenNGN0ZaLzRkNzFFT3J0bVI3L3ZnR0FPYS9ZQ2RyRjdTQlYwYnZM?=
 =?utf-8?B?WHJEakxkWEdnM1ByMnFFWXN3R1lNeWhjVG0yZ25ZbVk3V1ZuWk80dVVWTWRV?=
 =?utf-8?B?WmtpeXZrR0NSOFJGUVBSM1NBVmJjaDdIcFRma1d4MEhydmVlcXN1em5Va21p?=
 =?utf-8?B?ZHI3WFlIbjhmNmFRak10SUo3Y1BadjFTT1pZRzVwVTlrNHdsNTZtK09KL2x3?=
 =?utf-8?B?RTZySVdKZkpRWnEzV1ZDaytydTB0OVNTT3JxUUxvenBnbzNYNHpoRTZzQVBo?=
 =?utf-8?B?R283T1lUSGp4cUNPRmkzYnFpOEtwcTFmMnlnTDdvdlNIczZVWEs4QnlycFll?=
 =?utf-8?B?RUtKZFJlTVRoWGVRUE5kakdZV1FFUVp6UVJhVzB5VHpUUzNibU9maGJmT1RQ?=
 =?utf-8?B?ZU5ZUS9wVVlQMkpOS0lUSDBTRmZCMlpzQlhaU2JhVWZlanZjVVpJTVBEaTJw?=
 =?utf-8?B?dGx4blRVRDBsT3NXdWwwbU1kT3UyV2lFUElUT1RuL1BzMTFGOFFHRCtQVzRy?=
 =?utf-8?B?WHBmSXRrRkpieUZmVGZVMUFrL1BxeHlCckRoRzlmZEFwdi8yN0pEaWx6WFpO?=
 =?utf-8?B?V1p2eGdLcjJsL2lBZ21UaEJPNkFXK0t3RXFwL29xNWI1YmlKc2ZYUVJZbUdv?=
 =?utf-8?B?Ly82Nk9pOG1IMk1VNytCTXphejA1akk0UVVRZmVjaG42SXN2a3dKV0JWWTFS?=
 =?utf-8?B?Q3hWNjNWcklkb21FS2s4dEpvSktqTDAzcXlGSFZ1RDNXc0VNd0lEaTkvVmJD?=
 =?utf-8?B?eDlhSFpybmI4eHl6VnoybyttWTV3WHN4bGJacnVxTXFjSE9ZOENrWWVUWHdk?=
 =?utf-8?B?aXZYekF5bnN3c25iNUxYUUR1OXhDTlAxUEphQVdnVHdTTUdJNmJQSVAvczZI?=
 =?utf-8?B?cHQrMnNXeTdEeHpuS3Q1cytVd3ArcDJicUdyV0tzbVBnaE03WmVrVlBMOXF4?=
 =?utf-8?B?ZTZ3TVVaN1VWVGlZSU5QcXFxbGI3NTRjdG9BYVVUWElzUXdwcVR5NlEvbW55?=
 =?utf-8?Q?RlBgAHAEC/PcgLDAghXzQkwyl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3a0237-e071-4ff2-1194-08ddeefa066b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 17:06:17.7107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n6YYPOAVfAX1RhKPBT8I6D8iPyZ/P3BBroM+1HqQzElYNx20Y2LLlzSI35/iU/D9nxetWjj9WaZ0EfsTEtr6hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4083
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



On 9/7/2025 2:14 PM, Miguel Ojeda wrote:
> Hi Joel,
> 
> I didn't check the macros, but a couple nits I noticed in this patch
> in particular given it moved it to `kernel`...
> 
> On Wed, Sep 3, 2025 at 11:54 PM Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>
>> +//! A library that provides support for defining bit fields in Rust
> 
> What about just "Support for defining bit fields in ..." or similar?
> 
>> +//! structures. Also used from things that need bitfields like register macro.

Ok, I changed it to:
"Also used from things that need bitfields like [`register!`] macro." for next
revision.

> 
> The "register macro" part sounds like it should be formatted with
> Markdown plus an intra-doc link.
> 
>> -            ::kernel::build_assert!(
>> +            build_assert!(
> 
> Is this path unqualified for some reason? Does it mean the user needs
> to have imported the prelude?

Yes, for register macro importing prelude is required (I commented more below).

> 
>> +pub use super::{bitstruct, register};
> 
> Please justify in the commit message why we want them in the prelude,
> e.g. are they expected to be common? Does it simplify some code? etc.
> 
The issue I ran into is, without adding it to prelude, the users of register!
macro will have to import both bitfield! and register! macros explictly, even
though they're only using register!. I tried to make it work without adding to
prelude, but couldn't:

  use kernel::{bitfield, register};

Also not adding it to prelude, means register! macro has to invoke bitfield with
$crate prefixed  ($crate::bitfield).

I think the prelude-way is clean, but let me know if there's any other trick I
can try.

I will also add this rationale to the commit message as you suggested.

Thanks!

 - Joel

