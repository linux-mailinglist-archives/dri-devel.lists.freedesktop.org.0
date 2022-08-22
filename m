Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 814675A0267
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73ACC52AD;
	Wed, 24 Aug 2022 20:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F6E8BD31
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 13:27:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X49jyL6/I3DS1WyNjiSFFAkf1itFqsvdcBVymcnvagu9+z1HVN/yLkc+vrhCW+C7jL9APT6lQyCLR4g8Qzp3vCtWIAHfhNN7j3kTzn3LEtfL541LtgxwAuK3EvhevResRfJq6QbEJ0gxE9c+0wUG4F6M4sPguQB6lt33k49duGqEB/q6ZyjDKtJ86ZcPH3W/uYjRG2bkmPCEmY36FXdq1mvt26Pkw5pYSgNzTKlRJePEGAmmXemEezUdGmxYKzYKMSw05K4v9hrkxlQwNDV1wPo4a8HBJYXXU04djuyG30IV67STjX2l0kEJ85Uh3fbeOaUoJBsElKRmijSR7yeSwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktOVogBkD5xe78mnv7rWfQbWylsX4Jrr5TU5UfzyA0Q=;
 b=gkIHNCB+fHBq3iZmoIMCQ47BpB6icTLBh/WSIPh/q9DWK7f2Tvli55oiRbp8gG4/3tHuGa9xEqd2KKaKvKjo5b428cIQRG2H5LOYZo3Yvxvb4N1qqcMvfq2sZ1Kuq0W+OmbHe1A+ce3wVlP5Kcs4bARkZ9jus+SWaQn0ZMRh4uBLyu4oP2xcZ8KkEg1fjtZEpozSaDK8O+1XxezCspNWYVPcsCItXpGlsH8cZDaRvUohIqRVd3mvWeqF4CBAyZf9FkFi/xoKRtOSORsQeIE6rOjJl1ZF0zDi1StmKWpQCgFH7tw8j2gfexp6nNssdsYBNhqbvZSG7pSGucDNMP1jRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktOVogBkD5xe78mnv7rWfQbWylsX4Jrr5TU5UfzyA0Q=;
 b=jdzR/YkkMLYfmt9Shw0OtfXThqhXP3FL3nLUGeRLv8CR/jlZrMd/b1d3Jzqdvr89bHrJsjaek7molH97WW54EKs0tARxHHRPpWVls+jPnrO+NAU6Uknagv8oUlsNBWyw8f+0+hejTMP5YuIoEVFG4eoz1YN+q4OMvUUF+mgFDxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW2PR12MB2457.namprd12.prod.outlook.com (2603:10b6:907:10::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 13:27:32 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 13:27:31 +0000
Message-ID: <ad584aeb-bbf4-afcf-daaa-eca8f0e08fe7@amd.com>
Date: Mon, 22 Aug 2022 15:27:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: vm binding interfaces and parallel with mmap
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Dave Airlie <airlied@gmail.com>
References: <CAPM=9tzo4n7xKnU+2=gesdLqDJUQ7kBAVCQND6yu5_CTiKo7Cg@mail.gmail.com>
 <CAPM=9twwdeybb_hwvtqbyic3CHYe3+s1LLnT0t_DJAVi9cno4g@mail.gmail.com>
 <CAP+8YyEqdzp3t1ErmpsF_8U1HPRQXoRBd++TjzWCvA5EqbynQA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAP+8YyEqdzp3t1ErmpsF_8U1HPRQXoRBd++TjzWCvA5EqbynQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0069.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::46) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79896770-223c-42fb-09bd-08da844210f2
X-MS-TrafficTypeDiagnostic: MW2PR12MB2457:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RMb0/mV5dCyr2WJwLMOppXXg9kd0IUiHnpWz8g2kg4EFDMKlSP2+2Ua1Eud7bPcfB2puNdopdP20woUgy6TJUHWdUzWNFBgYsB8O3KQ7fgKx00k0I1BeXlrWxd/yzP+Kgn84Fx0aKPGzXnP1M4pAPy6C6pGAMcXg8H/alfep3J62sQYMiRpK9GVjmXTNZ0vRELx/RjnVo6NJBuJT+9K8+lavfg1ne1ynpnEy3Y2g2WxUHwrrv1CeEExIySU17kMTFcr5l6xAo/wb7eeY6qF+YYtat95ZKXW7JZwHXZWtbShx0qtFPXWG+j60UNFBLh8sOit094xCPtzlwcmeIikVE8zlwHus4gF40dknUIOZrXkz48OwMjQ6mHtMRjeBF4K8EZHiTHg8r03cuzwryvYSiCmm29LKGY8h0GIGlAKNWHtQO8gIFjsS0FdDbbRxX059RyH7DvcjeNqEp/2phlmfC/rbHoW1JAOar/hSYTFPyxpFoI/vF9q04tgfNZQqRKZ7U++coVfY9Gsedi3/FSM1WOdhZglQ64jJX4d+K9A/DL4Fjnx45XuvZmQs2cLZAFFKW6Ws8sEihH09O8Jjfq3SYrAzp3bGHsKK1DZJIFyewA1szDonv0Nb91u7jyiklEiSbr9EMlt/EYgjuhOmcHhrOdTPu7GwoNKfutERBX5siIqeFWi2pLefOKy0ApCrOLitruvByVui31C6yNFs2TblYyFkPLYwkQ2XWyiGzcZ4oF+VpbvHxPAUqwQI+Xp8UVxj1lrEP+xpjwQu+W00ehmsBue8YEE+7LLRnuPB4FocwFY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(478600001)(6486002)(83380400001)(316002)(6512007)(54906003)(110136005)(31686004)(36756003)(2616005)(186003)(38100700002)(66946007)(8676002)(4326008)(66556008)(66476007)(2906002)(53546011)(41300700001)(6506007)(6666004)(31696002)(86362001)(5660300002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUtiN3k1OVVRZlZlRUhlNTRId2U4Lzk1dTB1R1ZRNDFJUDlqNWk3cU8ydFNr?=
 =?utf-8?B?TjE4Zld2WHE0cFhCb0Y1RkIrZmRjbHhsWkM2TExqWGNWbGVWOWhWQ1g5Znoz?=
 =?utf-8?B?dW8weVRuUlRjY0xZQ0ZTenlpbjFwNTVXVkJSVnpleHFlTURCOGdnWWJRQmJZ?=
 =?utf-8?B?SWV0K0oyWHBZZ3dlb2VGY2hkOWJkT3VKRnB2aGxIWFJ6RXpFeHoyZngza24y?=
 =?utf-8?B?NEVDdTZqb2VrYWRpcmtWWEVyN2VvNk5WeXRKM3RsV04wNTVGQk5lNUkxRm5a?=
 =?utf-8?B?bFViSWpuU2hXQm8yMkxQYm1wTTBUOUR3MUhmYnRVM1QwNWJ3QXhIYXEvUGRM?=
 =?utf-8?B?Nm9HNUNCVGxCNE1QVVBDNEo4OWdSbXNRbGJ6bmNNcTV5MnpvWG8ydyswNWxY?=
 =?utf-8?B?TG4xR0lYUmJ2ZWtQcFNRVVhUU3dLTWFxVGVYY0pmRnFHTDBFY0wvcVl2eHlq?=
 =?utf-8?B?a3NoZW9SODkvM21GbTJVNlZzSXkwT0tESXV5dEFwbzd4V3dmeFBQdGVlOUFs?=
 =?utf-8?B?VlhNb0JtN2pkRjd5MXNhVmgzVkRmd2twc1JjcXBYb0tLc0JOMzRQME1mQVBJ?=
 =?utf-8?B?UmgwYmNVcGVURXpvNW0wUkNVU0x2RUoyT3NHaEtIK3R5SlhDQ2dwYXVvY0Yx?=
 =?utf-8?B?djY0L0g1Ym1ycDdwZkZFVHV3cjF1bytnYkxSbkdFNzJtRTVxN3Y1VTM2S1Rk?=
 =?utf-8?B?NmltemN6R0g0am9ZNTFZRUNqbllXMmpKTDB3SkYxd1E3MlZ4NXhLbWVkaCsy?=
 =?utf-8?B?VW9KcW9mUVlqaW00OVFJcXJDQlZvNjFEVGY3dDRpL3pLckszTTYwS3VxTkpY?=
 =?utf-8?B?dExuR3k5dGFFUXlEUlhIeExjOFc5emNJV2ZMazNnZ0pLY1VBV0VKQTl2aEJH?=
 =?utf-8?B?UGtZRG1JV2t1QXpzaE5yTVFQYWVMWkF6aEVrWE9OclBleGVKTWNzQVhjd1Mw?=
 =?utf-8?B?a21GR3VGU3hKay9tQVJUaFl5WGZlOVY5Zzl3OGFhSUU4a1BGTW5oaHJaeVpB?=
 =?utf-8?B?RUNacDgwK1k2UFRpeU9DNGlYNmtCemNIbmxIdUdSQmx1NjVDaWJmVmRNcElF?=
 =?utf-8?B?OG9sWDZkck5oZHdZZmliUUdnTUJxc3g1S0wwMVhSakdoRzhqTHFLVDI5ekRN?=
 =?utf-8?B?M1dkMU10TkVqb3V1NUhaVzFNeEFRUzlYZUdFTlE2NFhzQzhjRzlrTUZDZjBo?=
 =?utf-8?B?L3JqZHlyNWY1emxycXpMS3BJbGEvcThETWFBeDRYWVp6Qzl2d1VkVlFjMDJY?=
 =?utf-8?B?UzZCMnRLcnF0WEZCbDF5TW9wditNUDkrVW55TXlic1NGYVI5aHVhYXN5OVFi?=
 =?utf-8?B?MnVXZnNGT2Z5S3hUZW54S3BjRDdwZWhYOG53WXAwb01NRmJZSWtyajd6aVdu?=
 =?utf-8?B?VzYyRS8vZGVpN0lFZ2t6akszZkxFTkxWVEZuOG45OHU3UmNwQTFuUGhObEs5?=
 =?utf-8?B?OWllNEkvRDU1czQrYnBOeWV4RFRKd1pWZ1ZmNENKN3VIdVhFcmpxbEZlNlR5?=
 =?utf-8?B?T0s2QmxkMVpXQXNPcUV1WmtSYm5OdHRSZ1VaemNNdE5ZVEFYWUNUMWRRTXJW?=
 =?utf-8?B?endycWx2VFg2NTJ5bFdZNVN6U0pVOERxdVhvbmtsajZlSWRxMDhuZHJoK1Jj?=
 =?utf-8?B?TG5HZUw5SUF6RkdEczJxOE5xK09GZTBDZU42L0hYM0dVeWxuaVcwdkFmZC9K?=
 =?utf-8?B?MkNyV2NFZy9Pc3RNaHU2eVczb0pEbWJJaURtS0VkNnNMMm5RczF1RFZORDh0?=
 =?utf-8?B?OVorOXI4NTVBLzF3TURtNjlMR1ZxMmVvbFV2cTE3UnNTVE0zTUNXNTN4MjJ5?=
 =?utf-8?B?YnozN1RvTmtPNUt4bWx6aGp5c01NSXNDNGVVZkYxWHViZVBCUmFzMllpOEdP?=
 =?utf-8?B?VUp0VjRiU3pUZUpGbG9uckFJeEJUWmxVSW16K0ZtOEhvUXpJV2FMWVZyMmRp?=
 =?utf-8?B?V2EydTRvOUVybjJhUEJOZm9SbE43SDlydHEyMGIyS2tPL0E1MVVYMlV6N0lG?=
 =?utf-8?B?RHNCY2dKK1JYTnAzWXVlbDJReDBOcU1uNG5QUEtpYTVsQnEyZVZzeVRtV0Fl?=
 =?utf-8?B?cHgxaWR2YWpHTDVlcmtNbVYxR0xiY3VLaDR3dGgyQ0loYWFPeHZONUZaWnho?=
 =?utf-8?B?d3I0Qi90Q0wzYUdzeTlYRkNER1lqNFdlVmNVSzJyV1FSQTdBeVpjMXJjdHI1?=
 =?utf-8?Q?ErdRiXJus5Rq+eAENmrQEgD8na4Nf/X3A3j281FZjQyb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79896770-223c-42fb-09bd-08da844210f2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 13:27:31.6164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UU7QN/MWOidekblE/hEMWl3Wlx/49e6m6zcWsap23VPIFifbhLRPjltSqglReXkM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2457
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Ben Skeggs <skeggsb@gmail.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.08.22 um 10:34 schrieb Bas Nieuwenhuizen:
> On Mon, Aug 22, 2022 at 9:28 AM Dave Airlie <airlied@gmail.com> wrote:
>> On Mon, 22 Aug 2022 at 17:05, Dave Airlie <airlied@gmail.com> wrote:
>>> Hey,
>>>
>>> I've just been looking at the vm bind type interfaces and wanted to at
>>> least document how we think the unmapping API should work. I know I've
>>> talked on irc before about this, but wanted to solidify things a bit
>>> more around what is required vs what is a nice to have.
>>>
>>> My main concerns/thoughts are around the unbind interfaces and how
>>> close to munmap they should be.
>>>
>>> I think the mapping operation is mostly consistent
>>> MAP(bo handle, offset into bo, range, VM offset, VM flags)
>>> which puts the range inside to bo at the offset in the current VM
>>> (maybe take an optional vm_id).
>>>
>>> now the simplest unmap I can see if one that parallel munmap
>>> UNMAP(vmaddr, range);
>>>
>>> But it begs the question on then how much the kernel needs to deal
>>> with here, if we support random vmaddr,range then we really need to be
>>> able to do everything munmap does for CPU VMA, which means splitting
>>> ranges, joining ranges etc.
>>>
>>> like
>>> MAP(1, 0, 0x8000, 0xc0000)
>>> UNMAP(0xc1000, 0x1000)
>>> should that be possible?
>>>
>>> Do we have any API usage (across Vulkan/CL/CUDA/ROCm etc) that
>>> requires this sort of control, or should we be fine with only
>>> unmapping objects exactly like how they were mapped in the first
>>> place, and not have any splitting/joining?
> Vulkan allows for this, though I haven't checked to what extent apps use it.

This is massively used for partial resident textures under OpenGL as far 
as I know.

E.g. you map a range like 1->10 as PRT and then then map real textures 
at 2, 5 and 7 or something like that.

Saying that a functionality to map/enable PRT for a range is necessary 
as well. On amdgpu we have a special flag for that and in this case the 
BO to map can be NULL.

> We could technically split all mapping/unmapping to be per single tile
> in the userspace driver, which avoids the need for splitting/merging,
> but that could very much be a pessimization.

That would be pretty much a NAK from my side. A couple of hardware 
optimizations require mappings to be as large as possible.

Otherwise we wouldn't be able to use huge/giant (2MiB, 1GiB) pages, 
power of two TLB reach optimizations (8KiB, 16KiB, 32KiB.....) as well 
as texture fetcher optimizations.

>> I suppose it also asks the question around paralleling
>>
>> fd = open()
>> ptr = mmap(fd,)
>> close(fd)
>> the mapping is still valid.
>>
>> I suppose our equiv is
>> handle = bo_alloc()
>> gpu_addr = vm_bind(handle,)
>> gem_close(handle)
>> is the gpu_addr still valid does the VM hold a reference on the kernel
>> bo internally.
> For Vulkan it looks like this is undefined and the above is not necessary:
>
> "It is important to note that freeing a VkDeviceMemory object with
> vkFreeMemory will not cause resources (or resource regions) bound to
> the memory object to become unbound. Applications must not access
> resources bound to memory that has been freed."
> (32.7.6)

Additional to what was discussed here so far we need an array on in and 
out drm_syncobj for both map as well as unmap.

E.g. when the mapping/unmapping should happen and when it is completed 
etc...

Christian.

>
>
>> Dave.
>>> Dave.

