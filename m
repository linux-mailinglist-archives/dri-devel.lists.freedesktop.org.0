Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E3140F784
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824DD6EC41;
	Fri, 17 Sep 2021 12:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6C26EC42
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 12:31:06 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d21so14879437wra.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 05:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=o7A57kYyLnLxBk2EpQRgH/I2WuumqcnhiTb054cfE3c=;
 b=SZbQN8vwwsLhU3kygY95IQ0nezGZSNxMoK/x8YjC4MKKgST3177d41hO/yXqVZWf25
 aBKnaQHpklTXzWUOfTO/rjlub9XjiVYBMxFupu1b0Q87A0rnUeOgOOgZbNU+qwdc/U+H
 dZjclpEkSqRbCuXZZEnet9I5TUEQapPkdx16s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o7A57kYyLnLxBk2EpQRgH/I2WuumqcnhiTb054cfE3c=;
 b=zPjc72mCzOGP34n2Ii+y8d9SXL4M91WxT74frFJPEFtWxIKeWaNMSl0MqotKZGY7s8
 CIiH8biHGbFLOMZ6OneGYSBvyI4GECjl6UApzQGtY19KIb8lValCbgz7URqo1yWVKGd7
 Bfk/l5d74aLd7uKOB3IzBepbKROEBEIKY2WWN868aCPM1piEj+kHhyBXBnL7T9mjCv0w
 mAG0eKGGtQH2ySpni+dKq5FhVK2R0gTrsxI9P63VtStGo5tenByzJwQiRrHkecNxnilV
 Y+7JW4NbKE7vivzTPp3h0l5jKEC0lofmsugheIxHUvdj3TpgtkTN4lCx+LdBHxV1FiUn
 a3/w==
X-Gm-Message-State: AOAM533sO3qv4qdvdb9G/NrUq2Ab3G0zlhcFDAYrPgW3PnX4xgn85wg7
 TBi48FAgCymwpKqDYt2N/Ydc8Q==
X-Google-Smtp-Source: ABdhPJxpwEE7l8onXQlLNuW12oGzeMTFB4nKHgxTHgi0OhO/2feZan/noxssuPOPxbbqSqJX+mtukQ==
X-Received: by 2002:adf:8170:: with SMTP id 103mr12045762wrm.167.1631881865219; 
 Fri, 17 Sep 2021 05:31:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n26sm10038744wmi.43.2021.09.17.05.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:31:04 -0700 (PDT)
Date: Fri, 17 Sep 2021 14:31:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, john.c.harrison@intel.com
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: Do not define vma on stack
Message-ID: <YUSKhiKtpQjVcN9O@phenom.ffwll.local>
References: <20210914044933.22932-1-matthew.brost@intel.com>
 <20210914044933.22932-2-matthew.brost@intel.com>
 <CAPM=9tzHmYkf_y2W_1TO2MPeohFQ9MzkTD1s0gmpNgLcWbX1NA@mail.gmail.com>
 <20210914153656.GA23874@jons-linux-dev-box>
 <YUEAb30j+TPBMKGN@phenom.ffwll.local>
 <20210914211022.GA15442@jons-linux-dev-box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914211022.GA15442@jons-linux-dev-box>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Tue, Sep 14, 2021 at 02:10:22PM -0700, Matthew Brost wrote:
> On Tue, Sep 14, 2021 at 10:05:03PM +0200, Daniel Vetter wrote:
> > On Tue, Sep 14, 2021 at 08:36:56AM -0700, Matthew Brost wrote:
> > > On Tue, Sep 14, 2021 at 03:04:59PM +1000, Dave Airlie wrote:
> > > > On Tue, 14 Sept 2021 at 14:55, Matthew Brost <matthew.brost@intel.com> wrote:
> > > > >
> > > > > From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
> > > > >
> > > > > Defining vma on stack can cause stack overflow, if
> > > > > vma gets populated with new fields.
> > > > 
> > > > Is there some higher level locking stopping that from getting trashed?
> > > > or a guarantee that uc_fw_bind_ggtt is only entered by one thread at a
> > > > time?
> > > > 
> > > 
> > > I believe this function is only called during driver load (inherently
> > > one thread) or during a GT reset (protected by reset mutex) so at most 1
> > > thread can be executing this code at once, thus it is safe to use a
> > > global dummy vma in this function.
> > 
> > This kind of stuff must be documented in kerneldoc comments. Please use
> > the inline struct member format.
> > 
> 
> Forgot to include kerneldoc for this new field, will add.
> 
> > Also please document the other fields in that struct, cant hurt :-)
> 
> I'll see what I can do but I didn't write this code and may not fully
> understand all the fields off hand.

Yeah sprinkling FIXME and stuff like that in or leaving it blank if it's
completely unknown is fine.
-Daniel

> 
> Matt
> 
> > -Daniel
> > 
> > > 
> > > Matt
> > > 
> > > > Dave.
> > > > 
> > > > >
> > > > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > > > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > > Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 18 +++++++++---------
> > > > >  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h |  2 ++
> > > > >  2 files changed, 11 insertions(+), 9 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> > > > > index 3a16d08608a5..f632dbd32b42 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> > > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> > > > > @@ -413,20 +413,20 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
> > > > >  {
> > > > >         struct drm_i915_gem_object *obj = uc_fw->obj;
> > > > >         struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
> > > > > -       struct i915_vma dummy = {
> > > > > -               .node.start = uc_fw_ggtt_offset(uc_fw),
> > > > > -               .node.size = obj->base.size,
> > > > > -               .pages = obj->mm.pages,
> > > > > -               .vm = &ggtt->vm,
> > > > > -       };
> > > > > +       struct i915_vma *dummy = &uc_fw->dummy;
> > > > > +
> > > > > +       dummy->node.start = uc_fw_ggtt_offset(uc_fw);
> > > > > +       dummy->node.size = obj->base.size;
> > > > > +       dummy->pages = obj->mm.pages;
> > > > > +       dummy->vm = &ggtt->vm;
> > > > >
> > > > >         GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
> > > > > -       GEM_BUG_ON(dummy.node.size > ggtt->uc_fw.size);
> > > > > +       GEM_BUG_ON(dummy->node.size > ggtt->uc_fw.size);
> > > > >
> > > > >         /* uc_fw->obj cache domains were not controlled across suspend */
> > > > > -       drm_clflush_sg(dummy.pages);
> > > > > +       drm_clflush_sg(dummy->pages);
> > > > >
> > > > > -       ggtt->vm.insert_entries(&ggtt->vm, &dummy, I915_CACHE_NONE, 0);
> > > > > +       ggtt->vm.insert_entries(&ggtt->vm, dummy, I915_CACHE_NONE, 0);
> > > > >  }
> > > > >
> > > > >  static void uc_fw_unbind_ggtt(struct intel_uc_fw *uc_fw)
> > > > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> > > > > index 99bb1fe1af66..693cc0ebcd63 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> > > > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> > > > > @@ -10,6 +10,7 @@
> > > > >  #include "intel_uc_fw_abi.h"
> > > > >  #include "intel_device_info.h"
> > > > >  #include "i915_gem.h"
> > > > > +#include "i915_vma.h"
> > > > >
> > > > >  struct drm_printer;
> > > > >  struct drm_i915_private;
> > > > > @@ -75,6 +76,7 @@ struct intel_uc_fw {
> > > > >         bool user_overridden;
> > > > >         size_t size;
> > > > >         struct drm_i915_gem_object *obj;
> > > > > +       struct i915_vma dummy;
> > > > >
> > > > >         /*
> > > > >          * The firmware build process will generate a version header file with major and
> > > > > --
> > > > > 2.32.0
> > > > >
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
