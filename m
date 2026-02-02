Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHKrOIZqgGkd8AIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 10:12:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95402C9F57
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 10:12:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF45010E3C6;
	Mon,  2 Feb 2026 09:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XKUBcy03";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012062.outbound.protection.outlook.com
 [40.107.200.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE1510E27B;
 Mon,  2 Feb 2026 09:12:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNTzlulolWR8ptvHNaXZj2xXLE+Q3Lv1w2T4DrZQLNbcw/t78ajI26LCDi5oF/3JzKYXCN0T07KjxBmcMJNmc/K6OwOAfwdksekysWTEg3ORaGjj13kDIXRPPuFzXr3jcG57CS5F3Oolpp6l1MmFgrJ6w1oXS4RBVXwW1CputsJ1iqsLdJD1mpg0CauoPHkWz27GQn3+eGQZxtuY5eQFinTtkDQgpHiJrh89w5VZmujgagIiewDUrfXTBx0vzDUTjD/ZACAHSCB4Nsy8QS2kVtnowUMLnh2V7EorVHiSrRj2JUiKUAZbDdwlOOo0QJXjpyY+oeIQai2Kl6kT1RavrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPT6H8v1udgWwIjW8ZZRP5uuhOQ0phoEZCiJylMVt4g=;
 b=idLjEWJHpABqsctfXzh/LK/g1/12z8h+DySFQa5uBgjK4b2q3BaBdyy9Hiqfsakj8G9hzaI9OEcHXorqcQj+fHLHnAb2txIYzKzXKpx7dGGQVM5ts4W46sCa3pBItHETV/aZp4vAuNgJ5ZpkrAIcp+RMGzhDNw53BAAQafKWQVDFExkmUBMeATqNYIr0b9WynqG1yQH4pj3Or1zrDaaIIwM97vO/sDsvG6G7Sd3PWX+VtD1AQDmmW5K2Ql2HoG2kdm2pG4Clr1hyun05sMFnpV/R7J2SsgKUWAAHXfIw+bjRViJKcP0xwRkYYeexhyVlFewuozuufeAXNDOf6nOp3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPT6H8v1udgWwIjW8ZZRP5uuhOQ0phoEZCiJylMVt4g=;
 b=XKUBcy03vaGAv8oPLufmpPYvaMe3lTQ6cQI0477mmtpu+/BlktTkIRcu8u2JWO6WfQq+NQY0Fyc323t7INustR6kQ3LQGtRlRWOlCCfRV1PR1zpteIDxPz/0M0tw8NR6gQ0RpDpI/S3fgA/lzeGoegKevBDeL7JD5ysgtAM/h5M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7232.namprd12.prod.outlook.com (2603:10b6:510:224::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Mon, 2 Feb
 2026 09:12:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 09:12:28 +0000
Message-ID: <a50c9e31-a182-4ed7-837c-4a12d220c022@amd.com>
Date: Mon, 2 Feb 2026 10:12:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
To: Dave Airlie <airlied@gmail.com>, Joel Fernandes <joelagnelf@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Zhi Wang <zhiw@nvidia.com>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Rui Huang <ray.huang@amd.com>,
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
References: <97af2d85-a905-44d4-951f-e56a40f4312e@nvidia.com>
 <20260130015901.GA301119@joelbox2>
 <c064fbdc-9202-437d-80ff-6134d2a33778@nvidia.com>
 <70d88203-2fe1-4bde-b254-51e8107744eb@nvidia.com>
 <CAPM=9twm1x9rH==uoGQLYa8b4feQMz=Ne14WPuhCPy9_H1u5Tw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9twm1x9rH==uoGQLYa8b4feQMz=Ne14WPuhCPy9_H1u5Tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0635.namprd03.prod.outlook.com
 (2603:10b6:408:13b::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: ee23023e-a8e4-47f0-2469-08de623b2fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDRUaDhzQ1QzQXh6QWpPcnZBYzJ2R3NIbm44Qi9ZbVE5WGw3aDBCUnJNUjJi?=
 =?utf-8?B?UFJmUzAveVZIRmJiY0J0c1pJTW1NcVZZQlFuanNtaU1lZGpYei9kQUhEM3Fs?=
 =?utf-8?B?UnV1U2xUU0FtQnJBYThwVUZEWWhORE9aN1lzdzdnU01KV21OU0pWRTJPMDV4?=
 =?utf-8?B?NW0wR1pWVVk4VldaKzA3ekhQUHhaRlk1b2hDcld1dFE1TmU3amc5OWF4dVVQ?=
 =?utf-8?B?dUdySmM4bVRORU9kaVBsdWpiNDdKVkhyc2t0S0hGcUIrRjJGYkVYZ1hZQ0hS?=
 =?utf-8?B?cHhQSTVxQXN6RWIvWWFlTzg5aXhMT0VNeWc2REhOTUlzRCtCWGpRWlRzTkZq?=
 =?utf-8?B?eHY5Mmt0WitJclk2NjFoVHQ3LzJONGNUWmtmREZLanJIYzNZM3lwTTJrVXU4?=
 =?utf-8?B?Z2NkakJsQzBZeGl3L3ZDSWtaYklDdXVZOTFrUXFjYjJ6TXFYREttZjUrNkdD?=
 =?utf-8?B?anNWczRXdjBuSXJ3RkVnaUJYdzZPMlBJVk5MNDh4V3ZiWTZYQzVRcERRZ1hR?=
 =?utf-8?B?LzdRU3JtcGxQaWZtaG5TNUgzTVpoaDRqckQ2V1I5YVRWSGxGUnNmdUx6RjQz?=
 =?utf-8?B?QngvOVducklrWTRROWRhczdYVFhMTWVHSjB1UnFGdnlRcW9tVUFDOXorR05V?=
 =?utf-8?B?SG1wUWNYMTdHOWZpTitWdElROVh4eW1JMmV1UnBJNnFnd1dTMUthTkNtdU5x?=
 =?utf-8?B?WDN2M2NTc3RhU1ZyZzZod0N6MHhQSUNreXdqZFpwYnZFWk5vbzNnTlVLbnlv?=
 =?utf-8?B?Qy9JODFvVHR0Q0JDdUg1ZHA5NDZlZWZOaDFac1oxVzRqbWlPcE5kc2gybS9n?=
 =?utf-8?B?RkNQd0NBUzArZSswb2V1cTNubTh4Y29pa2lVOWVmSjk0c2VDaFJFK01vMkU1?=
 =?utf-8?B?VDErSTErMnp0dms3UDRMYTNkZFIxN3JZN2NXM01ZNURhYjNsaXR3aGpRU1dP?=
 =?utf-8?B?RzdoaWF3ZlJCUWhwR05VRWJTNlhkNEl2R1hxUGxIb2tUWGtwWFZ2ZUtUMnE4?=
 =?utf-8?B?dVZacExTY2RQdXd4QUlXVnRGeDludkpCUDJaZVhOdXdOUU8rWEtJZk1URXp1?=
 =?utf-8?B?cExaRWNrYzYrQStyODFyVEFQSml1YWp5dXR2Y2s0dWdrcXh6NVhnM3dYSStK?=
 =?utf-8?B?eU9ZbTJ4WVFYbjNhcmZIMmVnYWdYWmord1lwQytFQUJXemd0SzE1NXVsbFNO?=
 =?utf-8?B?QlByZ2VoK3RsSDI3OVdtcStQNnpuV3Fkd0hmNzlhbHZyWDdhL09TU2thUXdl?=
 =?utf-8?B?aXRpalF4aUhDZzJtZU1GbVN2NW1GVGprcmphVzJnN3l0WG11Z2RHS0lPOWNz?=
 =?utf-8?B?VUlMVG9yVjVMcVJUY3ZQdU13NlJBd3FMSXRUY25FLzNIb1RpMEk3RFdSQ3I0?=
 =?utf-8?B?clF6d0JjbHJQTDJidndRY2F6MnhrZ0VOem1ldlpqV3lwU1BKb3NpNXgzWFFK?=
 =?utf-8?B?TE1vWW5EajVVNi90V29Fdlk1NWZLUVlRV1A3ejRFdzhRMHJsNU1rWlErWDcx?=
 =?utf-8?B?UFdqbVR4Wm56NVhTOTV6RXlmSDY1dFJiNmhpbm5SUFc1ZFB4ekRQeTZIcGNU?=
 =?utf-8?B?ODFFT2ttTW8vZFRTSUtIaGNud0kyRmRoZlNmS0NkbHh2T3NEOUtDU2RVWm5s?=
 =?utf-8?B?YUh6NkhSZXFQYVhwMzEzcmk2c0JZeEFacERpYlA4MXVQbDJBbE5JYkxSNk5P?=
 =?utf-8?B?SFF6OUpnRms1UGI1enVBQlFBZkRaTUUxd2ZtdEpER0Y4TXRJeXFQL2hyZ0RC?=
 =?utf-8?B?aU84ZERkb01QL1R5R2poVDk2elNhQ0VIam5kMUtuc1dLQXA0YTVtSGFpRE1X?=
 =?utf-8?B?L1lMM2RBS3BEQ1Nvd0lpVkVIVVhrL3Rqc3M5ZGxZOEVaSTJkbm5zVU9DVjFB?=
 =?utf-8?B?WEFVUHk1SlplMVJKazNnMXdVUUdCSkVwT1prUmYybGZBYXlzVHRDWmdjVWZw?=
 =?utf-8?B?R2ZBYlp4NUlGaHc3bDE0amJVKzNvMkcwcjNkMzBCczFzdWZLSTQzSFRaSm1u?=
 =?utf-8?B?cGhxRHNUY0I3bWl4emhiWndXa056VEQ2UE0rZnRraFpab1A1M3Fncys1UlRy?=
 =?utf-8?B?cnE3UTNnci9VMlBqdzh5Tk4ybEpFUm1GUlk0R28vWGl3dUE1NlBCdlo2YU4y?=
 =?utf-8?Q?KQi0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dERKaDRvZG5tQnBJVDVSekpkUEs4TjRoYnA2bzJYTVltVUNEM1lRa3lVS0dQ?=
 =?utf-8?B?aVp2bXRBK0todk1ra0h0WUtsT1JDTFBlN1MvRnJPUjJrVWF3U2prNzIxYUsv?=
 =?utf-8?B?T2MxZTN2ZndxMUtQQ3o3TjVuMFBCTHZodFVxSTNyUW1YbDZDamVpV2hwODVW?=
 =?utf-8?B?dHhiZVVHYkYvZnJlSTlWVUVxaHdPWnFuWTZyL3RVVksxTk9YcFhLVnNCaTVw?=
 =?utf-8?B?cGtsbk5yUFA0S3IzTmtjUzNzYzkreERSQUlTdjVXYmQxZGZyeVh4K1ZtdUZP?=
 =?utf-8?B?U3FkeEpESC9UQnh3SHlFZFlEQ09TS0VrcWFScFBqcFU2d1U3d1I3Mkg0K0tO?=
 =?utf-8?B?Vlp5blROSzR1ZzNyWmxKcElrZWJ3bExucGtlRWMrM1pPN2JybTNYZUNaVDdS?=
 =?utf-8?B?OEd0UkNvUHhiL0pKc3oxUTRKMGRpejdiZXhvdU9SaXNBUGVHUTl0bVN2Y0tR?=
 =?utf-8?B?NmtsUys0Y2RINitRMjM1YmRrdUI2QTlXQTE2cU1ITDh4Z0NabEMyb1U0QVcw?=
 =?utf-8?B?UlFpYkZZUjUvK2NiV296aGx4ZDhpWXBoTW5LV0sySU1NdVlCKzVPWmJEZzg3?=
 =?utf-8?B?QlBoWUZVT3Q1c0p1UXI2UEF4ellqTHJhUzVPT2Z6YWFjNGx0aTNmZmtCclpS?=
 =?utf-8?B?VXNGMDZ1M3VJWXBZY21YVWFjTGdYdHgwRHU3TFY1T2lTYjliYUZ5Rllpd2xt?=
 =?utf-8?B?TURLSEdYcWZVSkl0L3hqS0toWFFqUU1oT2hDdVBrNE4yTlhzMVZLSEVreVVX?=
 =?utf-8?B?eDdYa0UzOEtvYSs2N0dnaFU1WXJFUU9BUWp4S2xGT1lnTHZQWDV4OTE3eGRr?=
 =?utf-8?B?ZVpZQ1VTZExBSXF1RnpJZUgyMm9zQXQzMktBQ1FDTVZDYWI5NFNpUlQ4UXJq?=
 =?utf-8?B?Q25FZXlHN0lBbjNTbUliUzdtUldsZlF4L21VRjFEU0pUalBTWnpaTzNURnEx?=
 =?utf-8?B?WkdsTDh6eVYzeURNcnNuTUUxY0hweUFQVWJKUDN5dGJnM2VjbFJpancvMXdB?=
 =?utf-8?B?SklxWVVQL1ZoOHhkbHBkWjdDQzhld2tFS3RHbDJ3dTk3QnpuL1VVbjhlQ0Q0?=
 =?utf-8?B?QzhiWGFhSlVRZGNEMnF6MDVUUnNDT3JjUmdXcHRPam8zVXhORThHUVRCWGhZ?=
 =?utf-8?B?VzNkQTIvWk9iVEFzSnB2L2l0eW1xYnRLNzM2ZzU2VWxWMGpEbHRGRmhndVMy?=
 =?utf-8?B?UW00YjlRWUQ4ME9ESkE2ak1pSms3cVhkajlvRkttZ3ppcmMxVGJmL2xqTzBP?=
 =?utf-8?B?c01ML0sxVFBsSDRwWVdQbHdzcm56eUpDSjNpQWRJcGQ5KzFmckcwRFZiRDZI?=
 =?utf-8?B?cEpMRXNhOEVkOGFZNUhlc2czWVAxblZmMm15MGZEd29HaUhvTDBDK3U0N1Vj?=
 =?utf-8?B?Skx5dnRNLzZGblc4a2V3bXlqVzJtOG0wQXg5SzN5Q2I5eWxEbzVGMTB6bDRr?=
 =?utf-8?B?RityR2hUNHd2SGdjNld4UThMTnUvK2xjQzkwR3BEODY3V2ZaWmR1cWZZazZX?=
 =?utf-8?B?QVgzLzN3bUk4bzBNc0dlV1BibDJPYnlQVDl1VFlYNTMrZFlHdU5WdFdKYVN0?=
 =?utf-8?B?MFlsZllMbnZ0cnY3ZzlwSm1qOHdlLzg3M1B1eHJ6MC96SytVM1V1dTRGTnZj?=
 =?utf-8?B?MG5ScFVqY2tLNitlVDFQd0JVeUNCWkJRSVZPK0JMWDZtNkdoUzJkWWVienpU?=
 =?utf-8?B?UU04ajhwYjFwWGRTMnRBRmVsK2Z4RnlsdytaODEwdHVvTWJyVlV4K1JROW9E?=
 =?utf-8?B?R3ozZXRSUW0xcXdDWEZmbk9XT0N5OFZoMllRd2twQmM5b0hsRTJJZ0JVUWlh?=
 =?utf-8?B?aDlXeXp6OWY1MkVOVWtyL0s1RkNkeWdkM0VtYW9zS3BvN1ZLMXdhUVJyQnAx?=
 =?utf-8?B?M09kR3F2UTRKWUIyS3hYcHExU1NqN2dMTGlyb2hhbDhjV3VVTnF6U2ZoS0tO?=
 =?utf-8?B?c01qdFNTSDIySlc3NlhTTHBFQmJjMWhVQWNOM3krc0hDQnNJTzBReHNrQWxZ?=
 =?utf-8?B?NFIxMis3QzMvYlRURjQ5bHZST1o3MjRNT21qQ0I1cUlDeUlMWmg1Umhta3Vk?=
 =?utf-8?B?Rm04N0RGbStxWTVwUEdSNW5VQkwvSk0xRmhXV05BYllXak1SZy9UOHBDQUpt?=
 =?utf-8?B?WDFXZUVaYU1HOGk1UEVLUEk5U2YzNG8xVUQ1ZE9RVlZ5RTh3QnFyNDdMZ0M1?=
 =?utf-8?B?SnBRdGRSM1dCb29xMTcxdWViWjBIVnJKbmpWN2NnRWZMMUwrMXI5RlVJbURl?=
 =?utf-8?B?bTNSQ2dIbHBwZ3QyTjNkY2xZY28yUkpEZGIyN1M5VmhQRHJNaXd0NDFrN0tB?=
 =?utf-8?Q?yx6EP0V8uDVfLxskQx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee23023e-a8e4-47f0-2469-08de623b2fe9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 09:12:28.1308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MmFmsPuF8sjL0cQz6QncEGdX6bL0g2/cXMLfMD5MxMdk898pXnOyiR3aAYq3D9RS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7232
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,vger.kernel.org,linux.intel.com,suse.de,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,weathered-steel.dev,collabora.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email]
X-Rspamd-Queue-Id: 95402C9F57
X-Rspamd-Action: no action

On 1/31/26 04:00, Dave Airlie wrote:
> On Sat, 31 Jan 2026 at 07:14, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>
>>
>>
>> On 1/29/2026 10:38 PM, John Hubbard wrote:
>>> On 1/29/26 5:59 PM, Joel Fernandes wrote:
>>>> On 1/29/26 8:12 PM, John Hubbard wrote:
>>>>> On 1/29/26 4:26 PM, Joel Fernandes wrote:
>>>>>> Based on the below discussion and research, I came up with some deadlock
>>>>>> scenarios that we need to handle in the v6 series of these patches.
>>>>>> [...]
>>>>>> memory allocations under locks that we need in the dma-fence signaling
>>>>>> critical path (when doing the virtual memory map/unmap)
>>>>>
>>>>> unmap? Are you seeing any allocations happening during unmap? I don't
>>>>> immediately see any, but that sounds surprising.
>>>>
>>>> Not allocations but we are acquiring locks during unmap. My understanding
>>>> is (at least some) unmaps have to also be done in the dma fence signaling
>>>> critical path (the run stage), but Danilo/you can correct me if I am wrong
>>>> on that. We cannot avoid all locking but those same locks cannot be held in
>>>> any other paths which do a memory allocation (as mentioned in one of the
>>>> deadlock scenarios), that is probably the main thing to check for unmap.
>>>>
>>>
>>> Right, OK we are on the same page now: no allocations happening on unmap,
>>> but it can still deadlock, because the driver is typically going to
>>> use a single lock to protect calls both map and unmap-related calls
>>> to the buddy allocator.
>>
>> Yes exactly!
>>
>>>
>>> For the deadlock above, I think a good way to break that deadlock is
>>> to not allow taking that lock in a fence signaling calling path.
>>>
>>> So during an unmap, instead of "lock, unmap/free, unlock" it should
>>> move the item to a deferred-free list, which is processed separately.
>>> Of course, this is a little complex, because the allocation and reclaim
>>> has to be aware of such lists if they get large.
>> Yes, also avoiding GFP_KERNEL allocations while holding any of these mm locks
>> (whichever we take during map). The GPU buddy actually does GFP_KERNEL
>> allocations internally which is problematic.
>>
>> Some solutions / next steps:
>>
>> 1. allocating (VRAM and system memory) outside mm locks just before acquiring them.
>>
>> 2. pre-allocating both VRAM and system memory needed, before the DMA fence
>> critical paths (The issue is also to figure out how much memory to pre-allocate
>> for the page table pages based on the VM_BIND request. I think we can analyze
>> the page tables in the submit stage to make an estimate).
>>
>> 3. Unfortunately, I am using gpu-buddy when allocating a VA range in the Vmm
>> (called virt_buddy), which itself does GFP_KERNEL memory allocations in the
>> allocate path. I am not sure what do yet about this. ISTR the maple tree also
>> has similar issues.
>>
>> 4. Using non-reclaimable memory allocations where pre-allocation or
>> pre-allocated memory pools is not possible (I'd like to avoid this #4 so we
>> don't fail allocations when memory is scarce).
>>
>> Will work on these issues for the v7. Thanks,
> 
> The way this works on nouveau at least (and I haven't yet read the
> nova code in depth).
> 
> Is we have 4 stages of vmm page table mgmt.
> 
> ref - locked with a ref lock - can allocate/free memory - just makes
> sure the page tables exist and are reference counted
> map - locked with a map lock - cannot allocate memory - fill in the
> PTEs in the page table
> unmap - locked with a map lock - cannot allocate memory - removes
> entries in PTEs
> unref - locked with a ref lock - can allocate/free memory - just drops
> references and frees (not sure if it ever merges).

On amdgpu VM page tables are allocated and PTEs filled outside of the fence critical path.

Only invalidating PTEs to signal that a shader needs to be taken off the HW are inside the fence critical path and here no memory allocation is needed.

Keep in mind that you not only need to avoid having memory allocations inside the critical path, but also not take locks under which memory is allocated.

Simona added some dma_fence_begin_signalling() and dma_fence_end_signalling() helpers to add lockdep annotations to the fence signaling path. Those have proven to be extremely useful since they allow lockdep to point out mistakes immediately and not just after hours of running on a test system.

Regards,
Christian.

> 
> So maps and unmaps can be in fence signalling paths, but unrefs are
> done in free job from a workqueue.
> 
> Dave.
>>
>> --
>> Joel Fernandes
>>

