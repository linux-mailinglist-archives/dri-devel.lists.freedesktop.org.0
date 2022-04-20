Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEF650892C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 15:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F75910E8F4;
	Wed, 20 Apr 2022 13:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBFC10E8F4;
 Wed, 20 Apr 2022 13:23:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noQm8Gs7SfeuiPv8EUko1W3B4XoI+auib05OtYubHJ50SL1ZlbhFsrsDUQy8y2vhapegqaBq13c3mOQkLl0ooigm7Am+h2YeUFgnNJMfCHB1FuNMLwGmRLSQKLa5ZzCYtBjrfxP6BAURz+SqhE/JKsfShYEykVOZ79hkzvjXbh6LT/yp4jYmx424NNd7wz81QB7ZY9VSAhBTTp/ki5ekHnFbWXlpA9IzpzRL02LreDn4vHo0WBBcyW1cAHsWozeVwgg/g3B8iaBRADgcCjl4ifhHzi6uh3XVw9bseoYU3admTJwvn6Z5Ct5W4RyOkP9770RvN985ODb3JGtqyAADpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DN/4ecGZjWcAsDppPw/ffwbVAXHDayAUdKtM5M/RhJs=;
 b=SHO6ylIO5RBrLimst15NYyp/4LXwc5y64I58XD+v9idxcvDtuAF75qZTozDuLUVHeIIFyHFQGukG0yC0gJOKNHRCMKzlbWwhkz4cOIU5bPim4vaLS0MUygl3v6zSnFcflPZhZ3+rduTWrhTsTM78luy1MLJyWe1HGR9QXzZHxDNWp1cibS0TsdgZR8bOvRGIcvlfjJ0BDZZA6Qj7GpEMl+H94jwc6hXaILxh3XhwK0Oah78WXhrhz/h/+EhBOmmykMxlgT+6TtR/JRoDTHUrI4VfYbh+0/YdgHcDTEgFQua9SWGqx1EgomsNBxbIYuFBkj6OgQI5S3KqkgFRHMpimw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DN/4ecGZjWcAsDppPw/ffwbVAXHDayAUdKtM5M/RhJs=;
 b=HOVdxQM5vFqDjTJfLkTxybtxTRyYdL0w9k5P4ca62DbfWa+TULHUDAqmOs7hmIFu0PnJg+OZ3ZvR1SpKGMbwWd6PSdpQx+8D8uXShbegPzDPmcApmq+etSJYoz9vwLnJYR9aFLc0bFQVP3PL2wJ+L79LB+E2cZNelj/GrQaO/uY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by SN1PR12MB2446.namprd12.prod.outlook.com (2603:10b6:802:26::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 13:23:25 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::88f5:b843:e848:fcf]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::88f5:b843:e848:fcf%3]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 13:23:25 +0000
Message-ID: <b5f6cd30-d7c7-c615-9723-68746e35b4de@amd.com>
Date: Wed, 20 Apr 2022 18:53:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmalloc
 limit
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20220420085612.1664787-1-KevinYang.Wang@amd.com>
 <00dfec71-cf38-d6d9-8775-0ae88f59224e@amd.com>
 <CO6PR12MB54733101E19842B59668482B82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <65ef352b-59c8-e802-5285-afc59e56fa9b@amd.com>
 <CO6PR12MB547340CB065269B1731812B182F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <572ed15c-b47e-e7b3-850a-cb0d5259af04@gmail.com>
 <CO6PR12MB54735D4B8E05AB1C17D356AE82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <71f3ac77-b6ed-e503-8e05-dcf9d2c2811a@amd.com>
 <CO6PR12MB547334A5A8E66A578D131C6D82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <075258d7-16af-a664-0406-2b2862efe05f@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <075258d7-16af-a664-0406-2b2862efe05f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::18) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c975630-7e15-47f3-06e3-08da22d0f30f
X-MS-TrafficTypeDiagnostic: SN1PR12MB2446:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB2446E283DDA169233CF6873397F59@SN1PR12MB2446.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jenw87oS4swxe0Ar72tbNmkhT7KY3BpKKGHExyYjlI9a7zz/M4/DLRlbjQzNFvTZzDJW3HCLGroPQ3pNSBk1RQMJmO4A4UJym8IQa6BXcPUWS4JUERF1w4UdXHLdAP85eDZOXiVaG2DIEI+PrH3nRwzzGQRjLjUjaquUEtR7uFovSE2pTB73P9OLk0Q2a4WZ8FL14d7InoEW1LrdaVVOWd+KtCA09sb3joUgKx5jD/xNeJSM4wfVb9VovHS02yrTdsf5h8UwRfnMlUQDOv81ZHUHL/xqVc/vaodEandaGUG0LLCNo/e7e41bDl3D3nm95IdjKE8ywqkWjgOyI0ZqOG6kG3WCGryWEpt6nGh87W8+iGetaEk/6sg4x2EJl5QEveMET7Vy09MNTAN+/MLGKUisA9TfCPCof25RF/8Yw5fDewugEUWanZbUkXMZi/sKVhLmE1z1aZq4Llzk9LpomSWl7pLHM67fnMDl/xjG2DU6Blj1VWXzRMlXtkCnqcHf5VGmPnhRIsqOp4OXeGymqXIHBjuu3WkZDOQUKL5sNURwkhT65NmHZZuMJIVYQHrGWiJhyf6MCt6szo8DX1RrU/0bu6Hr+XLJqyo9Kyzlp+BSEAYudvWQ+pv2/Pwep/SAln4t5Cp3/51Q0fkFw+ye01jZpj4UazxsCJvxXgVsjqhANbMZShBcXTHLfdxo/St328sN/qjDZtEreIuO0DVI1Sj7YKXkn/WVm/lOv4nbY1ouKSTvIgLreavDzx0KJuz10fKQhtlaX/U3hFle4GKdrmUqP0tQqbC03trvmtah1ezTsX3FtiXfxT/89h3+zPaPfMyUmio2JMrxfPsNNN4I7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(66476007)(66556008)(508600001)(2616005)(6666004)(38100700002)(8676002)(6506007)(6512007)(110136005)(45080400002)(53546011)(66946007)(26005)(86362001)(36756003)(2906002)(30864003)(5660300002)(31686004)(83380400001)(186003)(316002)(8936002)(31696002)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aldWT3hTYjQxK2ppSFh3R0VJQnk0U0JIRHdUck94RTU5bThmRFBPUVNmY2M3?=
 =?utf-8?B?Q3dtd2QzeHN0SzNoWFFSV0IwSGl4RDZUbEhoeUNUb0tTR3FmSmtFdlBvMFJH?=
 =?utf-8?B?Q3NaelUwK1hDendYMnlCZFdNVmUwTjRyT2ZCT0ROaWVaM0dGU1Q0ZU5yS25P?=
 =?utf-8?B?c2ZWNDZMQXZMTHJnUnVYL2hJTVZoUjVzNENYdXVSRC8vb1VqdnR6RVM0OFRr?=
 =?utf-8?B?am9GNXdhbzhzOUZVZUFNTFJQOFVwVERiL0s0MVloaHUrWjlmVlZFTFZybEMw?=
 =?utf-8?B?S2lWUVBTL0k5QlZhU2hrQ0NMUnNvSVp4dGVSREtVR0lrSmdIc0xBV2RGSWIx?=
 =?utf-8?B?MmsvbzJBMEl5VmphWWw0OExsVzZ6b0g2ZVROUjZ2Y2lTVndqd29wZEd6bDht?=
 =?utf-8?B?YTRuVlh5K204SlN6Zm01QjJIRmFFSVhtdTZCVTQySVBIekZVbjFvRHR6Yllk?=
 =?utf-8?B?d1ZlMkFZbkJLeS9LNGdlTmdBSDNpa1hXZElRL2pFazBrMzVPYnZGM215RjMz?=
 =?utf-8?B?ZGtWQWx3UjVRbEN6eTdaM1k4SkZQZFQrMmpkM3ZSRjBodVUzV2pBd1F2dE1N?=
 =?utf-8?B?MHc2c2lFSjZvMDFhVEw2eUpnOW1UcmNZQ253NnpEZFNCQWUya2Y2eFQ1NmZZ?=
 =?utf-8?B?YitUdVVPTXpkREx2MUZqaEpqQ08yQSs1dy9EWVJlMzFpY1EwUUdlOEtnVmUv?=
 =?utf-8?B?T1J1M3U2RWJZdHVFRldmaHBzZGN2ZHphZzhramN3Q3B0Q211M3FHTUZDMHI3?=
 =?utf-8?B?UzJvbytPSmV5d0VzT0RCcnc0QXhpVUs3ZkljQ29wMVVlVkxmU2p2T1Nya25w?=
 =?utf-8?B?S1JKbnRqOFM1ZGRObW5SYzlzWXZid1NHMTFyWUxPV29qaXlVK3ZrblBkQi94?=
 =?utf-8?B?QzYyNVhiOUJTNHpmR3dRY3oxWFJTMFNjbHN0cE9aMWpLWUhpdHBRZXlFb2J6?=
 =?utf-8?B?MVV2elVKQUxGM05PVDBWb2JiVlh4TjNWN296R1lvbnkxajU4d3cwUmhrTEFr?=
 =?utf-8?B?YVNJc2t1VXhGamY1VkNPeDc3TXFmSXRMZGNwRFJVNlkrUkdYNVZKaldTOHpE?=
 =?utf-8?B?NFJEcGhGelZXUmJ6Z0tDZHNZNWV2cWo5L2tNNmNMRU9FUDY2eVl0ZVBtZk5j?=
 =?utf-8?B?QU9XRlBVT1FEdVJnZnl4Z250R1EreU1PU2VwSlA4L3FGOUFacnJmZ1RQSWVq?=
 =?utf-8?B?MWdCT0ZmV1hWc3pzMmFCUW5QR1c5Z1IxUm8yeGIrR0dISnc2ZitnQ3AyR1BI?=
 =?utf-8?B?KzhEOEF3NVc3WVg3MFNwREpxWjIrSzBndXVqb0NXTmVuR1dHQXRCQnRNK3Bl?=
 =?utf-8?B?RXUyZVErdWEzOFdRNWNnbE9iV0IweFpNcTBGdExsSHNmckIzbUswVTRZL29o?=
 =?utf-8?B?U0JrNWdPMnFPWjArdlFHZWx1Q09SeDhJNWdTbW1LM1I0enNKZkhrMm1WcWNP?=
 =?utf-8?B?SDdSbjM1ZFZiRWpVWTBvYitxaUN5WGRWWmxKZ2hBdWFoTzJJeXhxMlkxZU9l?=
 =?utf-8?B?eE9yQk4vSjdxREpmU3hSbmdidjh0bHZPY0RBRndpazRsWUJWZHpwWDdseXpq?=
 =?utf-8?B?emNFWVZNSVZCZThtZHRBamw2SDNreGR2OHZOa2hMQ1ZDaXRrQ3pCT1Jwb2o1?=
 =?utf-8?B?ZFhGRDQwNHFyNmNkNFJFUEswVjRTQ0tFVTlmUnlTZTFkNlVHdWtpbU1JcVBS?=
 =?utf-8?B?MDQwTDFPSkMvdVA3ZFF3WDU2dWIzcm1mcHJ5TlhkM0ZpVWFmQW9GL2MxeUZu?=
 =?utf-8?B?bWs4QklwZzJsd2UraWlmRmNUVndrWmFyVUNpSis1VDN6UEw2OUxQUEtCaU0w?=
 =?utf-8?B?VWJnRjQ2SjdTOXZaTG8wbnN1OUVPOW1OQ1RDSWJqakZTNTA0TjdsNEY3RlNs?=
 =?utf-8?B?Vm5BKzRDY2loQ3VBeGEyUHhCaExQWGRyaDVlU1VPRWk5bVFaUHBUSlhqQTY2?=
 =?utf-8?B?cnFWclR1MTFwMG41T0JkamZEYnBQTlVvQnZJZ3J1elVYWGpBQlpEaWVnaDIr?=
 =?utf-8?B?VGV3YXpjaTk5S2U0cmpPUm8yTGJnS1AvaEpaSldqS0xZYUVVSUNjamZITUJG?=
 =?utf-8?B?SDhzOFZxNzhlRVNWN3d4cGpSbGFCZDMrak5Nd1kvSUhEVUZlb1JGbk9yTmFk?=
 =?utf-8?B?M0FJSERrWW02clIrRnJidFFYcU5FSVVZdEM3N0hUaDFtYnBtQjdrWDJUYXh2?=
 =?utf-8?B?WFRtaEZKN0FsbDcxRFV6TTJpdUFIekFMZG9OVGg2M2tXZWQ5b1NOUFJzczFu?=
 =?utf-8?B?VElmeDh1TlVNQlFMZGFwQzgvN3BGRDk3RWRWeEFvN2k4UFo0S2dxVWQ1cjBt?=
 =?utf-8?B?T25nYkpER3BSbHV6aDMyQ2dnL2p2S1RHdGVQNzYwQzk0cjFXNW1FQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c975630-7e15-47f3-06e3-08da22d0f30f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 13:23:25.7580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6SWKiwbKw+N5bFP9f01zWoR2Gj2WfwaFSnH96CfDaHoHIPU4DdnAJddnskNK0kCT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2446
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



On 4/20/2022 6:26 PM, Christian König wrote:
> Am 20.04.22 um 14:54 schrieb Wang, Yang(Kevin):
>>
>> [AMD Official Use Only]
>>
>>
>> Hi Chris,
>>
>> 1) Change the test case to use something larger than 1TiB.
>> sure, we can increase the size of BO and make test pass,
>> but if user really want to allocate 1TB GTT BO, we have no reason to 
>> let it fail? right?
> 
> No, the reason is the underlying core kernel doesn't allow kvmalloc 
> allocations with GFP_ZERO which are large enough to hold the array of 
> allocated pages for this.
> 
> We are working on top of the core Linux kernel and should *NEVER* ever 
> add workarounds like what was suggested here. >

AFAIU, for the purpose of ttm use, fallback to vmalloc is fine.

  * Please note that any use of gfp flags outside of GFP_KERNEL is 
careful to not
  * fall back to vmalloc.
  *

Actually the current implementation documents the behavior, but it is 
deep inside the implementation to be noticeable - at least not obvious 
while using kvmalloc_array.

Thanks,
Lijo

> Regards,
> Christian.
> 
>> the system availed memory about 2T, but it will still fail.
>>
>> 2) Change kvmalloc to allow GFP_ZERO allocations even in the vmalloc 
>> fallback path.
>>     the 5.18 kernel will add this patch to fix this issue .
>>
>> Best Regards,
>> Kevin
>> ------------------------------------------------------------------------
>> *From:* Koenig, Christian <Christian.Koenig@amd.com>
>> *Sent:* Wednesday, April 20, 2022 8:42 PM
>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com>; Christian König 
>> <ckoenig.leichtzumerken@gmail.com>; dri-devel@lists.freedesktop.org 
>> <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org 
>> <amd-gfx@lists.freedesktop.org>
>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds 
>> kmalloc limit
>> Hi Kevin,
>>
>> yes and that is perfectly valid and expected behavior. There is 
>> absolutely no need to change anything in TTM here.
>>
>> What we could do is:
>> 1) Change the test case to use something larger than 1TiB.
>> 2) Change kvmalloc to allow GFP_ZERO allocations even in the vmalloc 
>> fallback path.
>>
>> Regards,
>> Christian.
>>
>> Am 20.04.22 um 14:39 schrieb Wang, Yang(Kevin):
>>>
>>> [AMD Official Use Only]
>>>
>>>
>>> Hi Chirs,
>>>
>>> yes, right, the amdgpu drive rwill use amdgpu_bo_validate_size() 
>>> function to verify bo size,
>>> but when driver try to allocate VRAM domain bo fail, the amdgpu 
>>> driver will fall back to allocate domain = (GTT | VRAM)  bo.
>>> please check following code, it will cause the 2nd time to allocate 
>>> bo fail during allocate 256Mb buffer to store dma address (via 
>>> kvmalloc()).
>>>
>>> initial_domain = (u32)(0xffffffff & args->in.domains);
>>> retry:
>>>         r = amdgpu_gem_object_create(adev, size, args->in.alignment,
>>>                    initial_domain,
>>>                    flags, ttm_bo_type_device, resv, &gobj);
>>>         if (r && r != -ERESTARTSYS) {
>>>                 if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
>>>       flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
>>>       goto retry;
>>>                 }
>>>
>>>                 if (initial_domain == AMDGPU_GEM_DOMAIN_VRAM) {
>>>       initial_domain |= AMDGPU_GEM_DOMAIN_GTT;
>>>       goto retry;
>>>                 }
>>> DRM_DEBUG("Failed to allocate GEM object (%llu, %d, %llu, %d)\n",
>>>               size, initial_domain, args->in.alignment, r);
>>>         }
>>>
>>> Best Regards,
>>> Kevin
>>>
>>> ------------------------------------------------------------------------
>>> *From:* Christian König <ckoenig.leichtzumerken@gmail.com> 
>>> <mailto:ckoenig.leichtzumerken@gmail.com>
>>> *Sent:* Wednesday, April 20, 2022 7:55 PM
>>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com> 
>>> <mailto:KevinYang.Wang@amd.com>; Koenig, Christian 
>>> <Christian.Koenig@amd.com> <mailto:Christian.Koenig@amd.com>; 
>>> dri-devel@lists.freedesktop.org 
>>> <mailto:dri-devel@lists.freedesktop.org> 
>>> <dri-devel@lists.freedesktop.org> 
>>> <mailto:dri-devel@lists.freedesktop.org>; 
>>> amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org> 
>>> <amd-gfx@lists.freedesktop.org> <mailto:amd-gfx@lists.freedesktop.org>
>>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size 
>>> exceeds kmalloc limit
>>> Hi Kevin,
>>>
>>> no, the test case should already fail in amdgpu_bo_validate_size().
>>>
>>> If we have a system with 2TiB of memory where the test case could 
>>> succeed then we should increase the requested size to something larger.
>>>
>>> And if the underlying core Linux kernel functions don't allow 
>>> allocations as large as the requested one we should *NEVER* ever add 
>>> workarounds like this.
>>>
>>> It is perfectly expected that this test case is not able to fulfill 
>>> the desired allocation. That it fails during kvmalloc is unfortunate, 
>>> but not a show stopper.
>>>
>>> Regards,
>>> Christian.
>>>
>>>
>>> Am 20.04.22 um 13:32 schrieb Wang, Yang(Kevin):
>>>>
>>>> [AMD Official Use Only]
>>>>
>>>>
>>>> Hi Chris,
>>>>
>>>> you misunderstood background about this case.
>>>>
>>>> although we expect this test case to fail, it should fail at the 
>>>> location where the Bo actual memory is actually allocated. now the 
>>>> code logic will cause the failure to allocate memory to store DMA 
>>>> address.
>>>>
>>>> e.g: the case is failed in 2TB system ram machine, it should be 
>>>> allocated successful, but it is failed.
>>>>
>>>> allocate 1TB BO, the ttm should allocate 1TB/4k * 8 buffer to store 
>>>> allocate result (page address), this should not be failed usually.
>>>>
>>>> There is a similar fix in upstream kernel 5.18, before this fix 
>>>> entered the TTM code, this problem existed in TTM.
>>>>
>>>> kernel/git/torvalds/linux.git - Linux kernel source tree 
>>>> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit%2F%3Fh%3Dv5.18-rc3%26id%3Da421ef303008b0ceee2cfc625c3246fa7654b0ca&data=05%7C01%7Clijo.lazar%40amd.com%7C908fad4b756248e06e5e08da22cd4463%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637860562263637656%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=34hU%2FcxcRgBiiZ2jdNxTVmU7t4JF7TR27hx1b119U9g%3D&reserved=0>
>>>> mm: allow !GFP_KERNEL allocations for kvmalloc
>>>>
>>>> Best Regards,
>>>> Kevin
>>>>
>>>> ------------------------------------------------------------------------
>>>> *From:* Koenig, Christian <Christian.Koenig@amd.com> 
>>>> <mailto:Christian.Koenig@amd.com>
>>>> *Sent:* Wednesday, April 20, 2022 6:53 PM
>>>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com> 
>>>> <mailto:KevinYang.Wang@amd.com>; dri-devel@lists.freedesktop.org 
>>>> <mailto:dri-devel@lists.freedesktop.org> 
>>>> <dri-devel@lists.freedesktop.org> 
>>>> <mailto:dri-devel@lists.freedesktop.org>; 
>>>> amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org> 
>>>> <amd-gfx@lists.freedesktop.org> <mailto:amd-gfx@lists.freedesktop.org>
>>>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size 
>>>> exceeds kmalloc limit
>>>> Am 20.04.22 um 11:07 schrieb Wang, Yang(Kevin):
>>>>>
>>>>> [AMD Official Use Only]
>>>>>
>>>>>
>>>>>
>>>>> ------------------------------------------------------------------------
>>>>> *From:* Koenig, Christian <Christian.Koenig@amd.com> 
>>>>> <mailto:Christian.Koenig@amd.com>
>>>>> *Sent:* Wednesday, April 20, 2022 5:00 PM
>>>>> *To:* Wang, Yang(Kevin) <KevinYang.Wang@amd.com> 
>>>>> <mailto:KevinYang.Wang@amd.com>; dri-devel@lists.freedesktop.org 
>>>>> <mailto:dri-devel@lists.freedesktop.org> 
>>>>> <dri-devel@lists.freedesktop.org> 
>>>>> <mailto:dri-devel@lists.freedesktop.org>; 
>>>>> amd-gfx@lists.freedesktop.org 
>>>>> <mailto:amd-gfx@lists.freedesktop.org> 
>>>>> <amd-gfx@lists.freedesktop.org> <mailto:amd-gfx@lists.freedesktop.org>
>>>>> *Subject:* Re: [PATCH] drm/ttm: fix ttm tt init fail when size 
>>>>> exceeds kmalloc limit
>>>>> Am 20.04.22 um 10:56 schrieb Yang Wang:
>>>>> > if the __GFP_ZERO is set, the kvmalloc() can't fallback to use 
>>>>> vmalloc()
>>>>>
>>>>> Hui what? Why should kvmalloc() not be able to fallback to vmalloc()
>>>>> when __GFP_ZERO is set?
>>>>>
>>>>> And even that is really the case then that sounds like a bug in 
>>>>> kvmalloc().
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>> [kevin]:
>>>>> it is really test case from libdrm amdgpu test, which try to 
>>>>> allocate a big BO which will cause ttm tt init fail.
>>>>
>>>>
>>>> LOL! Guys, this test case is intended to fail!
>>>> *
>>>> *The test consists of allocating a buffer so ridiculous large that 
>>>> it should never succeed and be rejected by the kernel driver.
>>>>
>>>> This patch here is a really clear NAK.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> it may be a kvmalloc() bug, and this patch can as a workaround 
>>>>> in ttm before this issue fix.
>>>>>
>>>>> void *kvmalloc_node(size_t size, gfp_t flags, int node)
>>>>> {
>>>>> ...
>>>>>       if ((flags & GFP_KERNEL) != GFP_KERNEL)
>>>>>               return kmalloc_node(size, flags, node);
>>>>> ...
>>>>> }
>>>>>
>>>>> Best Regards,
>>>>> Kevin
>>>>>
>>>>> > to allocate memory, when request size is exceeds kmalloc limit, 
>>>>> it will
>>>>> > cause allocate memory fail.
>>>>> >
>>>>> > e.g: when ttm want to create a BO with 1TB size, it maybe fail.
>>>>> >
>>>>> > Signed-off-by: Yang Wang <KevinYang.Wang@amd.com> 
>>>>> <mailto:KevinYang.Wang@amd.com>
>>>>> > ---
>>>>> >   drivers/gpu/drm/ttm/ttm_tt.c | 14 +++++++++++---
>>>>> >   1 file changed, 11 insertions(+), 3 deletions(-)
>>>>> >
>>>>> > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c 
>>>>> b/drivers/gpu/drm/ttm/ttm_tt.c
>>>>> > index 79c870a3bef8..9f2f3e576b8d 100644
>>>>> > --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>>>> > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>>>> > @@ -97,9 +97,12 @@ int ttm_tt_create(struct ttm_buffer_object 
>>>>> *bo, bool zero_alloc)
>>>>> >   static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
>>>>> >   {
>>>>> >        ttm->pages = kvmalloc_array(ttm->num_pages, sizeof(void*),
>>>>> > -                     GFP_KERNEL | __GFP_ZERO);
>>>>> > + GFP_KERNEL);
>>>>> >        if (!ttm->pages)
>>>>> >                return -ENOMEM;
>>>>> > +
>>>>> > +     memset(ttm->pages, 0, ttm->num_pages * sizeof(void *));
>>>>> > +
>>>>> >        return 0;
>>>>> >   }
>>>>> >
>>>>> > @@ -108,10 +111,12 @@ static int 
>>>>> ttm_dma_tt_alloc_page_directory(struct ttm_tt *ttm)
>>>>> >        ttm->pages = kvmalloc_array(ttm->num_pages,
>>>>> >                                    sizeof(*ttm->pages) +
>>>>> >                                    sizeof(*ttm->dma_address),
>>>>> > - GFP_KERNEL | __GFP_ZERO);
>>>>> > + GFP_KERNEL);
>>>>> >        if (!ttm->pages)
>>>>> >                return -ENOMEM;
>>>>> >
>>>>> > +     memset(ttm->pages, 0, ttm->num_pages * (sizeof(*ttm->pages) 
>>>>> + sizeof(*ttm->dma_address)));
>>>>> > +
>>>>> >        ttm->dma_address = (void *)(ttm->pages + ttm->num_pages);
>>>>> >        return 0;
>>>>> >   }
>>>>> > @@ -120,9 +125,12 @@ static int 
>>>>> ttm_sg_tt_alloc_page_directory(struct ttm_tt *ttm)
>>>>> >   {
>>>>> >        ttm->dma_address = kvmalloc_array(ttm->num_pages,
>>>>> >                                         sizeof(*ttm->dma_address),
>>>>> > - GFP_KERNEL | __GFP_ZERO);
>>>>> > + GFP_KERNEL);
>>>>> >        if (!ttm->dma_address)
>>>>> >                return -ENOMEM;
>>>>> > +
>>>>> > +     memset(ttm->dma_address, 0, ttm->num_pages * 
>>>>> sizeof(*ttm->dma_address));
>>>>> > +
>>>>> >        return 0;
>>>>> >   }
>>>>> >
>>>>>
>>>>
>>>
>>
> 
