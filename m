Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D4F4BEC1B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 21:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E98B10E35D;
	Mon, 21 Feb 2022 20:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1370210E35D;
 Mon, 21 Feb 2022 20:53:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QlIWXkBIB83Fl2tckkSGPPtjrLSAmDcNvFx18E6uk/mGBoe2/okd46mBbC84u8RzxYzAxYRCKOTq4pq6aMdTM7UaLaH0OUzeciPobTG1OX+/OlurOZIICpoEgTFKztM68CH/2D9dM9gQA2ly5Wc1KgtxAhOQR+XY6w1q/WWBpraFpNdopF4OL/hecVT2qB2NFAMbcpIsSPl4l3d2fwTJltYdJ8QaLMFpvleRKgMdDUQMe2yHvzKWaI9dtHQhE6+p+mykRKDqasGLYyFLcJEbKmhIwuO8NDUjstsVoMZvAZjncHXscbY83b+eogxswxIi+pRZLVhjAzVwZkbs1prBsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EE7dN1e/0zpHBzbiIVQzIXO5CQidk9F5L5lCaQLxPY=;
 b=EOI0gOdz0FyYXiyKNhNUCBL5CJAUoiuJQuuVdyulu68lpR07MEHnquDog0LfEbmmrZMGaAsHg0tBjaLIewJc77swsg4oRU6ZvasB6DI/QPs2atGqi8iCPwcan9mgQqqFloUyRQ6XSeH3wsotP0eNfsb1Y2PDWUEKzLwWS+mB4PayTuWNuCyhG70Og7SkEL58XtMvDns7jdYnlsICqbinWjigRRWE1v7dvymj9aZMS6DgBo+4NvEtsoda6o/mZwMfNXfYFCehYL0wbpQ+pJ0mGwFSsP7M9CQD4Of8orLyD4f92IvK51DWqkUz4MWYKLBvJf4Lmt/XKSqpNeY551KlzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EE7dN1e/0zpHBzbiIVQzIXO5CQidk9F5L5lCaQLxPY=;
 b=NvgDiSh70WWXKPae356simNPw77DhhbexzspV9ftdoVzYk0F0nig115QKvt7+yXc2eLKauQ/jXRYepSoOaNRc6JykpX7SLN1hD3BgIFcwLQGGL/PLlruRzRNSAErwqHHY6JnhfU8Mt/f/vVWmuesM7g2hAHrOoJY5VVH1jhQGfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CY4PR12MB1318.namprd12.prod.outlook.com (2603:10b6:903:38::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.16; Mon, 21 Feb 2022 20:53:11 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::7587:626e:3703:9db8]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::7587:626e:3703:9db8%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 20:53:11 +0000
Message-ID: <84b3679e-8900-ae51-e700-867631618829@amd.com>
Date: Mon, 21 Feb 2022 15:53:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] drm/amdgpu: fix printk format for size_t variable
Content-Language: en-CA
To: Tom Rix <trix@redhat.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, guchun.chen@amd.com, Prike.Liang@amd.com,
 Hawking.Zhang@amd.com
References: <20220221173737.3725760-1-trix@redhat.com>
 <84e354ec-cfbf-a23f-ddd5-417d6f029873@amd.com>
 <e490241d-9a22-f873-2b15-18b12896ea65@redhat.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <e490241d-9a22-f873-2b15-18b12896ea65@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0141.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::34) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 935bdfbc-54d0-4077-62df-08d9f57c2bf3
X-MS-TrafficTypeDiagnostic: CY4PR12MB1318:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1318DEF7E5ACCC3AB1886901993A9@CY4PR12MB1318.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0+6Xxy7YWjmindd2ux12x1kKBxXOCwFwHzP7BukNDvspcVmM7Z/Dkszj/8c8koGU7IM7VZWvTHibErmi+KpiccJr2e+F7T2/et4BoNtAM7CZrSjG4IxWd9SWQvlQii1FsxiHSX2biY6Wz7ASiLLzAbJ2D+9MVShxvrACo0XRp5BQZRFQ55FUqvGqonRnriQJ+H4XcsCb7F8mc9trfe7sswuqT4KSeeAoop65C3OJwRy6tBKibjFkItw1l8lw136r/LhqWRGfYsuJTf8HXlJWL2r1JLWpURkDaz31L4wQziL62IaB4d6uMnLSCSOesXCi6vDsm4Na/0Eq1OASjKxUGLrrW9SCTyJIcditpJFDycnvbinr6UFQ3LvegG+++9LsksritTimQ6gK+AJRGF5DvRgRBt1yPR95fP72EDtzJ6XcRRrmuoYARdw/MDwTmA3dycvNtvs8iPyX6eLHPixXpXhbO8Kt4v+sIgXzRad0zm3JjeYcTlE5asRtuWYCAfuqlX9Gub2NZb4tUFKWrOKqZUWiGGmvzt5gpxrfae2t0J3Ps3U4FZuqrfTMFyQ5gw/8la6dahrnjrv3JhBxu9UbnMVuZd/YCVZ8EolRleM2Q2nWsbZ0Ybc1/DFNRrZeC0kCS/CZU/1vWgKwB5lXX0NNQETaS0W7NCVctKvxBWxb5JMotk2OU0Ki3uHel9OXAzzLQigy5tS96G2l+ZPqgarrwUQXSMWpKlj7SSU8kBNZPH3AV4EovidzBEAfnJkRSj9e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(6506007)(36756003)(2906002)(6512007)(31686004)(66556008)(6666004)(86362001)(26005)(31696002)(2616005)(53546011)(44832011)(8936002)(4326008)(186003)(66946007)(8676002)(6486002)(508600001)(38100700002)(5660300002)(316002)(83380400001)(6636002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzZrRkVkTlduMDJmTDhVNGlKNUs0Tjhoc0F5ODQ2WEZWZm1yckh1UmR0VW5M?=
 =?utf-8?B?cGJnanVyWjQ5aFFlK0U0Y1V0VFUwbmZ3MmVWaFQwZTNtbGllRkxnWGdkdjly?=
 =?utf-8?B?OVdtR21uTDg2T1R1blhtSkNNaFdEeVpKS1VDeEhjS1VNNFNkZVFGbVJzcUpX?=
 =?utf-8?B?YUwxN3hSVjV1ekFxWkIyWmp4K0l5aStXVGNoanZZWVVOd1R0RXc5SGorVzBh?=
 =?utf-8?B?VHVFVVgvN29LRkFFck54bnlDQ1ZBY3dnQ2VSUHZwY1NleUdVOTV0Z2h0ZmtH?=
 =?utf-8?B?ZC9lU29QNk1kQzhOdjVMR3V6QlFKOG1SbDBRTTlXRENoRnJpbmVaTzJpRDZi?=
 =?utf-8?B?MHI4ZFpSbERWL3daNi8vQ0wzbTJaMmFIMnJzUlhqelAzOHNMYnplNzh2LzBQ?=
 =?utf-8?B?N0RkS0xoNzhERnVyWU9sZlB3c2NpeGlBK2ZkOVRveXQ0c1haZGhXd25XbGVL?=
 =?utf-8?B?RkNmeTVUM3piREtYR2hPclNtYmhqVU9wRDVzNUx0bFpyelU4aGhqZlo0OVIr?=
 =?utf-8?B?akJ2M3J6YUEzUHJMSDBIOFJwUGJ5YVBtYndzMXk5UWZuWTY5Nkd4Z09ZTzUv?=
 =?utf-8?B?TnJmNzUwRm1JQlMrTGxxSC9hV2V1emZYUFFTeCtvMTh3cmgvWTIxYW1nazk2?=
 =?utf-8?B?cUJSNGxqUklXamFnc2k0Q2VMOGZjd050WUZUMG9iN3lwUHlIME11UmVYTVhK?=
 =?utf-8?B?c25RUWpSS3NpWGhhTVgySG02aUJ3R2FNdFd5Qmw3SEdmREJ2UmtiaU1ZR2Zx?=
 =?utf-8?B?VFZ3MU5JRlVCVHNIMk5Tb1NmYVNtRm1JdUJ3V2pGek83TG16RWdqRlVDRGo5?=
 =?utf-8?B?cGlWSk5zei9FLzE0VVU5WlFIUVo0NlVCYms3WmRvMHEzVHpmUE43bGlpNXdB?=
 =?utf-8?B?YjdvbzlvMmRTN1pTR2dXWm14Ni9rOEpDOU5BKzhHZVhjTDk3Qkk0WkdBQ0RZ?=
 =?utf-8?B?YXF4OGNNVTdGNXVTc2NzZ3hzV05QbjRJdWFaenh2ZTZkSS95Mk9OYmRybGNG?=
 =?utf-8?B?NXhwbHhIaGwrcnd0VndXS2VuNEZFbHA1Mjc3b3M1dXJCL0NnVWZEV0VyRXl3?=
 =?utf-8?B?VmdOdmxBeTRjVUcvRWcwS2FodVBzbkhjbnhaR1p6aGNHSGJvdmVNeS9UYzJn?=
 =?utf-8?B?ZDVPQ1BTR3YwcXluaGVYUjh4NGUwdm9GbURabnhYWHEzc29IVzVCNXBEL3JC?=
 =?utf-8?B?LytZNkhVTHZkK1o3VXJMRW0xWEZoTG1NRmwrVlZmSU9oZzl0a1lEbFBaWHlh?=
 =?utf-8?B?YUU4S2tUWVlYWGJVQzFvY2wvcHBSMDIyTHBBVnIzdmU4ZGx4Q2FMV3EyREMr?=
 =?utf-8?B?KzFoa0h1QjhwcVoxT0wyTWY2aFpqcGMzb2tHWnNJcUZkSXZMY1NPYk5yRFZZ?=
 =?utf-8?B?cW1yT0FCT21aRWk2VndlYUZhM3VrV1p4aytoQXUyT21OREpWUGsza2VEeW5R?=
 =?utf-8?B?QzVGdW1NYkpid0RPWkpETXdXcms5SHRZa2E4YWt3d1JsQzNOQ082ZkpyU05E?=
 =?utf-8?B?aC9EZjRoeW91b1JicXVjbHNNQzBRVkNtUStVNEtvdndrVUhGSjB1WjhiaWhE?=
 =?utf-8?B?VHU2S0pFNjVUanY5UklrNS9aQWJMTXNybjlRSExhL3BZZ1h5OVVEY1FjUlo0?=
 =?utf-8?B?UEhYWEdNUlJRaFM0aDN6ZnM0L0Q5ajBCdm9kTDdEUjc3TGp3aGpvWWl1ZFJo?=
 =?utf-8?B?YzJnam9BamZCdTA3V0htY0ZxSEd1U0UwOUVwK0E1TjdiVW9ZUWJUT2dZRFFx?=
 =?utf-8?B?anZlVFVqTkU5TGRvRnpVU2JTZkpzK0JrL3FjQ3VoVTl2VkJvcmI2VThXbHcv?=
 =?utf-8?B?b0VXd1Z0ZTk0UisrQWpaMUIyNHNVNDVSM2NjRDZBQ1RXZzFTMzVWV0lqZCt6?=
 =?utf-8?B?UzVJaU5KcmF3UDNOb1RXNUgzdlJXS1VXdjFSUFFYV3FtT3pRcXk0Z2JOVStR?=
 =?utf-8?B?ZnhQVmxQV3lyYTRvcVo2bWhRbHZ6ZVdEdjFRUW9tbjJyeVlITVVING94RElL?=
 =?utf-8?B?V0owQmZBUk92S0dibWoxL2hGUFZGSFJxOTFPbERFS0RpY1hlV3lPRnVNcUtj?=
 =?utf-8?B?MEp1Y2o5aGd0bmRYRy91aHBpK2szY1d1SnQ1M2xzeHpOMlpCR3FoelpaY1Jz?=
 =?utf-8?Q?ZOiA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 935bdfbc-54d0-4077-62df-08d9f57c2bf3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 20:53:11.3475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZ2mTO+6UZRFymu3qx30oSGMYdNX7Xa66HtouZvGt/Zl9bAw+BM9MYbs0RpOrCXv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1318
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-21 15:36, Tom Rix wrote:
> 
> On 2/21/22 11:57 AM, Luben Tuikov wrote:
>> Hi Tom,
>>
>> This was already fixed with this patch, and LKML was CC-ed. See the CC tags in the patch below,
>>
>> commit 4f7d7cda90cbd7
>> Author: Luben Tuikov <luben.tuikov@amd.com>
>> Date:   Wed Feb 16 16:47:32 2022 -0500
>>
>>      drm/amdgpu: Fix ARM compilation warning
>>      
>>      Fix this ARM warning:
> 
> I glad it wasn't just mips ;)
> 
> There have been a couple of build breaks with amdgpu recently.
> 
> Nick asked about adding clang to your ci.
> 
> Could at least one non x86_64 gcc also be added, maybe aarch64 ?

Yeah, that's a great idea. I tried the make.cross (for ARM) as per
the initial breakage report, but when I tried it, it got into a loop of
"make ARCH=arm mrproper" --> "make prepare" --> "make ARCH=arm mrproper" --> "make prepare" --> ...
and I couldn't figure out why.

I don't mind adding ARM cross compilation into my local setup.

Regards,
Luben


> 
> Tom
> 
>>      
>>      drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:664:35: warning: format '%ld'
>>      expects argument of type 'long int', but argument 4 has type 'size_t' {aka
>>      'unsigned int'} [-Wformat=]
>>      
>>      Cc: Alex Deucher <Alexander.Deucher@amd.com>
>>      Cc: kbuild-all@lists.01.org
>>      Cc: linux-kernel@vger.kernel.org
>>      Reported-by: kernel test robot <lkp@intel.com>
>>      Fixes: 7e60fbfbdc10a0 ("drm/amdgpu: Show IP discovery in sysfs")
>>      Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
>>      Acked-by: Alex Deucher <Alexander.Deucher@amd.com>
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> index 2506bcf36c870c..6c7ec058125e1d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> @@ -668,7 +668,7 @@ static int amdgpu_discovery_sysfs_ips(struct amdgpu_device *adev,
>>                              le16_to_cpu(ip->hw_id) != ii)
>>                                  goto next_ip;
>>   
>> -                       DRM_DEBUG("match:%d @ ip_offset:%ld", ii, ip_offset);
>> +                       DRM_DEBUG("match:%d @ ip_offset:%zu", ii, ip_offset);
>>   
>>                          /* We have a hw_id match; register the hw
>>                           * block if not yet registered.
>>
>> Regards,
>> Luben
>>
>> On 2022-02-21 12:37, trix@redhat.com wrote:
>>> From: Tom Rix <trix@redhat.com>
>>>
>>> On mips64 allyesconfig, there is this build break
>>> amdgpu_discovery.c:671:35: error: format '%ld' expects
>>>    argument of type 'long int', but argument 4 has
>>>    type 'size_t' {aka 'unsigned int'}
>>>    DRM_DEBUG("match:%d @ ip_offset:%ld", ii, ip_offset);
>>>
>>> For size_t, use %zu.
>>>
>>> Fixes: a6c40b178092 ("drm/amdgpu: Show IP discovery in sysfs")
>>> Signed-off-by: Tom Rix <trix@redhat.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>>> index 7c7e28fd912e..58238f67b1d3 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>>> @@ -668,7 +668,7 @@ static int amdgpu_discovery_sysfs_ips(struct amdgpu_device *adev,
>>>   			    le16_to_cpu(ip->hw_id) != ii)
>>>   				goto next_ip;
>>>   
>>> -			DRM_DEBUG("match:%d @ ip_offset:%ld", ii, ip_offset);
>>> +			DRM_DEBUG("match:%d @ ip_offset:%zu", ii, ip_offset);
>>>   
>>>   			/* We have a hw_id match; register the hw
>>>   			 * block if not yet registered.
>> Regards,
> 

Regards,
-- 
Luben
