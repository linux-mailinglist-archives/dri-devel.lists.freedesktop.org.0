Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED04784155
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 14:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABB710E351;
	Tue, 22 Aug 2023 12:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E24E10E353;
 Tue, 22 Aug 2023 12:57:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHoSwf9Znc7bw9SsJ8NOaROBhFMskhdiLhFQ4ObE53eTlWF+uaJ0pTROW2McBsl4yjKIGRk0Jovz4fNq1aJ0g5sxcaWJ6R2h7ppmJ8IbrdjhaOqhMy7MpgvEyeFWII0Zr4rkPR4xuGNVos2sa5+vh9iPVsgtfWKQQ5YBBSKAK8s7WtBbFXa3hDAMBlC7VIEZZuF+nMopZt0gW23hTzHSfbfvShVBW4Gn3PUH3qtO5xKq7A/Y/mGM4i4XheoD/MWGP8HcJUB6nhGx0Qrlwz01H3tZUbNIqsS7Ydw4tAspa421kqmTXXK5cY4a44ToU0oE5Yig96pWrygp24HgkCc9Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3Ia3yiArulSaLsyWv9EFObCH2fv20u0bCKoQ61IPoE=;
 b=N0Kx3tbjn4ZxJdsxnnVVt62laF7XIf+URD0Ue/MoaWrAmZyeHhwbQwi4PkdUX8+DIfSLlM7tdT3I1lVsM8dl/xhwtBNnlI9WAd+eKABIADBRLPk//qm77SHLL/boZtaba9pLPj+uTGlTxli9ia5Ujms38fj4UwWAbubsn9ugvafgiZSNxyOlZYXTUQWtXnENgkE6IOganxPaZwTkpLmN24cuMKbvlisU3Bztra2/Q/nrOZIQOEVNHTIG3pmMoB7l5f+dyQpcwaswHoF3FEcgzOdjgGJePAl3LCmTkBoyhstXTCmKtCVc/LT3F6ZolRZi7VlcEIaSdlZn7kjGUi1Y/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3Ia3yiArulSaLsyWv9EFObCH2fv20u0bCKoQ61IPoE=;
 b=xbnjbOlITpO5TL64+E3AegvlxBRWHeUapgI7z18Rcx7qpyHFls53U2bCId2t1cMnaKQGqmvPCCLokfH9kAA9T1ejdHZluVE/C5q9mag5vkgVYYbmfll6fx40SC/aKGxahCAfr9fD8KVXDw1FM4WpA801Ns3yhiiW39QfePDkOsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by CH0PR12MB5370.namprd12.prod.outlook.com (2603:10b6:610:d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Tue, 22 Aug
 2023 12:57:11 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4%7]) with mapi id 15.20.6699.020; Tue, 22 Aug 2023
 12:57:11 +0000
Message-ID: <4e88d913-ae0d-6746-a839-6525874afa5d@amd.com>
Date: Tue, 22 Aug 2023 18:26:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 4/7] drm/amdgpu: Add suspend function to clear the GPU
 power profile.
Content-Language: en-US
To: "Lazar, Lijo" <lijo.lazar@amd.com>, Arvind Yadav <Arvind.Yadav@amd.com>,
 Christian.Koenig@amd.com, alexander.deucher@amd.com,
 shashank.sharma@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-5-Arvind.Yadav@amd.com>
 <fdcfe7f2-05b9-c144-1b4a-74889bcb0555@amd.com>
 <d178212d-65ee-a1a0-323b-b9b91931db33@amd.com>
 <aeca86ab-9c5b-4011-7622-1954df1b961d@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <aeca86ab-9c5b-4011-7622-1954df1b961d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::31) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|CH0PR12MB5370:EE_
X-MS-Office365-Filtering-Correlation-Id: 20f0ee65-47de-4ca8-0983-08dba30f4cde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tbt431d/ZYa0EGVEtDWX20B39hRDTXak2JtHYm2uxEjqaWGi+BZqDAUcZiqCL02OYjab0efXIuh+0yQdXMULRhgWGPeI9Ep/9RNHw98dxmUPUkihzmFr9TKw/2qAyr2qazwoTY3gFDgmS0+ArY/gMbQvQsEk4cLuyVDQmkLJpSBgBXbhxnY1KXUS8Q1yj5bjUqaU3nCylBF2YUiSmoVDvC1/7vWmDYhFKxXMiOUgynU3HuYj+qfRPprz3rj4W4XhKh/Ul6qWLDHrO8Byi4kjiNewoRuZPRnvVDt91DaoO8wOyzo+OqzQIRrXriZsKJVBJcGKB4It5NWaQMbTWKSK4m28oAafUH5UOdQGVm6OL8axxskQPZPd9lii59hh9WtAX+n1Pyoa3PZP93n1QpDIWnC81EZZdA8Sp62PxUkGl2v0vXaAeD+TguATZDIELz/yi8wUx7e7fwzMBl1ue/z/x2RJ0J25srCpMy2XqZY8ihCqZtdkU0Kr+fcJ8VeEN74dxFRwQDbzTm44Lc5VvIT0FrYj8wCH74eGLK2rxu6waMGZZEN0/ONadjvT/xhi/kumxjRkysQWVxNRNLQ93StD3kh8+hlfJIRNxSWmnxmsyzDQtEZr6Bg+yLAyNKjn+s7sKs3KJ7/nCxNY6Fn8F4oMxWlY80J/QXTsUexirYEgh10=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199024)(186009)(1800799009)(31686004)(6486002)(478600001)(6666004)(110136005)(83380400001)(38100700002)(921005)(15650500001)(2906002)(26005)(6506007)(2616005)(6512007)(53546011)(36756003)(31696002)(66556008)(66946007)(316002)(41300700001)(8676002)(4326008)(8936002)(5660300002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGt3NXBLcWtIdTRlcUduTnNPYm1Naytkb0x1eHhTU0lpK251emd0TC9nblhQ?=
 =?utf-8?B?MVBiczYwdC9KNVZLdVhtRkRKUWRsTTh0WmtRbXBiM2paSzhCZi9EbENsVnBC?=
 =?utf-8?B?ZHkwa09tenlJNC8wSUp2R3NkcmI0QXdIR3NkVkZuendCY2lmSTBMMy9ROFAv?=
 =?utf-8?B?cGgzRWZiWEhPL2NyR0xOMEl4TG0wTlhSMU5tc2x2dzdOclZLZVRMZnltVjE3?=
 =?utf-8?B?SUsydVBnY0duWUI4d2IwMmdPZnBiOEZwYjU0cHMvaUlsVlZ5Nk9yNk5zRDFN?=
 =?utf-8?B?R0ttNW4rc2Q2ZWpaMUZ2Yk02YzRkdEVCcGo1MGtBTGM0M2o3QnZLWnZyQ2xC?=
 =?utf-8?B?QjZqd1B6bGFxanNYdVZpNHI4bFFHL1FXUVIzdk5EcUdyUnoxd0J6M0dOLytJ?=
 =?utf-8?B?Vk9SbXBUems1djJ3bVd0UjJZUTd2MS96K1VNWk5LdGJxNWpaaTNCa1JyUEc3?=
 =?utf-8?B?d25EeWI1Q2ZMaDRyT2pKRjRrUGR5MXQ0M3VucHNEUUZpSjZYSmZ4V3pPQm10?=
 =?utf-8?B?TEJnUFQrQ3BmUDE0aXlGUERYTy9adjQ4ZDRRWmZFeURtM09xVmdJME5nd0lu?=
 =?utf-8?B?TTVpRVBoQy9Nd2xWd2YyaTczWm5SY091UnU1RXhLT0ZLcUhyVENHSUdROHV1?=
 =?utf-8?B?eXBTWmJmRXlMdi9PcXU1NStvcWxRVUhLdWp2TWpMNlVKSmZva3RCSkxjcTIz?=
 =?utf-8?B?R0dsbXMveEFOdzdEMXZ1S2pBMVl6MVpjYW9ETmdvcGVmR01PWDNFVk5TdXZJ?=
 =?utf-8?B?U0JqbS90c3pMVFI3TXVwZis0YTV1RXYxc0ZFSkNpak1VOFd0QnMyQlZZcVBK?=
 =?utf-8?B?KzBLZngzcWVsdHZ3TVJQNXhHQlBIbDdUZ1llTUQxbzBvZEdnWVJITVlDdmZu?=
 =?utf-8?B?N2ZGZmR6NVFHc2t5VStDR2doVnVEN1ZFS0pWZ1ZiSWlETFZPNEhJNDNxN3pz?=
 =?utf-8?B?WUsrSm9JNGIwNWhaazJuNlpETzhxUFRFZFY3MHdvMTZ1L05zT3RNVFMwSldu?=
 =?utf-8?B?RWN1MzV4WVozN0ZMM1MrN0F5RFVpVEc0N1FQb054dUVaVGVZT3pRZjk1SVVI?=
 =?utf-8?B?UENHWS9US2F4MTNsVzV4aWxXSG95YTJGTTZhQU9MU0ZpQVBmWDBGZlZmdTlq?=
 =?utf-8?B?VmxBUTM1UkU2bmxnWWN6ZTZSU2o0K1hNeThDMVc5WFVRMDZVR0w0cGd2dVVz?=
 =?utf-8?B?bXV1Ris3YnZaNitKQUtGTE42WVYxNXVEUUIvRWF6SFNIV0RtWDVNT2l6U1Rh?=
 =?utf-8?B?QXRFTzQ0TC8wdTUyNkNUTmRwREh4SkpxOVBMMlVXaTRqTlBjR2JCZjhUWFk2?=
 =?utf-8?B?L3VVM1FQSjRrRDdESVVaVG5IYkVFc01RcXJ0R0tNRXJjdmoxc29nbkgxcldS?=
 =?utf-8?B?L2JXRDdxc1I1ZFlzYnJ0RTl3ZmN1ejduaytVREp0ZldobEE4c2dsQ2tPR0t2?=
 =?utf-8?B?MWZwd2pxZHpxWmdEanVpcTY1aVBrV1czUHp5U0tTSEhBdEtySVFJWW1DTzZR?=
 =?utf-8?B?MS9zTTNrYnZHKzNqanV6anVSMTNpVzltUW9GVlRRM2NmdmhsOVM0WDRya0Mr?=
 =?utf-8?B?OGNKOHhRYnhjT0MvYTNJOGt0ZTkwWTFFVHpDUlBiMHhKbGsyYnByQnZUeC9q?=
 =?utf-8?B?bG1RNlArY1cwSkUwQjQ1RTRMZHBZd2tMR1ExTnpvODg5TUJGZEFWUWtSRVJk?=
 =?utf-8?B?MVVpd05IU3E3WmZHZlErTkpPOVplc053TnBVUmNvMDFER2gxd291dEs3dEpH?=
 =?utf-8?B?TlhrcnhEZXdzbjZtYW1ZcjllZjkvTjhrcDJNL3hZNEQ0SlJOUlRKanpGcHpD?=
 =?utf-8?B?U0dxazdVU2xmZ1RaTjZVa0dXR3Vpa1lzMXNrSU9RblJwZWEwblpTMGJ4TlJk?=
 =?utf-8?B?enVURG1qa080dzlEOU9WWm1QT1F3L3JjTEJjc2tkVzdBbXQ4Qm15Y3REN1VW?=
 =?utf-8?B?dkpUZXNzeE9PaEhnMlJLV0tqODBWMnFIVUQ0d2tEWTNUMU04NS9XQVlHS0c5?=
 =?utf-8?B?UkxIcG5HZ0wyNTZNcUxOc08raWs1REFlVkxUWG1sU3U5T0VUN1R2VDZrcWZo?=
 =?utf-8?B?cnY0clY1NUhYREd5ZUhPV1dxNUhpV2swVThiblJ5anprQ1V5ZWFEVEZoeWhn?=
 =?utf-8?Q?h6l+xW+FjATqrczdp+Ul9+ngC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f0ee65-47de-4ca8-0983-08dba30f4cde
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 12:57:11.6351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRIYwmfFOdbEhYARmWLOZYtvjk82Qkr7b2hH6ud6zpk4qBBVgbCSGVm0IbqwlqoJJxR09oV4C+jInvHrbhzRtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5370
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/22/2023 6:24 PM, Lazar, Lijo wrote:
>
>
> On 8/22/2023 5:52 PM, Yadav, Arvind wrote:
>>
>> On 8/22/2023 12:01 PM, Lazar, Lijo wrote:
>>>
>>>
>>> On 8/21/2023 12:17 PM, Arvind Yadav wrote:
>>>> This patch adds a suspend function that will clear the GPU
>>>> power profile before going into suspend state.
>>>>
>>>> v2:
>>>> - Add the new suspend function based on review comment.
>>>>
>>>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  2 ++
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 23 
>>>> +++++++++++++++++++
>>>>   drivers/gpu/drm/amd/include/amdgpu_workload.h |  2 ++
>>>>   3 files changed, 27 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> index cd3bf641b630..3b70e657b439 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> @@ -4212,6 +4212,8 @@ int amdgpu_device_suspend(struct drm_device 
>>>> *dev, bool fbcon)
>>>>         amdgpu_ras_suspend(adev);
>>>>   +    amdgpu_workload_profile_suspend(adev);
>>>> +
>>>>       amdgpu_device_ip_suspend_phase1(adev);
>>>>         if (!adev->in_s0ix)
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>>> index 6367eb88a44d..44ca8e986984 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>>> @@ -174,6 +174,29 @@ void amdgpu_workload_profile_set(struct 
>>>> amdgpu_device *adev,
>>>>       mutex_unlock(&workload->workload_lock);
>>>>   }
>>>>   +void amdgpu_workload_profile_suspend(struct amdgpu_device *adev)
>>>> +{
>>>> +    struct amdgpu_smu_workload *workload = &adev->smu_workload;
>>>> +    int ret;
>>>> +
>>>> +    mutex_lock(&workload->workload_lock);
>>>> + cancel_delayed_work_sync(&workload->smu_delayed_work);
>>>
>>> Another deadlock candidate. Between fini() and suspend(), the only 
>>> difference probably could be initialization status. If so, just use 
>>> a helper that is used during fini() and suspend().
>>>
>> Before going to suspend(), we need to cancel the work and clear all 
>> the profiles but in fini() we are destroying the mutex. also it will 
>> be called when we are unloading everything.
>>
>
> What I meant is for both suspend/fini, you need to cancel any work 
> scheduled, clear refcounts and set the profile back to default 
> profile. Keep this in a helper and reuse.
>
Noted.

Thank you,
~Arvind

> Thanks,
> Lijo
>
>> ~Arvind
>>
>>> Thanks,
>>> Lijo
>>>
>>>> +
>>>> +    /* Clear all the set GPU power profile*/
>>>> +    for (int index = fls(workload->submit_workload_status);
>>>> +         index > 0; index--) {
>>>> +        if (workload->submit_workload_status & (1 << index)) {
>>>> + atomic_set(&workload->power_profile_ref[index], 0);
>>>> +            ret = amdgpu_power_profile_clear(adev, index);
>>>> +            if (ret)
>>>> +                DRM_WARN("Failed to clear power profile %s, err = 
>>>> %d\n",
>>>> +                     amdgpu_workload_mode_name[index], ret);
>>>> +        }
>>>> +    }
>>>> +    workload->submit_workload_status = 0;
>>>> +    mutex_unlock(&workload->workload_lock);
>>>> +}
>>>> +
>>>>   void amdgpu_workload_profile_init(struct amdgpu_device *adev)
>>>>   {
>>>>       adev->smu_workload.adev = adev;
>>>> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h 
>>>> b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>>>> index ee1f87257f2d..0acd8769ec52 100644
>>>> --- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
>>>> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>>>> @@ -52,6 +52,8 @@ void amdgpu_workload_profile_put(struct 
>>>> amdgpu_device *adev,
>>>>   void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>>>>                    uint32_t ring_type);
>>>>   +void amdgpu_workload_profile_suspend(struct amdgpu_device *adev);
>>>> +
>>>>   void amdgpu_workload_profile_init(struct amdgpu_device *adev);
>>>>     void amdgpu_workload_profile_fini(struct amdgpu_device *adev);
