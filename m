Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D4D5EADAD
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 19:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A64F10E066;
	Mon, 26 Sep 2022 17:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B5910E00F;
 Mon, 26 Sep 2022 17:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664212227; x=1695748227;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+xMQec/RgTIs9Ml3lMqqvWRtRO3h4vzpU5AtRYjCa8w=;
 b=GK1t0ILJCr0sAXuMmPOJQPXYLGnd0MqiVe5/sNk5g5r9GK4+XL0i82TE
 s5FqGCdNlsQG9KT+Waoms2LoAwirNx7cjL4KF53JBc3NDRqLq3TkWUERg
 CtF5dhmIuQV6t9WE37E2U1umnpzVCB38+8doSH6XboF0ngehFSOatlTpo
 CnIILZcNPHYZrEs1dmdYvVJpy0Gfkjjf9RuEHJUjCXbpqXoVtwt62MrUN
 ZvaUgqZov4E/8QLs7AKZK9FvD9758sac06pIZhMFGRV9hllcHfUSxASMm
 d6aHQMvqrZB3uiLbzjaucAet5T600KxTnHNK9nRLNf0r3TpLgWL7bpkzF w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="362920140"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="362920140"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 10:10:19 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="689637307"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="689637307"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 10:10:16 -0700
Date: Mon, 26 Sep 2022 10:09:50 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC v4 13/14] drm/i915/vm_bind: Skip vma_lookup for
 persistent vmas
Message-ID: <20220926170950.GA16345@nvishwa1-DESK>
References: <20220921070945.27764-1-niranjana.vishwanathapura@intel.com>
 <20220921070945.27764-14-niranjana.vishwanathapura@intel.com>
 <99bbab8d-42e7-2aed-d64a-5bd61dfc9fd6@linux.intel.com>
 <20220924043010.GJ28263@nvishwa1-DESK>
 <38313280-24ed-e778-421c-cc1358e61a35@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38313280-24ed-e778-421c-cc1358e61a35@linux.intel.com>
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

On Mon, Sep 26, 2022 at 05:26:12PM +0100, Tvrtko Ursulin wrote:
>
>On 24/09/2022 05:30, Niranjana Vishwanathapura wrote:
>>On Fri, Sep 23, 2022 at 09:40:20AM +0100, Tvrtko Ursulin wrote:
>>>
>>>On 21/09/2022 08:09, Niranjana Vishwanathapura wrote:
>>>>vma_lookup is tied to segment of the object instead of section
>>>
>>>Can be, but not only that. It would be more accurate to say it is 
>>>based of gtt views.
>>
>>Yah, but new code is also based on gtt views, the only difference
>>is that now there can be multiple mappings (at different VAs)
>>to the same gtt_view of the object.
>>
>>>
>>>>of VA space. Hence, it do not support aliasing (ie., multiple
>>>>bindings to the same section of the object).
>>>>Skip vma_lookup for persistent vmas as it supports aliasing.
>>>
>>>What's broken without this patch? If something is, should it go 
>>>somewhere earlier in the series? If so should be mentioned in the 
>>>commit message.
>>>
>>>Or is it just a performance optimisation to skip unused tracking? 
>>>If so should also be mentioned in the commit message.
>>>
>>
>>No, it is not a performance optimization.
>>The vma_lookup is based on the fact that there can be only one mapping
>>for a given gtt_view of the object.
>>So, it was looking for gtt_view to find the mapping.
>>
>>But now, as I mentioned above, there can be multiple mappings for a
>>given gtt_view of the object. Hence the vma_lookup method won't work
>>here. Hence, it is being skipped for persistent vmas.
>
>Right, so in that case isn't this patch too late in the series? 
>Granted you only allow _userspace_ to use vm bind in 14/14, but the 
>kernel infrastructure is there and if there was a selftest it would be 
>able to fail without this patch, no?
>

Yes it is incorrect patch ordering. I am fixing it by moving this patch
to early in the series and adding a new i915_vma_create_persistent()
function and avoid touching i915_vma_instance() everywhere (as you
suggested).

<snip>

>>>>--- a/drivers/gpu/drm/i915/i915_vma.c
>>>>+++ b/drivers/gpu/drm/i915/i915_vma.c
>>>>@@ -110,7 +110,8 @@ static void __i915_vma_retire(struct 
>>>>i915_active *ref)
>>>> static struct i915_vma *
>>>> vma_create(struct drm_i915_gem_object *obj,
>>>>        struct i915_address_space *vm,
>>>>-       const struct i915_gtt_view *view)
>>>>+       const struct i915_gtt_view *view,
>>>>+       bool persistent)
>>>> {
>>>>     struct i915_vma *pos = ERR_PTR(-E2BIG);
>>>>     struct i915_vma *vma;
>>>>@@ -197,6 +198,9 @@ vma_create(struct drm_i915_gem_object *obj,
>>>>         __set_bit(I915_VMA_GGTT_BIT, __i915_vma_flags(vma));
>>>>     }
>>>>+    if (persistent)
>>>>+        goto skip_rb_insert;
>>>
>>>Oh so you don't use the gtt_view's fully at all. I now have 
>>>reservations whether that was the right approach. Since you are 
>>>not using the existing rb tree tracking I mean..
>>>
>>>You know if a vma is persistent right? So you could have just 
>>>added special case for persistent vmas to __i915_vma_get_pages and 
>>>still call intel_partial_pages from there. Maybe union over struct 
>>>i915_gtt_view in i915_vma for either the view or struct 
>>>intel_partial_info for persistent ones.
>>>
>>
>>We are using the gtt_view fully in this patch for persistent vmas.
>
>I guess yours and mine definition of fully are different. :)
>
>>But as mentioned above, now we have support multiple mappings
>>for the same gtt_view of the object. For this, the current
>>vma_lookup() falls short. So, we are skipping it.
>
>I get it - but then, having only now noticed how it will be used, I am 
>less convinced touching the ggtt_view code was the right approach.
>
>What about what I proposed above? That you just add code to 
>__i915_vma_get_pages, which in case of a persistent VMA would call 
>intel_partial_pages from there.
>
>If that works I think it's cleaner and we'd just revert the ggtt_view 
>to gtt_view rename.
>

I don't think that is any cleaner. We need to store the partial view
information somewhere for the persistent vmas as well. Why not use
the existing gtt_view for that instead of a new data structure?
In fact long back I had such an implementation and it was looking
odd and was suggested to use the existing infrastructure (gtt_view).

Besides, I think the current i915_vma_lookup method is no longer valid.
(Ever since we had softpinning, lookup should have be based on the VA
and not the vma's view of the object).

Regards,
Niranjana

>Regards,
>
>Tvrtko
>
>>
>>Regards,
>>Niranjana
>>
>>>Regards,
>>>
>>>Tvrtko
>>>
>>>>+
>>>>     rb = NULL;
>>>>     p = &obj->vma.tree.rb_node;
>>>>     while (*p) {
>>>>@@ -221,6 +225,7 @@ vma_create(struct drm_i915_gem_object *obj,
>>>>     rb_link_node(&vma->obj_node, rb, p);
>>>>     rb_insert_color(&vma->obj_node, &obj->vma.tree);
>>>>+skip_rb_insert:
>>>>     if (i915_vma_is_ggtt(vma))
>>>>         /*
>>>>          * We put the GGTT vma at the start of the vma-list, followed
>>>>@@ -279,6 +284,7 @@ i915_vma_lookup(struct drm_i915_gem_object *obj,
>>>>  * @obj: parent &struct drm_i915_gem_object to be mapped
>>>>  * @vm: address space in which the mapping is located
>>>>  * @view: additional mapping requirements
>>>>+ * @persistent: Whether the vma is persistent
>>>>  *
>>>>  * i915_vma_instance() looks up an existing VMA of the @obj in 
>>>>the @vm with
>>>>  * the same @view characteristics. If a match is not found, one 
>>>>is created.
