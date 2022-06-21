Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9554553AC0
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 21:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EAF710EC47;
	Tue, 21 Jun 2022 19:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A84E10EC47;
 Tue, 21 Jun 2022 19:45:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TjN0pQPA4E9tuBLmGRCVmQvZGY8xEX+fqXN229GHFsaQYyiAL0qB9MUXDFxilypBBk6Vu5qRmZh52SX8zGzpaDMDCGsxP8qY5180HdEC9Tgi6iUghSKDZwmDezMLHM7ox7uGcDhCRfGjpx3LsDG0tQBfFnoABQiZS2LaEHK+Ku5wLMW2glJg9aCbjtzP5hEwUco0df1nA4dKxgFaZgIHYvgp/FwkxDi6NbrQAkeHjpUa9NoOEoydfyY6t1joMeFlf1ZkR1IW3VDL5StUEm4+gH5xaZc+sTq6SFofL7AO7EO0K4SOoV9n7lH5XadKHTkC7mWMzXp1EOlbFAydCAAfAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAsycbKldp64sP2yibV0Qj810iCZl3PKHYtxyNiTcCw=;
 b=OnLt2iXouZtLqX1JVoHn5UtcUEV1EFg+Ii7+yGamrz/c6uq/9CxySF1nOKrZLwHxOqY6NjVQUbraIMPe2yCYMMCTcIuvg94G8EPOD10Sk2IKX02AneEoqihVagaanVLByWbVdN6jB+ZySG2w7kKHzlFPs2cAzgdlQVoZBQXkIgld/zyyHBPPdWI5CAiw4wifvVW8Aghw9HCKstKR/iOUCL0FmnZTo1znBgdjOOyvTu1Kf/iZdQsGGuBNhULUde0THbm2JaqUsUhijgPbjf3ad+IOVQVEtwqQJ4lHBGxnEJM2sqTaxuWyre+Uvvu14awbLEMYmBMxxuzbsmKyWvG6GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAsycbKldp64sP2yibV0Qj810iCZl3PKHYtxyNiTcCw=;
 b=R+b2armOWl2IydcjWAATkBaHuzdq4pcN4CG7m3tzVO3/225+2ixzA5+rTHLI2xuEXWv7aO+UuoPInVg41rmk4kPS9OhtgIiOt1+eXV9K/orWm8gVP44UiCv1zr/KlKGd5CXatPT0zjVhp6l1/KenBTW5po2sg5XhIQK3eni/0sc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by MN0PR12MB5787.namprd12.prod.outlook.com (2603:10b6:208:376::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Tue, 21 Jun
 2022 19:45:37 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91%9]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 19:45:37 +0000
Message-ID: <ad87356b-4018-ce95-317a-bfed07b7f745@amd.com>
Date: Tue, 21 Jun 2022 15:45:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/5] drm/amdgpu: Prevent race between late signaled fences
 and GPU reset.
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
 <20220620220302.86389-4-andrey.grodzovsky@amd.com>
 <5b6b623b-9a6b-a615-d7ea-af436f1b4d92@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <5b6b623b-9a6b-a615-d7ea-af436f1b4d92@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4b89c33-c3bb-4174-5c2d-08da53be9d44
X-MS-TrafficTypeDiagnostic: MN0PR12MB5787:EE_
X-Microsoft-Antispam-PRVS: <MN0PR12MB57879247A6153E6985FFB5AEEAB39@MN0PR12MB5787.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WwXOwyoc6AF6+59hKGnFaNnfBjpqvoFBvF+1Mzo4ZbaSBeVU000gOrtJ/vKEPqJxISNBMTHwlBnRJeMiUTHfDlqyQ7mwXospo4kHGHPsxq1g+xGDr00/DWpqrHCfEXOD9VZGfz9U6/rOEhDepnsN7bKBl3BxzqEAC+6QNrQNocXfj/ASTd6Tqu44hJS4YhhIeBHNklK5Gm5pMyXlIIySQaUAYeaLb/MY0J+Hp2Vqx3cmwlAftntHMZs3snPdRdTLTsphlHIr9IyJ1K7yuui4ZiWQcBs0YvUwxbKW1xgX1MlBtusazk4dQ72E1yMRSPpO5H+JLqYNdJXiXybfoZmF1p7UX6QflueE2u7pBCwg0A+e36qpd2RoVGCvX4/ojdmHxBHaRwDXmDo59l6H2WJr5L+JrrC0hOS8ZybnFetOFccvqBfBDw2V9O6gbf+9/yR/+jv0rGwyXcYBcjYfjymVkMjjtW2wR6K01uvOmm+AeZ3FVo2C5NR09fd4O8d/31UksWAjdfEsPpa5qZjQg8Hmotx+0R5Lum0JHDwFsp+2SNBleBebiqeVctkT5ZwWo7DxESpSO+AlZi1NoHSFKohc0FGEP1RmktvnF5Wb6MT/0CFqZK0M50p9wm1+NSXzrSaS03ibsllgodW6uq1BTC9kV905H8DC/AAXtTpH1IuSxIVnpzQjSE2mAJZzw12u8dNkU5tB6pEbaQQ/QNCJn43oG/zWuCRMulEb8yz+lY4AVwM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(38100700002)(66556008)(44832011)(6512007)(66946007)(6486002)(41300700001)(316002)(2616005)(478600001)(4326008)(6506007)(86362001)(31686004)(2906002)(66476007)(36756003)(8676002)(31696002)(8936002)(186003)(53546011)(66574015)(83380400001)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU53REtKTWVhd280OFhnVFJGN0t5d09aQTZ0ejhaYlVSbkZPSWptTGxBbGR2?=
 =?utf-8?B?dkRPM2JJZE5QWDVYeHBISUpBU25lRDFpSHZMbVVnRjlRZ002a2tOSUZzeGJO?=
 =?utf-8?B?WnBEUG02S0ZsTXl1OVZkampKVWJmY2NjbFFnNUN4UXpwQlJvZVNZY1RPK2J3?=
 =?utf-8?B?b3ZsY2RpZllkL2x0TlRzakd4RWZuREtrWHJtVnY0dUt1TVFMZHJNWlFuR2Fp?=
 =?utf-8?B?R0FpWTA3dTdsajk1SXcrZkFZdEZhczIzbVBDRGJ3N0c0MFBOR3Q0S0dpdkJU?=
 =?utf-8?B?WlFrMEJFRXNLSU1zS3QwYXY5YU5GK3JwQ1hDMjZnZG5jaTYzRm9vMFZoMXlC?=
 =?utf-8?B?am8xaDViNDBlUjhUUmpQQk9CeWJnSkYyRFNyUTdBbzlPMXdncElYSkRINzNh?=
 =?utf-8?B?QldGbTdSa1RUZDFTLzkxZTk1bksxd3NEYjJHdzNRVks1a1ZnNUVPNVBLUm1E?=
 =?utf-8?B?OWkwTkNLalhGRzQzQ3Z5K0RuNzVLRVoxWUZBRUlJVTRHYndjNVEyc0t6TkZC?=
 =?utf-8?B?U0R5VXprZU5RZExjRWVOUnEvaStTZ3VReHlnQjVHTUdKL0lSamdYUUU2ckdN?=
 =?utf-8?B?U1BOOEhSN29obFFFbDJxZ1VyMWlYSWR3blQ4WWFhVE1IV2hCZ0hRRGp6aFVh?=
 =?utf-8?B?b2pha1hoQU9wZ1g3YTh5WWlCcnVRbkVxMkRBV2lqYmpGbE5XV09iZDduem83?=
 =?utf-8?B?UGpIZ1pneHFxNUdTYzVNcW9yNUFmVCs1M2p6WW9TdkUyU1hoUEVkdlpOR0h6?=
 =?utf-8?B?VmNPSk1BTEVUbUlRc09WNHN3aEdzNnN4L1VGNk9ocC9XTC80bmRzY2NQMnJP?=
 =?utf-8?B?Y1NwN05KK01UdTBSejJSK0xPYm4zbkRiNXROZHA4UFN3cGxGQnlvTDNGUTVN?=
 =?utf-8?B?TDlrOHk3TXUwSlB1akhDMGVUTFkyWE9KWHhuSXZSRlU5RWlyNXJ4dGNCVkFq?=
 =?utf-8?B?dVN3azZGNjJKeHNTeGRFbVdTMW4rRS8xNUlVQmpWVzJIc0FwWGdkUndEVmdh?=
 =?utf-8?B?MVRUU0p5VFFoSndSVW5iV1hIWWwvMGttLy9nTFhIWWt5RVFmaW5vT3REKzZO?=
 =?utf-8?B?YkN1NHZhSmF6VG9pZjBBM0lwY1dxSGVSS1RPb010TDRjT2t2QXlRRFpWMnBn?=
 =?utf-8?B?TVcxMTFwaGRHUGRONTJTSE5NaUhLK1ZUSDg0dllreWI0VWZnRnBic1RUOHNt?=
 =?utf-8?B?Y3pzanZRVlFqalUzeDZmODJsRmZwdDl1MFIydUxESExkN01wQWVTdmhTeEkr?=
 =?utf-8?B?QnVtSG1wSHRESVhGNk1kMlE2NEdBMHlCd1hSWnpXdTRNWVVJb1NaY1JhdExz?=
 =?utf-8?B?ekJlb3VuY0VLWHB0TVpRQXNpL0V4RVJMNDlYSDE2dHFKeXUrRGVLMkJueHFF?=
 =?utf-8?B?WEQyQ0h6ZFhwd2JjMEpVdGE3NWNnbEoxVjQrcis3bTNqQzdjdjRVWENsSC9K?=
 =?utf-8?B?eVJLQUh1L2lTYzNUTEt1Y0hVREtjcW5hUmJ6KzdVOENtZ2htQ3Y0V3FrVjdy?=
 =?utf-8?B?Y1ZHQlNEVWpyaGxlcmo1QlJDOWpiSVorWXVQMitrZnYrN0JRRFI3TnJqWFh1?=
 =?utf-8?B?Z0xOWE9TV09ZT0pXUkxvS0x1MmRwNzRseHAvVmoxbDVGME1BVVk3L2R3Tjl4?=
 =?utf-8?B?YnFBVEQ0UFc2YkMzSE5hQVhncGVCdm5aOFdTTWd6bEJsbloyUExYMDFWUFZn?=
 =?utf-8?B?bTFmTFZYUTZ0aVBYMklycTM5Nis0cENyMmpiSG9mdkNwaUNmd3BROXFUclBN?=
 =?utf-8?B?ZytUaHMzS1cxZnlBUnl2eVR1TkM3OEtTMzdFajA5OTlNWFdpYmR1Q1gydDh2?=
 =?utf-8?B?UGJ0L0RRcUlhdUs1a0x3bG93OWZxaWZTU0JpQkZieUZaaVNka2hDbmJXMlpk?=
 =?utf-8?B?QXJxT1l0ZHRrbVk4STMyd1QxU1ViaDJkT0lVUTV5UnprUjBoZUNVYjlnd1Vl?=
 =?utf-8?B?RXg1NU4wZkhWZEh0RkUrNmd4QXJ0ZXFZNlNiK1pFN2M4WkI3WVVIK1B3TUNm?=
 =?utf-8?B?NGVINW9lY1VDbXBGWmppOW8xSFROc04wVGR5blNMNVdkZFRpajV3VVJlQVlR?=
 =?utf-8?B?bUdzc0ZsU0QwNk0vWmM1dXEyMG9YSVY5MSs2Mmg2MWZ6aDNWTHFaKysyRndh?=
 =?utf-8?B?NGRqTGVPbGo1SUNwQ0NHdHNQMjEvR2N3NUlpQUY2QURBVG5DKzlpRmhIVWZH?=
 =?utf-8?B?a3pucWoxNXY0TCtRMjcyN1V1V1NPc0RsdE9kMytZNEdnZ2t0dDU2TTJUa2VD?=
 =?utf-8?B?VkVRY01iVmYyVXN4T0lpbVlXclh2a2svSHdnMjFKOEFuUzE2dG1YZEZVay84?=
 =?utf-8?B?eElORDJXOUJlQTNDVktOcjhsa2E4V3VlZTZLTDZOTVMzNWxZWi9vYWM4ZkRP?=
 =?utf-8?Q?AgyTtdW9PxdszoUq17XsbbKzm4MBa2REHjXLvQ4qLJTyC?=
X-MS-Exchange-AntiSpam-MessageData-1: 7eDYLRyMtC+k6A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b89c33-c3bb-4174-5c2d-08da53be9d44
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 19:45:37.4991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y1iY9j5tfyw0I8lu92nGG/dOGNvMybQNTFM2wt0Qs7dF0IMUbBfh/pTmEdtXbpLdSwObC6z2Sk5jxHq/UCoiCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5787
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
Cc: jingwen.chen2@amd.com, Christian.Koenig@amd.com, monk.liu@amd.com,
 yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-06-21 03:25, Christian König wrote:
> Am 21.06.22 um 00:03 schrieb Andrey Grodzovsky:
>> Problem:
>> After we start handling timed out jobs we assume there fences won't be
>> signaled but we cannot be sure and sometimes they fire late. We need
>> to prevent concurrent accesses to fence array from
>> amdgpu_fence_driver_clear_job_fences during GPU reset and 
>> amdgpu_fence_process
>> from a late EOP interrupt.
>>
>> Fix:
>> Before accessing fence array in GPU disable EOP interrupt and flush
>> all pending interrupt handlers for amdgpu device's interrupt line.
>
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 ++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 26 ++++++++++++++++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  1 +
>>   3 files changed, 31 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 2b92281dd0c1..c99541685804 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -4605,6 +4605,8 @@ int amdgpu_device_pre_asic_reset(struct 
>> amdgpu_device *adev,
>>           amdgpu_virt_fini_data_exchange(adev);
>>       }
>>   +    amdgpu_fence_driver_isr_toggle(adev, true);
>> +
>>       /* block all schedulers and reset given job's ring */
>>       for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>>           struct amdgpu_ring *ring = adev->rings[i];
>> @@ -4620,6 +4622,8 @@ int amdgpu_device_pre_asic_reset(struct 
>> amdgpu_device *adev,
>>           amdgpu_fence_driver_force_completion(ring);
>>       }
>>   +    amdgpu_fence_driver_isr_toggle(adev, false);
>> +
>>       if (job && job->vm)
>>           drm_sched_increase_karma(&job->base);
>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> index a9ae3beaa1d3..d6d54ba4c185 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> @@ -532,6 +532,32 @@ void amdgpu_fence_driver_hw_fini(struct 
>> amdgpu_device *adev)
>>       }
>>   }
>>   +void amdgpu_fence_driver_isr_toggle(struct amdgpu_device *adev, 
>> bool stop)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>> +        struct amdgpu_ring *ring = adev->rings[i];
>> +
>> +        if (!ring || !ring->fence_drv.initialized || 
>> !ring->fence_drv.irq_src)
>> +            continue;
>> +
>> +        if (stop)
>> +            amdgpu_irq_put(adev, ring->fence_drv.irq_src,
>> +                           ring->fence_drv.irq_type);
>> +        else
>> +            amdgpu_irq_get(adev, ring->fence_drv.irq_src,
>> +                    ring->fence_drv.irq_type);
>
> That won't work like this. This increments/decrements the reference 
> count for the IRQ, but doesn't guarantee in any way that they are 
> stopped/started.


I understand that, i just assumed that the fence driver is the only 
holder of this interrupt source (e.g. regCP_INT_CNTL_RING0) ?
I can disable amdgpu interrupt line totally using disable_irq - would 
this be better ?


>
>
>> +    }
>> +
>> +    /* TODO Only waits for irq handlers on other CPUs, maybe 
>> local_irq_save
>> +     * local_irq_local_irq_restore are needed here for local 
>> interrupts ?
>> +     *
>> +     */
>
> Well that comment made me smile. Think for a moment what the local CPU 
> would be doing if an interrupt would run :)


No, I understand this of course, I am ok to be interrupted by interrupt 
handler at this point, what i am trying to do
is to prevent amdgpu_fence_process to run concurrently with 
amdgpu_fence_driver_clear_job_fences - that is what this
function is trying to prevent - i disable and flush pending EOP ISR 
handlers before the call to clear fences and re-enable after.
I guess we can also introduce a spinlock to serialize them ? Yiqing 
reported seeing a race between them so we have to do something.

Andrey


>
> Cheers,
> Christian.
>
>> +    if (stop)
>> +        synchronize_irq(adev->irq.irq);
>> +}
>> +
>>   void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev)
>>   {
>>       unsigned int i, j;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>> index 7d89a52091c0..82c178a9033a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>> @@ -143,6 +143,7 @@ signed long amdgpu_fence_wait_polling(struct 
>> amdgpu_ring *ring,
>>                         uint32_t wait_seq,
>>                         signed long timeout);
>>   unsigned amdgpu_fence_count_emitted(struct amdgpu_ring *ring);
>> +void amdgpu_fence_driver_isr_toggle(struct amdgpu_device *adev, bool 
>> stop);
>>     /*
>>    * Rings.
>
