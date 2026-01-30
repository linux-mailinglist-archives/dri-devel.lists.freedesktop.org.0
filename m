Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMY8M3wffWmYQQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 22:15:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 808BFBEC1F
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 22:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE4810E956;
	Fri, 30 Jan 2026 21:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NFAd2r0z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012071.outbound.protection.outlook.com [52.101.53.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD15A10E34E;
 Fri, 30 Jan 2026 21:15:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2RS0Q/DI8Ksc/NRQuqMPsrOjkusko5XT4YdQb4Bo1BhiUFEP6VeVeSKfTr470LFgBHqj9t4U+ogtsSq/rs/4+xL5/SdumdfjI/8TTc+4ekhD3vyzGRPcIMNd0A85QEjA8ure2gSf0Qe8umPdRESRxdFPTg/MZQxx38V0jNlHeZapSM44UlZfo1TNhHid+2MN4QY7FaZObEgspSbIZkQnXsFag+lUABZBpJt9A8n9PffwCGHJw3+TemxiS/jJR9dqqogzvVypxteSrZFNhpB4T2vFmMsFI9S7hLS1GxiPMNn9hMV6+cumvK9F7P6zOI3duWD9B2SYwBdX5231R13uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGZlb0sc7tb23SakznYhv9XHsEaHih7CMv9psv2Y/3w=;
 b=fnew/VQwrTdI5O+83EkMORoLH+tEsLeVWl+ENpy0YkMH/yTywkgA3wwnXUun57CrwfezEkQ81+HMczu/nxwjrcEgR0b+G2LeQrzmnuU7VCMBdYhur5xXe3tKcqM3rzENwgUM/NZtFx5aJZWfemeblLsYF86CCuWk0CG72FL5tLje0ScNLzT6zBI69Aggj5WZJaiMM8+LvFpZGejl73F2BQvF3e/BeitJBgjLTLaKPaYEamaDhJDEwOSPQ7gJPenU6+VaGWaF9EgYD7GTNTHu6ta/ENCcv2BebMMa9Mm2yNOnuzZycwbdKMQsJd1FsjRj24SEpkX9ULK7xsD/uS7XXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGZlb0sc7tb23SakznYhv9XHsEaHih7CMv9psv2Y/3w=;
 b=NFAd2r0zYkwQLuia/cx7YVwyVPrakshzd7Q0IP/hzLNuR3rczWCUsSHvTWZzRom4XvyDKO2L7dDcq9Hh99P78qhDkx9FPrEckiwdtP3zUD66hNTxPHzv5WXzvbpTpeClHANEa45Q1cQ/HFrldfZWlgmzaqZ4oSO5Bvo8WkY43oaDqEaphPDtkwKUqIPzqRdZmGBgAtqXJdHee+sZ+U7befIxqgQcYcDztAsqh4WthaCKT52XdSqG48LkfjFa4nsgNG7lc2TRbZl5npViYSF4C99iZMspjD4h7pF/koHQYUNzoCQlUF8etuewkWNwq5PEoWG+V1Bz7WRTSa4npn32MA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 IA0PR12MB8932.namprd12.prod.outlook.com (2603:10b6:208:492::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 21:14:19 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9564.007; Fri, 30 Jan 2026
 21:14:19 +0000
Message-ID: <70d88203-2fe1-4bde-b254-51e8107744eb@nvidia.com>
Date: Fri, 30 Jan 2026 16:14:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Zhi Wang <zhiw@nvidia.com>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
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
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <c064fbdc-9202-437d-80ff-6134d2a33778@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0383.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::28) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|IA0PR12MB8932:EE_
X-MS-Office365-Filtering-Correlation-Id: d09637fe-9f97-401e-e29a-08de6044879f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2x4bW1OTENTeWlDTkp5NXlGeVI4QnIwU0YxNkJVN21VekRRT2QwOUJWZU0w?=
 =?utf-8?B?Q3BXYm4xdkZMUGw1MHhzOVhKR1U1UTRCeXIyOFFEZlNTMnV0YVh1ekJXc0lN?=
 =?utf-8?B?eHN1QWp1aFpsYUt5TjRzNEJsZWppS1liTUJXU28rTm1Ddy9sMkVKZXBZZ3Ry?=
 =?utf-8?B?d3JnbkQvYVQ4bkorZDJBbzZHOCtVanlPTDYvS1lTWENpYjVCbFNnMFN0U3Z4?=
 =?utf-8?B?c1ZKNVcxeEFvWHZxanRMNnpsZG9WK1R3UEx6Z0FMZ1hMT3RCU3Z1YWgzcnls?=
 =?utf-8?B?ZFh4RE5kYnYrczJFSzUxNzZIbkxRMDg3dFNVQjJELy8wSnlRcHllRmQrSmhl?=
 =?utf-8?B?NjJkTzdxN0hCZnRseWxXaWs0ZW84ZGZqYUJ2NDU2V0xUNHd6QkpFTFdBZi9E?=
 =?utf-8?B?OE5SeGwyV0EzbUpmanZLNHlTcGpQWTl1NW1HTW1kNFl1RlZpR0NPS3hrRDJO?=
 =?utf-8?B?VUJOVDNSazJHMjBTRjVrdWF2M3FVSHhWSjhWUXhzY2dhVlhHWWEvTnMwZFJj?=
 =?utf-8?B?eDUrTS9TUmdvcU9tKzRUb3ZTUlhVUjJiak9zNjVMS1B5dUpldTdqR1ZubHQ2?=
 =?utf-8?B?aUhILzZMUFVmWXhrVGFVdnJONlJDUjRIaytLMVlDK0VQSndRekJhZVpybHow?=
 =?utf-8?B?cmk2Nldiamg5aDlRd0s5K2JmTlgybmVMVklTNUNGOGJRcnRzYklSRGpud21z?=
 =?utf-8?B?YmZJUUdFd2hpUVZRM3Vwb1gzTFlvSElpNzdIL2tpbFJpd05wd1g5WlExeG0v?=
 =?utf-8?B?RDFjMW1INVlyNGdlNVUxdzB4ZEdiN01ZUmUweVlTM1RqQ2NLRXowampiSWlQ?=
 =?utf-8?B?aTlYWFpWOWRsM0NSN2NYWjc2MTI4SmlablBpdGdLdGR1Wk56TjFjQVVwRmNK?=
 =?utf-8?B?VTlNS3dxSUhjczBBVUxTMHc0TkhmcDNpYlhUY1BCL0E4bWczZTNwZkM3ckkv?=
 =?utf-8?B?dWJNc1l5VnFTNDR6b01Fd3RHS2xDRUFTWnI3YXFKYWZBT2pEZzFiMFpNQ2Qw?=
 =?utf-8?B?MUxRQ2JrUDNBdS9HWW45eVFUNzBOS3MwejBrcjBuUHhma2lpSlZFVW5mZEYz?=
 =?utf-8?B?eVoyRXc0a1ZsZXdnWmc0VXMrRGJ6TnI1eGwxZFRTa3JOZzErYU5qN3FweGpy?=
 =?utf-8?B?dUZjSlVkNGVEZ2hRYUhOWGJuS0pFVlQ3alVuaDh2SW9OQjdjamFKUlNjU3pK?=
 =?utf-8?B?Z1BXK01NcU8ya1lCT284VDY5N241WXVORHNsdUJ5Y1Rwdk0zNmppTXVBTlpw?=
 =?utf-8?B?Z2lzSTk2NktzQUhNd0hSbmc2cnUyWll0eTVyRmJrS2hnWEY1eFAyOFl0Vk1v?=
 =?utf-8?B?WXQzY3ZOTmZmdDU5Wi9OQkVQWjRDdUdEZEFrU0pKN1dwUlg1ckc1K2lLdEo2?=
 =?utf-8?B?WXBLREkrWWZNV0xlRjFWT2QwQTBvRzdoYUErQU9jVkFpREpZOUlGQllRYXZF?=
 =?utf-8?B?WGhMZkg5bGFldVJsOHlOVjFxQXpXcWs0SlBrQlQyYkkzendtWk4vVkI5UUVq?=
 =?utf-8?B?eGJ3ZWNiOCtDTnVaY1JLb2dZODRRRVdUbmNaSXF1cHhNcFBQMWloWWcrTngw?=
 =?utf-8?B?S0hYbWpLZFpQY1pnbFJyeG55NmEyYy9QNGd5ZlA5eTZqbGk5djFKSlBXMlpx?=
 =?utf-8?B?Qlp1bEg3OVNhSXZVSUNyT2hNWXFiNGE5WVVab2lrYXdqakk2eHEzbGZKN005?=
 =?utf-8?B?QzFYV0xxK0hwODZ6bWplbnBGQktwUThiOVVIdER0WTQ0bDBweXhjTERFQy8x?=
 =?utf-8?B?MHNBNVQvSDBSaVYzREZBRVRhK1l2VFhtZVhXOTVTcGZ5VUVCZjJDQ3I3VlJI?=
 =?utf-8?B?ZVBhTlB1dkJpRXlVN2xLN3VpTWdwazV5ME5yNGRKQmE4WjRWQ3FUcE5DdlYx?=
 =?utf-8?B?LzZGbEJkVVRNdGZ6N09JbHBXQmRRU3JlZmlNckRLV0l5bElGQ3A2VEpOK1k1?=
 =?utf-8?B?N1NPNG5rMGZxcE1PR3N1b2p0eG1Nd2hSblFzMWpzM1pUS3V0MndZZWtwTVpp?=
 =?utf-8?B?S0I0blNFNzBQWnl0Q2hyNWxCb0N1VFhtMG10d3JyYTRIMFB4d2U0R1BTaHRw?=
 =?utf-8?B?cTNkNkM0ZWxQODV5TC9Xek5uSTh6Mjk0RWZqY050UDh1M0w5RjJ0bFFjenF4?=
 =?utf-8?Q?vl3Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFBCVEd5TUw5SjFwNTJOb05xNGRVamNQUDZtVFNLOTUyOUc3OGtCa2xOZ0JO?=
 =?utf-8?B?VXI5aWNURk85S1lXQ0c0VVF6bnVOeFprRnp0dFJWTHY2ZmxvUWV2NlpVZHU0?=
 =?utf-8?B?Z0dHVklua0NjL1BackxhMThNeGl5QW9pQnV5OHBPSlBtUVA5d1hHdW53OXI5?=
 =?utf-8?B?Ri9oaEtFeHkwTXpVM05GMDN4WGE1L2pWQTV0MklFb2FKOCt6czJqUzRPZ3Z1?=
 =?utf-8?B?eXZVTnlSTk5IdGNZbVBCcEc4S3JNamJrUjRyV1BhT20rRHc4S3ptTEM0VjZq?=
 =?utf-8?B?VU9UeDBLak1vaFpqQ3dwTklJdGdjajlyQ3VwcnZ0V2p1cEFPK05yWmJoWE9q?=
 =?utf-8?B?azdBRFNYdFA2TEpnbXZmZWM2UC82Qjh6KzFpMUxWZCtCVUhhZTJDWmJaNm9z?=
 =?utf-8?B?RWgySndWRDJKZEViRHU2R3RuUnNUVU9Hb0liNUZHeXQ1MkZoYWV3TlA3Y0tp?=
 =?utf-8?B?NFhiSEhpWUJieG41NXVoZzZkSW5DN2wwY3p3NWR0NTFxamU0ekU3VzQ5YkdO?=
 =?utf-8?B?N1E5MXh0RlBWWDVhQXZPaVorSnhNYWhCZ1VlN0k3M2VibVU5eFlJSkhKTDhS?=
 =?utf-8?B?bXV4TTRxUVpKdDBhNHp0Q1ZMWGs5dmw4UUs1TEM0RmFIOC9KeWFnVTAvQTZE?=
 =?utf-8?B?dkV0RTJhaGVwMnBjL1pxbUtLa3dDejFrdTRTZlJBQ2FkRnpDdFZkZ2JQdEtL?=
 =?utf-8?B?ZTMwSHlsOGRnRFoyWExWTUh1NGI2NmxmVkE2SWRtYVpuODFQZGxYM200a2RQ?=
 =?utf-8?B?N0Nab2N1RTkxNjlEMkNuYWh3U2xPUFQxNXNsd0RzZlRTT2lJR3BuOUx5bkhj?=
 =?utf-8?B?dE4rVHc4NVBsZGp5TUpBZWM5bnFwRC80cjN2VndyNU1mOGo3bVNob1FlNnJa?=
 =?utf-8?B?NmJ6NXRiVklqeFJtVmRQNlRRVGZmaGRMcE5xbkloQS9BTVk2OGJIUGdLYWZj?=
 =?utf-8?B?NDBHNDQ0ZUZ6RUgxaE1TbFF1WlhuVFJMMkd5dFZzL0FGMWk0Z0dqaWpBMk1t?=
 =?utf-8?B?ZGg4MnJXK1N3S0xTSFNjNGRNVlhhYmttR3k1cmpyV2RQbzU2M3ZQRnB1bzhq?=
 =?utf-8?B?SkNQbDZxUlhaa2F2VzdiamtvdzBuY0R3MEk1eUI2SHMyNmdaeldRaEVuazlM?=
 =?utf-8?B?Z054UTQ5ZVZaQmtMZEU5Tlg2Rk9pZUtLQ2Q5SitlN2hMTGhsMTZqd3o3aUJo?=
 =?utf-8?B?WmtEbjA5R1RhTHl0aFBTY3ZUSW5aY2FCdzBJL21JWldRK2xlRjRZamlTbDBI?=
 =?utf-8?B?SUN2Y0RIUkNxby9tdkZVRHZHd1dKZGZRMFpvdEFDakRzalZGbEpoWXNLY1Jq?=
 =?utf-8?B?MVFlem9CNm1Ga0xBWW5IdThFeksvSGY0bkh6bFJ2NkNBaFcweGxxc1NmNlBw?=
 =?utf-8?B?ZEdhL0t4NTlpZDZJWjZ0VExxZUxYSnp2L0xadm9KMUNxTzZQMFY1WElwSEFU?=
 =?utf-8?B?OWU3WnZaeW5scFR0eXRtMk84VjliQUcyWXJFR0JiUTdaMFFTaStyWGJqUkx2?=
 =?utf-8?B?ZnZFOEpyZzdhMno0Rllia1RwbUhEQzBQRGJ1NElpNEFPdHNqM004a0NMUVJC?=
 =?utf-8?B?NDE5alo5enVlSmpmTHdPUlRPejZwRG45bVNIbUtnWFRnbTc1V3YrYXpaK0Ju?=
 =?utf-8?B?NXRzRStRU3dkRmhWUDhjYTcyRDdDRTVReTd0VTU5d2RyajliVjgzUzdYY08w?=
 =?utf-8?B?TkdNZEpHcWJJb0NibGZlbWNaTWhTU212c1VjaXRsRzBTMmNjM3BqcmlKWTlq?=
 =?utf-8?B?bGxreURGRElZQkRjajN3MHdsRWlZekQwU01jc09UM0xCYm1QdFFZUkZGemFv?=
 =?utf-8?B?V2RSeEVOMXc0R2ZBVjZ6QVlDU1FpWjhQYmdFc0VxNGFFL3JqNml5MndlMGpl?=
 =?utf-8?B?amhsNjhua290ZGwyNWVxekREcWRiNDFTaXRFMkhnZmZzUzhybFQ3cFN1MmE5?=
 =?utf-8?B?b0RyWTNueDJWbmU2eWkzTkliVUtBUWJUY0JoUEN2QytHSFQzUGh5RWpVN3N5?=
 =?utf-8?B?Njd5RGJ4ajAxTzNDb3pObHlhYnJvTTFGUWhvK3hsQUZZL1pvczAreGprOUda?=
 =?utf-8?B?N3BFWjg3ZGRZVkF2OU1JU0paWWdJbXg2N0R0ME9LLzcraS9oMDRqUVJqNXdz?=
 =?utf-8?B?Vzd1b1liMnRMeDFKK3dOMW1IMjlDRVpZcFRkRUIvZS9SbkJsbk1yZGRWa1Nt?=
 =?utf-8?B?bE55UGNkTGQxK2pZMDhEbjFzOEx0QVAxVUtlL21GSTFQYUZ1Wkd3cVBNeUZj?=
 =?utf-8?B?dU4za01ZUWNreURnamRlR0FvOVR4dDgwNElYeTdlcmlkbkJrL0hLU0ltdno3?=
 =?utf-8?B?Uk1CdHRKRnBjK3VHRzVCaHVrMHh0S20vY3l2bkVVMmt0SENiYUFpUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d09637fe-9f97-401e-e29a-08de6044879f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 21:14:18.6528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ft3Zh/YWvFD1DOpj9yVieOo1Vlh68tkpy1qzPeR8odRoW6Qr4JTVdSgwoBqyhNdRu2uBrEU6ZYDrefRpeLBagg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8932
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
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,vger.kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,weathered-steel.dev,collabora.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: 808BFBEC1F
X-Rspamd-Action: no action



On 1/29/2026 10:38 PM, John Hubbard wrote:
> On 1/29/26 5:59 PM, Joel Fernandes wrote:
>> On 1/29/26 8:12 PM, John Hubbard wrote:
>>> On 1/29/26 4:26 PM, Joel Fernandes wrote:
>>>> Based on the below discussion and research, I came up with some deadlock
>>>> scenarios that we need to handle in the v6 series of these patches.
>>>> [...]
>>>> memory allocations under locks that we need in the dma-fence signaling
>>>> critical path (when doing the virtual memory map/unmap)
>>>
>>> unmap? Are you seeing any allocations happening during unmap? I don't
>>> immediately see any, but that sounds surprising.
>>
>> Not allocations but we are acquiring locks during unmap. My understanding
>> is (at least some) unmaps have to also be done in the dma fence signaling
>> critical path (the run stage), but Danilo/you can correct me if I am wrong
>> on that. We cannot avoid all locking but those same locks cannot be held in
>> any other paths which do a memory allocation (as mentioned in one of the
>> deadlock scenarios), that is probably the main thing to check for unmap.
>>
> 
> Right, OK we are on the same page now: no allocations happening on unmap,
> but it can still deadlock, because the driver is typically going to
> use a single lock to protect calls both map and unmap-related calls
> to the buddy allocator.

Yes exactly!

> 
> For the deadlock above, I think a good way to break that deadlock is
> to not allow taking that lock in a fence signaling calling path.
> 
> So during an unmap, instead of "lock, unmap/free, unlock" it should
> move the item to a deferred-free list, which is processed separately.
> Of course, this is a little complex, because the allocation and reclaim
> has to be aware of such lists if they get large.
Yes, also avoiding GFP_KERNEL allocations while holding any of these mm locks
(whichever we take during map). The GPU buddy actually does GFP_KERNEL
allocations internally which is problematic.

Some solutions / next steps:

1. allocating (VRAM and system memory) outside mm locks just before acquiring them.

2. pre-allocating both VRAM and system memory needed, before the DMA fence
critical paths (The issue is also to figure out how much memory to pre-allocate
for the page table pages based on the VM_BIND request. I think we can analyze
the page tables in the submit stage to make an estimate).

3. Unfortunately, I am using gpu-buddy when allocating a VA range in the Vmm
(called virt_buddy), which itself does GFP_KERNEL memory allocations in the
allocate path. I am not sure what do yet about this. ISTR the maple tree also
has similar issues.

4. Using non-reclaimable memory allocations where pre-allocation or
pre-allocated memory pools is not possible (I'd like to avoid this #4 so we
don't fail allocations when memory is scarce).

Will work on these issues for the v7. Thanks,

--
Joel Fernandes

