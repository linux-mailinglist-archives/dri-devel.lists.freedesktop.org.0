Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBs3B10NfGkEKQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 02:46:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38549B63EE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 02:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5555A10E0BA;
	Fri, 30 Jan 2026 01:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RfXlfAQs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012010.outbound.protection.outlook.com [52.101.53.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6934E10E0BA;
 Fri, 30 Jan 2026 01:45:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkrcecpAKRN/pcJfkJir/NOnsC25oVQvjHIel5dc/XND+OphAq8M15U3AbhmMkaLEvzjRUIxEo7JnlS1jqy0/0HEH7fyP0M1p2wWqOVIKwrX6BbW5N3v4GuLFq1YaWfcpLCSvc31eZrhsZU/3parlFR5ztaCdaFyzVocdZrTZjWmOstrBstgTPGE/HjsolDtowpu1QPBSm8Dr6pVDmqtVCRMJqJDXb4gfyVJfrnWAufrZdtQIgDJj5Wh38tDVcy6fu5VG7Y99+GDddPF3ToRNL9MS+Jl775Hmus1W8XmlLMJlZWOXZqW55kHpkedRnTC/3rGlYjf06Qde+c2NCbOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BMBc88TCoTVBqA9JyV/AA99hZkHF9Xxsdkz1NYrl6E=;
 b=UyfgT1Wr8Uxx65mqJkgikc239b0cbYbDzXjHkl01Q1UceYsa3hKP5Cs9flNWzcRxea9MP606iii89oc9mRTe8oqIu+ISpzZNYzzzpIbCT4qqT9ewpwzbxVXVJak7V+/LXoFfur6pMuNTxLx8J24qWueDo4m3TSQmS0CW/fLdo8k8IwMkHHkPC6xZqcQzCtPsWXM4qooE9Q7E5iU48C6DoCJ2XiAQ6d1sHer+sbjTUzoIj83QUn8hRkmS9BaWfqDD5p2clexdqJJKWGONyB2/XdZyE+XsqlE9m5Kju2piOWMUINvjbH3JAms8hOlkfLrDA/qpfq7jEO+rDpMwCsnhzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BMBc88TCoTVBqA9JyV/AA99hZkHF9Xxsdkz1NYrl6E=;
 b=RfXlfAQs4kOusskdiKcS0OGdaspEgQIVsahNQCuouwq43vI1YlNFjWbfpqaO5Qei2SMirA8EmUDw3smgIWPabMAiMGmJHNthMPotQSOO8Kcwncv74UMqigokDbt3IIBUOoNZ2obk4RT+MXS3fbmTNvyhSURfk9LEQ+vmSGRIoU42ctQxZZ0paVUd8gwhnFanxk9CUwHmS4dOTgkjo/aGqxOXqrd6dynuocTrbFzHxcjnEqEnTKWe+0uEakr8NQV5oA/9riHzb0WaXAj+S5c+a4nmhLNTZmBeha0USnx0dsosb17X09V7McvsA78z9nJxLr6yqlb3Qc/I8/T2QUgMpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 BY5PR12MB4307.namprd12.prod.outlook.com (2603:10b6:a03:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 01:45:53 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9564.007; Fri, 30 Jan 2026
 01:45:53 +0000
Date: Thu, 29 Jan 2026 20:45:51 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Zhi Wang <zhiw@nvidia.com>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Vivi Rodrigo <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rui Huang <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Alexey Ivanov <alexeyi@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
Message-ID: <1769737351.3442.2180@nvidia.com>
References: <DG1IZ8T0FFM2.2WTUZ3AESF9RD@garyguo.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DG1IZ8T0FFM2.2WTUZ3AESF9RD@garyguo.net>
X-ClientProxiedBy: MN2PR17CA0019.namprd17.prod.outlook.com
 (2603:10b6:208:15e::32) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|BY5PR12MB4307:EE_
X-MS-Office365-Filtering-Correlation-Id: 07792530-52ed-4ed1-3799-08de5fa14d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RERuc3c0STJMdTYrcnFoZ1MyMUgvUWRaaFNISjgyY1pwcisvS0pmb1E0NEY4?=
 =?utf-8?B?WGV6VlhPSTN2Q2xpR2laUkxrY3BDTWxDRXZyMU1XalpxeElTcTIrZkNpTGZV?=
 =?utf-8?B?dUtDR0FSMUd2aFk2WWowdUoxL2FDWncwWmRIdW5rOXZGUERFdTVCa1FNei81?=
 =?utf-8?B?Ui96eUFidDZFeGxuRzlWWWhEWFBsUHppbi9tR2pRSndveWFQMUhFQlNuSjVM?=
 =?utf-8?B?dHBEOGY4Z0c2eXNZcE5kVWdJNll3TnZTSmtyZm1LVXNXRmZBVWVVRVAzNjhy?=
 =?utf-8?B?UzYzbCt5UGJCRnlQdTl1RG1kRlRyelhOZVJSQjdtM0FPTldGU3pJZTBXeDNL?=
 =?utf-8?B?UmdSdWdJVVo0ci9Vbzk0QWd6a0VCQmVmVW9QVExDUEJpdjJzai9pZk1OTUVt?=
 =?utf-8?B?ejZGL3pmU01FNEhBZVR5UGwxVHkwU3lRTjBRNkYwSE14UWlXcjBGRU9wY1d5?=
 =?utf-8?B?OUo5aTdEWnNFRDd2cHJrQnJqN0pnK28rQ2RsWWlXbndWOGRiVVp3NjYyNzBT?=
 =?utf-8?B?MEpmRUFrbWtJeGF2bXV1SEN2N0twellDbndtMVVpSUNpWjhkdWxXSldTZnBW?=
 =?utf-8?B?cTByMFBOT0ZOeVA3ei9BSUVtSUxuMnNYaVYyL0RHZlF0bHE5S09wRGx6R0U1?=
 =?utf-8?B?cjRNNytYQ2hBd0plNXViNjBCa3J5WDdBQWI5RVQrdmlWK3g4N29ZNWRteTk0?=
 =?utf-8?B?QXJ5MEZQUDZ1bzAwQU0xVklSK1RSNHo3TUVWTGVBUmdWdGJwaVROQlk0dno4?=
 =?utf-8?B?SkQyQnArYklEeTNEUnZkRUF0d0FZREFzM0VpREVuZ2IxVjZEUHRGQ3RjMmFm?=
 =?utf-8?B?ZE5xdmsrcDgzU3lsTFNQMVhRRW9EOUgvbkFLZU52NmY2Rld4Z0ZGOVJnMkNr?=
 =?utf-8?B?RS9ER0t5d2QxT1JIbDkrbWFjUXlmd3hyeDBQTGVjbXM1Qm91SXJxUFZQL05O?=
 =?utf-8?B?Z0poOVFJVVk5U1N1dzBjZ3VJZFY0SE1rRDhaeEt4WURsYk16NzR5T1BHaEJp?=
 =?utf-8?B?ZzI5Tit6TWlSWGphaUk5UjRZNlVOVXc4SUFhMWtYVno4RUl3aEtRdzMrSThu?=
 =?utf-8?B?MC82M1RDVTlwV2pzdWlaQnNTVzMyWFdVMjRSWjRNSjliMERzVGpPWlR4Mlov?=
 =?utf-8?B?dGN2NXJLaE52dUFYU3ZKaElrajZaUm5zUDhiaFBHbmFhRnVHNlNhTHBWajE2?=
 =?utf-8?B?cnIvK1pJbDFmTkcwODBENlZOb3pFdHpiMVNnT1RaVXFRbmd5WVpzb2g3djNR?=
 =?utf-8?B?R3pVY0lIVGFaZUwvdkNLS0VOcG1YbTZSTmJGdkdUb1pKQnQrNGRKOTYxNDhZ?=
 =?utf-8?B?bmFod2Y1TUwzUnQ1d1NaZmQrRXVwKzdNd3RIOGZLNFAxZnlWcHo5a2k2RnR6?=
 =?utf-8?B?bXpWTnlUTWVpelJETWxUNytZYnF3RWpieWsxcUwxejcyK0VjQ000Z1ZiWWcw?=
 =?utf-8?B?Nkd5Mm9pWXcvU1VBdHJ3dkdCQmZIRGJSNHJ2ODBxdnJoSVBRaHhsM3p0cmtz?=
 =?utf-8?B?Ny9lVlNNZldiSzNobTF3amp4bWRxS0YwYnV2bFNJZTBIMCtHb0xUMU1QRWx4?=
 =?utf-8?B?aUFzTGplTk4yQlkvZDNyMEdjcEtpRWJidVpJVithd2hJWWFaVnM4ZVk1eEdx?=
 =?utf-8?B?WmhrWkJvR0lwTVVuTjR5Qk1XLzE2UWg2ZkNBNTlFKzQyOGhJS1lIZFVHUGNr?=
 =?utf-8?B?SzFjYUdoYUl4UFloMWpFckJ6S2o1ZzRBOFBlUWtnZzhVbndma3hWbzg1RjdG?=
 =?utf-8?B?Rk5hR2dTUjhYM0w4NW1yKy94eWY3a002K3krU3orTEpMSTg1QlFKUS9ONE1M?=
 =?utf-8?B?R21NMHYwamd2UXZYNUJXOVcvTDljR2c0L2ZHOTRLWGtwQ24xWDJyaENmNXVh?=
 =?utf-8?B?d2J4NEpwcTNWTUtiQm9CemdEbFgvdUc4c0gyamdmS1NzcUZpbFM0bnhRc2RY?=
 =?utf-8?B?c0FRR2dSMWs3RGgybnp6QzJNbks5NHNadjFlakVUemIzSXRLNVZnTDYxSlBy?=
 =?utf-8?B?bzY2NFd4TUdsMUlCMW5OYXJ1eDNXVU9JZVJ4T3JEdFNrUk1LUExlVm8xL0NF?=
 =?utf-8?B?bXBUYUQya3dkRnRiam9JNUU5U2ZpWC9zZG1LLzdHS2ZtNTZHbnQ1YjNFY2Nu?=
 =?utf-8?Q?9VxQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clo2cjZkL3BVZzlVeTZlTTBsdmc5eS91dDhiU1dpaUJIN1pLZm9oRkJKSFpq?=
 =?utf-8?B?Uk1hU20yQWhVT2lPWWE3VlY3VnJDWjJLOXV5TVljZ3hYVjVBejZSbXdMdjNC?=
 =?utf-8?B?MXloSklvVWUzMXVteEl5OEE2S25vUFlZZ2lKR2lPSHE2R3BvdDBTMTZsSmJ4?=
 =?utf-8?B?aWFrUnprakgyK1RyNHpmaE1IQzl3cEhRaG9oRjU3YW1FY1Nub0VJOGxqdFRy?=
 =?utf-8?B?YWIrUHpnckt3Wjc3aHBjRTlCbHNKMkFacDkwSUp3d0RHNUpjdjU5T0x6Szcz?=
 =?utf-8?B?NUVCaFBPalV4dFVHZ2pWYUlzenVBZ0V6NXhiNEphWXFTTDVJMWVEWXFoTlV1?=
 =?utf-8?B?b1JBTWZTajZiREo2TnVWQVlMelpldTJuck9lUlhJMU91SnlaalVsczNOcTdS?=
 =?utf-8?B?VjlQZzFrYVlQbkprSkN3RlNUUlF3dC9Hb3l6ZzRZb2txaFBENEpUaHdzdXly?=
 =?utf-8?B?eFRjWEdiVFlkdEhidGhjRlV0NzRsY0JTMUhrU0IvYmZ2MnZPVTJKWDJMWmFh?=
 =?utf-8?B?M0JBTXNIMkdvbEl2dkdtL25YM3gwc1huMk8yQU4wbTE5N1NQenFLVjZ0a1Fp?=
 =?utf-8?B?UDArcmlPZ1lSK2ltWEFzNVRZTjZkYW5lK2FtZDBFeDVibGRkcG5DUTZYTHRl?=
 =?utf-8?B?Y0pkUDkyb2ZxdWF2UlRJVmRlZjJJUzdzL3RCZldicXRaVko4TGo5MUlhRUNU?=
 =?utf-8?B?SmtSQXJuOFRpR2Rab2hLWUFDQ2RCUUxIK1Y5RTFIMnlVVnp2UktpVEdiaW1G?=
 =?utf-8?B?eHlPUjdVWnJGNUdNalQwRFhRMnUwMzRWanBiTWhUVzN3QXc0cmh0Snc1YVZY?=
 =?utf-8?B?b0IzOXkxbkh1MWlqRWJMNVNHR0V2MTJkck9hMTJ0M1VGOGRobFdDNTN2dWRG?=
 =?utf-8?B?QkRNMWo0NFgzS2xrVjZlNktYVTNlMEhkdWNOQjBwYlNTbDVlZis4emxSWTFh?=
 =?utf-8?B?c3d0MzV4UFQ5c2hOU2wvYzk2SlR3cktIblhYaXhrdFlrZVo2eWQvMFZoTGlF?=
 =?utf-8?B?QUN0WlhhcVUvdzVXaHk3ZTZ6K1k3cWVFSkJhT1IxazByUjUwMXpZV3pvRTdt?=
 =?utf-8?B?OThkSHExcVBRL3FFK2RYRzhHaXV5cDAvRGMveVZCSkdxZFlGQThENjdrMXQy?=
 =?utf-8?B?NzY0YUo5Qm9YZTRjZGh6TVp0TmdhZms1bWNOVVp0UzlXLzBMQllTTGNlVlRj?=
 =?utf-8?B?RUJUOGRCN21IWjVyUjdjRnhRTmlIbngzVmpVb1NnUUhpWldtL2pLcHpiMm8x?=
 =?utf-8?B?VU1RREhtMnA4alNoYXZMMy9yN0NMeWYxUzRUbVUrM0tTQm90NWdNTmRWV1V1?=
 =?utf-8?B?clkrVWNuelhkb1JnamFYYmZCeXQyZFlVbmpLTzBqMERiUUFzOWc2V2pLWkho?=
 =?utf-8?B?b1VhOG5HQWF6Lys5VU1SRVJLVHh0STN2OVFlc0VOOEp1M0VXbUQvaHh0di95?=
 =?utf-8?B?QXdXa0hCNjlzMG1ZMjl1NFpEMEFXZVNZeXpDZkV0bFkwODdiUTgzYlZsb1Bn?=
 =?utf-8?B?Qk1aKzA4RWVKL01DZmFCY3d6L1NRR1dPTU84enNaTEt0cGFyNjg1R05ZTWdT?=
 =?utf-8?B?WWZlYmhtcVVMTXZ0cWdlQkhtZnpaRGgrL2Z2OHY3TWV3djJ3elh5cDdvYWpI?=
 =?utf-8?B?c2UyNytrNFNwN3k2T1RHRlRwejZsK1gyc1E0ZWZuUXZRdzhHanM0SzRjbGU1?=
 =?utf-8?B?RDlkUGgxS094UStoUTZOdCsrSStHRUcvNTE4dHYwUEtFZHZ2VldhZkUrSTlG?=
 =?utf-8?B?Z2V6ZU5hdXQrMC9vR1NKckhUM1RDUGIvQ21PUW02cHVTeUF4aTlXVCt2ZE94?=
 =?utf-8?B?M0pIdkgxdlJuK1N5WStEb21JVGlSNmpXbkd3eUVUd1YwSG9Pei8rZHlkaHNz?=
 =?utf-8?B?WGU4UUdmM2RQdUlJZWlBbm5OeWJJSUlvUWdWbGxpVm5TV01sbzAxTmtnRmQz?=
 =?utf-8?B?OTdOTmlyeGtvQm1KeXg5enpyN0hRUU94M25uNWhBQ3dhajdVSGtYRHFQZUx5?=
 =?utf-8?B?MlJsdFFHSDdGaVgyQUljOElvTCtnKzl2TFlZa0pNRS9NVGYyOUJhMlM0OXo2?=
 =?utf-8?B?U3A1TVk0ZUc3SWx2Qy9pc3REMXUrQkwwV0haR3hIeGh1UTdBeGlmYyt6cWRV?=
 =?utf-8?B?eDJiQ3U3aFROOFpMQlMzWGJCWlNHVC95QjJuMUNGUWt3ZzlqNHlYQ3hsQmcy?=
 =?utf-8?B?ZUMyZzNTaHJSbTZGWm82RkhZT0wyMzcyYk9WRWNMd1ZIRlhNQlkxaW4rSmI5?=
 =?utf-8?B?S2hUdElrRlplYTg5blNyZ1VOREVUNkg1RWlZbTBGd3FqRXZNN2pCK1hoeUdm?=
 =?utf-8?B?aUVYaE5zQTQvRkxrZDZZdkQxb0daZEtRZXNsTDUrWXp2Q0k2Wkc0Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07792530-52ed-4ed1-3799-08de5fa14d6c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 01:45:52.9225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sz9+J6Wv4/rLAPubATKEahypZqkQbs+AaB/qQBChDt2bKe10adfADCYlWgHIlV7wf5hi5RB6qUb6U71niewaew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4307
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,vger.kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,protonmail.com,umich.edu,weathered-steel.dev,collabora.com,lists.freedesktop.org,garyguo.net];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_GT_50(0.00)[51];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 38549B63EE
X-Rspamd-Action: no action

> On Jan 29, 2026, at 8:16 PM, Gary Guo <gary@garyguo.net> wrote:
>
> ﻿On Fri Jan 30, 2026 at 12:26 AM GMT, Joel Fernandes wrote:
>> Hi, Danilo, all,
>>
>> Based on the below discussion and research, I came up with some deadlock
>> scenarios that we need to handle in the v6 series of these patches. Please let
>> me know if I missed something below. At the moment, off the top I identified
>> that we are doing GFP_KERNEL memory allocations inside GPU buddy allocator
>> during map/unmap. I will work on solutions for that. Thanks.
>>
>> All deadlock scenarios
>> ----------------------
>> The gist is, in the DMA fence signaling critical path we cannot acquire
>> resources (locks or memory allocation etc) that are already acquired when a
>> fence is being waited on to be signaled. So we have to careful which resources
>> we acquire, and also we need to be careful which paths in the driver we do any
>> memory allocations under locks that we need in the dma-fence signaling critical
>> path (when doing the virtual memory map/unmap)
>
> When thinking about deadlocks it usually helps if you think without detailed
> scenarios (which would be hard to enumerate and easy to miss), but rather in
> terms of relative order of resource acquisition. All resources that you wait on
> would need to form a partial order. Any violation could result in deadlocks.
> This is also how lockdep checks.
>
> So to me all cases you listed are all the same...

Hmm, I am quite familiar with lockdep internals, but I don’t see how all cases
are the same one when there are different resources being acquired (locks versus
memory allocation, for instance). I think it helps to visualize different cases
based on different scenarios for a complete understanding of issues and mild
repetition is a good thing IMO - the goal is to not miss anything. But agreed on
that is how lockdep works. Lockdep just needs those relationships in its graph
to know that ordering enough to flag issues. Speaking of lockdep, I have not
checked but we should probably add support for fence signal/wait and resource
dependencies, to catch any potential issues as well.

Thanks for taking a look,

--
Joel Fernandes



>
> Best,
> Gary
>
>>
>> 1. deadlock scenario 1: allocator deadlock (no locking needed to trigger it)
>>
>> Fence Signal start (A) -> Alloc -> MMU notifier/Shrinker (B) -> Fence Wait (A)
>>
>> ABA deadlock.
>>
>> 2. deadlock scenario 2: Same as 1, but ABBA scenario (2 CPUs).
>>
>> CPU 0: Fence Signal start (A) -> Alloc (B)
>>
>> CPU 1: Alloc -> MMU notifier or Shrinker (B) -> Fence Wait (A)
>>
>> 3. deadlock scenario 3: When locking: ABBA (and similarly) deadlock but locking.
>>
>> CPU 0: Fence Signal start (A) -> Lock (B)
>>
>> CPU 1: Lock (B) -> Fence Wait (A)
>>
>> 4. deadlock scenario 4: Same as scenario 3, but the fence wait comes from
>> allocation path.
>>
>> rule: We cannot try to acquire locks in the DMA fence signaling critical path if
>> those locks were already acquire in paths that do reclaimable memory allocations.
>>
>> CPU 0: Fence Signal (A) -> Lock (B)
>>
>> CPU 1: Lock (B) -> Alloc -> Fence Wait (A)
>>
>> 5. deadlock scenario 5: Transitive locking:
>>
>> rule: We cannot try to acquire locks in the DMA fence signaling critical path
>> that are transitively waiting on the same DMA fence.
>>
>> Fence Signal (A) -> Lock (B)
>>
>> Lock (B) -> Lock(C)
>>
>> Lock (C) -> Alloc -> Fence Wait (A)
>>
>> ABBCCA deadlock.
>>
>>
>> --
>> Joel Fernandes
>>
>>> On 1/28/2026 7:04 AM, Danilo Krummrich wrote:
>>> On Fri Jan 23, 2026 at 12:16 AM CET, Joel Fernandes wrote:
>>>> My plan is to make TLB and PRAMIN use immutable references in their function
>>>> calls and then implement internal locking. I've already done this for the GPU
>>>> buddy functions, so it should be doable, and we'll keep it consistent. As a
>>>> result, we will have finer-grain locking on the memory management objects
>>>> instead of requiring to globally lock a common GpuMm object. I'll plan on
>>>> doing this for v7.
>>>>
>>>> Also, the PTE allocation race you mentioned is already handled by PRAMIN
>>>> serialization. Since threads must hold the PRAMIN lock to write page table
>>>> entries, concurrent writers are not possible:
>>>>
>>>>  Thread A: acquire PRAMIN lock
>>>>  Thread A: read PDE (via PRAMIN) -> NULL
>>>>  Thread A: alloc PT page, write PDE
>>>>  Thread A: release PRAMIN lock
>>>>
>>>>  Thread B: acquire PRAMIN lock
>>>>  Thread B: read PDE (via PRAMIN) -> sees A's pointer
>>>>  Thread B: uses existing PT page, no allocation needed
>>>
>>> This won't work unfortunately.
>>>
>>> We have to separate allocations and modifications of the page tabe. Or in other
>>> words, we must not allocate new PDEs or PTEs while holding the lock protecting
>>> the page table from modifications.
>>>
>>> Once we have VM_BIND in nova-drm, we will have the situation that userspace
>>> passes jobs to modify the GPUs virtual address space and hence the page tables.
>>>
>>> Such a jobs has mainly three stages.
>>>
>>>  (1) The submit stage.
>>>
>>>      This is where the job is initialized, dependencies are set up and the
>>>      driver has to pre-allocate all kinds of structures that are required
>>>      throughout the subsequent stages of the job.
>>>
>>>  (2) The run stage.
>>>
>>>      This is the stage where the job is staged for execution and its DMA fence
>>>      has been made public (i.e. it is accessible by userspace).
>>>
>>>      This is the stage where we are in the DMA fence signalling critical
>>>      section, hence we can't do any non-atomic allocations, since otherwise we
>>>      could deadlock in MMU notifier callbacks for instance.
>>>
>>>      This is the stage where the page table is actually modified. Hence, we
>>>      can't acquire any locks that might be held elsewhere while doing
>>>      non-atomic allocations. Also note that this is transitive, e.g. if you
>>>      take lock A and somewhere else a lock B is taked while A is already held
>>>      and we do non-atomic allocations while holding B, then A can't be held in
>>>      the DMA fence signalling critical path either.
>>>
>>>      It is also worth noting that this is the stage where we know the exact
>>>      operations we have to execute based on the VM_BIND request from userspace.
>>>
>>>      For instance, in the submit stage we may only know that userspace wants
>>>      that we map a BO with a certain offset in the GPUs virtual address space
>>>      at [0x0, 0x1000000]. What we don't know is what exact operations this does
>>>      require, i.e. "What do we have to unmap first?", "Are there any
>>>      overlapping mappings that we have to truncate?", etc.
>>>
>>>      So, we have to consider this when we pre-allocate in the submit stage.
>>>
>>>  (3) The cleanup stage.
>>>
>>>      This is where the job has been signaled and hence left the DMA fence
>>>      signalling critical section.
>>>
>>>      In this stage the job is cleaned up, which includes freeing data that is
>>>      not required anymore, such as PTEs and PDEs.
>

-- 
Joel Fernandes

-- 
-- 
Joel Fernandes
