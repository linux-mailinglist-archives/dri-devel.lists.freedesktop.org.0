Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9346BC5503F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 01:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A732F10E7BD;
	Thu, 13 Nov 2025 00:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q9bLHvnh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011071.outbound.protection.outlook.com [40.107.208.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2155F10E136;
 Thu, 13 Nov 2025 00:48:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjsLJ6i9Hsq4sR1duEBbuf905YMCdwAY4brAv6DnYQPsrKrGWbHumKq7NPDGcPLuC+M9l4I8FeZtRc5Ws/vs6OEEevmfVj3b5iHj3v3XNv65FVSyqXGxotYhK1zEwd8DuWrlaYyba5lsLVHEQmQ36QQhPUMgXw1wSrI04wJzQsm6TDBtLofjGS/wU7hPmEDCXS6URHhvimuo8a9wVdSTec4pm1tL4LBEXhh/pR7wnYtN1hAYC9KFS/HGAn2AsZjzLJrM6VYVE5+h31W5GGiCXe+FL+sFTI0KgqcO1JgLqnRpvlEEI6UZoeW3N3I2tK09tDWRKCs0u0e5vTJFLnl0iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Juq9nQack7IOTfG4it6SqdkhTtNNsnX8fSEczAmoJ0o=;
 b=Ux6Nwbc5BN/WdvLHTZsgRbGnQARxWSsJEerMxP54A2El34RczGP3QbEbb21+nvz8KN8tWW1FTrobCOJZViARaTCdgPRUwCJqfqu7dI1qZaquWBtxV768g/ive5JdsFCATH4+d/+RKVwobAXMISbYvuIFWHHCg6Lgp6oGwoRCpuMxYV77qGQwbcj0amYN04tLe4UowpA4E4aahVkldteBH4FdBH+4ZYvy7F6HN3rR7Q1hbu3rznzxHRQbna07SwwmP4rYpE9XMeUUFhg3lIAt+F/fzXBQr+Aon5KDYC/KypmtQO0rLAGuvf+XIW9P+jcBZKjPYijp+Dp2VAAyVKe93A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Juq9nQack7IOTfG4it6SqdkhTtNNsnX8fSEczAmoJ0o=;
 b=Q9bLHvnhCVPBmBfzeSXRxPOQd28rSuUD71tkjiRo55Mbg9WQyRZeP42dZbZKqYoiFs469aP8XI/rc7iQ8gLlRuqskAGptUR0HJSInkF0t1txt5q2E7vhek/nk0c0/b33F6xSBRPII00r0AkeEk804COHKJyF0+7Ur8X1DJCJFIeTg1jMXuh96LuF4cuOeB7EZ8HYi6rts3Uv3MidkQG66jAAZFg3UdSNJtOoMvYf0+Awm93vy6Jio1HuEuaSuR9VCHnfHda7DUAiHOudawfSJf0bN8qMD7oHoQXkN6a6nb6mcBdfqylSsGs9fWXNGSIZllnX0OclA1xwOuxo5YlyGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB8218.namprd12.prod.outlook.com (2603:10b6:8:f2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 00:48:22 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.015; Thu, 13 Nov 2025
 00:48:21 +0000
Message-ID: <fe576143-6d8a-4163-9bff-150a1bb6e88b@nvidia.com>
Date: Wed, 12 Nov 2025 19:48:18 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/14] gpu: nova-core: Add bindings required by GSP
 sequencer
To: Lyude Paul <lyude@redhat.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
 <20251106231153.2925637-1-joelagnelf@nvidia.com>
 <20251106231153.2925637-7-joelagnelf@nvidia.com>
 <633efc3cf216e31f17e448c64edb4f02a4317eb5.camel@redhat.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <633efc3cf216e31f17e448c64edb4f02a4317eb5.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:208:32e::17) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: 58283701-5bfa-452e-c7f5-08de224e5827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFJvL0FwVkEzVlVWMkYxWStkMm4yc0xETjZRQkhjM093YkVnWjZzREFXU1lo?=
 =?utf-8?B?VmkrRDk3THRlTjJJTUlWVnR6Q1Fjd2E5UE5BRGFZNU1TWnBtS2krV1kzb0lW?=
 =?utf-8?B?bG1tVWQvQ2dyb3hNQ3dGMmMvMFdJNGZKZGZnUllpUmwxY25KQ0tlaXZqd2lV?=
 =?utf-8?B?THhZQmIzZEMrNVg3RWYxcjYrUDM5b3VXK0x3MXJQdld4bG5jQ1NWRThOTlQr?=
 =?utf-8?B?QzJlamY1TFNTTFJmUnJxU29uODNQMXpRcjBRZnBCcFZDWGRNVXVQVzliREl5?=
 =?utf-8?B?NS9MVHAwOGtjU0Z1MzV4N25tM0lSSUx3R1BWNzFiTEpYejUwM0Vtc1dJUFVo?=
 =?utf-8?B?U1pQSG5TM3o5QStIOXRGVldGZENHVVVlUlYvR2JTaE5WaFQ3TWQzS0s2MFNL?=
 =?utf-8?B?NHh0UnVRbDdHazVwUHVYZlZPZmM3UGJqUGhWOTRDaVRuMG1rS2JrQU1EYmxI?=
 =?utf-8?B?d0ZBUnh3a3RnbTNvdXlzd3NHU1hEOVpnbVlyNFdGWUVvWWhabGt0TWFWT1I4?=
 =?utf-8?B?Y3BuajlySWpyMjMvVnY2azhSUVphV2R5WHE4QTR4R0ZFUkp1L21CejBRdHZ4?=
 =?utf-8?B?ajFxOThhVElpS3U3N1dGaUtwaldEOG1xdEF4K1I3TFM2Lzh2MUc2UGdJcEpn?=
 =?utf-8?B?SjlKa0NnRnU4QU85LytHeFhML3pWTmJnQXVZdEdqVmdHSURITnZJM2ZOQnUx?=
 =?utf-8?B?aWdRR2txSGNaU2dZWWVsLzZrWTRJR0dVWTcveWNoY3VUQ1ZxL213Y1VBN0Uz?=
 =?utf-8?B?eGxKNzkrZ1N2anZjOUVuc1Y5cXJuQWIwYjRBZ090Y29qdlBIMVM4OGkyOUJo?=
 =?utf-8?B?YThUZEZ4ZnVXYlloZ2kyRjg3TksxVVk3RFIxNVBORi9hRjJ4NkV6UEx4S1Nn?=
 =?utf-8?B?enBLZWlWTk5aQldHcWs4OW1LVUc1SkNWUmJ1Y05YSldLZnRzUXlBWktYNnFD?=
 =?utf-8?B?UlNHWXFObWRHNFJBOEdGNUtmYWdZSkF4MGxPMldLcTJEY3laQTlzSjF5a0c5?=
 =?utf-8?B?dXZOV2tGRUVBSUQrNXhld2Q4K3M0ZW9WN05OM2pUZFpacis1WUl6L25icmFR?=
 =?utf-8?B?ZjdjbDA1T0ZMQjFwcVdpMmlzNnh5WHUzQWg0cTl3djdQYVZnMmw0QS9GVVZD?=
 =?utf-8?B?QmZmbzZKc2JDVWZtRUh4RkorRkRRL0FJOFN6SzE0ZXJ1VVVqS0RhRUpaUzNy?=
 =?utf-8?B?SUx1eDQxNjA1aWhUd2dpdFVNZUcwckZwVVJRbDhSc2hOdE1pb1dpaWVXMFQx?=
 =?utf-8?B?OVRmaXdONDVuSnp2cHZzc3BRaXlSU0JqM0FRcXZEU0tRNFlHWnJYTmUwLzQ1?=
 =?utf-8?B?TE9QaHlobFlMMWVwU2w4UkFiSE9WRFBTNUROQko2dXBZdWkyM09qOGZtakt0?=
 =?utf-8?B?MXBROUVyVGhKZCtwVyswUTBPaStYRXp6dzVWVWxxUUFDWFRRYmJmWTdTMVRN?=
 =?utf-8?B?ZjY5UnBkenNodm1rYzhqV2FKenV4WTFoQmZrUDVQQ21nR2dSaEM3MWNzTVZi?=
 =?utf-8?B?VlhVUi9aejIvRzZaOEpsRjlUWmY2R1QyenJMaWdPMDgrZUZhZ1dNRS81N2ls?=
 =?utf-8?B?M2d3SjBwTVpUQkpCZlUzNnAyV0ZmQWliTkNKbVhmSlRwUGZjK05Jbk1Lc0Fp?=
 =?utf-8?B?UXo0UHhvRXRQMGpXZ3FUM2o0VUk4MkRwZXlnTWc0NmQ1TFJPQXFXb3QwZWta?=
 =?utf-8?B?ekR0TWsxeGdvdDlVcHJxaGtZU3JaWDdqS2JHc3Qwd0lHM3ZlWkpsSDZ5NjVW?=
 =?utf-8?B?UFE4OVc0Y0tFMEZsUDlFbktPYnViT2cxSWRxVHZrUnQrcjU5RWNCbEptMVRv?=
 =?utf-8?B?QlhsS1NOZDByMkMwK0JKbW9IZTBjK3A0VUJXMFRCZjJuTmN3TEdLTTlMS3M4?=
 =?utf-8?B?M3JSTUhxSk44WmlPQStOTUN4dFVvaER3Ui9MeXI1NjliM3ZYNEhwZE1ObnE2?=
 =?utf-8?Q?aSONeUqU9u/kcXuwB2gjCu9D0EHSdzqV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3JYRzNPSjNMVzBjbEZzNURYNlJoZ3h6WkcyMnZpcTdpZWlVNUdrblFOY3Ba?=
 =?utf-8?B?SE9DaFNQRkhXTDZYRGdhYXRiUXluamxVSmd1dkpUTWdzSUI2aHQ3YVZxdVFO?=
 =?utf-8?B?RnFpeHZVMFVsZEhVdUlJdmd1aFRWRTU1Ry9hTmt5U2hjaTRtbkNvTnhsS01E?=
 =?utf-8?B?aW9oVWdYVG9EaVRJYzh2SGwxQmluTVJIRXlWWXYxOW5QWDBsdmE2eEN6emkv?=
 =?utf-8?B?ZWFKYVlzdElVSi83c1ByRW9HSFVKNmg1TG1DaTA4MTdvaDB0V3hWUURYTzRF?=
 =?utf-8?B?dTZrS2JFb1ZSakFHWjE2NjloNjZXR0JsckdPS1VXakN6S2xaa2dQV05vdTlv?=
 =?utf-8?B?TnFOT0lsVzVUN1RSSUZxUzgzMU92cTY1Mzc4QnArTVRRdFFCUnRUNDAyWEY4?=
 =?utf-8?B?Zmd6V0c5Qy91SjRzbWdnUC9CVFdncGNLaXNEbEV4R0I0YVJNeW51bWUxM3Vs?=
 =?utf-8?B?Z04wYzBibm41Qjc2YmdMVEdUcEJrMkg5czNOcGczZTZ5ZzdobkpWL05Yc0Vj?=
 =?utf-8?B?dWhlV0dwaFduTXNhZ3Rsc0VzU3dDS2x5YURodDhGejBXRktKQ0l1d1pGTHdC?=
 =?utf-8?B?bnZUZHdUUWtZY2ZYU2ZzT29yWllPQnpzQTNYcTQ4cEJZV2xVL0ZnbUw4RUk4?=
 =?utf-8?B?T1hUczBtRTBMaVRWOExpblViamZBZmdiT2R5V29SVnlSWEgrZ2MyYmdLS0p5?=
 =?utf-8?B?aDQ5QmtQaG5IblZtZ2gwTWk0MGdpeXNHVU1UUjBiMm1hNkhRU2NrSHVKRkQ1?=
 =?utf-8?B?dzBQMkxJcXBoUmxUZVJJc3lQYlEwTUtjdUh1THYrNVQyTDVQK3NHRXdQNGkz?=
 =?utf-8?B?M3ZucGg0alg5Sk9RYmpjWVN2NDBCQW0xekV0VC9oRkpleHlxQThKZndPR2Zt?=
 =?utf-8?B?eXVyYmxwSzNFK3NXV0xyc0VFWWpiK1h5cW1ZUFNTckZKVS93VU40QjE4dGRQ?=
 =?utf-8?B?YUNaQTN5azI0Y3IxQTFHUlEvcVlUTmRLTFh1aVVxTUdZMS9WM3NKR1pvTTQ3?=
 =?utf-8?B?UlIzTWxMTUlqTCtRanNrY1RRK3Z2YzhORHhaUG9Oa2pSdTVvL0dMelo3VnQr?=
 =?utf-8?B?YmxGY3pCVWQ0ZG1TTlBiaTFqVkZ5Q0xSK2FoK2VYTE1xYmJUdjJPSjRSaG9W?=
 =?utf-8?B?eGxucEVyOVhucGFEWmpNZk9JeEgrQmVBRitqbkpOZGo0ZmI5OWxSdlo4M3Jl?=
 =?utf-8?B?WC9TNU9OWU5BcE1zbjdydXorNU9IbmQwNFZCMmJ0Z1dqMnpGa3pUN2J4R2hi?=
 =?utf-8?B?Sy9oa3BUVHp5dGVkZ21KZDdTTjdOSTBGRlBMdEZuT0NxQ1l5N0hVLzlhNkxI?=
 =?utf-8?B?enNaaFIzckwya0ZCcldueFRYY1czZ25lZ0xxNmhycUF3SWNuZjBZVzdmdUxG?=
 =?utf-8?B?Q0NpWEVTSUo1WnIySU1NVXdUdW9Sc1FnczFnSEplVCt6SGV3aWloeUZRUkwx?=
 =?utf-8?B?aGxVU2h4NmNoUjlDWGJsa3NXUUMrU0NtVlV0ank3dHA3NXZKV0RSRmxad29K?=
 =?utf-8?B?azdVWFJCcUZKamVBNG5yc3RpVlFHcDBseWhidjI2d09hNFFJMG56MDJsdGJS?=
 =?utf-8?B?bGw5eER0NjBaQmcrS3A4Vm82N3c5ZkRFdEtWYVcxb3pUR3hGeTA2UlFESHlW?=
 =?utf-8?B?L1czSzZxdnZKZG1JbU5DZXViRVVVbWhkVjI4VUIrM3dxVURhZVowQy9pbi94?=
 =?utf-8?B?cnRidzlNT1RyVkN5V0RZRG9BSTNnQ0NOVjJLYzVtWDNlWFcxbUx5dGZVSFVG?=
 =?utf-8?B?d010bXJoZG82MkpnWlNRMDM0aWorZDgyeGJvVEhmV2NIbFRSWWIvWE00SkVo?=
 =?utf-8?B?VVBMOWxVKzczSkxEZ0NSRWh6QmpTS04yZm9sTmFtam9TYTNYeW1mdFVjbFBv?=
 =?utf-8?B?b25QZWFqU3p6VUhDRTNaWm0wZXV6M3U2TjZ2QmRucm9xY2JjR2VqNTBzRlBi?=
 =?utf-8?B?dTdwNkg3WXpqcW5aU01hMVF5aXk5OHBTODBtWTE0b3dYZDJuMHppL2RSdXZ6?=
 =?utf-8?B?QVpDbHRuYStRYVdVNS9IK3ZOcWtyMDd5L0NocHRkVUtCMTgyNDZQTTFWRnVF?=
 =?utf-8?B?U1hpZHc0ZlByRXJkbWlKVlNwZFlOdXh3R0NQTW0xQktNajdNbDg1SG80YUJy?=
 =?utf-8?Q?U6IkP41XIEYZYLRxVfjZfglv2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58283701-5bfa-452e-c7f5-08de224e5827
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 00:48:21.7052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: liquk/JlGzcl4CEAWoc6vISwYeLI9EXaNI64BvaPVCeeeflgAmZlnAQFpvWXF5rjaO8Vrc71/XP+olw9hSbHRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8218
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



On 11/11/2025 4:43 PM, Lyude Paul wrote:
> Doesn't this still need to be abstracted out?
> 
> vvvvvv

Yes, coming up in v4, already done.

Thanks.



> 
> On Thu, 2025-11-06 at 18:11 -0500, Joel Fernandes wrote:
>>  
>> +#[expect(unused)]
>> +pub(crate) use r570_144::{
>> +    // GSP sequencer run structure with information on how to run the sequencer.
>> +    rpc_run_cpu_sequencer_v17_00,
>> +
>> +    // GSP sequencer structures.
>> +    GSP_SEQUENCER_BUFFER_CMD,
>> +    GSP_SEQ_BUF_OPCODE,
>> +
>> +    // GSP sequencer core operation opcodes.
>> +    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET,
>> +    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME,
>> +    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START,
>> +    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT,
>> +
>> +    // GSP sequencer delay opcode and payload.
>> +    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US,
>> +
>> +    // GSP sequencer register opcodes.
>> +    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY,
>> +    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL,
>> +    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE,
>> +    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE,
>> +
>> +    // GSP sequencer delay payload structure.
>> +    GSP_SEQ_BUF_PAYLOAD_DELAY_US,
>> +
>> +    // GSP sequencer register payload structures.
>> +    GSP_SEQ_BUF_PAYLOAD_REG_MODIFY,
>> +    GSP_SEQ_BUF_PAYLOAD_REG_POLL,
>> +    GSP_SEQ_BUF_PAYLOAD_REG_STORE,
>> +    GSP_SEQ_BUF_PAYLOAD_REG_WRITE, //
>> +};
>> +
> 

