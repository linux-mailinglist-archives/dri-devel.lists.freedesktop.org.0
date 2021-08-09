Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E623E4C55
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 20:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D823A89CE1;
	Mon,  9 Aug 2021 18:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6371E89CE1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 18:47:26 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id u25so24941850oiv.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 11:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cXI+igpSfU/NETZkXoiO6O25NLP0pE4hyuw4IlxRggI=;
 b=Uwi/Gey/PRIwX5SG8XBtfB5kKo2iiaBmmjjBbIqvGwz0bDMfH8lojZ3KZIgHQsnVBu
 GNGTpJ71r33iVU0jIBzib/zj8l0EkMcsQuzR82Kj0rM+hSvWoQ+HyhML/6ej0iddy+HP
 dwX5E3L4GQsXDNTQ4vvsXbvdsiBhFlGDPgB24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cXI+igpSfU/NETZkXoiO6O25NLP0pE4hyuw4IlxRggI=;
 b=aS8a0rJJV+30Ee/EXkAhdgKVTHeAlR2Znkxqy5A9Vm/QkLfPRt1OENAreBFkJtrFHo
 i3KBbtx2HjXL5CzvumvycRiiXZ14BQXNBI4ItHnUC3IEjt1EHXdjHcQgl2kFHSQhbYop
 sJdqNid+lpq8PTHx2YrA1AfRC7P1wbZ+WqsfQsVnDbTTIJNen0r3ZfWJqdOObZefBrMc
 eSyUI1fBlOQRduJf5gghBwiqN4V6a9JUL509EOTeeZFwfTLc0f0m9qoaWNZVM0yhuFnr
 vqKi3XOctyg74pNrPIOLGnM9s5X2tlG2U9LlYlq8xUYLvxZsgiqo2K0qOYT0tuJbhlwQ
 6vZw==
X-Gm-Message-State: AOAM530AI7/2POfG4DuLs53b0czi7YLxoemi1wBuBamIGqgPTayNdbZb
 5yVful0nmflFfs+RXWLqKdy0/8+LUbdC8ay6SVEY6w==
X-Google-Smtp-Source: ABdhPJwzYeBUlxMaN3/K63of5iCSQURETgri16yBG9wuG6zArB/xMZUUgT6FOpuusXhhjNPAc6rMEd4F91I/o109/ag=
X-Received: by 2002:a05:6808:147:: with SMTP id h7mr463234oie.14.1628534845621; 
 Mon, 09 Aug 2021 11:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210806201852.1345184-1-daniel.vetter@ffwll.ch>
 <17b2342e218.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
In-Reply-To: <17b2342e218.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 9 Aug 2021 20:47:14 +0200
Message-ID: <CAKMK7uF+Q9s5WkN_aJxNWp5Xajcv3=ooDZhq09Hbsg-nr-AWyA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Release ctx->syncobj on final put,
 not on ctx close
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, 
 Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>, 
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Aug 8, 2021 at 2:56 AM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On August 6, 2021 15:18:59 Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
>> gem context refcounting is another exercise in least locking design it
>> seems, where most things get destroyed upon context closure (which can
>> race with anything really). Only the actual memory allocation and the
>> locks survive while holding a reference.
>>
>> This tripped up Jason when reimplementing the single timeline feature
>> in
>>
>> commit 00dae4d3d35d4f526929633b76e00b0ab4d3970d
>> Author: Jason Ekstrand <jason@jlekstrand.net>
>> Date:   Thu Jul 8 10:48:12 2021 -0500
>>
>>     drm/i915: Implement SINGLE_TIMELINE with a syncobj (v4)
>>
>> We could fix the bug by holding ctx->mutex, but it's cleaner to just
>
>
> What bug is this fixing, exactly?

Oh lol I was all busy ranting and not explaining :-) I found it while
auditing other context stuff, so that other patch has the longer
commit message with more history, but that patch is also now tied into
the vm-dercuify, so short summary: You put the syncobj in context
close (i.e. CTX_DESTRY ioctl or close(drmfd)), not in the final
kref_put. Which means you're open to a use-after-free if you race
against an execbuf. ctx->vm is equally broken (but for other ioctl),
once this fix here is merged I send out the ctx->vm fix because that's
tied into the vm-dercuify now due to conflicts.
-Daniel

>
> --Jason
>
>>
>> make the context object actually invariant over its _entire_ lifetime.
>>
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> Fixes: 00dae4d3d35d ("drm/i915: Implement SINGLE_TIMELINE with a syncobj=
 (v4)")
>> Cc: Jason Ekstrand <jason@jlekstrand.net>
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@intel.com>
>> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> Cc: Dave Airlie <airlied@redhat.com>
>> ---
>>  drivers/gpu/drm/i915/gem/i915_gem_context.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_context.c
>> index 754b9b8d4981..93ba0197d70a 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> @@ -940,6 +940,9 @@ void i915_gem_context_release(struct kref *ref)
>>   trace_i915_context_free(ctx);
>>   GEM_BUG_ON(!i915_gem_context_is_closed(ctx));
>>
>> + if (ctx->syncobj)
>> + drm_syncobj_put(ctx->syncobj);
>> +
>>   mutex_destroy(&ctx->engines_mutex);
>>   mutex_destroy(&ctx->lut_mutex);
>>
>> @@ -1159,9 +1162,6 @@ static void context_close(struct i915_gem_context =
*ctx)
>>   if (vm)
>>   i915_vm_close(vm);
>>
>> - if (ctx->syncobj)
>> - drm_syncobj_put(ctx->syncobj);
>> -
>>   ctx->file_priv =3D ERR_PTR(-EBADF);
>>
>>   /*
>> --
>> 2.32.0
>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
