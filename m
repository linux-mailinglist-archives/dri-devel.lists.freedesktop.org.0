Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22252C5678F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 10:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594EA10E7E1;
	Thu, 13 Nov 2025 09:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="u8l2oz26";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012025.outbound.protection.outlook.com [52.101.43.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003B110E7E1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 09:06:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVbxUiS9vO+kxgz6+WMnQJJFv0mXzqi1kUir7UK82Jj2Qu378enUGrLxR4VvfVGkpUrP/v8nAjWvQWq5e9KQtvqL9bAQwnGUE23tYuyiibPPxCiwRhWr6KRQc5ZourNgzaFhV304gPXygbmWUm/uivEOFy3ndfQvtorFO1g0/MV8ThEik64mKpMBoVzraOSZPO2xFBIoTbAsfztXvgcpXYWPw98+fhpHZ2TLXkJ35k1x8BGbmGjaES6jtvuDMNJJ2rpZy3lutzZTzV4nrbx4U2gRvBXuIQz+1UOh8mU2nZQdV1l/PDVtByWFC5M8jIlFCND4YdhnOSj8UTvEwEpGtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrjBKb7oQQhr3g2NPODEKvlA7MT/63Uee4JL3cbgEns=;
 b=UqtsG1mHUHS4Cv7dumAJIJumbB+IClvy7eCfhtNFRJGaUHh0B9DPpZ3wpuYzhDgxucE6I0e4YyHnBru5b84Bk4Zg0Zm0xOy6fdevZ3YrdHBJnAH6T4SQrOOuLPdYmWGqwboEvCkHbrZ1nrmj4UD5Ydq58oCN3Xeapk3512orNrjU9oUjAVFTFLz+5AKVIOfUtBRd1cgBmlVVOc5lMG8BPkYd3szuVZOm+2JrREUVNHdBsWdxd7NbdzkvBmq/cDsF2vZccNEXghIthNClSOsfvQ7lrVbeUJ/pWfiWeXQg296RVwCXA3QqdJQid8E0GdOknZiTqBtg+dxVK9Q4++reWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrjBKb7oQQhr3g2NPODEKvlA7MT/63Uee4JL3cbgEns=;
 b=u8l2oz260i1FJRYUz2+B4rwNgGwH/yjZLfxbRwZGAAEPCiMCVUmJ76Zm5WjV7PGPbNh7wK4l2IAlH0axKHaA5rhl2qI7ZbigwheW4P5yT92Yd4cvaDeM/mZvvTNRyBcnXtRjTmz5085LUaYoT2FPF2jsuaVOzFaN9/1ngRQuCPE=
Received: from PH8PR07CA0037.namprd07.prod.outlook.com (2603:10b6:510:2cf::17)
 by DS0PR10MB7364.namprd10.prod.outlook.com (2603:10b6:8:fe::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.15; Thu, 13 Nov 2025 09:06:04 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::7) by PH8PR07CA0037.outlook.office365.com
 (2603:10b6:510:2cf::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 09:06:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 09:06:03 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 03:05:59 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 03:05:58 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 03:05:58 -0600
Received: from [172.24.233.62] (devarsh-precision-tower-3620.dhcp.ti.com
 [172.24.233.62])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AD95r7p4163503;
 Thu, 13 Nov 2025 03:05:53 -0600
Message-ID: <edff9c4a-c4ba-44b7-86d4-a070ee57d49c@ti.com>
Date: Thu, 13 Nov 2025 14:35:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/bridge: sii902x: Fix HDMI detection with
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>,
 <s-jain1@ti.com>, <s-wang12@ti.com>, <r-donadkar@ti.com>, <h-shenoy@ti.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>,
 <jani.nikula@intel.com>, <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>,
 <airlied@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>
References: <20251030151635.3019864-1-devarsht@ti.com>
 <138857f0-969d-4e99-aafd-d0c4e9aefb66@ideasonboard.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <138857f0-969d-4e99-aafd-d0c4e9aefb66@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|DS0PR10MB7364:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b5c681a-ab4c-4a9e-29a9-08de2293df88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGFCamRyQ25WNkw5ckVNRGMyMFVVV3R0bXhPbm5Td2Y1cG0vOTJRNzlZWTJu?=
 =?utf-8?B?Y0VDMTJzMWZLVHVNVjg2NGlpeGE3V1cwMSt4aWhrR05EQXZtTUxmS0xZT1JZ?=
 =?utf-8?B?WloyVTdpS0FDTm5FS0k1akgyenJJZ2hJOVV0Wi9jOVo3dzV1TXZtdFVrNmk3?=
 =?utf-8?B?enlCZ1NMUDVIQXhjdHBhclRyVVBLeVkzUWxwOHcvTVpDdll6WTBWa0ROMWRC?=
 =?utf-8?B?YXNMVHM3R2M1QURURW1BVlJZR1llMFlGTERkcS8zWFphK3EySVVSMVV2cnpL?=
 =?utf-8?B?NjhQdi8zQ0o5ZktybjBlbTB5by9mbzVrTXgvckhpa2dlR1A3OVl1cVhLQW9w?=
 =?utf-8?B?bzNRem1FZWpZeWNpN0JESVV0Y0xDOENrVUlqTHRXWXF3WnkxVkxLZ0R6R1F5?=
 =?utf-8?B?NGwydWFaN0pLSWFrQkRCazBKdlQ1dGVWeTBYa0paUU8rL08xSEFmWTEreVR2?=
 =?utf-8?B?L0oyRmpTc3pMbE5QUXhwNjlPVXBzdFRuWlhwRlplMEVpU1hwckNKcWZEdEJC?=
 =?utf-8?B?UU1kUG9EMnZtNXN6Ym1zVkcxVjhSczNEc250SExYUFZrSWhMTzQ0aFAxODZD?=
 =?utf-8?B?NGxtYWsvU2ZubDZ4ZW1ZeVNTU1JhREdETzIxbXM3THIzc21TV1B2bUEvVXhZ?=
 =?utf-8?B?UFVxRi9ZQmw3TVozb3k5VVljeVBISGtjcVY2STRNa2ZwZEwxMm9vY2c5ckR0?=
 =?utf-8?B?ODczYjF0RC80ZXRlTVF5QU1OZmhPeGRKUWJMR01SWUQ2dGQ1MWlOWGhsZmNE?=
 =?utf-8?B?UjhqTnBaeUNucm9ZMTVlalJ0V29FZDBlK1R0bTlVMXFEVUFqMjVLQVc5YWxh?=
 =?utf-8?B?cUxUZGVzR0haeU9UZXRkQk1ZZVlmMHdNc3lhSzNQWmE5eWo3elZvRXRYRldK?=
 =?utf-8?B?QWNBRXR5TFQ3UXBremtSU1dhRjIzVUF2dGw2bSs3ZGcyZXZ3QmU3QXN6bkFt?=
 =?utf-8?B?enhYVHR0NlpOdHFWd2FMSzNIYlhqc2dYNHplSS8yQ3VZakpVRUZPMmduakJo?=
 =?utf-8?B?cDNxUVFiV0pQc1ZKeXE0bExKcjgzcEF3N0JCQjNvMkM2VDVjK25hMkw4T3VB?=
 =?utf-8?B?MDEvTnRIWWIrQyt1OEEyRzdUdEhlWlc5ODhwVVR1RkxMY2NWWVZsVDNNWEpS?=
 =?utf-8?B?MjhTOGpNQTRGSWc1UWZ2Zkdrc1ptMDd3ejFsWEhQQnBMelVLeHUvT0ZON2kz?=
 =?utf-8?B?VVYwOTZWRy80V012YlpDb3JDVm9UcEwraDNBZWF1NEpsYUo1bVhkRW5iVG5y?=
 =?utf-8?B?bEFSYTN0THNSTTh2c3FlMkt1N2tEL2Z3a1BNWU9vNU9CQ0F6ZDUyd3h1QkxQ?=
 =?utf-8?B?MGR2Z3l6UUtuZmdFNW5VdkpLazBRRnZZTWl4S2JSQlZ6M25MWUNGZnNoM2tP?=
 =?utf-8?B?NElEOURaSDVqL2hnLzFvQWt3Y3RzRFlsWXppeHFPZTNOT2UrVGkzS3BHRVha?=
 =?utf-8?B?TmRGelV0ZVE0SlVyaGE3THlseWVXdXgyRXVLNk81YkJKMDVqQWMrWlNmeGh6?=
 =?utf-8?B?WnUxN1N5aWNNQ00rRUtHZHJ5b2tTei9IZVRYR1ZMQU4vTEs2dzZDLzBENnU1?=
 =?utf-8?B?VDNTSVpXVkovQnErV0MzSHBqTTBTd3ZwZFRQOFlEbnEyR1lDVzFxWk1PYUh2?=
 =?utf-8?B?OHMzWjJNSDljazZrREt0T2hhRFUrTlRUT1FVQmJQdEdyTU5xVDNJdGNrVWht?=
 =?utf-8?B?U005elRoV2ZBYUlaTWk4RGgrazZmaVp2U0lVaWhkRHZsbktMM3VRdHlRQW8y?=
 =?utf-8?B?SEdodlhhNkdTWURLeTBjSHZsSlpibXpFa0VGS2pWV1VLN1VDbWZNKzFxbU9l?=
 =?utf-8?B?TGlzenNQMXdvUWNFYUt5cjZ2WklzQ1RJZEFYa1UzdGIvNzJwalNYK0lWTVkw?=
 =?utf-8?B?YjRMOHZ4Mmp5Rk45OVovWGgwTVBtUURwcWk0QzFyS1hDdk04YXhPQ2tla0xN?=
 =?utf-8?B?WC9XRXZrOVh3RUdxY3VOcTJWQSs4ajVlendxM2Z5akJuK29DRm9kUkVmYnpx?=
 =?utf-8?B?Zmk5U3hMUnljcmZ2VVg2YjJjNnhCMUhrWEdUZUhmVkY2aW9tSVAwRnl0aWFR?=
 =?utf-8?B?dWZKaE5SOVBFUUlHT1A1bExjSkZlcUFVZHNWMUNLenFFNGhJQitQUitKd3RZ?=
 =?utf-8?Q?IAXA=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7416014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 09:06:03.8567 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5c681a-ab4c-4a9e-29a9-08de2293df88
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7364
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

Hi Neil, Andrzej, Robert

On 31/10/25 20:40, Tomi Valkeinen wrote:

> Hi,
> 
> On 30/10/2025 17:16, Devarsh Thakkar wrote:
>> The sii902x driver was caching HDMI detection state in a sink_is_hdmi field
>> and checking it in mode_set() to determine whether to set HDMI or DVI
>> output mode. This approach had two problems:
>>
>> 1. With DRM_BRIDGE_ATTACH_NO_CONNECTOR (used by modern display drivers like
>> TIDSS), the bridge's get_modes() is never called. Instead, the
>> drm_bridge_connector helper calls the bridge's edid_read() and updates the
>> connector itself. This meant sink_is_hdmi was never populated, causing the
>> driver to default to DVI mode and breaking HDMI audio.
>>
>> 2. The mode_set() callback doesn't receive atomic state or connector
>> pointer, making it impossible to check connector->display_info.is_hdmi
>> directly at that point.
>>
>> Fix this by moving the HDMI vs DVI decision from mode_set() to
>> atomic_enable(), where we can access the connector via
>> drm_atomic_get_new_connector_for_encoder(). This works for both connector
>> models:
>>
>> - With DRM_BRIDGE_ATTACH_NO_CONNECTOR: Returns the drm_bridge_connector
>>    created by the display driver, which has already been updated by the
>> helper's call to drm_edid_connector_update()
>>
>> - Without DRM_BRIDGE_ATTACH_NO_CONNECTOR (legacy): Returns the connector
>>    embedded in sii902x struct, which gets updated by the bridge's own
>> get_modes()
>>
>> Fixes: 3de47e1309c2 ("drm/bridge: sii902x: use display info is_hdmi")
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> ---
>> V4: Shift HDMI detection to atomic_enable() and remove sink_is_hdmi caching
>> V3: Use drm_edid_connector_update without edid NULL check
>> V2: Use drm_edid_connector_update to detect HDMI
>>
<snip>

> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 

I wanted to follow up on this patch which fixes HDMI audio for the 
sii902x bridge driver when used with DRM_BRIDGE_ATTACH_NO_CONNECTOR. The 
patch has been reviewed by Tomi Valkeinen and addresses a real bug where 
HDMI audio is broken when using modern display drivers like TIDSS.

Could you please let me know if there are any concerns or if this can
be pulled in ?

Regards
Devarsh
