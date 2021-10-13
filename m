Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E36742C803
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 19:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF466E0AB;
	Wed, 13 Oct 2021 17:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 96C066E0AB
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 17:49:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB1A81063;
 Wed, 13 Oct 2021 10:49:39 -0700 (PDT)
Received: from [10.57.95.157] (unknown [10.57.95.157])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C72943F70D;
 Wed, 13 Oct 2021 10:49:38 -0700 (PDT)
Subject: Re: [PATCH v2] drm/cma-helper: Set VM_DONTEXPAND for mmap
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
References: <20211013143654.39031-1-alyssa@rosenzweig.io>
 <YWcSm6szGFdnAvOe@phenom.ffwll.local>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <9048b38d-f4e0-6fec-96dc-0d90909d77c6@arm.com>
Date: Wed, 13 Oct 2021 18:49:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWcSm6szGFdnAvOe@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

Hi Daniel,

On 2021-10-13 18:08, Daniel Vetter wrote:
> On Wed, Oct 13, 2021 at 10:36:54AM -0400, Alyssa Rosenzweig wrote:
>> From: Robin Murphy <robin.murphy@arm.com>
>>
>> drm_gem_cma_mmap() cannot assume every implementation of dma_mmap_wc()
>> will end up calling remap_pfn_range() (which happens to set the relevant
>> vma flag, among others), so in order to make sure expectations around
>> VM_DONTEXPAND are met, let it explicitly set the flag like most other
>> GEM mmap implementations do.
>>
>> This avoids repeated warnings on a small minority of systems where the
>> display is behind an IOMMU, and has a simple driver which does not
>> override drm_gem_cma_default_funcs. Arm hdlcd is an in-tree affected
>> driver. Out-of-tree, the Apple DCP driver is affected; this fix is
>> required for DCP to be mainlined.
> 
> How/where does this warn?

In drm_gem_mmap_obj().

> Also there should be a lot more drivers than
> just these two which have an iommu for the display block, so this not
> working is definitely a more wide-spread issue.

As the commit message implies, all those other drivers appear to end up 
using different mmap() implementations one way or another. Once I'd 
eventually figured it out, it didn't surprise me that the combination of 
a trivially-dumb display with an IOMMU is an oddball corner-case.

> -Daniel
> 
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> Reviewed-and-tested-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Alyssa - thanks for reviving this BTW, I'd forgotten all about it! - for 
future reference the clunky olde-worlde version of reassigning an MR to 
yourself is to add your sign-off to the end of the block (in addition to 
any review tags you may have previously given or choose to add) to note 
that you've chosen to take on responsibility for the patch[1]. FWIW I'm 
also partial to the practice of adding a little note in between if 
you've made any tweaks, e.g. "[alyssa: clarify affected drivers]", but 
that's often more of a personal choice.

Cheers,
Robin.

[1] 
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

>> ---
>>   drivers/gpu/drm/drm_gem_cma_helper.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
>> index d53388199f34..63e48d98263d 100644
>> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
>> @@ -510,6 +510,7 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>>   	 */
>>   	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
>>   	vma->vm_flags &= ~VM_PFNMAP;
>> +	vma->vm_flags |= VM_DONTEXPAND;
>>   
>>   	cma_obj = to_drm_gem_cma_obj(obj);
>>   
>> -- 
>> 2.30.2
>>
> 
