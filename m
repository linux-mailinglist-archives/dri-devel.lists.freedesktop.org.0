Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNecJqoremnd3gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:30:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E727AA3E0D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:30:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1804A10E71F;
	Wed, 28 Jan 2026 15:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nnRwxC6Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011003.outbound.protection.outlook.com [52.101.62.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93C310E71F;
 Wed, 28 Jan 2026 15:30:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecIOwukwQbR3WSE786Ol0vluLkbzoZjWjkNG91lNuC0+mQdPUozUkuW6VELf4uxXPoARjljCgah25N1cm17FpJ+Lo+G6E3Z8yWx8R4YivdMv2x+0lLFlQZHmDjWBgxBz/9jdC/qgw0fbiGyjdPktXR6HbLwpz0bfwMqiMrrgsxVDre3grd2uTqjFqIJB2dhQqQTl2F0qn/tUIU5ifWohNlc2YoRJjx5M7kUPm3Maxrcrs3r9mUpSUKJilqmw5m7cK8tWZ1+TGXToss6AjhTNABnNRe0tsYQ7+57LUDz7bfYX4mrpdwZZDbik0lXXrhWHd0VFJoW3gqk2EV0OptxLxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZNDA+MSGuzTGoF18Ox1eM5vnTEIcRlI9Sv3GQEFwNc=;
 b=WvLMz5mcneZM6O+GTNO7LguV6OxfIHdpgoDm5cLO8CmnFqGNI5dksS3pboDkmTobKAWHURAYRViZLv4A1UGuaUINOstXtPEkZ0EBmh7lELFmGLOdowhyj9Hd1ScJi2Rp+JY6eyxXpI6o0eDItX9vWiw7vv/Q6ScEmtq724T3qJJoYgoaeZcnM6VaG017O8DKf6nklJBGYOmD9iV3KHXt35cMIqwUA6kKdlYvTZzP3RenoQaf0aNXiP0tqejnxMu2KIRYz3ISQuoh7Hrwpdyc/P9xcNcaY3+QHT6LxkXFy+Q8DYNYdWWuEFLlg0cFF8VR1rRS33B9+NdyYc9nC73z4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZNDA+MSGuzTGoF18Ox1eM5vnTEIcRlI9Sv3GQEFwNc=;
 b=nnRwxC6QSC6MYdm1ad2TGZ4wKgF2PGyPyFd2IKco+uww2GesBpEOOWM7tEetUAifp4727Rs6MM4GHRBoTN5s6c1wlb5QPA+ci3pS6RQLiXMVwK+ZG/5QvUvnnTUgmgyM3hR04QOJBMmJQ7y6tqN/K0gllMfDBuxuyjzSrWyFD1294AWNyuiuSYMayPegx+Donl0EwR18fOJZnTBFsqcnolDT7NJCf/WQKvucGYbk7vIgbel1K/CGh2d4lapFNepg8XEK8EzNUymiQ/1xWXIgYcp1aor24FaDf+o/gyoR7z2tGbmpf3CjsIyFBj1DIcGPHw6QV65W7HR1aedAKUvGsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 LV2PR12MB5797.namprd12.prod.outlook.com (2603:10b6:408:17b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 15:30:34 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 15:30:34 +0000
Message-ID: <87b50b94-5562-4a3e-ac6e-743d865e34b6@nvidia.com>
Date: Wed, 28 Jan 2026 10:30:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Dirk Behme <dirk.behme@gmail.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
 <20260126202305.2526618-2-joelagnelf@nvidia.com>
 <DG02AC8I2XUA.2UM92327TQKAL@nvidia.com>
 <DG02HED94PLY.EZY2AUCW4LOL@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DG02HED94PLY.EZY2AUCW4LOL@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0071.namprd03.prod.outlook.com
 (2603:10b6:208:329::16) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|LV2PR12MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: 75ca93d9-db2d-4ac5-e227-08de5e822e0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTJ3SFNUbGNxNEJsdnVDQVU0eGo4L3BLZDBkWDlpeHBvY0RPZzk4K2xuQTM1?=
 =?utf-8?B?RURQNFJEQURhZE12NC8zOHF0cTBHWlkrN1M1ODUyckxHcEZZUmhFSzVQenh0?=
 =?utf-8?B?dy9ZeWF5a2lxSFE4dlZmaW9NNmhkWTIrNmE5SFFBUm4vd09UZFIyM2VrU1hN?=
 =?utf-8?B?NkVqMlN4SUZQQ3FYK2tlMUZoclduY3pHTW5HZElzNkhndnF6aHVNc3VFVk9x?=
 =?utf-8?B?UGdleHFOOHgzUVpzbjdxMCttS3JwK1NDc1YxdjJKRVRuUVRhZTNXRCtZcXpv?=
 =?utf-8?B?MkljdTIvOGhiVWpJdlRTeVF1RGt2NEttclNUZDJLUXV3d2J0SFFnODFpN1Fo?=
 =?utf-8?B?K1h2ZCtrZUgrWUc1dytQUlFZRTVMbEZreGJHc0UwQUdZcHZIaTFRUzE0TndB?=
 =?utf-8?B?TkdVcjhIWW9rNmc3cGxZYUtadlhlWnFxSEZhaXNDeXhqdVhtb0JGZDdMaThO?=
 =?utf-8?B?RnRsZEVQRFRyRFhLeXVXYTZpS1M1aU1DcXEyQlpFdVcrWk1ucmk3N09SZW8x?=
 =?utf-8?B?VmJHTG9kSkpFdktPU1FKYnVXZXdvR1BJOU5xbnlhSEZVZmpxUW5tcVVXWUhR?=
 =?utf-8?B?bVN6UG1FMy9LM2RwSCtRU1I5Y1RiMitJUzNKZkpRRkxTVUxueG8wUUhZUHlN?=
 =?utf-8?B?TUpLWVJpdXdJazRkdW81UHc1OHdRWjlTdlczWDB5bHFxODdDdjF5RW54YzFF?=
 =?utf-8?B?Z2xHMlN4d2dHalNUZG1YRXRnRUpOYi9ZaEdFRDV4bmdYd01WSEF6Nyt2MlE4?=
 =?utf-8?B?bmg2THIzYm94REw4Tnlya2J2bktodHc5VStKVUdGeHFmWndBNkkyQzh5NG95?=
 =?utf-8?B?QVlySDVFK0VMRFhvUUd0Y0ZIejkxbHpkUC94ZlVQS0hCTzRFSEUvRk9XYjNM?=
 =?utf-8?B?SXZXWVRsQ0VUMWdFRWVtU0o2bldSdDJhMEJ1THlIMHRJdldaZUNnYTYvbE4v?=
 =?utf-8?B?K1BiMDVMeFEvSnhydmlNOTZ6cDhmMjRsR0JLWW85Q0Z2VWtMcWExUTUzTlMr?=
 =?utf-8?B?cnVFYUFWSzZkZmlWbWRCVWhmNzIrTnhZRk0wazZRM2lDRTBKUWVLNm9yclVL?=
 =?utf-8?B?OStPK0s3bW41RXY4ZWl5WkVVV3k0TlZOTlRobjUwdXpJNURYdXhKeDVoeVcx?=
 =?utf-8?B?b1pFTXRGblQ3MWVDdE91TjVJeEgzNmduSXE5aFFNSlFjVFJ4UldCSFdOT01p?=
 =?utf-8?B?TTNLMTl1cUkveVNEaE13cWZoVjJyT01DY2ljOVF0eEhRS0tOMTJKdU1LbWt5?=
 =?utf-8?B?dkdVUUR0V1ZXZStManlBei9LV1N1RnlUMEw1SGoxdWtPWG9aa1ZQR0F5YXBq?=
 =?utf-8?B?dnRUYWRPc2t6RXlLZnNvY1krNG5zYzF4cy8xbUFLOFBCQXMvMWlCclAvQjg5?=
 =?utf-8?B?RmQ0Q0JrRlFpMmJXRjZINHJPa0lxV2RuaW0zZ09kazZubmNjY3Y1cmFqcE9D?=
 =?utf-8?B?eFFFK2JKRzVsYmMwZFF2YXRUb3ZYRzQwSzA5dFhOc1E5b2hLcmJOWDNIWkY2?=
 =?utf-8?B?TEdjY2NYTnNXRGdiNERldnVZK09XT3RpaGpMMEl2dHFySmlEcXFvblo3bW9q?=
 =?utf-8?B?bFZDYXRqZzV0RlQ5MVZqSGxkZGxZazBLRW5ST1BUVmtPZGR4UFE1UnBNUXlo?=
 =?utf-8?B?NlMwUHlSRWV1bHhST2Z0N3NCNytOVkJOdWt5S1BTSHY3NzhYSk54bUJ5RzJK?=
 =?utf-8?B?N21OZ1h4aVpJWFphWkJ2K2VaRHRBZWRsSDJaM2FVYmdRZkdjdVVCazNDK1dh?=
 =?utf-8?B?b0JMeDhFdm9Ia2I0aUNPQmlFa2dwdHRzeUZacWJ2L1p4L25rNzk0T0xKNGhD?=
 =?utf-8?B?T1hpQi9CQjVGdnExRS9HY1hEOS9zdlYrVU9GcGR2MzNQNFMvZEJYYWFBMHYv?=
 =?utf-8?B?ZElXdHgzSnFESHIxbzU1ODcxa29CUkdCb1FrV2doMDgyM2JjS3NYUHB3YlI0?=
 =?utf-8?B?dDRFL2pPdjFoenh3U3piVFRnRjF3dlRoZ00xZWR6MkJjbWZHOE1Td3NCQXAz?=
 =?utf-8?B?aEFaajl1WGg4T1BvWmFoWEkvd2RNQThqbFRQU1Q2N0grMm81ZWJQRVlPMUhE?=
 =?utf-8?B?TTk0cmw2TTIzWUVURnlud3hNQWtia3dkbDMyNWhjMmlweDU5UW4rdWJiQ0sw?=
 =?utf-8?Q?rbGE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1M3UTZ0aVg2dHNxTTdDVWUrUVd1VTREYlNUc2R3dmJIWkZrT1BNb2RmOVlW?=
 =?utf-8?B?emNYTWc0ckVqbFBvRXRqZTF5M25sWWxCa1FWb0Fib3UrR3BjcjIvUzFkdFpV?=
 =?utf-8?B?dGVRZ09IQ3RadVExTE9NVVVaRFZSeko5MTdaUHlkRTgwRWEyWFhDK0ZWTmQw?=
 =?utf-8?B?bnl1aGhVR1BnWXUvRkNkWTJSV1V2TmQvazR4eHl0Z2pZQ1dWUlUycFZQQUxy?=
 =?utf-8?B?SDhrTHNnQUlNYUVLSFllUDFJbzEwN1pnOFJ0Mzh1ZjZBZko1clIwK3FnemVF?=
 =?utf-8?B?NThjb09ubnNXMzZMK2JKcjFBQVJhanZRaHV5WkNiNHYzRitYL24zelQ5YTFY?=
 =?utf-8?B?MlhjbDJtWVYrZXNzRWhUUjgzUXJqd05GUjBoYmtiVENaVTNVU0ViVVVtQWR4?=
 =?utf-8?B?cHFZMzlhSWIyQW9zYzRkdnkxQXV2bGxMSmV1UGNZdUh4OFlndnpxdWwyeGlt?=
 =?utf-8?B?QkMrQjlaWFNLQkFwTjRLY0ZRQ3d2QzRBNnBuRXgxNWk4RFd2QXFTait6ejdh?=
 =?utf-8?B?OFBsSjRtQk1hVFlDYnRNV3RNemJ0THZwVThXekVkVHNFREZITXkxdlR3SkRk?=
 =?utf-8?B?Q2JtekMzbmJvNXJtQ1dyV0Qxa2h6VlZTOXJseW9HOW1SK2lJU0FyWnhIWTNZ?=
 =?utf-8?B?bWN0Z3Z3TWFNNlpLb1V1NUpwK0c4RVN5TlBSaUlKSnFhalo1M1EzU0ZwTHJC?=
 =?utf-8?B?TGpVVktRSXNOUWlZWHZIS09XTTR2aFJtSE1CRlBOTDNjdHl4SitEMkk4Q0o2?=
 =?utf-8?B?dThaZE9IUmFCanJFMU1oUC8rck4xQWN0bVUzSDcwSDdJRVpUZjVHM0RlZHkz?=
 =?utf-8?B?SWNjbmprcUtEWnpxTmF6eEF2a2FYWjVIZURiRDhUZTJiZDV5ckNQQUtxYkV3?=
 =?utf-8?B?bHBxdEEvUVF2emJDWU5qSGFhUUZUVUhidkIyeXBSME9pS3JWMHhxTk9HRFI4?=
 =?utf-8?B?VitzQ0dUR2pmUzNPM3JnR1h5dlJmbC9qNEZ6a2tuN1dzVWl3WWlvYXpzVWdj?=
 =?utf-8?B?QWp5Vk1PV2grbERhNGVhQ2dzZXlJOHlEMUdha3FycHh0c3Z6R3VraGJsR0t6?=
 =?utf-8?B?aklhMmYxbytrNW1tOFR3c1RBUTVmbHZxY3FGL00rejA0bFFaWFhmYzBjbmU3?=
 =?utf-8?B?b3B3RXI0MjNpVmRNSXM3SHIrOWxqMThPbys1UWR1ZllZdDhsdjU5V3RvV3lG?=
 =?utf-8?B?Ky81Z0trSEZoTDBDd3Rta2drUGY4QnZJMnh2UzhBbS9wd0R2cEJuMExLeisw?=
 =?utf-8?B?UmN3ekZQU2g2SG9xU0w1NVhMQ3NEVFdMN0w3MmxmQVRiYmlhVUp0cElGalV1?=
 =?utf-8?B?UkJKajZGQnNtRzhwTHZ1RG9GcjVNOFFtNnFlUUdtN1RWSzdtLzdMbVpLSUx6?=
 =?utf-8?B?WG9tb05MbnJoRkpGVm1nY1pWbmo3TXYvQWQzY1h3Y3JtRklJUkZCTHJqTFFm?=
 =?utf-8?B?dnQ3b0haWVNkdXBYcEkzR1VIa2Nlai9kSm1CdGpRT0RCMzdObWNQK3lxNHo2?=
 =?utf-8?B?U1hmUEZnZmNrMm05NGtuNFVpd2RVYmZWbnJPZ1krNlhVb3hIeWltTndlS1pp?=
 =?utf-8?B?bjQxN3REQVJDQ0dKcXQvNGY2bUJUOENhZjhGdWc3bjFwQmlGV2VBdHRLb3Qx?=
 =?utf-8?B?c2Z2OFdxWS9aRnFQRXRQYThzajQ3b1FiUWFBYXFhK1RycjcvZnJPYWxmbXhX?=
 =?utf-8?B?bzNYZHk0cWwzZkRneExBZG5GY0NuTG9uMnFLNGd2VzQ1REdQaDRzazhiVDJM?=
 =?utf-8?B?WHJKSnNvRVJ4U1JtN1prRGpVWC8xcXZjTVJTTVR0dmN6QVR0Q09xelEyWUpY?=
 =?utf-8?B?QlR0SWVyaGR5VmQ0UU1UWTN4MUFCSGlxWVhwNDlvcnhzOWhNRG1Wak0rUHhF?=
 =?utf-8?B?ekFRSzlrQkNxUUM5UjFNelc2VlcySUtxSTA3SmJha3o4Yy96dUFidU9TTlRn?=
 =?utf-8?B?dlpVeDFudU9uaUFBSjVmVW84MVdKN2EyaFBWNTM2NEZXN2RXZ1ZlZUcwRmV5?=
 =?utf-8?B?c3l5bzdUS2VXVThwYmUwSVhZTjFDeVg2ZE00NFFKZm9wWUlMRjB2d01ZdzlH?=
 =?utf-8?B?ckgwTjk4RFdsSHlxa3c4Mk9TaXZQWHEwbUpWY0VWSk0yQStIU2I4am0xM1ph?=
 =?utf-8?B?MndYN1lMbUpTRXBQY1U4bVFoNldXZjUrWmtINlpXVTdkTnkvN3kwZHlrN21P?=
 =?utf-8?B?VXJHMWwrSC8zZHhLQXpUb0NnU2FpN0J2K2FGY1dTR2s3blZHR1MvbGtZRnJC?=
 =?utf-8?B?MDVsc3YrKzBnUXdFNFRiL3NzdmlKUDNLZjhQSEpEUWZodGhWaGZvTnp6REVv?=
 =?utf-8?B?bU51MDVIb3pQSWw5c09YZVBZZzF6eEVwV29XTkxKVXlkNlFMRGI5Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ca93d9-db2d-4ac5-e227-08de5e822e0f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 15:30:34.6679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6SWJBq+5flWJKuDOYduMjjclUvhnsum+kvVVzxyChRSiN+oXdhS0CKNai04qSmhxvwfQj91rGaupjaiML0wB+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5797
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	ASN_FAIL(0.00)[177.210.252.131.asn.rspamd.com:query timed out];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,ffwll.ch,lists.freedesktop.org,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[zhiw.nvidia.com:server fail];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: E727AA3E0D
X-Rspamd-Action: no action



On 1/28/2026 3:08 AM, Alexandre Courbot wrote:
> On Wed Jan 28, 2026 at 4:58 PM JST, Alexandre Courbot wrote:
>> On Tue Jan 27, 2026 at 5:23 AM JST, Joel Fernandes wrote:
>>> Use checked_add() and checked_mul() when computing offsets from
>>> firmware-provided values in new_fwsec().
>>>
>>> Without checked arithmetic, corrupt firmware could cause integer overflow. The
>>> danger is not just wrapping to a huge value, but potentially wrapping to a
>>> small plausible offset that passes validation yet accesses entirely wrong data,
>>> causing silent corruption or security issues.
>>>
>>> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
>>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>>> ---
>>>   drivers/gpu/nova-core/firmware/fwsec.rs | 60 ++++++++++++++-----------
>>>   1 file changed, 35 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
>>> index a8ec08a500ac..71541b1f07d7 100644
>>> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
>>> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
>>> @@ -46,10 +46,7 @@
>>>           Signed,
>>>           Unsigned, //
>>>       },
>>> -    num::{
>>> -        FromSafeCast,
>>> -        IntoSafeCast, //
>>> -    },
>>> +    num::FromSafeCast,
>>>       vbios::Vbios,
>>>   };
>>>   
>>> @@ -267,7 +264,12 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
>>>           let ucode = bios.fwsec_image().ucode(&desc)?;
>>>           let mut dma_object = DmaObject::from_data(dev, ucode)?;
>>>   
>>> -        let hdr_offset = usize::from_safe_cast(desc.imem_load_size() + desc.interface_offset());
>>> +        // Compute hdr_offset = imem_load_size + interface_offset.
>>> +        let hdr_offset = desc
>>> +            .imem_load_size()
>>> +            .checked_add(desc.interface_offset())
>>> +            .map(usize::from_safe_cast)
>>> +            .ok_or(EINVAL)?;
>>>           // SAFETY: we have exclusive access to `dma_object`.
>>
>> Missing empty line before the SAFETY comment (also in other places).
>>
>> I will fix when applying, no need to resend.
> 
> I also got this clippy warning when building:
> 
> 		warning: unsafe block missing a safety comment
> 			--> ../drivers/gpu/nova-core/firmware/fwsec.rs:303:17
> 				|
> 		303 |                 unsafe { transmute_mut(&mut dma_object, dmem_mapper_offset) }?;
> 				|                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 				|
> 				= help: consider adding a safety comment on the preceding line
> 				= help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
> 				= note: requested on the command line with `-W clippy::undocumented-unsafe-blocks`
> 
> 		warning: unsafe block missing a safety comment
> 			--> ../drivers/gpu/nova-core/firmware/fwsec.rs:319:17
> 				|
> 		319 |                 unsafe { transmute_mut(&mut dma_object, frts_cmd_offset) }?;
> 				|                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 				|
> 				= help: consider adding a safety comment on the preceding line
> 				= help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
> 
> 		warning: 2 warnings emitted
> 
> Since the `unsafe` keyword has moved to a new line, its SAFETY comment needed
> to be moved right above it, despite it still being part of the same statement.
> I'll fix this as well.

Thanks Alex! Do you mind also dropping those "Compute .." comments that 
Danilo mentioned. But come to think of it, I think those comments do 
improve any loss of readability due to the checked_* calls.

--
Joel Fernandes


