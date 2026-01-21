Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0L4kKR06cWnKfQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 21:42:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E0A5D789
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 21:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AB610E84B;
	Wed, 21 Jan 2026 20:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pJ8mlpjr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012010.outbound.protection.outlook.com [40.107.209.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D8510E25C;
 Wed, 21 Jan 2026 20:42:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2c6dowiGxspV05uaihdLHMAQEd8OvC+OjFyh6mThSk1bUjKml8/zd89pnEpB0PJXpMwqO3VQBrCNF5zoo3AjX0ekM9mJLk6X52CHxOsq3UaH7dKw7OlGaDX/gHGuWa5K1lK9kO1j3z9Gtb4UKbNwqJzingREciUb26DF9MRPhHOgCpRIF5hx18GcT5M30oZv5Ga/jbIMmelFte+wuTD95IAyuVH2aC5Nvk/RpGn4H7wUBKc+6qXz/y0G71udOzFBS9KFCQ6BnRVuSyosI/a7vGgYQcpfmt+ZN7cGVeP2SRTFvnzRsMxuGpsSd1SN+ZhNjp0n7Rc3+BuRdUTjjYZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9yIimd4Vs4NazgOmQmC7OLtq204HNUvG5UbFCINeVM=;
 b=vh1FkeBADq03rhWGo/WVS/k1OMfAtbmK2WR5kamR/tbACvjaf7pyHmbfGosui4BWivb79dW9J0oVt5FmGqCcdO5LKPv4tZfuX731AnltfrvVon7rP4FqpzSX5ymqt41XxD+Q53vAzHefw55mzLk38aIpcOtetL6sOyuKR75acvpt4/9yrgz5gZJCEOyWFz/W5KQjkYXyodq16aAeT+fHhSwut2pto/QOxSJT5+vd+ndwAoLlcuFrevKlHpehtPLnvEjofafkWeWSZh6ehc/JxpWI2fChiWcoXlHz4wRbS/RuaIl96omL0qIIjnw7bhEAsLUEYoaplxc/6eeiVZ4cHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9yIimd4Vs4NazgOmQmC7OLtq204HNUvG5UbFCINeVM=;
 b=pJ8mlpjrP1PshbaOyiyp9bCOxKwLxF8sJr2QeUHXjWKFWZKaJLztQelmf+xZvaGbPayFMAFUweNfAFjVX55Z6p/y5ZJJ1RxgT9qPWhm/SOK+u3oS7z1y6w7gaLhq1V+wae5kCtmbyYFTPMFDmX/KDu8c86hFxXXTKdp7o3XR3UCycTS2Il/ZdaJ9dpDrBYOI/zccEicB+j3FdBX1hf2ki2QMtTUMAzf/TX69HrPWEMGffVmZRgBoyXbmhFiA81gCbRftoPHMNwLxcjoi+gkjde/uvKPn3WIFkmyGa7h+kcIZKKtypp9jLP5KQnmuv+X6hcH5CbSANoAJYvxgNqyk4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SA1PR12MB7367.namprd12.prod.outlook.com (2603:10b6:806:2b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 20:41:57 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 20:41:57 +0000
Message-ID: <020a3944-1413-4090-a230-52a55d264dc3@nvidia.com>
Date: Wed, 21 Jan 2026 15:41:53 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 01/26] rust: clist: Add support to interface with C
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
 Zhi Wang <zhiw@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-2-joelagnelf@nvidia.com>
 <DFTTGUYGY72V.3VLVSCB2OOXIB@garyguo.net>
 <01a981f1-64c7-4504-b309-45a024258fe9@nvidia.com>
 <DFUK089V1IEU.U83YQT72BO3@garyguo.net>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DFUK089V1IEU.U83YQT72BO3@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0P222CA0018.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::19) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SA1PR12MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a51e10-7854-463e-bd7f-08de592d84cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGZ0NU1KVFY4UWwxK2ZRMGRKVmwrUy9WL0NUZ1RKUFY3NUFaMUhjSjV0cDBH?=
 =?utf-8?B?VEpFUEV0aEJDQ3lBaU5rK0lRalhSOFdDc0lhSS9YbDV6cXFOaElFNUEveElS?=
 =?utf-8?B?Q0V1bFR2aHZGN2FxdEgvR2RaQVMxZTZ4ZC9TTFpQTE9qMnZFdlRIMXBhL0FT?=
 =?utf-8?B?Vi9CZWNNZ3BtamxKWDNvYXhjeXg2NjFKQXR0RE1vclBSZndWeDM2U1FlbGpl?=
 =?utf-8?B?aVRMczRTbkpGRnluZzdsTGQ0Q05SQyszdmR0RjJHRERhUXRkL3owNHQzS1R1?=
 =?utf-8?B?RDVDRkprR2N5OGlsN1dWTVY2M01rSTg4YlNWNkNyTUN1Qjk5WVIwN2krWHdt?=
 =?utf-8?B?N2hJSSs1SUI1QnNHVTBSa3M1dHZVSVhqa3lmNUxjT1N3MUI2ZnRYOXVVK2kx?=
 =?utf-8?B?S0pWc3lEbm5vdGJxU3UwT0hqK084ekFPRVdqUWxVcmI3ZjRiKytnQm5nMFc4?=
 =?utf-8?B?d3hEd0t2TlVoQTFPak1ibXpEWkQvZ293UGFDcksyby93Qm9SNGUvZjZhKy82?=
 =?utf-8?B?R3MycExHdi9zUFFyaVhDR1NOalNUZXorMTRXUzVlekFocmdCVVJ5OEU4anJY?=
 =?utf-8?B?OTNCSXpKL29OOU9JNVNlZ0w2T0YxRFlYODJwWi9FVFR4OW9CY29VbHduUE1u?=
 =?utf-8?B?TitRZkx6aVpHTjBvM2VTRmhGV2MxaHlKbStBc3ZkQW84aGdPZXNpUE00dk9U?=
 =?utf-8?B?OElLejA1NnlETG1hMERTTkJiR0VMY2ZsRENZOGdrNm92TWpkU0E3bldmVjRx?=
 =?utf-8?B?NjRybHU5cGkydFp1Ly9nQ01SNXEwV3liSWJBY3FHV2dBWUxJRWgvRUVkc3ZG?=
 =?utf-8?B?cXB3LzRxL05nR1BOamVtMWRkb3FGSmJRZWNwUm1pajdKem0wT2RncVd6YmFF?=
 =?utf-8?B?dWhHSXBtanlVUnJaak1MelhjSW94bzZKOWxtQktBSkIwTWFKWXJiY3BodTJ5?=
 =?utf-8?B?NlhwSjhjWWdCQ1VaTXNGZFJCczRvYWRwT1hJUUV0d0RkblM0TWxSTmo1Y2Vk?=
 =?utf-8?B?cTRVWWZ6M01udXpjdGs3NTVDUVZLRktabnN0NzN0YzFIcVdiVmNuWEh5TkFW?=
 =?utf-8?B?UmxkRi85WDFlM1h6ZWpOcU9NT1IrTXFQNTlDLzIrMnNINFhQbTM1Zks1MjRl?=
 =?utf-8?B?WkxtcWFSY0VReGdDd2V2cmE5T0xZeWc0OGhMdVNGb2pYclF3aUh6VVBpbHpa?=
 =?utf-8?B?ZkJoV0FqZisyY0xOTXZYR0xFN2JBbWY4Q2gxdnJOVGh6bEczYW1nWjdYQzZj?=
 =?utf-8?B?dmpUSWl4ZkJWbzBIdHozbjcrdUNVWCs5ODBvWmdXVThQeENrb3JZTWRkU2kx?=
 =?utf-8?B?eUtjVGFSRzhNZEtaN09YKy9uekF1SnkxRVNQRCt2WlFOTjlCV2RXRWgyemVB?=
 =?utf-8?B?RTdzMXk2SklNS2d1WnFFQ1ZXcWRsUnJyekQxVzhGMnNudDNaUGIxRGdwZTBF?=
 =?utf-8?B?RWg1TzR6eTF3eVo5RlhVY3VETzZySGRLNVJxMTZoRW5xa1JVZUZyWjJRam9j?=
 =?utf-8?B?enpxMzk2WE5LbDgzdnBKMWNyL1RYVkt3eFpNZkdQRDlwMjY4WnhtY2JJaC85?=
 =?utf-8?B?bDFVY3RqSUhNckMvMmR1ZXl3UXJHN1JUZ0wrc0RvOVJzZVFCd3FLNS94akg1?=
 =?utf-8?B?cndTaVg1NG5RSFlPei9Ca1dZQndxcWpWOWUvckh6KzZGdFhSbEp5MVB1N09i?=
 =?utf-8?B?d25rOGZvRmhod2JleFpRc3ZzRFh4ZituSTJ4eHhleE8vVEVZbXNIVGNHRitp?=
 =?utf-8?B?NTB3dENFVExSTnZHT0d4eDlEanIrdnlRcnNJaE5zVmNkWUlVMG92aDZNb1pN?=
 =?utf-8?B?ZnBzMWdlR3dkRmNYOXlnb1QzMUJrS0dVL1doZGxEREVQc1BPUDdlQ1FOZjR3?=
 =?utf-8?B?K0QxRHlqMEZISExYVTBkUmdVQ2NObnBPV2s0ZEV0STZzU2FRNS9JbWhxRTNa?=
 =?utf-8?B?dUM2MFY4NEwzMkxSeHYyVEpMczBVam9OREdqaFFDZ2FNb0trZ2Y5SkpYcC9T?=
 =?utf-8?B?YWRnK0NkODAwNGpmMHhyNWxZeW9ydGRIZXdSRDZGUmJhZFlodVNGejZyWGE3?=
 =?utf-8?B?Ullqd0ZnOHVEWmlPcDV0L3cxR2huQ0hmaWlZbnBHTzM3TEM4U0tBNWlCUFNX?=
 =?utf-8?Q?VI1I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUUwdkQ4UHVHU29TOWN5cTMrWExlVytoazI3eEtNMUlpM0cxYkl4MWZuRVRX?=
 =?utf-8?B?NWs0T01jeFZIMzVubXlheVZGNk9GY2lrRGJwSlFyMERXZ1BlRCthU0ZjOU0r?=
 =?utf-8?B?Q2hpSnVraFdCbnVGalFyN3oyWStXNWRlNVNhT21OT1VxZnZyZGhLajFmR1pR?=
 =?utf-8?B?Q1BTMHVCaElqYUV5V0VsSHZ1L2lWbExseU5xNzN3cWJ0NnhFVHBNZEVxNEJa?=
 =?utf-8?B?NDJMRHo5U0IydEtoWWFPL2tLWGo5OTFUN3VWS0tsZ3hWcXNoUWw3SFN0eWdD?=
 =?utf-8?B?SVJ6cmZhVmhsdnExQnlMQ1dBQTBCaVQ5NWFXT2lvUmxSTThOenlveGNpZHRh?=
 =?utf-8?B?ZjZIOGFJWC91VVhWSVRheGhIbGxSQ3Q4NUJseHhpQ1JoWEY1bnFJVVpkK0Np?=
 =?utf-8?B?M0UyQ095a2JLalk3TlhEcEtNNTlKNU1mUGtSWWd0bEYvU0hlMU93TkxoZ1pL?=
 =?utf-8?B?RXdPUzYyZ09qN21yL25oZTk2UFlYeVZWY05VMDJDems0a1daanVGZ3l2WGVP?=
 =?utf-8?B?d1pyWDNHb3ZiZFFaVzlrTFZrdnlPSyt6dFdra3NXdHZWazRNeE1MaTlyYWpv?=
 =?utf-8?B?ZUJsRU1HaE5XZEtBMkxrckRrK1o2NkdQVDVjaXNqbEh1VVNPb25uMFZHaG9E?=
 =?utf-8?B?K2dKL2JnTi93dmdWQ2Foa3NIUVRxZmVPNkZjNVpkanYrbU5pNXZGRWUrSnlG?=
 =?utf-8?B?VnZXS1RyNXdpenp3VGx2R2VYaVlRWGVtVGlkL2RLaCt2V1hIcVY5MU9Gbkk0?=
 =?utf-8?B?dmVwQ0JHUlc2VU90amdnV21Mblc3Z3Z4L2FjeWRsMlJUV01tNlZjWm1oWTBk?=
 =?utf-8?B?ZW9mSlRlUEl5dmZuV3JyNy9MaVgwUkZ3dnNoYmpXYWw3aUI4SGhtUkFWT1Q0?=
 =?utf-8?B?WVIxZ05GOWNDc2F0ZThveTh0c25mVll5WG14S3F4K2tWRzJ6UlpXRVM5RGFH?=
 =?utf-8?B?TDlJMUR1bjRqWmJpWEZYd2UzOWo5RC9ScGNOenhmSU5seUFqa0tWamZSNE1Y?=
 =?utf-8?B?YmFDNnFPazBHYjZLZHA0c3gxalNrWG5mUkZhbWZTajZteGFtS3hWSHpkRDhl?=
 =?utf-8?B?RjRuQkVBVUlYSjhHV0NLQ2dCb1hBYk1BQ3JLajRaaitSV1FjbjQwd0NvQTQ3?=
 =?utf-8?B?R1EwQittWCtXRmIvcXNObGxCY0cvc2JSOG10bUtPV1NxUkQ3TXcrUUVueXpY?=
 =?utf-8?B?OHlpKzRRYWZPSFhjRkRVbDIxWTBKQ1pwM0Q5TDVNNTRRYlFwOEZMN2RhVjBj?=
 =?utf-8?B?R3VvWmg3OHNsNmNUVkF3Tkk4akpCcDBqbzVqb3VRdlhsK3NQUHU4dHMvTk9R?=
 =?utf-8?B?RDdVVkVOSlY5amsrbHJVMWdzMUp3NG1UeitwaWpsS0JvdVhxVXpzV2p5MVlq?=
 =?utf-8?B?QlUvaFB4dnBOZSs4bjhodW9STVZmNnE3MVE4Nkw3RlZwSEg2SFJxVmJiSGJq?=
 =?utf-8?B?OHBwWG5xSmJLU3p6a3BobWFiYnhOUjZIN1JsOUwzMWd2UUpEdFJ5U2JLU1Y2?=
 =?utf-8?B?dC9QT1NENEo3TURjYnhhWmRuOXhXMmtUVE5FOWV5T01aN1NnTWRGTFI2NFhL?=
 =?utf-8?B?T01naDZXUjBEWDFESko3VWpJWklhK0ROVTM4cHJueHJVblpyc0s5ZzAwYTNh?=
 =?utf-8?B?UkFEanpSZW1LWkptdmtzQTFOcTJnTHBycnBRYjFTVkpLMWFIWUdqN3ljbzJE?=
 =?utf-8?B?dHVza0pKSWVUM2gxL01vN2NvcEdXdmRHaXpNeVI1bk9MS0lwbjZiSXBLNGwx?=
 =?utf-8?B?MzZQMzhMM0daZytXUDlzRm9NckRvcUp1SVgwaHVySHQ5dUoxdlZURGY5MHNS?=
 =?utf-8?B?WjFVdS94LzVYVlA4UXNBS2JEK1pjWnFlWXB2Z0JJdVlQdjlOaDZETmk0T2t4?=
 =?utf-8?B?TXVZc0p0bDJtbm9XcTgyWDlLQlkzcjNkQnpKakVGcWpOWVFvUStCUWRaeXFX?=
 =?utf-8?B?b2RGWm15YTg4YkhFK20wZEZ2OFdjQlNqZDNuK0x0VUZNaWI0d2hJRVFUeGIv?=
 =?utf-8?B?bmpVY2pCd0NXTkxrU3pqT2J2R0RJKzJRdndONVVxR3ZlVnNFelZ2eHNWYUpr?=
 =?utf-8?B?QzNpb3J5ZzdEM1NpS2pmWDMzbnpGeUtyZnJsTG9xSUgzMVAxTFlFblczQTJX?=
 =?utf-8?B?SFJ6b3pmTnhXOFNwdUFIb1RXV25qMnJZNnUva1VmaGpadmJmdWhrbGNHSlA3?=
 =?utf-8?B?dFowQ3hvS2VQK3Q5ektmeGk0NTgzZXdIZGpvRGk2VDZMUVVvSG1HbUVVS04v?=
 =?utf-8?B?bkQ4SW80OTdVeTJSNjluS1ZFNFl2dGJ6ai9jU0Z4ZThMTFRVSGdtNzZoVTZL?=
 =?utf-8?B?d1JKejVEa3V1anhVNVAwazlNWWRHR1l4Mkd2Mkp3SGtGVmNuU3Fxdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a51e10-7854-463e-bd7f-08de592d84cc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 20:41:57.3448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDXBRDxcBIcpdd+CG+K7hM9j/g885mCCvJhi63+dMKYy1Xk8egdaES+NLStjrn1gSbPgdzQWyrrOWRORmCe+Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7367
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
	RCPT_COUNT_GT_50(0.00)[51];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:mid]
X-Rspamd-Queue-Id: 11E0A5D789
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 1/21/2026 3:36 PM, Gary Guo wrote:
>> There are 2 users:
>>
>>     pub fn try_init<E>(
>>
>> and the self-tests:
> This is not really a public user. It's hidden in the doc test too, you could
> initialize using try_init too.
> 
>> //! # let head = head.as_mut_ptr();
>> //! # // SAFETY: head and all the items are test objects allocated in [..]
>> //! # unsafe { init_list_head(head) };
>> //! #

True, but if we initialize purely within try_init() without using a helper, does
that not defeat the argument of adding a separate INIT_LIST_HEAD helper such
that we don't deviate from the C side?

Regarding your other comment about the try_init block itself, I will take a look
at your suggestion and see if I can simplify.

-- 
Joel Fernandes

