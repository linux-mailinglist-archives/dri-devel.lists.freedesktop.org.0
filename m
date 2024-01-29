Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235E1840AD9
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 17:09:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED67C112A0A;
	Mon, 29 Jan 2024 16:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EB11129FD;
 Mon, 29 Jan 2024 16:09:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bn1B1tcjw+YtzvM+KWQ1JeTIs9f1GIiyjlfu2s5i++eqvjaQNeIxIMgmQx2q2sYnIxJl4FpQpt8R+U7Fs4j/VaXerVJmJ5bxbfq0ihEinibx6YpQ3jbMaF4xnWcCovUMwZVcnUjJJy4SgAJDhrscO2vqyHZlG1QM+VtL6ak2YYFYOfvkL8lAedZdUmMooGTfivwbAUgjYiAN5V29o3f3ydQYHWbGVdobg2vV+DEbE9nbhfjphZMazMH92yLAwgzyi0nL36vtz5Htgf/miU20myYhWFAgekBXo7XdMulrY8xBn/Bm5TZYOltF18dz2R2UQQawdp51gmpqXCQqTtNm7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTC6+2ZjBJO17JkMmXozXeiN6buY2A4NEyWI51GMtXk=;
 b=U7WRGbqDm53m0WuyWnGH7c1nqk1B1bVt2DGnYncXeWN/MNxG9mUURFoAGw73LsmXGC7V3PnbvzY8q9Fm3qQSuF4/6eQiqfLNQ3l4qzZwC4/yc9P0dde5o85oe+yS52tqqYWrhOFfe1bNTbqwhjD6BbeCO+J+rkZV3trwFNLLjWRg2GUJWATR3F9baSNQJ8Y0z7pFa4jgf5owIibih8Vdk4a8MZ/KJj16aVKg6tsY7bmT172QOb0rqzGCpS7NcYH9jwn23Z88gnzuTA3UFDOyOf+Ou1hd7TGpNNgOpHMzYKwA5MqD/GL2kNYT87dJgK/Zt4apKQREU0OHq8Wifri41w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sTC6+2ZjBJO17JkMmXozXeiN6buY2A4NEyWI51GMtXk=;
 b=FwennYEg4mdiTCrPTKr2YY1vhFGpqKGmtV1FZYSkbVfgf4Bbe1CFv9wlPMJkpnarsXqSTuOhJXadSddFTj5+TNRcemvInArhwfkfgM/ddq7oC5jxoAKSrFS5/3IOglqTEQbRTNfuekQNe/lRZ7Sw6ahxV5dPCZbS8pDP7GGq8Kc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY8PR12MB7633.namprd12.prod.outlook.com (2603:10b6:930:9c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Mon, 29 Jan
 2024 16:09:36 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 16:09:36 +0000
Message-ID: <63c60424-1b2d-4912-81b2-7c7ead4c8289@amd.com>
Date: Mon, 29 Jan 2024 10:09:35 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amd: Fetch the EDID from _DDC if available for eDP
To: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Hans de Goede <hdegoede@redhat.com>
References: <20240126184639.8187-1-mario.limonciello@amd.com>
 <20240126184639.8187-3-mario.limonciello@amd.com> <87le88jx63.fsf@intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <87le88jx63.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR02CA0129.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::31) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY8PR12MB7633:EE_
X-MS-Office365-Filtering-Correlation-Id: 98872086-6283-4ca0-3aec-08dc20e4b026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: odv+JRmG1IKajhj3bfHLoujjFVTt9410hUvzIjPyT5nTdPl/BfJiMu2wMb7FV6nlA3nJn0chCNmqyy9aNshjvs2UT0je+FRd21Vo77xnFoZSdS5qWSRDCkz8ahU3BVKcwHbHzNlpWYquGPYdnrdTdkppZcz0RDIVtDzNkXt73yjoqEHqmU4NcJTzpd4pggDuiB6Ofg4ZSLPX1NJB1L+8AhY5QTmf/TdnKFBahSB7reQCnv3JVCasG2w+NQ+LWA4OT8s9igllDcoV32YRWQt2xRKaLNYhHeemcrEULOvc7LW/rDVzZmZnitvuwLlo3KWA1iVSdZnYyCLn9L5IAM3xPyB9RcM29Co5xIdCwGZM7YMMHxW9Qp1LKhpNtrXpODgGNeFbZwrBGkK0nD5a3LO5+Y7pLlkjGkpiIrWIbGegnoO/ZdUy6cpo5gNOxFKJQh6smc9NCctH4GFTbV1pHACY2Q558bAj3rCgWIvNCaWIGIsXjim6pbJhx1lV7clCXXuQrtn0R/eOTejcV4ujCo9zN9T4KxelWYYY7p724hfDhWu8s9xDKVbjhayJriw5ThOxS+yPDMZ+sX6HCrttOw8q8Vfee8o1PCUKSSikDRSoAcoY/LL3O6vxOei/RHMdHaUk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(316002)(31696002)(54906003)(110136005)(83380400001)(66556008)(86362001)(66946007)(66476007)(966005)(6486002)(478600001)(6506007)(53546011)(8676002)(38100700002)(31686004)(2616005)(26005)(8936002)(4326008)(44832011)(6512007)(5660300002)(2906002)(41300700001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmErM0dWYWdkVWhjMzJkbFpQRXAveU9kK3RBbytWbEIzeE5pUUxPZVovOTJz?=
 =?utf-8?B?Q0Ira0o2WENwWVVpMjVEZ1hUc0pib29KWm5Kd25EKzNITVJneXpJdjZmYk91?=
 =?utf-8?B?NGhOT3ltbHY1M1Z5ZXpVc1lmN0xRSVFWa0dDcGlqVDVkUUQ5Ni9PRGFQZTUx?=
 =?utf-8?B?M1V5T3FRUUtNb0dFT3dKWTQxL0ZnMkEyR04vcVdhaFp0NnRsMTZ1dExmWEZB?=
 =?utf-8?B?cVkwa1VvZkxoK1hyRDZlbTBsdHNJbjhRNnYvUmJmK3pTMGpPYVFVclhnZi8w?=
 =?utf-8?B?R2lTL0VpdDF1M3BiSVk4bFM5Yi9lT2Y4VTVEeE5UMVUvaUpLK3dvVmp2bllp?=
 =?utf-8?B?MW1SOGRBVTRVYm1FTDBtby9CQ1BXV0FGRHZiaUVnNjg1VGplaERzdFpMUG1S?=
 =?utf-8?B?bFFGQ29pV2pRUHQwQ3NBY2VBeTVtVHgvNHgrU0txcld5c1d6TFlraDFXbFdz?=
 =?utf-8?B?MnBIRlV6bFdEZTd3QVQvbHdUT2d6OXdjKzVsNWU2Z2djU1BqN2JoVDhKbUI3?=
 =?utf-8?B?M01QWVJSbVJZdkhPNHZ2ZXlOVTUxZHBKWHRseEUwWHIxd0pGcGhJSDBEUGlM?=
 =?utf-8?B?NG4wSHpOWTAxd3VHUGs1RHI3b0hud05heHB0Q0ptSUJWQ1l1UHpROVd4TWFr?=
 =?utf-8?B?K1k0Tk5RdER5MlVNK0Q2amZZUC81dER2SHluUVRyQlB4Unh2MEUyWkcwSkJ1?=
 =?utf-8?B?akx5T0VWanhnYnY0NWIxVUdSL0xHUGl1RFRoWk10VDBnanJBbG1hUU9wNTNn?=
 =?utf-8?B?TTVJcWpNL3JvZ3Y2OHhNaUpnSlI4cjJ0TkNXWlVyVzBXcWdKNHh4V0RYV3Np?=
 =?utf-8?B?dHlBZnBNNHVxVzJoVG9odHE0NFk0V2w5c0gzYUhkelordGZneVZvKy9OVm1k?=
 =?utf-8?B?U3hnTDdiNlN2NWJNL0wyaTNteFhqeUYxTytXNXpBMzFFKzRWdklXMVB4SnhH?=
 =?utf-8?B?UUxwQWNORDR1UXRYaHhLNlFESmxCUlhiYjNkWUhjRTlxcHhDQzAyMDA0SmJk?=
 =?utf-8?B?RzRRUytvMEJVeHMvc2VhTmpXRTVoMlArNHZGck8xQlpKQ2lYaCtQdjZWaHdQ?=
 =?utf-8?B?MGRzM2Nkb3JZUVdwTXQ3UnA3ekEvOENpR0J3UFRDLytBdlRGZmVxZmx2R3lI?=
 =?utf-8?B?YTJaSitaWXMwYjRtRmtzcENQSjhLZTFGZFQ1NjRYUDhkbmFTVFlLSjRxei9L?=
 =?utf-8?B?RU5PNzFEZ2NCaHJ2Ni9RN25DbXRkc09SQUF6NHJ5ajdldWpObU9IbVNrNHJO?=
 =?utf-8?B?UFMwd2dCTjVUZTVhMktuMjRscnpYZEFUVzJRWXRHMGNzTE9wRThXVDhGbENx?=
 =?utf-8?B?ZjEra3RsQzllZDNxYzEyUmFuZDhTb2NMWFFaK09jZDNMTTdEN1JHYi9lN1h5?=
 =?utf-8?B?akZVRHhWU1JXdVkwTG56a1lTbVdKMTVvUUlTQzZPMjI4eWtIZGUwZzhWUVQ4?=
 =?utf-8?B?emFUVC8zbFRpbnZVUUtTN1FEdXhMSjNDTmJlN0duejZ3MHBoM2VjcUxaVHJW?=
 =?utf-8?B?TmplZ0hxL1VUUnNRWFF6WjNzUEhxeEdVREoxR0J3a0pNOS9hcWNtQWNnb1Vt?=
 =?utf-8?B?TUtEMkNXRzNEeEFveFdSbEJtRmxkRGJiV0VTNzd3R3BLT0xNTEVGanB5WURi?=
 =?utf-8?B?WUE4Z1V3SkU5SzRrWWR0dzYwcmNMdHprMFZIVG45dXE5TkwxUktudmdXWmRt?=
 =?utf-8?B?MjVGamNPVWJ4ZjVmWm16RCtqOTZHdnVlQ3o5TDl2QjBtTkE4UFJJTUg5MUhX?=
 =?utf-8?B?eWwwRUxsWFVmazVvYm9UQ3RLSHE5TTNaQ2grVFZLK1c0RDU2UGFpMVR4enJo?=
 =?utf-8?B?M29JQ01oUmliNnkzc0RxM0Fjb2VWY2J2NDhtRTdGcmVHQmhoWmJ3NkJ3WEJh?=
 =?utf-8?B?VnE4cTZlTC9OaEJ6aEZXQTQ3K0JCakFleDlqSjRKNWQ3NkJPTzFISmVxOWNq?=
 =?utf-8?B?akF5eWk4a2FXU3EvcEdib2duc3YvZ2FYdVV4TjBaY05ZTGFwdUdUSDJ1Z1Nn?=
 =?utf-8?B?Vkd3T1U2MlNmL2lIN3hkR1V1SjhmWkExVlUyd3FXUzA5czZPMlBqOHl1Mm1Z?=
 =?utf-8?B?TU5ad0UvMEYzRjd0L1RTUlZndnFpaXE1MFJoOE9IaEpxdTZxZHVJMzlZa2FC?=
 =?utf-8?Q?bESUlCXujnfaljGAyWFFHej/R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98872086-6283-4ca0-3aec-08dc20e4b026
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 16:09:36.1247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4UwIeUhUHSJupKIfaAP1ape61E3auzz9UClmrcT7bCpMO5/XX0YVc8Vm+15apCRYYN1wRw6CB9Ccd5b3tvh+ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7633
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
Cc: Melissa Wen <mwen@igalia.com>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/29/2024 03:39, Jani Nikula wrote:
> On Fri, 26 Jan 2024, Mario Limonciello <mario.limonciello@amd.com> wrote:
>> Some manufacturers have intentionally put an EDID that differs from
>> the EDID on the internal panel on laptops.
>>
>> Attempt to fetch this EDID if it exists and prefer it over the EDID
>> that is provided by the panel.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  2 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      | 30 +++++++++++++++++++
>>   .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  5 ++++
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 ++++-
>>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  7 +++--
>>   5 files changed, 49 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> index c5f3859fd682..99abe12567a4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -1520,6 +1520,7 @@ int amdgpu_acpi_get_mem_info(struct amdgpu_device *adev, int xcc_id,
>>   
>>   void amdgpu_acpi_get_backlight_caps(struct amdgpu_dm_backlight_caps *caps);
>>   bool amdgpu_acpi_should_gpu_reset(struct amdgpu_device *adev);
>> +void *amdgpu_acpi_edid(struct amdgpu_device *adev, struct drm_connector *connector);
>>   void amdgpu_acpi_detect(void);
>>   void amdgpu_acpi_release(void);
>>   #else
>> @@ -1537,6 +1538,7 @@ static inline int amdgpu_acpi_get_mem_info(struct amdgpu_device *adev,
>>   }
>>   static inline void amdgpu_acpi_fini(struct amdgpu_device *adev) { }
>>   static inline bool amdgpu_acpi_should_gpu_reset(struct amdgpu_device *adev) { return false; }
>> +static inline void *amdgpu_acpi_edid(struct amdgpu_device *adev, struct drm_connector *connector) { return NULL; }
>>   static inline void amdgpu_acpi_detect(void) { }
>>   static inline void amdgpu_acpi_release(void) { }
>>   static inline bool amdgpu_acpi_is_power_shift_control_supported(void) { return false; }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>> index e550067e5c5d..c106335f1f22 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>> @@ -1380,6 +1380,36 @@ bool amdgpu_acpi_should_gpu_reset(struct amdgpu_device *adev)
>>   #endif
>>   }
>>   
>> +/**
>> + * amdgpu_acpi_edid
>> + * @adev: amdgpu_device pointer
>> + * @connector: drm_connector pointer
>> + *
>> + * Returns the EDID used for the internal panel if present, NULL otherwise.
>> + */
>> +void *
>> +amdgpu_acpi_edid(struct amdgpu_device *adev, struct drm_connector *connector)
>> +{
>> +	struct drm_device *ddev = adev_to_drm(adev);
>> +	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
>> +	void *edid;
>> +	int r;
>> +
>> +	if (!acpidev)
>> +		return NULL;
>> +
>> +	if (connector->connector_type != DRM_MODE_CONNECTOR_eDP)
>> +		return NULL;
>> +
>> +	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
>> +	if (r < 0) {
>> +		DRM_DEBUG_DRIVER("Failed to get EDID from ACPI: %d\n", r);
>> +		return NULL;
>> +	}
>> +
>> +	return kmemdup(edid, r, GFP_KERNEL);
>> +}
>> +
>>   /*
>>    * amdgpu_acpi_detect - detect ACPI ATIF/ATCS methods
>>    *
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
>> index 9caba10315a8..c7e1563a46d3 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
>> @@ -278,6 +278,11 @@ static void amdgpu_connector_get_edid(struct drm_connector *connector)
>>   	struct amdgpu_device *adev = drm_to_adev(dev);
>>   	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
>>   
>> +	if (amdgpu_connector->edid)
>> +		return;
>> +
>> +	/* if the BIOS specifies the EDID via _DDC, prefer this */
>> +	amdgpu_connector->edid = amdgpu_acpi_edid(adev, connector);
> 
> Imagine the EDID returned by acpi_video_get_edid() has edid->extensions
> bigger than 4. Of course it should not, but you have no guarantees, and
> it originates outside of the kernel.
> 
> The real fix is to have the function return a struct drm_edid which
> tracks the allocation size separately. Unfortunately, it requires a
> bunch of changes along the way. We've mostly done it in i915, and I've
> sent a series to do this in drm/bridge [1].
> 
> Bottom line, we should stop using struct edid in drivers. They'll all
> parse the info differently, and from what I've seen, often wrong.
> 
> 

Thanks for the feedback.  In that case this specific change should 
probably rebase on the Melissa's work 
https://lore.kernel.org/amd-gfx/20240126163429.56714-1-mwen@igalia.com/ 
after she takes into account the feedback.

Let me ask you this though - do you think that after that's done should 
we let all drivers get EDID from BIOS as a priority?  Or would you 
prefer that this is unique to amdgpu?

Something like:

1) If user specifies on kernel command line and puts an EDID in 
/lib/firmware use that.
2) If BIOS has EDID in _DDC and it's eDP panel, use that.
3) Get panel EDID.

> BR,
> Jani.
> 
> 
> [1] https://patchwork.freedesktop.org/series/128149/
> 
> 
>>   	if (amdgpu_connector->edid)
>>   		return;
>>   
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index cd98b3565178..1faa21f542bd 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -6562,17 +6562,23 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>>   {
>>   	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
>>   	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
>> +	struct amdgpu_device *adev = drm_to_adev(connector->dev);
>>   	struct dc_link *dc_link = aconnector->dc_link;
>>   	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
>>   	struct edid *edid;
>>   
>> +	/* prefer ACPI over panel for eDP */
>> +	edid = amdgpu_acpi_edid(adev, connector);
>> +
>>   	/*
>>   	 * Note: drm_get_edid gets edid in the following order:
>>   	 * 1) override EDID if set via edid_override debugfs,
>>   	 * 2) firmware EDID if set via edid_firmware module parameter
>>   	 * 3) regular DDC read.
>>   	 */
>> -	edid = drm_get_edid(connector, &amdgpu_connector->ddc_bus->aux.ddc);
>> +	if (!edid)
>> +		edid = drm_get_edid(connector, &amdgpu_connector->ddc_bus->aux.ddc);
>> +
>>   	if (!edid) {
>>   		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
>>   		return;
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> index e3915c4f8566..6bf2a8867e76 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> @@ -895,6 +895,7 @@ enum dc_edid_status dm_helpers_read_local_edid(
>>   {
>>   	struct amdgpu_dm_connector *aconnector = link->priv;
>>   	struct drm_connector *connector = &aconnector->base;
>> +	struct amdgpu_device *adev = drm_to_adev(connector->dev);
>>   	struct i2c_adapter *ddc;
>>   	int retry = 3;
>>   	enum dc_edid_status edid_status;
>> @@ -909,8 +910,10 @@ enum dc_edid_status dm_helpers_read_local_edid(
>>   	 * do check sum and retry to make sure read correct edid.
>>   	 */
>>   	do {
>> -
>> -		edid = drm_get_edid(&aconnector->base, ddc);
>> +		/* prefer ACPI over panel for eDP */
>> +		edid = amdgpu_acpi_edid(adev, connector);
>> +		if (!edid)
>> +			edid = drm_get_edid(&aconnector->base, ddc);
>>   
>>   		/* DP Compliance Test 4.2.2.6 */
>>   		if (link->aux_mode && connector->edid_corrupt)
> 

