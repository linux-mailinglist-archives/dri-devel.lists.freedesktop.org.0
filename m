Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD2B394279
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 14:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B0C6F5AB;
	Fri, 28 May 2021 12:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2068.outbound.protection.outlook.com [40.107.96.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317F36F5AB;
 Fri, 28 May 2021 12:23:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xo8R9zCwA5kBMV6DeRJ743jpvxL6iNjicfmy53rPvyZrvOuKF6nLIcQO7u108m504wnXrlBeAg5cUnkDDk809Y31ulFMTDOr39KLcTAOGOlWiJ8ERjjNXqY/TZfipHiI3MSOL+X1FoQu4On9Je6J1x7LCw+LKHCFWJKsAyyMBHScMdHVzuJlBiX2RzorL3qj/k7Vc/nHy/ibQvHv77nFtSFGrWcRUQ0Rr1agBiXerDaRldNzjTzLVpNiZfokZLwnZ6Kri4/Ufw1TPjqMI+E0O6iljQG/SvRNASplM6TZsQ4/76royftj7PrWvPdyj+Xl+Ufx2flgohz07XnAPk0hSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfoKH+QV7i90TSCUhfSY3Cmt8x4aRkp9vUaeLW8Unlo=;
 b=EF7b0Mx53v2ymkE0lAXZsHDePolJqlt2pIWxVofld4xy//mK7j6OucXm5Pga5Bi9UZXt0dmwSw9boFiwgu1YFyyteCL/1+OTKonSXJ4yXatCNOptF1YgzNTGr0ff2nVJFgh7B1Kl6eylycHyMJN9eftPEsNWmlxNE00yWDyxdHPmKy0ZGn0vjogKdxc015t8xibPzPUygWGabVIZM7eRBAouqFfVxT/uiMkol5fX66Jk0w04wyARZ1WKxn/MTvlRGLSR7vD7NXkS2JRMLcesRdrXYjJz/GcC98vndoy0kUC83b7FOJg2k7iQx8ZOQ7VfWpA6cRholOiv/5iu35dZIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfoKH+QV7i90TSCUhfSY3Cmt8x4aRkp9vUaeLW8Unlo=;
 b=HjCtXAllPvRpuVbDq1Gh/zGrtRMsh2w/FO6Oxr5tM51wcx6PFkI1j/jUJs596KFqNfyhEZ3TQTlSE5qO0Inuv0+SUm9uWGfRkaAqyASjQTOcLge+FCLuuF5oUgs/tBMi6ArLz8hGgXzyB8jD8bkL6OPZqujqD5+G+AfXv0WkiG4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3840.namprd12.prod.outlook.com (2603:10b6:208:16f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 28 May
 2021 12:23:11 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.024; Fri, 28 May 2021
 12:23:11 +0000
Subject: Re: [PATCH 2/2] drm/amdgpu: stop bookkeeping of temporary GTT
 allocation
To: "Yu, Lang" <Lang.Yu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210527013051.4302-1-Lang.Yu@amd.com>
 <20210527013051.4302-2-Lang.Yu@amd.com>
 <8539c291-85e8-7530-af23-505cda7871f9@amd.com>
 <DM6PR12MB4250A3267C2472E9F4170F0EFB229@DM6PR12MB4250.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <160345a0-3ab1-11ce-e04b-35be3450bfdd@amd.com>
Date: Fri, 28 May 2021 14:23:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <DM6PR12MB4250A3267C2472E9F4170F0EFB229@DM6PR12MB4250.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c3f6:1c8f:ede0:3bcb]
X-ClientProxiedBy: PR3P191CA0004.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::9) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c3f6:1c8f:ede0:3bcb]
 (2a02:908:1252:fb60:c3f6:1c8f:ede0:3bcb) by
 PR3P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Fri, 28 May 2021 12:23:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef1ed209-2c1f-43cd-78ce-08d921d35bf7
X-MS-TrafficTypeDiagnostic: MN2PR12MB3840:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB38402A3F76EEB715761899C783229@MN2PR12MB3840.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lZwJdCVM4IeeQEKIzxQBtZBv2S/4FpAjaJtpR4e1OjExVty6n4Qwxbp5YuSJQt1wbzgwZC4lP0iq3Cf/SGpm88HoZU0cRf57CPVIjV66VaLSyKK7pN3ZoCh4ZXCk9kqA7ZWNmxeYhw27RaNUQLnD+kagJv+NS2lM/Q+a/ozrzol44331yvQATz1eKXLZYa+DFEiQUhQwQ3r7sJNT28CljJjvx/r2HFW7KRweqQaqpf0C7jJq5TAJIhSTG8WGorpzG6zP9BXpahsihNa9yS+d2RuU3L6+za76m6bkcfTxB+ktV3/NHtlHXSFbJOpqZifE9bTHtl76iEtxILX+NWGp8Htz2LJbbJqpycGUi9QIUaVJWyh746TiDU9c/9/1yH8kwve96zDh3v/n7WDpBV2PBJ80m2Pxg2NF2WTBjLPMHG+cthaQeKkLZGeGeVr/StU9TjJYrLgWOothE9rROPhk2lz6xJ3+VrSmHSVRbE25zUwJU2P4l0pNC69kyoyp27BEssTeLg8WefWMaPiCpLFfgHOGmoUG+UO7XKfsXnODnjYDhzMxsRhFXdXznnegsUTxzKAkuSz4soxXsGiAGyU1DFm9qyv8isIDV2RW7cEfwlbBCU5yNDgWHEkIVN78vWYeipOvHTYyHu+hDvVGdM910ySFiSw+QD6hivA55fbQ3nkBFQS4HAJYQk/chQjeM/Yy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(39850400004)(366004)(376002)(478600001)(53546011)(186003)(16526019)(36756003)(316002)(450100002)(4326008)(110136005)(2906002)(54906003)(31696002)(8676002)(38100700002)(8936002)(6666004)(66556008)(66476007)(83380400001)(6486002)(86362001)(66946007)(31686004)(2616005)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZHZmckYzeFBqYzRxcnNjQWJkNThZVWx6b1IreHlqNDJLZEVqVTl1ZUh4c1dW?=
 =?utf-8?B?QmFaQkV3b1RSNTI5ZGFnSUN6TXlyS2c4TFkzem44VWtwY0Izeks2aFFkTVVa?=
 =?utf-8?B?ZWVhckQ0RmhWQUNhRlB6Tm9qakJ4Q25wMkg5YXl4LzhrSllYV0VKQTRpQUFz?=
 =?utf-8?B?K3FxUzB6WkFzbWo2S3MxUFlmMmFzbTlmUmQyd09Qb0N3RjVQMWJxUXNKOEpn?=
 =?utf-8?B?anlzb0V1TjFIQlZvWFRic0Q5OW9MeUcxd2tJVnhLNVh6cW9IUFVrOUk4NkF4?=
 =?utf-8?B?b2hjakJUcGlscGl5VHRVVCtTNm44aXFyRks5V0Q2ejZPYS9NQTBvTHByRDhx?=
 =?utf-8?B?dXNwU0dqS0FlcUQva056Q0huQUc3S3AwbkE1dGJ2WTNkY0VhSFpRUnQxeUtt?=
 =?utf-8?B?bHJWcDVCTXB4NFkrZ1ZVNUwyanJLSUpkdklNWlB1Y05oa2NqRHBvN1ZCZ3hQ?=
 =?utf-8?B?UTYvTFhkakFFTUtoSFFFaklhZXBiNldhcWJpdHZYcDRGd3BsaUFtWnFFMnBx?=
 =?utf-8?B?aEE0R1UydllyamQvdEtWa3NSY1QzMkhWWnAyYVU0OFJLMDJjc2J2Y2pyVFBG?=
 =?utf-8?B?dUI2RFFZMjMwdFlTaWtCYWl5Rm9IUUc2SGt1akFmbkQ4NzV2L0RqWmxMVE8y?=
 =?utf-8?B?RWxGZGNhREFadkF4NDJSTk5vY2o2ZkFWYy8wblVGakYrelJoRGJUOGpkM2hq?=
 =?utf-8?B?TEpiU294aEl6Y3pneS9rdGdtbXNxdXhWRXQ1ZFZraS9vYWwrcTVZNkxPazZ2?=
 =?utf-8?B?QzAwTnBkZzQ5bHgrSDdZbExUakRWSDdXR2pweHJJdEZ0YlVBMEFGM2UzNVdz?=
 =?utf-8?B?N1E2anhHSG9xSmJhK1Y1YWxTc0lIY0xIbnlMM2ZhUHJJRVA0RVJ1QXdlN0V0?=
 =?utf-8?B?TkZOWGlucWpvTk1nUlo1Qll0czdkVVhoNlRCakJ0SHJFemVRSW9MN01JMGJI?=
 =?utf-8?B?TTdKdmFiRWd1ZEFWazExSVpLM29heFVZaVM1dUZRblFVWVhtdFNRNGEyMnZN?=
 =?utf-8?B?aWdFRXhvbmV2VTJoU1psdVFWT0NyRUd4bk50OXl1RGlOOVY0SkJvSGZZMlRY?=
 =?utf-8?B?S2pWTkNUbVQ1dWZnOGVzcVVBdUVlUVBTL3NVeDkxVXBRN2swOE9NQXJsbDZJ?=
 =?utf-8?B?U3NQWDBtMENNRFgrU3F0dktybDE5V1hZdVFBVU4zSENrL1hueHlJb1FNME1R?=
 =?utf-8?B?OEhweEVpMFphL0JGRnRIRzRnd2ozam9PMU9MTDFTM1lHOW44ZnYwYzg4ZXYv?=
 =?utf-8?B?czRTZ0d2RzJUR3hBSXdMNzFZMmlHdFJsakk0VFhkbWlrZWR4YjdBOVRsNXQ1?=
 =?utf-8?B?K1c5V1YxMjUzZjNSVDNCTWh2OG1wT2ZyR1BiY0FHRDkrVlpHWTh1QXpId3B6?=
 =?utf-8?B?R2lUY3VacGhtbkRvTnpVTmJYS0YyMXh6VEtDalpiQm5rbEFEOW10ZkVzN0lG?=
 =?utf-8?B?UGE2OVF4K0RzTGJ4NXVoR3UvRzRRVTVHNDNJU3FYRU9VemJZa0tJZFV3SHc3?=
 =?utf-8?B?TmZ3UkxKM0VDM2tTK3Q0cDlrQitLYkhQRXRNNjhISHhJUzlDRG5pNEF2NTlz?=
 =?utf-8?B?NWFiMStab1dURkozWm1IV2VWMU9ITjQ2ZENvc1R3N01YcEJPOHlpYVZDbzkr?=
 =?utf-8?B?bVpiNEIySGVxS05tMHFKLzVGNE1adGJYOE9qZDBwcWV3akNRUXlUSTFRSUxQ?=
 =?utf-8?B?bTFEbTlkN2pXMFZCaVVwUkp3ZUN2R2JZTmh2RE9uTWZZUzY4Qkx2RmdSNGh1?=
 =?utf-8?B?bHMrVmZCQ0M1eXM5ek1Ld3VmSVg0bURIT0FjMU5qL0NrY01EUnQyRzJvNHlk?=
 =?utf-8?B?R2wwZFNhQXJrRTl2YWFOUDlYNnB3TjI3RDFKa3o2ZFArOXl2UWI3QTlPWXVx?=
 =?utf-8?Q?zyazt50v626Bl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1ed209-2c1f-43cd-78ce-08d921d35bf7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 12:23:11.7295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7uWluXmow0FD+474O4Ap4WjZg+wLbnnpKmkDaooC31idXnFwKULhCtbr2s69rKXg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3840
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Olsak,
 Marek" <Marek.Olsak@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.05.21 um 11:47 schrieb Yu, Lang:
> [AMD Official Use Only]
>
>
> Inline.
>
>> -----Original Message-----
>> From: Koenig, Christian <Christian.Koenig@amd.com>
>> Sent: Thursday, May 27, 2021 7:51 PM
>> To: Yu, Lang <Lang.Yu@amd.com>; amd-gfx@lists.freedesktop.org; dri-
>> devel@lists.freedesktop.org
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Deucher, Alexander
>> <Alexander.Deucher@amd.com>; Olsak, Marek <Marek.Olsak@amd.com>
>> Subject: Re: [PATCH 2/2] drm/amdgpu: stop bookkeeping of temporary GTT
>> allocation
>>
>> Puttin Marek on CC.
>>
>> Am 27.05.21 um 03:30 schrieb Lang Yu:
>>> To improve buffer migration performace, stop bookkeeping of temporary
>>> GTT allocation, including allocation for BO evicted from VRAM and
>>> bounce buffer.
>>>
>>> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 16 ++++++++++------
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     |  4 +++-
>>>    2 files changed, 13 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>>> index 8860545344c7..32fedd495c7f 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
>>> @@ -111,14 +111,15 @@ static int amdgpu_gtt_mgr_new(struct
>> ttm_resource_manager *man,
>>>    	struct amdgpu_gtt_node *node;
>>>    	int r;
>>>
>>> -	spin_lock(&mgr->lock);
>>> -	if ((&tbo->mem == mem || tbo->mem.mem_type != TTM_PL_TT) &&
>>> -	    atomic64_read(&mgr->available) < mem->num_pages) {
>>> +	if (!(mem->placement & TTM_PL_FLAG_TEMPORARY)) {
>>> +		spin_lock(&mgr->lock);
>>> +		if (atomic64_read(&mgr->available) < mem->num_pages) {
>>> +			spin_unlock(&mgr->lock);
>>> +			return -ENOSPC;
>>> +		}
>>> +		atomic64_sub(mem->num_pages, &mgr->available);
>> After sleeping a night over that I think we need to talk about this part here once
>> more.
>>
>> While temporary GTT allocations can temporary exceed the GTT limitation we
>> still need to account them in the case the eviction is interrupted for some reason.
>>
>> In other words what can happen is that we want to move
>> VRAM->GTT->SYSTEM, but GTT->SYSTEM never happens because it is
>> interrupted in the wait (that's unfortunately rather likely).
>>
>> To solve this I think we should do the following:
>> 1. Change mgr->available into mgr->used (e.g. invert the value).
>> 2. Always account all GTT BOs to the used space.
>> 3. Only when it is not a temporary allocation bail out.
>>
>> This way temporary allocations are accounted for, but we still allow
>> memory evictions to happen under pressure.
>>
>> While at it you could also drop taking the spinlock to check the atomic,
>> that is pretty much unnecessary.
>>
>> Regards,
>> Christian.
>>
> [Yu, Lang] Hi Christian,
>
> Yes, it can actually happen that the BO was evicted from VRAM to GTT domain,
> but was not moved forward to SYSTEM domain. It resides in GTT domain
> waiting for next time validation or eviction or destruction.
>
> It is reasonable that we count all GTT allocation.
> 1, I find if the temporary GTT BO was not counted but used for command submission,
> then we can use more GTT memory than GTT limit for command submission. Is that your concern?

Yes, exactly that.

> 2, Or if we don't count temporary GTT allocation, that will mess up gtt manager.
>
> In other words, if we don't count it when it resides in GTT domain, what is the consequence?

The GTT size is the limit how much system memory userspace can 
intentionally allocate.

This works around stupid applications which tend to allocate as much 
memory as possible (without actually needing that much) and then 
triggering the OOM killer.

> Would like to know your concern. Actually it is counted by ttm_pages_allocated.
>
> If we use "used" instead of "available" in gtt manager, the used size may exceed man size.

Yes, that is intentional.

> We should also deal with gtt mgr debug interface.
>
> Rework the logic like this with your idea:
> 	
> 	if ((atomic64_add_return(mem->num_pages, &mgr->used) > man->size) &&
> 		!(mem->placement & TTM_PL_FLAG_TEMPORARY)) {
> 			atomic64_sub(mem->num_pages, &mgr->used);
> 			return -ENOSPC;
> 	}

Yeah, something like that.

Regards,
Christian.

>
> Regards,
> Lang
>
>>>    		spin_unlock(&mgr->lock);
>>> -		return -ENOSPC;
>>>    	}
>>> -	atomic64_sub(mem->num_pages, &mgr->available);
>>> -	spin_unlock(&mgr->lock);
>>>
>>>    	if (!place->lpfn) {
>>>    		mem->mm_node = NULL;
>>> @@ -178,6 +179,9 @@ static void amdgpu_gtt_mgr_del(struct
>> ttm_resource_manager *man,
>>>    		kfree(node);
>>>    	}
>>>
>>> +	if (mem->placement & TTM_PL_FLAG_TEMPORARY)
>>> +		return;
>>> +
>>>    	atomic64_add(mem->num_pages, &mgr->available);
>>>    }
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> index c0aef327292a..129d39392859 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> @@ -152,9 +152,11 @@ static void amdgpu_evict_flags(struct
>> ttm_buffer_object *bo,
>>>    			abo->placements[0].lpfn = 0;
>>>    			abo->placement.busy_placement = &abo-
>>> placements[1];
>>>    			abo->placement.num_busy_placement = 1;
>>> +			abo->placements[1].flags |=
>> TTM_PL_FLAG_TEMPORARY;
>>>    		} else {
>>>    			/* Move to GTT memory */
>>>    			amdgpu_bo_placement_from_domain(abo,
>> AMDGPU_GEM_DOMAIN_GTT);
>>> +			abo->placements[0].flags |=
>> TTM_PL_FLAG_TEMPORARY;
>>>    		}
>>>    		break;
>>>    	case TTM_PL_TT:
>>> @@ -538,7 +540,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object
>> *bo, bool evict,
>>>    			hop->fpfn = 0;
>>>    			hop->lpfn = 0;
>>>    			hop->mem_type = TTM_PL_TT;
>>> -			hop->flags = 0;
>>> +			hop->flags |= TTM_PL_FLAG_TEMPORARY;
>>>    			return -EMULTIHOP;
>>>    		}
>>>

