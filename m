Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 294C4AFF992
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 08:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC4B10E366;
	Thu, 10 Jul 2025 06:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aChu0yMn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F011710E17E;
 Thu, 10 Jul 2025 06:18:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LeC2CRTvbwzFZWoEAB3Gtx1/0Ff+suSEKrFKyumyZeD9ZneIT6zMu5dv5CSXbSC/8ZvnN2H/DdZTwEYvBwfjxEI6d/NgsRboDakN5/WfHzkrV95Epf8Lt2QpjAuOCeYVmhxxySCDvpqo8n90ppqrUSwwR1JL8gHUBe6gx/IuEgwsizZAY00H0n0O6am/SmsIiJyxBU8qcsm6Q3n5P/ktutwjkpZTjc5Bfh4amzu25LCC8yv5kGm5jRBArdbmUViUx4RBxUtR+Q0LldnUdekNwkgx+vrCHlv2zBMb5YzKx9D/ZUYz8EoX1XTl4Tr3n/zhN9uvwjplEun7QNog98syYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQb3PHt9ippX5DCsX6K+yECyu0K6pm2ehSlPYbN+w3k=;
 b=exvMgZKC8TUWbWJFkZ5imdc0JFgYQ6Bk5EQr8V8rA+Llb6zVpbooOL46pykL2/R7oquObOAvBorRKq+hZ3ZntqOzK6b07o1KI0jlkuEtWROwSRPcdjEhhGxegASTtgTrqC43rBmAdIzgOEQGURYAmWo1GQcIQuhetxJ3GZ5FFKB/CAQvP1CTcglt46jg3ac6qRCIPNynnZjoCtef//gyf563md0Ww1a25FZGwMv1TwXpy2lMR8XDRGu796BYCpz2hq44PQJn0uKHqgT+9GiIm0QE+/UeSCiQdn+A22V0pf6T18ptG7yAU+gzK9tMJ6/JCp5R9fix3YXD2CJ/PtQ7cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQb3PHt9ippX5DCsX6K+yECyu0K6pm2ehSlPYbN+w3k=;
 b=aChu0yMnR32t/Lmt7QU3mFnLwXsJcDifGfw6gzKqBf+7XrWe7Hz9LfEzpq/Z09d+ceByIi86ortB8BGXcKRMOzwBWYi94VKRBV1GvFCVufZV0jB854SF9UTGxkxP6aztO1FVYSvZz6pTWK8L0Ar/A+jsKrYLkOkBnFMAQw9wmYQ=
Received: from MW4P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::18)
 by CY3PR12MB9577.namprd12.prod.outlook.com (2603:10b6:930:109::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 06:18:29 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:303:8b:cafe::12) by MW4P221CA0013.outlook.office365.com
 (2603:10b6:303:8b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Thu,
 10 Jul 2025 06:18:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Thu, 10 Jul 2025 06:18:28 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 01:18:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 01:18:27 -0500
Received: from [10.65.159.153] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 10 Jul 2025 01:18:21 -0500
Message-ID: <b8f0339d-0221-4f35-8db1-399471db5330@amd.com>
Date: Thu, 10 Jul 2025 14:18:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] drm/amdgpu: do not resume device in thaw for
 normal hibernation
To: "Lazar, Lijo" <lijo.lazar@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Samuel Zhang <guoqing.zhang@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <rafael@kernel.org>, 
 <len.brown@intel.com>, <pavel@kernel.org>, <gregkh@linuxfoundation.org>,
 <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ray.huang@amd.com>, <matthew.auld@intel.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>
CC: <victor.zhao@amd.com>, <haijun.chang@amd.com>, <Qing.Ma@amd.com>,
 <Owen.Zhang2@amd.com>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20250709100512.3762063-1-guoqing.zhang@amd.com>
 <20250709100512.3762063-6-guoqing.zhang@amd.com>
 <6963322b-d4e2-4d4d-b4b6-e2c44d49a94b@amd.com>
 <202dae4c-6280-4f35-9c16-fdf6398ba856@amd.com>
Content-Language: en-US
From: "Zhang, GuoQing (Sam)" <guoqzhan@amd.com>
In-Reply-To: <202dae4c-6280-4f35-9c16-fdf6398ba856@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|CY3PR12MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: c479a432-692d-4bbb-7b96-08ddbf799621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVNNMGJJZ05XUzZvdzZ6OEhwWnFIRDF5VDJPR1JhVUg3ZmQxVmkzdmk1WlNW?=
 =?utf-8?B?Uy9XQVROamwwV0dHME52ZWhRQjZ4dTh0RkFIWUdBVVVSOS83RHNzajlWS0Jq?=
 =?utf-8?B?NFJ5bmhxeEhZYU9DbTJXKzRabk8yUThtOUQwaUNRK3ZIQnIreXdaSThOYlpk?=
 =?utf-8?B?TmR0ZkFyV2lDN3FtR09JS3RkU0IxcTY0aEtvZU40SzRUTEo4cCsxRkZOM2Z3?=
 =?utf-8?B?TnBnVTBvVS9reEtDYU1vclZqaFl4bVV3dE5lSGcyeEVaOEQ1VG4wUVVQUks1?=
 =?utf-8?B?NFh1STZHZlhGWlhPc0Y4cEVFTElVUmY1TTlBT2s5QUlDZXkvZ1B5OGVyZzdS?=
 =?utf-8?B?WjZ6Q0VKSTl0cjhIWDh5amNYSEVqcDd3a2pWY2ZzN01BSEluMS9XVGFqUVVn?=
 =?utf-8?B?RUxwU1FvSHNUYlZVdzhHb01JbXA2RzRnRzJIZ3pIOWZ5U2MvL2t3NnVHMXA5?=
 =?utf-8?B?T01INEJ5cmtYdi9oSHRFTlBhK1ViUS9mUE9mNWdLU202SjZ4S1lYQjlodUN2?=
 =?utf-8?B?WXg3d1V2NGdQeUx2dmd6TjlhOCtvK2szTDRNVHJ4Y0kxQmdFelpYU1ZPaFJU?=
 =?utf-8?B?MzlkTWxWM2V6ZUc2NzM4YmJXVnlIVmNaOWFqbUh4RFFxM1poZ1RkcnZ2bXdV?=
 =?utf-8?B?L2RXemtKN21QVWRxZ0hVQmxDM05rN0hNSWwwd1pHeU5sTXhpYi8wZTNoV3pP?=
 =?utf-8?B?ZW9pSWdySzJRMDk3UTdzc0kxYnJBdVQwWkNqUG9hVGRvTE1YYUtxL0pSSGxi?=
 =?utf-8?B?NENEb04ySTE3VHpSbHpxN2VHSDhUbi82cGNjQktTNk1kd1FmaTJ5S0RoM3hz?=
 =?utf-8?B?aFRoeWg3QW1uSEEvdGdIeVl6SGU0WndiZ0laZEo0TCtSUkZKNVZ5eW05aXor?=
 =?utf-8?B?R21IUjJxejYxNEU0OHRtbFZMTzcrZ293T3VDZVJUN1pXZGNXYzU1WW5yYTR2?=
 =?utf-8?B?L05LOUd3am5lRDIvUVdtUTlzVnpLTDNtcVhqcHBiL2VEL0tzdmR1V0Q3eHdt?=
 =?utf-8?B?ZFhNMEhNVUtDdEFSL3gxeHhsUVpURTZrbm5RclhiR0d5QnVUcklTVGNGcWlK?=
 =?utf-8?B?a2F2UEtiUzNHMklVNTdXVjltSndiUGEwODMwSWc5ZlJRclFteFc2Y3BEV0d5?=
 =?utf-8?B?ZjZuQWpCY3A2SVVBdGtDVklaczZPYlV0aTIyUDBvakZ0TjgxZjJENVduSHdO?=
 =?utf-8?B?bE9Dazh0Qzc0OFd2WHgxeW5palY0ZVZ0dDZlVTJFM0pMWEw1VWxMbnIrSUV3?=
 =?utf-8?B?ZGNLU3d1VGpkMUZOemNhcEhhZ3VubzBmTDYrbHYxRVM5alVFbC9WbFNOZlFv?=
 =?utf-8?B?elZGK1FSTXBQVzZubUx6RlJHd0xjb3lEcEdHVmNPZGo5eng5bDhiYy9IOEpD?=
 =?utf-8?B?c3RoSjRCNHlVdnU4K3h4dE9idTUzVlRTNmNNS24za2RsbGxVcnNIOWdTUThv?=
 =?utf-8?B?MGpGVXNnSHBBWElEQ1VOcXp4ZVhxQjRPc0FwTjVBb0xERDhCOGsrOUhQTkY2?=
 =?utf-8?B?b3FoU3JwNlh6aFUyNkx5eEJpOC9BTkt5SmFxN2JMdllIKzFnVG5VMHphWno3?=
 =?utf-8?B?dTV1dFZxU2J3eDZJUTVUUW1tbFFMY1RleVg1ejZpWHVVVnViOGtQQlF6VEcw?=
 =?utf-8?B?eHRaaWJrVitSek9JWHkwSEU5bDJjeGw5em5kQTR0TjBqaEY3WFl3cEIzVE5k?=
 =?utf-8?B?azRTVHdtNjVSdkE1NER2bXgzaXQ4NnNZcFVOU2JsQ0ZUeVVFcnN1c0RISG9T?=
 =?utf-8?B?a28vVjM4TnF5a3pFL0RTcVhCTkNsWDVUeVU2eVpmWU9oaTgvVXl3M21nWkk2?=
 =?utf-8?B?Yk1iZklZUmY4SUQxSWVpeUJncTlFSUdiOEM3b0VZamMvZVZ2SkJoRlowelRk?=
 =?utf-8?B?R2xTNXRnNzYvWmhRVzYzMUxNVWVIODN0SXk2WmJ0dFdBYm5iOUFpRFhKZlFZ?=
 =?utf-8?B?b3dHRnBQM0NKTUN4WHNIeVlkbGlpMFhtRk5RRmpUTnZPN0Y1VmVqQi9ubUJT?=
 =?utf-8?B?V1JLYTZySmo5SXBuRXZ5OGVxbnBwWUJMTVFxN0F2VFViVnlvL1NVdWI3YlB1?=
 =?utf-8?B?NHI0Tk91ZmpDbCtwNmtkMnUreGxRam55YkNWUT09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 06:18:28.5502 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c479a432-692d-4bbb-7b96-08ddbf799621
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9577
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


On 2025/7/10 12:18, Lazar, Lijo wrote:
>
> On 7/10/2025 1:20 AM, Mario Limonciello wrote:
>> On 7/9/2025 6:05 AM, Samuel Zhang wrote:
>>> For normal hibernation, GPU do not need to be resumed in thaw since it is
>>> not involved in writing the hibernation image. Skip resume in this case
>>> can reduce the hibernation time.
>>>
>>> On VM with 8 * 192GB VRAM dGPUs, 98% VRAM usage and 1.7TB system memory,
>>> this can save 50 minutes.
>>>
>>> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
>> I hand modified the patches for other changes missing from linux-next in
>> your base.
>>
>> I checked on an APU with an eDP display connected and from a VT
>> hibernate does keep the display off now so this is definitely an
>> improvement there too.
>>
>> Tested-by: Mario Limonciello <mario.limonciello@amd.com>


Thank you, Mario!


>>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 17 +++++++++++++++++
>>>    1 file changed, 17 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/
>>> drm/amd/amdgpu/amdgpu_drv.c
>>> index 4f8632737574..b24c420983ef 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> @@ -2541,6 +2541,10 @@ amdgpu_pci_shutdown(struct pci_dev *pdev)
>>>        if (amdgpu_ras_intr_triggered())
>>>            return;
>>>    +    /* device maybe not resumed here, return immediately in this
>>> case */
>>> +    if (adev->in_s4 && adev->in_suspend)
>>> +        return;
>>> +
>>>        /* if we are running in a VM, make sure the device
>>>         * torn down properly on reboot/shutdown.
>>>         * unfortunately we can't detect certain
>>> @@ -2557,6 +2561,10 @@ static int amdgpu_pmops_prepare(struct device
>>> *dev)
>>>        struct drm_device *drm_dev = dev_get_drvdata(dev);
>>>        struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>    +    /* device maybe not resumed here, return immediately in this
>>> case */
>>> +    if (adev->in_s4 && adev->in_suspend)
>>> +        return 0;
>>> +
>> Is this one right?  Don't we still want to call prepare() for all the HW
>> IP blocks?  The eviction call that happens in prepare() is a no-op but
>> there are other IP blocks with an prepare_suspend() callback like DCN.
>>
>> That is I think you're destroying the optimization from commit
>> 50e0bae34fa6b ("drm/amd/display: Add and use new dm_prepare_suspend()
>> callback") by adding this code here.
>>
> I guess this takes care of the prepare() before a power_off(). For the
> hibernate prepare() call, in_suspend flag will remain false and it
> should get executed. If the device is runtime-suspended already, then
> the path won't be taken. Assuming that's fine.
>
> Thanks,
> Lijo


That's right. Thank you for the clarification, Lijo.

Rafael reminded me yesterday that there are 2 hibernation mode, controlled by `/sys/power/disk`.
The 2 mode will call different callbacks after saving the image:

shutdown mode, hibernate will go through following steps:
1. amdgpu_pmops_prepare
2. amdgpu_pmops_freeze
3. create image
4. amdgpu_pmops_thaw
5. amdgpu_pmops_complete
6. save image

7. amdgpu_pci_shutdown


platform mode, hibernate will go through following steps:
1. amdgpu_pmops_prepare
2. amdgpu_pmops_freeze
3. create image
4. amdgpu_pmops_thaw
5. amdgpu_pmops_complete
6. save image

7. amdgpu_pmops_prepare
8. amdgpu_pmops_poweroff

This code is just to skip the step 7 of platform mode hibernation, 
prepare to power off.

adev->in_suspend is false in step 2, so it will not return in new the check.
adev->in_suspend is true in step 7, it will return in new the check.

Regards
Sam


>
>>>        /* Return a positive number here so
>>>         * DPM_FLAG_SMART_SUSPEND works properly
>>>         */
>>> @@ -2655,12 +2663,21 @@ static int amdgpu_pmops_thaw(struct device *dev)
>>>    {
>>>        struct drm_device *drm_dev = dev_get_drvdata(dev);
>>>    +    /* do not resume device if it's normal hibernation */
>>> +    if (!pm_hibernate_is_recovering())
>>> +        return 0;
>>> +
>>>        return amdgpu_device_resume(drm_dev, true);
>>>    }
>>>      static int amdgpu_pmops_poweroff(struct device *dev)
>>>    {
>>>        struct drm_device *drm_dev = dev_get_drvdata(dev);
>>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>> +
>>> +    /* device maybe not resumed here, return immediately in this case */
>>> +    if (adev->in_s4 && adev->in_suspend)
>>> +        return 0;
>>>          return amdgpu_device_suspend(drm_dev, true);
>>>    }
