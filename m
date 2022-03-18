Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B9C4DDC2B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 15:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D36310E9F4;
	Fri, 18 Mar 2022 14:49:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9177810E9F4;
 Fri, 18 Mar 2022 14:49:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NE8lyUg6teUxN9pG0bviWxj8zRkrskVCuViWJIZKUCZQo7nUcD92zC9XDQ1k9JDc0vXjR3PBjxu0SkH7ew6fBMxvPysvPaOf94CtI1gWCu3/WZ/upvjhF+uJt8tlonInW0ZIFSk3ZkDzCNpFPH3zJ8YnUag7Vb08Y5Ejf0zXLF9G3v3HtqIVjNDzaCwuHDTkS1X0TVFQmsDeuGNEkvjDn/Yjn+3NqyhQYK5n2mf52JRDRxs3vSsZnyyNNjXbT99mTno0Ks+M4Tb6vQ0uIb/Nk/ihIdXJwZCfNoMpx0OPgV5ERpaFLaqSn0a4GWw7dfRePo0522q9c/rDl2s3nLV/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U16m+Why8nsbUh4MEmKTVYvV/gKwq7nez0CODN2tnL8=;
 b=koOzzL9FiCO7NxisyLMRYPqEdnSXERncU7Cn2D35Ls+7jcLQJ3Tgv+2jBuEwqC506/toB1fJGjPTAwk6ZNx6aIsHHalX2TvanMCQ3sPSKHfVstrHlhN8RJe1WKtTyG6U9KjcY1GSgAm6Q5mUppp/01HDJrbN9U50Lw5Y4O6HTSEIeVFdCOgAyN0gNd/gBxZW3b3LWeBCEmZe1aW068tPsRAg+nViEvFN0ylR7gID61TLoJWX01da8c2oll1HyXlngPrwqMB2uuCqfCYL5WLp6DTJ9117KJWHKHVmHdYdr7o+9g8FTRVJjMWpYRuG9QsqLmiE1RCQOrpmbzgvARmkEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U16m+Why8nsbUh4MEmKTVYvV/gKwq7nez0CODN2tnL8=;
 b=jY8w5iwz5/kFqpefDRRhu700KBfsuu/6NA3ZlJgo/RR/8jM2zdNyjn2HD+MEMQetF0pyJBt3NAkVFXBP41A5p0SfPA6Z3pd6R6NzSLFIl6p3pa6RWNU2rGmVmvSpy4ImiWbEElD0F6u3omRAvA/XQOR4qBB9MqtZyPl+JIqNx80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CH2PR12MB4824.namprd12.prod.outlook.com (2603:10b6:610:b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Fri, 18 Mar
 2022 14:49:47 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5%4]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 14:49:47 +0000
Message-ID: <8755c4fb-482b-28e9-559b-d7ad2ce4c3c7@amd.com>
Date: Fri, 18 Mar 2022 10:49:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 1/4] drm/amdkfd: Improve amdgpu_vm_handle_moved
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20220317002006.342457-1-Felix.Kuehling@amd.com>
 <20220317002006.342457-2-Felix.Kuehling@amd.com>
 <5054ada1-9f2d-1297-5f37-0b05ec2ae37f@amd.com>
 <f9f2bbdb-74bc-e286-07d6-4f1972f0e743@amd.com>
 <74d1b5aa-7cfc-8cf0-b94e-efb19a7f1920@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <74d1b5aa-7cfc-8cf0-b94e-efb19a7f1920@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0092.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::8) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e678bb9-0eba-4bde-9854-08da08ee8c23
X-MS-TrafficTypeDiagnostic: CH2PR12MB4824:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4824243C411E67C33F99CF8892139@CH2PR12MB4824.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xzNhGcQHtqKURV5LbuVAYMA1O0dMxBUBYf0AnAD2SPXxDrT0H8V6SaVC9zZf+EnHOxdHVTOcI9gMAS1wsgj8Tfp+weHdhLZ9mDF5GSGIXLHwvQKC09ehDlPfPnmj5bl90iMvlolVYf7RmDg2h11jAM/zj+pgNJ40DVdbCRqZLo3YzwmBPHyxlAOMEin6FflKtURykQB2O9ISHcw/TGr7JefbF/sfk04+CBQAYDo8L1sIUzDk1hbkYEP1OBxbSeP8oS+ifwUCPcQLSZnvh/OxWj/idxLxpr+VqpEmgWILd9on7s4/zh8uP/zObNARbvbgAF5q8qLXVpV3/EK1JPCblGl+1QTaUHUv+cshHnO0TxUO38VvJ4mX8rnJRk/tERooK6cDfjbRJ56qj8J11HWDxzLgAjl+SHhWdoD9B8slIrZD2znPXpGiOGGgA4pVD0R6VH4AEzCgdBU349kuY8NeFTZFALuXjutPG+0uTJU1iQh4Kw++ihBJ6t6rp0SGYbIIKAiVZ64ah7wXoRD+3dBD/fNGgmn8laSfdCVWDLISlOb3tv6bStos0BQCLjlGjMi+vUdhYX30o3zoDiElWhOZbSKix864845gx1NgHViMO2/n/OhIeopiY/MR6QPIFl2bznbmtLLPG47EpJY/oPM7860uNtYEralCpnQ6ry+33TEEM7BL8Ah4el00nIs/TeiXYDk/0iHPyDJlo2ADjfI+palsC+cqQNoIVIfIRTv3Eyz+GapkZhBba65y5gZ2Uw49
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(38100700002)(31696002)(4326008)(450100002)(8676002)(66476007)(66946007)(66556008)(316002)(8936002)(2906002)(44832011)(5660300002)(66574015)(2616005)(186003)(26005)(83380400001)(36756003)(508600001)(31686004)(6512007)(6486002)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlN3SWltM2E2MFYwdU5rd2JpRi8yVTlUV1V3RHo0bFhmczdKaVQ0NjIwTEI5?=
 =?utf-8?B?YytlSmhEZG5GcTRtYXdaWXVZbGx3NVA5bm0xYm1IQjQ5Tjh2YlEyeDIzMXNh?=
 =?utf-8?B?M2RWRzh5dHZITWZDL2NybjIvZUhQOE5rQitIbElUT3QrWVR0dmVzR2NjYnhy?=
 =?utf-8?B?YkxEc2dZYmhPQWNaR3JyelduWXVwV1YyVnRWSHVoeDVNaGIxTE9qRDZDRGps?=
 =?utf-8?B?QmVRMkxtbnVZQlYwTmZiQStNRzZUTllPMDUwck45QzVzNGR1RFlmcWtucEZa?=
 =?utf-8?B?NEhsZFo0d3B0M0ZPYWFFYis0bmtUSVQzUXIvNGI3TlY5dnlnWlRzbWZwZzQ0?=
 =?utf-8?B?cjJYd1JadXhKdmUyb2JCWWdYOWpiazlFTnRDM3dXZ2ErQmFJdC94Vy8wWlIw?=
 =?utf-8?B?MXMyNXRpZ2psQ01PcVBMT010TnJ0bTBCZTEvM0F4UWN5NFQ3S3pmS2xXdkQz?=
 =?utf-8?B?MVVjYU0yVXA3RXFmQkJDZHRRYUQ2aGl0WStjVkFvbVh5WkJaUXVrcHNwNjZO?=
 =?utf-8?B?aXlSdlJkZ3lUY01oMWs4UmEvQ01vL2VYcTlWdDlOY05VYTFUNE9Dc01senF3?=
 =?utf-8?B?dGQ2ZUpsbks2QThpMDdOV21tOVgyOEQ1Wmk0U0dzbFFWUWFXaS8yTWErRUk5?=
 =?utf-8?B?aDdEQkVJYVErdU5XVUNCeHpYMkthejBTaWRLcTBZV3k1OE14ZXUwWmF6My9n?=
 =?utf-8?B?YXZhcGcxNThlOXRWV2FjLy9jSUd0UzFyb0RNMnF5b3ovbk01V2VQd1RkaHZ1?=
 =?utf-8?B?N0lrR0o3a2NZdzZzblFnR2FpcjBORWpUVXBJU3kvdUR5YlBHU1hRdFVrcmpu?=
 =?utf-8?B?MnUwZ0ppcEl6aUl5QWc0ajc1ZUNVbmZrOWorN2NVaGgvUGRGZ0VVdXFheHdU?=
 =?utf-8?B?WENVbi8rRzlteXNHWWxFQldUOHdsNmhEd04rdWRiVUl3UG0wbm50NCt1V0FB?=
 =?utf-8?B?TVhaWExoZkpGbWZqUkI5eFpwVWU2YmtVeUxXOWZ3VU10RnIzVEVNYnN4SHA4?=
 =?utf-8?B?OVdsYlpKZEtHRUMwMVhFL3kyaFpDMzMwQU4xVXllOGllTzR0SXJRK1E2K0lt?=
 =?utf-8?B?Sk5kZm9XeUpNVE9HNWk4bTlyNGZyOFE3R2JVNjRMcFFSOXpvVjBHcjZGQTg1?=
 =?utf-8?B?WlNiL3VlMGYrNVljb04vSnRWdnEybk9hMEFzVmg1SjA1WDRiL0JkaElHc3RN?=
 =?utf-8?B?R0R4ZHBMMngvTWVDVS9yT3BGU1pTVVZ3dkVOLzhJSXhaQnRuL2x3dDRoTm90?=
 =?utf-8?B?S2xucVd5OVA5bGMwMjNDV1FkejViaW5KUUl3RCsyOFpRSXkvQzBRSVM4YjIz?=
 =?utf-8?B?Z0ZSUmFJY1FZUDZwSnJKbEJaK3V3QnpQbFgyK3Nuc1ZKZE1VR2FESm1rVFgy?=
 =?utf-8?B?QVBrRWp2RkxFZlNPYkxCM1pkZ1NXMW15VUQ3aWNQT2k3cXVTVWVQSU1yZWw1?=
 =?utf-8?B?Q1V3MWsrUlVjUzBTV2tqN1hqUW5TVFBpa2NhTE5QWnE5NE9VTGdaNWZZVElF?=
 =?utf-8?B?N3ViUzBxek9nakNUdjlFalhURHRETjdxVnAzMlBGOFhVcElBTXROcFNiZ0xD?=
 =?utf-8?B?TWJmTFIxRUtnQ2Z1UUNYb2dhK3RBaDI3RjJVcDNCL3JHd3cxZmg1bVJKMEJn?=
 =?utf-8?B?YmxyT0tybzJzZUNoZ21LS3BtNFNIclJsUUt6Y2FCeDRkRXFpaDBPRm45Zndz?=
 =?utf-8?B?RzNkeUNEMytqZFRzSktFMktTNU52T0NSbnhGeXYwTjZ5WEhyOTY3UEVpT21V?=
 =?utf-8?B?S0RtR0NNNmMweXV3UXJNQWVuT0ZreEgrUThRbWlpZURtRy9DYnd3OW9Udng2?=
 =?utf-8?B?amNyWFVjQ2E3a2JnWEQ5cVN5VVR1L1VWL1Jjc0FFVytSdVdrNXZOdWtnT1hX?=
 =?utf-8?B?c3JxUjhYOFRsekE0TWFaNUc5THNkNHFIS29uZG5KNGFpeFRFeWFVMjEwamwr?=
 =?utf-8?Q?tK4EKMS2F1tkkldhFXgx1j+s2YPVY3il?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e678bb9-0eba-4bde-9854-08da08ee8c23
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 14:49:47.4602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqDjroKyO0RFOgdxEtqV+8hueoi7eNySiOeTt/kPfoppAU8X18XYCycyD04NA15R69k2TkrryXfyrlUHtEzPQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4824
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-03-18 um 08:38 schrieb Christian König:
> Am 17.03.22 um 20:11 schrieb Felix Kuehling:
>>
>> Am 2022-03-17 um 04:21 schrieb Christian König:
>>> Am 17.03.22 um 01:20 schrieb Felix Kuehling:
>>>> Let amdgpu_vm_handle_moved update all BO VA mappings of BOs 
>>>> reserved by
>>>> the caller. This will be useful for handling extra BO VA mappings in
>>>> KFD VMs that are managed through the render node API.
>>>
>>> Yes, that change is on my TODO list for quite a while as well.
>>>
>>>> TODO: This may also allow simplification of amdgpu_cs_vm_handling. See
>>>> the TODO comment in the code.
>>>
>>> No, that won't work just yet.
>>>
>>> We need to change the TLB flush detection for that, but I'm already 
>>> working on those as well.
>>
>> Your TLB flushing patch series looks good to me.
>>
>> There is one other issue, though. amdgpu_vm_handle_moved doesn't 
>> update the sync object, so I couldn't figure out I can wait for all 
>> the page table updates to finish.
>
> Yes, and inside the CS we still need to go over all the BOs and gather 
> the VM updates to wait for.
>
> Not sure if you can do that in the KFD code as well. How exactly do 
> you want to use it?

Before resuming user mode queues after an eviction, KFD currently 
updates all the BOs and their mappings that it knows about. But it 
doesn't know about the mappings made using the render node API. So my 
plan was to use amdgpu_vm_handle_moved for that. But I don't get any 
fences for the page table operations queues by amdgpu_vm_handle_moved. I 
think amdgpu_cs has the same problem. So how do I reliably wait for 
those to finish before I resume user mode queues?

If amdgpu_vm_handle_moved were able to update the sync object, then I 
also wouldn't need explicit amdgpu_vm_bo_update calls any more, similar 
to what I suggested in the TODO comment in amdgpu_cs_vm_handling.

Regards,
   Felix


>
> Regards,
> Christian.
>
>>
>> Regards,
>>   Felix
>>
>>
>>>
>>>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>
>>> Please update the TODO, with that done: Reviewed-by: Christian König 
>>> <christian.koenig@amd.com>
>>>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |  6 +++++-
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  2 +-
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 18 +++++++++++++-----
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  3 ++-
>>>>   4 files changed, 21 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>> index d162243d8e78..10941f0d8dde 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>> @@ -826,6 +826,10 @@ static int amdgpu_cs_vm_handling(struct 
>>>> amdgpu_cs_parser *p)
>>>>               return r;
>>>>       }
>>>>   +    /* TODO: Is this loop still needed, or could this be handled by
>>>> +     * amdgpu_vm_handle_moved, now that it can handle all BOs that 
>>>> are
>>>> +     * reserved under p->ticket?
>>>> +     */
>>>>       amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>>>>           /* ignore duplicates */
>>>>           bo = ttm_to_amdgpu_bo(e->tv.bo);
>>>> @@ -845,7 +849,7 @@ static int amdgpu_cs_vm_handling(struct 
>>>> amdgpu_cs_parser *p)
>>>>               return r;
>>>>       }
>>>>   -    r = amdgpu_vm_handle_moved(adev, vm);
>>>> +    r = amdgpu_vm_handle_moved(adev, vm, &p->ticket);
>>>>       if (r)
>>>>           return r;
>>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>>>> index 579adfafe4d0..50805613c38c 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>>>> @@ -414,7 +414,7 @@ amdgpu_dma_buf_move_notify(struct 
>>>> dma_buf_attachment *attach)
>>>>             r = amdgpu_vm_clear_freed(adev, vm, NULL);
>>>>           if (!r)
>>>> -            r = amdgpu_vm_handle_moved(adev, vm);
>>>> +            r = amdgpu_vm_handle_moved(adev, vm, ticket);
>>>>             if (r && r != -EBUSY)
>>>>               DRM_ERROR("Failed to invalidate VM page tables (%d))\n",
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>> index fc4563cf2828..726b42c6d606 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>> @@ -2190,11 +2190,12 @@ int amdgpu_vm_clear_freed(struct 
>>>> amdgpu_device *adev,
>>>>    * PTs have to be reserved!
>>>>    */
>>>>   int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
>>>> -               struct amdgpu_vm *vm)
>>>> +               struct amdgpu_vm *vm,
>>>> +               struct ww_acquire_ctx *ticket)
>>>>   {
>>>>       struct amdgpu_bo_va *bo_va, *tmp;
>>>>       struct dma_resv *resv;
>>>> -    bool clear;
>>>> +    bool clear, unlock;
>>>>       int r;
>>>>         list_for_each_entry_safe(bo_va, tmp, &vm->moved, 
>>>> base.vm_status) {
>>>> @@ -2212,17 +2213,24 @@ int amdgpu_vm_handle_moved(struct 
>>>> amdgpu_device *adev,
>>>>           spin_unlock(&vm->invalidated_lock);
>>>>             /* Try to reserve the BO to avoid clearing its ptes */
>>>> -        if (!amdgpu_vm_debug && dma_resv_trylock(resv))
>>>> +        if (!amdgpu_vm_debug && dma_resv_trylock(resv)) {
>>>>               clear = false;
>>>> +            unlock = true;
>>>> +        /* The caller is already holding the reservation lock */
>>>> +        } else if (ticket && dma_resv_locking_ctx(resv) == ticket) {
>>>> +            clear = false;
>>>> +            unlock = false;
>>>>           /* Somebody else is using the BO right now */
>>>> -        else
>>>> +        } else {
>>>>               clear = true;
>>>> +            unlock = false;
>>>> +        }
>>>>             r = amdgpu_vm_bo_update(adev, bo_va, clear, NULL);
>>>>           if (r)
>>>>               return r;
>>>>   -        if (!clear)
>>>> +        if (unlock)
>>>>               dma_resv_unlock(resv);
>>>>           spin_lock(&vm->invalidated_lock);
>>>>       }
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>> index a40a6a993bb0..120a76aaae75 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>> @@ -396,7 +396,8 @@ int amdgpu_vm_clear_freed(struct amdgpu_device 
>>>> *adev,
>>>>                 struct amdgpu_vm *vm,
>>>>                 struct dma_fence **fence);
>>>>   int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
>>>> -               struct amdgpu_vm *vm);
>>>> +               struct amdgpu_vm *vm,
>>>> +               struct ww_acquire_ctx *ticket);
>>>>   int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
>>>>                   struct amdgpu_device *bo_adev,
>>>>                   struct amdgpu_vm *vm, bool immediate,
>>>
>
