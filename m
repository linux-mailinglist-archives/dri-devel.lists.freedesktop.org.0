Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F34B46B86B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 11:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3C4732BD;
	Tue,  7 Dec 2021 10:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE55973894;
 Tue,  7 Dec 2021 10:06:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="261610367"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="261610367"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 02:06:41 -0800
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="515213213"
Received: from rbogdano-mobl.ger.corp.intel.com (HELO [10.252.51.186])
 ([10.252.51.186])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 02:06:39 -0800
Message-ID: <efa921e6-2a26-a275-9532-11d8efeb650c@linux.intel.com>
Date: Tue, 7 Dec 2021 11:06:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [Intel-gfx] [PATCH v2 03/16] drm/i915: Remove pages_mutex and
 intel_gtt->vma_ops.set/clear_pages members, v2.
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <20211129134735.628712-4-maarten.lankhorst@linux.intel.com>
 <CAM0jSHMdahtPqwh559wBNitxm=XBm1Mws6F7UEWVrns2Qtxa1g@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <CAM0jSHMdahtPqwh559wBNitxm=XBm1Mws6F7UEWVrns2Qtxa1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06-12-2021 18:10, Matthew Auld wrote:
> On Mon, 29 Nov 2021 at 13:57, Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
>> Big delta, but boils down to moving set_pages to i915_vma.c, and removing
>> the special handling, all callers use the defaults anyway. We only remap
>> in ggtt, so default case will fall through.
>>
>> Because we still don't require locking in i915_vma_unpin(), handle this by
>> using xchg in get_pages(), as it's locked with obj->mutex, and cmpxchg in
>> unpin, which only fails if we race a against a new pin.
>>
>> Changes since v1:
>> - aliasing gtt sets ZERO_SIZE_PTR, not -ENODEV, remove special case
>>   from __i915_vma_get_pages(). (Matt)
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> <snip>
>
>> +static int
>> +__i915_vma_get_pages(struct i915_vma *vma)
>> +{
>> +       struct sg_table *pages;
>> +       int ret;
>> +
>> +       /*
>> +        * The vma->pages are only valid within the lifespan of the borrowed
>> +        * obj->mm.pages. When the obj->mm.pages sg_table is regenerated, so
>> +        * must be the vma->pages. A simple rule is that vma->pages must only
>> +        * be accessed when the obj->mm.pages are pinned.
>> +        */
>> +       GEM_BUG_ON(!i915_gem_object_has_pinned_pages(vma->obj));
>> +
>> +       switch (vma->ggtt_view.type) {
>> +       default:
>> +               GEM_BUG_ON(vma->ggtt_view.type);
>> +               fallthrough;
>> +       case I915_GGTT_VIEW_NORMAL:
>> +               pages = vma->obj->mm.pages;
>> +               break;
>> +
>> +       case I915_GGTT_VIEW_ROTATED:
>> +               pages =
>> +                       intel_rotate_pages(&vma->ggtt_view.rotated, vma->obj);
>> +               break;
>> +
>> +       case I915_GGTT_VIEW_REMAPPED:
>> +               pages =
>> +                       intel_remap_pages(&vma->ggtt_view.remapped, vma->obj);
>> +               break;
>> +
>> +       case I915_GGTT_VIEW_PARTIAL:
>> +               pages = intel_partial_pages(&vma->ggtt_view, vma->obj);
>> +               break;
>> +       }
>> +
>> +       ret = 0;
>> +       if (IS_ERR(pages)) {
>> +               ret = PTR_ERR(pages);
>> +               pages = NULL;
>> +               drm_err(&vma->vm->i915->drm,
>> +                       "Failed to get pages for VMA view type %u (%d)!\n",
>> +                       vma->ggtt_view.type, ret);
>> +       }
>> +
>> +       pages = xchg(&vma->pages, pages);
>> +
>> +       /* did we race against a put_pages? */
>> +       if (pages && pages != vma->obj->mm.pages) {
>> +               sg_free_table(vma->pages);
>> +               kfree(vma->pages);
> So should this one rather be:
>
> sg_free_table(pages);
> kfree(pages);
>
> Or am I missing something?

Correct! I missed it. Will fix it up when committing, or if a new version is needed.

