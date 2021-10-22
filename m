Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFAE437500
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 11:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CA96E928;
	Fri, 22 Oct 2021 09:47:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F0B6E928;
 Fri, 22 Oct 2021 09:47:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="229214191"
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="229214191"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 02:47:22 -0700
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="445226439"
Received: from bkokkula-mobl1.ger.corp.intel.com (HELO [10.252.0.159])
 ([10.252.0.159])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 02:47:21 -0700
Subject: Re: [PATCH 2/2] drm/i915/dmabuf: drop the flush on discrete
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20211021125332.2455288-1-matthew.auld@intel.com>
 <20211021125332.2455288-2-matthew.auld@intel.com>
 <c8e40d5f-beda-d5fd-9aa7-df951ba819b2@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <337c653c-4074-9e67-e8c1-04d0d21830da@intel.com>
Date: Fri, 22 Oct 2021 10:47:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <c8e40d5f-beda-d5fd-9aa7-df951ba819b2@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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

On 22/10/2021 10:26, Thomas Hellström wrote:
> Hi, Matt
> 
> On 10/21/21 14:53, Matthew Auld wrote:
>> We were overzealous here; even though discrete is non-LLC, it should
>> still be always coherent.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> index a45d0ec2c5b6..848e81368043 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> @@ -251,7 +251,8 @@ static int i915_gem_object_get_pages_dmabuf(struct 
>> drm_i915_gem_object *obj)
>>           return PTR_ERR(pages);
>>       /* XXX: consider doing a vmap flush or something */
>> -    if (!HAS_LLC(i915) || i915_gem_object_can_bypass_llc(obj))
>> +    if ((!HAS_LLC(i915) && !IS_DGFX(i915)) ||
> 
> Q: I notice that DG1 at least has HAS_SNOOP. Would it be incorrect to 
> use that in this case?

AFAIK DG1 is special in that CACHE_NONE will still snoop transactions, 
which is not the case for other HAS_SNOOP platforms. AFAIK that is part 
of the reason why we also just force CACHE_LLC everywhere on DG1.

Could maybe do s/IS_DGFX/IS_DG1/ here? In case that changes on other 
discrete platforms. And then add a comment.

> 
> /Thomas
> 
> 
> 
>> +        i915_gem_object_can_bypass_llc(obj))
>>           wbinvd_on_all_cpus();
>>       sg_page_sizes = i915_sg_dma_sizes(pages->sgl);
