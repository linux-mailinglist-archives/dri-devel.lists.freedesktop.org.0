Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BE7AD9461
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 20:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC95310E285;
	Fri, 13 Jun 2025 18:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e7WXauCn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72C110E285;
 Fri, 13 Jun 2025 18:27:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSlDQ7+mHKhKLFz3JRO/6AW7pg7qNUVqC5o3k7KTIG5dgydGJlz/d4kWywhGmsgr71qR1YzyUNpNgJwQXnSryfs8su/uNjpBlcMR7DfukUJz3s9mhyr0zuaG2maHohseDHmjs0c1buu6xpwz/YvBqV2ITyKLb+lAcPjhR2bnK4iwU6WOWvsLFXBaDzFqA9TStbgt/9S1LWUXYvEFej+WGcJO+369yR5dWD8J7mMFlzRGa0sD3IFMv8uYEwyFRWqHIGVYW21LugCgx7dSxq/2B7nCTaJrqjgKWXQ+k1XUr3oJL8BpkUjNVbJnV5H0S/TwVDmV3T6aND7BmbJylraCYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUHURO7LCo+XNt+wDMm9rPxVtO1MEofJayw+Z8JLhBw=;
 b=HlP0wz+fY7JWLzwurpuGXQOnDEPJtxo/YoPDVyr4yd1lHsiyOKezS/JbFnD6mY2ckCrJGq2t0/bYzxr3Vakif9Gn1dXNOMVJNjjZLFSmiJec8PotgaaqCqhVZzyP/x3dySec0k0nIt/0FPMPw/9MlDxt2tOhdxH7Fd7ApodcUMVSY1AhVByP0n2DY/1/5y7bFaVy06/TXNJ/fngUw0r8kOWE7Bij8gZCriOtmp5ATZu8elTAMYqdxnKiCiQIlU/5RAfeEP05sLm+si2DERjHUFOHURZAPv4s9drP3qSGo+6vljCCCztsYoJ0QyrLQqm5/L2CybnD8cvTp8M8mReCGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUHURO7LCo+XNt+wDMm9rPxVtO1MEofJayw+Z8JLhBw=;
 b=e7WXauCnzSMm3g9o+Dj9VPpX4DPcoXzXKJrM6ffGyfpgSxuSqTkYOWZKfdPN90rB5tspU3UfDpiWQj9SFZCuYdnnNGOOqAJDCxKZEjNM0GWyTzqTqoockGTtV9C6I3b7wxhx0UEE2J55ieI/Far/vYpcguOuPYlVethUNqmqV7M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB8645.namprd12.prod.outlook.com (2603:10b6:208:48f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 18:26:58 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 18:26:58 +0000
Message-ID: <03d50a89-0da1-40f6-a81f-f4332fac8799@amd.com>
Date: Fri, 13 Jun 2025 13:26:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/14] drm/amd/display: move dc_sink from dc_edid to
 drm_edid
To: Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250613150015.245917-1-mwen@igalia.com>
 <20250613150015.245917-15-mwen@igalia.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250613150015.245917-15-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0372.namprd04.prod.outlook.com
 (2603:10b6:303:81::17) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA0PR12MB8645:EE_
X-MS-Office365-Filtering-Correlation-Id: 4802f201-7abd-4edd-9ab1-08ddaaa7e1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2xHYXc0TUNmc1UrSFlpSGdpUSsrN0tnM2orOFd0b0h4QndrVlhJTmIvajNL?=
 =?utf-8?B?NFNrSlF3bmErN0cxY1Z3T3RjblZuNm8wVG9Sa0taemg5WDRrRUZwdnhmL3ZM?=
 =?utf-8?B?V0lJUjUrREFDdld1R3lDUU1OR2t2MXRaYnU4MnVwVFAwYlJIZkNPaUR3eG9E?=
 =?utf-8?B?SFJ3Z05QWjRRQi9KaVpzV1Z5SVhVNlhhUDlxUW5yTEtzUUpRM1ZpaXNUY09i?=
 =?utf-8?B?L0x4bUphR0VlWGd3YVFORXJYVzRDZDMxZzZDKy81L2g2bWtacWIrMjZURkN2?=
 =?utf-8?B?OThaR0J5VkE5dk45eWhHMmdPQjN0UmdDK09zRmh5S2R3VThLa0N2eTQ0VHFh?=
 =?utf-8?B?V2JPVzVnaytkRGkwbXpFV08vSUhnSjNuMSt4R0VobmZOUlozelQyOWpENmFD?=
 =?utf-8?B?Y0RFelYyTzA3clJCelMrUDhLSnVVeHhJNkYxZkNzQXZici9zbWdFRmMyQlYz?=
 =?utf-8?B?ZXhyYWNBdmFKbHdqbVYra2xCSG45RUo3azJYYjlZVTdRb2Q3R0Fad3o2eUJU?=
 =?utf-8?B?Z3MrWUhWYnkzV2VHVUIwWGlRUEpPUjdqbFc0azR4RHVxNWxpdU4xUk5BTFkr?=
 =?utf-8?B?YmF5U1hzSHJDcTY4YzBiQzI4VUpnRDNhMlcyVUtQUDRUdlY5SlAzY1dISU9K?=
 =?utf-8?B?LzZWcVl4Vi9LbG82QWFNTjhIdmc1cWZSWmVjVkVuZGRMak1hdlB3SjN2eFJ1?=
 =?utf-8?B?VzJmVVIxVnoyUVRiZnVWNkJFZ2ErSTJuSEUrdncxOVB3THp3WHBZVVhWWVVZ?=
 =?utf-8?B?WmVrYUFWTGM5dDRNTmFNaG1GSG1QeTN0VS9uUkxtUWdjNWZtR0M1TVdFbjhX?=
 =?utf-8?B?c1YybmMzbitORElOT1I5alg3UHJYdnpMejBEWDV2WTloQSsybFlmdkpzdVBs?=
 =?utf-8?B?UlVPZ0N1NStLei9lNWI1UEl0Wm9mT215aHBOMUU0UGFLMGlPdDZoU3lWM1M1?=
 =?utf-8?B?K25LaGJSMGo0dzRjTTg4RG1VdFJzMjh0WjlTR3Y5eVoxajErakZZZmEvV1hh?=
 =?utf-8?B?YnkzOUdXZGpUYkc1VTI4YkhhN0l3RnEwTXU1ajlNd3Z2bGIrLzYxRkpPanNt?=
 =?utf-8?B?QmdhUzBQWWtSekkzcUsydXZiODZxeE55Q2hwS0JVT1BOV0lQSERBQzBCSXZV?=
 =?utf-8?B?RHBsS1RVUDRRNzFDbW5iaXJBbGtvZnMwbFRpVW04RFAyRW9vRnNvT25hUFlr?=
 =?utf-8?B?L1lOMG5jK2d5Zm9GRFJ0VGFWM1p4ZlFteWVMZXoyZ3FmTVRwbll6NlQ0Um5I?=
 =?utf-8?B?WWlpSzJiNW9YUVFJVWJxYjdOMk1iNTc5WkdJelY2OFdISVNTR3NKem5ralV1?=
 =?utf-8?B?OHpyNjNYcE1UK1ZRSlZiay9oTE12d2ZqOGVyZ3JyTWV0U2lSNCtsaVBUVk00?=
 =?utf-8?B?ejFVdWtldTYxcjEvbnJ3NkRsWTQ0WXFNUlVVMmR6VXFNN05UNWljNjNiaCt3?=
 =?utf-8?B?QmpEcG1tQ3JzR2N0R2xHS2RrdVByNitIVGNWV09PSllRbnNFUHYyMkd4K1JR?=
 =?utf-8?B?bVR5QThzcUZod2RJaG1oSDRicnc1UUVQRHd3Ymhic01uTk9lemlSb0x1MXU3?=
 =?utf-8?B?NkVxem0yR211OEdSTFcrRG14eGYvcEY1VGJVZitKejVpNHBjOU5kaERmQlBh?=
 =?utf-8?B?Mmo1TllsTnB1eGFjREJQUjlzMFhmVDFOWVJrVWJhWElDcEJXUzd1UWFxRndV?=
 =?utf-8?B?UlRXNXNoeloybEc2RW14cmxEWmdGZGJDV3BGc2ZoZ01zeDRTUTcyczAwQXY5?=
 =?utf-8?B?WjJMTkV3T1R2MzRnRHJ2TU1GSktEMTFCNktDb0Qwc0Y5TFd5SXRXRTBOLzl4?=
 =?utf-8?B?NDFwOEZ2QVNick43bzk5REF1NnZON1FYa2lNYmw0MEY2MGJaQ05leEpJRlV0?=
 =?utf-8?B?SjdUR2hZR0N2aGZzL0tHSWRxVy9mRkxXdE02S052TDhLYS9iclJ3blpNMVpJ?=
 =?utf-8?Q?u3EzK/1ucTw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVQ2eExpdWlOQkNRdVhIZ2NXeXRhYkFzR3RNQm81VGlpN3pHYXltbWpyQ1dV?=
 =?utf-8?B?UXI5NjFlTFZHdmtXZlBiL0hKa2FhektIMHpHV3dKQVAzV1VDUmhieGNMaDZX?=
 =?utf-8?B?OHV0VkxXeUFiQkxXMStxNVFFNHJhd2NUUDFESlVpamxEb0Ywb0F0ZmJlcUdP?=
 =?utf-8?B?b241YkFxQlBiT1JXQ0IxckJQR01TeEJzVHBKcEdSODQyeHhncmNNSFB0QmFI?=
 =?utf-8?B?NzlacDhvYWJmVm5GZzFyQi9Vc1V1UW02Wi9GWnhCSXpJdzJ3R0FNN2JRRVha?=
 =?utf-8?B?VFk2K3p2SmNVVDBHc0xWZENNN3VydDQ3d1hRc0dxU0oybHl3eVVKa2hMZzNX?=
 =?utf-8?B?eDAyYWdPdTNvZ2R0SlhINEY3Zy9mMk5yRnpJdkNGUU5OTWwwck9NT2pQalAy?=
 =?utf-8?B?RkI1ZmQzQ3FFUjhsQXhPMHdUc2V4dElvdkhYT2Q3RFdzRWxncytGT1piWU9B?=
 =?utf-8?B?MWVYaVRZRHFFMjUvR3hiYzgyczJUeUNuUnhnQ05zazFpNGt0Q3ZUaW9kaTFH?=
 =?utf-8?B?SzR3SU84cmpuZjFIMnRRd29XRVAzOVVxMFhjdXN1THB4NDRNRTNEZGNqQ2ZW?=
 =?utf-8?B?Y1F0YkhpVzFjekk3OG9uaXFXOFZkNWpBSGtRRTdoUjhGWkJ4RlBqa2IyZExX?=
 =?utf-8?B?YmFhMDc5STlUS3VLQ3RMS2dwK2RMdWtEUVdDRXF6NWFxRTRYMldqNTV5aml2?=
 =?utf-8?B?N0JmUkhxdytiNjIvd0lEK0grRjB6OTB3TkZYMUJJSHU1MEJVNjJMVFNNVXJx?=
 =?utf-8?B?ZUpxYkpuaHE0OGt0a3M5OHRSNTgxZU5ybWNrMHFDRUE1WFRYY1AyUnRFSmpI?=
 =?utf-8?B?UEZpMVB1SUFVRk9KbXlYMm9JSjI0VS82c2lvMGw5eTdvRnZ2YmhwRGdibWpM?=
 =?utf-8?B?NDhPa0NURG45aG1jRU9FN0F0Tlk0QXF0c0hpWmRsOURMckE3ZXFMSXZUQ0tx?=
 =?utf-8?B?NjFoMGwwSU5BSWtVTVdGbE5JZDVEb3RWeHQ1VS8yZG1XK3VOMzBYWW9WZFJL?=
 =?utf-8?B?MjdOTzlQTmM5Y0xtRkhCbTNWRU5iVHBKekFaSWwrcUxmWEkranR5TU9nck8y?=
 =?utf-8?B?Z1FuZnRTUWF0MHhWVCtjMEVxWXVlOGxETWkwdFFQV1RpSTg1OUVscFIzaTZG?=
 =?utf-8?B?SjVPVW9PS2NPZHVSeHoxcmRyNmU3ZmpxbkVBTUJraTVJQnhCL3Y4Z3RFVXV2?=
 =?utf-8?B?SjhoYk84WXZRTGFLRVNGcDB5NU4zSTlkN2g0THRPQTl0VklFNWVWUmpwVFFM?=
 =?utf-8?B?VFhrWWkyN0dsUmVQWk4rMlpoUkVyOWhhejFwNm9HT2JKTjBJYnlDdmtncFNV?=
 =?utf-8?B?Y245S0x4dlFIbmdwdnFLTFBQeE1lL0R5dnByMlAvRUlvSm54QUFjcTlLVkxG?=
 =?utf-8?B?RHVuZEc4Q0hzWUtIQlkyNjBBUUh4Nkh0VDBqWFpZbEE2T1J1Q0JIaVJuaVBH?=
 =?utf-8?B?SlkyMFpuNVY4ZW1Nekw4K21ka3V2Zkgyai93akgrdWdmaXdjMWRnQ1p4NTNJ?=
 =?utf-8?B?N2RYZnZkdVVwUEdBeUJrQkFtL245U1JLUkZKaWdLTFdYYUpjSU16Y3UxbktU?=
 =?utf-8?B?ME5uU1h6d3UrcEFWZklPOHRtaXQxRmpsamlEdGsvUkdPcFVjTHp4bkxqRGZw?=
 =?utf-8?B?NEt0MkNSejJvWW9pTmhBUlJkNTRQRHBTcjdUcllmYjRMbENzSGY0akprQWQ3?=
 =?utf-8?B?ZkNsSk52TmlRMmJaL1ZSS0NtVFNsbXQ4WnlQRVJBWEJHSlB2dGJsTFhiL0tD?=
 =?utf-8?B?NG9mU3lXNEx1djM3aklYZG55ZklhZU5Nak1pdGgvMU15aFBoU2JadnV0eUF5?=
 =?utf-8?B?UTBnN0hEUTdKZGJpNWVBc2JZc2tQczBoUlVRR2U4Z3FkelBkSXd0eXpTR3Ba?=
 =?utf-8?B?U3B5b3dLVng3a0liaVNmWlZOOUVhNTBkdFRmOG5kUml6U3QrSEpWSWxlbDlF?=
 =?utf-8?B?VVlGZXVoRkR4bFpRTS9pTndsTExjMlFnVThmcVNIQnJSVUF5RllTSFp6R2xi?=
 =?utf-8?B?TkwzczVMWXhwWE5OM0Qva04zYWJ2TmtIWDVjbk9ranZKSTZIRnVoMmFrbGFX?=
 =?utf-8?B?VXBobWViajk0YkE5VkxFWmlXMVBaVE9la0VyMW1nWjFFN25teFBZTFFnNGVP?=
 =?utf-8?Q?bxtHeORcDUrP5fz8OUCLvWM/W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4802f201-7abd-4edd-9ab1-08ddaaa7e1c7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 18:26:58.2748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HfDJeLLovDjjZTCI9/ZYesJx0AgbxwGYhAqGkFtax+kOrRXIasRo1K1aErsDjpgakBMRO0HejQKwjbnZoHuyjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8645
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

On 6/13/2025 9:58 AM, Melissa Wen wrote:
> Reduce direct handling of edid data by resorting to drm helpers that
> deal with this info inside drm_edid infrastructure.
> 
> v3:
> - use dc_edid_sink_edid_free in link_detection
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 26 +++++++------------
>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 24 +++++------------
>   .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 21 +++++----------
>   .../gpu/drm/amd/display/amdgpu_dm/dc_edid.c   | 26 +++++++++----------
>   .../gpu/drm/amd/display/amdgpu_dm/dc_edid.h   |  1 +
>   .../drm/amd/display/dc/link/link_detection.c  |  3 ++-
>   6 files changed, 40 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index c7efeb9f38b6..ec33a6236e37 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -68,6 +68,7 @@
>   #endif
>   #include "amdgpu_dm_psr.h"
>   #include "amdgpu_dm_replay.h"
> +#include "dc_edid.h"
>   
>   #include "ivsrcid/ivsrcid_vislands30.h"
>   
> @@ -3708,6 +3709,8 @@ void amdgpu_dm_update_connector_after_detect(
>   	 * 2. Send an event and let userspace tell us what to do
>   	 */
>   	if (sink) {
> +		const struct drm_edid *drm_edid = sink->drm_edid;
> +
>   		/*
>   		 * TODO: check if we still need the S3 mode update workaround.
>   		 * If yes, put it here.
> @@ -3719,16 +3722,15 @@ void amdgpu_dm_update_connector_after_detect(
>   
>   		aconnector->dc_sink = sink;
>   		dc_sink_retain(aconnector->dc_sink);
> -		if (sink->dc_edid.length == 0) {
> +
> +		if (!drm_edid_valid(drm_edid)) {
>   			aconnector->drm_edid = NULL;
>   			hdmi_cec_unset_edid(aconnector);
>   			if (aconnector->dc_link->aux_mode) {
>   				drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
>   			}
>   		} else {
> -			const struct edid *edid = (const struct edid *)sink->dc_edid.raw_edid;
> -
> -			aconnector->drm_edid = drm_edid_alloc(edid, sink->dc_edid.length);
> +			aconnector->drm_edid = drm_edid_dup(sink->drm_edid);
>   			drm_edid_connector_update(connector, aconnector->drm_edid);
>   
>   			hdmi_cec_set_edid(aconnector);
> @@ -7378,12 +7380,8 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>   	aconnector->drm_edid = drm_edid;
>   	/* Update emulated (virtual) sink's EDID */
>   	if (dc_em_sink && dc_link) {
> -		// FIXME: Get rid of drm_edid_raw()
> -		const struct edid *edid = drm_edid_raw(drm_edid);
> -
>   		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
> -		memmove(dc_em_sink->dc_edid.raw_edid, edid,
> -			(edid->extensions + 1) * EDID_LENGTH);
> +		dc_edid_copy_edid_to_dc(dc_em_sink, drm_edid, 0);
>   		dm_helpers_parse_edid_caps(dc_link, dc_em_sink);
>   	}
>   }
> @@ -7416,7 +7414,6 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>   			.sink_signal = SIGNAL_TYPE_VIRTUAL
>   	};
>   	const struct drm_edid *drm_edid;
> -	const struct edid *edid;
>   	struct i2c_adapter *ddc;
>   
>   	if (dc_link && dc_link->aux_mode)
> @@ -7436,12 +7433,9 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>   
>   	aconnector->drm_edid = drm_edid;
>   
> -	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
> -	aconnector->dc_em_sink = dc_link_add_remote_sink(
> -		aconnector->dc_link,
> -		(uint8_t *)edid,
> -		(edid->extensions + 1) * EDID_LENGTH,
> -		&init_params);
> +	aconnector->dc_em_sink = dc_link_add_remote_sink(aconnector->dc_link,
> +							 drm_edid, 0,
> +							 &init_params);
>   
>   	if (aconnector->base.force == DRM_FORCE_ON) {
>   		aconnector->dc_sink = aconnector->dc_link->local_sink ?
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index abfce44dcee7..3e9d04760c21 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -48,6 +48,7 @@
>   #include "dm_helpers.h"
>   #include "ddc_service_types.h"
>   #include "clk_mgr.h"
> +#include "dc_edid.h"
>   
>   static void apply_edid_quirks(struct drm_device *dev,
>   			      const struct drm_edid *drm_edid,
> @@ -100,20 +101,16 @@ enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
>   	struct amdgpu_dm_connector *aconnector = link->priv;
>   	struct drm_connector *connector = &aconnector->base;
>   	struct drm_device *dev = connector->dev;
> -	struct edid *edid_buf;
> -	const struct drm_edid *drm_edid;
> +	const struct drm_edid *drm_edid = sink->drm_edid;
>   	struct drm_edid_product_id product_id;
>   	struct dc_edid_caps *edid_caps = &sink->edid_caps;
>   	int sad_count;
>   	int i = 0;
>   	enum dc_edid_status result = EDID_OK;
>   
> -	edid_buf = (struct edid *) &sink->dc_edid.raw_edid;
> -	if (!edid_caps || !edid_buf)
> +	if (!edid_caps || !drm_edid)
>   		return EDID_BAD_INPUT;
>   
> -	drm_edid = drm_edid_alloc(edid_buf, EDID_LENGTH * (edid_buf->extensions + 1));
> -
>   	if (!drm_edid_valid(drm_edid))
>   		result = EDID_BAD_CHECKSUM;
>   
> @@ -135,10 +132,8 @@ enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
>   	apply_edid_quirks(dev, drm_edid, edid_caps);
>   
>   	sad_count = drm_eld_sad_count(connector->eld);
> -	if (sad_count <= 0) {
> -		drm_edid_free(drm_edid);
> +	if (sad_count <= 0)
>   		return result;
> -	}
>   
>   	edid_caps->audio_mode_count = min(sad_count, DC_MAX_AUDIO_DESC_COUNT);
>   	for (i = 0; i < edid_caps->audio_mode_count; ++i) {
> @@ -158,8 +153,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
>   	else
>   		edid_caps->speaker_flags = DEFAULT_SPEAKER_LOCATION;
>   
> -	drm_edid_free(drm_edid);
> -
>   	return result;
>   }
>   
> @@ -991,7 +984,6 @@ enum dc_edid_status dm_helpers_read_local_edid(
>   	int retry = 3;
>   	enum dc_edid_status edid_status;
>   	const struct drm_edid *drm_edid;
> -	const struct edid *edid;
>   
>   	if (link->aux_mode)
>   		ddc = &aconnector->dm_dp_aux.aux.ddc;
> @@ -1021,11 +1013,7 @@ enum dc_edid_status dm_helpers_read_local_edid(
>   		if (!drm_edid)
>   			return EDID_NO_RESPONSE;
>   
> -		edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
> -		sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
> -		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
> -
> -		/* We don't need the original edid anymore */
> +		sink->drm_edid = drm_edid_dup(drm_edid);
>   		drm_edid_free(drm_edid);

Is the duplication actually necessary?  Can you "steal" the pointer by 
just assigning directly?

>   
>   		edid_status = dm_helpers_parse_edid_caps(link, sink);
> @@ -1051,6 +1039,8 @@ enum dc_edid_status dm_helpers_read_local_edid(
>   
>   		test_response.bits.EDID_CHECKSUM_WRITE = 1;
>   
> +		// TODO: drm_edid doesn't have a helper for dp_write_dpcd yet
> +		dc_edid_copy_edid_to_sink(sink);
>   		dm_helpers_dp_write_dpcd(ctx,
>   					link,
>   					DP_TEST_EDID_CHECKSUM,
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 7187d5aedf0a..5ca3e668c8aa 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -359,12 +359,10 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
>   					.link = aconnector->dc_link,
>   					.sink_signal = SIGNAL_TYPE_DISPLAY_PORT_MST };
>   
> -				dc_sink = dc_link_add_remote_sink(
> -					aconnector->dc_link,
> -					NULL,
> -					0,
> -					&init_params);
> -
> +				dc_sink = dc_link_add_remote_sink(aconnector->dc_link,
> +								  NULL,
> +								  0,
> +								  &init_params);
>   				if (!dc_sink) {
>   					DRM_ERROR("Unable to add a remote sink\n");
>   					return 0;
> @@ -397,15 +395,10 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
>   		struct dc_sink_init_data init_params = {
>   				.link = aconnector->dc_link,
>   				.sink_signal = SIGNAL_TYPE_DISPLAY_PORT_MST };
> -		const struct edid *edid;
> -
> -		edid = drm_edid_raw(aconnector->drm_edid); // FIXME: Get rid of drm_edid_raw()
> -		dc_sink = dc_link_add_remote_sink(
> -			aconnector->dc_link,
> -			(uint8_t *)edid,
> -			(edid->extensions + 1) * EDID_LENGTH,
> -			&init_params);
>   
> +		dc_sink = dc_link_add_remote_sink(aconnector->dc_link,
> +						  aconnector->drm_edid, 0,
> +						  &init_params);
>   		if (!dc_sink) {
>   			DRM_ERROR("Unable to add a remote sink\n");
>   			return 0;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> index 9e86dc15557b..ce4a7f9e268a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> @@ -6,25 +6,25 @@
>   bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>   			  struct dc_sink *current_sink)
>   {
> -	struct dc_edid *old_edid = &prev_sink->dc_edid;
> -	struct dc_edid *new_edid = &current_sink->dc_edid;
> -
> -       if (old_edid->length != new_edid->length)
> -               return false;
> -
> -       if (new_edid->length == 0)
> -               return false;
> -
> -       return (memcmp(old_edid->raw_edid,
> -                      new_edid->raw_edid, new_edid->length) == 0);
> +	return drm_edid_eq(prev_sink->drm_edid, current_sink->drm_edid);
>   }
>   
>   void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
>   			     const void *edid,
>   			     int len)
>   {
> -	memmove(dc_sink->dc_edid.raw_edid, edid, len);
> -	dc_sink->dc_edid.length = len;
> +	dc_sink->drm_edid = drm_edid_dup((const struct drm_edid *) edid);
> +}
> +
> +void dc_edid_copy_edid_to_sink(struct dc_sink *sink)
> +{
> +	const struct edid *edid;
> +	uint32_t edid_length;
> +
> +	edid = drm_edid_raw(sink->drm_edid); // FIXME: Get rid of drm_edid_raw()
> +	edid_length = EDID_LENGTH * (edid->extensions + 1);
> +	memcpy(sink->dc_edid.raw_edid, (uint8_t *) edid, edid_length);
> +	sink->dc_edid.length = edid_length;
>   }
>   
>   void dc_edid_sink_edid_free(struct dc_sink *sink)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> index 2c76768be459..a95cc6ccc743 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> @@ -9,6 +9,7 @@ bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>   			  struct dc_sink *current_sink);
>   void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
>   			     const void *edid, int len);
> +void dc_edid_copy_edid_to_sink(struct dc_sink *sink);
>   void dc_edid_sink_edid_free(struct dc_sink *sink);
>   
>   #endif /* __DC_EDID_H__ */
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> index c28072f980cc..bddcfd8f02ba 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> @@ -1133,6 +1133,7 @@ static bool detect_link_and_local_sink(struct dc_link *link,
>   			dp_trace_init(link);
>   
>   		/* Connectivity log: detection */
> +		dc_edid_copy_edid_to_sink(sink);
>   		for (i = 0; i < sink->dc_edid.length / DC_EDID_BLOCK_SIZE; i++) {
>   			CONN_DATA_DETECT(link,
>   					 &sink->dc_edid.raw_edid[i * DC_EDID_BLOCK_SIZE],
> @@ -1415,7 +1416,7 @@ struct dc_sink *link_add_remote_sink(
>   	 * parsing fails
>   	 */
>   	if (edid_status != EDID_OK && edid_status != EDID_PARTIAL_VALID) {
> -		dc_sink->dc_edid.length = 0;
> +		dc_edid_sink_edid_free(dc_sink);
>   		dm_error("Bad EDID, status%d!\n", edid_status);
>   	}
>   

