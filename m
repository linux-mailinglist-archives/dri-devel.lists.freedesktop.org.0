Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229AF5AFCD2
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 08:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35D810E37D;
	Wed,  7 Sep 2022 06:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF57A10E37D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 06:49:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9eK5hloTta1wp36YOxf95tNfWOxPQwYCpmcF4I2j6r6DAtQNvMFD51OKOkIb2Ade2qqXB/IFqawzBMdJcdw2bq4Qs2Xzj2q487dzm2RqIzdlaKqi6nb28CkfWixsfNKF+4V9PrN/NQAWmya1ZW4q+8JZgM+3Hv7W//BtURz5b0eEBB+blUayxLkQfjzid+q4MkawOUiZkrNQYbU+BXgCyWyWI7tYAy5TKcV88fpS/wdIHGK+xN9FYD0LmigS4eAEtxVhADY153jjCO1sm/ZHEWfzW/5tfpRggiz8AvAI3VvjSfXNnEZTSRbnNU4HoCW80+JjI4Q0dA4S/2g27n/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WHcKTERWrh9XOL/K5EoOzApFETCUCkt9hA2+DPhc3c=;
 b=ck6f0jzp5XeUcb3dLbR/7cilsbCYjhuPaNRd9HdFD3kR0BQnBNoIw/zdQA+gitAzR3O+F2uKV/A2zKIPMmYmv8gFRN9lFaJrwDHDzSKUoYSvu8z057k1wy2SgJAfbd+WOZD/Vc4H+9NDsXyFbRNWgFOu8j1UV3AN+rT4MBxEwKofJ6EU+AVXQ/lY7+8Xb+PQREhzRmRGjhHUXXW4yARsDcSaZnPN1shccLrrPXU/mpxrh1pb9fZMIlWqyqa1q9PHyAmSMwkIoWJ2uTtgtU4aTPIAUDSwHH7XC+UciadfKwpBRSLfJVtaFOyV6ESIMbGewwPKjnlbqLwXip6B5J0YWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WHcKTERWrh9XOL/K5EoOzApFETCUCkt9hA2+DPhc3c=;
 b=IDsH7lw6M2CA+vKo9VCd6qfE5ZzzvEjBpKvB1CRAWHLCRyZVM/mc/8XpeTVmZn0j0W+dEMhSpzRRKlogAGGApkEuyBYJQADp7N6roVbheRQ9xsSA38jgA6caFapnxxA3OejvQCUP7WbYwuRXu/20jDCRAL+StbHcZbhK3qP1nZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5125.namprd12.prod.outlook.com (2603:10b6:208:309::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 06:49:30 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5612.012; Wed, 7 Sep 2022
 06:49:30 +0000
Message-ID: <e4b016b1-169b-5e62-ab0b-029ebc26fbb3@amd.com>
Date: Wed, 7 Sep 2022 08:48:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] drm/ttm: Refcount allocated tail pages
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 Trigger Huang <Trigger.Huang@gmail.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, kvm@vger.kernel.org,
 kernel@collabora.com, virtualization@lists.linux-foundation.org
References: <20220815095423.11131-1-dmitry.osipenko@collabora.com>
 <8230a356-be38-f228-4a8e-95124e8e8db6@amd.com>
 <YxenK8xZHC6Q4Eu4@phenom.ffwll.local> <YxeoEr6xAtlZ+IrU@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YxeoEr6xAtlZ+IrU@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0231.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::28) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL1PR12MB5125:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a15cded-a3fe-4c42-17cd-08da909d1d54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZTKD38tvPBubZulcOLnuSoh19Qlo12y5rAyJFrFsl7nim68X6gcMDEnpSBUM4o52Up3RhzJZmJR5/uEQ0HiOoprFnMNHM+YMHqVzjMv3hGNLXHCl5DWLAnzJDRj8EIfSSez+m6arBP/YA5l430fsOlRk8vrBUvJ6KLNhg0+5GinXHRCrzAqDCicESBsUo72NbLP+jTSBGgtxGz7mK92tl72ABoCJ+lsDRDkHFF8RQxCHaCTfy9z9Pun6plV/hUnaVNlECTms6olwEuCL+wRhWgzydvGkx51mwiRhUEpFL20qc6w2jwg0WM8qNDZGY8VIiRn9fw6DZoPVvzNRGwnHp7ffMNiQEdO7TC+z3VUAh1JuTp5G/Bn/MoBxKlfy7mZuDjn4IpbOtC0mQk2Yf50Z1a+i3pW5CmGECDZznrWl+15JQmD8KHua0ePGYgxRtgNDaZcG56Ue9y/LmQzb+zfGHBwadMmtkVN/M7xcF2b4/DjbYszvM3tRmNhfQCT4lSSTDZGNVG+U/8m83bj5lFY+GlvE//QmmHj1+oYSXMjRwwqe3eAsXZJVI6JI6PWIlumG4QNKDFbUdxXJRxafKkbmGI1h7IE5pWmr95tRPyFrD33+R+DbC3sCvpCj+q68HZjwg7YPG4HLFtSqSGQpsVZnHrevDh7n1t3QIhBuKMLOOx/xH4zgN0o1/o5B7b97P70RNiigfHK0YSja6hInCY76lZDenx9nABqgJeTcR1k308Ee48NDINaToGxR2OKlRI2H8FzBQUlVSv8ybyrchaJrpXspdAq/51XFBecfKJec6rHV5eDtGYOUOu3C8vmamd7q4kT6F7YdcxZeqAQ+iaSkVJ0zJbdujk9w4wGRo5mgs58=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(45080400002)(31686004)(38100700002)(41300700001)(316002)(36756003)(921005)(110136005)(31696002)(66946007)(66556008)(6506007)(478600001)(83380400001)(8676002)(6486002)(966005)(66476007)(186003)(66574015)(86362001)(8936002)(2616005)(7416002)(5660300002)(2906002)(26005)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHdoZ3RJOUk2bHh5TUNUcU9vWUJvVFlzWGNwVWVsc3RIakQyeXh2bk5oeUpi?=
 =?utf-8?B?UU5vZnIrelNBYXFhWEVYaXBxRVk0STJVVEM4ZzlZZWlrLzBnQTBZWnNDMUVS?=
 =?utf-8?B?dzVXdlRHUnRzK2E5cEM5UXVPeGdjcXh3YUV3R1gwSlN3Tkp3eG92akZsWXo1?=
 =?utf-8?B?dWZEeVJQWWx3Wk1wVm5iTDN1MmZEWFNVeHFKZUxrUlJoRnRURzRVNk8yYkZW?=
 =?utf-8?B?NFRsTVduUHJNVXkrSVRDa2RyZjJGRE1YcnpzL3l4NjJCVXl1cU04eThiYzFW?=
 =?utf-8?B?S3NUYVNVYW1IMk9ocDlOUGxLUkRoTzdjV0pITS9WSHFQNE1NdVVMYkFoU2h4?=
 =?utf-8?B?Vjk0cFdZdnZRdkczbVVvMUwzeWN0ZmxJSVpWSFZ2T1lDMCtaU3JLVDJJcVVK?=
 =?utf-8?B?bDFPb2RBeE5ZdmVQdFk1TGFwc2hhcysyQllpVHlqYWJTY2htZm1vSDYyTUFY?=
 =?utf-8?B?S3IyRUowTjlWa2NnS2V4MGMzZjhqQW1FTFdPc0RLdFpHaEpRRkNGTGJ2OExQ?=
 =?utf-8?B?RVVRVjUxTm0rOExvMEU2VjZCYnBXSEtXOC9QSnBabkphbVhveStQd3BkMGo3?=
 =?utf-8?B?bklkMU1pdGFGM1ZSVklYWlQxS3c0RDh4MzliNjJsd3JFWTI2VzhCMXdNVWtI?=
 =?utf-8?B?c2xVQVIwNjFEd1ViZCtrVWZFMnhudUJlNFVVTDZ5c2Y2ZGNnQ1lKZ20wQzZk?=
 =?utf-8?B?ZzF3NVpDdzA4US9QcTNxYjlCcnRYczJCb09hd05NdU9zb1huTHM1dHhvUzJn?=
 =?utf-8?B?dXlSaThrb01MUy9NV2Zsc21WdWZLQ3V5bVhoTnlBbS91S1F3ZUdZRGx6dk1N?=
 =?utf-8?B?VlYzNTIvajE0YlJuNFRybVRYakUrcFR6b3FiU1JLSnhzemlrWkdvRDV6TGZN?=
 =?utf-8?B?dllhaVlXMm4valFDcDFFNEovdzMxOUNPNTM2THV0Z3ppS0Q2VmQyUllPdnVL?=
 =?utf-8?B?Y3gxOTVQd1drSnlzYjkzSUhqQWROQzlwY1pnNFZ4V2ZUV2psbEZkQnBUd01l?=
 =?utf-8?B?Z0ZwcForWEl2WEhFZ2RXK0lNUHhCQ09RWWhSVnFMaFBuRmswdDJXeC9hcDVy?=
 =?utf-8?B?MThzb2VOaHN5dkdpc3o1a0cxT1lOa05Fb0xkdUdiR3NGcHl6ZGVzYm41U2Nt?=
 =?utf-8?B?R3FzWjEvS2U3VzErdkJtdmFIRU9qOFZQWmhFTkNuVWppWm1Da1NWczNWSW9i?=
 =?utf-8?B?a3FhaU43aXUzS1N3Tlp6V080VVRhQ2YxYmV4dnVQU256a1FNOE1sdmkvWVJ3?=
 =?utf-8?B?MnlCQ3dmM2NPN2dYakZUL284cGx2dmZReUp4YWZzaGJKNjFTNnpBN1ZFTkJW?=
 =?utf-8?B?NTZ3b1VseTlzTHBjMEs1VmlJS3NySkFQK280b2lmZ2EySzhMNzFJSTZaZlpv?=
 =?utf-8?B?b1JZUDhVKzRhSUhZSmR5R29MeGRpMlpJd0RiNVQvSUoyV2s4bFpGazNYVnVN?=
 =?utf-8?B?ZitZd0tZbnFIZjJxcmJkTDlISThqODlaQS9WUXpmcFkwcW9YQ1dydVZyZW9C?=
 =?utf-8?B?bFU5bDNEODdvSXd1SDhQeVBKSi92NzhNTEVRcmx5MWpPMmlUTW5JZEk3bTQw?=
 =?utf-8?B?T0RzSE5ZOU1Rbnl0cmNTdDRaVkhhUkQ2dmt4WUxwRFVudmdJdVpNWW5UckZs?=
 =?utf-8?B?ckkvWFg1ZGtkS3BCWGdRd2JlUDh4c3VJR0p6RDlXMFVwbkpmTjRXbXJEdExt?=
 =?utf-8?B?QkZJWG5INnExUDFCN2VPdGF2N09oZXptdWdsdUwvN0Z0ZFVGWUFkN0gxckZq?=
 =?utf-8?B?bkYrSlU5TnhvVERFNFViQlFKY0VESXNlT1FjcW5JM0l0UEo0akVCTFZZZndP?=
 =?utf-8?B?OUdUZGtPWlFPVWt3NFErZTlhRHEvODRDSm1teGpyKytJYnVpbkZNWnJST0Qz?=
 =?utf-8?B?QzBvelE1UGNjRTFDU25CTDMvMUU1SnNLVVIxMnhaVnlNZUZuM3A4MFM4dlV4?=
 =?utf-8?B?V1d3N3czaVhCR1dUQllpSDd3anJ5c2IzbDc5Q3ZnODlSU2Z4ZzQxdGVnQWNy?=
 =?utf-8?B?cDB0a0taSzZnUENLTGo2WWM4Qkx5Zm9sRW5iTjFoZVpOYVh2Yk14MWFlSVJw?=
 =?utf-8?B?c2M2d05iSFdlTUtiZUltdW9zVWkxOW1xM3lWOExFTjd0bEFzdGxVMmZwVjQ1?=
 =?utf-8?Q?XzhleFf6c9AhkerYmFT99RmjI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a15cded-a3fe-4c42-17cd-08da909d1d54
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 06:49:30.4849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epol+vKQuw/TwnFN9oslkMqY5iolbaSKns7ypQZPNCDAoL+iB77dMd8FATb07QjB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5125
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

Am 06.09.22 um 22:05 schrieb Daniel Vetter:
> On Tue, Sep 06, 2022 at 10:01:47PM +0200, Daniel Vetter wrote:
>> On Mon, Aug 15, 2022 at 12:05:19PM +0200, Christian König wrote:
>>> Am 15.08.22 um 11:54 schrieb Dmitry Osipenko:
>>>> Higher order pages allocated using alloc_pages() aren't refcounted and they
>>>> need to be refcounted, otherwise it's impossible to map them by KVM. This
>>>> patch sets the refcount of the tail pages and fixes the KVM memory mapping
>>>> faults.
>>>>
>>>> Without this change guest virgl driver can't map host buffers into guest
>>>> and can't provide OpenGL 4.5 profile support to the guest. The host
>>>> mappings are also needed for enabling the Venus driver using host GPU
>>>> drivers that are utilizing TTM.
>>>>
>>>> Based on a patch proposed by Trigger Huang.
>>> Well I can't count how often I have repeated this: This is an absolutely
>>> clear NAK!
>>>
>>> TTM pages are not reference counted in the first place and because of this
>>> giving them to virgl is illegal.
>>>
>>> Please immediately stop this completely broken approach. We have discussed
>>> this multiple times now.
>> Yeah we need to get this stuff closed for real by tagging them all with
>> VM_IO or VM_PFNMAP asap.
> For a bit more context: Anything mapping a bo should be VM_SPECIAL. And I
> think we should add the checks to the gem and dma-buf mmap functions to
> validate for that, and fix all the fallout.
>
> Otherwise this dragon keeps resurrecting ...
>
> VM_SPECIAL _will_ block get_user_pages, which will block everyone from
> even trying to refcount this stuff.
>
> Minimally we need to fix this for all ttm drivers, and it sounds like
> that's still not yet the case :-( Iirc last time around some funky amdkfd
> userspace was the hold-up because regressions?

My recollection is that Felix and I fixed this with a KFD specific 
workaround. But I can double check with Felix on Monday.

Christian.

> -Daniel
>
>> It seems ot be a recurring amount of fun that people try to mmap dma-buf
>> and then call get_user_pages on them.
>>
>> Which just doesn't work. I guess this is also why Rob Clark send out that
>> dma-buf patch to expos mapping information (i.e. wc vs wb vs uncached).
>>
>> There seems to be some serious bonghits going on :-/
>> -Daniel
>>
>>> Regards,
>>> Christian.
>>>
>>>> Cc: stable@vger.kernel.org
>>>> Cc: Trigger Huang <Trigger.Huang@gmail.com>
>>>> Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.collabora.com%2Fnews-and-blog%2Fblog%2F2021%2F11%2F26%2Fvenus-on-qemu-enabling-new-virtual-vulkan-driver%2F%23qcom1343&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C37a7d9b0f91249da415b08da90432d3a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637980915471280078%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=XN6wFiWc6Jljekmst0aOCPSTsFLlmkUjD9F%2Fl9nluAs%3D&amp;reserved=0
>>>> Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com> # AMDGPU (Qemu and crosvm)
>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>>> ---
>>>>    drivers/gpu/drm/ttm/ttm_pool.c | 25 ++++++++++++++++++++++++-
>>>>    1 file changed, 24 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>>>> index 21b61631f73a..11e92bb149c9 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>>> @@ -81,6 +81,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>>>>    	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
>>>>    	struct ttm_pool_dma *dma;
>>>>    	struct page *p;
>>>> +	unsigned int i;
>>>>    	void *vaddr;
>>>>    	/* Don't set the __GFP_COMP flag for higher order allocations.
>>>> @@ -93,8 +94,10 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>>>>    	if (!pool->use_dma_alloc) {
>>>>    		p = alloc_pages(gfp_flags, order);
>>>> -		if (p)
>>>> +		if (p) {
>>>>    			p->private = order;
>>>> +			goto ref_tail_pages;
>>>> +		}
>>>>    		return p;
>>>>    	}
>>>> @@ -120,6 +123,23 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>>>>    	dma->vaddr = (unsigned long)vaddr | order;
>>>>    	p->private = (unsigned long)dma;
>>>> +
>>>> +ref_tail_pages:
>>>> +	/*
>>>> +	 * KVM requires mapped tail pages to be refcounted because put_page()
>>>> +	 * is invoked on them in the end of the page fault handling, and thus,
>>>> +	 * tail pages need to be protected from the premature releasing.
>>>> +	 * In fact, KVM page fault handler refuses to map tail pages to guest
>>>> +	 * if they aren't refcounted because hva_to_pfn_remapped() checks the
>>>> +	 * refcount specifically for this case.
>>>> +	 *
>>>> +	 * In particular, unreferenced tail pages result in a KVM "Bad address"
>>>> +	 * failure for VMMs that use VirtIO-GPU when guest's Mesa VirGL driver
>>>> +	 * accesses mapped host TTM buffer that contains tail pages.
>>>> +	 */
>>>> +	for (i = 1; i < 1 << order; i++)
>>>> +		page_ref_inc(p + i);
>>>> +
>>>>    	return p;
>>>>    error_free:
>>>> @@ -133,6 +153,7 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>>>>    {
>>>>    	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
>>>>    	struct ttm_pool_dma *dma;
>>>> +	unsigned int i;
>>>>    	void *vaddr;
>>>>    #ifdef CONFIG_X86
>>>> @@ -142,6 +163,8 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>>>>    	if (caching != ttm_cached && !PageHighMem(p))
>>>>    		set_pages_wb(p, 1 << order);
>>>>    #endif
>>>> +	for (i = 1; i < 1 << order; i++)
>>>> +		page_ref_dec(p + i);
>>>>    	if (!pool || !pool->use_dma_alloc) {
>>>>    		__free_pages(p, order);
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C37a7d9b0f91249da415b08da90432d3a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637980915471280078%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=bGZ1OAxL%2Fd99Nqu49soWZVqvvUKjuD6n6BKkAhMv4fs%3D&amp;reserved=0

