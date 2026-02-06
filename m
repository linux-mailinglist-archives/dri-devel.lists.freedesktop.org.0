Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGF2LaE+hWm1+gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 02:06:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6E5F8D2E
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 02:06:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950D310E211;
	Fri,  6 Feb 2026 01:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HCVY96kP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010004.outbound.protection.outlook.com [52.101.56.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E0710E1FF;
 Fri,  6 Feb 2026 01:06:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glpBjjUN6pAm2scn7PT+Q2ehryYkFGysZ7C9HRCULZT4GCJp5X3YYfFZNm7GG/cAIS2OX3SjWE6QfmZeDoqHhOD7Brs4iDdlacGbAr87W5QwrMTUxUgjn9XR1ehQkGzcM08q5IDrbILqYFYd/oj53BzBkYtyViq9vOU0XaIvwLQFJ7fgdpoG8gzy1R0fqG7f6HP2DEYBNgBst5BW2LYWO3c3842fqu106jcXLJYpDlFNoz4ZRUIdDRmClQAuKrVWnJ456YRjAX70fAE96ft80vm7LERkinn0NWCwQ+GsrPh04MMriLTaix8cn9xyCeBS7Cl6bN/aNQSv+mY+29NVSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJCE6yOYN5Tt/es/uVwvThtrIsUzUi62PyXGRcQoF/s=;
 b=vsHBgpGdU2dLyvC2wVENFmrCfJcx5ir8+jCbXK5zkNL2zHMnoxn/FcNKa3SaYyiLQYbgZxiXasfKNiXSb0lamDi8RegxbGDRuKek2SKZcJF/OcYCXtn4Ao3ZO4CoJslmUq6vO1181hAcbbRoiakuuIc9Jy9DRvMJQDer1/O3IVFwMFlEB33Jlgzt6sA7h3OaISvEuNHRbr2qzbj5XgHH+jvWQYErKhL370tgypx2LS6KWINkY6p9VcZQ0WNakEYVp5gzm41KCeURTojji9l7vIEguO3xSq9Nvv0WqXxTYI2qP07yXO3wpXUcD+yTfjCX4ABsmYmd+161Xyym2bWPvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJCE6yOYN5Tt/es/uVwvThtrIsUzUi62PyXGRcQoF/s=;
 b=HCVY96kP92JDAv+HntfiblBFxMy4ivAGn5X+9lJpabgqMuYW+D9q/kiu0U+MPINw+0R3p/Q/UYQHhie/4CPAxoxa+gsVrQbvJJTB/DXnywH9uo8qE/B5TpOPdpGYLscw0fRqrepo5ZntCYQY8SglWbZCeI3qNngnoK/SOIihWDrJ9K3VuwpPbDSkSK/56K6H3+hSee28zQ830ci1nXLmkQr0LHAdaeTFFKea8Csric064cYRGFMgiQ9xpLQ8mkMSEqQQeJFhOCL5LMiidekPDZ6XbAyG74hI4JCeakS6Ut/fZECyiyJq2bokTSx/4/eiyHmZqv/i+RGPlTZn2BrmHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SA1PR12MB5614.namprd12.prod.outlook.com (2603:10b6:806:228::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.12; Fri, 6 Feb 2026 01:06:30 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 01:06:30 +0000
Message-ID: <06ff773a-06bf-4d60-bd0a-75a0359ce41c@nvidia.com>
Date: Thu, 5 Feb 2026 20:06:26 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] gpu: Move DRM buddy allocator one level up
To: linux-kernel@vger.kernel.org
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
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Alexey Ivanov <alexeyi@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>,
 joel@joelfernandes.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20260206003451.1914130-1-joelagnelf@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20260206003451.1914130-1-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P222CA0016.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::21) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SA1PR12MB5614:EE_
X-MS-Office365-Filtering-Correlation-Id: 9efb7020-3f9e-4d4e-b5be-08de651bf60c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0pzWU9hYXd0ZmRNY3g5SjljcElvaUxGcXhBU3ZVQkt6dEg4TU9WdFpuUlZQ?=
 =?utf-8?B?Rk1iYzg4YWJRS1dVeDc2RWFIeDhJckU5R0ZZb09tZTBzWU1ockdNNnEyMGRU?=
 =?utf-8?B?QlBMTTNrL2RQVkhZb2kwcy9tT3M2M3VXOHpVSlpJTmE3aDFpS0lHRGFaRWFw?=
 =?utf-8?B?TU9LMzdrMkgvQ0JGL1cxb2V5NGtFMXJmOHlmWE9iVWNzc0RzVVpkSnVvSER5?=
 =?utf-8?B?TUpTRUcwKzRXSmJTUWNsOXhOL24wTk9URndvTG9UOFMxRlJZaW5iMGovQ3Vo?=
 =?utf-8?B?czBjOFNkcE1WakpZT05tdlNod3lHTm9Gc0V0U3BTVEROdEVEY3FFUEVvN3RM?=
 =?utf-8?B?VEd2MHdrSkhrZFVRd0Rxbmw0NVdyV0NlODRLQm5GNjQxQk5raUhxOEVtY2hB?=
 =?utf-8?B?bWlrOVRLVDZJdFBmanVieU1rMEQwOTJYVElaZ2RRRXlLN2o0cVFNQ1hRa1JO?=
 =?utf-8?B?Vmc1Q0VUclYwazN3NjBIT1YzcGl6YTJ2eVFwRUdrMzkrUXRCdGlPTmc4dy9u?=
 =?utf-8?B?L2l6SEJWNlFwWm1wQVR0M1l1Ty9Rc0x5WjVVM3hzVEVpUWpuUWY0WXRMem5k?=
 =?utf-8?B?dHVwelZyWnJrM1FaOFhkenpiYXR3ek0rdUJQUzI2QUFOODVYL2plSkw2d3Jt?=
 =?utf-8?B?TXNUU1hsNlhNNklPUlJrZHRtTTFORjh3U3AyVGJ1L3BHYjJ0blJwMm9PdEdj?=
 =?utf-8?B?U0pXNzF2ajJyMWxSOTRkUDdENXFpMTFzbDhTOVdIQWFNT21jeGR0c0dtWTB5?=
 =?utf-8?B?LzlMOVlYSmJhUVVRTmNNVTRnZUtuaDJWN0UzL2Erc1lrWWhIcDNxVVlBTW1J?=
 =?utf-8?B?Q1NtWmhxQ01uWUQycU9UQXBsZFBwTnBaeGdvamNUS1phRmdBaGtXRmVHZWxD?=
 =?utf-8?B?V2J0NXMyOFNUNU5IZjM2YWVSTkxKRWRBdGdUM0NFazRJMFFHdDlLZnFoNStB?=
 =?utf-8?B?K2RvREJ6RlFPbk93aVZNQk9hdU5kb1J0RTFMRHRkYlYvZUhSaGpsZEdRVTRs?=
 =?utf-8?B?Mkg1TWNaT0FtSC9vMWd5SnBlNGR3aE5pKzIzdlNqNVV4UmVWREhJY1ZwMzhZ?=
 =?utf-8?B?d0hpallvSTBDOFhIa0N5bmFEQUNIaWtlK3FwL0pMajRFZkZiUVBodzNUbnVG?=
 =?utf-8?B?bnlXeThWVGZyQkF3TkczWmlaUUpFd1FzN0VJUlNWWFFJRXJVem8rbXhqUTFw?=
 =?utf-8?B?d09oYWNhT0xLOWQvNEw0YkJUYkk4Qk5McU94S1ZVbkVQRnhuTUlNUmZnNC9i?=
 =?utf-8?B?VHdWN1Jqb28zc1BvVnNCcjJ5a0FMd0lPbHlFYnF6aFpXZmtUNVNmYzd0bHF4?=
 =?utf-8?B?Sk9STWRpZ2hrM054c3llOWwrVGZJY2dwWW9USzZRejFaWFJqYXhtU3hncWly?=
 =?utf-8?B?N1JpRi9rN3FlWHhQdnhxTnlTeDBiUzFUUmlZaGVDZnFOK1JIR1N0Zzh1Yy84?=
 =?utf-8?B?ZTVLcmFQUllIWGwwUVcxUDY0KzVIL05jaENPNU1aS0dQTDlVMCtaaWZiMERp?=
 =?utf-8?B?Q0w5VDl3YXQxdzVieGMvemNHbXlWYy9qZlRWMjJrN2Z4eitmWVBnRzVTdFFi?=
 =?utf-8?B?cGh1Vk8wMEdrMU9kc3ZCeGpRT0kwS09ocG9LRFQ3MmRsbVRCcThLQ3FRNXJP?=
 =?utf-8?B?cktXU21uWFNiTzYvWGtnYXY4WDZtVmtoWjg3OUtoRjBkK09EeUVFd0dPRWU3?=
 =?utf-8?B?MXc1Zzh3aTJuUERrOHV1dC9JR3I2QW1GNmYzSDZSUzVFL1h3TjNjU2VuWUEr?=
 =?utf-8?B?TTl6c2ZWY2wvZG1pd242UXRoNkYxUVl4Mi94d1FZTmo1QVJKNnpPclh0OWlY?=
 =?utf-8?B?d2w1Z2NGVm9jSHd3VFZhdzNrSjlhZ3F5dEJwc2gyZkhpWHd1eTN6U296ZzJV?=
 =?utf-8?B?Rk1GSkFLeW1aNk9od3NqVDh1ZlJ0SXJ1bWlsUzB3d2ZaMDZ4TkRIRE9WVm9u?=
 =?utf-8?B?M1lYMm4vWEtVcW1QTzFpeExNWDhZZ0ZmMEkzcG01Y3d4UFhvYXIrL0ZBT3Bt?=
 =?utf-8?B?YW5iQ2g4U2hEaGVJVkJvU2dBbXlrRDdySURxc3FwSTZyTUtaazYvRzZEd3JF?=
 =?utf-8?B?a0lxNU9UZGY1QTdvTUMrRFhDdEtKRGRhVWdTeENDa3ZKamgyMy85MnZFS2JC?=
 =?utf-8?Q?ay8U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0VjNldyVGZwellFUGZncHpDQi9kSjRReTB3Rzc5azRRR1VvM24zUHA3ZHVZ?=
 =?utf-8?B?VzhqaXYvYXRFd1I2RXdESHRVN2RQZFVkbzkzOGJ5ZmFjY0N5QXppUDJyOGRN?=
 =?utf-8?B?a3RiQnc4TDdNNWkrMG5BdzVWdzY1dVU0eFRvWXB5Wk12Q0dWd1A1ckRXNVpY?=
 =?utf-8?B?Rk1KVnQvV1N5TGc5a1luQmIwTnh3cysxQXZuRmkvZFlJOG0zK2VYVTJiWi96?=
 =?utf-8?B?Zy9COUdROEgxK1UzeTcyNE8zREEzalVKTGJqUk5hekcyYWF5cEEvSEJSeG5K?=
 =?utf-8?B?ZWZiMmg5ZDRycllta1NZNk9ybjBnelh0c1VBS2JwUmtGK2QvRHdhTEZVaVVD?=
 =?utf-8?B?d1Y0VStGeDF5WGY0MGx0eHVDMjAvWjhkWVU3aldwNTNFeCtibmtDWFRTOVE2?=
 =?utf-8?B?QmdxMWVsL0JGTzNxUmhxOXR2dXJucmcvbkxLZDg4UGl5MWZLZDJnS2xqcmxt?=
 =?utf-8?B?Niswc21zbUVDaGZtcTVTdzJ1bnozREpaem5Ec0xtazEwYStvWnQzNExrZDNB?=
 =?utf-8?B?SmNGR20wZVIvM1k4WEVpSVE1Nmc5T0h3TEwxSk5kUjBoRnIrYzFyUmJrSHBi?=
 =?utf-8?B?c3BQcmtUdkRYRnlJNXpNdFkrMkZOSzFJUTRWZG1yMVI3REVFc0dTZDVMVW9Q?=
 =?utf-8?B?MmdSRndBbFZmeXdGYk16ejVsVnB4RnUyWVFSSW9YUXZVNVA5WHJFWW8ySkl1?=
 =?utf-8?B?WWZ2bXRMWkZmSFV2NFZPcUwrbFNjT3BBT1FFVk9MeGREVmFydDd0K3YxakVT?=
 =?utf-8?B?OW1zUVdZNUM5MzJqQnVYRzdLTm5nbTA3QU5JM01uZ2Q1ekN3MzVBczZUUkxX?=
 =?utf-8?B?SGlTMnU4WHVHWXVQbUdoUTk3bU1tM2hmdUdLenhRMURuRmVsUDNVc3B3WWFw?=
 =?utf-8?B?bGluRk5USkY1TXpacEhRWVhUbDVHYWxYNFV6aUNyZ3JrMlpRM2xpaHpzRWRi?=
 =?utf-8?B?b1lxeGtlMjB5VUlsdWc0SGxmUXZqWk5DaDZYZFlBcW9UNXZOeENDWHczUkZo?=
 =?utf-8?B?czZWT2N5b3pIdTA1K3k0VjUxUDN1dHRPVEYwbWFNLzREVVI4VDNib1RVaTZi?=
 =?utf-8?B?QVJ2bWF1TlZJUEtkRTk4SEFBU0xxY0xvNzVLdG43L3c1R1RSZ2pzNE5pU1dH?=
 =?utf-8?B?OFYvYnpBYXpWRWtGb0psWFBvTklOWlBUUld5MlZwYnFXNnRMYnp5c2cxRnR3?=
 =?utf-8?B?Tzh2SmlvN20wd3JQa3lJdFFqWnB3MlpwdERnZHdDaGU5S2xUWjdKVVg3THlQ?=
 =?utf-8?B?Q0JodHdnYzRmN3FIaFFTVXVHSzQwWWxvenJheE9GbHhuVFRwZURKQUZRL3I2?=
 =?utf-8?B?bTZ3VTJVYzBKY2gwTEtJL3ptYThyVTVnSmR3ZVlwTHdUcDhZTDJLdU4rNE5q?=
 =?utf-8?B?QVprZGI5dEpZb0lyNXVXNWUxNSswTFZkNFZ6MEhtSW15Sm5vVDFvZlpUNmVD?=
 =?utf-8?B?b0FObmtra1VJYWJKaFlWL2pOTGdvVkpZMm4yRU1jenR0NlZjRXlNQTREM25U?=
 =?utf-8?B?RXZZbW1zQUZkdHc5K3lqekxRSkRIRUxJdnNlWm1zekpUUlhoeE1mWklkbkEx?=
 =?utf-8?B?bnUvZW1ldG5FalhEeG5VY1BIa2VENEszcWpmZXdoNmZ3WW9sYkZsR1hJOWZO?=
 =?utf-8?B?NlVrckE3OE8yZVBRWXBndXBMUGozZTJyamJiQ21NWk82TUJZV0t3L2tuZEdq?=
 =?utf-8?B?aUJ3Wm1RWVNhUG1BVUhqcDhaMUdTem5ON2x2KzVVM3lvMkhYRFNZYy9lZEYy?=
 =?utf-8?B?dlBFYWc1MElYOGYya0hBSXk5Y1NMNUFTenpqSDBTei9GK3VIeDdVdjQ2K1hh?=
 =?utf-8?B?QkpxVGdxTmROQ1BUOHdTZWk1azQ3ZnFzbWkyaUFOM0ozRmtUR1BZZHkxR0Jh?=
 =?utf-8?B?Q09yNmd2WXFSTms5Ujc2Y2NjeVk2aTdwS3FjWndzWDNNOUx2QzdnczRzRUZQ?=
 =?utf-8?B?U2lHTWs3RXFWdnRFTmdIakpEQUNzWjJFKzd4RnhSYngwcGVjYVdTK3R5THdw?=
 =?utf-8?B?KzgyZTJtdkRRZXFrZndEVEpNUm9kVTR6TVh3a0I5WldWaUZxbUJ5TmdaaldM?=
 =?utf-8?B?aXRhTmpoYndCWElLdGdnTGkrWDRHdXZXYkd6M0dsM2JIRVA1RTJ4cHE0MlBu?=
 =?utf-8?B?NCs0S1IyNVl6VWZ4eGlaZnhjWklOd2lxbldaNURJSTBkZ3k4MVVLNUo3Nllm?=
 =?utf-8?B?bHl6MDJkNVFzbmMxOFZtQ01ucVV5M0ZhWC9GbXlMNnpGZzRKVEhsa0lZQXNX?=
 =?utf-8?B?NmFHV3NqVm5zektVOG83WmdkMVFBNUVob3p5VzZEVWhoOHNENTI4NGZWaHdT?=
 =?utf-8?B?d3pTK0UzWTBxa2VCWVF5NWIyVXU5S0VFOXpqSzF0QlFaV0ZGZ2IvQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9efb7020-3f9e-4d4e-b5be-08de651bf60c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 01:06:30.2179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svOPs0d3MBAsX2JvYF+w9Cjg1Cj2NsQZpZwRKYGkjaAuDVFrN5Z+90Yxm2yibAywNbpxGum6SdBKSucA60fYvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5614
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
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[131.252.210.177:from];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_GT_50(0.00)[51];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2603:10b6:8:c5::21:received];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5A6E5F8D2E
X-Rspamd-Action: no action



On 2/5/2026 7:34 PM, Joel Fernandes wrote:
> Move the DRM buddy allocator one level up so that it can be used by GPU
> drivers (example, nova-core) that have usecases other than DRM (such as
> VFIO vGPU support). Modify the API, structures and Kconfigs to use
> "gpu_buddy" terminology. Adapt the drivers and tests to use the new API.
> 
> The commit cannot be split due to bisectability, however no functional
> change is intended. Verified by running K-UNIT tests and build tested
> various configurations.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

I forgot to add Dave Airlie's review tag here from his other email. When you
apply, could you add it?

Or, let me know if I should resend it. Thanks.

--
Joel Fernandes

