Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15035CB39DF
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 18:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DFB10E78B;
	Wed, 10 Dec 2025 17:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AbqLx2h9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012055.outbound.protection.outlook.com [40.107.209.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E09010E788;
 Wed, 10 Dec 2025 17:27:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFuruQYz6t1gLBKa2GeRKp95ABkhAPlivEKKzYoCENla15cxlqJL6lnZYzUvpjydRWE/jQ8+rHvp+fHyZCeuSi5cwY0zxNOK8PuVzwuiTdEdHP9QjP2JgsCpDu11lYxFGBzRb0SGa52qDNv7FxsZ4oTnUtYRQejq0fcWWc6gosRUhMTyCmz3naeEDi+bKnDzaWGG1BEWgVl+ATwVs9/eq9GxQHY6F0e1dpdU7B3OOcz5djf65zzfEULWi3TfP+dOFIO4OQzhnzq96FikaJa0kgwNtQcqa+oTagnr/42nZw93X3KKz3Y/IOlOqICIbgFLUz30O+UyAsXlIiEj8uANJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+ZOc9D8vzdw8pG9zYC4qQP6V2+Fxa7tB8wDMGSayDE=;
 b=Jsx5zvdaE7ko751J9/487uPmuAQ/+Y1oyYB0bP8uQRBDWsprjPy2OnZXnuHYPpv812QQOKmcgCwGZn3Jw5JOCYQmJuRet/bW2QtGfVZBV3Hd4FvaqutlgPhQJ5WW6HozN3wla0ZNwi7gbdn+lEJtS8eIEfp3bPf1Z6Juj43ht+e4XZeOSDRr1QaabKef/G1WLDcNkzT29TfJGj0FQnKO1YZvtKN/Pc2sI/aUxeZ/FMAGpR3QFNUEIKhBr0QAYejYr0Vd1EJC9zNuKSiuPaNLQKyVljmuGJe9YnTKhrQyQoPaEv87s9xYmziozsMqsN7QTtNkixQG84aSuFwsJmy2hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+ZOc9D8vzdw8pG9zYC4qQP6V2+Fxa7tB8wDMGSayDE=;
 b=AbqLx2h9Fk34/+3YUFH64HQk5gyK8TtqNr9pqILIuvdA4UgZzUB4W0Ym0jliLU5E/yrDgZvaPwoWmFw5Kcy6tc+JdfIgL7fXHoaynjkxFWIQ8wWN5QOcRoDIfv6eezeSt3O3XNteWjBlEzrtuTVhElGHv7Lwx35aUO+xppW5O5Y=
Received: from BY3PR04CA0029.namprd04.prod.outlook.com (2603:10b6:a03:217::34)
 by MW4PR12MB5644.namprd12.prod.outlook.com (2603:10b6:303:189::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 17:26:53 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::f5) by BY3PR04CA0029.outlook.office365.com
 (2603:10b6:a03:217::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Wed,
 10 Dec 2025 17:26:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 17:26:52 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Dec
 2025 11:26:51 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Dec
 2025 09:26:51 -0800
Received: from [10.254.93.35] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Dec 2025 09:26:50 -0800
Message-ID: <cc9f5e66-8410-452d-b0ad-185cf1d345fd@amd.com>
Date: Wed, 10 Dec 2025 12:26:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm: Introduce drm_crtc_vblank_prepare()
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Nicholas.Kazlauskas@amd.com>,
 <simona@ffwll.ch>, <airlied@gmail.com>, <ville.syrjala@linux.intel.com>
References: <20251201231807.287414-1-sunpeng.li@amd.com>
 <d2b8706e41648fcd271d00f2be54545c9090442f@intel.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <d2b8706e41648fcd271d00f2be54545c9090442f@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|MW4PR12MB5644:EE_
X-MS-Office365-Filtering-Correlation-Id: 037f7890-9c75-44ce-5162-08de38114f2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|42112799006|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elp3MmtkZFptWjhFUGF4UzF5ZDRJaDQ3UEpvT1RZTlVRY3JFaEo1cTVsTDRL?=
 =?utf-8?B?NTdFUDRELzRwblV0S05UeEVnYVJSWk4xV0svY25XNjhtMG1xZHR6NHZWOGxa?=
 =?utf-8?B?eXZlbFFaVDd5czRZVWlMRDd5TWJCcHJoZHQ1Q3FvdjB5Tks0RHpmSDZoVVQw?=
 =?utf-8?B?OVY1Z0VEck1IditSeWxVdERDZXBWNS85cjVoYytHNll1a2QrMkJVaXV5Y3Z1?=
 =?utf-8?B?di9Bd1djV2NzYTh5TXZybmF3MlNaWktEVXlDV2pnaEVVUHh5NjRBeDFvUnVI?=
 =?utf-8?B?cDdCQ2t4amNhcUVteUdJTFYweEdzelNwMklRNVJYdGswdmFnNExUM0Z0bzF4?=
 =?utf-8?B?YVlqb2wya1BpOFFHMUdBc3paa3E4bnhDU0dPRjdSUGRPWFV3Qy9JUWErZUxm?=
 =?utf-8?B?VWdZdUIxMU9USUMyVlk1a2RacmZSVFc5eTJPV0FDbHVNK1E1QndzZ21rbllC?=
 =?utf-8?B?T3NSR1laTW5YSEJoZWw1TjR0ZHNNYjZzSjFIWitweFUxYkhnVncxdjdtN2xx?=
 =?utf-8?B?MjhuUXo2RjNYdDQxMEhWeHVXYjlTWUxuNWZ4OEYrZHNvcHYreWZPcmc0N1Nv?=
 =?utf-8?B?bHZCWTNXTisyVGlMblRyRGhRcHJOU1NtdDRQNDdNRGxmcHY4VVdEZitBUWlX?=
 =?utf-8?B?UEJHRWs2TzVhSGpGMFVNcklOcVFOcDVURzhaWmEyVTIzOUZoMG5RK3VDcnFr?=
 =?utf-8?B?RjgzTTNBc0hMRkwzcTdjOCt6cmU1OTNJNkNoaXVIQ05SdFZyMTREWHlaSURB?=
 =?utf-8?B?VGtvbHJvdkhicVY5c1c5VDJUeE50WDM1Y1VYK1ZCd1NDTnI5ZllxUkNGSFpt?=
 =?utf-8?B?UDZWVjFpK2gwcnBJT1ZNYTNsaU9Fa3BQWmZhOFVJUDZyeGl1bWFpRWM4VjB5?=
 =?utf-8?B?cnY5dEovSURaejR5YklEd1plak1kNlFra3hTLzA3UnBUWDV6OUd1VS9qUTM2?=
 =?utf-8?B?RUdOMDc3NkltNmE3T3pzQU0zdlZpT2huQitqUS85bFlzejI2L0FabFZBd2dJ?=
 =?utf-8?B?bDU5T3R5UWw2N0RFWi9yMGJLVzIrU1V6eFEvZGRGc3ZkbmZKL1pBREthZ1pG?=
 =?utf-8?B?RnZSOWNoNmFJVnA3WU1reURTa1Z4QWVlbUs2SWJua0lORHlKdjlSaVRQbXFW?=
 =?utf-8?B?azFBYTc0TkJsbHY2dnZuNUcvVTNTeitmOVI4MlZLMDRjZnl4Mk1OeWVvUy83?=
 =?utf-8?B?MlhOMWFXdWhFa0xFRU8rUHgwU1NXcHNIbkI0QUVIQkxZZlRTN3luZ0tvcFBS?=
 =?utf-8?B?K3diT0NpZGEySDIxQ3dyYUg2Y1RmT3Nza1pvWXVCYXJzUmJDS0NoWUp1eXV3?=
 =?utf-8?B?SmsvN21XaHErVGhscENqb0ZXN0VpYWltY0pjZ3BnaFoybUs5TWIrQTJ6SENS?=
 =?utf-8?B?Vzc0cHQrclRLMmRwSlh3dnd6d1VaV2xjQzJvcVhieGtVdEVXNW4rN0cxbjcw?=
 =?utf-8?B?Sm5tbzl1aFhhQkQ0VEtLVVZKZXFpVHo3YjZrU1FIME1USGQ0T29rZmE1Yytp?=
 =?utf-8?B?ckg1SU1lMFRtanVVR3FFcHZOVG1GeUdNTmgxSUdyM0tialNKUG5WMjVPVVhC?=
 =?utf-8?B?S3F1UDJWdmJIWXhwcHZwWUFXbllsTjI4bEJ3THdZc2Vpa093S2tVN3NBQ3JV?=
 =?utf-8?B?clc0V1gwTyt2cHVzMDI0WGVkT2J5L2l4L0pZZWJucHhEdG8xNno3aHpDcWxm?=
 =?utf-8?B?RjI2SFpiczFkaWdQOU9zMmZzQzFpVFdwY1dxYUNmWTAvYlJ3TGs1UDVFQjJN?=
 =?utf-8?B?ZVZWd2ZLRVIyVXVVdnFDSGd0Si9yMWxSV3A5MUtkanRwa2FyRCthV01RQXhl?=
 =?utf-8?B?ZmpkN3JhQVgyVytreStoQ0lURFpKK1djVk9YNk9KVEtQRmVDYzdqSFNMdXp0?=
 =?utf-8?B?dkN5VTNvdDhQS0pWNGR6akwyZWlLNTBWTldMakNDVVdMUmxENXJUMEpmcFJB?=
 =?utf-8?B?MkRjRUUrdVB5TXE4ZnZ3QnoyZXBYMndRQ1dZbWF4cXNWOTBxY1AvS0JVNnV1?=
 =?utf-8?B?WXQySndWWWdKM1ZwVVBoOVhxcm94UjBnanlKSDc3QnlJSXdEbzJ5SkkwMEtW?=
 =?utf-8?B?MmxzcXFQdVNwRzJWQXdRbTc1ZllOVmFmM2FKVGpReU5LZk43NktaeERDUFNR?=
 =?utf-8?Q?HN5s=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(42112799006)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 17:26:52.5766 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 037f7890-9c75-44ce-5162-08de38114f2c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5644
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



On 2025-12-09 05:05, Jani Nikula wrote:
> On Mon, 01 Dec 2025, <sunpeng.li@amd.com> wrote:
>> From: Leo Li <sunpeng.li@amd.com>
>>
>> Some drivers need to perform blocking operations prior to enabling
>> vblank interrupts. A display hardware spin-up from a low-power state
>> that requires synchronization with the rest of the driver via a mutex,
>> for example.
>>
>> To support this, introduce a new drm_crtc_vblank_prepare() helper that
>> calls back into the driver -- if implemented -- for the driver to do
>> such preparation work.
>>
>> In DRM core, call this helper before drm_vblank_get(). Drivers can
>> choose to call this if they implement the callback in the future.
> 
> Have you considered hiding all of this inside drm_vblank.c? Call prepare
> in drm_crtc_vblank_get() and a couple of other places? And actually
> don't call it on !drm_dev_has_vblank(dev)?
> 
> There's just so much littering all over the place with the prepare, and
> it seems brittle. Especially when you expect not only the drm core but
> also the relevant drivers to call drm_crtc_vblank_prepare() when needed.
> 
> There does seem to be a few places in amdgpu that wrap the
> drm_crtc_vblank_get() inside dev->event_lock, but is there really any
> need to do so? Do the get first, and grab the event_lock after?
> 
> Some random comments inline.
> 
> Cc: Ville
> 
> 
> BR,
> Jani.

Hi Jani,
Thanks for the feedback. I'll reply to the above in the other thread with
Ville, but addressing the in-lines below.
- Leo
> 
> 
>>
>> Signed-off-by: Leo Li <sunpeng.li@amd.com>
>> ---
>>  drivers/gpu/drm/drm_atomic_helper.c |  8 ++++
>>  drivers/gpu/drm/drm_fb_helper.c     |  4 ++
>>  drivers/gpu/drm/drm_plane.c         |  4 ++
>>  drivers/gpu/drm/drm_vblank.c        | 69 +++++++++++++++++++++++++++++
>>  drivers/gpu/drm/drm_vblank_work.c   |  8 ++++
>>  include/drm/drm_crtc.h              | 27 +++++++++++
>>  include/drm/drm_vblank.h            |  1 +
>>  7 files changed, 121 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
>> index ef56b474acf59..e52dd41f83117 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -1264,6 +1264,10 @@ crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
>>  		if (!drm_dev_has_vblank(dev))
>>  			continue;
>>  
>> +		ret = drm_crtc_vblank_prepare(crtc);
>> +		if (ret)
>> +			continue;
>> +
>>  		ret = drm_crtc_vblank_get(crtc);
>>  		/*
>>  		 * Self-refresh is not a true "disable"; ensure vblank remains
>> @@ -1815,6 +1819,10 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
>>  		if (!new_crtc_state->active)
>>  			continue;
>>  
>> +		ret = drm_crtc_vblank_prepare(crtc);
>> +		if (ret != 0)
>> +			continue;
>> +
>>  		ret = drm_crtc_vblank_get(crtc);
>>  		if (ret != 0)
>>  			continue;
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
>> index 11a5b60cb9ce4..7400942fd7d1d 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -1103,6 +1103,10 @@ int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
>>  		 * enabled, otherwise just don't do anythintg,
>>  		 * not even report an error.
>>  		 */
>> +		ret = drm_crtc_vblank_prepare(crtc);
>> +		if (ret)
>> +			break;
>> +
>>  		ret = drm_crtc_vblank_get(crtc);
>>  		if (!ret) {
>>  			drm_crtc_wait_one_vblank(crtc);
>> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
>> index 38f82391bfda5..f2e40eaa385e6 100644
>> --- a/drivers/gpu/drm/drm_plane.c
>> +++ b/drivers/gpu/drm/drm_plane.c
>> @@ -1421,6 +1421,10 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
>>  		u32 current_vblank;
>>  		int r;
>>  
>> +		r = drm_crtc_vblank_prepare(crtc);
>> +		if (r)
>> +			return r;
>> +
>>  		r = drm_crtc_vblank_get(crtc);
>>  		if (r)
>>  			return r;
>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
>> index 46f59883183d9..4dac3228c021f 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -1194,6 +1194,30 @@ static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
>>  	return ret;
>>  }
>>  
>> +/**
>> + * drm_crtc_vblank_prepare - prepare to enable vblank interrupts
>> + *
>> + * @crtc: which CRTC to prepare
>> + *
>> + * Some drivers may need to run blocking operations to prepare for enabling
>> + * vblank interrupts. This function calls the prepare_enable_vblank callback, if
>> + * available, to allow drivers to do that.
>> + *
>> + * The spin-up may call blocking functions, such as mutex_lock(). Therefore,
>> + * this must be called from process context, where sleeping is allowed.
>> + *
>> + * Also see &drm_crtc_funcs.prepare_enable_vblank.
>> + *
>> + * Returns: Zero on success or a negative error code on failure.
>> + */
>> +int drm_crtc_vblank_prepare(struct drm_crtc *crtc)
>> +{
>> +	if (crtc->funcs->prepare_enable_vblank)
>> +		return crtc->funcs->prepare_enable_vblank(crtc);
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_crtc_vblank_prepare);
>> +
>>  int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
>>  {
>>  	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>> @@ -1288,12 +1312,22 @@ EXPORT_SYMBOL(drm_crtc_vblank_put);
>>  void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
>>  {
>>  	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>> +	struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
> 
> Initialization...
> 
>>  	int ret;
>>  	u64 last;
>>  
>>  	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>>  		return;
>>  
>> +	crtc = drm_crtc_from_index(dev, pipe);
> 
> ...and another initialization.
> 
> But really, this function needs to die, and you'll have the crtc without
> looking it up [1]. I'd really love to land that first to not make that
> *and* this series harder for absolutely no reason.
> 
> [1] https://lore.kernel.org/r/2a17538a24f1d12c3c82d9cde03363195b64d0cf.1764933891.git.jani.nikula@intel.com
>

The series looks sensible. I can definitely rebase on them. 
>> +	if (crtc) {
>> +		ret = drm_crtc_vblank_prepare(crtc);
>> +		if (drm_WARN(dev, ret,
>> +			     "prepare vblank failed on crtc %i, ret=%i\n",
>> +			     pipe, ret))
> 
> Do we really need the warning backtraces or debug logs for every call?
> There's one driver that needs the call, and it always returns 0. And
> there's like a hundred lines of debug logging in this patch.
> 
> If you insist, please at least use the [CRTC:%d:%s] style logging, and
> make it all somehow consistent.
> 

I'm OK with dropping these. It may be better for drivers to print warnings
themselves since preparation work is vendor specific.
>> +			return;
>> +	}
>> +
>>  	ret = drm_vblank_get(dev, pipe);
>>  	if (drm_WARN(dev, ret, "vblank not available on crtc %i, ret=%i\n",
>>  		     pipe, ret))
>> @@ -1485,10 +1519,18 @@ void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
>>  	struct drm_device *dev = crtc->dev;
>>  	unsigned int pipe = drm_crtc_index(crtc);
>>  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>> +	int ret;
>>  
>>  	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>>  		return;
>>  
>> +	if (crtc) {
>> +		ret = drm_crtc_vblank_prepare(crtc);
>> +		drm_WARN_ON(dev, ret);
>> +		if (ret)
>> +			return;
>> +	}
>> +
>>  	spin_lock_irq(&dev->vbl_lock);
>>  	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
>>  		    pipe, vblank->enabled, vblank->inmodeset);
>> @@ -1796,6 +1838,17 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>>  		return 0;
>>  	}
>>  
>> +	crtc = drm_crtc_from_index(dev, vblank->pipe);
>> +	if (crtc) {
>> +		ret = drm_crtc_vblank_prepare(crtc);
>> +		if (ret) {
>> +			drm_dbg_core(dev,
>> +				     "prepare vblank failed on crtc %i, ret=%i\n",
>> +				     pipe, ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>>  	ret = drm_vblank_get(dev, pipe);
>>  	if (ret) {
>>  		drm_dbg_core(dev,
>> @@ -2031,6 +2084,14 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
>>  		READ_ONCE(vblank->enabled);
>>  
>>  	if (!vblank_enabled) {
>> +		ret = drm_crtc_vblank_prepare(crtc);
>> +		if (ret) {
>> +			drm_dbg_core(dev,
>> +				     "prepare vblank failed on crtc %i, ret=%i\n",
>> +				     pipe, ret);
>> +			return ret;
>> +		}
>> +
>>  		ret = drm_crtc_vblank_get(crtc);
>>  		if (ret) {
>>  			drm_dbg_core(dev,
>> @@ -2098,6 +2159,14 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
>>  	if (e == NULL)
>>  		return -ENOMEM;
>>  
>> +	ret = drm_crtc_vblank_prepare(crtc);
>> +	if (ret) {
>> +		drm_dbg_core(dev,
>> +			     "prepare vblank failed on crtc %i, ret=%i\n",
>> +			     pipe, ret);
>> +		return ret;
>> +	}
>> +
>>  	ret = drm_crtc_vblank_get(crtc);
>>  	if (ret) {
>>  		drm_dbg_core(dev,
>> diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vblank_work.c
>> index e4e1873f0e1e1..582ee7fd94adf 100644
>> --- a/drivers/gpu/drm/drm_vblank_work.c
>> +++ b/drivers/gpu/drm/drm_vblank_work.c
>> @@ -113,11 +113,19 @@ int drm_vblank_work_schedule(struct drm_vblank_work *work,
>>  {
>>  	struct drm_vblank_crtc *vblank = work->vblank;
>>  	struct drm_device *dev = vblank->dev;
>> +	struct drm_crtc *crtc;
>>  	u64 cur_vbl;
>>  	unsigned long irqflags;
>>  	bool passed, inmodeset, rescheduling = false, wake = false;
>>  	int ret = 0;
>>  
>> +	crtc = drm_crtc_from_index(dev, vblank->pipe);
>> +	if (crtc) {
>> +		ret = drm_crtc_vblank_prepare(crtc);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>  	spin_lock_irqsave(&dev->event_lock, irqflags);
>>  	if (work->cancelling)
>>  		goto out;
>> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
>> index caa56e039da2a..456cf9ba0143a 100644
>> --- a/include/drm/drm_crtc.h
>> +++ b/include/drm/drm_crtc.h
>> @@ -860,6 +860,33 @@ struct drm_crtc_funcs {
>>  	 */
>>  	u32 (*get_vblank_counter)(struct drm_crtc *crtc);
>>  
>> +	/**
>> +	 * @prepare_enable_vblank:
>> +	 *
>> +	 * An optional callback for preparing to enable vblank interrupts. It
>> +	 * allows drivers to perform blocking operations, and thus is called
>> +	 * without any vblank spinlocks. Consequently, this callback is not
>> +	 * synchronized with the rest of drm_vblank management; drivers are
>> +	 * responsible for ensuring it won't race with drm_vblank and it's other
>> +	 * driver callbacks.
>> +	 *
>> +	 * For example, drivers may use this to spin-up hardware from a low
>> +	 * power state -- which may require blocking operations -- such that
>> +	 * hardware registers are available to read/write. However, the driver
>> +	 * must be careful as to when to reenter low-power state, such that it
>> +	 * won't race with enable_vblank.
>> +	 *
>> +	 * It is called unconditionally, regardless of whether vblank interrupts
>> +	 * are already enabled or not.
>> +	 *
>> +	 * This callback is optional. If not set, no preparation is performed.
>> +	 *
>> +	 * Returns:
>> +	 *
>> +	 * Zero on success, negative errno on failure.
>> +	 */
>> +	int (*prepare_enable_vblank)(struct drm_crtc *crtc);
>> +
>>  	/**
>>  	 * @enable_vblank:
>>  	 *
>> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
>> index 151ab1e85b1b7..5abc367aa4376 100644
>> --- a/include/drm/drm_vblank.h
>> +++ b/include/drm/drm_vblank.h
>> @@ -272,6 +272,7 @@ void drm_vblank_set_event(struct drm_pending_vblank_event *e,
>>  			  ktime_t *now);
>>  bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe);
>>  bool drm_crtc_handle_vblank(struct drm_crtc *crtc);
>> +int drm_crtc_vblank_prepare(struct drm_crtc *crtc);
>>  int drm_crtc_vblank_get(struct drm_crtc *crtc);
>>  void drm_crtc_vblank_put(struct drm_crtc *crtc);
>>  void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe);
> 

