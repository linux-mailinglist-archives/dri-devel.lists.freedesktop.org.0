Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 501D55EC822
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 17:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CCE10E467;
	Tue, 27 Sep 2022 15:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F1E10E467;
 Tue, 27 Sep 2022 15:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664293087; x=1695829087;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OBVd10NUp1YlXTREm0E8aVo98/gFLRhQkBGyDVq4N8w=;
 b=kdd77W8Zh3dTKAeXr4UaSQG5Bwfa3xQkSKZk1USqPHu9ALckX8sf8Lyo
 m8RH4W2HWnuecwry0yYwziRLPT7bE+ZmHIEayx+dPp3f4vdBudrklNIE5
 A+6WKxsjEsbC0tI39Cw+FF9b+KMd9oRsSANM5q97AI6GGOG4gGaKRytlP
 pj78XRLI1GfeEGYQ+KTfuYSNQgopTIfU1ru8M2Z2r8xZ97LFBmyiK4lky
 bYx5cf7MtDy/L+sQl3Z4uRrwcc1ZCwWey00/9+h76BvGBT99EIisaXl6g
 6oA9vs+sn3NnaiNPNNVbuxAwAa03eZ+IiTJaSrjTU0RheO/89tmlKBip7 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="281719313"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="281719313"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 08:38:06 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="710604666"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="710604666"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 08:38:06 -0700
Date: Tue, 27 Sep 2022 08:37:44 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC v4 13/14] drm/i915/vm_bind: Skip vma_lookup for
 persistent vmas
Message-ID: <20220927153744.GC16345@nvishwa1-DESK>
References: <20220921070945.27764-1-niranjana.vishwanathapura@intel.com>
 <20220921070945.27764-14-niranjana.vishwanathapura@intel.com>
 <99bbab8d-42e7-2aed-d64a-5bd61dfc9fd6@linux.intel.com>
 <20220924043010.GJ28263@nvishwa1-DESK>
 <38313280-24ed-e778-421c-cc1358e61a35@linux.intel.com>
 <20220926170950.GA16345@nvishwa1-DESK>
 <0c73bf54-e7ef-2c64-cf09-c7e69a0c93c1@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c73bf54-e7ef-2c64-cf09-c7e69a0c93c1@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: paulo.r.zanoni@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 27, 2022 at 10:28:03AM +0100, Tvrtko Ursulin wrote:
>
>On 26/09/2022 18:09, Niranjana Vishwanathapura wrote:
>>On Mon, Sep 26, 2022 at 05:26:12PM +0100, Tvrtko Ursulin wrote:
>>>
>>>On 24/09/2022 05:30, Niranjana Vishwanathapura wrote:
>>>>On Fri, Sep 23, 2022 at 09:40:20AM +0100, Tvrtko Ursulin wrote:
>>>>>
>>>>>On 21/09/2022 08:09, Niranjana Vishwanathapura wrote:
>>>>>>vma_lookup is tied to segment of the object instead of section
>>>>>
>>>>>Can be, but not only that. It would be more accurate to say it 
>>>>>is based of gtt views.
>>>>
>>>>Yah, but new code is also based on gtt views, the only difference
>>>>is that now there can be multiple mappings (at different VAs)
>>>>to the same gtt_view of the object.
>>>>
>>>>>
>>>>>>of VA space. Hence, it do not support aliasing (ie., multiple
>>>>>>bindings to the same section of the object).
>>>>>>Skip vma_lookup for persistent vmas as it supports aliasing.
>>>>>
>>>>>What's broken without this patch? If something is, should it 
>>>>>go somewhere earlier in the series? If so should be mentioned 
>>>>>in the commit message.
>>>>>
>>>>>Or is it just a performance optimisation to skip unused 
>>>>>tracking? If so should also be mentioned in the commit 
>>>>>message.
>>>>>
>>>>
>>>>No, it is not a performance optimization.
>>>>The vma_lookup is based on the fact that there can be only one mapping
>>>>for a given gtt_view of the object.
>>>>So, it was looking for gtt_view to find the mapping.
>>>>
>>>>But now, as I mentioned above, there can be multiple mappings for a
>>>>given gtt_view of the object. Hence the vma_lookup method won't work
>>>>here. Hence, it is being skipped for persistent vmas.
>>>
>>>Right, so in that case isn't this patch too late in the series? 
>>>Granted you only allow _userspace_ to use vm bind in 14/14, but 
>>>the kernel infrastructure is there and if there was a selftest it 
>>>would be able to fail without this patch, no?
>>>
>>
>>Yes it is incorrect patch ordering. I am fixing it by moving this patch
>>to early in the series and adding a new i915_vma_create_persistent()
>>function and avoid touching i915_vma_instance() everywhere (as you
>>suggested).
>>
>><snip>
>>
>>>>>>--- a/drivers/gpu/drm/i915/i915_vma.c
>>>>>>+++ b/drivers/gpu/drm/i915/i915_vma.c
>>>>>>@@ -110,7 +110,8 @@ static void __i915_vma_retire(struct 
>>>>>>i915_active *ref)
>>>>>> static struct i915_vma *
>>>>>> vma_create(struct drm_i915_gem_object *obj,
>>>>>>        struct i915_address_space *vm,
>>>>>>-       const struct i915_gtt_view *view)
>>>>>>+       const struct i915_gtt_view *view,
>>>>>>+       bool persistent)
>>>>>> {
>>>>>>     struct i915_vma *pos = ERR_PTR(-E2BIG);
>>>>>>     struct i915_vma *vma;
>>>>>>@@ -197,6 +198,9 @@ vma_create(struct drm_i915_gem_object *obj,
>>>>>>         __set_bit(I915_VMA_GGTT_BIT, __i915_vma_flags(vma));
>>>>>>     }
>>>>>>+    if (persistent)
>>>>>>+        goto skip_rb_insert;
>>>>>
>>>>>Oh so you don't use the gtt_view's fully at all. I now have 
>>>>>reservations whether that was the right approach. Since you 
>>>>>are not using the existing rb tree tracking I mean..
>>>>>
>>>>>You know if a vma is persistent right? So you could have just 
>>>>>added special case for persistent vmas to __i915_vma_get_pages 
>>>>>and still call intel_partial_pages from there. Maybe union 
>>>>>over struct i915_gtt_view in i915_vma for either the view or 
>>>>>struct intel_partial_info for persistent ones.
>>>>>
>>>>
>>>>We are using the gtt_view fully in this patch for persistent vmas.
>>>
>>>I guess yours and mine definition of fully are different. :)
>>>
>>>>But as mentioned above, now we have support multiple mappings
>>>>for the same gtt_view of the object. For this, the current
>>>>vma_lookup() falls short. So, we are skipping it.
>>>
>>>I get it - but then, having only now noticed how it will be used, 
>>>I am less convinced touching the ggtt_view code was the right 
>>>approach.
>>>
>>>What about what I proposed above? That you just add code to 
>>>__i915_vma_get_pages, which in case of a persistent VMA would call 
>>>intel_partial_pages from there.
>>>
>>>If that works I think it's cleaner and we'd just revert the 
>>>ggtt_view to gtt_view rename.
>>>
>>
>>I don't think that is any cleaner. We need to store the partial view
>>information somewhere for the persistent vmas as well. Why not use
>>the existing gtt_view for that instead of a new data structure?
>>In fact long back I had such an implementation and it was looking
>>odd and was suggested to use the existing infrastructure (gtt_view).
>>
>>Besides, I think the current i915_vma_lookup method is no longer valid.
>>(Ever since we had softpinning, lookup should have be based on the VA
>>and not the vma's view of the object).
>
>As a side note I don't think soft pinning was a problem. That did not establish a partial VMA concept, nor had any interaction view ggtt_views. It was still one obj - one vma per vm relationship.
>
>But okay, it is okay to do it like this. I think when you change to separate create/lookup entry points for persistent it will become much cleaner. I do acknowledge you have to "hide" them from normal lookup to avoid confusing the legacy code paths.
>
>One more note - I think patch 6 should be before or together with patch 4. In general infrastructure to handle vm bind should all be in place before code starts using it.
>

Thanks. Yah, separating it out is looking lot cleaner. Yah, I have further split the patches including patch 6 and move part it to before patch 4.
Everything is looking much cleaner now. Will be posting updated series soon.

Regards,
Niranjana

>Regards,
>
>Tvrtko
