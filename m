Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF9067E63D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 14:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE9A10E174;
	Fri, 27 Jan 2023 13:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F78B10E16A;
 Fri, 27 Jan 2023 13:11:28 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id o20so8084745lfk.5;
 Fri, 27 Jan 2023 05:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xa8fuIDat2gXfa/H2VJD3Xaca5PQBmunWwwCG+6vIA4=;
 b=Yiko1U5ABCg8a1qwW6xUgSmLkn8OAeGyY4KbnAkD3oAMCaqy/jhILlg25Uh0Exvb87
 Z2TG9enPYTyWLnFmy4aV1uq68JwfblrrK4Pk6r9nQjfhkXizneT83l0m7mwtkzx+lVfM
 3RsfHiSxONe/UGRJaZSxTHTFyc0NbDAUqXj+BVX9r96DDSclg1UbUqVnCIGCoM12i8F5
 BosGt2yL7A5HtHwwOZFFngi+32p9jVut2xk6ZIJrwdlHSiMEzKfC2atqVnbVtyBD3VI/
 Zq7LOZpZQOPFrymURjJTemIlH58NiZe19NwivVFYVRSgQu7p0i2DQnP+tHzhadt9XDIm
 U/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xa8fuIDat2gXfa/H2VJD3Xaca5PQBmunWwwCG+6vIA4=;
 b=O/ZnKPFf8GWgOhD3PgHUS3pYhl/jJsglwycd/Wm43sBFlr5K2lJjH5Z8MgpLG6K3fe
 fil2BiT6WwpEZHmHhD5nraP8MvcwcdghTEuCdxQaYVIK1ralClUdRVied6P+/zrnZhEb
 FQY6ZaMgz0BrofAOiEVoymlj4dZCMDKa/t4U+q61pG6Qa9ovexzeN/NHBC37QwYCF6tG
 ZyoH+PYC2zd/0m1pIBw60J+iGw//xcS4h0GtLxnqHl1WtDEAO9kiDDp+YyUJmjrHxwpA
 Z4iesxGfjvuYh01fZpr64S/Iuyx9t4Mp8x4286IMa/MrMi6vQONofcmpETKGFySQB9rR
 NNzA==
X-Gm-Message-State: AFqh2kpldja2kl0g9WZ8+2TI3auhLHrGWCqJJMcRMftq3zZ5jXLhAAbk
 1m+tiAPLa17lA4M+qC1wYQQjJSyENJlpd0ALERQ=
X-Google-Smtp-Source: AMrXdXtBLJ23YU3AFovspc/v9x+h1nvPD/GqsPvtPPeFUEz2/QzyQ1iLpRUf5Ql53URMbj9KoireY6ZIC3lJBSw1C4Q=
X-Received: by 2002:a05:6512:3450:b0:4b5:7dcb:161b with SMTP id
 j16-20020a056512345000b004b57dcb161bmr3385999lfr.74.1674825086317; Fri, 27
 Jan 2023 05:11:26 -0800 (PST)
MIME-Version: 1.0
References: <20230119173321.2825472-1-robdclark@gmail.com>
 <f24be4ca-edde-819a-5bcc-070e0d2e23d1@linux.intel.com>
In-Reply-To: <f24be4ca-edde-819a-5bcc-070e0d2e23d1@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 27 Jan 2023 13:10:58 +0000
Message-ID: <CAM0jSHMwbUHu4kH-Y7F956+Us=TiQLJm_7y+1JbGNDaD-2J8pA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Avoid potential vm use-after-free
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 katrinzhou <katrinzhou@tencent.com>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 Jan 2023 at 16:57, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> + some more people based on e1a7ab4fca0c
>
> On 19/01/2023 17:32, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Adding the vm to the vm_xa table makes it visible to userspace, which
> > could try to race with us to close the vm.  So we need to take our extra
> > reference before putting it in the table.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> > Note, you could list commit e1a7ab4fca0c ("drm/i915: Remove the vm open
> > count") as the "fixed" commit, but really the issue seems to go back
> > much further (with the fix needing some backporting in the process).
>
> It would probably be rather essential to identify the correct Fixes: tag.
>
> Since Thomas, Matt and Niranjana you were directly involved in the patch
> which changed significantly how this works, perhaps there is something
> still somewhat easily retrievable from your memory lanes to help with this?

Sorry for the delay. Fix looks good to me,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Looking at the git history, the fixes tag I think needs to be:

Fixes: 9ec8795e7d91 ("drm/i915: Drop __rcu from gem_context->vm")
Cc: <stable@vger.kernel.org> # v5.16+

>
> Regards,
>
> Tvrtko
>
> >
> >   drivers/gpu/drm/i915/gem/i915_gem_context.c | 14 +++++++++++---
> >   1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index 6250de9b9196..e4b78ab4773b 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -1861,11 +1861,19 @@ static int get_ppgtt(struct drm_i915_file_private *file_priv,
> >       vm = ctx->vm;
> >       GEM_BUG_ON(!vm);
> >
> > +     /*
> > +      * Get a reference for the allocated handle.  Once the handle is
> > +      * visible in the vm_xa table, userspace could try to close it
> > +      * from under our feet, so we need to hold the extra reference
> > +      * first.
> > +      */
> > +     i915_vm_get(vm);
> > +
> >       err = xa_alloc(&file_priv->vm_xa, &id, vm, xa_limit_32b, GFP_KERNEL);
> > -     if (err)
> > +     if (err) {
> > +             i915_vm_put(vm);
> >               return err;
> > -
> > -     i915_vm_get(vm);
> > +     }
> >
> >       GEM_BUG_ON(id == 0); /* reserved for invalid/unassigned ppgtt */
> >       args->value = id;
