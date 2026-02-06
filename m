Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GD9WFjZThmnQLwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 21:46:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3F7103383
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 21:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943AA10E909;
	Fri,  6 Feb 2026 20:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VxpOqAGx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012052.outbound.protection.outlook.com
 [40.93.195.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4033F10E903;
 Fri,  6 Feb 2026 20:46:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+0bZEo0I+hibtfjkABmk5z1D5xa/z/2+Ax84YyoV1sJUG4w7iKQa/Sq7dNhr2pbNF8d3gXq+C9eHtcOlTbE0v2Kqce95lCFBxZfAYZC7g6q8ZLaa/DuGqkJ8j97WSG8eyex726preKLAn8Q1znGHF+1U0YrJ63xkOt7hg4qUKHW/YOJ/N8IvyISDB1tMRndgiegWgvwZdOlLBCZ8XXvEn68XV7zpp9myUWDGojPB1TLPZQvv0LhS2/RDoD++HNUuZpXjG/iPDanoSGQOdHotEDwQXC5YyThanAChegADME748w4jFaIj/z2A86rwjjagkuTl7/Id4Ohq65zJK5XJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6ZeyDzZUy/yjbUwS2wtgd0mfdKx5nLTTv150YHMdSI=;
 b=fiEy+sqWCv3nPLrlkrNteFm9P8U4YLzFscD/Sy90iQwdavzwffBd22mmjUIvFIV+FfP9uAXETUI1krpyWJDCdE/7IWa7fYV3y80iljW2dRiWKGgzfVczDUEC7lEKI4tMFWPs6RgfqbjYeN6Rv0cwNXCeAPj6/J5rS9P+FOvx7zjUfqm5IcttbdBMYTZ7K8e9i2PzillzJN3fXanJah1KdIS2ST45ut5L4ixXJAo4HlL2/1umwbLTGGvG6QI3nBDzmmboDSWm/FVV6sfce5+GQyuiyO87uuxI4y1Ke6lMO0PIuBWA9rO2tphaQQpkdJCxZQ9Leoww4q4Rt7jINswaXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6ZeyDzZUy/yjbUwS2wtgd0mfdKx5nLTTv150YHMdSI=;
 b=VxpOqAGxmmTy2fCpbUmDTu2qyPnSX1ATBZO4+yyFc3oHFWwCp8KEvbwVj2z0jSu9V6BjM9rNtts9UdtI8wQ5byc4oaVtQc5oH/TzTnKo0NfKdKaZo9tKdyOBWxTg+K5VC25g0DAKBvW3aBVPhgHxeIMA+NGqxbYkufaTzqgt2lC49kNyPBBJAOV+1LALS3u2P3uvzUzv0xtvhJS9VCKAnkKnZ05Fd19xpE9Ct6G7OPWJBaD8C6oPlSx8F7E1sdWNVNCvTF4EpO49CikurNz26AmpntSdRLwd1GTApgdHYR1xgEBt2Z2WbdB+lxU4ddAamAvRK6vpwGolNPlUtNNN4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 IA1PR12MB6281.namprd12.prod.outlook.com (2603:10b6:208:3e7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 20:46:35 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 20:46:35 +0000
Message-ID: <8dde5b79-29d6-4840-be9a-31bc4af27cf9@nvidia.com>
Date: Fri, 6 Feb 2026 15:46:31 -0500
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
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <73B64D35-6574-4776-962D-865465C40226@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0P222CA0018.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::19) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|IA1PR12MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: 05ad9c92-9d4a-4946-cbf7-08de65c0d152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wkc1eUUxQzFqY2JBM2h6eHFMQklJRzBZRUM5Q2Q0blFGZ0Zxck15S0ExVGE5?=
 =?utf-8?B?bmdMeHg1SGk3ejhaOWUvMUwxeVRBRDV3VGdsNGZPWWttOSt2a01GbFpnSzU3?=
 =?utf-8?B?dEIxem1TbnJmNlA4U1VLaTNrSFhWamE4SE56eGwxa1VuL2dIY0dIRUdCdU1t?=
 =?utf-8?B?WlREeGtSUWdvL2VwaG1INE1QalU5OEQwWEhBZzdlTktndE9FN0phUDBJVHA3?=
 =?utf-8?B?NW50NFB4dSt5NFBnTWg1ZVJId3JXMzQ0eE9BWkRGSU1SK3NXQ3ZFY0lFRVdj?=
 =?utf-8?B?MWd6N1dlVlRTak16bnBOeFJCKzREaDAyUG1kclVqa2QvQVo4a2tXbmxuQkhN?=
 =?utf-8?B?SU9SUTNwbEdETUZHbi9OeGZmdHdzdmdwaXp1RVFvbGVsdXROSE0ybEZlcHNm?=
 =?utf-8?B?MFY4VjRqTzBKa0FIQVkza3NoQnowVFV0eUxuL2RpU0tRRHNVTUFXZzA4NEdq?=
 =?utf-8?B?VkozTkxTa1Z5bFlBR3NoRkc1ejFsWmMrRlhXYnRFTUdaNytkNGt1cGp3TkZk?=
 =?utf-8?B?eUhyY2ViMnZvOWcxWmVuQit5eTgrSkNXbjRYN2NrS3Jab0xUV1pydnd6THRh?=
 =?utf-8?B?U1pWZVA0b2N2K3YwR2pSdzdVdit0QkhGYlVINUtvQnZzekpWY3o3Ynd3L2Z6?=
 =?utf-8?B?dXlLSWx2RTE0MXRGakx6bmNQV2wzRGthSlVyeWZQN2t2OEpITEx3YjFnczNv?=
 =?utf-8?B?SVZabHpaNG1wN3g4a21oZWxrcGhiWklCWE9MZE50WVRPV3FmWFo5QWU4YjRk?=
 =?utf-8?B?UjBTODI4d0tSTG9vNnNrdy9KenlRMVM5N29JMUhzM3JQM0Y0TUJsbnVTMkh2?=
 =?utf-8?B?U1RROVRMaGtiNHArT2dUSUNPK0d5VGFrR0tDYVFRR2g2d3I3ZnJuczN3WHdH?=
 =?utf-8?B?dVBmVWk3NjF6YmZEUkxCaXlGcHU4MTcwQUxvaTk1YllYRmpjMTQxNXNRMWVv?=
 =?utf-8?B?SmFFS3V6VC9MY3lSSW1zb0tvVXB2SlJRa3RaN1dVNEVsbjI2R24xZnVxU2wv?=
 =?utf-8?B?WVk2U20zVWlKc1JRdnhZV0tSQThUem5QRDFzY3IxT3ZpclhDRzRmZjZrR2No?=
 =?utf-8?B?RFdaMGtCb3V6RFUvM1k3L1RPMEJDaHVIVDA2NEFva0syR1l5WXJNSCtORi9H?=
 =?utf-8?B?YzJNSWxtejZjdlAyenFVbXZSQUpxVkw3TzZiVmcxL24wY280a01lNmVWMURs?=
 =?utf-8?B?UmVnSDI0U29uN0d5N0lxanRBMTh2NDVMRjFWTG9FNjVOOWFxVkZ4NWl0eDhE?=
 =?utf-8?B?WVhqdnVjb0t1ODc0aU1ZL0JJQm9MVGtWVEUvVjNZRHp0Qzc4ZStKT0NFc1pT?=
 =?utf-8?B?dHgyS1FFaWFsajB1YkY4Y3I0WWVUcFVXY0tyRVpRL3J4RmZkTzVGZ3lKblRw?=
 =?utf-8?B?bGFIU3Zwd0xsRDZydE5LRTE3R3Q3cVVEbjVoWHRwbFJ1eGNIc3l0SFdhTGxL?=
 =?utf-8?B?OHQwd3p1UHowVnowUDhTdFlUUTZvSGNKZmJzZERBWUNwWkhRUzVZb3dmK3pr?=
 =?utf-8?B?a2lWTnRGalZBQjJ6bm9vNWoyUHF4T25OMUFuSkt3bGFaTzZsK1p2Q3ZSZnE5?=
 =?utf-8?B?SzhmNGZxY3dVUEk2V0dxaWF0MUpnVTlldHo1OXhodHorZEpCc1lMd1dHaVZV?=
 =?utf-8?B?YXFUNzJRWVBsRm1lTEdldDlKdVBoQ09wajdKclJvbi9HUVZIdGlwQTNkVWJK?=
 =?utf-8?B?bWtud1AxS3dEZ1NsQk9TUFd3bnplUFB4K3ByckZWRS9LNjhQSDJXSVdkVE1O?=
 =?utf-8?B?SFNCcXRYZmkwdnlmbkM2WUlHMlpxVlIvSElPWWhxL0N2NW9lV0hQTlE4Q1RO?=
 =?utf-8?B?eGFoa0FSWTVMTXpMeElyaEE3K0RkMlU0OENhMDJaT3VoQS9TZmZBKzFZR3Zx?=
 =?utf-8?B?NzVLNVlTKzdOckJjR0NsZVFmbmQzSXV1Q3doUzc1U01SUUlJRjRSMXBmdFBX?=
 =?utf-8?B?dGdOL2RoL0NMeWpDdm5FNVhPbndvcnJWV0tIU1hJRENnL25mbWVCdlFYM01t?=
 =?utf-8?B?Y3pzNXEwNHk3N09RQVBQYnVwM04xVFNyTFVoeld0NitQcUdnREZLVlBXSnEy?=
 =?utf-8?B?SDhBaVFCV0dNcFJYWjY4NllwMFBzNnZKTmtkaCs5aExiVmxYMWtOQVJDQXhR?=
 =?utf-8?Q?9i+g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dU9CdDkxWFNoOUw3Znh1WWVMTXpmSG9yRFE2djRNOStBelBoTE1JaHc3Q1RO?=
 =?utf-8?B?QjdBSWJha21OaTl5Y1pzY296WkE1aEw3SWMvQm43SHFZWDEyOXNRaXRsQ1ls?=
 =?utf-8?B?dXZ5QkFiQVBBeEViMkpxTXZmczVIREUyR3ZCVFhiTERUaHI5SWVDdFF2aFVk?=
 =?utf-8?B?amVFb0dWMFB2VU4ybElDMHBJVXNnaFZTZ08zQmhxMDVHT3ZNU3FQMnlUY1FG?=
 =?utf-8?B?cnRkdkRIUVM3a1lkTGNIaXBiWHdkN3dtUStFVXIrOGxJZ3R3ajkzZnVFbWhK?=
 =?utf-8?B?cUhKMmIyUUhvZk9OcXYya1pZT01PWXJDcGdmUXRISWQrcURrY2FSYkZVeEtZ?=
 =?utf-8?B?K1RHaTA5cFg2YytDOWg4UE96cDdoK0lrQy9kUUFCT3ZNaVBrc2xCc3RrZ0lw?=
 =?utf-8?B?K0sxZDM0RWpCSGV3QTJoSThLdWFHV1dvQlVhVll3ZENMazl6RHY5c0RXc0tJ?=
 =?utf-8?B?cUpISTA0d0hQOW01WENtSDF1T2QwUFZRbmE3STFac01TRS9jMlRRY2lBbDZx?=
 =?utf-8?B?ZmFZUGZCOWhkbkdvRENERnJyQWFjelNOUjJDcFErMUxiZjJmMFA4NzJ1anIz?=
 =?utf-8?B?bnJUeXNyMm1pUGtYYmVsSEtvQ0F0ZTRQOFFXLzJMYU9Oc0VvRUdkT1dkaHFw?=
 =?utf-8?B?WEp1RXdTZmZEOGJhd1IrSmw4MUY5QW1ETCtaL01QY3labzNoUUhCQko4K29u?=
 =?utf-8?B?dzFzeHArREdBUjZxVTNFVUlEeFZETjU4MlMwczhSZjliRVk1WVpxSnB2Tkxr?=
 =?utf-8?B?dDBRUDJoa2RJSVg1Vk5pNTNENS9iZktqTUZZT01mekxqMFUwNzZxYlk3cGdM?=
 =?utf-8?B?WnVNaXZwc2dkUzArWFB3cVYvZGtyaFhLaGpLN1p5VGFyQTJtQXBodDA3RUtk?=
 =?utf-8?B?b2EvZ3Y4Y01ZRVRGcUFlOTJibWZ1bU41RjVyc0R4dnd2R0gvSjc3TDFvWDR0?=
 =?utf-8?B?bGFDU0Q1STZYb0tZaG5qbmMwMHdwb3BDM2VaTEZ1RmNra3MwUDNQY0tmR3pk?=
 =?utf-8?B?djVZSnV0SWI4UGc0bDRMUU9WWnpYUmhKajIzcENMeHBqeEROV1dXM3p5SE40?=
 =?utf-8?B?R1hEeWtsbEFVRkl5eHZvckoza3k2QXZwcUNYYmF2K0I0b2hnbnVHRTRqd1Ns?=
 =?utf-8?B?SElQL1hHRHF5V0N1dU44OXhRdU9ZRFVGVUs4VFIxbVUwcnJVSXNUcXhtdDBs?=
 =?utf-8?B?ay8yTUZjdkpnUzlzYWM2SkZpaFlMbTFVcHNDRUE4bjBzUWp5Zk1kOHZFRGRS?=
 =?utf-8?B?RkRNNnpzMDF6MXFvUnY2STBaTVF3L1V1WW9yNC9jZU1YN3BJdGsyOTBrSHl3?=
 =?utf-8?B?OGFKVjJ0V3EzQlk5T2pXMm14Wm0yMHFFUGFaQnVJdW9yU3NTWC9aL2trbFNI?=
 =?utf-8?B?MUdGMWtxTkNGTzBWS3Z4eE53NUxaME1sQ09TTUJZSXNZZkJBL2JUYXZxV2Vo?=
 =?utf-8?B?RWhwZkRYZytBT3lnM0JWbWVvRjJEL001V2ZiWEhnaWFGZXZna01OdXpNVUdt?=
 =?utf-8?B?aTROYVlvQ1QwVGFoWDF6TFBTOFNJSDI0bWxOZm12N3RPQ0ZPb3kxRTkwTlhJ?=
 =?utf-8?B?VnBzVVJneWQwQXBrLzFxQmd2VXNlSHoyVGsxaXJDYk9SZy80dzFPTVQ2alVn?=
 =?utf-8?B?WWpSaXFKRUgydkw5eGtEbWZkbWhzRTIwT1NiZ28xS1FlWUVveXdQY0oxOW41?=
 =?utf-8?B?VTN4WUJqMkZPa2d1UE9mYk53d25aV0pvR2EyUitKYW1tTW1sWUlKR3lSSmdU?=
 =?utf-8?B?Z0hpeWVlWW50b21lZnlsOFdxNVVkRFowQWpvNis4VFh6VEFJVEJ0dmhHdUZr?=
 =?utf-8?B?V1FqdVMzWkxybWxVTmNPa0toNk5vWlV6dGc2akg3YnBkRXFiUm04bVVBK29G?=
 =?utf-8?B?MDBCM2RwRG5ycktOQ3k4eDVKVkxNL1c0Q3RwTS9vQS9VWGVTVnBodk1jUmVD?=
 =?utf-8?B?RWd1T3dTTWVKUU5FQ3NpK2JIWXlVNGhSUWUxK1pINURRQzJmQlFzNDk2S1hL?=
 =?utf-8?B?Sit0NVlPcVBuYXc3eUcrL0wzYVVGbVpGdm1YbkVTeWJoOWZsVGl1RWo3Y3NN?=
 =?utf-8?B?TjFsOEtrOE95amlpdEFMQlloZjREOUMzZERCVXdlZlVXSDBzekxuK2lscURC?=
 =?utf-8?B?VXZ0cS8zLzlJYWdJQkFacVpQaTNYTXpBWWJ0L3pmWG93REZTRm9FYlVWTnhx?=
 =?utf-8?B?Z0daMkllZDdGelBKTHdCcFl2V1pFOFpwVTY5R0x4WGZQZ1c3dkZMQWw5M0cy?=
 =?utf-8?B?VmhscjJFaHdwZ1pOMnR2L29kZWE0Zk16UFhWYVdUcE1nVlFWbDVibVRRNU10?=
 =?utf-8?B?QzBrTU9JcnYyMjI2c2NpS1hYcm1MMmNwTWF3dytVSWVaZFJGeTlOdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ad9c92-9d4a-4946-cbf7-08de65c0d152
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 20:46:35.6919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gr4hPx99qm78jbUDBQ9vAHxXYX1js50mPHY8UGbDPFxsH3Ei8VwlBSeE9sBtAOwsRE+/DFk2JWHXxJHW5eDhjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6281
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
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,joelfernandes.org,lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AD3F7103383
X-Rspamd-Action: no action

On 2/6/2026 12:49 PM, Daniel Almeida wrote:
>> +#[repr(transparent)]
>> +pub(crate) struct CList<T, const OFFSET: usize>(CListHead, PhantomData<T>);
>> +
>> +impl<T, const OFFSET: usize> CList<T, OFFSET> {
>> +    /// Create a typed [`CList`] reference from a raw sentinel `list_head` pointer.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure
>> +    ///   representing a list sentinel.
>> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
>> +    /// - The list must contain items where the `list_head` field is at byte offset `OFFSET`.
>> +    /// - `T` must be `#[repr(transparent)]` over the C struct.
>> +    #[inline]
>> +    pub(crate) unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
>> +        // SAFETY:
>> +        // - [`CList`] has same layout as [`CListHead`] due to repr(transparent).
>> +        // - Caller guarantees `ptr` is a valid, sentinel `list_head` object.
>> +        unsafe { &*ptr.cast() }
>> +    }
>> +
>> +    /// Check if the list is empty.
>> +    #[inline]
>> +    #[expect(dead_code)]
>> +    pub(crate) fn is_empty(&self) -> bool {
>
> Why can’t this be pub?

I believe this was suggested by Gary. See the other thread where we are
discussing it (with Gary and Danilo) and let us discuss there.

-- 
Joel Fernandes

