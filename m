Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7ED501833
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 18:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4BD10E0A9;
	Thu, 14 Apr 2022 16:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2752C10E0A9;
 Thu, 14 Apr 2022 16:07:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 682F01F47BE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649952448;
 bh=Iek+toYCvXLe1eOTOtIkFNeoWkFZlRKogy0n340asiA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=H5sP3u2ittdXz4vA6z0mQpfkiKT5+a37TwykspSQgu3DZjC7Dv0Z2Pj7sq6X9TKbE
 +lzpdz21l0SSMTI/BpxhImBrAP3v+mByNlwS3onEqGLKtfheYXuWfUlzIC2Qt16HTQ
 MlqcifTu9Yz9KPYRKpvSBp/0iegrQrodj1RVfBtD6FwOv2klSE4MIAN8EdiefiEl2e
 AgbETo469gAbb2qXgkzGIqFHY1JZ1a7z+ehID6zhBoEpcn2b28BxqKuGv3VBXWWTSR
 wBABSvihWog65lHHGEczZnxNbJBvtkTxEu14zKnCSOtye5uYVogp13FtbVvBmwvQ/c
 XFHud1nzBDh1Q==
Message-ID: <cc56e644-f20f-27ae-7a21-e40c173dfe1e@collabora.com>
Date: Thu, 14 Apr 2022 17:13:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/5] drm/i915: ttm backend dont provide mmap_offset for
 kernel buffers
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220412151838.1298956-1-bob.beckett@collabora.com>
 <20220412151838.1298956-5-bob.beckett@collabora.com>
 <07e5b1dc442e0b318ee0314f90a433216ed38dcb.camel@linux.intel.com>
From: Robert Beckett <bob.beckett@collabora.com>
In-Reply-To: <07e5b1dc442e0b318ee0314f90a433216ed38dcb.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Matthew Auld <matthew.auld@intel.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14/04/2022 15:05, Thomas Hellström wrote:
> On Tue, 2022-04-12 at 15:18 +0000, Robert Beckett wrote:
>> stolen/kernel buffers should not be mmapable by userland.
>> do not provide callbacks to facilitate this for these buffers.
>>
>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 32 +++++++++++++++++++++--
>> --
>>   1 file changed, 27 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index a878910a563c..b20f81836c54 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -1092,8 +1092,8 @@ static void i915_ttm_unmap_virtual(struct
>> drm_i915_gem_object *obj)
>>          ttm_bo_unmap_virtual(i915_gem_to_ttm(obj));
>>   }
>>   
>> -static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
>> -       .name = "i915_gem_object_ttm",
>> +static const struct drm_i915_gem_object_ops
>> i915_gem_ttm_user_obj_ops = {
>> +       .name = "i915_gem_object_ttm_user",
>>          .flags = I915_GEM_OBJECT_IS_SHRINKABLE |
>>                   I915_GEM_OBJECT_SELF_MANAGED_SHRINK_LIST,
>>   
>> @@ -1111,6 +1111,21 @@ static const struct drm_i915_gem_object_ops
>> i915_gem_ttm_obj_ops = {
>>          .mmap_ops = &vm_ops_ttm,
>>   };
>>   
>> +static const struct drm_i915_gem_object_ops
>> i915_gem_ttm_kern_obj_ops = {
>> +       .name = "i915_gem_object_ttm_kern",
>> +       .flags = I915_GEM_OBJECT_IS_SHRINKABLE |
>> +                I915_GEM_OBJECT_SELF_MANAGED_SHRINK_LIST,
>> +
>> +       .get_pages = i915_ttm_get_pages,
>> +       .put_pages = i915_ttm_put_pages,
>> +       .truncate = i915_ttm_truncate,
>> +       .shrink = i915_ttm_shrink,
>> +
>> +       .adjust_lru = i915_ttm_adjust_lru,
>> +       .delayed_free = i915_ttm_delayed_free,
>> +       .migrate = i915_ttm_migrate,
>> +};
> 
> Do we really need two different ops here?
> 
> Since if we don't have mmap ops, basically that tells GEM it should do
> the mmapping rather than TTM.
> 
> That might of course come in handy for the shmem backend, but I don't
> fully follow why we need this for stolen.

the main rationale for doing this was to avoid 
drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c:can_mmap() presuming 
that is can use I915_MMAP_TYPE_FIXED

As the original backend also did not have mmap_offset handlers for 
stolen, this seemed like a reasonable design.

If desired, we could add a special case for the testing logic, but those 
special cases have tendency to multiply.

> 
> Also for the framebuffer handed over from BIOS to fbdev, Does that need
> mmapping and if so, how do we handle that?
> 

I'm not sure of the usecase there. Do you know of any igt test that 
tests this? I can investigate further if you do not.

> 
> /Thomas
> 
> 
> 
> 
>> +
>>   void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
>>   {
>>          struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>> @@ -1165,10 +1180,19 @@ int __i915_gem_ttm_object_init(struct
>> intel_memory_region *mem,
>>                  .no_wait_gpu = false,
>>          };
>>          enum ttm_bo_type bo_type;
>> +       const struct drm_i915_gem_object_ops *ops;
>>          int ret;
>>   
>>          drm_gem_private_object_init(&i915->drm, &obj->base, size);
>> -       i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class,
>> flags);
>> +
>> +       if (flags & I915_BO_ALLOC_USER &&
>> intel_region_to_ttm_type(mem) != I915_PL_STOLEN) {
>> +               bo_type = ttm_bo_type_device;
>> +               ops = &i915_gem_ttm_user_obj_ops;
>> +       } else {
>> +               bo_type = ttm_bo_type_kernel;
>> +               ops = &i915_gem_ttm_kern_obj_ops;
>> +       }
>> +       i915_gem_object_init(obj, ops, &lock_class, flags);
>>   
>>          obj->bo_offset = offset;
>>   
>> @@ -1178,8 +1202,6 @@ int __i915_gem_ttm_object_init(struct
>> intel_memory_region *mem,
>>   
>>          INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL |
>> __GFP_NOWARN);
>>          mutex_init(&obj->ttm.get_io_page.lock);
>> -       bo_type = (obj->flags & I915_BO_ALLOC_USER) ?
>> ttm_bo_type_device :
>> -               ttm_bo_type_kernel;
>>   
>>          obj->base.vma_node.driver_private = i915_gem_to_ttm(obj);
>>   
> 
> 
