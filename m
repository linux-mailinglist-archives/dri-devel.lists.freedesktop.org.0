Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41FBC83CF4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 08:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F9D10E363;
	Tue, 25 Nov 2025 07:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="STitthBq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010004.outbound.protection.outlook.com [52.101.201.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4CD10E079;
 Tue, 25 Nov 2025 07:54:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ez2z9nluxFI5i+G4RXPmYUgWbttvMVVzN892Wthk4hhwr0BKBXDYCgJjm5mE1/HwI9BT5Hbur6PEl8bv3X+p2AQQxbkGDyYOwkMw2SaTycdsKcmUiWfqAVEhBcNtOlqXYBMdM9UWQaClkmHWmhouovCMhGF/Pee0Ln6kQZBwnGL87HCJPRptPYsnN8p4xTi3zTpXsohnYuWmHARR8pGN1yAXswv+ola/ZOKnKk9LcE2O6ozF1CIG0uqrn9SPkxpxOLXYHKu8JrsU3WznJ7y0/EqsqdMfgZjJfi7hZLP77cFjXS1sp00dwhppFLLMMJg8UZH3YcW5N5SSd9WQ6e2swA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pN4EID5ubGuGTFRX8qMdZwlwlNh2/M4fygjgqEaRZ0Q=;
 b=Shbk5hv4/oU0Vj/6RJ+RP36nb805fvl6OE5dBuw8ijM4A0IHtxc5HngCMK+3GGRQJilGsb5ZG+4+EaVejpcgVDr8bYblj7Q/NDM0KbvyQwBZtNxMTGnrBFpZBf6zXi6a4q9RL2yGrEH6dkedzxuLSwNR+myuj/Pg9Tq7Uqr3h6NlbuIPKYXP3M8n1fcltti03/tro3kd6hq+LphAicCHFHC8H/mKPKNH2DC3UFtYAVurAGNeZMqaqcUEfbv9H9KRoZ1M8pZfLNWvK2d3EdMUlKfovuFphM0AVxZSvXTHjQgpSK/kfCIYsGd5vzcc8HxocOAg+wRxKcaLbZN94+gOKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pN4EID5ubGuGTFRX8qMdZwlwlNh2/M4fygjgqEaRZ0Q=;
 b=STitthBq6XoBxOE95Fl8XRajHajUe2cbgTW1VpficE7Yi4nMDLMXTT0cLG/WEBGWuh6rMaQXjnN1T7Ipo8FbPSfRcS9JzEFJhGlYYfxT2WfPbtg8EpP0yXWQRChml0HfqT3Jvh2f7S+YH79kSAK/mOigucHNlRUe75N5TEx/Zrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB5860.namprd12.prod.outlook.com (2603:10b6:208:37b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 07:54:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 07:54:44 +0000
Message-ID: <24d4f02b-8ecd-4512-a1f0-ba41684ede1d@amd.com>
Date: Tue, 25 Nov 2025 08:54:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: Move DRM buddy allocator one level up
To: Dave Airlie <airlied@gmail.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
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
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20251124234432.1988476-1-joelagnelf@nvidia.com>
 <f73e4536-ec89-4625-96d4-6fa42018e4e4@amd.com>
 <CAPM=9twe3xcVBgrNCT+1_pGECPL-ry_aA2dxBwbKVeai4+S7AQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9twe3xcVBgrNCT+1_pGECPL-ry_aA2dxBwbKVeai4+S7AQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0318.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: e26f8782-a402-4a37-9864-08de2bf7e5a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXJ1YmpEWGViVU0wOWZDUnVzL2NLY1Rtc2VPN0pmazg3bTk2Qnl1NjdoVmsz?=
 =?utf-8?B?NVU0RXZQa01BYlVndVN1dHhLMzJkTk4xODVWUHN6UWlwTVlPcjM2REFuaitE?=
 =?utf-8?B?WnR2algxWnRhL3hoazBTOENuNUkxUXlrbGZzRy9uaS9ONWtWTHh2SHVkc2s4?=
 =?utf-8?B?dWF0U2dWak4xRTAvcGhGWmc3aGdTZVpveXF6V0I3QzNYSGkvUWl6NDJwNzR3?=
 =?utf-8?B?WWhQZWE4djc2d3ZHQ0hQQUM2bzBpblROVE9yRE13RFBoWk9XUkdCSW43cVRN?=
 =?utf-8?B?UjdLMU5INS9TeUlOSTdFQmFOZG1OcHJsM0dPK1RQOElhMXB3a3cwZk5QeFE5?=
 =?utf-8?B?cGpyNk9mS2l2MFpuK0paTG9iVjdtWWJBWndWOVd3ZG04b2QrcUVudHBnM1o1?=
 =?utf-8?B?aGU0dzR3WFJ4VFNIWVV2WFlQcW1UdnRXUUFucmRLK0ZyQzF2WlNYb05kenRm?=
 =?utf-8?B?dzF0TjF1a0lCN3JSY1hvc0hNL0tQeERDWXNHUEtJZndsaWZybVZMZUFKOUQx?=
 =?utf-8?B?cDZYKzZlWWdyUFcvS1hzWDI1NjA1UWplVEZCbDBoekFnOEZ5WVpDNnNreGVs?=
 =?utf-8?B?NytkTzZJQlNsVHVZVEtkRUlwU3FJUDJCRnIybDF4dGxuNzZ6U0IxTkcyVWx2?=
 =?utf-8?B?Tm1wZnBsK05tVlNkUzFteEhjK1NpR3NubGQxakRaKzAzbEZaQ0Y2YlZsN0Vv?=
 =?utf-8?B?TkMxUWlkUUQ0dC9tVW1JV2pVTmZmd3V5emtaSllKMWZweXgzSlNIcmRLbHlv?=
 =?utf-8?B?dE1tVTJ5TnB0WnNUcEJ4MHd0SWJpVlUvWHJFWVdBenY5WWNOdlFGOWdCSVdq?=
 =?utf-8?B?T1A5KzgrTGk5U2VxSnprdFV6MEdvSTFDRXBHMS9WOTFURTRZbFhNRGVnWW5j?=
 =?utf-8?B?SGcxWGozQlNhZEo1Mkc5RkdvY0w1WG15YWJGUEdxNUFTN3p4UklZN0xFeDVJ?=
 =?utf-8?B?MHI1MHdQbWIyZkk0b3J6SEE2enBIMWJ5ZXZsckFCeStqSUFIQTMxTVZQNXIy?=
 =?utf-8?B?T3ZEZ0hGcEUwVU5SQnVrd3NGaytBZkNKQkNRUGg2ZGtWaEtYS21iaHhPcHFi?=
 =?utf-8?B?aUcyQ3VXa2swUVhXcHJ0TlRjNkMvZ1A2cGFqUTFuSWxRamN0MFdOYW5NQ295?=
 =?utf-8?B?YjFLK204WDJ5ZzdtY1V3RUdJUGpXVDBGcTRHTVhCSFFNT2dPbWlpdWthcHlC?=
 =?utf-8?B?dTNGMWNSUlhLdFFLNGNUNk9CWnk1WHNqUWpjTEZ2VE4rMHNzTnJOa0VDaDhF?=
 =?utf-8?B?clhzRGFBVU5LTFJuQ1JGeXBlTmNmYkh2YUVzZTEzUFFOY3JUcHBQM2pBblJY?=
 =?utf-8?B?akg1c3VhdnhhUmdTbm01K3NHbnorVGIzNUdkSDNkVmlXckF2czNCZXR4azdZ?=
 =?utf-8?B?dmF5RjEybFdSZEJVOGZQNUU0ZmovYjFreHpVRXh3ZEczVENGYU1HTTY1OThS?=
 =?utf-8?B?MHhuUGpUODkrczN4SHZwdmZEZEFoREJmSlJyMTZ6MmdMRC90MGJmQUJLTHFH?=
 =?utf-8?B?cDMvWHI3YzVWOFF4YUdOdEJLNW5TandZQUlMNkh4NmxLSXJTckVEc0tWbS9r?=
 =?utf-8?B?M2g3RmNlSXBCcWtRNEZGcmh3NXF6NXpsdy9XTXdEOUVrVmFheDV3Y1llNnFm?=
 =?utf-8?B?WkxvMmYrdHdnWTlBbXpINU5hNk1TcUxpNjFkeFlPUnVzeDZmYys0WFJqYmRk?=
 =?utf-8?B?b3p0VjhSeXdzWGExSkd2S0JVSTJkelNPNnBGL1Z2UVJxeExuMlhtSGR2dWlW?=
 =?utf-8?B?SDBUYjlKamJMeUs5cndxT2lxUFhYSFQ1VXRYNWNIZjZxUXdCUWZ2SUdmSVNW?=
 =?utf-8?B?ZXlCa25DQy81U01ubzVYN1BvM0xnM1p6bk1SdUFWVGZBRmgyU1AvZFU2WmFo?=
 =?utf-8?B?V1ZtejNLeHZOUCtHSk9RbWl2VmoxOVR2WlJ5M0ZBdnV6SUhOOHMyTzl4WnI4?=
 =?utf-8?Q?muo03+JhItxabw7wjqO4TpMTXx5+uDc9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWs0V1ByNG8vbGZ1dFdOanlsMmpJM0o2QzFYeUhQektlZVFTUHNzMlk2U0lr?=
 =?utf-8?B?VDVRV3Urbm5ZRHNxcmpLdnczeHZHTkEwcjNGVHlmRDdsUzZlMjJRVUtvR3RR?=
 =?utf-8?B?MnMrU3BFMWxjNFpQN3J1ZUdPWlA3cG9BYWVLUmczdWtLTDc1RnR2R2k2Sjlv?=
 =?utf-8?B?ZzJtSmlJRGtDd01EL1ZYcVN5eGxXV3YraExnMDR6aTV3Qm1BZzVXdVV4Rnpz?=
 =?utf-8?B?RkZOalJCRHBjbVVjZFBSSjR0SUhKazlia1BkOGV5eXR1dzRLeWUrbTlsUWdj?=
 =?utf-8?B?dU9BOHlIaDAzRGtnVDlKMDVlZ252SnZ6MWkzSmZmUzVNTzRJV1lsMTdQMmZ2?=
 =?utf-8?B?aDh5alUzWEpFMXVPZGlQNHlvMmhjL0dPaTFLWDd6U25sZ2JNOHE5U1grOUI2?=
 =?utf-8?B?OGxOeld4Y0RlakdGLzc2b3BpOW1YM0pyZ1BXRTZCV2ZSc1k2UDdyVCtUU1JB?=
 =?utf-8?B?U05xOTlaOU1rSFEwNnZVNjlpR0FjaTg0MUg4aUhBbDQ4VTlldy95dHVLd2JK?=
 =?utf-8?B?QTJUREgzRmR0V1FDVDZDVlN3VWxPZW1HZWVlNFRtNmJ2SmhoYzR2clkzN3ZI?=
 =?utf-8?B?bFhKVXM1MjZGQUE0MU9WYVROM0ZlUGc5TSt1eDl4M3YvVTFaYTlRNTh0TFlk?=
 =?utf-8?B?aW9vVktrREJOalBESVhYeUR5SHRBK0hyNmVMRUhaVW9sRUVtVlp3UWszRXlo?=
 =?utf-8?B?c1NVamVhSjBjaFJIMjhrS2JMVmJ4RFl5UXEwUFVML0NBOVdvVXhUR01ER1dn?=
 =?utf-8?B?TW9NOVpxLzgydVFucm1UMHlCTjB4SnA1clRyMm5FbFZvdXV2ZjViNk43QXMz?=
 =?utf-8?B?YjNDQmlaVi9Wc2tCZTgvUVJsZmtBOVorWjc2d0xYam9iQ09IVVVVaFY4TERo?=
 =?utf-8?B?V3ZnbHZRK2d4Z3VPYlVtVDN1bkRyQlpBSUpFR1FUM09Kc3Fkb2dVSjdTQjR1?=
 =?utf-8?B?dERaQ0hoYVNXeStrWW8wWG03dHhEWjRRZm50Wks0MUZZM3IxWlZOeUlDVVFV?=
 =?utf-8?B?NkZWRTVya0FDVWo3SUdiUWgvOEFiNnpUOTl4amFBS1pFN0NRS292VEVDdndw?=
 =?utf-8?B?VDlQSS9UczdNWUUrOXczME9mR29yQ2dsS2ZHcmpUcDhoRngwMVFZQ01HdGRl?=
 =?utf-8?B?QXlIN3RQZHZBMVBXNXBiTUk0ekFCVXIrdHRuWDRlbGxMbi9MQUo0dVFUdDhm?=
 =?utf-8?B?SlpkM2JOVVh6ZjNNdUM2Wk1NWkEzenNHbWpZbWxtcFVDT1V0UFNEQkUwb0Vh?=
 =?utf-8?B?YnVnWlltRmtmVTRGRUFlMjc4N2pHRXpHZDFQcGNtM2pZT1hiL2IxS3dPV1M4?=
 =?utf-8?B?SVhoYlJkMlAraGg0aG5LSSs5ajZ0SW16RTRIVGlBVDV4U2V3aVkwejhZcXg3?=
 =?utf-8?B?ZllxdFM4c1BVaDJNUDNaTVpLaFM1bVFXL3h0REs5NnI3b3RrWG15S1d3RFFV?=
 =?utf-8?B?dGN6cHozVDRHMnFYNEJSKytURnIrd0hMSG10WEFacVUveTE3d0l0ZW9tV0Uv?=
 =?utf-8?B?THIwK1pKNFlZeEZ1L3JhVlJYZGgwNS9teDAwdVdkdW14dkNxb1lYVDcrQ3Ew?=
 =?utf-8?B?bVJTWkRQZ3ZxMStaN05xNDhheGlxVHZHbWNGaFJhRW03bEpvdjdSeTQrUVNB?=
 =?utf-8?B?clNkMVE4eERCQzZOWWtJRktVVzRFQ3hCZ1FvU0tOUVVyN1RYRWZRVmkxNEJY?=
 =?utf-8?B?YyswNFI5Rml5NFEzRXBqTTUyZU0wZ3hONm1zTDRHL09PTXZrTzV2OStSZkNL?=
 =?utf-8?B?aFdmM0lLUGZpZDN3RHBOUHgvMW9YRUZ0RGtDbElIWVpDdzVVWk13U1lYdHFC?=
 =?utf-8?B?NitPekVCOWE0Rktjb1NXN2xIcWVwazdjYTFPU0laOFZRWDA4ZzZBT2VuV2JJ?=
 =?utf-8?B?WlkzN2dXMGZvR3NrSHJPZUlhU3NoRXQ1NnZtbU1hVEZza1RJNkZLYW9ENlZs?=
 =?utf-8?B?L3IrZEt5OVBMaEZleHAzRmVBMTM3ajh2OERRcVlOa3VaWTVPMHlzdCsxdWk0?=
 =?utf-8?B?eC9tYXRERlRJSEtWTDNIbnlCaGtMRkh5QWVRSWRESWVmbloyalZXcGtVRUZz?=
 =?utf-8?B?NXU4UEdaNjlBb1dUWk5QemxSNHEvdk8rc3dSWGNpd2tkbTExUHRHNlJWR3U2?=
 =?utf-8?Q?6Skc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e26f8782-a402-4a37-9864-08de2bf7e5a1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 07:54:44.5400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qfuu3AMgRYb0C+Npz39HD4ijHkrpG+BJNZWUvQHaxIHMrqI76YNuU3Wtx6D8wVC/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5860
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

On 11/25/25 08:49, Dave Airlie wrote:
> On Tue, 25 Nov 2025 at 17:45, Christian König <christian.koenig@amd.com> wrote:
>>
>> On 11/25/25 00:44, Joel Fernandes wrote:
>>> Move the DRM buddy allocator one level up so that it can be used by GPU
>>> drivers (example, nova-core) that have usecases other than DRM (such as
>>> VFIO vGPU support). Modify the API, structures and Kconfigs to use
>>> "gpu_buddy" terminology. Adapt the drivers and tests to use the new API.
>>>
>>> The commit cannot be split due to bissectability, however no functional
>>> change is intended. Verified by running K-UNIT tests and build tested
>>> various configurations.
>>
>> Well such a change needs to be part of the patch set which actually starts to use it outside of drivers/gpu/drm.
> 
> I'm not sure it really makes sense yet to force that for this, since
> the next patch would be just adding rust bindings to it, then a patch
> to nova-core would be needed to use it, I'd rather not merge something
> like this via the rust or nova trees as it breaks the principle of
> least surprise.
> 
> Maybe this + rust bindings might be enough to justify it, but it
> should be reviewable as a standalone idea.

My question is why exactly is nova separated into nova-core and nova-drm? That doesn't seem to be necessary in the first place.

E.g. neither amdgpu not XE need that and we are doing pretty much the same thing.

Regards,
Christian.

> 
> Dave.

