Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC53CB3B3B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 18:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C21B10E0B1;
	Wed, 10 Dec 2025 17:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oossCsyb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010046.outbound.protection.outlook.com [52.101.85.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811BE10E0B1;
 Wed, 10 Dec 2025 17:56:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrtZ4/VPth6H4enoI9KrutIKjelISEdUuhMo2i+i3RPW00vTIiEFOny8rGOp4R7XFm/IDRcCzrA/274dzc8riZpRAOkp+7zYqfL9+9kUGLTVaHvD14ec6MvUL/jRt+cJYzuOC05gp8q47llEHZFNTvrH+gPhyn7UVmpRyR41Z4YL4xiZTWcOceGrgCjyiYba6C2JDAOsI1nX3aJFnjPy2kMCEud4yWbLp23guXSYkTQh6i1PLJuHRpxUPY1oYp7dNPpjWASNNvLJVMnY8nMSU3sz76hfIlvdjVWDxtN0EdkeHKoxR/M1BFM9tHveOZP9fQHV9vmBxGHF1nfCd7CfEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGwGOZGGcdq2jgoWJbovueD1sg78Svmm/0P6YrPLVSI=;
 b=N7IBswCgSuHwrECyTEcL3JcEmlF6ZdN6e3VOjd+o3c/8s/9Q3FhY9gxvORSTZZAZE14xMlCCw/Eh8drXPEzqIjc1CJcEsp2VhAVtDt66NwFHkmQ1EKHTJNfuKWei085kcZzAGKyZtvcl5cisCNTy2DdDaL8OjfHc/1Dg2j0V2IQgDZI50nrGh1T4yGj6MZWIpJoSrAYPJIBa6tARaRVHhKbSMhFuoTuApenbaP+oRxXDflRfl8ilPVB4C6WamSOhRfhK6L/p2XN1t/wN2IjL55+2d//dDRQX6Tb40qR6Gs1xjmyWrw+9/L3vjJCDRSch9021XhNvT7BA4cyxcfJiFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGwGOZGGcdq2jgoWJbovueD1sg78Svmm/0P6YrPLVSI=;
 b=oossCsybtgRLlUB5lWp8q/krgiS3Cfy9xUpV5oq4OrisMv/oMjqjFBePkaMWaMkl+V9Als5EU9fFF6denABQiNxRnFqfYMJW0VDC5PQqBXfHIomvYTjo8+KyuG6DFX7wh1LPSH5RETgmc3/byMWk+fvvqyER/77qqtX5w1xrPJs=
Received: from PH0P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::32)
 by MN2PR12MB4223.namprd12.prod.outlook.com (2603:10b6:208:1d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Wed, 10 Dec
 2025 17:55:08 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:510:d3:cafe::6a) by PH0P220CA0019.outlook.office365.com
 (2603:10b6:510:d3::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Wed,
 10 Dec 2025 17:55:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 10 Dec 2025 17:55:07 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Dec
 2025 11:55:07 -0600
Received: from [10.254.93.35] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Dec 2025 09:55:07 -0800
Message-ID: <408d24da-4ddd-4510-b86f-944fcb4720f8@amd.com>
Date: Wed, 10 Dec 2025 12:55:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm: Introduce drm_crtc_vblank_prepare()
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Harry.Wentland@amd.com>, <Nicholas.Kazlauskas@amd.com>, <simona@ffwll.ch>,
 <airlied@gmail.com>
References: <20251201231807.287414-1-sunpeng.li@amd.com>
 <d2b8706e41648fcd271d00f2be54545c9090442f@intel.com>
 <aTf-O8DFcCJPhrPd@intel.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <aTf-O8DFcCJPhrPd@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|MN2PR12MB4223:EE_
X-MS-Office365-Filtering-Correlation-Id: b70b35a9-9c89-4d13-737c-08de38154191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|42112799006; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUNzTE9BZzkxV1UvRzRHaWpRNzJkZlpDdVF3T1FrUFhYek12K1ROQVRvUTY0?=
 =?utf-8?B?NU45SmFPekJKcE1OM0dWMFF3aTVvYzUxQWYya0t3N0VVRnNWZE5EK3hWNVJ5?=
 =?utf-8?B?NjlSQmprOWdEVS9rMTdsVzRQOXRLZVVEd0p5bE5ickRaYzB3K3VsamZZVXox?=
 =?utf-8?B?N1U5MUZ2Y2Fzc0t0VU9Zcjdxek5jeC9rNUtyb3ljUkNqTzRvZXdWV1p1My8y?=
 =?utf-8?B?RjZWQWVCZklGYjBoSzNFWHd3K3VyN3lIdkNncUx3b21BaUV1OFZpeXZ2SU9x?=
 =?utf-8?B?OTJHYTlMT2tJV0JFcGt5SjR6RHBWbkREaVU4akNOYnQ2WUxub3ZXQVQxRzQ2?=
 =?utf-8?B?cmxXMmxIcUovekUxeHFaZEZWNXU3bThHRWdSVCsrL3BIYWVZMzAxMFhXdTZx?=
 =?utf-8?B?enRrMmt3UDBKSXg3elVQMjY1UXAzTkY5RGVwYmx1eXdZVVBJVk1mSnVhOU92?=
 =?utf-8?B?UTlqZlZPQmZHeFdydEErazlUb2cyZzYxOWR4VkFMWG9DaHBNYmxXa3AxRXJS?=
 =?utf-8?B?V1NEU044WkQwZ28zWUkwWnludjFtaHJrZVlPbFQyMEJuQ2NiYjJpRGpmakFy?=
 =?utf-8?B?Ykd0VWpEamcySllhMVQ0Wk00NHhmaTRpTW1wNlUrbytBOWhMVkZ0Mko4NVpJ?=
 =?utf-8?B?MzZBdXdPTGcvaTBMdGwzdzk5RU9MSFd2M1ZWcUhlVkluaGk4VjRtbjJmSjZL?=
 =?utf-8?B?N1dNbVlrSGN3WXE1VEVaNHpXNzdHVUxUSUZNeWhOOGhzb1NraFhseTJ6a1NQ?=
 =?utf-8?B?dkFwUktNT1kwTWlkM0REcURIVkZiZUVQZDREdDU0QWVqMGN0R0plcis4eDR0?=
 =?utf-8?B?Q0dNMXREbkdTZEZUenJuTnYxOENVRWwrU1MycW1RYWUrNEhKaUxlUUlkVjJC?=
 =?utf-8?B?NWJuWHlFK2l1SjY5eXQ5MFg5L3B5aEFNZ0RDenhQZWp0c0JWeHZIY0tJY0JX?=
 =?utf-8?B?RkMzRGdjQ0FHZTl5RGZ0eHF3MytURlpoNWRna1NLR2NoVlFaRzRSTHBLQWZo?=
 =?utf-8?B?RXo0UG9QQ1dnTjNvWVlQYVgxeS9ZQTdBNmNpT0M3TGtIcno4c001alJ1cGc2?=
 =?utf-8?B?ZitydEh0a0tTMW5ROVlmMXBMdEhIV1Y4cTBqZk03a3hNZHl4bkkrU3BtNzlL?=
 =?utf-8?B?VUdHVElpa1hLZGpOalJCRHZjTEJaSHBZV3BRSHBpd0hxVFloUGJjQVptT2xK?=
 =?utf-8?B?aUltQ1FiZm5OaGsxWkI5cEl5b1VKYnNoTXlOcjY5TmRJeG50MjhSNXNKVDlR?=
 =?utf-8?B?UHZlSDl5WmF0dkQ3bXkwVzloanE0RWJXSTZ4QmUydHRrVUN5NTVZQzJhcU5a?=
 =?utf-8?B?cW01UkZnS2l0QmliRGNpK3dybzMzS1kzQlRzekQ1TC9HMmpyTDkyMkZMRkJN?=
 =?utf-8?B?ZVVneXhuRnJLWEtxSzhMK0NXZUR0bFkxTjFjaElOckxubjcvQXB5bndHbGpz?=
 =?utf-8?B?OFNIbjJ5b1BObks5OEJpRzV5ZzRDbVlsOExQNTRxVWlmWDBGajZZMUZkNUcy?=
 =?utf-8?B?U28rODBnRXAxTDdGU1FPZi92aHRXRVpYWDc4YTJadEsxMWRSQ0JtelZiYlZK?=
 =?utf-8?B?U1ZOY2RqUVFQQ2dmNjZGY3ovSnNFem9rWUZ1QWFCZmRGZC9vNGRoY01nTFZV?=
 =?utf-8?B?WFJJZ2FjTUVlckZiWFV4QmhTVHNkMzV1cmN6blJTd0o4a0l3QWppNGlTSi85?=
 =?utf-8?B?Z0V6c0w5T0pFRjJqU2JqK0t6Y0x1QzRGbGpwdEhtd3NtSVRsR01DQXdzdUVN?=
 =?utf-8?B?ckpuL3dQQmVEMXRCVkNjckVudWo1a3dJekgxUU8yc0FicjRobkp4VFJkTy9y?=
 =?utf-8?B?S0QrbUVsdTFQM0YxSmkrQmdIN2Vvb2loaVp1bURZK1V5dFFsS0E5cCtnNG5M?=
 =?utf-8?B?RDNkSzB3MTVKZVFKeGFPWmZSWS9TWURWb00xaHUxNk1yVlVHZ3BIQzZlTkRL?=
 =?utf-8?B?RkZNMG9YbjdmRy9SbXdHUjR6SFEvdjZhZ0Mvdm80MWlWcUVYN0JTUGNmUDZl?=
 =?utf-8?B?OXMrWENZZUppVkFOV3A0VGx2UzJuNlJ5czQvUnl4WUVoR2h0REZjQkIwZGcx?=
 =?utf-8?B?d2NiRDgyZGpiVmxvT05mYnZMd3g2U0paK1hKdkxqRXhKVTFkem1udlNFUGFx?=
 =?utf-8?Q?pPXo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(42112799006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 17:55:07.7861 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b70b35a9-9c89-4d13-737c-08de38154191
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223
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



On 2025-12-09 05:47, Ville Syrjälä wrote:
> On Tue, Dec 09, 2025 at 12:05:31PM +0200, Jani Nikula wrote:
>> On Mon, 01 Dec 2025, <sunpeng.li@amd.com> wrote:
>>> From: Leo Li <sunpeng.li@amd.com>
>>>
>>> Some drivers need to perform blocking operations prior to enabling
>>> vblank interrupts. A display hardware spin-up from a low-power state
>>> that requires synchronization with the rest of the driver via a mutex,
>>> for example.
>>>
>>> To support this, introduce a new drm_crtc_vblank_prepare() helper that
>>> calls back into the driver -- if implemented -- for the driver to do
>>> such preparation work.
>>>
>>> In DRM core, call this helper before drm_vblank_get(). Drivers can
>>> choose to call this if they implement the callback in the future.
>>
>> Have you considered hiding all of this inside drm_vblank.c? Call prepare
>> in drm_crtc_vblank_get() and a couple of other places? And actually
>> don't call it on !drm_dev_has_vblank(dev)?
>>
>> There's just so much littering all over the place with the prepare, and
>> it seems brittle. Especially when you expect not only the drm core but
>> also the relevant drivers to call drm_crtc_vblank_prepare() when needed.
>>
>> There does seem to be a few places in amdgpu that wrap the
>> drm_crtc_vblank_get() inside dev->event_lock, but is there really any
>> need to do so? Do the get first, and grab the event_lock after?
>>
>> Some random comments inline.
>>
>> Cc: Ville
> 
> drm_vblank_get() can get called from any kind of context.
> The only workable solution might be the schedule a work from
> .vblank_enable() and do whatever is needed from there.
> 
Yeah, drm_vblank_get() can be called from interrupt context, so the sleeping
work has to happen outside of it.

The issue with deferring work from .enable_vblank() is drm_vblank_enable()
follows up immediately with a drm_update_vblank_count(); it expects HW to be
online for reading the vblank counter. Meanwhile, the prepare work can be
pending, and waiting for HW to be online from drm_update_vblank_count() wouldn't
be ideal.

I've thought about implementing a sw vblank counter while HW is waking up, but
that sounds overly complex. It would be simpler to somehow signal prepare work
before we enter non-sleeping context.

Would a function like drm_crtc_get_vblank_with_prepare() help? vblank_prepare()
can be wrapped in it before calling get_vblank(). drm_crtc_get_vblank()
call-sites outside of drm_vblank.c -- called from process context -- can be
replaced with it.

The only case it's not called from process context (within drm core) is in
drm_crtc_vblank_on_config(), which is in drm_vblank.c itself. I think
vblank_prepare() can be open coded there. Drivers can choose to call
get_vblank_with_prepare() if they actually have blocking prepare work.

Thanks,
Leo

