Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88DD4B9D5A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 11:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C5B10EB9F;
	Thu, 17 Feb 2022 10:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500F910EB92;
 Thu, 17 Feb 2022 10:39:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nY/RK3VKLhxa6nmm6jqYPtFDvv8BzHD9EClqB4UpYXC3yRSBXsCpQxjxfXozNtYbrewMt6MGUIM8R9n0bgu+T//kDCnzV8t4C+b3ly/trp2/dU/ooYHLaojm+QVFZa6v/lxuKr2N70E9H4KGBicM+F5DumdXiW3e3X0Mu4T7/DheIdP2MPO9ZmRkJuWxvjC2CZPfzg6YtknmEqdd+xWuWBelPO0KlhuUNmXu45wctg6WAOua2g0x4wBqRxP0NJrftZyQbwmlkalkXT89wAlIFq3D2s6rPfTZwbqPEF4+s0ZH8KOUdvtQlBAwlIOkMx2y3sUy1MdUuENQ+Fx3KPesog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0PsVUbluCIQF5uWpIAGnxSFYmK6yUZVOD5XBuq7xmE=;
 b=U6xvQ7FSFRwKFDkM8zWhHgeSYK3YSUkU3UqblnVdP2w0gvADrBB3FIcaDCuFL8FRZmYS5qLdjTSCgmqiWLm6rzsKYk26ZTGRrGM1HE88PCiX2jgbuBODuxMHyjAbY61DR7aMjOgB1gsM31Up0+iMrfmlQdwX2OkAhFs2MJsaTziVfTt1391RPiPiTvj7WLFeeri5XUAievLZwOOExW3zOpNnBoQb/yyDsSB7gqNa/pkDK1FKaVD0Zh5bLjFf2PPWDpC0DgpsIhLUZ8Qp7XiOFijY2Dirdjtog/BwERQfOmHIBQ18RkdyHSoInv1dhLoLgerGXnplSpOOKAqfwt4bfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0PsVUbluCIQF5uWpIAGnxSFYmK6yUZVOD5XBuq7xmE=;
 b=AfDiiZOOBBaIu+KSnZbOivgWa0L4zsiciwtqojYuzhhSL/nDUU92CSiJqpW0EbYXWykuHFkOZNZyTjvdZ3Cil/s80Js61g6jgLFc9QWhGepiHL9BEkvb2beXd8fZjzTmnLjAO5jTOJzY7AEBCt0d5kQhiWWThWdxgQNdI42RRiM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by MN0PR12MB5785.namprd12.prod.outlook.com (2603:10b6:208:374::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 17 Feb
 2022 10:39:12 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::e920:c950:24e1:1154]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::e920:c950:24e1:1154%5]) with mapi id 15.20.4975.017; Thu, 17 Feb 2022
 10:39:12 +0000
Message-ID: <ca27a9c6-f390-a938-dd66-ac23f3b44dc4@amd.com>
Date: Thu, 17 Feb 2022 11:39:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdgpu: check vm bo eviction valuable at last
Content-Language: en-US
To: Qiang Yu <yuq825@gmail.com>
References: <20220217090440.4468-1-qiang.yu@amd.com>
 <5d3fdd2c-e74a-49f4-2b28-32c06483236f@amd.com>
 <CAKGbVbtLTBJPF5eTu4rABUTBa8eqjQvqjo1AEUrzgPgYgCREuA@mail.gmail.com>
 <dac70c05-e712-d2e3-2267-278380895f1e@amd.com>
 <CAKGbVbvtLbDiKrX80-dMnipdLkTE+FP=g_mx37e12fuMtA1Y4Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKGbVbvtLbDiKrX80-dMnipdLkTE+FP=g_mx37e12fuMtA1Y4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0333.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::12) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d79250c-b8dd-4064-0d3e-08d9f201bc65
X-MS-TrafficTypeDiagnostic: MN0PR12MB5785:EE_
X-Microsoft-Antispam-PRVS: <MN0PR12MB5785C44103D675BDE94161B083369@MN0PR12MB5785.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TG+ivk7wmCW3LPIUTnZ0oIC0e8FJnk5Q7c3gPyGmlKB7mFiPxhr+YLlSOE2LptjJGAMhahgY7GlsFfwpLdHTLmq6zdlWiUhFxWTDhb6c7osdMYSYxk3zqzAdHyGtk3HpTg7bplnfim2EWCR1w42D9VjxIfUUVUdW19Sv773SLDUnZbL9R+LI6wX+zZz2ox5tbERsJUSkPLynfsOzhFgERQ92MUAbRs2/OflcNBqysF/t5mL0gT3yog07PLYoCvXUWKQ2s5G3CjEJCOjoelEFAU1tzKU/UjqPyCCrYzfEfx1dSiyoOYmDEGjfAjcHSVQGeTybxY1Wt+PIqM9EDLVk8MnOKilmdL5B0yAjHBEa08eKGJr+AqZdYfN2dRfWuBsmYmSBNhNXBlT67ijNfR1xOU21CmvokQ7uWMGb0mCcnIYeB5F6hRre6DJFKT8m0Vu8G8YFNNRJ0fUu41XtBQD0e2a6jf3P1wD56vH7u9l4Z9z9ZNRdm0h520DDBgTuJoFj6eOgd9NQ2a60OLLInsoEyhzP0HwyEtPvLik84/7oUV1GD8nJMJWLvGWS2Yp98WQRZPpEeeyzs1m6xT6j4i/ar74ausFc1uIo7Upxw86gx4fp2xAOEW1Pzhtn4UMu2+sjyfZ9a+WJ+Lx8hVnGwKCV86RcJxJ6DsxIFMyLci7F8OOLrBtEUy18hYcoZym1oWANmduXdn4aL7zF+zNVovx74dtFXVzcTptnBayeASZCDFxNd+nuCHMEWtVVGiLabmMG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(38100700002)(54906003)(36756003)(66574015)(2906002)(6512007)(53546011)(6506007)(6666004)(4326008)(31696002)(6486002)(86362001)(508600001)(5660300002)(66476007)(6916009)(316002)(31686004)(186003)(66946007)(8676002)(2616005)(8936002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1RTQlluNnhGRnJMWEIzNG52Szd4Rk9kbVJhbElaWW43eHI2eDNncTZqdEx1?=
 =?utf-8?B?dDJFNDRrZjBiUXZkcGFhOCtJS3prZUlUZENzQUxsTVpmc0tNWVJ2UnY0K0Yx?=
 =?utf-8?B?RjVKaXl2cDgrNUVFRkljdmpsUDhnODh4dElkMTJ2MVpTMTdEaFgzY1QvNFNP?=
 =?utf-8?B?b2paaVQ0VUdGQXh5bDNjRWVQRE9IVkRmdzN0d25TZFR2Nk01bjlQWWo4cGJo?=
 =?utf-8?B?ekpWNjRXWEk2cXNSZmQzU3owbFoyVXlxbnF3L0V2dDdvWlNQS3UzMktvRElW?=
 =?utf-8?B?S3dIQ1hPclJmN3NOMmlRbW4yWFFjWkJTWXpxRzdoVDhnK3p2aE1CaXlWVXZz?=
 =?utf-8?B?YmpxblZhUGMzQjdHSFo4M2NIbm9aSmJxWGIyTWN4eHJRcmJhb25VTmFoRU1u?=
 =?utf-8?B?ZSsvZS9ZQmRRNktOZkkvM0ZzRGNneUZYbkoxVUtGb1h0U0tNanZpbytBZjY4?=
 =?utf-8?B?eE1FcmtsSWIwU0NZbHpHVlhBWFFPbDBiT0lDUXBYQlVBcG1RbjRDc0R2YkI5?=
 =?utf-8?B?MzlnTjFUcWpqb3lBSjJKWTFPZjJSa2gzcWp4UkJ6dXBMam5MNG9QWG5MRGFy?=
 =?utf-8?B?eGJucWppL2hSd1RocGVMT0VyOGpqLy9acEV1ZTMxaCtRZWZFMFFGWVFIeDU5?=
 =?utf-8?B?ZEl3UGJiSlJST3dvU2h1WVdjWkZkdFFweEV5UGlnN3lHaFdNVFU4anpWZytW?=
 =?utf-8?B?cHdKelpLc3NHUTJHOGhwZlJoWkdoV05yQ2JBVmNWNzgyVTAvTUVOeVFlWlRP?=
 =?utf-8?B?bzNBSzBEdlo1ejBXVFFVczFhRDlHQUlxNU5sNGVaYUpXa0RmT0gxUEVKZlpm?=
 =?utf-8?B?T0NkRHNHck8zdEptRVZRSE4zdzBXTXNqNVo4QzBkOGlUbS8vUG5yWEVLVEJi?=
 =?utf-8?B?aC9pSTNrQ0N6VTcwcUFzUkx0VEhhVGlEOHd0dVFDek85dFlRd0JaVFFXVU9v?=
 =?utf-8?B?SDZzY0gwaiszK1NsQXhKbG9kNUtJcFVQMy9KUTdaVGtDRUs2MzRSRXNYV0tn?=
 =?utf-8?B?bkFaVHlWVjYwdkZkendTZDMrQkMyZzdjVFJuMnQ5d0s1WlhoTU5GSmQ3SXN1?=
 =?utf-8?B?VzhGN0ErcTNjODZ3dzBISW45N2ZEQXZPdXpUMERGMUFoQU9PZHo5bnJZdGls?=
 =?utf-8?B?Vm1XcGJReUkrSUZ2WW50QW1Gd012bllBcDZHYVlzd0wrYTdRUzF3TzFZU3No?=
 =?utf-8?B?V2plVUhWN1EzZlpGbGtKb3RqbGlkT0NhZUZVcmNEYmEvSUpqbitwUW9EQ1Yr?=
 =?utf-8?B?UDVUeW52SUc1US85SU5jNkExSFpWbGxtU0JHc2RQdFpmbi9JUUJBbWhNVGxa?=
 =?utf-8?B?ejBnTTBsb1pjay8vWHBOMDdoTWNKbDYxZUJIMlBrUUhrNVE1M0NqbHd3T0xH?=
 =?utf-8?B?VnFZT0RNYTZvU0R4RGhaVDJ3QnFGaDEyRlNPNU5TaHZrbDBndGdFZEI0NVRM?=
 =?utf-8?B?cGFyTVlFQTJIWEN6NW1NTzRDMmQwais1QkV2YU9tVkErSmoybU5RVEJkQzNB?=
 =?utf-8?B?N2VXSlpHTkhSZEFldFc4WkFpTVVLKzZKY1kwTzIvemU4b2VIUGZkYWtkYjhO?=
 =?utf-8?B?YWtpeDl5djdBY1JrWWVRbUVCK0k2TnNwTjdQNmx0SkFKc3BsUTE4amJhb2t3?=
 =?utf-8?B?WkUvRStwYnlaMG9xczJ2SU9kV1gyUHQ4ODI3WjlmaVU0R1RLa1g5ZDBJdVJT?=
 =?utf-8?B?ZStzNUlGTlpVQklwajdVdytlbDZkd211ZWJOcGZBeS9zdWVtNjBxSkxIVStj?=
 =?utf-8?B?NEpOb2o1SU1kYXAvbS9BS3E1TWZUZURONEdwOGQxQ3dWNFFFaldHU2dVL2dp?=
 =?utf-8?B?bmd3UUZZQ0NmS1NvUk8zQklOOFV0NUI1b245azFranM2bVpPR0hxSExOUkVM?=
 =?utf-8?B?d2QzVTlhT2szNzRnUHlpV3lCNFFJdElOMkFRUXhYQjd3dVd6dC8vTlZHRnUz?=
 =?utf-8?B?OVk0QTl1bzBDRWZ3K2I5cFVVbGhnK3FjREFpdVZOYVEyMFk0Tjd4dzhJbmJz?=
 =?utf-8?B?Q3dwSmJrT21XQ014eFVkcUxuZEZSL1Uxa2U1dEpHclJXc3lwSFgvek9McUxQ?=
 =?utf-8?B?MkdwUWhzbnZrNXdVTVV3YzVudllzMnlwUkZOMVU0am1MU2VYN1llOWxFVFNN?=
 =?utf-8?B?dGRNR2Z4dnk0RFgzUURleklNcjRJNFhSUlkzOEJCZllIT2dqTzdwMEdwczN2?=
 =?utf-8?Q?+tSzmpSOkabZemFAANZ9mLw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d79250c-b8dd-4064-0d3e-08d9f201bc65
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 10:39:12.1763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0on5fwI8tehM2cZfredkpXKj5zfm5MnaAkdN4O8HOfbONCEakaVSxBGS7zHHN7W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5785
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



Am 17.02.22 um 11:13 schrieb Qiang Yu:
> On Thu, Feb 17, 2022 at 5:46 PM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 17.02.22 um 10:40 schrieb Qiang Yu:
>>> On Thu, Feb 17, 2022 at 5:15 PM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Am 17.02.22 um 10:04 schrieb Qiang Yu:
>>>>> Workstation application ANSA/META get this error dmesg:
>>>>> [drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* Couldn't update BO_VA (-16)
>>>>>
>>>>> This is caused by:
>>>>> 1. create a 256MB buffer in invisible VRAM
>>>>> 2. CPU map the buffer and access it causes vm_fault and try to move
>>>>>       it to visible VRAM
>>>>> 3. force visible VRAM space and traverse all VRAM bos to check if
>>>>>       evicting this bo is valuable
>>>>> 4. when checking a VM bo (in invisible VRAM), amdgpu_vm_evictable()
>>>>>       will set amdgpu_vm->evicting, but latter due to not in visible
>>>>>       VRAM, won't really evict it so not add it to amdgpu_vm->evicted
>>>>> 5. before next CS to clear the amdgpu_vm->evicting, user VM ops
>>>>>       ioctl will pass amdgpu_vm_ready() (check amdgpu_vm->evicted)
>>>>>       but fail in amdgpu_vm_bo_update_mapping() (check
>>>>>       amdgpu_vm->evicting) and get this error log
>>>>>
>>>>> This error won't affect functionality as next CS will finish the
>>>>> waiting VM ops. But we'd better make the amdgpu_vm->evicting
>>>>> correctly reflact the vm status and clear the error log.
>>>> Well NAK, that is intentional behavior.
>>>>
>>>> The VM page tables where considered for eviction, so setting the flag is
>>>> correct even when the page tables later on are not actually evicted.
>>>>
>>> But this will unnecessarily stop latter user VM ops in ioctl before CS
>>> even when the VM bos are not evicted.
>>> Won't this have any negative effect when could do better?
>> No, this will have a positive effect. See the VM was already considered
>> for eviction because it is idle.
>>
>> Updating it immediately doesn't necessarily make sense, we should wait
>> with that until its next usage.
>>
>> Additional to that this patch doesn't really fix the problem, it just
>> mitigates it.
>>
>> Eviction can fail later on for a couple of reasons and we absolutely
>> need to check the flag instead of the list in amdgpu_vm_ready().
> The flag only for both flag and list? Looks like should be both as
> the list indicate some vm page table need to be updated and could
> delay the user update with the same logic as you described above.

I think checking the flag should be enough. The issue is that the list 
was there initially, but to avoid race conditions we added the flag with 
separate lock protection later on.

Regards,
Christian.

>
> Regards,
> Qiang
>
>> Regards,
>> Christian.
>>
>>> Regards,
>>> Qiang
>>>
>>>> What we should rather do is to fix amdgpu_vm_ready() to take a look at
>>>> the flag instead of the linked list.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Signed-off-by: Qiang Yu <qiang.yu@amd.com>
>>>>> ---
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 85 ++++++++++++++-----------
>>>>>     1 file changed, 47 insertions(+), 38 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>> index 5a32ee66d8c8..88a27911054f 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>> @@ -1306,45 +1306,11 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
>>>>>         return flags;
>>>>>     }
>>>>>
>>>>> -/*
>>>>> - * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict a buffer
>>>>> - * object.
>>>>> - *
>>>>> - * Return true if eviction is sensible. Called by ttm_mem_evict_first() on
>>>>> - * behalf of ttm_bo_mem_force_space() which tries to evict buffer objects until
>>>>> - * it can find space for a new object and by ttm_bo_force_list_clean() which is
>>>>> - * used to clean out a memory space.
>>>>> - */
>>>>> -static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>>>> -                                         const struct ttm_place *place)
>>>>> +static bool amdgpu_ttm_mem_eviction_valuable(struct ttm_buffer_object *bo,
>>>>> +                                          const struct ttm_place *place)
>>>>>     {
>>>>>         unsigned long num_pages = bo->resource->num_pages;
>>>>>         struct amdgpu_res_cursor cursor;
>>>>> -     struct dma_resv_list *flist;
>>>>> -     struct dma_fence *f;
>>>>> -     int i;
>>>>> -
>>>>> -     /* Swapout? */
>>>>> -     if (bo->resource->mem_type == TTM_PL_SYSTEM)
>>>>> -             return true;
>>>>> -
>>>>> -     if (bo->type == ttm_bo_type_kernel &&
>>>>> -         !amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo)))
>>>>> -             return false;
>>>>> -
>>>>> -     /* If bo is a KFD BO, check if the bo belongs to the current process.
>>>>> -      * If true, then return false as any KFD process needs all its BOs to
>>>>> -      * be resident to run successfully
>>>>> -      */
>>>>> -     flist = dma_resv_shared_list(bo->base.resv);
>>>>> -     if (flist) {
>>>>> -             for (i = 0; i < flist->shared_count; ++i) {
>>>>> -                     f = rcu_dereference_protected(flist->shared[i],
>>>>> -                             dma_resv_held(bo->base.resv));
>>>>> -                     if (amdkfd_fence_check_mm(f, current->mm))
>>>>> -                             return false;
>>>>> -             }
>>>>> -     }
>>>>>
>>>>>         switch (bo->resource->mem_type) {
>>>>>         case AMDGPU_PL_PREEMPT:
>>>>> @@ -1377,10 +1343,53 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>>>>                 return false;
>>>>>
>>>>>         default:
>>>>> -             break;
>>>>> +             return ttm_bo_eviction_valuable(bo, place);
>>>>>         }
>>>>> +}
>>>>>
>>>>> -     return ttm_bo_eviction_valuable(bo, place);
>>>>> +/*
>>>>> + * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict a buffer
>>>>> + * object.
>>>>> + *
>>>>> + * Return true if eviction is sensible. Called by ttm_mem_evict_first() on
>>>>> + * behalf of ttm_bo_mem_force_space() which tries to evict buffer objects until
>>>>> + * it can find space for a new object and by ttm_bo_force_list_clean() which is
>>>>> + * used to clean out a memory space.
>>>>> + */
>>>>> +static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>>>> +                                         const struct ttm_place *place)
>>>>> +{
>>>>> +     struct dma_resv_list *flist;
>>>>> +     struct dma_fence *f;
>>>>> +     int i;
>>>>> +
>>>>> +     /* Swapout? */
>>>>> +     if (bo->resource->mem_type == TTM_PL_SYSTEM)
>>>>> +             return true;
>>>>> +
>>>>> +     /* If bo is a KFD BO, check if the bo belongs to the current process.
>>>>> +      * If true, then return false as any KFD process needs all its BOs to
>>>>> +      * be resident to run successfully
>>>>> +      */
>>>>> +     flist = dma_resv_shared_list(bo->base.resv);
>>>>> +     if (flist) {
>>>>> +             for (i = 0; i < flist->shared_count; ++i) {
>>>>> +                     f = rcu_dereference_protected(flist->shared[i],
>>>>> +                             dma_resv_held(bo->base.resv));
>>>>> +                     if (amdkfd_fence_check_mm(f, current->mm))
>>>>> +                             return false;
>>>>> +             }
>>>>> +     }
>>>>> +
>>>>> +     /* Check by different mem type. */
>>>>> +     if (!amdgpu_ttm_mem_eviction_valuable(bo, place))
>>>>> +             return false;
>>>>> +
>>>>> +     /* VM bo should be checked at last because it will mark VM evicting. */
>>>>> +     if (bo->type == ttm_bo_type_kernel)
>>>>> +             return amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo));
>>>>> +
>>>>> +     return true;
>>>>>     }
>>>>>
>>>>>     static void amdgpu_ttm_vram_mm_access(struct amdgpu_device *adev, loff_t pos,

