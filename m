Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E75433C3C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 18:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F076E19C;
	Tue, 19 Oct 2021 16:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65E76E198;
 Tue, 19 Oct 2021 16:30:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELBwGwY6UzaeXepfjnkVhmxK5K9HkRqPB17jAUjlhLvk/Sq+sacqzz8/qI162rcbMFu3amyWrodaNWEuHxV1RbXvzmG61uqLkGWwf2Es4vHLtTQg5NSBtoTPgoReozDJg1kA77n/WhZ+5OuyukXMlGZINvZnqMiyqvyaExREBTgrW3b+LXzluubQLdjacY0W3YjtMuUbB5oH60C5/ws/JWaI46PcaLFtGFwsyvcO2sO+uNlzajHDrTf9TqqKwg4Xo1M2FsA2iDAXOejlT25ET5b1XubmCYYlb+XhbUyoeRRCWo5VSFe7yZ7gcMEQgA8+ynCxZUIYhQZyZ3zCi2FKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxJ4PM3w+2xOxLtg73UaRmKeFxYV4e0IiJ1Ne9ariCY=;
 b=Mim6sYmx+E1WrVrJDCDxXm2+YEXqoe+gUAE7aC15Hsl5uAzNaYFTKy/XvIbRHgEejm/bQjhcbtIq3OHeujoiz0DDRykHZcFVtwKLph30hFTGNG4o87ooi5co/WTTgCEe9gnK+5ent51ecyePlC32mxazqOJs77Q+8MVEENE2d8YvzBS9105M4R3gZEYe+w3y/xPJMkt32Huy/itgQ03aqqu7kyfA9w8iz9F0Hb6NQ7Yk2v694/1y7jyPb99GVfl7MUcNVnnIFaE7u8vfIIDHjbfkEAn0rxLEqARxRZTOq/uZ6eSK+z41hwPy48Jsehp282YTQR9hsQZu2R0shSlRxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxJ4PM3w+2xOxLtg73UaRmKeFxYV4e0IiJ1Ne9ariCY=;
 b=vd0+fyga9CKYRU5tZG0ZYx6S9OJO627G1TuZi6R/SJfY+oqzRUewwQWfZQO1+qOikVWsABvWGuPo1Ri/G/V/jwlI2GPDXM/Jh0d5g5Kxi0ClL6B0eM2Y0vDMUXtK695kBrHM1L4ML2v0gQBeblE9+AytVZovKsCswhlFS4N3rVc=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB2491.namprd12.prod.outlook.com (2603:10b6:3:eb::23)
 by DM6PR12MB4265.namprd12.prod.outlook.com (2603:10b6:5:211::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 16:30:43 +0000
Received: from DM5PR1201MB2491.namprd12.prod.outlook.com
 ([fe80::d153:3aa6:4677:e29]) by DM5PR1201MB2491.namprd12.prod.outlook.com
 ([fe80::d153:3aa6:4677:e29%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 16:30:43 +0000
Subject: Re: [PATCH 12/28] drm/amdgpu: use new iterator in
 amdgpu_ttm_bo_eviction_valuable
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 tvrtko.ursulin@linux.intel.com
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-13-christian.koenig@amd.com>
 <YWboMfLOIjl1l7tF@phenom.ffwll.local>
 <a0a926a7-13d0-b996-5f32-36aa6d74165e@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <c18a4c91-93b4-79ed-0907-84adb29761d8@amd.com>
Date: Tue, 19 Oct 2021 12:30:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a0a926a7-13d0-b996-5f32-36aa6d74165e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0099.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::8) To DM5PR1201MB2491.namprd12.prod.outlook.com
 (2603:10b6:3:eb::23)
MIME-Version: 1.0
Received: from [192.168.2.100] (142.118.126.231) by
 YT1PR01CA0099.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.15 via Frontend Transport; Tue, 19 Oct 2021 16:30:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b716448e-00af-488b-8bf8-08d9931dcb8d
X-MS-TrafficTypeDiagnostic: DM6PR12MB4265:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4265ED10CED6FB0F5484D24692BD9@DM6PR12MB4265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u30dx3u18H3GfMtKoF1R5Ooc19TD9tCCaNh7s+I2awPPs2nzg7yYjWuyAOjjKW/roSq65I/E3L0o7Yutqc9T9hGJZnRZTLuWI2iIDRGOFXWN5SBfEiICTgdmyuGyvkLj7eD4WbkKauTPdNNlM9qWmGJN4giVXVC0pZSyIDGsbARCWay8kXur+J08k/8UUgMVtNLOe0K+KtQtHWONVSkpzFiO6Rmd58j6MEtIXBqiqYtaDc3zySyjtHxsjUzFjnZS9E9+azB/NqIvghs1rTSDrUbiZghxVwtku/Y0kEFmowIuE0/oqLuYP5G/rzHUhozxncysVzCF4vQh5jlHygt6VoYyDsJtpfZDgCBPv8DiZS19HeFORvrK8tgoIg+72cCqL7r3kjGkocnF//sZOEGVLskiK6F9YN+bi3CE369mntZxEqwnN7zsNZbZ2B8rqxCRbKNWxoqw3/VPXx6+iIf1VizZo/Hbh78t0fb7hGRS2XralVk8JHVCBqdIpV/yhzWJZiZqjogVInrtXpL+tpJGsoNVfInb5osueY1VHVpijU7HpYwY/TcPV3EqpjV6cunm8kstc+KE3ZD+opSunLDmQpWgoHbUoeZB0MNZDaca1AeDoEx4zjoG2AXvTGkvCot4ix5sqWMKddWSYeBwYQYFCdOusVgQzIX8fLE3TBAwUXA1L7ViOH5yyiA7UMrrjXemPy/GskGM5DRoKFknK8CQHDou8LTKDbAp6kGvbVzQ8F0MZ2hRYEm02ZD1xIKiTV3t
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB2491.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(4001150100001)(66946007)(31686004)(4326008)(38100700002)(26005)(44832011)(6486002)(83380400001)(66476007)(66556008)(86362001)(8676002)(2616005)(31696002)(16576012)(316002)(8936002)(36756003)(508600001)(956004)(186003)(110136005)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ri9aaFpkZC9ZLzlDOTlOMlh6ZFRTL2JWcUtHM3VIWkh4UFRpRmlOdDRnVmk4?=
 =?utf-8?B?eWU1M0NlN3AxaU44UlQ3VGZJdWJLcXBmbTlRVmFETGVjbVh4aU9kYXQycTVq?=
 =?utf-8?B?QUYzQmJpRldUbnVSVENpYjg1djZmTDAwU05Gd0Q2UWQ1eGZkRkVKTnRrZCtx?=
 =?utf-8?B?dUpHcDdkNDYxKzFkR2ZqWDIra1dKMmFRSzE1ZlVUYTR3L0diQythQjdKVlpZ?=
 =?utf-8?B?UEcvN1U4akNtb2g3dndHMlV4OVQ3cHZiQ2ZIRjN4ODhqV1B2RVovRythTVpL?=
 =?utf-8?B?djlBUmZkQkZGVzFscDZ1bDhJS3VYMHhkZVlHYmZ4WmJudUZsUURVcGViQU1w?=
 =?utf-8?B?TjdYT3YzemZlRXZ6OFNlRmMrNDk2NlZVZVE1OFZYRHNGbkF1cC9qOWZocGdn?=
 =?utf-8?B?ZlRRYzFRbVMrS3hYSUNyNG9yYVROY2tWTGdZRnpGNU9Xcmo1N3gzNmlleUZS?=
 =?utf-8?B?azRwRFhlYnNGZjgzVTBNcTJPeEQ4THdlNThYZEk1eGJxaUF0SklXYVBPSnVC?=
 =?utf-8?B?NkFTbDR2TlVnSXZ6aWJ1WERKZ3dxM09Kd0FCTUYzZGRrM3FkRkFSQW9TQmI0?=
 =?utf-8?B?NlZhRmxmRC9kdDlwRUpLOTRyYVdTa0V5aC9uamVmeGlabGx3c2VUOXhiQ1dm?=
 =?utf-8?B?QUxPMmFlMUtzbFA0WDRVU0g2QmJLT0dGbDlEYTFVaGN1NnF3c1hhaGtiaEc0?=
 =?utf-8?B?WXhFd1dkVHBWYm1ENlVBMEU2R0F0UmJLcHhtNmpVRjEyY0FUaFk4Q2FTc1lm?=
 =?utf-8?B?VzdUSUFyOXhoc0ljbDdWMGx6c3dQSmlpQlUrRWJUT000Qmg3T1oweEoySko0?=
 =?utf-8?B?SFNXaVRyNzFQNUx0a0lWc2ZRYVNIMzZZWHdlaE1yYXcvWWd2WXZiWEY1WlJp?=
 =?utf-8?B?TUFHZStaMWFaL0RlcWJWQVF1TXhUdEdqSlNjM0FKelhZc0Z6VUZtMzE5QjRM?=
 =?utf-8?B?REpjOHBWdlNWd3ZORTdPSEh3Q1l2M2hTSFRZRGplVFpUbzBZWG5jQ1dJK2Ju?=
 =?utf-8?B?TmlOdmlpZHRHMEFiWGFiZXFhOEJ3YXJuazA5Z2hrOXhtMTZ2Y3lONjlCUDVm?=
 =?utf-8?B?SXlvNURqc1JMVEJLV3ZlK1dkbENHVmw3cWQ0anVKL24wbjFMNDFZMnNkcHNv?=
 =?utf-8?B?NUFnWUhPT2Ewb1Zxdk1xUVhXR3RpQWd0cmRjelFxLy9NNDR5eE8ydTdKMkhj?=
 =?utf-8?B?aTZkTi8zZ0JqUFN0Ymd0SHF1RWtXR1JBcXFvNlJ4elF2Um5ZTWhLQTJKT2p0?=
 =?utf-8?B?SkNyWjZSUlg3dXhnRWdyVU83ckN4MWpIUlFJZUhRSzVCOTlleTdpQ1pCYUNG?=
 =?utf-8?B?dnhuMXE4TkZvR3dhMXZoM0JXemd6MldLOERCbWJDMTFzNFU4enltbXNPaFhY?=
 =?utf-8?B?WmlrUjI4a09WNjFzTmVsQXE0WXVlZ3BuWnBDcWlseFpWR2E0c1lmY2c5RWRC?=
 =?utf-8?B?TzcvSmdJUUhwNFFWTDFib0R2VWRZckxnTWRpWis5Uk0yNUxQaFdKZytTeVBp?=
 =?utf-8?B?SmJqaDNaMXZHTHZWclk3OSswTG5vTVFSd0JrZi9uWG1KeDlwVzlhM3ZvRk0x?=
 =?utf-8?B?ajFac25tS3pJQ00zN3dkZm1NZkI4ajBCYzBhYWpuRzFnR2lKTHZoM1JFczVF?=
 =?utf-8?B?OEpMa2t5dUNGdjJtZ21kSlZvQ3FnVDZwSUdiOVRCdkRwYUhiRHlsbDVFbTBQ?=
 =?utf-8?B?VGQrS1Q2c2p3ZGJ6TjFBUmE3dUVJOXJ4T1hXemFzZW51SEtkM3AxRmM2UHZY?=
 =?utf-8?B?QmU0MjhMWCtReTVXMVhYenRlRmFjZkY0cWc3Z1ZSWjhVTEdhVVVGSGUzOC9o?=
 =?utf-8?B?Nk92TGs1dHZBQU9ab1FmQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b716448e-00af-488b-8bf8-08d9931dcb8d
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB2491.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 16:30:43.1380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /3ftIQZ1VCKMHPMjp1yvaOElHNdUCAU6NFligJGhdmEb4DTDuUtuskRnjtdgVT07kKMMa8FpZViLR2gmJ28CWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4265
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

Am 2021-10-19 um 7:36 a.m. schrieb Christian König:
> Am 13.10.21 um 16:07 schrieb Daniel Vetter:
>> On Tue, Oct 05, 2021 at 01:37:26PM +0200, Christian König wrote:
>>> Simplifying the code a bit.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 ++++----------
>>>   1 file changed, 4 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> index e8d70b6e6737..722e3c9e8882 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> @@ -1345,10 +1345,9 @@ static bool
>>> amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>>                           const struct ttm_place *place)
>>>   {
>>>       unsigned long num_pages = bo->resource->num_pages;
>>> +    struct dma_resv_iter resv_cursor;
>>>       struct amdgpu_res_cursor cursor;
>>> -    struct dma_resv_list *flist;
>>>       struct dma_fence *f;
>>> -    int i;
>>>         /* Swapout? */
>>>       if (bo->resource->mem_type == TTM_PL_SYSTEM)
>>> @@ -1362,14 +1361,9 @@ static bool
>>> amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>>        * If true, then return false as any KFD process needs all its
>>> BOs to
>>>        * be resident to run successfully
>>>        */
>>> -    flist = dma_resv_shared_list(bo->base.resv);
>>> -    if (flist) {
>>> -        for (i = 0; i < flist->shared_count; ++i) {
>>> -            f = rcu_dereference_protected(flist->shared[i],
>>> -                dma_resv_held(bo->base.resv));
>>> -            if (amdkfd_fence_check_mm(f, current->mm))
>>> -                return false;
>>> -        }
>>> +    dma_resv_for_each_fence(&resv_cursor, bo->base.resv, true, f) {
>>                                 ^false?
>>
>> At least I'm not seeing the code look at the exclusive fence here.
>
> Yes, but that's correct. We need to look at all potential fences.

amdkfd_fence_check_mm is only meaningful for KFD eviction fences, and
they are always added as shared fences. I think setting all_fences =
false would return only the exclusive fence.

Regards,
  Felix


>
> It's a design problem in KFD if you ask me, but that is a completely
> different topic.
>
> Christian.
>
>> -Daniel
>>
>>> +        if (amdkfd_fence_check_mm(f, current->mm))
>>> +            return false;
>>>       }
>>>         switch (bo->resource->mem_type) {
>>> -- 
>>> 2.25.1
>>>
>
