Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 890D566C2B6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 15:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409A810E450;
	Mon, 16 Jan 2023 14:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2088.outbound.protection.outlook.com [40.107.102.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FF810E450;
 Mon, 16 Jan 2023 14:52:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ez4BEmYnt3uy1pFNZUFiiTgRgaAZsn9UalT4Bce4nm+p2upd1npj+nuuu1ZV8GaU+9IWM+3pWgaRcAEg6lAcAF8pcjwAn+iMYT3Rlh4nUFJ2tuxQZXiH30FYCUvOxR4dbhUnsLmAX46XoAs1wRmR1qr2PT77AZs2kDpIaALGeTfvDXc9GvrGHKoa76KK5iqoXk9Djh0h9nwACA5NUXcQDOkkdNwGGA/Qx9ju8VG7EaqEKl9Ckoq5+IakR+Cw/GwkA3LSIl6V1jHMc2CtQUQUrXLIFIK8NK74MVuQf/CCrNuRiYuVKGlO4t7Ky3qLmuSJaa8GuqRNkWT95MC6i/t0gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmVfwfEaJoymxtDeCs80DRfjrpNv/RznfBqVohh3Yc8=;
 b=h7oA/yxEks0DrCTjhbb/2rntNyK48OOhn16EmhwnH+xZBoDcDHMNVnS8pY5jLsc0uVlphqIHbjF7VNCdd0ItnnnAUv0djzJXpGkcN7nEPyLaa0lH6OmwHAaTn5+J5FIjGu//pyw3SBqsvrS/W4rN/LxIqL76+jj3Q9mrYDT92+mrai8jctBOj8G/5EDkp0J8aetoj8EvD3ZlTs9gkcUVJ6avhnj+nUidH50U4VdbO3xz/1xYitT9a6mGvO1jLKLjsmfW4cBNJTPC9gjGMr2qVjB8GcIyKVczoFSowCPk5svMO5NDI22Yt4fPbN+OActJGGcZkcWHQA4Ai29P09smww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmVfwfEaJoymxtDeCs80DRfjrpNv/RznfBqVohh3Yc8=;
 b=FojSqXN7g7hoZJNdk7jKn6JwU9PZQvrTfSO9/IypXeRdzMQOYKaJHRbb5JFrOGD/sgPtFBK1O2mhYWynOmMRkilsSD0FKuVUkzl85oF/hvojF8J/Ly89su5+QKPcfShaTcoYKhT9e3ubADo3kOTq4LJFl+pP8fAYBQ+Ki5zbeoo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB8523.namprd12.prod.outlook.com (2603:10b6:8:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 14:52:32 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::c3f5:aede:fa4d:5411]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::c3f5:aede:fa4d:5411%4]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 14:52:32 +0000
Message-ID: <b5101ba0-aa12-b3f1-10c0-368dc50ae4ac@amd.com>
Date: Mon, 16 Jan 2023 09:52:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/6] drm/amdgpu: Generalize KFD dmabuf import
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Chen, Xiaogang" <xiaogang.chen@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
 <20230112013157.750568-2-Felix.Kuehling@amd.com>
 <cab37a40-9737-1b77-3a3f-87965d4c70b2@amd.com>
 <9b5b20e0-e04b-f7f6-9459-42d5a4bb44c7@amd.com>
 <1437874c-4b4b-191f-4486-de6ac69e99cc@amd.com>
 <19873c87-5d01-30dd-84d2-ced61b236fa0@amd.com>
 <27d2a3eb-541f-fd5b-6a92-77e49c74d1b4@gmail.com>
 <e55cc02a-3180-20b9-8255-f95f5910e7fe@amd.com>
 <bac027e4-0e91-8341-3baa-74520c60c808@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <bac027e4-0e91-8341-3baa-74520c60c808@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::26) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM4PR12MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d4134f-87ae-47f4-625f-08daf7d14baf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EitWpjLlvVyGGAORCyaWHMiak7JYouBCsSuVom2bHMZ2rIn0UlYhnPRO/hTFQj0+qMXZazI5bfwARO+f5q8YKgBL/t47NbfmbUh1lzEjXa8oPvAN6KKTiLj6Op/AlCI+wVuA8oaH0lQ3pl0Vddml8Ny4PnvBQXO4KjVra6wkYeaCJCK7m+z8um36ddwcITfu0zmHIK5g/PP2wt8sBmbKjcq1JlndwAAgtvYgrrqOh7CG4yBwI31ML7loQSGZN1DOnzq6hZ4gK8H+XiJW71tjv71qd3nHwn6+JgSNulXVjWakf3tw90RhCItK4UxXlNffHRF9z0UWJeFhIzpPUHsyqJnPbyAO6mDPeBJ0T4i6fsmvH1Pxi95UOy1aJ683NJ61vitB4TUlFy6mnkA5MkQfdr3KdQkvnBeK+SyC+/xIum5xrFO2m14tsxJ9DolLEhZua5B7I9lOVc9u0YDNtzOn6hukITCrPy9XgGwp3yX4/3K+FWNeAp3fDgMwKxjN3FbKLYwtfbA8Y/73vRy9IiyKMa6h5MDRARTgolPIQpVcQiCdazA1PQJ1tFlAX3sSzn1qTutpSEVORIDjHv1wYRxabtLBCoGcOdY57aH8UKOF98Z8UWpHleMMDxVx3HuzOfrTaSWZHqLMBWQD2Dn5TpqEiyJTLRC6bLrT7FSpl6RXuBV/h5tHZ6bZsEu+Lw2BxToH4cojsgojkhgNjl2q9bSKIb2qBQ7QWO9Rq/yPAddj9Co=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199015)(38100700002)(86362001)(6512007)(186003)(6486002)(26005)(478600001)(110136005)(31696002)(36756003)(2616005)(316002)(31686004)(44832011)(5660300002)(66946007)(2906002)(6506007)(83380400001)(41300700001)(66556008)(66476007)(8676002)(6666004)(66574015)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDVPT1laeFNaaDVCR3hyS252eFM1M3oyY1VPTk96bm01bm9ORHl4ZnF6bmdH?=
 =?utf-8?B?cE5QSGk2M2FtblR2cTlwbGxsSGNPRlExZDYxK2Z3ckJjSTVQNGd1bTlUR2NC?=
 =?utf-8?B?SEhvWnMvZkxVZWlSMzgzRTU3UDIyQVYwREdwYWdUMVFYR0RSbEh6dUNIbTB4?=
 =?utf-8?B?dllUM3JOY1QwaXIzaXJaL3pyTGkwWWFWUUIvTmJKSERFY0dKdmlZeSttNXli?=
 =?utf-8?B?dEVSeEV4Q0sxKzg1clVWN1B4dXRwaEQ0TW5ZTExSUFhqdVk5WXQ4dlI5dmdV?=
 =?utf-8?B?R0tMYWczREhaYmNQZWJNY0VZaWJMc29kaW9TbjlSTGs1eEt5TGlQV3ErcnVv?=
 =?utf-8?B?TU02VHlNT3dwczB2MUJvdUt2TTl4SzZIVi9XVmYyZDh4TVR5a1g1Y1I0Sjc3?=
 =?utf-8?B?MUp0bVRPTVJmeHMvSnQ3RjZyYk1ZZWJqS1lzUzlISExCWUdsbEpJRnVZWXJ2?=
 =?utf-8?B?TXZNVXBYUWdhQ3I3NXR2dzkzeFQ3blp4Q01Qc3BDM2hrWjhSSlVlazRGUXhD?=
 =?utf-8?B?bVN3R2c2MWExdVI5blhpVjFGR3JvZGV3dlJQVVdqVHVhYlUwOTd4TWtNUjVK?=
 =?utf-8?B?ZWRiSFRsZWJOQ1BTM1RrcGRRQ1BSWjN5VThVb2c3d25pZUxxdkNOTTlPbTBj?=
 =?utf-8?B?VUx0VFdpcUU5U3JRZ1RsR1l1TUxKQnArbkMwQjJQdmtkYWZIQzVIWk40d1d5?=
 =?utf-8?B?UGtlYXNaekREYzg0RWJzVEduQkQrWlVUWmdwT2VoS215MTU2NnlIWkNoV3B4?=
 =?utf-8?B?TjNENzBHTlMrd3ozY0l2Z0VUS2tUWWZyU3ZlTWNwTnlreUl6ZXR6Z2FieFJ3?=
 =?utf-8?B?ZUU3RjRrRjFmYjRHZlhwQWFiNXhOZ21JVm9wNlh6QTloOFIrZDlKZ3BQSmJk?=
 =?utf-8?B?SFEzalFFRVY5NlZKN3BqQ2hBd0gzNUkrTCtVM2psMC9rRTh6ZFM2RUdTR2sw?=
 =?utf-8?B?TXhPcVlKdzlZd2NNYjdEa0l4Q1lpTkV1OW9PeGJjdzZsNkI2MThGTHczcGRG?=
 =?utf-8?B?Qk9HcE1qOTBlL2IzUC8vL1JBT1h6bXBFRXpKQkk0eXZodFNuTE5aYjh6MlhE?=
 =?utf-8?B?dVZIdUgzSFczM1lWQ2hOcEp2QW14QktqTE5EcmZyeWwxVXlucVdlTDliTXF5?=
 =?utf-8?B?cVNuTFhqNytyU0c3cys3TWFHblEzZ2piV2gvSHkrR2swclpJY0lxcHRuWXBL?=
 =?utf-8?B?ZWs1eU90QnVZTHMzMHdYN1dpQ0VhOU9HTzkyY0dDb214enZjRGJibUpnemI5?=
 =?utf-8?B?UndSczZTZ21xc0xjVmFzR05xR2xtTHJwMHY5dDEzaDdSbnNZaG5iVkM0ZU90?=
 =?utf-8?B?Ly9KWUt3aGdicEJnT253YmVlcXFKM1FDK2VoWWxtSGxDR0FZc2RkWWRZU0t2?=
 =?utf-8?B?VVVBR1FRNUZuUkZPNDR2R1lJQzdLK2tBUjJEMFhaeDUybm5yZUUwL2dyVnNE?=
 =?utf-8?B?M3pyWEFxVUFHcFJPV3JJU3BQSkllM2x2MUY3UzlNcXRHVGVyTTNtT2xRUzhy?=
 =?utf-8?B?aWtObXA2dTFGMkdhd09JaXZPZnp6OU52d3VrcXJQa0dlSXphaE9yTms3anpY?=
 =?utf-8?B?SWNwNVpvMUpCUEdjMzFVNDE5K3RoRld4UmlUQTVPUklOd3plN0VKSExWc0VR?=
 =?utf-8?B?Qit1QmUra0RtV3BsNUVDTHQ5c2lkcHlFdEJHdlZ0eWRmTm00ZjkxSHZzeVE3?=
 =?utf-8?B?TW5kSnVETjBGOVJDTEtkTTYyQXl1QzZwV05pdDBnbzJVVGs4cEpTWG0vbVB3?=
 =?utf-8?B?RFFaaVZILytXVEZ0UWc0WVUwbnVpQ2hJY1kxQUhBZmdHWVpicjVqeXNXdEI5?=
 =?utf-8?B?UXpWdGgzZG83RnlicTZhUkNIUEhCM3VtZUh4K2o5cTFaRDJqdlJIblJCNmt2?=
 =?utf-8?B?Z2RvVXdKK09JQXZNbVJVNXFhVzBZRThCQ2Y5ZERFRG5QVDVHNTdrSVh2blQ5?=
 =?utf-8?B?eU1EZktZYWVuaUppUzJEMjdHM2hVSzJrMG9pZFowclZxQnNjdGh1OTNyMHUv?=
 =?utf-8?B?aTlVQUxVeEhiWHdzWnpmbmdkV09iSlR2d2xJb3liRkpoUXV0WE5GeGgxYU1Q?=
 =?utf-8?B?RkUyYXpRSm1FYkFycGZJQklMTklUR0RvRm1nYktKUFlMa3l2TVk1Wlk1Tzlp?=
 =?utf-8?Q?88ZO9Kp0uhdP0elI02W3HbKxD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d4134f-87ae-47f4-625f-08daf7d14baf
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:52:31.8076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1c3I24knGcb/57ByemvJGGycIP5B+fBfUoofeGew9j/uG+iVQQIqE6ck2+mAmyEsFTWWebDFMVPzmOtK8ejf/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8523
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

Am 2023-01-16 um 06:42 schrieb Christian König:
> [SNIP]
>>>> When the BO is imported into the same GPU, you get a reference to 
>>>> the same BO, so the imported BO has the same mmap_offset as the 
>>>> original BO.
>>>>
>>>> When the BO is imported into a different GPU, it is a new BO with a 
>>>> new mmap_offset.
>>>
>>> That won't work.
>>>
>>>> I don't think this is incorrect.
>>>
>>> No, this is completely incorrect. It mixes up the reverse tracking 
>>> of mappings and might crash the system.
>>
>> I don't understand that. The imported BO is a different BO with a 
>> different mmap offset in a different device file. I don't see how 
>> that messes with the tracking of mappings.
>
> The tracking keeps note which piece of information is accessible 
> through which address space object and offset. I you suddenly have two 
> address spaces and offsets pointing to the same piece of information 
> that won't work any more.

How do you identify a "piece of information". I don't think it's the 
physical page. VRAM doesn't even have struct pages. I think it's the BO 
that's being tracked. With a dmabuf import you have a second BO aliasing 
the same physical pages as the original BO. Then those two BOs are seen 
as two distinct "pieces of information" that can each have their own 
mapping.


>
>>
>>> This is the reason why we can't mmap() imported BOs.
>>
>> I don't see anything preventing that. For userptr BOs, there is this 
>> code in amdgpu_gem_object_mmap:
>>
>>         if (amdgpu_ttm_tt_get_usermm(bo->tbo.ttm))
>>                 return -EPERM;
>>
>> I don't see anything like this preventing mmapping of imported dmabuf 
>> BOs. What am I missing?
>>
>
> At some point I really need to make a big presentation about all this 
> stuff, we had the same discussion multiple times now :)
>
> It's the same reason why you can't mmap() VRAM through the kfd node: 
> Each file can have only one address space object associated with it.

I remember that. We haven't used KFD to mmap BOs for a long time for 
that reason.


>
> See dma_buf_mmap() and vma_set_file() how this is worked around in 
> DMA-buf.

These are for mmapping memory through the dmabuf fd. I'm not sure that's 
a good example. drm_gem_prime_mmap creates a temporary struct file and 
struct drm_file that are destroyed immediately after calling 
obj->dev->driver->fops->mmap. I think that would break any reverse mapping.


>
>>>
>>>> mmapping the memory with that new offset should still work. The 
>>>> imported BO is created with ttm_bo_type_sg, and AFAICT ttm_bo_vm.c 
>>>> supports mapping of SG BOs.
>>>
>>> Actually it shouldn't. This can go boom really easily.
>>
>> OK. I don't think we're doing this, but after Xiaogang raised the 
>> question I went looking through the code whether it's theoretically 
>> possible. I didn't find anything in the code that says that mmapping 
>> imported dmabufs would be prohibited or even dangerous. On the 
>> contrary, I found that ttm_bo_vm explicitly supports mmapping SG BOs.
>>
>>
>>>
>>> When you have imported a BO the only correct way of to mmap() it is 
>>> to do so on the original exporter.
>>
>> That seems sensible, and this is what we do today. That said, if 
>> mmapping an imported BO is dangerous, I'm missing a mechanism to 
>> protect against this. It could be as simple as setting 
>> AMDGPU_GEM_CREATE_NO_CPU_ACCESS in amdgpu_dma_buf_create_obj.
>
> At least for the GEM mmap() handler this is double checked very early 
> by looking at obj->import_attach and then either rejecting it or 
> redirecting the request to the DMA-buf file instead.

Can you point me at where this check is? I see a check for 
obj->import_attach in drm_gem_dumb_map_offset. But I can't see how this 
function is called in amdgpu. I don't think it is used at all.


>
> We probably need something similar when stuff is mapped through the 
> KFD node. But I think we don't do that any more for "normal" BOs 
> anyway, don't we?

Correct, we don't map BOs through the KFD device file. The only mappings 
we still use it for are:

  * Doorbells on APUs
  * Events page on APUs
  * MMIO page for HDP flushing

The code for mmapping regular BOs through /dev/kfd was never upstream.

Regards,
   Felix


>
> Regards,
> Christian.
>
>>
>> Regards,
>>   Felix
>
