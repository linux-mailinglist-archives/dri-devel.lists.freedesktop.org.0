Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 056A840B8AF
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 22:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CF46E5D1;
	Tue, 14 Sep 2021 20:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01566E5CF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 20:05:07 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t8so171873wrq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 13:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DDG9PdcmOXa2n3le33QPKji3syUWiWHWOF/c2oJOhJM=;
 b=cIp1QsqoMwufYhWeI4pmD4rACA3V2Rm8ZGseTnlKuQ9aCf1f3fVwgglQNiTlHD9C85
 liyI2Rvrm1gSXQruoIvmDxsF5iDmpR5fHreJ+pq3O4zI3KeGKno+Vp3/Kwgscf504zcg
 i73pwKq0EGyAy1fSxnHTde7UMVWilsrfTqmuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DDG9PdcmOXa2n3le33QPKji3syUWiWHWOF/c2oJOhJM=;
 b=42D8LUYwriBC1VOUqXw2SgBI7bTVtyBukJYnqlIvQ21Tp/kXZgeAv5TdD2Am9eOB4x
 hAdqeimtjjOe+FcdOY27I8qxyK82GY1wZATqGwZPwW9rzGCvJxJmXJft1dW8FJHCRhWD
 b7Fu0vxonr3HkIZZcosXEh5AqaqfpbNbCKG9LPfI5sM3tk0wfaQI60/hxcnkz6akABCy
 dg9qFXfK9wkCuwthjgHMuqChGqQMrtoKMO+FuSTIzMI3mmITqncvhZ1rFm/cC3I0ulWk
 3PtayA5XpQHfXr+Ynmy1cyAAWMc3twG+RAF5VB10rUift0eetURBdXh9HJosmRWxQ3qX
 Co0g==
X-Gm-Message-State: AOAM533ixoC68P35Z8jWyw/DT/4mvLUeZa1rGtr4jaruUn1g3KaL/iXz
 EQZ78Se2Yvub3Xzs25boxEEV5g==
X-Google-Smtp-Source: ABdhPJzgcukybCLJiXvHjYhJgi55RRlLKMwzdXaeZxCkc6sBhSx/mWN3v/72WEfVb16XjaFEW3HMOw==
X-Received: by 2002:adf:f805:: with SMTP id s5mr926880wrp.259.1631649906282;
 Tue, 14 Sep 2021 13:05:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r26sm2033278wmh.27.2021.09.14.13.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 13:05:05 -0700 (PDT)
Date: Tue, 14 Sep 2021 22:05:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Dave Airlie <airlied@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, john.c.harrison@intel.com
Subject: Re: [Intel-gfx] [PATCH 1/5] drm/i915: Do not define vma on stack
Message-ID: <YUEAb30j+TPBMKGN@phenom.ffwll.local>
References: <20210914044933.22932-1-matthew.brost@intel.com>
 <20210914044933.22932-2-matthew.brost@intel.com>
 <CAPM=9tzHmYkf_y2W_1TO2MPeohFQ9MzkTD1s0gmpNgLcWbX1NA@mail.gmail.com>
 <20210914153656.GA23874@jons-linux-dev-box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914153656.GA23874@jons-linux-dev-box>
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

On Tue, Sep 14, 2021 at 08:36:56AM -0700, Matthew Brost wrote:
> On Tue, Sep 14, 2021 at 03:04:59PM +1000, Dave Airlie wrote:
> > On Tue, 14 Sept 2021 at 14:55, Matthew Brost <matthew.brost@intel.com> wrote:
> > >
> > > From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
> > >
> > > Defining vma on stack can cause stack overflow, if
> > > vma gets populated with new fields.
> > 
> > Is there some higher level locking stopping that from getting trashed?
> > or a guarantee that uc_fw_bind_ggtt is only entered by one thread at a
> > time?
> > 
> 
> I believe this function is only called during driver load (inherently
> one thread) or during a GT reset (protected by reset mutex) so at most 1
> thread can be executing this code at once, thus it is safe to use a
> global dummy vma in this function.

This kind of stuff must be documented in kerneldoc comments. Please use
the inline struct member format.

Also please document the other fields in that struct, cant hurt :-)
-Daniel

> 
> Matt
> 
> > Dave.
> > 
> > >
> > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 18 +++++++++---------
> > >  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h |  2 ++
> > >  2 files changed, 11 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> > > index 3a16d08608a5..f632dbd32b42 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> > > @@ -413,20 +413,20 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
> > >  {
> > >         struct drm_i915_gem_object *obj = uc_fw->obj;
> > >         struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
> > > -       struct i915_vma dummy = {
> > > -               .node.start = uc_fw_ggtt_offset(uc_fw),
> > > -               .node.size = obj->base.size,
> > > -               .pages = obj->mm.pages,
> > > -               .vm = &ggtt->vm,
> > > -       };
> > > +       struct i915_vma *dummy = &uc_fw->dummy;
> > > +
> > > +       dummy->node.start = uc_fw_ggtt_offset(uc_fw);
> > > +       dummy->node.size = obj->base.size;
> > > +       dummy->pages = obj->mm.pages;
> > > +       dummy->vm = &ggtt->vm;
> > >
> > >         GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
> > > -       GEM_BUG_ON(dummy.node.size > ggtt->uc_fw.size);
> > > +       GEM_BUG_ON(dummy->node.size > ggtt->uc_fw.size);
> > >
> > >         /* uc_fw->obj cache domains were not controlled across suspend */
> > > -       drm_clflush_sg(dummy.pages);
> > > +       drm_clflush_sg(dummy->pages);
> > >
> > > -       ggtt->vm.insert_entries(&ggtt->vm, &dummy, I915_CACHE_NONE, 0);
> > > +       ggtt->vm.insert_entries(&ggtt->vm, dummy, I915_CACHE_NONE, 0);
> > >  }
> > >
> > >  static void uc_fw_unbind_ggtt(struct intel_uc_fw *uc_fw)
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> > > index 99bb1fe1af66..693cc0ebcd63 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> > > @@ -10,6 +10,7 @@
> > >  #include "intel_uc_fw_abi.h"
> > >  #include "intel_device_info.h"
> > >  #include "i915_gem.h"
> > > +#include "i915_vma.h"
> > >
> > >  struct drm_printer;
> > >  struct drm_i915_private;
> > > @@ -75,6 +76,7 @@ struct intel_uc_fw {
> > >         bool user_overridden;
> > >         size_t size;
> > >         struct drm_i915_gem_object *obj;
> > > +       struct i915_vma dummy;
> > >
> > >         /*
> > >          * The firmware build process will generate a version header file with major and
> > > --
> > > 2.32.0
> > >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
