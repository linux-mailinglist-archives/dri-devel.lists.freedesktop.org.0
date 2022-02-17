Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 411454B9C5C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 10:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE8910EE5B;
	Thu, 17 Feb 2022 09:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5C810EE5A;
 Thu, 17 Feb 2022 09:46:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZGw3vaDVJ0I9Sg22ySG4v6iB6SVdhtfDI6UUDnT9LWCYlfwqjmSIJb7vPAtRYmDx3zqjOo1ZGdaKvHW1XOwqMkQVNcuY+/najT/b8MhHJryrjErhz4bo8DhGsQ0CKPUWjl3C7lp1s6exg46aWEWfUcpwt7349MD0SlvqBEgycL5itNp4W+6ln0V/1VuNHFG3M2eBM5sAib1cXZ2MvsbRZuny2DjbRphr0PFY6LAlejRBMa+OEgUGaRJ1rhYpOWF/ewFuWtADN3JLSMse3RO1/J9JyW/rvoh8crn8Sd/SM37RtrTlgCBVfFfERYGT4qTaTUhOMRtRKlmSjWDITvwyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDCQKPFJ9AoXjJSg42Nmw4xUypytnINKD6rjNfDG2/U=;
 b=k1QGRfVU1j3s1lAj2co4hRiRq12mCVNDTXmniuabjTyWosuCq6mZIo9X7BLKnct+3/iH1aJ8XS+U6FMmHw7B2jsy2Ioria2I0VON1CRm1vz/+4y8B7umEe+W2hPEv8xIv7ync5S7DjDTFz9E0qK9S5C+JF+YStOzF/HZ5JqqCoe6BNkuqhYIYLUn9dVwhZvQ8yKKEM45PML8jxuexpszGqMl7KFrtg8Rt+iSMWSzN93//awnMMwK7Kmp6ePkVHYUPf1qMTiSk4082KiWxRedgq6O4M1hehdv7azn0ERugTZlJXVTTxar/ffwvyZSHQVGOfec7tntmw+57Om08hDy1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDCQKPFJ9AoXjJSg42Nmw4xUypytnINKD6rjNfDG2/U=;
 b=LM6V9W4QCONfc7t+uHTr32lNSVSDrqS5ST3Vst6ZcIFC++tTwxPmCNTWFTE9yHIoqo+zNDak2ypGjw5iSeLGz95L2MoCh0q3qftA9323FQPy8Ru0EpJ3+zfX8CSS7+kMnwzbfCBeJmyW8BbaSQWaRmvEDro+1tIH+xjVqaAQnwU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB3108.namprd12.prod.outlook.com (2603:10b6:408:40::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 17 Feb
 2022 09:46:37 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.4995.017; Thu, 17 Feb 2022
 09:46:37 +0000
Message-ID: <dac70c05-e712-d2e3-2267-278380895f1e@amd.com>
Date: Thu, 17 Feb 2022 10:46:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdgpu: check vm bo eviction valuable at last
Content-Language: en-US
To: Qiang Yu <yuq825@gmail.com>
References: <20220217090440.4468-1-qiang.yu@amd.com>
 <5d3fdd2c-e74a-49f4-2b28-32c06483236f@amd.com>
 <CAKGbVbtLTBJPF5eTu4rABUTBa8eqjQvqjo1AEUrzgPgYgCREuA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKGbVbtLTBJPF5eTu4rABUTBa8eqjQvqjo1AEUrzgPgYgCREuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR01CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f26afc9-e465-4cd5-8470-08d9f1fa6404
X-MS-TrafficTypeDiagnostic: BN8PR12MB3108:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB310895BA2E6724C2AF1950AC83369@BN8PR12MB3108.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jmhueIeJvyguxbqMyTLwLl/nJS5PptxCmRb3SfEvozrYoSH4MM79U0bMeV/ejtCpsjkJ1LSz7DCMwVfYI2Hgv0I2y7sUjSpcVUiZvHicBjO74RQK63P995NC4YRrWkW4Ep3WPoPz52f/MlEyPP5ceD4egF94ZxiCRX0/4yPt2wGlcTX/V7h+IgaH5z/URE7OT4a9+SghZZCNnzBEvfv+lORH8OgNapS2ODQYTBePjL25zrjl4HHby9Th4Ty1/KchHSI6TRNBPl68/EUwbRD7uSY31csTLROZp83IsQl/jAAYNhrWYcvjInlbMkdZhhuJTNr3HQCrecN8+oPaDmmgYyzfqcwn+ZBbYeKlWFnFoSrUvm9TKBjGnEMmCEfELHiPy97SNHNF5PSTPmA8qKEQyWMA/ZZWTgFHSJqen26Wng5dDlEGpUWuv7Mj+CnW2rwhA0RDwig2yNKkXehvNN4hPChGqpc+paxkXb0NRUIXHIVgdnvCFm0hOjpy+ikES63u37bgqpul28jUpEPQurmDfo5hKKT30iEpA5hIM+IoWBl/EK1ZBqr29z3qrhurHym/9x0SOXIy6QXp6lgL2fr4V39nTKbQCaWYWhl5vQ2hzfzsCtIrfSG7v2eMjvJ16c+AmJM3gulj9kcYAv3SEq33cvHZWk0dC4ETfyU5ksEDNCI03XBxr1K6a9oaiQDYCLsb64A5X2UuvPGkBKWn3q05QcvcKpLKLnVTy4u774qiKmqOVyOK8H1TIgpeBbzqFmQz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(38100700002)(66574015)(54906003)(83380400001)(5660300002)(36756003)(2906002)(31686004)(66946007)(8936002)(316002)(66556008)(508600001)(31696002)(6506007)(53546011)(8676002)(6916009)(6666004)(186003)(6512007)(2616005)(86362001)(6486002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUVmRVhmU1ZqRmk1TFM4OS9vTDNRUE1rVGNZektrdFRxYkVYcEFxNzc1K3dW?=
 =?utf-8?B?TnhDMVNmcWJ0VVEzcVUvc2hCTEVjS1V4UHBCZjRmV0NXdUFaYmdjKy9ONjda?=
 =?utf-8?B?Nm1ZbFQvQWNpSDdHSmc0Sy80Qml2Znc5cjkwRmk3aVVEWS85M2Q0SUZoME12?=
 =?utf-8?B?eVgrWTRJM1pKZ3JieDdrZm4wS01SY01kZy9IZmhHSElhNXM3NFQ1MFZEalJx?=
 =?utf-8?B?dXQ1Tm1NNHJ1eFpHcmNKR3h6VFEvbnFNSGw4VFNmWk9BQUxvbG1KN1YvSGto?=
 =?utf-8?B?U3duZndpVGlGWlgvNnFyKzZvSlpYZlRobGVRdUVaaE9PdXV5TDl4MDhKZFpz?=
 =?utf-8?B?L2RuNVB4amFzTHNEVEhtMThVc2FXYmg5azVkRlRqT0N5UExhYkVZdW1VWDhy?=
 =?utf-8?B?T1A0dDE0bFVjWUtqUEpZZFo3Tks1VDZJUy9iN081c2NQZ21VSWI0aU9kbDZF?=
 =?utf-8?B?aWNzWTZ0YmZleVMzMjNaQzM3VkRqVmxub1hIVTNZcGl4cHJXZGdsUytFc2cz?=
 =?utf-8?B?OVpMakZPR2tJOHQwU3pPK1VITlRqSUo1dGdyVVJtblJoLzI3L3JJdHNvRFVn?=
 =?utf-8?B?djVsOERUWS83cmdRNE82cDg0Z1RRbXBKSHR0TTRyc3hKRmlLdjc1dXA2V1U5?=
 =?utf-8?B?amhyQW9XUlF1Vk5peFVHbFNtTVFRN0UvKzJCNzkwZ1V2OXE4TmEvQTIrb1o2?=
 =?utf-8?B?RW1aTStVUDlqK2MzajRXcWIrdkZ4UG1Jcldvd0xoTFNSN1dMVUpRM0JxZDZI?=
 =?utf-8?B?U0NsWkJJM0pWbm5lbTVNVE1XeXpVaW5nSEg5Vnc0Q0N3MzlRTFZtZFE4WjlK?=
 =?utf-8?B?ckNsZFFYVVQrb2RneEppME13RllLYzNtRzY1YXY5dzdiL0ROcVljUHUzSkxJ?=
 =?utf-8?B?SnFSdFJRbFBNL2IzSG1ldHJ0WTVnMU5Fc3F6Y2dDU1N4K0RxY0JjTm9JZDB6?=
 =?utf-8?B?aVZGS1BMSTRMbzF1SWJwSElHYnZFSG9TTUJmR3pRdllEc2oxYTluOUVzMFZv?=
 =?utf-8?B?MVlqaHVGeHo3a2ZBbzFJQzMzR3FnVTlFWnRyRFZKWGEwdHMxZ3lCZlYzWU1G?=
 =?utf-8?B?cWpiZGJzazFiY1pQeDc1Qko1SkprQ3RQSk5tc21GajFFWTE4Q20ydndhT0NT?=
 =?utf-8?B?YkRzdEdUcVZ2QmNrRm1aQ1c3UnczMUVpU2FOeDdYWTg3K1BLbDRGZ2V5SVQ3?=
 =?utf-8?B?ZGtwRzRGc25RSUFkdDVrUkdOWGxEenozSmFuVzdVeGZZSFFPWnhFM2ZaZHpE?=
 =?utf-8?B?bVhGUEpmSzRoaU00blBtYkpLZkMwZ3VneEtNK2dRczlKYk4vT1JsbU1nYW5o?=
 =?utf-8?B?Sm41Yk1jeWk0c2FWK2NLSUNpYlh3aHFFalBhNmt1c2NON3dPcVBPWGgxbXpi?=
 =?utf-8?B?YnVVeks4Uk9XRGh5bEI4ZVpVdks5bnBmMGd1YU5UZ0lJZXZnTjJmcUxyUXJZ?=
 =?utf-8?B?NVU0VWVuT2pIU2FLZGcvVGtBYitwT1NtU2tDWFE0VGNEQTJRVWtwWGlDLzYx?=
 =?utf-8?B?N0kyMjJaSDJhVEV3WUZBclNxRFV1OXZibnZ0ck9lVDByaHp6YW92dEJzZnVm?=
 =?utf-8?B?Z2gvd2EvSWhQMGk5VXArRW95cTMzUlVxcWd1UUdKYS9rUFFrT2M1eERKN1V1?=
 =?utf-8?B?dDVLd2Y2aVdkSm5MWWU5SWpDZElvcWZ4YXlqQzRXaFFLckpzbEU1cFlYS1hx?=
 =?utf-8?B?Ynl2aG9EWGQ5VGg1N1JyZXBvU0tJM3pJWFZVSWZNMWpqcjJlMVJVTkY5bERu?=
 =?utf-8?B?YWduMnk4czBrektkTzFaNXV2Wml2b3I0TjduM0lENkdWcWVsQ3V0SkxNcGF1?=
 =?utf-8?B?TCtMYi92eERkcW5nU3pFMCtJemltTGgwQ2NkeUNVd0U3WXlGUlliai85S1lC?=
 =?utf-8?B?RlNPRm1DdUpEdTdWWHh1cVlicG5wQWp2bTBmZ2V6YTE4SFliOUxlMXQ0OWwy?=
 =?utf-8?B?d1p3YlBUcXM4WkpIUDBUTnczL1JlMjhXNnBhZU4yMncrbFlodnZjK2NGaWhE?=
 =?utf-8?B?K09KSnpXbStEUzJsTDVYOWZVbFUwRmQzNE1ra3ZSRHBmamg2SWE2emZTNERG?=
 =?utf-8?B?d2oreUpxc1hxWW5WcjFqa2VDd2FiSDRjZXV0OTd6cG5YbjNFNmZ6Yk8zaTFs?=
 =?utf-8?B?eUJBakkzUjlKM25JRmsycS9sbS9oVXFKYVlwYVIrQnAwRlNpcjlpbURsRncx?=
 =?utf-8?Q?X9WFoc4UL1XnFkSRYdk1POI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f26afc9-e465-4cd5-8470-08d9f1fa6404
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 09:46:37.2865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R08kytptxOt9aY6O5jI7+LfE6aMQL8vY2F6NRbq1zm6qQ5pjEVGj1Nfb9vG3fkRI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3108
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 Qiang Yu <qiang.yu@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.02.22 um 10:40 schrieb Qiang Yu:
> On Thu, Feb 17, 2022 at 5:15 PM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 17.02.22 um 10:04 schrieb Qiang Yu:
>>> Workstation application ANSA/META get this error dmesg:
>>> [drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* Couldn't update BO_VA (-16)
>>>
>>> This is caused by:
>>> 1. create a 256MB buffer in invisible VRAM
>>> 2. CPU map the buffer and access it causes vm_fault and try to move
>>>      it to visible VRAM
>>> 3. force visible VRAM space and traverse all VRAM bos to check if
>>>      evicting this bo is valuable
>>> 4. when checking a VM bo (in invisible VRAM), amdgpu_vm_evictable()
>>>      will set amdgpu_vm->evicting, but latter due to not in visible
>>>      VRAM, won't really evict it so not add it to amdgpu_vm->evicted
>>> 5. before next CS to clear the amdgpu_vm->evicting, user VM ops
>>>      ioctl will pass amdgpu_vm_ready() (check amdgpu_vm->evicted)
>>>      but fail in amdgpu_vm_bo_update_mapping() (check
>>>      amdgpu_vm->evicting) and get this error log
>>>
>>> This error won't affect functionality as next CS will finish the
>>> waiting VM ops. But we'd better make the amdgpu_vm->evicting
>>> correctly reflact the vm status and clear the error log.
>> Well NAK, that is intentional behavior.
>>
>> The VM page tables where considered for eviction, so setting the flag is
>> correct even when the page tables later on are not actually evicted.
>>
> But this will unnecessarily stop latter user VM ops in ioctl before CS
> even when the VM bos are not evicted.
> Won't this have any negative effect when could do better?

No, this will have a positive effect. See the VM was already considered 
for eviction because it is idle.

Updating it immediately doesn't necessarily make sense, we should wait 
with that until its next usage.

Additional to that this patch doesn't really fix the problem, it just 
mitigates it.

Eviction can fail later on for a couple of reasons and we absolutely 
need to check the flag instead of the list in amdgpu_vm_ready().

Regards,
Christian.

>
> Regards,
> Qiang
>
>> What we should rather do is to fix amdgpu_vm_ready() to take a look at
>> the flag instead of the linked list.
>>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Qiang Yu <qiang.yu@amd.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 85 ++++++++++++++-----------
>>>    1 file changed, 47 insertions(+), 38 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> index 5a32ee66d8c8..88a27911054f 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> @@ -1306,45 +1306,11 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
>>>        return flags;
>>>    }
>>>
>>> -/*
>>> - * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict a buffer
>>> - * object.
>>> - *
>>> - * Return true if eviction is sensible. Called by ttm_mem_evict_first() on
>>> - * behalf of ttm_bo_mem_force_space() which tries to evict buffer objects until
>>> - * it can find space for a new object and by ttm_bo_force_list_clean() which is
>>> - * used to clean out a memory space.
>>> - */
>>> -static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>> -                                         const struct ttm_place *place)
>>> +static bool amdgpu_ttm_mem_eviction_valuable(struct ttm_buffer_object *bo,
>>> +                                          const struct ttm_place *place)
>>>    {
>>>        unsigned long num_pages = bo->resource->num_pages;
>>>        struct amdgpu_res_cursor cursor;
>>> -     struct dma_resv_list *flist;
>>> -     struct dma_fence *f;
>>> -     int i;
>>> -
>>> -     /* Swapout? */
>>> -     if (bo->resource->mem_type == TTM_PL_SYSTEM)
>>> -             return true;
>>> -
>>> -     if (bo->type == ttm_bo_type_kernel &&
>>> -         !amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo)))
>>> -             return false;
>>> -
>>> -     /* If bo is a KFD BO, check if the bo belongs to the current process.
>>> -      * If true, then return false as any KFD process needs all its BOs to
>>> -      * be resident to run successfully
>>> -      */
>>> -     flist = dma_resv_shared_list(bo->base.resv);
>>> -     if (flist) {
>>> -             for (i = 0; i < flist->shared_count; ++i) {
>>> -                     f = rcu_dereference_protected(flist->shared[i],
>>> -                             dma_resv_held(bo->base.resv));
>>> -                     if (amdkfd_fence_check_mm(f, current->mm))
>>> -                             return false;
>>> -             }
>>> -     }
>>>
>>>        switch (bo->resource->mem_type) {
>>>        case AMDGPU_PL_PREEMPT:
>>> @@ -1377,10 +1343,53 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>>                return false;
>>>
>>>        default:
>>> -             break;
>>> +             return ttm_bo_eviction_valuable(bo, place);
>>>        }
>>> +}
>>>
>>> -     return ttm_bo_eviction_valuable(bo, place);
>>> +/*
>>> + * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict a buffer
>>> + * object.
>>> + *
>>> + * Return true if eviction is sensible. Called by ttm_mem_evict_first() on
>>> + * behalf of ttm_bo_mem_force_space() which tries to evict buffer objects until
>>> + * it can find space for a new object and by ttm_bo_force_list_clean() which is
>>> + * used to clean out a memory space.
>>> + */
>>> +static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>> +                                         const struct ttm_place *place)
>>> +{
>>> +     struct dma_resv_list *flist;
>>> +     struct dma_fence *f;
>>> +     int i;
>>> +
>>> +     /* Swapout? */
>>> +     if (bo->resource->mem_type == TTM_PL_SYSTEM)
>>> +             return true;
>>> +
>>> +     /* If bo is a KFD BO, check if the bo belongs to the current process.
>>> +      * If true, then return false as any KFD process needs all its BOs to
>>> +      * be resident to run successfully
>>> +      */
>>> +     flist = dma_resv_shared_list(bo->base.resv);
>>> +     if (flist) {
>>> +             for (i = 0; i < flist->shared_count; ++i) {
>>> +                     f = rcu_dereference_protected(flist->shared[i],
>>> +                             dma_resv_held(bo->base.resv));
>>> +                     if (amdkfd_fence_check_mm(f, current->mm))
>>> +                             return false;
>>> +             }
>>> +     }
>>> +
>>> +     /* Check by different mem type. */
>>> +     if (!amdgpu_ttm_mem_eviction_valuable(bo, place))
>>> +             return false;
>>> +
>>> +     /* VM bo should be checked at last because it will mark VM evicting. */
>>> +     if (bo->type == ttm_bo_type_kernel)
>>> +             return amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo));
>>> +
>>> +     return true;
>>>    }
>>>
>>>    static void amdgpu_ttm_vram_mm_access(struct amdgpu_device *adev, loff_t pos,

