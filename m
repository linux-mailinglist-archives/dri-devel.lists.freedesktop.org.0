Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cM6VKzATimlrGAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 18:02:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47072112D19
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 18:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE9610E43A;
	Mon,  9 Feb 2026 17:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="G6P74KQd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010028.outbound.protection.outlook.com
 [40.93.198.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927D010E438;
 Mon,  9 Feb 2026 17:02:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNYCEq1Sx51+auUhsln3hoaRj5EuS2N7dXpN1XWwfxxa/hexSP2zlk9ET5OSRlrXHlJFCd/dSpM1969+njDQ+8r+0Cxb+kBWKrndff2IslQ7YOMXQ2b8W3gCCo6rtcMT+Y0ueqgbjCvy7TW5H8TOvQUVA0s0sA23ZbsgIV8S1/Tqgguk2UdrXB64f9IxPhFsKSMWE/knCmambwiFR7vStA1ftkUN3N3+/iLSV2YB21pBLw2HB1wRFf/BE70Mt79U4O3ZKkd+SzVHDASn1u54zsbaMtI43zw0hTZ08rVcN+RsUgm7zzN8BjQgSS8O0RdTw+1EngIZ+pst1jlOSt4i4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9w4v14vJKaE9dSrkZ8hv0/qSI1SUGhAdT7yl3rmnnU=;
 b=QTQc1ZIeNpFbhTr6R+/h7uTELzLojLeuGrS0oJQ/75ZghVakIwCq9r6XoLl8RF5yLicp0E1wZww5BQoS5wtK4nwNc4hQEQCF/2LdKVF9qR45ee1O8tgiYjjCSs4roqOsk+ufv59GWu4AAd35Bm9sB/dG67wPWFQqu4RKEot8M/sdBLLM9Dtipbemgs3lYc0ZAIELyZSYDN6emRzkbk/yunfhTfW0ljCs/WbvypnptdTfXn2BSEzFE5aa+Vob/UGUKgyJpJ7MWWg9bM1b27hXki+KTcexfi6T/P1J3Hjs9o3AE8IWbEFB4eEa8IQ1P/JD7EFlN3fJSO5wbtacrlmU1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9w4v14vJKaE9dSrkZ8hv0/qSI1SUGhAdT7yl3rmnnU=;
 b=G6P74KQdeGXhFHfTgPlUOidhnwM0fP6G3BGXmxtTlItRFl2HqFNOWi6cheXKONWIPZvXjCk34tNC8LkQCPzH0KzJD2mfkMhO1Ks1h/w+NAFWHFEmklS14dj5CrgaMvTmmEqBIy0vwpz8SeTbiOPbs6cMPiE0C0f54HAW1xkf4PafFbGqQhUIA4+Jsv2VZjs4w72/gWDDG9pMkoCFlNxB9QKAPaX+ZMXrMEFtLmFnk9JeJEDV5Qe9Jm2j8kI03mLZin062nDuMwGJ2xQJgEBeeJ2G1gzWpyOoWihaNZ8Xq8nh/BwktX/ZfGal3CNI0i7PwkRRtWdcwZ5kfEJMVoKLxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 BL1PR12MB5756.namprd12.prod.outlook.com (2603:10b6:208:393::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Mon, 9 Feb 2026 17:02:30 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 17:02:30 +0000
Message-ID: <5d569c73-6cb6-4d55-8423-c90937049366@nvidia.com>
Date: Mon, 9 Feb 2026 12:02:25 -0500
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
 <7ed85eca-2a5e-4e8f-8356-e7fbbf7d3a8f@nvidia.com>
 <E846F3BB-DE64-4E6B-ACA3-00F965038478@collabora.com>
 <983b7db3-b0e6-45d6-866e-f001b64abde1@nvidia.com>
 <4A87E3FC-6A04-4A92-9230-4782D75FC05F@collabora.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <4A87E3FC-6A04-4A92-9230-4782D75FC05F@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0279.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::14) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|BL1PR12MB5756:EE_
X-MS-Office365-Filtering-Correlation-Id: 73bd8b97-b683-4141-f1e0-08de67fd0298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEpIcDVGVDVLNnpGYlVGYjVTd3lnWnVManFuZjZYRlVIY3FIMU5aZVVXQk9K?=
 =?utf-8?B?eFc5eTVzNWtmZDltcG1uVGtsY3NqTkZZbEVMOXl5MzVWLzllL1d1M3NkalVW?=
 =?utf-8?B?SDdOVVI1dW8va1cxYmtIbjRkbkp0RHF5eXpaQ2t3dVZPdVF6YVFqZXJLZ0Ru?=
 =?utf-8?B?VmZGOUxINE9Sc0dPbHczdFBPZ1FEL2NXQ3VSZC9oVGNVYjZzTkp5VnZ3ZVhL?=
 =?utf-8?B?VVBLaGVQSUJLZkJ1R1JaTlNBZWpuMkxNMlZxek1UVFZNODQwVlFsVmoyVlpI?=
 =?utf-8?B?cnQvTlp1OHJJbktZNS8zaGNYanhjWGxXTm41NWlsekZHeXpEaVZNSXZvY1F0?=
 =?utf-8?B?RE1aelhCa2pvQlAycmtMeDR2R1BGalNiSEpFdmVmRU9MNUpGbkVjTG5CeWhW?=
 =?utf-8?B?KzJKb3dkWkt3R21MNmxxY2RwLy9qcEoyQ3VJdGFLbmR1aU1qb29Sa3dJRzQ1?=
 =?utf-8?B?dUlROGhSVHBmSW42N2RMYnJIc0xXZG01MzRKTHdqZk0xQm1aN1ZSSWFlUUhG?=
 =?utf-8?B?YUZpOVhtOUp3TWRjY3UzMWhVazd3d0hiTUN3MFRjL2pKTWFhaGFoR2k1cWxy?=
 =?utf-8?B?VDYvOVZFOUw5d3RLRHZlODdvc2MvcXhFVmEyejBpR3lvQVA2OHJuWllpdWRt?=
 =?utf-8?B?OTdodGZ6Sk1MK1E3V0p2cFBrcFQ5aEpDYUFlT1hmNll1RjFJVm40MnRTZGNo?=
 =?utf-8?B?ODg1MWtUWXgrY3Z0NmE3SUNTRnBIOUh3ZnYyeTVVRDdzaUs3SzBZcTR5SW8v?=
 =?utf-8?B?TTJ1MDRMSWtpZ2g1SHN4MDRpVVJMVjJqcmQxaVIzc0laUXlaTWo1a3l5dFFn?=
 =?utf-8?B?bmdiVHRmMjFKMHJYU1FuNXNrQkU1N1VBWDVOckEvdFM2NGRBUFhONTJnQnc5?=
 =?utf-8?B?VkY2QTZFeXdZZGtEeXI5VDR5RDcwdzBEdWN6bExGU0hCMHNlZldtbE5aZDVF?=
 =?utf-8?B?cDdOTVlkSm9KaEFxem42YmxIS3krVThneUFOZG5pZ1dVSkRDeUJFVnE3UjN3?=
 =?utf-8?B?OHF4QjlWUHhQaGVYRUc4eFd5YjI3M25lQWtGQTk2aHZiaWlBVWVtQjdiTFdl?=
 =?utf-8?B?S01KUy9jUUs0Qk1FTmMwK2hlZWYrNUV4eFZTVXlJVVpFR2E1dWtsa1lwMFI0?=
 =?utf-8?B?SmJ2OXJXTHB0NHBMRGt3YThVOS9mSkRlblhEaU5vV0dTck55ekFoeUY2VEpE?=
 =?utf-8?B?YXpqd0lnVWhWUGJIM0IrcU1rOGJLKzkwQ0NEalQ2T1hUWWN3Nm5FSWgzTHA5?=
 =?utf-8?B?N1RxVTA3aTBTY2lGcGhDSXIwYnBZTE5tODF2VGs2SXBWN1ZPdWFZVHBSOXN5?=
 =?utf-8?B?RG9tTTVSSFBzcDErQlZKeDBzQjgzT1NST3c4WlR1VHBjV3BDVkhuYkNHWHJC?=
 =?utf-8?B?VHZIR3V5a0xvaGRUMXlRbVFkSkFmb3E3MU51eTNsYkFzYXd3ZC9rNXpUMUZQ?=
 =?utf-8?B?akJDMkhOYllITU1wWjR2blJibFNZWXoyMk96aEtONEhnWnJ1Z0ZYeEh5T0hs?=
 =?utf-8?B?eC9IUWpKVXdDTGJkM3drK3d6WjNyLzl0S0RpY01zdk50Y2Y1aXNKMDRxWmpz?=
 =?utf-8?B?NXZ3ZXJQeDN3aVhEN1N6TmxGazZyTXd5R3VPVlluZ2hMNGhiUURTaklRWDAw?=
 =?utf-8?B?NGxJSHA5NUZWRkdWR1FNR0xrNmM1TTY1L2w4OE1YcTdIaHpKSlVSWFZqWE5n?=
 =?utf-8?B?L1RyVjgxZ0FNR1h6SzhnRmZoQnptaWZnU3k5RXV0WTBObkJTTEJuUitPYU1q?=
 =?utf-8?B?WlhHSTBGNTU2ZUVlMmNqRG52Y0lpOE45blpLOGZFRXBTQnRXM0NFQ3RCdyty?=
 =?utf-8?B?SWNDd1h6M24weHpQZFpsNk03RGxkazlqVktvbFlBL2UvZysxY1RFb21sMHhF?=
 =?utf-8?B?alg3dzBDMTFhTXY1REIwTnVlajc0VGpOdlZQVFhFTzJZMVdMbzVUeVBkNUZ0?=
 =?utf-8?B?ZlpLdXJFcVo1S0ZXaWQ5WFlnang0aTdsSDh1TkExSUk1Wlp3U0I5bG5Gb0k3?=
 =?utf-8?B?VllLdVMvbXR6c2cvcEU1S1p6L2hxZVhObGJSa3FYOVArdVRvT0YzL01jdGs0?=
 =?utf-8?B?cFFaeVZ2RmYvQ3FXQ1psMzhyQk90dVVqU1ArNlN5WVk5WUVLK2Z6MU1seGlm?=
 =?utf-8?Q?H3eM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDIvbXFCWVZQTEhpU0xOT1VqMEk5blNCeEMxTlJRbmJLc1JydjRBV3dhVm1o?=
 =?utf-8?B?OEVNRC9kUm00ek5PM0lickE4Zmw5SG1tVGkwaVZCZHJDNDlXV2JDUUV6NjlW?=
 =?utf-8?B?c0xaTE14aU9UQ2pseS9aLzdkRlMxZzNlSm5CZWF1enp3Z2lSTC8wbFdXUktK?=
 =?utf-8?B?cWF6SmtHQjA5S053TU8xWk5Qb2VHMDRtcy9nTHdaK3pvRndVWHFOcEhObUw5?=
 =?utf-8?B?eHhxQ2gzNDEvb21mdzJnWTQzWWJjVFdMNy8xSTg2S0JyNVJ0TWN0bmtUa1FP?=
 =?utf-8?B?MUJuT0ZCSUFuTkJIMzdpblNuT3AxOVFuL0lzUURuWmZGS1llYnV3M3BsVDlW?=
 =?utf-8?B?OHU2Qy9iYXBrV3dyZ2pNVnFGeXFscEVyeXg1UTIzTDVrZG94MDhpS1dhLzAv?=
 =?utf-8?B?dzMrR3pFNDJ4WFNmejhtd0hxMW85VzZ4MzMvVjVzZTljYngzaGJrVkwrMWFU?=
 =?utf-8?B?U1NtcXhPQmw1RTNNSDlTTEtuM29WZjBQVTgrTEt1WVNNU3FNMmVXUWZhZmJU?=
 =?utf-8?B?OUoyWGxHNjNYRlFXMC9DS3pnVWZtVDhYcmJWU05iR1ZaQ1NvOVJoV2FpYStT?=
 =?utf-8?B?RzJ0YVVHSUdxNVpHTk9jSWVKeFVuZHZzcFJlTTRUS2dHU2tUcTVwMTN1eW84?=
 =?utf-8?B?c1B5YytJS2hDOXllazE0cUtsajlTZGhFOC9USTlIcUlFcjQzaTV4T0xGS3NO?=
 =?utf-8?B?YVBrVy9YbVI4dDVFS2xUSGg3QjB4N3JXeExLRU1jbTE3V1dNeGJXYTZUSEgw?=
 =?utf-8?B?c0x0dWxybys1eHFRbExLd1JOSG5mVTdnSmdHSnhZRFV1dGtPSXVDYzErYW9Z?=
 =?utf-8?B?bldMdTFFTmM3aHE1bTBoSXRnVkJzbGN6c1B4bzJFOTZ6cFd4cVJiQWZXb2c1?=
 =?utf-8?B?WlFET1JkaW4xQmZFbGhsSThBWmoyR21KUXRHeDFSVWpwS2l3a0Z2R1FMbmtn?=
 =?utf-8?B?RThoblZRMS9NQmpXaXRFM2ZWcitNQks1STFKaTl0WC9QQkVZVjhudU94UFU2?=
 =?utf-8?B?dHZOV2NhTU9rNm0wamNqZ3pJQ2xIY3E4dUxlTmwzRWFkTWtqemFic3RQNnR1?=
 =?utf-8?B?bEpJa0xsYXI1VmN0V3I2UmVxM2tOWm94VjFFeFVuS3d4bTdqc3NVMnRaWWp6?=
 =?utf-8?B?Nk1DS1MzeDZPcHFOTDRPZnZaRWZFdDJJZ2hUYnM4cVhuQXdMVE1YODBna2Vr?=
 =?utf-8?B?TVMrbHh5bWFNZ1ZXbGZXTmtZeVBHRVMrUGk0dEcwcTBISTNJVGU3dVZoK0Qv?=
 =?utf-8?B?UXMrVFVOcGVQK0c0R2JZaUgvNWEwdFh3NndGL1cwUlRHbld5czhIT0tIZHF0?=
 =?utf-8?B?VVVUZkRKeHRjSW1Ya01CQXM4WGg3eUxPR3RsN2lSdmJTL1BEbFZOai8wSmha?=
 =?utf-8?B?aHFSRzQwV2VJTWRyWGptelY2STJhTWVLN1pvdVY2QVBOSnhib2VEUHZnR0Nt?=
 =?utf-8?B?Vnd0SlJ6eEtnQjJTVnBEcUp2Z3B3bG9EdDd5YUcrOGRJSEFnZlpTbVZ2cUFl?=
 =?utf-8?B?ZFFBdUl4U28rZTlaWTdZSC9lUU5QbzhqNkExSk4zZVZVTEJvY1dtaWFaK3Fu?=
 =?utf-8?B?ZG1iZ2pXYzcxTWRJZDk1Q1RuaWY2aDhvMmV4NGNtSU5sS0lMb25WY2xmOGZF?=
 =?utf-8?B?TXg3Z1BWVXB0NGUyY3FsNjNxWVN2VWJGUmJIVFd3UUdlbFRTdzYvN2JWRWdI?=
 =?utf-8?B?K3U5OVZKREtzanVIVTJJdklTenZMMWVNUXBRU09OYjQ1N3lScHlJMjhPY29K?=
 =?utf-8?B?TWY4QjVDYmFscG1CZ0Mvdm1zQXBjaTlNM2FGUCtVWDBSNFFLRU9Nc3dkbVpP?=
 =?utf-8?B?allXTlpOZ21OV1Y5UDZ2RHp0d0UzSWZ4cEpUcDlKajV2TURubzlDTkVHcElC?=
 =?utf-8?B?dnZqcEd2RW5YYkw0UDBmZjJSTWpQYWpPeDFvVEtydjdBeEV3djJoeDIvTmJm?=
 =?utf-8?B?aGtkWVRrNjJhL1VJdkJKaTNOREpZU3NLTkR2MUZFV2s5cDFOZXpNaXQ1ZUZy?=
 =?utf-8?B?Ry9peTF2Y0R4YmdzQzlCMSs3QWpscXFQQkkyZlMrTEJnREpZTjNHSDBFT0xN?=
 =?utf-8?B?TTdUNmNYTE9iWGpQaFE5OStEcFJHNnF5aUg3YmVEOGVhSzZoQ2VTWldvcnlm?=
 =?utf-8?B?a3lGMHREVGVsaHlPTnBQNHpyQUFaSVQvV1N3dms0RmdYbTN5aTA5OC9JZzAy?=
 =?utf-8?B?enprNVJJZUNwM2dvK0lmeEV2WC9HcDVqaE5iQ0wyZnU5SkI5MW5LWUVPa0Ra?=
 =?utf-8?B?cGMyWmovR01salphdTJVYlJsUEJTcVcrVXV6YnlkMGcrMGNuYVljeXFaV2t0?=
 =?utf-8?B?SlNMcm1Yajg5aERkM2gzNWtUcVZRNTlld256bGVuRVVmblY5bGR2UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73bd8b97-b683-4141-f1e0-08de67fd0298
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 17:02:30.3977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbsLAzi+/bmc/agTUQfe2OdRjZ0EddMaGrHcYK2a5/oVMWfYW54Cg9OcHfStegsPOubwqdVkdWZGhzWYJKkZBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5756
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
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,joelfernandes.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid]
X-Rspamd-Queue-Id: 47072112D19
X-Rspamd-Action: no action



On 2/6/2026 5:33 PM, Daniel Almeida wrote:
>>>
>>>
>>> Yeah, but my point being: is there a reason why the underlying list has to
>>> remain read-only? Is this a safety requirement or an invariant that is established
>>> by the code above?
>> I'm not fully sure if it's an invariant or a safety requirement, but anyone
>> creating a C list head on the rust side must guarantee that it is not modified.
>> Since rust has no visibility on the C side, I believe it is a Rust invariant
>> here that the existence of CListHead assumes that the list cannot be modified
>> once Rust has access over it.  That is up to the creator (user) of the CListHead
>> to guarantee. In the DRM buddy case, once the list is allocated and accessible
>> from Rust, C code will not modify it while the Rust object exists.
>>
>> Does that make sense, or is there a better way to document this?
>>
>> --
>> Joel Fernandes
> 
> 
> In which case, I recommend moving this to a safety requirement when
> creating the list.

Ok, will do.
> I assume the purpose of not modifying the list on the C side is to avoid
> corrupting the list in Rust somehow?

Yes.

Thanks,

-- 
Joel Fernandes

