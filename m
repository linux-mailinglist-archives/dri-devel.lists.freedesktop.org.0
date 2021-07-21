Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EBB3D0B88
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 11:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D716EB53;
	Wed, 21 Jul 2021 09:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50AC6E949
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 09:40:51 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so1517333otl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 02:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9jxXwVV+aN3Rmsz4UMzvrUtjRp7srjOGboK+OYH5Kdk=;
 b=LhPCk9YyyxbWlHb+cowVth1I1M2cCfTUqkyPp/DmxHuTijTiqeLfgLgB3he7N4ahyY
 SzP6z27w2Vca6UHnE0gLq2VLIbYpjKZcPIIxSXmbY3o7PuQ6vrnA8zueyvOE/PYa9xnW
 RTpOmb5mtmXZk3W7p5oIGUF9GHPij+4+2T9QQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9jxXwVV+aN3Rmsz4UMzvrUtjRp7srjOGboK+OYH5Kdk=;
 b=ISQtxUuskGeIjJRlxxqRE+2/nk4mr6XIZNWPguFuzW9lrghtsw4PwLQhN0WdLQf7bL
 gPyvApkkLOWq7puTamYlu++vHcBzvvNB69hCNYY+jPgZURUC6xU6Jf5iTnkJBN0kz/LW
 S0a0ApQf5Tb1bcxXL7zaFIdAj1i2N6OTYZrQv1C0u1U2nPeG2Wlo0m6uKdeT4VNjX1Du
 nhStaRq9K0b7TCcH7teyebZEHB5fArKi4Ixi3sszmNf5GsJ+EJvt26jgi7g764gjmUiR
 NgvOvOoaDI+0FEGu+v1ipw0/OnNZhJvi3YbSh5XfCEEEDmg1JCEmPT2+4StEb8kc9+yK
 DwbQ==
X-Gm-Message-State: AOAM530Eo4GXGlrWGtPz9hVSgcNHvpOH6d68zKjQNTm6WfVxDhQcD320
 reWiBGnGF60BIzBZ3atu1aXtmL8QJ7CN5AyAb6zhN4Ki7VU=
X-Google-Smtp-Source: ABdhPJyqySVeOWrWftIeRooADmFBeof6NbpCffW0JVFgb69i4kcAx9TNZlp/PU0RIAEv3xq05jVx8xpvz+fgHjLB9VM=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr26204874otb.281.1626860451258; 
 Wed, 21 Jul 2021 02:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <1626432098-27626-1-git-send-email-xiyuyang19@fudan.edu.cn>
 <20210721020009.GG13928@zhen-hp.sh.intel.com>
In-Reply-To: <20210721020009.GG13928@zhen-hp.sh.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 21 Jul 2021 11:40:40 +0200
Message-ID: <CAKMK7uHFarZMChcVNdxpP=1XKqc+WJCayELvpiAjmzO9YXk+hA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gvt: Convert from atomic_t to refcount_t on
 intel_vgpu_ppgtt_spt->refcount
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, yuanxzhang@fudan.edu.cn,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>, David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 4:21 AM Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> On 2021.07.16 18:41:38 +0800, Xiyu Yang wrote:
> > refcount_t type and corresponding API can protect refcounters from
> > accidental underflow and overflow and further use-after-free situations
> >
>
> Thanks for the patch. Is there any specific problem you run with current code?
> Any shadow ppgtt error?

refcount_t is just part of the kernel hardening project, and
recommeded to be used anywhere it's possible. It doesn't fix bugs
itself, but makes it impossible to exploit at least some of them and
warns in other cases, so easier to catch them if they do exist.
-Daniel

> > Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> > Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/gtt.c | 11 ++++++-----
> >  drivers/gpu/drm/i915/gvt/gtt.h |  3 ++-
> >  2 files changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
> > index cc2c05e18206..62f3daff5a36 100644
> > --- a/drivers/gpu/drm/i915/gvt/gtt.c
> > +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> > @@ -841,7 +841,7 @@ static struct intel_vgpu_ppgtt_spt *ppgtt_alloc_spt(
> >       }
> >
> >       spt->vgpu = vgpu;
> > -     atomic_set(&spt->refcount, 1);
> > +     refcount_set(&spt->refcount, 1);
> >       INIT_LIST_HEAD(&spt->post_shadow_list);
> >
> >       /*
> > @@ -927,18 +927,19 @@ static struct intel_vgpu_ppgtt_spt *ppgtt_alloc_spt_gfn(
> >
> >  static inline void ppgtt_get_spt(struct intel_vgpu_ppgtt_spt *spt)
> >  {
> > -     int v = atomic_read(&spt->refcount);
> > +     int v = refcount_read(&spt->refcount);
> >
> >       trace_spt_refcount(spt->vgpu->id, "inc", spt, v, (v + 1));
> > -     atomic_inc(&spt->refcount);
> > +     refcount_inc(&spt->refcount);
> >  }
> >
> >  static inline int ppgtt_put_spt(struct intel_vgpu_ppgtt_spt *spt)
> >  {
> > -     int v = atomic_read(&spt->refcount);
> > +     int v = refcount_read(&spt->refcount);
> >
> >       trace_spt_refcount(spt->vgpu->id, "dec", spt, v, (v - 1));
> > -     return atomic_dec_return(&spt->refcount);
> > +     refcount_dec(&spt->refcount);
> > +     return refcount_read(&spt->refcount);
> >  }
> >
> >  static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt);
> > diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/gtt.h
> > index 3bf45672ef98..944c2d0739df 100644
> > --- a/drivers/gpu/drm/i915/gvt/gtt.h
> > +++ b/drivers/gpu/drm/i915/gvt/gtt.h
> > @@ -38,6 +38,7 @@
> >  #include <linux/kref.h>
> >  #include <linux/mutex.h>
> >  #include <linux/radix-tree.h>
> > +#include <linux/refcount.h>
> >
> >  #include "gt/intel_gtt.h"
> >
> > @@ -243,7 +244,7 @@ struct intel_vgpu_oos_page {
> >
> >  /* Represent a vgpu shadow page table. */
> >  struct intel_vgpu_ppgtt_spt {
> > -     atomic_t refcount;
> > +     refcount_t refcount;
> >       struct intel_vgpu *vgpu;
> >
> >       struct {
> > --
> > 2.7.4
> >
> > _______________________________________________
> > intel-gvt-dev mailing list
> > intel-gvt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
