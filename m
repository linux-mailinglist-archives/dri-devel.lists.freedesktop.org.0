Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AEE39EF37
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 09:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096606EAB7;
	Tue,  8 Jun 2021 07:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39366EAB8;
 Tue,  8 Jun 2021 07:06:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTrI+F9fzlGEf/vr8UViSfNFlBan148YciFG/B6qvXnHeqLucFF7JuaZg6KXTytwt3+mCMO2j6NJQm6TQv75STl03H8U7EgcUejj+IAy06ItaWr/L8v+0EfbsKXVuoTVWrd7WA5+zcm7JZN8/JBwn8gOz2ygB79/06v3FeVJsScgyRMqxDvQWkxoJufwXTRON1euJ8Eb4icATnVGBCiwLd0brpYkwn67a6JH+SUgK8SHjmJCObjpPTL6rf3sdsfOPEjG0Z9NZyueKz+AIAqrGSHHiVUj7z+Niz82WbXrvBvrn6B6l1XX9WHlkeNfq8GZivTMSeGp1AR5ekOToiIeXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8b/sno6E+BmF/xJgUezDnlX8CtPjjo9DPRSVSGe0us=;
 b=mM+M9SIcNt6qClqgGFp8Q/hBaBQvGbM3NDxF6vo0NBcDGfBL/KjCzEXp1/u6F8oLNv5lmPGs4aqDPkO2GAZvRk/SBDyuclmUyUL7u8hdBtWFd3we6O0H6Bnii0S+yKDSDc+8dldvVJrflOwFhBjqhULujc6FnbZ0WRnM/jKCtVXk3zfmHKqo7Vo3pG6Ksj+5mx4MPazE8Y2w8ceEfpRIjKf5KZFOj0cCVgWxZfKtSyV48Ww/Sc/9Oxsu/uGE/AL8M9uxM+za0dMoxb30atHppdVpZnQQ63omieTozOq3lkorozG2fCuIUgZU9F5D7XUJcbZuJBD56SwIhUurklMfFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8b/sno6E+BmF/xJgUezDnlX8CtPjjo9DPRSVSGe0us=;
 b=wH/CP+49aqSJl48gKiQbU9pWkmKl34oYZoFma2k7nLRu2qijdeG+X4Yc2X57NraTMSC34GUqmCXPHKoeOC7ZwtN8AcyHtTFyz9MM2XGXkSqJVEbIXpOgoZJbTfu+RXwkSKlRnybtoVfQdb5I+bWJmg92xDQI0V0aGhm0Md9HeG4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5339.namprd12.prod.outlook.com (2603:10b6:408:104::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Tue, 8 Jun
 2021 07:06:15 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 07:06:15 +0000
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
References: <20210608125046.07c6deca@canb.auug.org.au>
 <22010e38-3686-87ce-532d-4a53cae990b1@amd.com>
 <7b825bc4-9f81-3010-6445-d6708e34a9bd@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <6dc40376-77fc-2f43-693e-1bd2c52d9cbd@amd.com>
Date: Tue, 8 Jun 2021 03:06:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <7b825bc4-9f81-3010-6445-d6708e34a9bd@amd.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.116.203.225]
X-ClientProxiedBy: YTOPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::47) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.203.225) by
 YTOPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.27 via Frontend
 Transport; Tue, 8 Jun 2021 07:06:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8822cc33-b6ea-4abd-7f2b-08d92a4be7c0
X-MS-TrafficTypeDiagnostic: BN9PR12MB5339:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB53391B847D65C4AFCD16C78692379@BN9PR12MB5339.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LafSOeZjwTDYoPHsOQHeRlnZMjX/BPF6vlHo1s3tgrtH7Nk5YxH1cdSqWP4l1Nxit7F1l0Vu2Awrlujd3ZXCXxykHbttwTu/vEsPx+7d0KIAFdOcLm38ivAhyKd9U3EwVVSnzGwsLBo5nsLe6vYz2NpJZdZsAzLfoPVrsx3Bki6Elf1b5qAm6wnHiuDvChrlpGmJ6guZYarl90ycamUe7002jyYMGoCcXEeETKF9kcd9dxQ+OX9ajmGNcYoBr9gllgj3VlymUXCgOdPCEsiWTI3QdUUA6kjhHXPrS+BrCGialtc8Npc9IonSIc7nNOuQmyoKlKmHtqwTefPeU/FiACp5xF8djBDYXabnEQfP3hvWQ+kgYVRHHuN4O+n4J9TpCCJ1ZyV8werKbBkJLMlB+eya8oZvYNOLB9ngGOILovQU4UHBrL2o8AfduiRRIsunxjykFRgJqFrPRTjPLhWH+gu+Z//uRMPd3zhkX4X84DnZGBpkwQ0OEUvk1d14xc4G+FPMrkURnL8wKwMLgrDfqn5vfPXXElLsHE7pDrReGAzPN7n7HVn8t0OI/bdcZPcpA+jojYX28rbMSUvOCA9e/QFJvmmaBq7f8+54K6t4ffmBYxLt4sEhHOnBqh9Ya6rz8FeRLuNYK4qP8JfyAy+9HTvneOKrDeSOdlb5cwsHdfoK/b03bjx6jpeNnhP3UlHZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(16526019)(186003)(316002)(16576012)(4326008)(31686004)(8676002)(83380400001)(8936002)(66574015)(26005)(54906003)(66946007)(44832011)(66476007)(66556008)(36756003)(86362001)(5660300002)(110136005)(6486002)(478600001)(956004)(38100700002)(2616005)(2906002)(53546011)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?odCUxphLzQ1wtOOpQFDFan8tAb1bd6fPlBkMVg/PKFzpSoIFxyQrXnHT?=
 =?Windows-1252?Q?0K7Rju2bQs82+XjT9jpgkqTzvJtKvS1W8G7NjSEhDyfSpU/5hW8BwS7B?=
 =?Windows-1252?Q?azSe8nzMnX3fvtdjbIbkrt5RzQCzyuAWsWbftkgEXHxvr+3cVBmGKBLa?=
 =?Windows-1252?Q?WkZhBfFnQcvx9xTiFGz2jq84END6WpPNkfZm5EytA/sMzxHtBV4hGLjg?=
 =?Windows-1252?Q?tt4FCGGIFUpzjGl6/Yz1RT/5ld1sUa/HXG8hmE+eII1SYSpis5fURUt/?=
 =?Windows-1252?Q?IvjRvfZ3uz9a2QUXlpMss3NJvY8SXoerYxUA+OJys4Rdlz+2Lzgj/Rzs?=
 =?Windows-1252?Q?b0nqzpOQb+vqU/AeKqZRS+AUZIirIbsUA7b66vM5HGK/Cleduc3wgEK9?=
 =?Windows-1252?Q?amyLsmIDft+57cIW5bJUWyXZu1N0pFvzT1G02iHdiSRFx3wYgIeLCbya?=
 =?Windows-1252?Q?mps5RiLgCDKSB57BGBfjRF9Z5xb8OIepwYJqrBixQ3cVuopGcmGqYsLR?=
 =?Windows-1252?Q?b71R7I0CKJleEw433FyfgxSaQbf6R4/NpRgnSRvmwp5/l3QVGTXKVBew?=
 =?Windows-1252?Q?+ieoPzo+UGY+iFlcgCVEfTRm4bmgU/GXEs1S7pBTzLynxgG+MF5vV030?=
 =?Windows-1252?Q?4lmUxW/VNb+wI8u3Gbl9Lny7vJdg7uwVrgb3bZkaXQkndos7PKUa4aLl?=
 =?Windows-1252?Q?78ALa/IRJRPLXpbUnlD3ncxwLgmLXo4ZnwROrR6lb1CWXs/v/HMqi/X3?=
 =?Windows-1252?Q?8T7WQKuNtLAnfRbcGHK2n7VViyQnDXFIOJtP7HBwps/bTKjs6dWgcg5T?=
 =?Windows-1252?Q?/TVUUnrAWlOXigJLxCevt+2Hrw81GpDsnzHTELqQ93EFWOf/2yzfh2nW?=
 =?Windows-1252?Q?NkoVHigO/Y/J/z7tGMkqKr5U1dvg5uSVCPOHq4H5FPDgUTXhoQtMo3It?=
 =?Windows-1252?Q?ILgjWHsBOUa3EFrLfS4qTg5ACmo0rRf6maHZotngkrZenBeZ9b/lMUn5?=
 =?Windows-1252?Q?02Owl5iPYqN9pXp5C7rOuYdPnUkemqgejgSVqUFjAsr0d444rnNIxeoC?=
 =?Windows-1252?Q?HNhht3HP3ZZya5k4NAMJcK3GStUS0ivjef/nIrSXW2ANL3wYflJtdpOR?=
 =?Windows-1252?Q?la75rSJLLZDStoRJoLKhvjrkis88KB2YZkSg5ReM/T1wQy0FEn73BSmj?=
 =?Windows-1252?Q?HLnpjDZNLOWJhJHNVgouyCd+aF+N6nTGmOFuQVO27HARZVq+mCQ3YIDt?=
 =?Windows-1252?Q?kU4RuargvBuXY76GLZOGXBgqdYJ/dhMTmuCjPw6UMbwb4SEMaxDP2XVS?=
 =?Windows-1252?Q?gXZeuIZej826Ifvs/RS/fy00pvOV+xliZBb2fBJFIgJus2G/mojkrCNk?=
 =?Windows-1252?Q?QR8GFdJ4lCbIYdJHFnsY44GqqAX/w2cC8i17Q3w3TmIxJK1snddtHmD8?=
 =?Windows-1252?Q?en32txheScaeuAj/bmZjAw=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8822cc33-b6ea-4abd-7f2b-08d92a4be7c0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 07:06:15.1400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKUrzANj5OvWP3o3K1z/VXd6c9PMz1vcLD13W+30znoqJdDfRREBpX4GZZOSptJstQDKlUURYgigx7qS4dFj2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5339
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-06-08 um 2:55 a.m. schrieb Christian König:
> Hi Felix,
>
> that should already be fixed in drm-tip as part of the merge of the
> TTM changes.

No, the preempt_mgr doesn't exist in drm-misc-next. It does exist in
drm-next, but that doesn't seem to have the TTM changes yet.

Is there another DRM branch or repository that you're referring to with
drm-tip?

Regards,
  Felix


>
> Regards,
> Christian.
>
> Am 08.06.21 um 07:37 schrieb Felix Kuehling:
>> Hi Christian,
>>
>> I based amdgpu_preempt_mgr on amdgpu_gtt_mgr and now I'm looking at what
>> changed there. Looks like I'll need to create a dummy node in
>> amdgpu_preempt_mgr_new to satisfy TTM, and free it in
>> amdgpu_preempt_mgr_del.
>>
>> Thanks,
>>    Felix
>>
>>
>> Am 2021-06-07 um 10:50 p.m. schrieb Stephen Rothwell:
>>> Hi all,
>>>
>>> After merging the drm-misc tree, today's linux-next build (x86_64
>>> allmodconfig) failed like this:
>>>
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c: In function
>>> 'amdgpu_preempt_mgr_new':
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:75:5: error: 'struct
>>> ttm_resource' has no member named 'mm_node'
>>>     75 |  mem->mm_node = NULL;
>>>        |     ^~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c: At top level:
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:129:11: error:
>>> initialization of 'int (*)(struct ttm_resource_manager *, struct
>>> ttm_buffer_object *, const struct ttm_place *, struct ttm_resource
>>> **)' from incompatible pointer type 'int (*)(struct
>>> ttm_resource_manager *, struct ttm_buffer_object *, const struct
>>> ttm_place *, struct ttm_resource *)'
>>> [-Werror=incompatible-pointer-types]
>>>    129 |  .alloc = amdgpu_preempt_mgr_new,
>>>        |           ^~~~~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c:129:11: note: (near
>>> initialization for 'amdgpu_preempt_mgr_func.alloc')
>>>
>>> Caused by commit
>>>
>>>    cb1c81467af3 ("drm/ttm: flip the switch for driver allocated
>>> resources v2")
>>>
>>> from the drm-misc tree interacting with commit
>>>
>>>    b453e42a6e8b ("drm/amdgpu: Add new placement for preemptible SG
>>> BOs")
>>>
>>> from the drm tree.
>>>
>>> I don't know how to fix this, so I added the following hack (a better
>>> fix would be nice):
>>>
>>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>>> Date: Tue, 8 Jun 2021 12:41:16 +1000
>>> Subject: [PATCH] hack fix up for needed amdgpu_preempt_mgr_new() fix up
>>>
>>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>>> index d607f314cc1b..e1a7b3e967b9 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>>> @@ -66,14 +66,16 @@ static DEVICE_ATTR_RO(mem_info_preempt_used);
>>>   static int amdgpu_preempt_mgr_new(struct ttm_resource_manager *man,
>>>                     struct ttm_buffer_object *tbo,
>>>                     const struct ttm_place *place,
>>> -                  struct ttm_resource *mem)
>>> +                  struct ttm_resource **res)
>>>   {
>>> +#if 0
>>>       struct amdgpu_preempt_mgr *mgr = to_preempt_mgr(man);
>>>         atomic64_add(mem->num_pages, &mgr->used);
>>>         mem->mm_node = NULL;
>>>       mem->start = AMDGPU_BO_INVALID_OFFSET;
>>> +#endif
>>>       return 0;
>>>   }
>>>   
>
