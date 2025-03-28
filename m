Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24940A74DB8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 16:30:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4406A10EA48;
	Fri, 28 Mar 2025 15:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ByWIbRCQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12hn2234.outbound.protection.outlook.com [52.100.166.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4634E10EA48
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 15:30:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMXVLvTU4A1C+4KnoyqRVQoWTW0PWxhtoIhES1730e9n1Rgvl+KliA+5I5H4f7todXNCvh6S5g1WVWnvIJBR/MgshO44foJ2RV+/JloMfPsBJqA+YC5euEvfHntWNVRcfs0SAp5+1P/uIm7D+iedBBdvIn5XK1ZTLE3UYmwnjS83e9CmaQeWIkGy7/8TdSw1lLMWjfqHR0DOiM4bqujPkqKMmDd0dMf+W61h9IB4VWA0W6y/9OML07fBL7tVYz9PH+2HwyoNelDElYkRw+DeZYOYZoWMKIqqaYTzoXk/UlXq++7oIcePq+1mMjqdwca08o5XM3pKZqZx7G2MSBgd/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LA/DV0c7UQT1jxZJTyJUJ8QBFO3XouPdE5+5LXkbTQ=;
 b=SP08tfZPY5lJme5i7i7RxoK7ym9w8/BHjvjwN0ZuWoFChVb+j7zEaq//oOozsVbQyM+2ysGuPf8AOlAyaC5ET0el1gN5fXinYGPqIxNKmYXv0YuW+Xqe0yF5/H3sb5pq4B41FBkSCCMjFe1vFpM05PBapljp4h/H4QAzYXewbGBBTXT+nqaLBqtA27fHPgcS9TY8fVqjBZbR1MTu8cu2V/5R6RQqZPMy+pz3EhLqGdAYN3sQC+NBaeJDNclQMidT4rIBZlpCHMZTfn3jzQsTiANyO1SdR0gVUjHM90BhA5Qwa355uRPGkm8Fym7KYCEFWrvFK88hkajwk4ggW8BgsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LA/DV0c7UQT1jxZJTyJUJ8QBFO3XouPdE5+5LXkbTQ=;
 b=ByWIbRCQ31ERAr+RiCztSZ0EJs3fJ86rgVlNGTtFQ+ZdeRJ8wADTzGZVh15c29fd4qTfyDj7b/VoU5JQr1njPmE8mARTj1zJcQ0GBCNmoWYHnSz8vmrnvZAE6YqDIQyJJ/DBOEPPUSM9MYD4R4HDPR8Io9VGrZY0mslCeYuHmRg=
Received: from MW4PR03CA0014.namprd03.prod.outlook.com (2603:10b6:303:8f::19)
 by CH3PR12MB7644.namprd12.prod.outlook.com (2603:10b6:610:14f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 15:30:01 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:303:8f:cafe::31) by MW4PR03CA0014.outlook.office365.com
 (2603:10b6:303:8f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Fri,
 28 Mar 2025 15:30:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 28 Mar 2025 15:30:00 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Mar
 2025 10:29:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Mar
 2025 10:29:58 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 28 Mar 2025 10:29:57 -0500
Message-ID: <9c22f404-7832-638e-5637-5739626a7064@amd.com>
Date: Fri, 28 Mar 2025 08:29:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] accel/ivpu: Fix deadlock in ivpu_ms_cleanup()
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, Maciej Falkowski
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <quic_jhugo@quicinc.com>, <stable@vger.kernel.org>
References: <20250325114306.3740022-1-maciej.falkowski@linux.intel.com>
 <20250325114306.3740022-2-maciej.falkowski@linux.intel.com>
 <a0d93faa-40e0-4fc9-8b86-1e30c3946124@amd.com>
 <17c82a42-2174-425f-a4c4-4df18176f7a1@linux.intel.com>
 <40a4d432-aa18-6a60-adcc-e73eb3c7fcb7@amd.com>
 <a4365e8a-093d-488c-be79-6eda6b29ddde@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <a4365e8a-093d-488c-be79-6eda6b29ddde@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|CH3PR12MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: acc6a8f6-6e66-4603-a71b-08dd6e0d6763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|34020700016|36860700013|7053199007|12100799063;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmVmZ1JQN0dNcUdodXorTC96U2ZOWE1aZ2FoeEZ5bUhKNUJib08ydE5jSi9t?=
 =?utf-8?B?ci9YV3hSRHhtdUwwTm01TjVNNlh4YVU4dStwcGFDZHFLN1JmRkpVcmk1SDZj?=
 =?utf-8?B?clBzSTRLZFA3Si9VUEhBZUJwaW9ZRVdObERRUmtkQkJCZW5uL0NjZTkxZ0hW?=
 =?utf-8?B?NHlyTWJKcVJ2R1REY0ZramdkdHo0TmFOM3hpM2pNQnpqckIvK2RsdEZ0RTB6?=
 =?utf-8?B?RTJlam5adS9qNnN6QWFBSFRxSHZBRm1ZVWE5enlGUk1YcnZJYVMxbW45VjZH?=
 =?utf-8?B?ZDVVNHdYbkhjNWt3KzIwZG8ydmxrMlE1WlFWQThRNXNCeFRxQ0x1eSt2NFFk?=
 =?utf-8?B?aEJrR0gwSFBlQVhuYm1qMFR6QnZvR3ExRldvNmhRc09rMGMzMG1JQmk5RE5l?=
 =?utf-8?B?cUxEUUhXbHhaNmNZdEk0WU5ONlNJSmlrdWJtTnlRRzltekJRaWJWSlk1aDdm?=
 =?utf-8?B?VjE3aEJoMTRlQVhDRlFLbnk5ejdtalkwcy9Kd2FJaUJwUEIxcmpSSHdxbkw4?=
 =?utf-8?B?MUNKWkJmd1lETEQ3MWxDc0ZjekpvdXJNc2hNQUp1TUFYajBaQzNydkVvNERv?=
 =?utf-8?B?Vm9LMThkbXYzWDBLak1TWlBQejFQbXZYTlIzcERGbUZwcmEvY0tYTTcwWlky?=
 =?utf-8?B?cUFhWVJkcEpKaFROS3E5eTdYKzJPdERiQUV4bVVjUjNGdlk0WVdoSGcrM3dy?=
 =?utf-8?B?bWNFb0tDMmlLV2dWU3hjempYQjhqM1Z1Ukp3YWx0dkZ5THpmZG9EdGU3bXov?=
 =?utf-8?B?a1QvTU0zOTZXbjQ3TklCbWVhbmF6dTdMdGJ5S0xUcExDV2NBZU9CamQwbjBr?=
 =?utf-8?B?Y2ZmNmlBMjNMTGo5TWJ1RkFkS1Q4SjVYQkIxM2VkN3h1ZWNINVJpQTQ1MUhx?=
 =?utf-8?B?YWNPMGhPbk5YSnZxdzVOWjMzOWZMRmhuZFJzdjc3V0ZxTVc1QlZkRS9oMExz?=
 =?utf-8?B?bGZhK0RERUorU1BJaHhjcnBqTlJLOGhmK2ZIVFRsZ200NjlXbHZSZGFWYVIv?=
 =?utf-8?B?MzF2eGtSbGFIeUFLRGxBakMrMm9PRU1xN2JndmlxdFdXbzdPZ0NSNTZFWVZC?=
 =?utf-8?B?VHlKWE9ic2hZVTlzajVHQ3FLaVVMVnYvOHlKb0ZEWjZyZzkzTThGNUFZYzcz?=
 =?utf-8?B?RGRzandSZnA4akZTbzhOR2VrSmx0czVOTGM3ZXVrZDBWTnlVMW44RW1OZ3hH?=
 =?utf-8?B?T3lKRnBlK2NYazlKMVNNcUc4MU9CQWxoT3hTZzBITHBPeEJTYTVySGZ3Vms4?=
 =?utf-8?B?MVMrOEJaTTc2elJwZk8rOHUvTHFiZ3BTT0x6blQ2Q3NwK01tZ2ZNQzdMMTVz?=
 =?utf-8?B?UFJITDY5VzlmbGFNZXI2N3BWUkpBcHdFRW12RnAvQk1GeGFYbzZacG1hZWUv?=
 =?utf-8?B?Mm9meUIzanEwVXNqdU0wSHlPeC83L2dCTUE4YXBNUU9URFlFa3htQi9CRTJ4?=
 =?utf-8?B?ek12cHBJMnphMDdxb3d3NnB5d1dkQ1Z5dzc1b0xWejJNbWh2djhVYXpjeWlu?=
 =?utf-8?B?a3RqR3VLREI1Vk52V212TFVjV1hiUkx2OUJYYkQvaGpPbWViMCs0WlNWQ1Mv?=
 =?utf-8?B?c2Y3QW9JbmMwQkxIaHBZNGJXeEMwajdOcXBTVjYvODNTMS82Smd2Q3hUYk9a?=
 =?utf-8?B?QmFzVEJ1SDdKdThVU1F0Mll3L3I5VmhnS21TR0Z2cmNQcDVqbzkxMlluSERm?=
 =?utf-8?B?R1UrQmdSYXlRLzlxVnFPbmhRQjR6TnM3N0o0MTc3Z201aEJJZ3d6dUNVTHpn?=
 =?utf-8?B?UkowYjVYdEU1aTRveWQ5WjJJVWovUEc2MHFydkF1S1lNSENiZnhkVllKS2pL?=
 =?utf-8?B?enlGMEljcVZpVVpsL2NLK2wwZitJWVR4Nk5uR1N1RURPTm5ncldIR216NXJz?=
 =?utf-8?B?VWJQQnl3ajBZOGk4akJuS2pkVlhIclNLRUFaVTNXd1NvRDAvV1ZxV3R0VWY2?=
 =?utf-8?B?a00rY1NrYk5hVHpReHVFeE8rY3llc0pBekRhTVhXaTQ4MkUzam9aZHM2RkVS?=
 =?utf-8?Q?wJxStpCtzFOK6o3XvksGGB+hd5Uw+M=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(34020700016)(36860700013)(7053199007)(12100799063);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 15:30:00.3130 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acc6a8f6-6e66-4603-a71b-08dd6e0d6763
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7644
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


On 3/28/25 01:23, Jacek Lawrynowicz wrote:
>
> On 3/27/2025 6:38 PM, Lizhi Hou wrote:
>> On 3/26/25 01:06, Jacek Lawrynowicz wrote:
>>> Hi,
>>>
>>> On 3/25/2025 9:50 PM, Lizhi Hou wrote:
>>>> On 3/25/25 04:43, Maciej Falkowski wrote:
>>>>> From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>>>>
>>>>> Fix deadlock in ivpu_ms_cleanup() by preventing runtime resume after
>>>>> file_priv->ms_lock is acquired.
>>>>>
>>>>> During a failure in runtime resume, a cold boot is executed, which
>>>>> calls ivpu_ms_cleanup_all(). This function calls ivpu_ms_cleanup()
>>>>> that acquires file_priv->ms_lock and causes the deadlock.
>>>>>
>>>>> Fixes: cdfad4db7756 ("accel/ivpu: Add NPU profiling support")
>>>>> Cc: <stable@vger.kernel.org> # v6.11+
>>>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>>>> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>>>>> ---
>>>>>     drivers/accel/ivpu/ivpu_ms.c | 6 ++++++
>>>>>     1 file changed, 6 insertions(+)
>>>>>
>>>>> diff --git a/drivers/accel/ivpu/ivpu_ms.c b/drivers/accel/ivpu/ivpu_ms.c
>>>>> index ffe7b10f8a76..eb485cf15ad6 100644
>>>>> --- a/drivers/accel/ivpu/ivpu_ms.c
>>>>> +++ b/drivers/accel/ivpu/ivpu_ms.c
>>>>> @@ -4,6 +4,7 @@
>>>>>      */
>>>>>       #include <drm/drm_file.h>
>>>>> +#include <linux/pm_runtime.h>
>>>>>       #include "ivpu_drv.h"
>>>>>     #include "ivpu_gem.h"
>>>>> @@ -281,6 +282,9 @@ int ivpu_ms_get_info_ioctl(struct drm_device *dev, void *data, struct drm_file *
>>>>>     void ivpu_ms_cleanup(struct ivpu_file_priv *file_priv)
>>>>>     {
>>>>>         struct ivpu_ms_instance *ms, *tmp;
>>>>> +    struct ivpu_device *vdev = file_priv->vdev;
>>>>> +
>>>>> +    pm_runtime_get_sync(vdev->drm.dev);
>>>> Could get_sync() be failed here? Maybe it is better to add warning for failure?
>>> Yes, this could fail but we already have detailed warnings in runtime resume callback (ivpu_pm_runtime_resume_cb()).
>> Will the deadlock still happens if this function fails?
> No. The deadlock was caused by runtime resume in free_instance().
> pm_runtime_get_sync() will always bump PM usage counter, so there will be no resume regardless if it fails or not.
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>>>>>           mutex_lock(&file_priv->ms_lock);
>>>>>     @@ -293,6 +297,8 @@ void ivpu_ms_cleanup(struct ivpu_file_priv *file_priv)
>>>>>             free_instance(file_priv, ms);
>>>>>           mutex_unlock(&file_priv->ms_lock);
>>>>> +
>>>>> +    pm_runtime_put_autosuspend(vdev->drm.dev);
>>>>>     }
>>>>>       void ivpu_ms_cleanup_all(struct ivpu_device *vdev)
>>> Regards,
>>> Jacek
>>>
