Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A3057E3EA
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 17:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142C49038A;
	Fri, 22 Jul 2022 15:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2045.outbound.protection.outlook.com [40.107.95.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A6190313;
 Fri, 22 Jul 2022 15:47:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aaU3/hNzYx9tHBRCgbppGWVtm0km3c/4tUxAWkgcKniaVXMCaE0cui+051XXkwwDTqgvA5Bjrtf9Vl1HOQNKOgb91q/9wYhSdGxtmE9HmZAqFi8kDImnxEhSIZ0D8Ygbcpxn3DyFtNHgbGfl9QYEk6CVSCuhCqAAM2rav+GQKwLWsrOAaDDBw179suLnssy/8dxpUK2W2ztTuSEerE1FkTH0yGDT46/NDn0xkLjXknMJrpvhgpbpy7XRRewf3BLK87f/VFAARl0FZHJs/qTpn3X1ferbXLHYaQD9s8WcGCUmWH2FApJYVOOqKmyJv+z+qN+NI9opQa4od1OOwoQhlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6h0OI1CiYlszpQH/Q+gNAvLnsyOrNCwttWUQ4cl+io=;
 b=KsiDePKNjPPnPB2BlLd72at/iw+8paYS0uY47LYKIvv0v8E3vBo2JjYbt8n3v+CaOd24v0A2Jb0r7t8tfghVlVQ0Qh7r1VjbSACAYibWxX75TTu1fVDS0SwujigYIuetIai+64Twi/aExExHwbYsEMDo4gYPeAedXijJXExpv+MdrD1SP7NoBwX+ObF3xC7ASSd1jvR6w5TmeBnWwgWBBabMwb1CijqNcrVXJNDF6oOjwRB4PuCI2CXslBUZ+GCUkGjWR9cg3eye6q4uiYyuuVpBOlOFW2LndYN05Absv3xd6i0T3gDXkjH3BmEiIcGeHxKvUFS/WE2Mk/5G4el69w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6h0OI1CiYlszpQH/Q+gNAvLnsyOrNCwttWUQ4cl+io=;
 b=ktnLbNhsEH6YqPIkKWUpJqQRLReTmWeSXipOTHsfjbhsY5YqDSdS/wh7sBhPsJtuBbN3prXO7Un3INVVvh9S8sfPI6CBOHyEPN/+fzpargV+Il+9P7lO/jDyxMTXk0HTO2h3DBDy410EU7YhUoD+0OdP5eMZYwGk76e+qr1p6fk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CO6PR12MB5474.namprd12.prod.outlook.com (2603:10b6:303:139::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 15:47:11 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5458.019; Fri, 22 Jul 2022
 15:47:11 +0000
Message-ID: <ceba1244-33a8-9b74-6379-4d0569ca9bdb@amd.com>
Date: Fri, 22 Jul 2022 17:47:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] Revert "drm/amdgpu: move internal vram_mgr function
 into the C file"
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220708093047.492662-1-Arunpravin.PaneerSelvam@amd.com>
 <a56afc27-3556-38ea-0d10-f7069091967e@suse.de>
 <476c4e58-ba0c-0736-2618-e7899dd5b60f@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <476c4e58-ba0c-0736-2618-e7899dd5b60f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 655a1341-6562-48f2-e363-08da6bf970fd
X-MS-TrafficTypeDiagnostic: CO6PR12MB5474:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wfZpftU36ZY/BHY0chRbolCTW/jH9TaWqIS+9ddp/h1E35/HcT6+O19kX5Qd4NZUYRCcCwYcAQKZ0c1/rDilEeIKo/VYoPnO+yBPgu4E8L/rIb+SbLBIP7nSNoso1PxNuXXBaZOMLEytEMwrzIecaHE0KLskCdijVb05L6Qe8nm5Bxt1YDXd0fGtxM1D8ujAyl2DEoK7PL9NekxetcfY1rKLgSBqZQTp05K9HqkM0urQlpqHLAS+rX0wjJ54gLzRm8g3gCHbtG7kEJTLgYDBbM3aUTZO2nZEzVtGfPVhAQs6RlTBN/z4nojDE2cIVnRXvsNTGeQJJ11k0n42Vv5wVxSRe1V+NonizDslL38fHv83lNwp3gQesrw3i2bLpcRYOllL1MtO470jxrWRy37hJrU2pkxRkM8q1m2PysvXPbVc5zrobLAQegfL0uZ+7x/0QCaMaTtBa7A4vBRRsNyuYKTFjVgLlKo/5iioiW8Qz7EVWSzSfMOzs07d92hDxVCRFc5+5PXcg1yBk4uGIeXicmAU6kbsV2pIRlKMDr0cHU3JCLNJxEQRVwJWJZ/5VtcEyOS5cWLO/eMGjh0sEdvwhQrEpFz0hcidw5BLbSlT5vyx+cNU5NBUsDdKPr5sFFwE8V12EGzbShk6MGGGyhkCQ8NGTKnR8iLZymRSVt5ubstK4kzEJkWZwmuDEopPF/rGlJnPTDx1wuFrQFca9qUmKNyjr4+zD+mmadZ6SttcIiQpi2X46/LhgrjcMpkOWgkVcLIeGIrKDEV0YMmJULDLyXxmPSLS29bA8a4w5FPEaOgi0/amCKGZEijY/GauC0ZV/911jwvCXOdKnjRKq4KNLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(66946007)(186003)(83380400001)(6486002)(36756003)(66476007)(66556008)(8676002)(110136005)(41300700001)(4326008)(6506007)(31686004)(53546011)(6666004)(2906002)(2616005)(6512007)(31696002)(38100700002)(86362001)(316002)(5660300002)(8936002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0FRQkJweHdsZTYvdURSK1NmbzZQY09yeHltcEZWVlByQTlONEhpeVQ2ak9u?=
 =?utf-8?B?UTFidmtCQXd0QWs4MVF4emR0WVE4ZFJWa0cwYlM2Y0dsZkJLbXhkcjBsbDYr?=
 =?utf-8?B?MkJteXhNYi9CQjJvNXJRMXQ2MENpZVgwbU9ra0xKWnhwVVo3bm8venZINlhN?=
 =?utf-8?B?bDFOMjdVNVo1VEk5YXVETWxIVVZGTHlidWJwbHJrdHZtVGpFdDFzUktRV050?=
 =?utf-8?B?TCt6S0poNUEvYnFzWlplcEZyNFBnbERqYUVPT0pLTWY5clY2UDVhSEE0ekZE?=
 =?utf-8?B?dmNFRER6bCtYUXdqU2UvSGlRUEswK0UvQXkrQ0k2VE9KRk5ISXFHN1lCenBF?=
 =?utf-8?B?M1BGYm5uR1BRRG0wYWtNUTBTd29XMHJhN1IzaGY5STFNMDJINS9ZbGNhcHcx?=
 =?utf-8?B?Z004bEQzUFVDMXBSdDk3azhDNjc2S3czRnBwVVdUWFlHVDF4SGdFUzV2U3RB?=
 =?utf-8?B?N1F0ZFFRUkNpb2RRRmxIdU1QWmlhNTFhM3VRNHozOVBIRTRXUUlBOG9uWUsy?=
 =?utf-8?B?TncrUmVvcnlzYjRoZHE5TkVBYUU5STcvalRiM3czNW8rclJBSEl4dlJ5ZUFE?=
 =?utf-8?B?bFpudUVhUDMrVGVZTkpuMnhUdXcxWk51NWpzTE1POUZFK0ZtRk5rdFBwTnVr?=
 =?utf-8?B?TU9ZY3hWa2hEQ1c0NjJKdEt5eWlnWmtjK3VUODdLd0VhK3VueFh4Q2JaMm5W?=
 =?utf-8?B?NTcwb3VpQ3owV0ExZkhXSEVOcmpwQ21ZV2RwTkdDOVoyREhCQlFQZ0FLbTda?=
 =?utf-8?B?cWZHSDI4bExhQmx6c1JRbkdkRnh2VzlQUGFaaTB0SzBMMUlHcW42YVpIVFhR?=
 =?utf-8?B?aTdKbU8rdjhrQWJycm84Tm5oaUlJamFWRnA1d0tsSEdnc0h3bStkckJuMHhE?=
 =?utf-8?B?VWp1OVhmci9rVlY0cFVPMFEzK0lORE1TVVhhSENVSUJwZTFGWUp5S3Buckxp?=
 =?utf-8?B?VUNHd3JIOWY1UnZQc2wvWW1kRnRKZnVpaVlXTjhQT3hpeklDV2w4SXVwcWRi?=
 =?utf-8?B?dW9VSm9YQm83b0creUc3NHY5b1dZdEw3MnlVUUhjQ1cvc1ZMamQ1Wm5zY3ZC?=
 =?utf-8?B?RStMNTZvTDRKUWhwcGFpOXhmdnVwMWNhMFBKS0xuZ3htVG5BN2JES2c4S3B3?=
 =?utf-8?B?a0ozWjNHQVE5UXhGNmp6bFZtQkhxekczNi9ralp1OW1IL0NXUGc2cysrUVpH?=
 =?utf-8?B?ZHpXdmZHSmloYzlyQWNUeEQ0bXZrNlc0ZERjazg4VlNTT1VXV3JrY09TMUdW?=
 =?utf-8?B?OGdma1lmOVF1UmN2bFM2VlBKMDFOSlBhTjVHTWRtczFoeEVISVZvQ2NwVkpp?=
 =?utf-8?B?OHhPVi8wM1BMei85UUpyWCtIMDFORmdadG9tUHo1ME1CbnlYVlNwcVp4L2NN?=
 =?utf-8?B?eTBMUjkwaHpMSkZlR2FFbERWRWZtemVhOHhiblNUakFxcjBUanFITTFxMzVq?=
 =?utf-8?B?cVp1enZ3cmZSdmlnS2JrZWtuT1B3aTFQb0FtcFNOTXh2STIxZG0xM3JjaGdI?=
 =?utf-8?B?Ym10N292MHUxN2ZTdkovei9qaVB2TDVjbk43cTg1RkZhSFg0UmtjQ2VqNndS?=
 =?utf-8?B?dmd2WkdWajB5NW9iZ29RUkdnU3VOSXVjU1o1QnREbE91UXFibTJ0NXV4VHh3?=
 =?utf-8?B?MzY5ZG5EMkl2ZnBTZUwzOTZybS9veU1ZQTcxT21xbjA2RERiYXUraDQ5YjRl?=
 =?utf-8?B?MVdBVmY1bFZRY3A1cHRaWXhOeUhMTTJta3hJQ3RFcmpQbmRSM2VMUHhJMklT?=
 =?utf-8?B?WE45T0g0THJpNEV5dlpuVUR6aC9qajkvMHZoVkVJYkQxWlJ2L1Nvb2JkeC90?=
 =?utf-8?B?ZUFoRDJBMWs1M002blRnS2lMQ0RxeXYrTEx1R20xdnpCcnJ1dUMxSjNBWGVY?=
 =?utf-8?B?TFpXSGNRRTNSaGpJWThFYlZJd2J6cUcvNWdqSGEwQXBTY1k2K2pXMkxNdnFD?=
 =?utf-8?B?VFhnS0R0eDNPN1hBU2RLc29uNUdWMGFEYXV6Wng1ODR4SGpNY1c2V3Q1Kzhu?=
 =?utf-8?B?b2Jxdm1LYmc0bG5TN0Z4NE1DRWkvYi8xcEl5WjlaTGRmTEx6eDJrTFEwd0Nx?=
 =?utf-8?B?V3hJOElSbVMvVVJUTXRneElvcDArTmJ5MUxxM2gwOEQ4OEw3VDBBdUQ1L3hr?=
 =?utf-8?B?cjlYL2VZa3kzWXRPNzJuNVJhZ3A4T3VzYXV4THAzZHhaSkdPeEJwZlFORXlI?=
 =?utf-8?Q?2Tm1Db63VRq94k5yI5QpmJC70i8XU2gbPLWOX6egbj58?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 655a1341-6562-48f2-e363-08da6bf970fd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 15:47:11.4937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BLJ1f14P+pqD37KZkoJAe2elpSRQPCtkHruTwCfMgIBNmzr8m0z5dVMrrWBYV3nw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5474
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
Cc: alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

scratching my head what exactly is going on here.

I've build tested drm-tip a couple of test in the last week and it 
always worked flawlessly.

It looks like that some conflict resolution is sometimes not applied 
correctly, but I have no idea why.

Regards,
Christian.

Am 22.07.22 um 16:46 schrieb Tvrtko Ursulin:
>
> On 14/07/2022 09:45, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 08.07.22 um 11:30 schrieb Arunpravin Paneer Selvam:
>>> This reverts commit 708d19d9f362766147cab79eccae60912c6d3068.
>>
>> This commit is only present in drm-misc-next. Should the revert be 
>> cherry-picked into drm-misc-next-fixes?
>
> Seemed like an appropriate thread to raise this, in case my pings 
> about it on #dri-devel and #radeon go un-noticed since it is Friday 
> after all.
>
> So for me dri-tip today fails to build the amdgpu driver.
>
> I had to revert 925b6e59138cefa47275c67891c65d48d3266d57 to make it 
> build. This conflicts a bit but seems trivial. Without this revert 
> code seems confused with different versions of struct amdgpu_vram_mgr 
> and build fails violently (increase your scroll back buffers to see it 
> all).
>
> Regards,
>
> Tvrtko
>
>> Best regards
>> Thomas
>>
>>>
>>> This is part of a revert of the following commits:
>>> commit 708d19d9f362 ("drm/amdgpu: move internal vram_mgr function 
>>> into the C file")
>>> commit 5e3f1e7729ec ("drm/amdgpu: fix start calculation in 
>>> amdgpu_vram_mgr_new")
>>> commit c9cad937c0c5 ("drm/amdgpu: add drm buddy support to amdgpu")
>>>
>>> [WHY]
>>> Few users reported garbaged graphics as soon as x starts,
>>> reverting until this can be resolved.
>>>
>>> Signed-off-by: Arunpravin Paneer Selvam 
>>> <Arunpravin.PaneerSelvam@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 29 
>>> --------------------
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h | 27 ++++++++++++++++++
>>>   2 files changed, 27 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> index 7a5e8a7b4a1b..51d9d3a4456c 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> @@ -50,35 +50,6 @@ to_amdgpu_device(struct amdgpu_vram_mgr *mgr)
>>>       return container_of(mgr, struct amdgpu_device, mman.vram_mgr);
>>>   }
>>> -static inline struct drm_buddy_block *
>>> -amdgpu_vram_mgr_first_block(struct list_head *list)
>>> -{
>>> -    return list_first_entry_or_null(list, struct drm_buddy_block, 
>>> link);
>>> -}
>>> -
>>> -static inline bool amdgpu_is_vram_mgr_blocks_contiguous(struct 
>>> list_head *head)
>>> -{
>>> -    struct drm_buddy_block *block;
>>> -    u64 start, size;
>>> -
>>> -    block = amdgpu_vram_mgr_first_block(head);
>>> -    if (!block)
>>> -        return false;
>>> -
>>> -    while (head != block->link.next) {
>>> -        start = amdgpu_vram_mgr_block_start(block);
>>> -        size = amdgpu_vram_mgr_block_size(block);
>>> -
>>> -        block = list_entry(block->link.next, struct 
>>> drm_buddy_block, link);
>>> -        if (start + size != amdgpu_vram_mgr_block_start(block))
>>> -            return false;
>>> -    }
>>> -
>>> -    return true;
>>> -}
>>> -
>>> -
>>> -
>>>   /**
>>>    * DOC: mem_info_vram_total
>>>    *
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>> index 4b267bf1c5db..9a2db87186c7 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>>> @@ -53,6 +53,33 @@ static inline u64 
>>> amdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
>>>       return PAGE_SIZE << drm_buddy_block_order(block);
>>>   }
>>> +static inline struct drm_buddy_block *
>>> +amdgpu_vram_mgr_first_block(struct list_head *list)
>>> +{
>>> +    return list_first_entry_or_null(list, struct drm_buddy_block, 
>>> link);
>>> +}
>>> +
>>> +static inline bool amdgpu_is_vram_mgr_blocks_contiguous(struct 
>>> list_head *head)
>>> +{
>>> +    struct drm_buddy_block *block;
>>> +    u64 start, size;
>>> +
>>> +    block = amdgpu_vram_mgr_first_block(head);
>>> +    if (!block)
>>> +        return false;
>>> +
>>> +    while (head != block->link.next) {
>>> +        start = amdgpu_vram_mgr_block_start(block);
>>> +        size = amdgpu_vram_mgr_block_size(block);
>>> +
>>> +        block = list_entry(block->link.next, struct 
>>> drm_buddy_block, link);
>>> +        if (start + size != amdgpu_vram_mgr_block_start(block))
>>> +            return false;
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>> +
>>>   static inline struct amdgpu_vram_mgr_resource *
>>>   to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
>>>   {
>>

