Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F23D0C086
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 20:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BC710E934;
	Fri,  9 Jan 2026 19:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="r5P6JEzJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013023.outbound.protection.outlook.com
 [40.107.201.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A82810E930;
 Fri,  9 Jan 2026 19:17:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtWCkNYJhe6X/jjtrwAUFgKhDFq6YGecEaZwt/av+hUiPK9va9Pca44jEY/dkvREdrwNaV0vtcfrqCjE/CpBkHP4KTZ69GnZ+76P5unr9Jc29mdFde1UJlLN0QBE6IdalI/O5yruiIXMOkNw4J0vSVGbLRtDIDU9FkAj+8Z82UfrWMJKvCv5jMKVJN2Fr0nynOSnVpEdOLWRqcqzCqpNI/HhJBzWYe34BX0SnTaBEAwBNYpMI1EtB+cfKnG9rPQkXnRe69DIkvMhnOr+RppT1kPa16OTLJS3OEgVFX4BqiVfU60QxvyRNiPBMb3AXklAjoqaeMZSqHWtxoEvwy7j1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLsaha0cFibdynqrYzVFCjBZ7fOnMeffEwjKD39i3Fw=;
 b=EunuluWelhtP8s7q5exyBnSaPdNG7iWfeuiTdunHmp5jv1Sy22fDT6LfTxebBn/DnZytEjVnWtTlPLqV1k8Ccz/c5/6NWhkFX2LuxCAXsyFySi24LWxjZmSRFRDj3Ez5zDw/v1CYg2487hbTnhOKjzdi9NZOy5PWR7pEr620E52IM2272QJW6IiIpojX9Glof4J9GefhVaPq1NcaqdASF3sAEkKq/yPbwo110extOqUclDSGQoqbrS2mhnt8rt63WmYEm3C828ynrTZGTJlqj99czMXP8JGbNkv9iC8e3M9wFBHHD537W+QU+pXLcaxN+rMA+2yY6zep96fLBCsniw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLsaha0cFibdynqrYzVFCjBZ7fOnMeffEwjKD39i3Fw=;
 b=r5P6JEzJqF+I5xjvNtR43Ed0jOU1q4C6yWYnwrKs7tk6vVMyZxySc/Ti8CQMimqE3+et2Z8iiuA+KMAufvyBF/Z81NgF0dR3qcfu2ccCg2gba7Gdh6oU1rXgMB4YPE5Nm6EXhAx4YFq36Agr0adf85a3xHrfTV1aa5wKJBjUafw=
Received: from MW4PR03CA0308.namprd03.prod.outlook.com (2603:10b6:303:dd::13)
 by IA1PR12MB6356.namprd12.prod.outlook.com (2603:10b6:208:3e0::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 19:17:26 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:303:dd:cafe::e3) by MW4PR03CA0308.outlook.office365.com
 (2603:10b6:303:dd::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Fri, 9
 Jan 2026 19:17:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 19:17:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 9 Jan
 2026 13:17:24 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 Jan
 2026 13:17:24 -0600
Received: from [10.254.94.155] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 9 Jan 2026 13:17:22 -0600
Message-ID: <9b18af40-6d1f-450b-8013-a54705f65e3d@amd.com>
Date: Fri, 9 Jan 2026 14:17:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amd/display: Attach OLED property to eDP panels
To: Jani Nikula <jani.nikula@linux.intel.com>, "Mario Limonciello (AMD)"
 <superm1@kernel.org>, <dri-devel@lists.freedesktop.org>
CC: <amd-gfx@lists.freedesktop.org>, <harry.wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>
References: <20260106170017.68158-1-superm1@kernel.org>
 <20260106170017.68158-3-superm1@kernel.org>
 <7bcfdb56-2e9a-4d38-a0df-f941907ae4a8@amd.com>
 <f62e27a385eaf07f78e7959472f2d30ac3cb9140@intel.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <f62e27a385eaf07f78e7959472f2d30ac3cb9140@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: sunpeng.li@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|IA1PR12MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: e654d790-82c0-4539-6810-08de4fb3b8ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|42112799006|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmN0a2gvUk9YaTM2VE0zZGg5MjR6bGF3NXlhRG0yWDF1VzRtSkVJN04zWm4r?=
 =?utf-8?B?eG96aHlBRHl2aHlMRTl1NzNCNHdjTFoyQmdPMWdzNWwxMkdYR1ZZUjluTDB0?=
 =?utf-8?B?cEFnaktZa2R0Y2Ira0FYUjdtR0VFdDNWRGMzQTk5VmtWWGlZblpqTVJaK1Jm?=
 =?utf-8?B?N3JJWEZyV2pxdzcvWlBHN09MVFh0TjdwWmRFdUlJVzZ1TkMyazlQdHZkYzJz?=
 =?utf-8?B?bGpTSnhjRWZuakpNSnVYa0huWmVoVVhFSS9hQUxScG1iYTRjckQ0RHpsVUJJ?=
 =?utf-8?B?VjdWYWhFUVgvZXpsVk5XUWtJbmN6VzRRM1hGaWx3TUpKT01WWFRPeWZ0WUFi?=
 =?utf-8?B?dzVyc3FFN2xhNjhTSzJwQ0s1bFdTYzRNY1c5a3lpZ2dmVFFiYms0ZFI4eVVU?=
 =?utf-8?B?RjlwVHFIQVYxTnVVQzZzQ2QvY0hxeWdTS0R0cVYzdTViTXQyVjRJT0lJRzlT?=
 =?utf-8?B?SXEyVmFnVDlPRmhzOGsweUVOSjA3WnJQZ2g5REIzYllnMnJPZ0NCbVZKNU5Q?=
 =?utf-8?B?SGRWTEl2MncvU2Q2NEdHRG5zZjg3OG1oNWlyVkNpZlA1TjRZQkNzY2hpUWZz?=
 =?utf-8?B?UnBuVEZGU3pNVS9OZW9sUW1JV01NUnBzeDhxME1odVFyaDc1UGIxVEtlK2dP?=
 =?utf-8?B?ZE1KMWJMMjdHby9MbWhrMGZxRHkvVkxnMStPNS96K1RyQUhPN09FbFUxMDRy?=
 =?utf-8?B?Y0JUYTIybkN6SGxYYzMvdi9ESkUxU2tLamt5ZXFHSkF4dkJ2TFJ1UjBCUEJu?=
 =?utf-8?B?WS8wSGdNWStLV0N3MEJIVjRlaUIwNlA4YjYzaDBneVNUek1qNGhEbkJ2U1hk?=
 =?utf-8?B?YjgrTmRIUmJEalJKTTd6cnVjOVBQdUtESkVyM2kzZWNMRnhzRUY5TEdJYU5Q?=
 =?utf-8?B?bDQ5UmNrODMvM25Cb203dXdvYVgrYzcrWHlTVmQwek9tRVRkTGNqZG1ZQTVJ?=
 =?utf-8?B?ZVFncHhnU09mTXhkSmxhdyt1eHVWZWFGMS9Walk3ZkFRNGlXS21va0VzQ3Fi?=
 =?utf-8?B?M2dMVEdnbU5kb01XVjczYThJanQ2L3luV0JUMVJFNWd0WkFQSUtPMWVLQk84?=
 =?utf-8?B?SjJsTkhnN0ZzblBTakRKUm5DdDgxUHlTTEp1RVhVdGlwaERRSlAwakRObkVz?=
 =?utf-8?B?QWVzbGJjTFBEVlYzNndZSzlYRVV0bWJMTW9OK0I4MENSRE9qMVpLb2laSDdR?=
 =?utf-8?B?c09VQ3NBbllvQTA3Z2FGSW9ucXJVMVZ0bE5pN0t3VlY0ZUxHZ3FWZ1c0dlBz?=
 =?utf-8?B?RjMrMmJKTGpaWVNQRnlYZzlPaVZiUmtJN1hxdDB5azFrMFVvMDd0Mkk1K001?=
 =?utf-8?B?djJGZDJnNFhlRFJENU1uTEJxRXQ2Q2x0REozOVFNRnVOTWRqbk5zSXhpQThC?=
 =?utf-8?B?Rk8rYjhRWC9FdHE4RWRqWmQwYktjQkV2b2NhUHRMVzBXU21RWHdRUThPT3ZE?=
 =?utf-8?B?NXhXR1R1cHhvOWN5b0VpMDB6VStUSlRqNEhhRS9scmdXN0lXRkM4ZG5XdElX?=
 =?utf-8?B?eXdQSVhkVFBzVDhuTElrSnAwdlpwbEx1NnlxYXlVQVE3RUhsTmlpU0M0a0Rp?=
 =?utf-8?B?QUFJTUkyVzNBQmtNcnY5QWxTbDhWdy84OGVaWWo1SUdReURpTWMrbVAyS1hG?=
 =?utf-8?B?UTFTRndBNDdtaVVqdUl6MjEwSEI3Qzd3aCs3ZTRYazJWSjJuU3RWMjNJakUx?=
 =?utf-8?B?SnkxOUUrM0dFbTZjY0JtbmxmYy9CaHJGbDIyR2pHcjBEdEhoVXJEWHplN0hP?=
 =?utf-8?B?U1JTWHpNOFIxbG8xS1NwM2F1T0NPQnJRLzNBUmZLQ293QjVFNjdTRnBDNXd4?=
 =?utf-8?B?WmE2NW5UM1c3elFrUmpueW9lMUN2emdpNDBYeDZtUldya2ZjV2V5cnZ0b0Qv?=
 =?utf-8?B?VkMvZG5pbFV0d0w3SS9WRGhtbmxZM1JIQkVqZ0oyYjhOeDRGRjUwOU9MQVdD?=
 =?utf-8?B?VXY5dlpyU2s4RkhCK0hNRmhaYWV2VXMyTFJ1cGdBa0ZPQUFvdjRPSFBKU1h0?=
 =?utf-8?B?c0VqQlV3dGZCSnB3dHRITnJUUCtibzFDTUxXVldmQmRxQzBSOGEwM1JFSTc0?=
 =?utf-8?B?NGNXRmlvdCtCQ3NJYytqek8wdVJBREN4Wmd1WG0wdFV3b2UxOUFWTmZIWUcz?=
 =?utf-8?Q?f1pw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(1800799024)(36860700013)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 19:17:25.2201 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e654d790-82c0-4539-6810-08de4fb3b8ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6356
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



On 2026-01-09 03:16, Jani Nikula wrote:
> On Thu, 08 Jan 2026, Leo Li <sunpeng.li@amd.com> wrote:
>> On 2026-01-06 12:00, Mario Limonciello (AMD) wrote:
>>> amdgpu verifies that a given panel is an OLED panel from extended caps
>>> and can provide accurate information to userspace.  Attach a property
>>> to the DRM connector.
>>>
>>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>> ---
>>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index 35dbc6aba4dfc..1cac5ebf50a9d 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -91,6 +91,7 @@
>>>  #include <drm/drm_fourcc.h>
>>>  #include <drm/drm_edid.h>
>>>  #include <drm/drm_eld.h>
>>> +#include <drm/drm_mode.h>
>>>  #include <drm/drm_utils.h>
>>>  #include <drm/drm_vblank.h>
>>>  #include <drm/drm_audio_component.h>
>>> @@ -3739,6 +3740,10 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
>>>  	caps->ext_caps = &aconnector->dc_link->dpcd_sink_ext_caps;
>>>  	caps->aux_support = false;
>>>  
>>> +	drm_object_property_set_value(&conn_base->base,
>>> +				      adev_to_drm(adev)->mode_config.panel_type_property,
>>> +				      caps->ext_caps->bits.oled ? DRM_MODE_PANEL_TYPE_OLED : DRM_MODE_PANEL_TYPE_UNKNOWN);
>>> +
>>
>> I think we'll want to pull this out into something like
>> `dm_set_panel_type()`, called after `update_connector_ext_caps()` and
>> any additional bits of edid parsing needed to make panel_type
>> detection more robust. I suppose that can be a future task.
> 
> I really wish you moved *all* EDID parsing to drm_edid.c instead of
> having your own.

That can definitely be considered :) Maybe not everything all at once, but any new bits for sure.
- Leo

> 
> BR,
> Jani.
> 
>>
>> Series is
>> Reviewed-by: Leo Li <sunpeng.li@amd.com>
>>
>> Thanks,
>> Leo
>>
>>>  	if (caps->ext_caps->bits.oled == 1
>>>  	    /*
>>>  	     * ||
>>> @@ -9020,6 +9025,8 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
>>>  	if (connector_type == DRM_MODE_CONNECTOR_eDP) {
>>>  		struct drm_privacy_screen *privacy_screen;
>>>  
>>> +		drm_connector_attach_panel_type_property(&aconnector->base);
>>> +
>>>  		privacy_screen = drm_privacy_screen_get(adev_to_drm(adev)->dev, NULL);
>>>  		if (!IS_ERR(privacy_screen)) {
>>>  			drm_connector_attach_privacy_screen_provider(&aconnector->base,
>>
> 

