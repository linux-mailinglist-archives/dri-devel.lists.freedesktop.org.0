Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA27AF0C82
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 09:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E784310E156;
	Wed,  2 Jul 2025 07:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MhUY6rPV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D15210E156;
 Wed,  2 Jul 2025 07:24:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgZ1aLrBqV1G+w8yb/mzJi+WpOEYPNgZhCIemKYHXUO3acpjY8tVu8WjMeP2+uoyLMgXgCTtSnHg3dYs5pRsFarIw4g7q9GRUAuaMuiuMglIwcdByR1Poo9F/UU+6f2BdFJN/Los/hGSfqJ89+Ri/Y817ycCs+gDwCc8PMYh4NSHxjV9fvAWj53nXrTdM/Vd7yxl8fb7+D2Qbm4N+fzYilW4eiq0ZNq5ti2FnlERpbJR1bdQpP62/0EUHLtE94FDzfyoDhDGLoM8dqbxfvTrAnYp+W428dPJtOV18AJfgx8dONNyUQXbf/48oxh9+NTyFyDokJK1MU3lwxOKY2IP1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPyiFR+vmgv5XAoaHYT7dZYmNri83Jeq6Z2t9V4KGg8=;
 b=PVqEBhOB4minYN5bFHVbDTUlbPtPpw9SE8vuRBve/p7l5QhSKKkaqlAMnNwP3dPCRVCpGQLVMBgojtqWchxghgM5HuMjm7GBmzGY6nYdkEor72d7uGlNriHldkG/4VL0xS7sHEj5m++UrnUlADHTAIW9OIWGhN4GYRT4xTstGMshRgL6Wxzinqb3fWiSKCbFtF25OHfh2cKoaJWH527oxZx983Ed02pAGBX2ABl0zZzxDAo7ouwMuN5xLW7qjo6cLAfGilpwqdNepCrTVJuo6LshWOzTCqDkfOxx/bU0Ix6Fr5KD0qkjPlnYJkk4avlXUTj/W2mn3CqiittEJFuVDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPyiFR+vmgv5XAoaHYT7dZYmNri83Jeq6Z2t9V4KGg8=;
 b=MhUY6rPVqXQs2cCJ1WpfeA1+nPCPx67zupNFywCnA1cvcB1xDhBzRTcWOt5UQRMv0csQ+tt48X1cyB1RjkHobht7reu4+DKEbST4EQ1yGR2faSVltgLfRI3CWV9J0sEVsyqRPzAhUlmDyr7PAZVNc0MI8pTaLgXloCWzi8LbOJM=
Received: from SA9P223CA0026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::31)
 by BL1PR12MB5826.namprd12.prod.outlook.com (2603:10b6:208:395::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.33; Wed, 2 Jul
 2025 07:23:58 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:26:cafe::76) by SA9P223CA0026.outlook.office365.com
 (2603:10b6:806:26::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Wed,
 2 Jul 2025 07:23:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 07:23:58 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 02:23:56 -0500
Received: from [10.65.159.153] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 2 Jul 2025 02:23:52 -0500
Message-ID: <1e82f0af-daf6-4dd6-bc43-2969ac970589@amd.com>
Date: Wed, 2 Jul 2025 15:23:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sam <guoqzhan@amd.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: skip kfd resume_process for
 dev_pm_ops.thaw()
To: Alex Deucher <alexdeucher@gmail.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
CC: "Zhang, GuoQing (Sam)" <GuoQing.Zhang@amd.com>, "rafael@kernel.org"
 <rafael@kernel.org>, "len.brown@intel.com" <len.brown@intel.com>,
 "pavel@kernel.org" <pavel@kernel.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Limonciello, Mario"
 <Mario.Limonciello@amd.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Zhao,
 Victor" <Victor.Zhao@amd.com>, "Chang, HaiJun" <HaiJun.Chang@amd.com>, "Ma,
 Qing (Mark)" <Qing.Ma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
References: <20250630104116.3050306-1-guoqing.zhang@amd.com>
 <20250630104116.3050306-4-guoqing.zhang@amd.com>
 <8806781b-90d1-4b99-a798-dd1d29d4c8c0@amd.com>
 <8eb1700d-4d60-4a1e-9d09-718f65baaf1e@amd.com>
 <019a15d5-142f-4761-9408-58c103d3922b@amd.com>
 <CADnq5_PHfNTbLL7Xmb9HFgtZemDVaLSqbrONWWEf9hjwk1rF1Q@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CADnq5_PHfNTbLL7Xmb9HFgtZemDVaLSqbrONWWEf9hjwk1rF1Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: guoqzhan@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|BL1PR12MB5826:EE_
X-MS-Office365-Filtering-Correlation-Id: 7efa25d7-451d-4f18-0306-08ddb9396919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTFYc0w4eWdKSTRieXI3MEltVmgxUzM3eU5EWFJkcmdLazFoSXdMZzV5NXQy?=
 =?utf-8?B?ZGZIUDVsaXJYalpXQnYwN0Y2L1V4UENFUVZRNVpEaThvQUtYZFl5d1B5M3ZI?=
 =?utf-8?B?YmFnT05aWEFQR0NSdHZQNHd5Vyt6V3o2SzBDb0VET3BLalp2L2ZVcXVjcTRq?=
 =?utf-8?B?WitKTnpaclhyZTBiY1hnaC9TcVVldTdjS3lHNmJ6b1VObHJRRE40VVNZb1Zq?=
 =?utf-8?B?UThIMHhqU1Vra1oxN2RaR3JWb25ySXppQjB0UHZHeXg3cGNqa2pCWk8vYUJQ?=
 =?utf-8?B?WHpIZzh5SU5zSU95Rzk4aWwzbnBjSVdUSm5lc3pmNmZNUzNsbjVQSEljbHFE?=
 =?utf-8?B?ZzVFY1gyM0FRU09GSGZDaG9uOUxjei8vMCtIdVl4Y2JMbUVIVnI5c3hEdnRq?=
 =?utf-8?B?REIrMXhUVG5wSzU2b2VVTXdMam5xY093eTZORmtkRU1XbFUvK1EyTnVLWVNF?=
 =?utf-8?B?Q1RIQXZPY2FDYS9WYlVORTN4UFRKUWY1ODFTRGxzdE9IRExrNWJ6czQrRzNu?=
 =?utf-8?B?by9qNklvTXBZY0dBVWdJdjlJWWVFbXJySGgza05lazMxTGFLT2lwUEFUdE5D?=
 =?utf-8?B?bVloMy9pd2ZTSHRHdG82c3IwVUtZYkVJLzBDRW83cWtaUHEzeVdodjZQSlVm?=
 =?utf-8?B?ZjVRTmU2Y2FrTHpSQnZ1M1BPU2QxWU11WHkvUnhrNzA0MHJUM0lyZnM5WFk2?=
 =?utf-8?B?M2xwOXlKeVlqZWduRFVQQXpuR0orMjNIVENtSkZxY1pxdVhycVczUExRVWpz?=
 =?utf-8?B?YXRIaUE0TzUrYkpKUTFFK01xQmpaVTR6THBEYTJ5N1JrdVFYSitYUndsSllX?=
 =?utf-8?B?Q2ErRWs5cGFFTGM4Y085UlJhc3FFdW0vbjRqc2FTaTlHT0xUT01sb1J6d05B?=
 =?utf-8?B?LytucXNZeFlzbE1naEJwZGRuQ1l2Ulk1Tlo2K3FQTXFqeUZnNERiZitQSUwx?=
 =?utf-8?B?QjRCZFVhY3BWaFpueHMxWEpPQm1LN1JCbXZYUmYzM3ltNllTaUZ4VzBpOFJ2?=
 =?utf-8?B?cDRWVTVqWlJMRDk1Lys4MGdyZDVkb1lseHZBdmZvNjRxU1U5WkwwU05xUGNn?=
 =?utf-8?B?VStLc3lPblNveUIwRlpnQjRjb3JPZ1JQZWZXZnB6MVNOOGoyRFRhYXNnbXRU?=
 =?utf-8?B?UHNtZlJYS1ErOEZST3hKcXF3NDBuSGhjVUhVd3MzYzBoT3Y2MnI2SDRGY0hC?=
 =?utf-8?B?SmYvMUdwWFBJL1NHcTdWUm1jSjl2ZG5pd3cwU3RvQ291eTJpU1BIdnhhWTBK?=
 =?utf-8?B?bTl5cVRvSm9tK3c4VjhKdHd0ZVE0ejIvbnpIb2JnNFZrQ0ZuUTNJZGprMCtC?=
 =?utf-8?B?L2o4NldOUGNOK1JFVkVzVFczL3JNd2pWMXhsMjJYUUJvQUZSM3paajdzMlpZ?=
 =?utf-8?B?SlpTYk4zaEx1VnJjVW5jSGZyc3B2NzF1cFQxRElYcU5VYzN4NHV5QTV4YzJp?=
 =?utf-8?B?WTBoL1hKQVdhYmtCQWx2TUVlSmtLaXRTTk9QczFScUtmM0plekJvMG8wNkQy?=
 =?utf-8?B?RHVKeFNuWENQcGprbks0MVRPWHdjU213L3pmMVJXRHh1MEEvS3MxQTk3Y3NE?=
 =?utf-8?B?QWhkOXlRVjRnMVhaSTBPWDdpSEpvaEg4ak5VUzJBcjJsYW1hcjRWTTl5cDFG?=
 =?utf-8?B?V29pTGNZZ2pXRlNWYlVpMmFFODJsVy9qb2M2NmRTRXZNT09DWi8zQjlvNUlh?=
 =?utf-8?B?RnpnTTI5V3puZUFrUVZPVjNhM3JVeE1VMFZmK25HWG45aEZBbXpjTXE0Q09x?=
 =?utf-8?B?RmZhcFEvWDFlQjdiNEpsMnBqcktGWEV0NCtYY2tLK2VVQ0piKytNek5GV2tz?=
 =?utf-8?B?ZVIyczgreUpDQmhjTmkzUExJT21FTkJJN1RsK2Z6MlJkemdYd1FXMzRhUzJh?=
 =?utf-8?B?VC9MSlNDMTkvOXB6Z0x0dHpFVmxRMVJBUUxqb2NYQTkvQ3o1cXRxUDNLRGti?=
 =?utf-8?B?MHdQbE9UWEp0czhjMW9wY0p6MXZjQXRCK3FoK2I4VXR1Q3M2OTVRVkhHR1Zh?=
 =?utf-8?Q?0mRVOnR+lvM1nUHt8pghVNXKoMPAp8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 07:23:58.3329 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efa25d7-451d-4f18-0306-08ddb9396919
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5826
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


On 2025/7/2 00:07, Alex Deucher wrote:
> On Tue, Jul 1, 2025 at 4:32 AM Christian König <christian.koenig@amd.com> wrote:
>> On 01.07.25 10:03, Zhang, GuoQing (Sam) wrote:
>>> thaw() is called before writing the hiberation image to swap disk. See
>>> the doc here.
>>> https://github.com/torvalds/linux/blob/v6.14/Documentation/driver-api/pm/devices.rst?plain=1#L552 <https://github.com/torvalds/linux/blob/v6.14/Documentation/driver-api/pm/devices.rst?plain=1#L552>
>>>
>>> And amdgpu implemented thaw() callback by calling amdgpu_device_resume().
>>> https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c#L2572 <https://github.com/torvalds/linux/blob/v6.14/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c#L2572>
>>>
>>> This patch is skip amdgpu_amdkfd_resume_process() call in thaw() during
>>> hibernation. it is not skipped in restore() during resume from
>>> hibernation when system boot again.
>>>
>>>
>>> I just found the following kernel doc. Thaw() is intended to resume the
>>> storage device for saving the hibernation image.
>> Ah, that makes much more sense.
>>
>>> Our GPU is not involved
>>> in it, it is not necessary to resume our GPU in thaw().
>>> https://github.com/torvalds/linux/blob/v6.14/Documentation/power/pci.rst?plain=1#L588 <https://github.com/torvalds/linux/blob/v6.14/Documentation/power/pci.rst?plain=1#L588>
>>>
>>> So another implementation is to remove the amdgpu_device_resume() call
>>> in amdgpu_pmops_thaw(), and skip amdgpu_device_ip_suspend() call in
>>> amdgpu_pci_shutdown()for hibernation.
>>> Initial tests show it's working fine for hibernation successful case.
>>> Should I switch to this implementation?
>> No idea. Alex and the KFD guys need to take a look at that.
>>
>>> But thaw() is also called to restore the GPU when hibernation is aborted
>>> due to some error in hibernation image creation stage. In this case,
>>> amdgpu_device_resume() is needed in thaw().
>>>
>>> So I need a method to check if hibernation is aborted or not to
>>> conditionally skip amdgpu_device_resume() in thaw(). Currently I don't
>>> know how to do this.
>> Yeah that approach here looks fishy to me, but I don't know how to properly fix it either.
>>
>> @Alex any idea?
> Yeah, I'm not sure how to handle that.  I don't see a way to avoid
> having all of the callbacks.  We could ideally skip some of the steps.
> Maybe we could optimize the freeze and thaw routines if we had some
> hint from the pm core about why we were getting called.  E.g., thaw
> after a failed hibernation restore.
>
> Alex


I just found pm_transition variable can be used to check if hibernation 
is cancelled (PM_EVENT_RECOVER) or not(PM_EVENT_THAW) in thaw(). I just 
need to export this variable in kernel.
https://github.com/torvalds/linux/blob/master/drivers/base/power/main.c#L64

Provided pm_transition is available, should we skip 
amdgpu_amdkfd_resume_process() only, or skip amdgpu_device_resume() 
completely?

Regards
Sam


>
>> Regards,
>> Christian.
>>
>>>
>>> Regards
>>> Sam
>>>
>>>
>>> On 2025/6/30 19:58, Christian König wrote:
>>>> On 30.06.25 12:41, Samuel Zhang wrote:
>>>>> The hibernation successful workflow:
>>>>> - prepare: evict VRAM and swapout GTT BOs
>>>>> - freeze
>>>>> - create the hibernation image in system memory
>>>>> - thaw: swapin and restore BOs
>>>> Why should a thaw happen here in between?
>>>>
>>>>> - complete
>>>>> - write hibernation image to disk
>>>>> - amdgpu_pci_shutdown
>>>>> - goto S5, turn off the system.
>>>>>
>>>>> During prepare stage of hibernation, VRAM and GTT BOs will be swapout to
>>>>> shmem. Then in thaw stage, all BOs will be swapin and restored.
>>>> That's not correct. This is done by the application starting again and not during thaw.
>>>>
>>>>> On server with 192GB VRAM * 8 dGPUs and 1.7TB system memory,
>>>>> the swapin and restore BOs takes too long (50 minutes) and it is not
>>>>> necessary since the follow-up stages does not use GPU.
>>>>>
>>>>> This patch is to skip BOs restore during thaw to reduce the hibernation
>>>>> time.
>>>> As far as I can see that doesn't make sense. The KFD processes need to be resumed here and that can't be skipped.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
>>>>> ---
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 2 ++
>>>>>    2 files changed, 3 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> index a8f4697deb1b..b550d07190a2 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> @@ -5328,7 +5328,7 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
>>>>>                amdgpu_virt_init_data_exchange(adev);
>>>>>                amdgpu_virt_release_full_gpu(adev, true);
>>>>>
>>>>> -            if (!adev->in_s0ix && !r && !adev->in_runpm)
>>>>> +            if (!adev->in_s0ix && !r && !adev->in_runpm && !adev->in_s4)
>>>>>                        r = amdgpu_amdkfd_resume_process(adev);
>>>>>        }
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>> index 571b70da4562..23b76e8ac2fd 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>> @@ -2734,7 +2734,9 @@ static int amdgpu_pmops_poweroff(struct device *dev)
>>>>>    static int amdgpu_pmops_restore(struct device *dev)
>>>>>    {
>>>>>        struct drm_device *drm_dev = dev_get_drvdata(dev);
>>>>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>>>
>>>>> +    adev->in_s4 = false;
>>>>>        return amdgpu_device_resume(drm_dev, true);
>>>>>    }
>>>>>
