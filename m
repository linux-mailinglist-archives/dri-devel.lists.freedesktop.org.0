Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A025311B8
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 17:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC112112087;
	Mon, 23 May 2022 15:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03DF10FD99;
 Mon, 23 May 2022 15:52:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 31D9D1F43999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653321153;
 bh=BRBPt5ET+rgbs/sHyY5rXpb/IZ19k3OSJSYokuIVcs0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jTvwol6+oz4NF7k2PhH1jAJ5jyaw5XwD8cy6AmK2OWiXXd/5G4WjhHoMCcKmuymX2
 L0oguiqyOdy498ZoipWwrSIXzQlIOoQe+17mZeIpkYVdRvhEjY4P1rWL8pAELoUggR
 K444h8gjnmfUFKV33eeO9cMhQ9MLR/Z0iRQ/wDEAN4jneEJPrXG8PYdPOOivurDvbT
 AizH9y/wmOmPDiGADNsIcUWxj20eQaSBG0z1p/bLEt2pREZCZRnvvVpezfChPosxZq
 GFGWA0t2kdCdYKGT4yjB6d4+uCuw5Yh2JHZn+O7lVdOXnVIoq6R3s5s02ffWJ4E0zg
 XrTU5+dJoSe8g==
Message-ID: <bafcfe8f-3a19-a01c-8b46-9f2a44b1553c@collabora.com>
Date: Mon, 23 May 2022 16:52:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/4] drm/i915: add gen6 ppgtt dummy creation function
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220503191316.1145124-1-bob.beckett@collabora.com>
 <20220503191316.1145124-2-bob.beckett@collabora.com>
 <3d08eb595c4a4eff02be5385c82d1e1d0e781c98.camel@linux.intel.com>
From: Robert Beckett <bob.beckett@collabora.com>
In-Reply-To: <3d08eb595c4a4eff02be5385c82d1e1d0e781c98.camel@linux.intel.com>
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



On 11/05/2022 11:13, Thomas Hellström wrote:
> Hi,
> 
> On Tue, 2022-05-03 at 19:13 +0000, Robert Beckett wrote:
>> Internal gem objects will soon just be volatile system memory region
>> objects.
>> To enable this, create a separate dummy object creation function
>> for gen6 ppgtt
> 
> 
> It's not clear from the commit message why we need a special case for
> this. Could you describe more in detail?

it always was a special case, that used the internal backend but 
provided it's own ops, so actually had no benefit from using the 
internal backend. See b0b0f2d225da6fe58417fae37e3f797e2db27b62

I'll add some further explanation in the commit message for v2.

> 
> Thanks,
> Thomas
> 
> 
>>
>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>> ---
>>   drivers/gpu/drm/i915/gt/gen6_ppgtt.c | 43
>> ++++++++++++++++++++++++++--
>>   1 file changed, 40 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
>> b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
>> index 1bb766c79dcb..f3b660cfeb7f 100644
>> --- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
>> +++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
>> @@ -372,6 +372,45 @@ static const struct drm_i915_gem_object_ops
>> pd_dummy_obj_ops = {
>>          .put_pages = pd_dummy_obj_put_pages,
>>   };
>>   
>> +static struct drm_i915_gem_object *
>> +i915_gem_object_create_dummy(struct drm_i915_private *i915,
>> phys_addr_t size)
>> +{
>> +       static struct lock_class_key lock_class;
>> +       struct drm_i915_gem_object *obj;
>> +       unsigned int cache_level;
>> +
>> +       GEM_BUG_ON(!size);
>> +       GEM_BUG_ON(!IS_ALIGNED(size, PAGE_SIZE));
>> +
>> +       if (overflows_type(size, obj->base.size))
>> +               return ERR_PTR(-E2BIG);
>> +
>> +       obj = i915_gem_object_alloc();
>> +       if (!obj)
>> +               return ERR_PTR(-ENOMEM);
>> +
>> +       drm_gem_private_object_init(&i915->drm, &obj->base, size);
>> +       i915_gem_object_init(obj, &pd_dummy_obj_ops, &lock_class, 0);
>> +       obj->mem_flags |= I915_BO_FLAG_STRUCT_PAGE;
>> +
>> +       /*
>> +        * Mark the object as volatile, such that the pages are
>> marked as
>> +        * dontneed whilst they are still pinned. As soon as they are
>> unpinned
>> +        * they are allowed to be reaped by the shrinker, and the
>> caller is
>> +        * expected to repopulate - the contents of this object are
>> only valid
>> +        * whilst active and pinned.
>> +        */
>> +       i915_gem_object_set_volatile(obj);
>> +
>> +       obj->read_domains = I915_GEM_DOMAIN_CPU;
>> +       obj->write_domain = I915_GEM_DOMAIN_CPU;
>> +
>> +       cache_level = HAS_LLC(i915) ? I915_CACHE_LLC :
>> I915_CACHE_NONE;
>> +       i915_gem_object_set_cache_coherency(obj, cache_level);
>> +
>> +       return obj;
>> +}
>> +
>>   static struct i915_page_directory *
>>   gen6_alloc_top_pd(struct gen6_ppgtt *ppgtt)
>>   {
>> @@ -383,9 +422,7 @@ gen6_alloc_top_pd(struct gen6_ppgtt *ppgtt)
>>          if (unlikely(!pd))
>>                  return ERR_PTR(-ENOMEM);
>>   
>> -       pd->pt.base = __i915_gem_object_create_internal(ppgtt-
>>> base.vm.gt->i915,
>> -
>>                                                         &pd_dummy_obj_o
>> ps,
>> -                                                       I915_PDES *
>> SZ_4K);
>> +       pd->pt.base = i915_gem_object_create_dummy(ppgtt->base.vm.gt-
>>> i915, I915_PDES * SZ_4K);
>>          if (IS_ERR(pd->pt.base)) {
>>                  err = PTR_ERR(pd->pt.base);
>>                  pd->pt.base = NULL;
> 
> 
