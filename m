Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2D7AFD026
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 18:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B8910E6C9;
	Tue,  8 Jul 2025 16:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WTh8tBVO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4024410E6C4;
 Tue,  8 Jul 2025 16:08:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IdUAm/y4sHrZou+OYWK84aWP+8myFa+OZD/DvoZyZRLPd9dzIw+dDmThf9ZDTfaBEUMTEyntYWZAtekzEXSyCnBVlgn/u+UlVPg6tZlLR4BuGh78AT2I+NaHmZFy8kankoDItcNJx4uWzB1bubbPJ9GF7i1gX814LjKIh8FV+zgrPryXm94l4JPm/SbocOc9pAh0O4E/1LyxksXMUWvEM/KONGjF7FsWNdroN984x73YaZeC0Mk1P61oIbQ/g/Bl4Jcu1jdkKJFSKDwvaCgTm4eg8R1WcsXRCH0F9J6ViT02XxMfMs2migQT3DxMEdEinrgfr4VAyDOeCYTlw1pVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JQnPT7PjIWh/olSvcCZZRNKEy5U+ZmirS96NcB2rUw=;
 b=pbFUEn0+R6qvU1f8+zFTg1TcpqFXG0NCq3iqkrrA+/QzRMfNUfdnuhsZwZZmttTEdahjJ4wcMZ6q+I9JD+GqOR95zf6ObEJ1D7p3Az/NhASK/pDzmkGXnYczSXsgtcFaW4/DamQgbAUnGgpCtWlXpD0D9ObzJMQ8gk24gIaNttN0hjP78sVQTlLvhsoWNabL6ObA0igcoK0eLHyD9ByVRBXN6Jni0UBq/NHhbMwwJG8Vaz6F0iRdvha+TiwX292xIOI+riSCCWvbra478Ly6fEUj+xiiqjdPOCoLiuC6NyDabfMM6kLvnEnbTub0ghwmy62Ni6zs8mRmEqWVa8tWuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JQnPT7PjIWh/olSvcCZZRNKEy5U+ZmirS96NcB2rUw=;
 b=WTh8tBVOjq+QFOV03pdcls5knBFLlWOynfl4Oj3okOpzXSj2Ve/r3QtrRyX1JnXJm+xZcMrOJRn+MCewzi9nS7NXOuXiq2FEjFXwjKqClXMm+XpfFgEVbdCdakS8rxMoIZGwXd1TBmh9pGaaZBHmj0eYO9wqWLjrv+EWl1hvkfI=
Received: from MW4PR03CA0289.namprd03.prod.outlook.com (2603:10b6:303:b5::24)
 by LV5PR12MB9777.namprd12.prod.outlook.com (2603:10b6:408:2b7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 16:08:28 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:303:b5:cafe::cd) by MW4PR03CA0289.outlook.office365.com
 (2603:10b6:303:b5::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Tue,
 8 Jul 2025 16:08:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 16:08:27 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 11:08:16 -0500
Received: from [172.31.125.8] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 11:08:10 -0500
Message-ID: <1214642e-73d6-4916-8578-8cb40b846d42@amd.com>
Date: Wed, 9 Jul 2025 00:08:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] drm/amdgpu: do not resume device in thaw for
 normal hibernation
To: Mario Limonciello <mario.limonciello@amd.com>, Samuel Zhang
 <guoqing.zhang@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <rafael@kernel.org>, <len.brown@intel.com>,
 <pavel@kernel.org>, <gregkh@linuxfoundation.org>, <dakr@kernel.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <ray.huang@amd.com>,
 <matthew.auld@intel.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>
CC: <lijo.lazar@amd.com>, <victor.zhao@amd.com>, <haijun.chang@amd.com>,
 <Qing.Ma@amd.com>, <Owen.Zhang2@amd.com>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20250708074248.1674924-1-guoqing.zhang@amd.com>
 <20250708074248.1674924-6-guoqing.zhang@amd.com>
 <a23ee023-3e70-4d49-8f11-7d5798ca7576@amd.com>
Content-Language: en-US
From: "Zhang, GuoQing (Sam)" <guoqzhan@amd.com>
In-Reply-To: <a23ee023-3e70-4d49-8f11-7d5798ca7576@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: guoqzhan@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|LV5PR12MB9777:EE_
X-MS-Office365-Filtering-Correlation-Id: 193247c6-f74c-4e0d-06fe-08ddbe39acbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UG5lR3l2UWJXampOdkw3RWcxdWhxQk9GQm04NUgwQjhCanRBTlFReTVyZEJB?=
 =?utf-8?B?eTR5aE1Ea3M4U1M2Y29ad1h3SlZlYTF6NVpOQlFhMHUxR2dScFg2Wm5rZTM5?=
 =?utf-8?B?ckY0YUwzWkcrZEp4bTUybUluUGtjZmhlWkJTL0x6ekdOOUxTRHl3SDdiM3Vr?=
 =?utf-8?B?ZTM2N094OXNSMTF4SmFQaEo0ZHUxWWxTU0VaNWFlcnhaclQxZXFvNnBTK3dX?=
 =?utf-8?B?Q2I0U041UWFhbzY4dll1bFJlUkNIbXpGQmp5UE1vQTZrdkcraHNhaDJwejNs?=
 =?utf-8?B?OTVYMzc4ait0NVN0aXZ2SW1zYm5Nck03b25xQkZrUk96Wlo0Szl3NnpyaGRW?=
 =?utf-8?B?UGhCcjllZm8vcWFMbGpvNjNNSDBaRlJRY0phVVFraC9wbU84SEwxVHA3NFkv?=
 =?utf-8?B?a01MVHRDdnFteEtRNDIyK003aFIxc3lSRWJpT3VRVk10b0N4UjMrb3M0Zi95?=
 =?utf-8?B?Y1NrTERkYU0yN0ZuNldtaE1aNTl0bFkycDVVaXlud3B6YXBQVkd1QmNSazdy?=
 =?utf-8?B?TlpZeTFRL2daZnVlc0hxRkp5cWNmSnlNOE0vL2d3SW1LWmJEdERuTkU1RXA5?=
 =?utf-8?B?TUFSQXl4NVV1dlRSdDFSVUhDdWxUbzJ2OHExWGZucnVvM0xhS2ljYkMwNUxB?=
 =?utf-8?B?YlJMTzE2NWFiVm04bjd5MlpWNUEyQU1oYU9FYXpETTFvUTRPYUgva0NsVXlM?=
 =?utf-8?B?T2tNakM1Z09yVjJ0Rkp2VTVuWlowb3lPSk8rYzBUMGJ6N3I5ZEU4enhPdDVK?=
 =?utf-8?B?WXBXUThNSXhKTFI5cUJSc0F0TzhQcmpSQ3RrbGlwRkRPOW9SS3NqSmgxbGdh?=
 =?utf-8?B?cjYxbzc2OGY0MVpsc1Y1aEk1azZWaGYvY04wMm9qWGo3b0J1ajQzaTAvbjZ6?=
 =?utf-8?B?ekkzY3VEMHh1M1JaRFNtN29qUTJPUnd6N1lTRzVkUmtySE0wak9sOWxSNVlK?=
 =?utf-8?B?WXhDNi9GWUhvZ0hSczhIclMwMEQ3ZkZmRWhlaFNOTnNVZVpUTUNDcUMyaWow?=
 =?utf-8?B?QkI3aWFFUUZSYW9qU2hnWlMzcmxtRm9tOXNHeHZNMFBnRklXWU1ZSHpmbDRS?=
 =?utf-8?B?bXZ4RlllY0FjUHR1NkhrSWVRWWRsTVlkRnJHME1HblJUSlJHdDAzdkxhci84?=
 =?utf-8?B?MThheGR1eFVPbE9pM2ZuU0ZHK3p5cjFvcUFTNWlDWTVOZ1pMSVcxWEU2d2Q0?=
 =?utf-8?B?V3NwQ2pUaU5OV3FtVG80ZktLaUMwS1pRQmJwM1ZpbEZBNWNjMWVpeENuVlN2?=
 =?utf-8?B?a21hRmJQMXI5MXk1UGZYakxXaHdTWTdxdzNqK3oxcGlFbDRoem80UW5VdXFZ?=
 =?utf-8?B?SUJLd29xZm55dlhYeW90WXVDWEp1S01OcTJBWUR5UlJ6c09LdlN2UzVOZUha?=
 =?utf-8?B?L2lITE1vK2xDMWpkRUlGaGc3TmgzeUd2Z09IclBQVzQ1dllWRnNwN1E1VUps?=
 =?utf-8?B?NnBxOTVYR1NrMFp2VzNObWM0dEx5NVluTmdPTEg5RysrV3kwTUdGVTc1ekNK?=
 =?utf-8?B?MFlWTDF4eS8zRjlPZTlVUjQ3bkxYOU5OZTJseHdKVG5JeVN6NDRVVnEwOHg5?=
 =?utf-8?B?VURQZ1lkbGU1UDE5aTVWdnM0UkF6ZVh4dVBCaXF4cnBjcTZWWjYwaFgwbHdl?=
 =?utf-8?B?MTcwakliNk83QXNGa1hVWjdoTDVqcFFoVVlIQmFEMUtGenJOSVVRcGFIMk1x?=
 =?utf-8?B?Y2k2bVh6RFM0ZmFOUW41cVVzdXhwWnUzaVJ0YmUwTTJ6Y3pCM2NIYXJ2dHNp?=
 =?utf-8?B?dTI1dlc0SEtaN3NlZ0l0MlZBb3lITFozcGV3bGdjZi9Ic2FiSFlna3J2TkhB?=
 =?utf-8?B?TkNyaUZLVEZuQUtmOXBxNXhXZ2huZXhXekNhWk1JL1ZwMlRQVWlDRTdzcUFW?=
 =?utf-8?B?MTUwMnFkUXVuMXBBZDByb3pQWXo4Y3pnb0krNGRLOUcrdURMV0IxZzhYMndL?=
 =?utf-8?B?Z1BEcFRhdzRvb3h1eEY0M3ZJR0dKZDdTK3BQSUNPaW11eEJ3b3E2OFRnb0Zo?=
 =?utf-8?B?ckp2OTJWSzBiMGZnWTJNTEpEcEdmcEdFTTlXR0dUL3p3Y3FVY2pVSU9DMS9S?=
 =?utf-8?B?cktVd0dEQXVLK0NiczFtb3dXaTk2WDVZZjlJUT09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 16:08:27.5765 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 193247c6-f74c-4e0d-06fe-08ddbe39acbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9777
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


On 2025/7/8 22:40, Mario Limonciello wrote:
> On 7/8/2025 3:42 AM, Samuel Zhang wrote:
>> For normal hibernation, GPU do not need to be resumed in thaw since 
>> it is
>> not involved in writing the hibernation image. Skip resume in this case
>> can reduce the hibernation time.
>>
>> On VM with 8 * 192GB VRAM dGPUs, 98% VRAM usage and 1.7TB system memory,
>> this can save 50 minutes.
>
> If I'm not mistaken this will also have the side effect that display 
> is not resumed in the "normal case" too, right?


Yes, I believe so.


>
> I know the GPU you used doesn't have a display, but I'm just thinking 
> about the callpaths and implications.
>
> Would you be able to test this series specifically on an APU with a 
> display connected to eDP and no compositor running (so no DRM master) 
> to make sure it works as intended?


Sorry, Mario. I don't have such APU environment to test this behavior.

Regards
Sam


>
>>
>> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index 4f8632737574..10827becf855 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -2541,6 +2541,10 @@ amdgpu_pci_shutdown(struct pci_dev *pdev)
>>       if (amdgpu_ras_intr_triggered())
>>           return;
>>   +    /* device maybe not resumed here, return immediately in this 
>> case */
>> +    if (adev->in_s4 && adev->in_suspend)
>> +        return;
>> +
>>       /* if we are running in a VM, make sure the device
>>        * torn down properly on reboot/shutdown.
>>        * unfortunately we can't detect certain
>> @@ -2654,8 +2658,17 @@ static int amdgpu_pmops_freeze(struct device 
>> *dev)
>>   static int amdgpu_pmops_thaw(struct device *dev)
>>   {
>>       struct drm_device *drm_dev = dev_get_drvdata(dev);
>> +    int event = pm_transition_event();
>>   -    return amdgpu_device_resume(drm_dev, true);
>> +    switch (event) {
>> +    case PM_EVENT_THAW: /* normal case */
>> +        return 0;
>> +    case PM_EVENT_RECOVER: /* error case */
>> +        return amdgpu_device_resume(drm_dev, true);
>> +    default:
>> +        pr_err("unknown pm_transition_event %d\n", event);
>> +        return -EOPNOTSUPP;
>> +    }
>>   }
>>     static int amdgpu_pmops_poweroff(struct device *dev)
>
