Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53A7AF0C91
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 09:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B583510E2FA;
	Wed,  2 Jul 2025 07:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vntlFDdd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2081.outbound.protection.outlook.com [40.107.102.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A6710E27F;
 Wed,  2 Jul 2025 07:29:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZ9vi3cr7Ryjk7gso9T1tgAGUPIw8gsw5cEyhqRy6ff42Rp7Nc5HXBE2vboocvNnsyBlyKdyVcOrXhhbmvFGoMpVJflUNAABaW7JYPq5lt6wdVJwtLj8iG8jC0sKVDfZpVmJ+Q0SuJoF0Zi29hzJJuBAOs+y1FSEcA5SopNtbAp8D1qzG+FdfUqEdwSiLJJZiBdbMlg8npn5x8IFKHIzTSSsRsX7ObpNMz/kbZASeuZv4vb/H5kwlN69S13fXp33GP4rHtUAyo7SIXarViDebQ8X77bBtJUp47Vlzq1y8xEt7fwtDk73rqK4wIjMyyUiku4TLG85CXRDx5g7m3XBsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87vRPEoSoVMRg2cW+tsTcXFq+Wsb9sTy1u4FjqeZfZg=;
 b=qmT4/FpAmu+/Mj0ucfkWg5NgT6UarRCyjMfyWJRxCYYcnhZEqYuufo+N9vXF9WAQe/wq7pm4e2x4SdF89tD9tL+LNHbbKBQsafcOlgg9SU3RuNu0oVjs/aBVZiHmU6gTx32aMfSgleP8feAq3GqnegV8U1Nc+zz3Qx/bpvlzDVoXCmw/wFASh/SzGeX8gNc6QfWJEte1R7uImDGu6d3ayuWo8ljeu5TKlJgPuh1fTPwvaYzaIBk4EsQ6/Gh0HOiB55MgIDlS7pwLJSrRMdS2t3CBb2GsxFTyFYBJmhmYdIlTGLgotSVL7islywmSdEMCd26EzfHWgc1Fi4f/oMXgsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87vRPEoSoVMRg2cW+tsTcXFq+Wsb9sTy1u4FjqeZfZg=;
 b=vntlFDddvLwooIOUMhz7KXSskRL/ihD+ijejqjJnG0Z0Vmw7uirnb56rVw2fRxAt7+NoUCwF0zuVVdcX5CxlZ6Glpt/k/shX58ufQ7kS48XCWD/JQZ5Vsd04s5AOxxRBnmL1HE8f90yMJ9G2wsacUOt737SJCOAhnbe3FICTxHU=
Received: from PH7P220CA0105.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::20)
 by CH1PPF12253E83C.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::606) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Wed, 2 Jul
 2025 07:28:56 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:510:32d:cafe::4c) by PH7P220CA0105.outlook.office365.com
 (2603:10b6:510:32d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Wed,
 2 Jul 2025 07:28:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.1 via Frontend Transport; Wed, 2 Jul 2025 07:28:55 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 02:28:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 02:28:54 -0500
Received: from [10.65.159.153] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 2 Jul 2025 02:28:51 -0500
Message-ID: <558ad3d6-7349-40f1-ba06-0fa46701b247@amd.com>
Date: Wed, 2 Jul 2025 15:28:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/amdgpu: move GTT to SHM after eviction for
 hibernation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Zhang,
 GuoQing (Sam)" <GuoQing.Zhang@amd.com>, "rafael@kernel.org"
 <rafael@kernel.org>, "len.brown@intel.com" <len.brown@intel.com>,
 "pavel@kernel.org" <pavel@kernel.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Limonciello, Mario"
 <Mario.Limonciello@amd.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>
CC: "Zhao, Victor" <Victor.Zhao@amd.com>, "Chang, HaiJun"
 <HaiJun.Chang@amd.com>, "Ma, Qing (Mark)" <Qing.Ma@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250630104116.3050306-1-guoqing.zhang@amd.com>
 <20250630104116.3050306-2-guoqing.zhang@amd.com>
 <ce04e266-6c3f-4256-aade-bafca8609ab3@amd.com>
 <DM4PR12MB5937FFB3E121E489A261785DE541A@DM4PR12MB5937.namprd12.prod.outlook.com>
 <ba843972-f564-4817-8651-b3b776c5f375@amd.com>
Content-Language: en-US
From: Samuel Zhang <guoqzhan@amd.com>
In-Reply-To: <ba843972-f564-4817-8651-b3b776c5f375@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: guoqzhan@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|CH1PPF12253E83C:EE_
X-MS-Office365-Filtering-Correlation-Id: 041192a2-30cd-43f6-dd17-08ddb93a1a6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGM5VVJuN0RLZHZ3K0hmUEZZazRoMThEZktmZmx5RVRaSk4rVC9PQyt5MzJZ?=
 =?utf-8?B?WnZyQ0d3ckpaQ3dIVllnSVBaMVhna3ExRGltMW5VemRUUERreWpoR3dmR1BK?=
 =?utf-8?B?TWpWRmZCbEIxYVhGQU4yWFFlQzJIcFNjSlJKT3p3KzNaUUZ0Zkl5NTB2V1Zi?=
 =?utf-8?B?S0czTUkxZ0N1Y2FlTHcrbU5SOE10VFoxV1MvNUZWR1pOd1pObXRKTXBqcDlO?=
 =?utf-8?B?SlBPNjhwUi9JelQrYzJjTWl6alZNazVHWEVDTk0xWmd1ZXFnb1VIS0NEdXk1?=
 =?utf-8?B?dkMzV1hoSEVIMXZMY0pUY0JkVkU2WW9KUWR5am1kRHlhVDM5dERGMDBoSzZ5?=
 =?utf-8?B?RzE4RXNwVWVrczdvRU5MQjVMSXFnQnlPVE02eHJLdzlIQkFXRCtrSnd4VlFs?=
 =?utf-8?B?TlorcUx1dkpZTWhuckw2RUp4QUxvV056bFl2a2NSQUhwQkxZTjRQcmFOazhk?=
 =?utf-8?B?aUk0aUpCcVhJdWdxendXa3c3T1RXQzJ6SXNhd1VJdWpRbFFHVmg3SHJYWVdC?=
 =?utf-8?B?R29MaHlSeFc3dTQ2aXF5K05VaHFuaUF1OVFXRUFBWmV6QWxvOEpETkVqUlJE?=
 =?utf-8?B?NGozMW1DV0MrQXpoTWVnd1FOYndBZlBQM3FFRy96b05ndGpuTE85bGUyNzFt?=
 =?utf-8?B?WUZsQzVGVmVyQkkrdUNacmpEaERWYU43NVRHQUVlV01QcU9zOE5wM3N4TjdV?=
 =?utf-8?B?a0xYRzNibHYyK0wwQU9qK0xKcW9na1V2Nkl6eWlZamdXa2RCbEJySUpYeDF6?=
 =?utf-8?B?U25Yc2VKT0VWYzFCVEZ5Ri9KTVE2ajNadWg2SHlOSC9SWUhnd0VlbDZkU2ht?=
 =?utf-8?B?cm8zK3A0dGpkaGFoSWEzMGM4Q1FlVmpRaEZnSVk5cVBuZXlDdVIvSXlIL3Rw?=
 =?utf-8?B?NkRGbld6NnJjYWVERVZ4R0h0TWNTWHUyQi9MVWtuYWpPeFN2U3JzTkJuS3h2?=
 =?utf-8?B?RXR0NnhTclYvai9LWmZEa2NNWDNJdWYvSDFBN0czUGs4K3BxSUtkR1VzTUtJ?=
 =?utf-8?B?QWZtWlRQay9wZUx2bkFYK0F6NWFmUGFIVVFrT2lYcjBxWUNiaTRjMjN0dTNw?=
 =?utf-8?B?MzhjY2lhRlNSeVhjMFpBK1VDclVvOXM0THFmUG1uVHNzS3UvZCs5V0NQZUlw?=
 =?utf-8?B?SmxTS2gyWkUzd1R2QSszVkFhcVpwWEM4TFh0SlBTTW9pUzJPSVYxeWt6NnRP?=
 =?utf-8?B?UTl2UXlwV0FRVXF2RHFjamc5aGhtcHRiMWgvOCtwUHJxQTFkV3VLUmZKOU5W?=
 =?utf-8?B?czBVN2h4anZxeFFNVGZuZ3pnUkhpdHdwRnBSc1NpenFDYm82WEpzdDlaQWVG?=
 =?utf-8?B?b2dBdEUzTDhJVEVhcTdtOVBwODZLMEZ6d01PSy9EdktWdE9INFZEVDJOck1Z?=
 =?utf-8?B?NlBLanJiMHZBcXFHcTRBUHdjMm5UOFQyYkF3M0N2NURzU3FYNXFzeGE3UXll?=
 =?utf-8?B?VG9mSjZVQ0RVcHJyd3U2MlV3cHhEKzh4WHA5dnk4YkI0S2hwNU1SSlNocVlE?=
 =?utf-8?B?N05zMGExRFAzdU1TQ2Y5M1hiOVpyTmNBaDhrc05SMHlBLzI3eWd6c3RReXM2?=
 =?utf-8?B?clNJZENVS2Z6NnErMXB2ZFlSY0Z4UnAwUm43azV0MFgzNXpybGo1NlJBcEs4?=
 =?utf-8?B?MENNVHhDdGVwV1gxTkwrd1NwODJhc2ZLSHhkWWw1OXFVTXZQS0VjTVJmNmdC?=
 =?utf-8?B?Vk53R0xQY2MyeFA5bE9JbXpJWk50MndFVmtMa0tZSXhWK2lnbmIyZ3NCeVVN?=
 =?utf-8?B?Q09ERDFKUm1UTWxhcDdYby9yUnJPUmxaR0xJd0V5UlVaV1kxNzB0WTZ4aDJI?=
 =?utf-8?B?Skd2Q1phekd0cFhPalJ6SVVFREFBUkFoaFphN09nSkpkUnhNUnVCOEY3MFhJ?=
 =?utf-8?B?SEhuVkNtV3ZqRnY0bXVVZWJsTXpweWNXQThMMWl4b0lyQ0tSejVqYS9wMTdM?=
 =?utf-8?B?Qzg3RlZTamo1VlVGQjR1ZWZmTWlodG1DOXljd3ZsbTc4eTZSMnJZbmNCSmFP?=
 =?utf-8?B?c2k3NmQwTnIxQmVVMXJsdk95NjRRT3ZFVlpPbjFpK2ZsWHdFN21hQ1dVeUUv?=
 =?utf-8?B?M2xOUzNZaFg2RzR3VXZUem5KM0hIUkcxdGlFZz09?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 07:28:55.7726 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 041192a2-30cd-43f6-dd17-08ddb93a1a6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF12253E83C
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


On 2025/7/1 16:22, Christian König wrote:
> On 01.07.25 10:18, Zhang, GuoQing (Sam) wrote:
>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>>
>> Hi Christian,
>>
>>   
>>
>> Thank you for the feedback.
>>
>>   
>>
>> For “return ret < 0 ? ret : 0;”, it is equivalent to “return ret;” since ret is always <= 0 after the loop.
> No it isn't.
>
> ttm_global_swapout() returns the number of pages swapped out and only a negative error code if something went wrong.


/**
  * move GTT BOs to shmem for hibernation.
  *
  * returns 0 on success, negative on failure.
  */
int ttm_device_prepare_hibernation(void)
{
     struct ttm_operation_ctx ctx = {
         .interruptible = false,
         .no_wait_gpu = false,
         .force_alloc = true
     };
     int ret;

     do {
         ret = ttm_global_swapout(&ctx, GFP_KERNEL);
     } while (ret > 0);
     return ret;
}

This is the new code version.
If ttm_global_swapout() return positive number, the while loop will 
continue to the next iteration.
The while loop stops only when ttm_global_swapout() returns 0 or 
negative number. In both case, the new function can just return the ret.

The ret values printed in the do while loop:
[   53.745892] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 512
[   53.950975] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 35840
[   53.951713] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 9
[   67.712196] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 2187264
[   67.713726] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 512
[   67.759212] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 32768
[   67.761946] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 1024
[   67.762685] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 85
[   67.763518] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 175
[   67.767318] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 2367
[   67.767942] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 1
[   67.768499] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 1
[   67.769054] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 1
...
[   67.783554] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 1
[   67.785755] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 1
[   67.788607] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 1
[   67.789906] [TTM DEVICE] ttm_device_prepare_hibernation:164 ret 0


Regards
Sam



>
> And it's probably not a good idea to return that from the new function.
>
> Regards,
> Christian.
>
>>   
>>
>> For all other comments, I will revise the patch accordingly in v2.
>>
>>   
>>
>> Regards
>>
>> Sam
>>
>>   
>>
>>   
>>
>> *From: *Koenig, Christian <Christian.Koenig@amd.com>
>> *Date: *Monday, June 30, 2025 at 19:54
>> *To: *Zhang, GuoQing (Sam) <GuoQing.Zhang@amd.com>, rafael@kernel.org <rafael@kernel.org>, len.brown@intel.com <len.brown@intel.com>, pavel@kernel.org <pavel@kernel.org>, Deucher, Alexander <Alexander.Deucher@amd.com>, Limonciello, Mario <Mario.Limonciello@amd.com>, Lazar, Lijo <Lijo.Lazar@amd.com>
>> *Cc: *Zhao, Victor <Victor.Zhao@amd.com>, Chang, HaiJun <HaiJun.Chang@amd.com>, Ma, Qing (Mark) <Qing.Ma@amd.com>, amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>, linux-pm@vger.kernel.org <linux-pm@vger.kernel.org>, linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
>> *Subject: *Re: [PATCH 1/3] drm/amdgpu: move GTT to SHM after eviction for hibernation
>>
>> On 30.06.25 12:41, Samuel Zhang wrote:
>>> When hibernate with data center dGPUs, huge number of VRAM BOs evicted
>>> to GTT and takes too much system memory. This will cause hibernation
>>> fail due to insufficient memory for creating the hibernation image.
>>>
>>> Move GTT BOs to shmem in KMD, then shmem to swap disk in kernel
>>> hibernation code to make room for hibernation image.
>> This should probably be two patches, one for TTM and then an amdgpu patch to forward the event.
>>
>>> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 13 ++++++++++++-
>>>    drivers/gpu/drm/ttm/ttm_resource.c      | 18 ++++++++++++++++++
>>>    include/drm/ttm/ttm_resource.h          |  1 +
>>>    3 files changed, 31 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> index 4d57269c9ca8..5aede907a591 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> @@ -2889,6 +2889,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>>>    int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
>>>    {
>>>          struct ttm_resource_manager *man;
>>> +     int r;
>>>    
>>>          switch (mem_type) {
>>>          case TTM_PL_VRAM:
>>> @@ -2903,7 +2904,17 @@ int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
>>>                  return -EINVAL;
>>>          }
>>>    
>>> -     return ttm_resource_manager_evict_all(&adev->mman.bdev, man);
>>> +     r = ttm_resource_manager_evict_all(&adev->mman.bdev, man);
>>> +     if (r) {
>>> +             DRM_ERROR("Failed to evict memory type %d\n", mem_type);
>>> +             return r;
>>> +     }
>>> +     if (adev->in_s4 && mem_type == TTM_PL_VRAM) {
>>> +             r = ttm_resource_manager_swapout();
>>> +             if (r)
>>> +                     DRM_ERROR("Failed to swap out, %d\n", r);
>>> +     }
>>> +     return r;
>>>    }
>>>    
>>>    #if defined(CONFIG_DEBUG_FS)
>>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
>>> index fd41b56e2c66..07b1f5a5afc2 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>> @@ -534,6 +534,24 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>>>    }
>>>    EXPORT_SYMBOL(ttm_resource_manager_init);
>>>    
>>> +int ttm_resource_manager_swapout(void)
>> This needs documentation, better placement and a better name.
>>
>> First of all put it into ttm_device.c instead of the resource manager.
>>
>> Then call it something like ttm_device_prepare_hibernation or similar.
>>
>>
>>> +{
>>> +     struct ttm_operation_ctx ctx = {
>>> +             .interruptible = false,
>>> +             .no_wait_gpu = false,
>>> +             .force_alloc = true
>>> +     };
>>> +     int ret;
>>> +
>>> +     while (true) {
>> Make that:
>>
>> do {
>>          ret = ...
>> } while (ret > 0);
>>
>>> +             ret = ttm_global_swapout(&ctx, GFP_KERNEL);
>>> +             if (ret <= 0)
>>> +                     break;
>>> +     }
>>> +     return ret;
>> It's rather pointless to return the number of swapped out pages.
>>
>> Make that "return ret < 0 ? ret : 0;
>>
>> Regards,
>> Christian.
>>
>>> +}
>>> +EXPORT_SYMBOL(ttm_resource_manager_swapout);
>>> +
>>>    /*
>>>     * ttm_resource_manager_evict_all
>>>     *
>>> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
>>> index b873be9597e2..46181758068e 100644
>>> --- a/include/drm/ttm/ttm_resource.h
>>> +++ b/include/drm/ttm/ttm_resource.h
>>> @@ -463,6 +463,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>>>    
>>>    int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>>>                                     struct ttm_resource_manager *man);
>>> +int ttm_resource_manager_swapout(void);
>>>    
>>>    uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man);
>>>    void ttm_resource_manager_debug(struct ttm_resource_manager *man,
