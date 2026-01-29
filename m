Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIILJL+xemk79QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 02:02:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4220CAA78A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 02:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E87210E796;
	Thu, 29 Jan 2026 01:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="so7hXBch";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010032.outbound.protection.outlook.com [52.101.201.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC1F10E790;
 Thu, 29 Jan 2026 01:02:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mnm877zByl+J32w7eqbEqxBR+dPPQbb0Nwk4SjDdO+YBKtWxZAU3Kf/yKWOwy5E9CarTCDcRUTFq1SpBgpdDBxyEGlZ21595O/1k12ax8/NCpH9LDjyyv5yFy/zNfiiaSkqatMZ3TumzYR8qPV8ihaEi+La4hmZ7Dl4UNVTU9JKjkbzEi5J8R9szNX2QdZVgt0PYbM6kk3r1uXosCle64qV3e1M+WtdXvu1+cWjQ5D914pbsC1XdHttATnGar47KIQgSNd1jlVLesZ0r6ODHA1tB8UJ9BiI1KEhQ/TgYjAXvkXcetlXdxuRlmZtmSdaJxjw8pzuJvJOtJCjP7/fLuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weAUWs0WdH0BOha+UMrOauKm5aFvrFCncD0sX+WVUK4=;
 b=VL1x/tGAPuQgHIT/RIPzVqHfL9sq5wBhH/guzusNek4Kw0EvRjvDUWD92OuhCfD1cY4SUQUNBAbt/iimfrFRIxLuXLvrgr48MIfqwVkY/U/CGdA+d0VrE3jYpoM4YVuV4rwgDXRBah4tQM4RA6jsuJabjKWIQIq6ZriRgG82ajBeVh0nmLO83BsW7KwCGdEMQE5FNyITcTm6rAHdr85XlHC/NN1/dkRzuBUhmvOBhhRvBS7rUMPrK3irXqoxI5eiIXc7pUoUHDEa6eBudyXZ66C+EaJPXJXZYr/OSKHjtwzZlZPXB2IF+kR8fGdHMwXDHWnqJIBdAe/WJv8GgS578A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weAUWs0WdH0BOha+UMrOauKm5aFvrFCncD0sX+WVUK4=;
 b=so7hXBchkQOEltYhsvPxTWcBgvbAS5ehIpnpQQNjR5oW9NXqVeSC99uCXWC/1d1yCejcCDur7WRoC5tfZZaRJCrVw4ASJJRa5fNWEXirH0AVYnzNgc0AlpYIOA4gjcsr42txkRnHv3LgMudJBO7sODyt0lmpUPNDSa7ZtKp2TwDW3TQjxNnjlkq5D278DUafYhMZYVjUfhir/tyWpBgcaJFKgCf8Ku/GWZQk9WSNZRs3IPYy3ygcG+xkbm4XVJn/cuROAY9AEGAeEYapArqVXGFf8OZ0Nll4nDKxjPpXTAhFDW5TEl+9YF40siTHsePlzT8bV+KUD3zaI6D7lnGQDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by IA1PR12MB8556.namprd12.prod.outlook.com (2603:10b6:208:452::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 01:02:44 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%5]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 01:02:44 +0000
Message-ID: <bd6fcda9-0d76-4208-b6c1-8df6f9f4616e@nvidia.com>
Date: Wed, 28 Jan 2026 17:02:33 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
To: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>
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
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DG0MXC1R8IRS.Y5X6XDUBOGR5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::27) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|IA1PR12MB8556:EE_
X-MS-Office365-Filtering-Correlation-Id: beb0cf1c-5734-4127-5f37-08de5ed21bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDBQTVNnTWd0VU5YSC85SU9WRGcrWHIvQXhoZktaK1ZxL0cyVzFEdUJQNnlt?=
 =?utf-8?B?akYwanRpODNWUzNqUm11YWdMQXh1U1U3K256bGVSY0xTM3c1L0R6Vy9lQ1N4?=
 =?utf-8?B?b0FqYTdwSlBDR2RyM1MyRTRPS0hibVZpRzlIa0hJYXBGWG0yL2RnMTBSYjV1?=
 =?utf-8?B?Sy93NUF2SVFBRlVrTlc0Ri9YOUNkY3hoNzRBZnhEVmU2b3NXazBXT0N5Y2hX?=
 =?utf-8?B?NnBHeENvVE5xb0V4SDVabFNCL0xRZDVVbis1SUVIT3FGR2lZaXF3QUJkdDlS?=
 =?utf-8?B?S043clA1MTc2OWRWa0FSMUcwaW5FZWEzeDRkUk1TaWxqV1Ewa294SFpBb0dP?=
 =?utf-8?B?TG9XZTBWL1pjUmo4TnVSWHJFbFBTYmQ5cWRoc3J1YWVTUkpnUStiTDlSSktV?=
 =?utf-8?B?VjVFejU1c000dElLTG5mSWw1eStBNHFCNmN6azRhd1BjaGE2QzU5UWlMY29R?=
 =?utf-8?B?OWNpK1BWbHZhL1I3TTlLQjNaa3BrK0tTVk1pWGoxRUR0WUcvNEU4dHJhQXpn?=
 =?utf-8?B?dTF4eVRzKzYwMnd1MVFYblE4QURld1ZMTldsM2dGR2FRZ2JiODBaWGQ0Mm5Q?=
 =?utf-8?B?YkVWWVFyeUk2aStUd0lDU2tKNFFrbTFlYzBDOFI4UWlvWUN4MC9UbGNPL1FD?=
 =?utf-8?B?UG5mMlJxMmlKeXRYSThkU2NMQnJicDhWa3pFZ2RnOEc3THB4Um5zY3hlYUxt?=
 =?utf-8?B?bkgrSmx3VTlSMWwvZUpMOEwxQjdpZW43bWhmM3gvQ2F5NS9rS2lZRE9aMm4w?=
 =?utf-8?B?V2c5NERIWEFHaTMzb1VYeHFuMkc0bENDK3hqMnN2ZGh1WDFRb2lhQ1d5M1Mx?=
 =?utf-8?B?UElNdUEreDFyenlrQm1hQ1krazROYlFTK1laWWh1Tmk3NllPM3VmaEtHQlEw?=
 =?utf-8?B?VkZ5bllyV2VTd0dxeC8xWjlWc0N4bGlnR09JYUZLdnFxUXV6V2ZQc00xdGYx?=
 =?utf-8?B?QzBFcG5rMVJDK3lNa0lYT000NXhCMi85NE9TcW81RDJxbUhWdTZabFAwL0dk?=
 =?utf-8?B?eEUzV3oyblQrVEUrb0JubXluUE5ncmlRMTJzQmxSclhVdThlU0IvNVplNTZz?=
 =?utf-8?B?aURxeFM4K3NQZDAyNVRrWDMvOFRUeFNOVmhPY2ZxbHpqM3dXTi85UXZyakZn?=
 =?utf-8?B?MFBaMWdBdkh6Q1NydkdXVWZDYU1YaUx1NDhjWnlWaFJSaDhXRTh0ZG5sNDdO?=
 =?utf-8?B?WlhLQ0FpS0FTeERLcU0zc0FFN2FQdFk5SVlPNTBKQldrTTNEVjlYSUdibWd3?=
 =?utf-8?B?dTFkcm9IVVhZMi9ZWVJmQW9nQmN5WHkxbGsvVGxBYzJxdHd2TklOeWRzMytx?=
 =?utf-8?B?VTRDWThYejNBV3dOMTFHd3pOcC9NakJId042blRLQktGdHpyMlBybGl2VmlQ?=
 =?utf-8?B?S2lwQXV4MWxBSlRreDNNa1hJR1V4cVNpTFpUdWNYUVgzemxyUjUwc1NBVFJX?=
 =?utf-8?B?OHh3QTBDU1lrZE1xc1lnTnY5NzNTV1FNOTRSODJpdWJ5MmlYcUJraHhmQ3Q5?=
 =?utf-8?B?cVVLU3Z5ZVJ5Z3J5a25aWjRHZU9iTFBLOE9LRHJuT2Q1ZytNOG5VY0JiTnp5?=
 =?utf-8?B?bWFVTGxxRWdNazA5aWVkZU9lbUU1NXhxME9URnVXd2JqcFNQSVdLazFGazJW?=
 =?utf-8?B?YXY4c3Z0U3JLTWhxZ28rVCtTNExJNE96QmxsaExFWFI5eFRqalZ2d3BrZ291?=
 =?utf-8?B?TWY3Mk9zRFNlM1ZZelJ1MnQ3anNFZFl6Z0RnL21LNFVXKzZOQXZuQi9rS1NG?=
 =?utf-8?B?Vmd1SGtPU0xETUFESU9PMWZBV25lTVEzamowWUdiVmpROVZ2MkNkc3RDUFRP?=
 =?utf-8?B?V0VEMERBQldjcDJIOC9XVmxmQ09HdFhKdnFYNm4zSktHUVV5bVphOXhoK3hR?=
 =?utf-8?B?anpuam9EZEtNOUxweVE2WFhYT3NobHk3UC9uYUxyTm9oZDNhZXM0aGhjWm90?=
 =?utf-8?B?RHRBZnY4ekNiRGpOaWphUHllM0ozckJDNzk1WFc2amVnalYzU2s5TkhrS2Q0?=
 =?utf-8?B?WjNBZHl3cEJ6VnNySEx5WnNsS2s0U3luVHVqTnNlVUVMNUUrdkkxNEROekpk?=
 =?utf-8?B?ZGpzZG5pU2tYc01oV3Q1dlVLN3AwYjVUK1hSWVRrSi9pOXFMZjlzMWhpK0ZQ?=
 =?utf-8?Q?77fw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR12MB9412.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHhGNW44TmVialEvZjBNV1YrSDFaQUdkcVY0STNjYnN2L1JZV2hrQmlnT05K?=
 =?utf-8?B?VWNyVGw3WEJXak9XOVlNV1RVbXJ3QUt0RXU0eTRSRnY3cEJERm96NHQxWkVy?=
 =?utf-8?B?N3RLNytnODdCblBGLzdyM3FkbTkxcTV5K05yVDRNMEgvb0ozdm1TclovNDVs?=
 =?utf-8?B?R2U3S245RldFUnVwY3hXQmFRMHZuS0E0cnhJckxVVmxVcGwzWlVic2RmNXkv?=
 =?utf-8?B?Sis4blNZVVBCMm4xa3FpREFKWnZyaUFNQjVaQ1JxL05VNWw1Z3hkZm1PR3Z2?=
 =?utf-8?B?cVJGenFva0sySWoxRll0Z2tISVNmYThMT0pSNk9NMlpjaVB3NlhwNFgrK1ZE?=
 =?utf-8?B?V3RKNkdNYlhxcTB4czNCL2kzbWJId2xvdCt4WjNQZVZDNi90M0xkd20xUmV1?=
 =?utf-8?B?OWM4VmEyOXhvMGRzT0ZrY0dtWm9LeHZuM3U3MFp5VW9aaUM5UlE5VmpCZnJM?=
 =?utf-8?B?UmJMaXlFUm4vZVFFMDZ1dmhZQUsxM3RucENRL0w2TDV0R3J4cVBGa3NEeWUx?=
 =?utf-8?B?ekZGU2dvbWhMbHpkNzFUUzV5TkpYVmV0Um5XRmdRZWptanlGUTRweFUvSXRm?=
 =?utf-8?B?V2RZOUhQZkYrZmEyeEFrOTJzbDFPcWRLSmNVVHZZTFJ0d01ZM3dIRlBqYWNr?=
 =?utf-8?B?K0dhOUxmTWZUdnE1UW5WS2U2U2pQa0ZvRUpmQWp1QmxUb2ZJTXMzV0FDcmVK?=
 =?utf-8?B?d0NCY0E0bExIYWwrbWNzVVdVMmFJMFZZOGZ3SUVKenpVVU01SGU4L25JMVZF?=
 =?utf-8?B?QWtYTWZyQXZ5UTVpNytBR002MnNtcFhYT0FwV0VjZ2J6dlRISzdKL3lZbE54?=
 =?utf-8?B?Q1JVQ1BORHJZNURZSWorNEhsUEE4L2l0S0FmMzJ2b1hWaWVKb1RxT1RsdW9O?=
 =?utf-8?B?eDZFQk1odS9VKytzY0Q0VDEwcW9rVWVsVzIxNHpRUUNUUmV5WFZpVitVbmhG?=
 =?utf-8?B?SjBuUlZCdnJwblV0K3padC9LY1FPWDZvZytBZXluZkRHWDg3ZzZuaG1paWNE?=
 =?utf-8?B?NThzVW5WUHoxWExvNitmcmhvVjJuVXJ6Z1JlcGNlbUFIeVFqNzhJRzBsankz?=
 =?utf-8?B?OWdNMEJ4VG5Fank5SzVtWmMrR3Z5cE5rc2cwYVZKWEpEeVNaNWxSUldQNHFZ?=
 =?utf-8?B?NlB2SDg5dkIyMWZtaVFlNHhaNlFPZEkvcUpOT3J4Q1RXOFY2cmtaeHdEZWZM?=
 =?utf-8?B?aUgxbEt4M1ZkWjI0TjQyekVBbHBKZXJzbDdOdmQrMFVLWFhtVjM1ekNmMlZ5?=
 =?utf-8?B?ZU1KLzFQL0hYNEpUSldJNi9VVXR3T014bVQwN1FzNDFVblFGUytZZyt4R3Vq?=
 =?utf-8?B?SXlBL3BTdTNldzJ6VDV6ZHlscHNmNU4vTTlYN00rWHBUVm9lanNab3pkODNp?=
 =?utf-8?B?ODFlMUZmYzlNMFR2YmxpdldFMENJUTI0WEx6b2R4Y0JVcGJqMUV2eTAvUUM3?=
 =?utf-8?B?dUxTeHJvUlB0YUJqUUZhazNGNnJDR2lFNFNFOTV5YmRXTUNBd3dKR1dDbDgv?=
 =?utf-8?B?WThQWkUyMEVUeGFJZjAwWHNjeE5WYVJFSURXQm5hbFBvZmZUb2ZxbDRhbDFz?=
 =?utf-8?B?TVJuZ2J4cngvMnNGZzdVVUp2NS9VcS9MRnVHKzJtYy9HL0l5Sy9DYy9ZTXVB?=
 =?utf-8?B?bjdmQ3hUTytFUTBnaG5YSS9vY3U1dDN1Z0ZFVGtPNERtQWpBNTNLYXNpQ3ZP?=
 =?utf-8?B?Nnk5a3R3UkRrUjg2cWhWQVNja2xjOGhWWWpIN0lxcTF6N2hxa0E1NGVwQjFv?=
 =?utf-8?B?Q1NyWXhyVVgzemtLU0x1SkZycGlqMUVmUXkzNE1HWEtVV1FTU0pCMzJ1TFgz?=
 =?utf-8?B?R1FVY2lmK2F3SVNUckhXWWptYlVoTFlhZzh2MDFBc3E1bHZPU1UyVlRST3Rn?=
 =?utf-8?B?Si9PZWZ0RmhjbGhVbDk3Q3Y0UFd2Rk11VDdSTGRUbTdBWjV2TVMvaE9BbWk5?=
 =?utf-8?B?NW1zbnFZV3QwSCt6c3Z4NG9SS0tvVmEzK2JvU0dpc3lEYlhrQUJ1M0czNnN3?=
 =?utf-8?B?M0NidzQ5QXk0WFk3MGRWS01SWWVTK2VRb0NRSllMSmV6eHZyU1B0N0o3RDNR?=
 =?utf-8?B?TGcraElEOWtBVjZnM0N4ZzJFUUlqaDh6Y3hLTG40QkRTVm9maEljQVFhem5j?=
 =?utf-8?B?dUczSGxnZjFlc2dzWWMyb3Y3OU8veHIrMm82UTJObnRWMmlyWEFuZUUxL0M0?=
 =?utf-8?B?UnJqTlUxTFlCelpzaWtENkFVZWFrY2dReGsxVXBYOEgwcytzdnM1cWorbTUz?=
 =?utf-8?B?a3Q0Q0dTOEdGUkFNMExkSFRVaG5JcEg5QjNVd053akNURnBuSUpWZzVwRFFr?=
 =?utf-8?B?dHhMSWZLbXpFNWtKUTFGUUMzd3dUM3k4RjNUanMxZG5WcDhJemZiUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb0cf1c-5734-4127-5f37-08de5ed21bf4
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 01:02:43.9813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rs4JnQ7TM6LWPg7qJOYHfVdItS+CjmC4Ixo3wbfYp/YaTNW0RtE/crDrm0sCbeg9JctOPR/zU9ULfY8/0x5nMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8556
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
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4220CAA78A
X-Rspamd-Action: no action

On 1/28/26 4:09 PM, Danilo Krummrich wrote:
> On Wed Jan 28, 2026 at 4:27 PM CET, Joel Fernandes wrote:
>> I will go over these concerns, just to clarify - do you mean forbidding
>> *any* lock or do you mean only forbidding non-atomic locks? I believe we
>> can avoid non-atomic locks completely - actually I just wrote a patch
>> before I read this email to do just. If we are to forbid any locking at
>> all, that might require some careful redesign to handle the above race
>> afaics.
> 
> It's not about the locks themselves, sleeping locks are fine too. It's about
> holding locks that are held elsewhere when doing memory allocations that can
> call back into MMU notifiers or the shrinker.

If you look at core kernel mm, you'll find a similar constraint: avoid
holding any locks while allocating--unless you are in the reclaim code
itself.

Especially when dealing with page tables.

So this is looking familiar to me and I agree with the constraint, fwiw.

> 
> I.e. if in the fence signalling critical path you wait for a mutex that is held
> elsewhere while allocating memory and the memory allocation calls back into the
> shrinker, you may end up waiting for your own DMA fence to be signaled, which
> causes a deadlock.

Right, and the list of pitfalls such as this is basically limited only
by your imagination--it's long. :)

thanks,
-- 
John Hubbard
