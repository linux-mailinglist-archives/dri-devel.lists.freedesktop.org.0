Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33142383C9B
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 20:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF1D6EA31;
	Mon, 17 May 2021 18:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24406E158
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 18:44:30 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 d25-20020a0568300459b02902f886f7dd43so6436142otc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 11:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fDdZCs7l0OYhXx0JX33pgYZ2ZGFA7uvmpo+rV+MoOtY=;
 b=XRJz678ROadS7G6NJSKklmB4xqhXXiB4OT4lrfm2TPC6LjD7w9RRg424UNFrsXfMix
 YVEy/WCV9nQWJ0bmejSSTkn35CS3gmUdADS5T+XqI75qyUjSDvjvFZzXOerWx8i6U/Am
 DngLYkhhaEpbz/rHvz+zvisvtTrLXd2Rkb/QU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fDdZCs7l0OYhXx0JX33pgYZ2ZGFA7uvmpo+rV+MoOtY=;
 b=C0z+5ImP+w2c602JYspPfl+29/wQhg5gnq0enHScNyDEBhbp5VZakpMDL7HvAvRfjS
 Cm6t33C3vaJTb2fWNLnuZCGfGri2ECmbxElEjrIZrrv49J4F4WONExl6et7r+B/QA439
 Yims22tceTm5kbgHx8GvLujISidbom3CmQrDfsXGnUSjnwsusr7hKkq8Xcka0+02vLPO
 ywwh8ALHozqbtgPnM1kWKPm8i6sWuHP6Lou0Bt1Bi5mXPwRXULWcQ7DJf640tLcBEowe
 iYtAqd7DmATMuNhtmiwjnqwG3HZpXLz0NqR/koy5jFZJj3Pv+fQ/gKQDuHSNUS3Gc9qs
 oNNw==
X-Gm-Message-State: AOAM533kfIpPu8/3jNZq53F9Oli91UMbn0ek412ZN/mFlq4fJEiJGWpU
 4+VvPpLd0WNw/Gn4P6iQNdUm0y1mIqQdxYqRD3RMdQ==
X-Google-Smtp-Source: ABdhPJwPx7NGgmngAtwCllJkzTmGAhO/y1ir7jOE4W3vG6rUEXtLJaVZ4HICyO9bjkEKP2IbvdaM1nyvYoQSHoCPjhg=
X-Received: by 2002:a05:6830:1155:: with SMTP id
 x21mr770716otq.303.1621277069594; 
 Mon, 17 May 2021 11:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210503155748.1961781-1-jason@jlekstrand.net>
 <20210503155748.1961781-20-jason@jlekstrand.net>
 <YJGvhfiKTILPsAG/@phenom.ffwll.local>
 <CAOFGe96JZqVxN4btQdqHvrMUm+bgRmSTiNBvQ9fXX36JUnDM=A@mail.gmail.com>
 <YKJyUhkvtq9k9DU0@phenom.ffwll.local>
 <CAOFGe97dM5H8nKvHxamm2mzMvzipLKCK-p1VR+WVeZBWzEk9QA@mail.gmail.com>
In-Reply-To: <CAOFGe97dM5H8nKvHxamm2mzMvzipLKCK-p1VR+WVeZBWzEk9QA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 17 May 2021 20:44:18 +0200
Message-ID: <CAKMK7uE47sVtZ+JrVkVd+DqdaG+zxAR4xbC1C4ctTrJXT+mEgA@mail.gmail.com>
Subject: Re: [PATCH 19/27] drm/i915/gem: Use the proto-context to handle
 create parameters
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 7:05 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Mon, May 17, 2021 at 8:40 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, May 14, 2021 at 02:13:57PM -0500, Jason Ekstrand wrote:
> > > On Tue, May 4, 2021 at 3:33 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Mon, May 03, 2021 at 10:57:40AM -0500, Jason Ekstrand wrote:
> > > > > This means that the proto-context needs to grow support for engine
> > > > > configuration information as well as setparam logic.  Fortunately, we'll
> > > > > be deleting a lot of setparam logic on the primary context shortly so it
> > > > > will hopefully balance out.
> > > > >
> > > > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > > > ---
> > > > >  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 546 +++++++++++++++++-
> > > > >  .../gpu/drm/i915/gem/i915_gem_context_types.h |  58 ++
> > > > >  2 files changed, 587 insertions(+), 17 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > > index 6dd50d669c5b9..aa4edfbf7ed48 100644
> > > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > > > > @@ -193,8 +193,15 @@ static int validate_priority(struct drm_i915_private *i915,
> > > > >
> > > > >  static void proto_context_close(struct i915_gem_proto_context *pc)
> > > > >  {
> > > > > +     int i;
> > > > > +
> > > > >       if (pc->vm)
> > > > >               i915_vm_put(pc->vm);
> > > > > +     if (pc->user_engines) {
> > > > > +             for (i = 0; i < pc->num_user_engines; i++)
> > > > > +                     kfree(pc->user_engines[i].siblings);
> > > > > +             kfree(pc->user_engines);
> > > >
> > > >                 free_engines(&pc->user_engines);
> > > >
> > > > Maybe even stuff that if check into free_engines. Except I realized this
> > > > is proto engines here now :-(
> > > >
> > > > > +     }
> > > > >       kfree(pc);
> > > > >  }
> > > > >
> > > > > @@ -248,6 +255,9 @@ proto_context_create(struct drm_i915_private *i915, unsigned int flags)
> > > > >       if (!pc)
> > > > >               return ERR_PTR(-ENOMEM);
> > > > >
> > > > > +     pc->num_user_engines = -1;
> > > > > +     pc->user_engines = NULL;
> > > > > +
> > > > >       if (HAS_FULL_PPGTT(i915)) {
> > > > >               struct i915_ppgtt *ppgtt;
> > > > >
> > > > > @@ -282,6 +292,439 @@ proto_context_create(struct drm_i915_private *i915, unsigned int flags)
> > > > >       return err;
> > > > >  }
> > > > >
> > > > > +static int set_proto_ctx_vm(struct drm_i915_file_private *fpriv,
> > > > > +                         struct i915_gem_proto_context *pc,
> > > > > +                         const struct drm_i915_gem_context_param *args)
> > > > > +{
> > > > > +     struct i915_address_space *vm;
> > > > > +
> > > > > +     if (args->size)
> > > > > +             return -EINVAL;
> > > > > +
> > > > > +     if (!pc->vm)
> > > > > +             return -ENODEV;
> > > > > +
> > > > > +     if (upper_32_bits(args->value))
> > > > > +             return -ENOENT;
> > > > > +
> > > > > +     rcu_read_lock();
> > > > > +     vm = xa_load(&fpriv->vm_xa, args->value);
> > > > > +     if (vm && !kref_get_unless_zero(&vm->ref))
> > > > > +             vm = NULL;
> > > > > +     rcu_read_unlock();
> > > >
> > > > vm lookup helpers would be nice I guess, but perhaps something that
> > > > vm_bind patches should do.
> > >
> > > I can add those.  I just don't know where to put it.  We don't have an
> > > i915_gem_vm.h.  Suggestions?
> >
> > gt/intel_gtt.h seems to be the header for i915_address_space stuff. Also
> > contains the i915_vma_ops but not i915_vma.
> >
> > It's a pretty good mess, but probably the best place for now for these :-/
>
> The one for contexts is in i915_drv.h so I put the VM one there too.
> Feel free to tell me to move it.  I don't care where it goes.

i915_drv.h is the og dumping ground and needs to die. Everything in
there needs to be moved out/split/whatever for better code
organization. If we have a place already that fits better (even if
maybe misnamed) it's better to put it there.

But also, the mess here is much larger unfortuantely :-/

> > >
> > > >
> > > > > +     if (!vm)
> > > > > +             return -ENOENT;
> > > > > +
> > > > > +     i915_vm_put(pc->vm);
> > > >
> > > > Ah I guess I've found why you went with "pc->vm is always set". *shrug*
> > > >
> > > > > +     pc->vm = vm;
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +struct set_proto_ctx_engines {
> > > > > +     struct drm_i915_private *i915;
> > > > > +     unsigned num_engines;
> > > > > +     struct i915_gem_proto_engine *engines;
> > > > > +};
> > > > > +
> > > > > +static int
> > > > > +set_proto_ctx_engines_balance(struct i915_user_extension __user *base,
> > > > > +                           void *data)
> > > > > +{
> > > > > +     struct i915_context_engines_load_balance __user *ext =
> > > > > +             container_of_user(base, typeof(*ext), base);
> > > > > +     const struct set_proto_ctx_engines *set = data;
> > > > > +     struct drm_i915_private *i915 = set->i915;
> > > > > +     struct intel_engine_cs **siblings;
> > > > > +     u16 num_siblings, idx;
> > > > > +     unsigned int n;
> > > > > +     int err;
> > > > > +
> > > > > +     if (!HAS_EXECLISTS(i915))
> > > > > +             return -ENODEV;
> > > > > +
> > > > > +     if (intel_uc_uses_guc_submission(&i915->gt.uc))
> > > > > +             return -ENODEV; /* not implement yet */
> > > > > +
> > > > > +     if (get_user(idx, &ext->engine_index))
> > > > > +             return -EFAULT;
> > > > > +
> > > > > +     if (idx >= set->num_engines) {
> > > > > +             drm_dbg(&i915->drm, "Invalid placement value, %d >= %d\n",
> > > > > +                     idx, set->num_engines);
> > > > > +             return -EINVAL;
> > > > > +     }
> > > > > +
> > > > > +     idx = array_index_nospec(idx, set->num_engines);
> > > > > +     if (set->engines[idx].type != I915_GEM_ENGINE_TYPE_INVALID) {
> > > > > +             drm_dbg(&i915->drm,
> > > > > +                     "Invalid placement[%d], already occupied\n", idx);
> > > > > +             return -EEXIST;
> > > > > +     }
> > > > > +
> > > > > +     if (get_user(num_siblings, &ext->num_siblings))
> > > > > +             return -EFAULT;
> > > > > +
> > > > > +     err = check_user_mbz(&ext->flags);
> > > > > +     if (err)
> > > > > +             return err;
> > > > > +
> > > > > +     err = check_user_mbz(&ext->mbz64);
> > > > > +     if (err)
> > > > > +             return err;
> > > > > +
> > > > > +     if (num_siblings == 0)
> >
> > > >
> > > > You deleted the on-stack siblings micro-optimization.
> > > >
> > > > I'm shocked.
> > >
> > > Yup.  If balanced engine create overhead when balancing across a
> > > single engine ever becomes a bottleneck in some UMD, I'm happy to deal
> > > with it then.  And I intend to deal with it by banning whatever
> > > developer decided balancing across single engine was a good idea.
> >
> > I should have annotated this with /s
>
> I detected your sarcasm and returned it. :-P
>
> > > > > +
> > > > > +     siblings = kmalloc_array(num_siblings, sizeof(*siblings), GFP_KERNEL);
> > > >
> > > > If you want to pay back your micro-opt budget: GFP_TEMPORARY.
> > > >
> > > > But then I realized much wiser heads than me removed this in 2017 from the
> > > > kernel! That commit is a rather interesting story btw, if you're bored:
> > > >
> > > > commit 0ee931c4e31a5efb134c76440405e9219f896e33
> > > > Author: Michal Hocko <mhocko@suse.com>
> > > > Date:   Wed Sep 13 16:28:29 2017 -0700
> > > >
> > > >     mm: treewide: remove GFP_TEMPORARY allocation flag
> > > >
> > > > > +     if (!siblings)
> > > > > +             return -ENOMEM;
> > > > > +
> > > > > +     for (n = 0; n < num_siblings; n++) {
> > > > > +             struct i915_engine_class_instance ci;
> > > > > +
> > > > > +             if (copy_from_user(&ci, &ext->engines[n], sizeof(ci))) {
> > > > > +                     err = -EFAULT;
> > > > > +                     goto err_siblings;
> > > > > +             }
> > > > > +
> > > > > +             siblings[n] = intel_engine_lookup_user(i915,
> > > > > +                                                    ci.engine_class,
> > > > > +                                                    ci.engine_instance);
> > > >
> > > > intel_engine_user.c
> > > >
> > > > ...
> > > >
> > > > Maybe I should just stop looking.
> > >
> > > Don't think too hard.  It hurts.
> > >
> > > > > +             if (!siblings[n]) {
> > > > > +                     drm_dbg(&i915->drm,
> > > > > +                             "Invalid sibling[%d]: { class:%d, inst:%d }\n",
> > > > > +                             n, ci.engine_class, ci.engine_instance);
> > > > > +                     err = -EINVAL;
> > > > > +                     goto err_siblings;
> > > > > +             }
> > > > > +     }
> > > > > +
> > > > > +     if (num_siblings == 1) {
> > > > > +             set->engines[idx].type = I915_GEM_ENGINE_TYPE_PHYSICAL;
> > > > > +             set->engines[idx].engine = siblings[0];
> > > > > +             kfree(siblings);
> > > > > +     } else {
> > > > > +             set->engines[idx].type = I915_GEM_ENGINE_TYPE_BALANCED;
> > > > > +             set->engines[idx].num_siblings = num_siblings;
> > > > > +             set->engines[idx].siblings = siblings;
> > > > > +     }
> > > > > +
> > > > > +     return 0;
> > > > > +
> > > > > +err_siblings:
> > > > > +     kfree(siblings);
> > > > > +
> > > > > +     return err;
> > > > > +}
> > > > > +
> > > > > +static int
> > > > > +set_proto_ctx_engines_bond(struct i915_user_extension __user *base, void *data)
> > > > > +{
> > > > > +     struct i915_context_engines_bond __user *ext =
> > > > > +             container_of_user(base, typeof(*ext), base);
> > > > > +     const struct set_proto_ctx_engines *set = data;
> > > > > +     struct drm_i915_private *i915 = set->i915;
> > > > > +     struct i915_engine_class_instance ci;
> > > > > +     struct intel_engine_cs *master;
> > > > > +     u16 idx, num_bonds;
> > > > > +     int err, n;
> > > > > +
> > > > > +     if (get_user(idx, &ext->virtual_index))
> > > > > +             return -EFAULT;
> > > > > +
> > > > > +     if (idx >= set->num_engines) {
> > > > > +             drm_dbg(&i915->drm,
> > > > > +                     "Invalid index for virtual engine: %d >= %d\n",
> > > > > +                     idx, set->num_engines);
> > > > > +             return -EINVAL;
> > > > > +     }
> > > > > +
> > > > > +     idx = array_index_nospec(idx, set->num_engines);
> > > > > +     if (set->engines[idx].type == I915_GEM_ENGINE_TYPE_INVALID) {
> > > > > +             drm_dbg(&i915->drm, "Invalid engine at %d\n", idx);
> > > > > +             return -EINVAL;
> > > > > +     }
> > > > > +
> > > > > +     if (set->engines[idx].type != I915_GEM_ENGINE_TYPE_PHYSICAL) {
> > > > > +             drm_dbg(&i915->drm,
> > > > > +                     "Bonding with virtual engines not allowed\n");
> > > > > +             return -EINVAL;
> > > > > +     }
> > > > > +
> > > > > +     err = check_user_mbz(&ext->flags);
> > > > > +     if (err)
> > > > > +             return err;
> > > > > +
> > > > > +     for (n = 0; n < ARRAY_SIZE(ext->mbz64); n++) {
> > > > > +             err = check_user_mbz(&ext->mbz64[n]);
> > > > > +             if (err)
> > > > > +                     return err;
> > > > > +     }
> > > > > +
> > > > > +     if (copy_from_user(&ci, &ext->master, sizeof(ci)))
> > > > > +             return -EFAULT;
> > > > > +
> > > > > +     master = intel_engine_lookup_user(i915,
> > > > > +                                       ci.engine_class,
> > > > > +                                       ci.engine_instance);
> > > > > +     if (!master) {
> > > >
> > > > It's 100% orthogonal annoyance, but maybe we can start the "what's a good
> > > > name here" discussion.
> > > >
> > > > I'm thinking s/master/first/ and s/slave/subsequent/ that reflect how this
> > > > is actually used on the execbuf side. But then this entire bonded
> > > > extension is so disconnected from the actual use-case, maybe we should
> > > > just sun-set it before we bother.
> > >
> > > primary/secondary come to mind.  But, also, I'd rather do that as a
> > > separate patch since I was trying to make this mostly match.  Happy to
> > > up my i915 patch count with a rename follow-on, if you want.
> >
> > Yeah I think we can repaint that shed as part of merging the new parallel
> > submit support.
> >
> > > > Since we might need to keep the execlist backend implementation the
> > > > renaming might still be needed.
> > > >
> > > > > +             drm_dbg(&i915->drm,
> > > > > +                     "Unrecognised master engine: { class:%u, instance:%u }\n",
> > > > > +                     ci.engine_class, ci.engine_instance);
> > > > > +             return -EINVAL;
> > > > > +     }
> > > > > +
> > > > > +     if (get_user(num_bonds, &ext->num_bonds))
> > > > > +             return -EFAULT;
> > > > > +
> > > > > +     for (n = 0; n < num_bonds; n++) {
> > > > > +             struct intel_engine_cs *bond;
> > > > > +
> > > > > +             if (copy_from_user(&ci, &ext->engines[n], sizeof(ci)))
> > > > > +                     return -EFAULT;
> > > > > +
> > > > > +             bond = intel_engine_lookup_user(i915,
> > > > > +                                             ci.engine_class,
> > > > > +                                             ci.engine_instance);
> > > > > +             if (!bond) {
> > > > > +                     drm_dbg(&i915->drm,
> > > > > +                             "Unrecognised engine[%d] for bonding: { class:%d, instance: %d }\n",
> > > > > +                             n, ci.engine_class, ci.engine_instance);
> > > > > +                     return -EINVAL;
> > > > > +             }
> > > > > +     }
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +static const i915_user_extension_fn set_proto_ctx_engines_extensions[] = {
> > > > > +     [I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE] = set_proto_ctx_engines_balance,
> > > > > +     [I915_CONTEXT_ENGINES_EXT_BOND] = set_proto_ctx_engines_bond,
> > > > > +};
> > > > > +
> > > > > +static int set_proto_ctx_engines(struct drm_i915_file_private *fpriv,
> > > > > +                              struct i915_gem_proto_context *pc,
> > > > > +                              const struct drm_i915_gem_context_param *args)
> > > > > +{
> > > > > +     struct drm_i915_private *i915 = fpriv->dev_priv;
> > > > > +     struct set_proto_ctx_engines set = { .i915 = i915 };
> > > > > +     struct i915_context_param_engines __user *user =
> > > > > +             u64_to_user_ptr(args->value);
> > > > > +     unsigned int n;
> > > > > +     u64 extensions;
> > > > > +     int err;
> > > > > +
> > > > > +     if (!args->size) {
> > > > > +             kfree(pc->user_engines);
> > > > > +             pc->num_user_engines = -1;
> > > >
> > > > Is this case actually used by actual userspace, or just more stuff igt
> > > > loved to do?
> > > >
> > > > If so more uapi to ditch, and check in an igt that it's rejected.
> > > >
> > > > Plus standard !args->size handling here with appropriate drm_debug line
> > > > and all that.
> > > >
> > > > > +             pc->user_engines = NULL;
> > > > > +             memset(&pc->legacy_rcs_sseu, 0, sizeof(pc->legacy_rcs_sseu));
> > > > > +             return 0;
> > > > > +     }
> > > > > +
> > > > > +     BUILD_BUG_ON(!IS_ALIGNED(sizeof(*user), sizeof(*user->engines)));
> > > >
> > > > I frankly don't know what this is checking, but it also looks harmless.
> > >
> > > Yeah..... All I can see is that it lets us avoid doing a subtraction
> > > in the alignment check below.  Kind-of silly, IMO.
> >
> > I'm not seeing even that? Care to help the blind?
>
> The array length is calculated as (args->size - sizeof(*user)) /
> sizeof(*user->engines) which means that we really want (args->size -
> sizeof(*user)) to be divisible by sizeof(*user->engines).  However,
> instead of checking
>
> IS_ALIGNED(args->size - sizeof(*user), sizeof(*user->engines))
>
> we first check that sizeof(*user) is divisible by
> sizeof(*user->engines) with a static check and then just check the
> alignment of args->size.  I'm going to fix this mess.

Uh. Motion that I'm guilty of not having understood this magic at all,
and also yes pls, burn this down with fire. gcc will optimize out the
subtraction as long as everything is aligned, and since it's uapi we
know it's never going to change.

Also.

Why.



...

Just why.

> > > > > +     if (args->size < sizeof(*user) ||
> > > > > +         !IS_ALIGNED(args->size, sizeof(*user->engines))) {
> > > > > +             drm_dbg(&i915->drm, "Invalid size for engine array: %d\n",
> > > > > +                     args->size);
> > > > > +             return -EINVAL;
> > > > > +     }
> > > > > +
> > > > > +     set.num_engines = (args->size - sizeof(*user)) / sizeof(*user->engines);
> > > > > +     /* RING_MASK has no shift so we can use it directly here */
> > > > > +     if (set.num_engines > I915_EXEC_RING_MASK + 1)
> > > > > +             return -EINVAL;
> > > > > +
> > > > > +     set.engines = kmalloc_array(set.num_engines, sizeof(*set.engines), GFP_KERNEL);
> > > > > +     if (!set.engines)
> > > > > +             return -ENOMEM;
> > > > > +
> > > > > +     for (n = 0; n < set.num_engines; n++) {
> > > > > +             struct i915_engine_class_instance ci;
> > > > > +             struct intel_engine_cs *engine;
> > > > > +
> > > > > +             if (copy_from_user(&ci, &user->engines[n], sizeof(ci))) {
> > > > > +                     kfree(set.engines);
> > > > > +                     return -EFAULT;
> > > > > +             }
> > > > > +
> > > > > +             memset(&set.engines[n], 0, sizeof(set.engines[n]));
> > > > > +
> > > > > +             if (ci.engine_class == (u16)I915_ENGINE_CLASS_INVALID &&
> > > > > +                 ci.engine_instance == (u16)I915_ENGINE_CLASS_INVALID_NONE)
> > > > > +                     continue;
> > > > > +
> > > > > +             engine = intel_engine_lookup_user(i915,
> > > > > +                                               ci.engine_class,
> > > > > +                                               ci.engine_instance);
> > > > > +             if (!engine) {
> > > > > +                     drm_dbg(&i915->drm,
> > > > > +                             "Invalid engine[%d]: { class:%d, instance:%d }\n",
> > > > > +                             n, ci.engine_class, ci.engine_instance);
> > > > > +                     kfree(set.engines);
> > > > > +                     return -ENOENT;
> > > > > +             }
> > > > > +
> > > > > +             set.engines[n].type = I915_GEM_ENGINE_TYPE_PHYSICAL;
> > > > > +             set.engines[n].engine = engine;
> > > > > +     }
> > > > > +
> > > > > +     err = -EFAULT;
> > > > > +     if (!get_user(extensions, &user->extensions))
> > > > > +             err = i915_user_extensions(u64_to_user_ptr(extensions),
> > > > > +                                        set_proto_ctx_engines_extensions,
> > > > > +                                        ARRAY_SIZE(set_proto_ctx_engines_extensions),
> > > > > +                                        &set);
> > > > > +     if (err) {
> > > > > +             kfree(set.engines);
> > > > > +             return err;
> > > > > +     }
> > > > > +
> > > > > +     kfree(pc->user_engines);
> > > >
> > > > Both of these kfree potentially leak engines[].siblings. I think you need
> > > > to extract a proto_context_free_engines helper and use that 2x here and
> > > > once at the very top in proto_context_close().
> > >
> > > Good catch. Done.
> > >
> > > > > +     pc->num_user_engines = set.num_engines;
> > > > > +     pc->user_engines = set.engines;
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +static int set_proto_ctx_sseu(struct drm_i915_file_private *fpriv,
> > > > > +                           struct i915_gem_proto_context *pc,
> > > > > +                           struct drm_i915_gem_context_param *args)
> > > > > +{
> > > > > +     struct drm_i915_private *i915 = fpriv->dev_priv;
> > > > > +     struct drm_i915_gem_context_param_sseu user_sseu;
> > > > > +     struct intel_sseu *sseu;
> > > > > +     int ret;
> > > > > +
> > > > > +     if (args->size < sizeof(user_sseu))
> > > > > +             return -EINVAL;
> > > > > +
> > > > > +     if (!IS_GEN(i915, 11))
> > > > > +             return -ENODEV;
> > > > > +
> > > > > +     if (copy_from_user(&user_sseu, u64_to_user_ptr(args->value),
> > > > > +                        sizeof(user_sseu)))
> > > > > +             return -EFAULT;
> > > > > +
> > > > > +     if (user_sseu.rsvd)
> > > > > +             return -EINVAL;
> > > > > +
> > > > > +     if (user_sseu.flags & ~(I915_CONTEXT_SSEU_FLAG_ENGINE_INDEX))
> > > > > +             return -EINVAL;
> > > > > +
> > > > > +     if (!!(user_sseu.flags & I915_CONTEXT_SSEU_FLAG_ENGINE_INDEX) != (pc->num_user_engines >= 0))
> > > > > +             return -EINVAL;
> > > > > +
> > > > > +     if (pc->num_user_engines >= 0) {
> > > > > +             int idx = user_sseu.engine.engine_instance;
> > > > > +             struct i915_gem_proto_engine *pe;
> > > > > +
> > > > > +             if (idx >= pc->num_user_engines)
> > > > > +                     return -EINVAL;
> > > > > +
> > > > > +             pe = &pc->user_engines[idx];
> > > > > +
> > > > > +             /* Only render engine supports RPCS configuration. */
> > > > > +             if (pe->engine->class != RENDER_CLASS)
> > > > > +                     return -EINVAL;
> > > > > +
> > > > > +             sseu = &pe->sseu;
> > > > > +     } else {
> > > > > +             /* Only render engine supports RPCS configuration. */
> > > > > +             if (user_sseu.engine.engine_class != I915_ENGINE_CLASS_RENDER)
> > > > > +                     return -EINVAL;
> > > > > +
> > > > > +             /* There is only one render engine */
> > > > > +             if (user_sseu.engine.engine_instance != 0)
> > > > > +                     return -EINVAL;
> > > > > +
> > > > > +             sseu = &pc->legacy_rcs_sseu;
> > > > > +     }
> > > >
> > > > I think this faithfully rebuilds the convoluted and I think largely
> > > > accidental semantics of SSEU for all combinations of ordering against
> > > > set_engines.
> > > >
> > > > Maybe add a commit message note about this particular kind of fun here. I
> > > > don't think a code comment is warranted since I don't think I've seen a
> > > > userspace rely on how sseu interacts with set_engines
> > >
> > > Done.
> > >
> > > > > +
> > > > > +     ret = i915_gem_user_to_context_sseu(&i915->gt, &user_sseu, sseu);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > > +
> > > > > +     args->size = sizeof(user_sseu);
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > > +static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
> > > > > +                            struct i915_gem_proto_context *pc,
> > > > > +                            struct drm_i915_gem_context_param *args)
> > > > > +{
> > > > > +     int ret = 0;
> > > > > +
> > > > > +     switch (args->param) {
> > > > > +     case I915_CONTEXT_PARAM_NO_ERROR_CAPTURE:
> > > > > +             if (args->size)
> > > > > +                     ret = -EINVAL;
> > > > > +             else if (args->value)
> > > > > +                     __set_bit(UCONTEXT_NO_ERROR_CAPTURE, &pc->user_flags);
> > > > > +             else
> > > > > +                     __clear_bit(UCONTEXT_NO_ERROR_CAPTURE, &pc->user_flags);
> > > >
> > > > Open code please and double check I caught them all ...
> > >
> > > As I commented the first time around, __set/clear_bit are static
> > > inlines that unroll to "*field |= (1 << bit)" or "*field &= ~(1 <<
> > > bit)" as appropriate.  The non-__ versions do atomics.  I could
> > > hand-roll them but that seems error-prone and it gains us nothing.
> >
> > They do more, they treat this as a potential array of unsigned long as a
> > bitfield of unlimted size. This comes from the cpuset support afaiu our
> > history here, and years ago (decades by now?) linux started supporting
> > more than 64 cpus cores. Our flags are definitely not unlimted and fit in
> > an unsigned, so we're dropping some compiler checking here.
> >
> > Also it's not that bad really:
> >
> >         if (args->value)
> >                 pc->user_flags |= BIT(UCONTEXT_NO_ERROR_CAPTURE);
> >         else
> >                 pc->user_flags &= ~BIT(UCONTEXT_NO_ERROR_CAPTURE);
> >
> > Fairly idiomatic construct. Final argument here is that __func() generally
> > means "beware, check carefuly what's going on here", and nothing funny is
> > going on here at all, so it's a bit a negative trap :-)
> >
> > Anyway git grep shows you're not the first (even outside of drm/i915).
> > Some spot checking with grep shows that bitflag use of __set_bit is about
> > a third of overall use:
> >
> > $ git grep '__set_bit.*)' | wc -l
> > 1761
> >
> > $ git grep '__set_bit.*,\s*&.*)' | wc -l
> > 479
> >
> > So whatever you feel like.
>
> Your shed, your colors.  I just wanted a reason and to know you
> weren't missing something.

Well it's a 30% shed or so, I think it really doesn't matter that much.

> > > > > +             break;
> > > > > +
> > > > > +     case I915_CONTEXT_PARAM_BANNABLE:
> > > > > +             if (args->size)
> > > > > +                     ret = -EINVAL;
> > > > > +             else if (!capable(CAP_SYS_ADMIN) && !args->value)
> > > > > +                     ret = -EPERM;
> > > > > +             else if (args->value)
> > > > > +                     __set_bit(UCONTEXT_BANNABLE, &pc->user_flags);
> > > > > +             else
> > > > > +                     __clear_bit(UCONTEXT_BANNABLE, &pc->user_flags);
> > > > > +             break;
> > > > > +
> > > > > +     case I915_CONTEXT_PARAM_RECOVERABLE:
> > > > > +             if (args->size)
> > > > > +                     ret = -EINVAL;
> > > > > +             else if (args->value)
> > > > > +                     __set_bit(UCONTEXT_RECOVERABLE, &pc->user_flags);
> > > > > +             else
> > > > > +                     __clear_bit(UCONTEXT_RECOVERABLE, &pc->user_flags);
> > > > > +             break;
> > > > > +
> > > > > +     case I915_CONTEXT_PARAM_PRIORITY:
> > > > > +             ret = validate_priority(fpriv->dev_priv, args);
> > > > > +             if (!ret)
> > > > > +                     pc->sched.priority = args->value;
> > > > > +             break;
> > > > > +
> > > > > +     case I915_CONTEXT_PARAM_SSEU:
> > > > > +             ret = set_proto_ctx_sseu(fpriv, pc, args);
> > > > > +             break;
> > > > > +
> > > > > +     case I915_CONTEXT_PARAM_VM:
> > > > > +             ret = set_proto_ctx_vm(fpriv, pc, args);
> > > > > +             break;
> > > > > +
> > > > > +     case I915_CONTEXT_PARAM_ENGINES:
> > > > > +             ret = set_proto_ctx_engines(fpriv, pc, args);
> > > > > +             break;
> > > > > +
> > > > > +     case I915_CONTEXT_PARAM_PERSISTENCE:
> > > > > +             if (args->size)
> > > > > +                     ret = -EINVAL;
> > > > > +             else if (args->value)
> > > > > +                     __set_bit(UCONTEXT_PERSISTENCE, &pc->user_flags);
> > > > > +             else
> > > > > +                     __clear_bit(UCONTEXT_PERSISTENCE, &pc->user_flags);
> > > >
> > > > I think we have a nice mess here. You created this
> > > > proto_context_set_persistence helper, but don't use it here. Oversight?
> > >
> > > Yeah, I should use it.  Done.
> > >
> > > > Aside from the validation fun around persistence, but that's better
> > > > discussed in another patch I think.
> > > >
> > > > > +             break;
> > > > > +
> > > > > +     case I915_CONTEXT_PARAM_NO_ZEROMAP:
> > > > > +     case I915_CONTEXT_PARAM_BAN_PERIOD:
> > > > > +     case I915_CONTEXT_PARAM_RINGSIZE:
> > > > > +     default:
> > > > > +             ret = -EINVAL;
> > > > > +             break;
> > > > > +     }
> > > > > +
> > > > > +     return ret;
> > > > > +}
> > > > > +
> > > > >  static struct i915_address_space *
> > > > >  context_get_vm_rcu(struct i915_gem_context *ctx)
> > > > >  {
> > > > > @@ -475,6 +918,56 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
> > > > >       return err;
> > > > >  }
> > > > >
> > > > > +static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
> > > > > +                                          unsigned int num_engines,
> > > > > +                                          struct i915_gem_proto_engine *pe)
> > > > > +{
> > > > > +     struct i915_gem_engines *e, *err;
> > > > > +     unsigned int n;
> > > > > +
> > > > > +     e = alloc_engines(num_engines);
> > > > > +     for (n = 0; n < num_engines; n++) {
> > > > > +             struct intel_context *ce;
> > > > > +             int ret;
> > > > > +
> > > > > +             switch (pe[n].type) {
> > > > > +             case I915_GEM_ENGINE_TYPE_PHYSICAL:
> > > > > +                     ce = intel_context_create(pe[n].engine);
> > > > > +                     break;
> > > > > +
> > > > > +             case I915_GEM_ENGINE_TYPE_BALANCED:
> > > > > +                     ce = intel_execlists_create_virtual(pe[n].siblings,
> > > > > +                                                         pe[n].num_siblings);
> > > > > +                     break;
> > > > > +
> > > > > +             case I915_GEM_ENGINE_TYPE_INVALID:
> > > > > +             default:
> > > > > +                     GEM_WARN_ON(pe[n].type != I915_GEM_ENGINE_TYPE_INVALID);
> > > > > +                     continue;
> > > > > +             }
> > > > > +
> > > > > +             if (IS_ERR(ce)) {
> > > > > +                     err = ERR_CAST(ce);
> > > > > +                     goto free_engines;
> > > > > +             }
> > > > > +
> > > > > +             e->engines[n] = ce;
> > > > > +
> > > > > +             ret = intel_context_set_gem(ce, ctx, pe->sseu);
> > > > > +             if (ret) {
> > > > > +                     err = ERR_PTR(ret);
> > > > > +                     goto free_engines;
> > > > > +             }
> > > > > +     }
> > > > > +     e->num_engines = num_engines;
> > > > > +
> > > > > +     return e;
> > > > > +
> > > > > +free_engines:
> > > > > +     free_engines(e);
> > > > > +     return err;
> > > > > +}
> > > > > +
> > > > >  void i915_gem_context_release(struct kref *ref)
> > > > >  {
> > > > >       struct i915_gem_context *ctx = container_of(ref, typeof(*ctx), ref);
> > > > > @@ -779,7 +1272,6 @@ __create_context(struct drm_i915_private *i915,
> > > > >  {
> > > > >       struct i915_gem_context *ctx;
> > > > >       struct i915_gem_engines *e;
> > > > > -     struct intel_sseu null_sseu = {};
> > > > >       int err;
> > > > >       int i;
> > > > >
> > > > > @@ -797,7 +1289,7 @@ __create_context(struct drm_i915_private *i915,
> > > > >       INIT_LIST_HEAD(&ctx->stale.engines);
> > > > >
> > > > >       mutex_init(&ctx->engines_mutex);
> > > > > -     e = default_engines(ctx, null_sseu);
> > > > > +     e = default_engines(ctx, pc->legacy_rcs_sseu);
> > > > >       if (IS_ERR(e)) {
> > > > >               err = PTR_ERR(e);
> > > > >               goto err_free;
> > > > > @@ -916,6 +1408,24 @@ i915_gem_create_context(struct drm_i915_private *i915,
> > > > >               mutex_unlock(&ctx->mutex);
> > > > >       }
> > > > >
> > > > > +     if (pc->num_user_engines >= 0) {
> > > > > +             struct i915_gem_engines *engines;
> > > > > +
> > > > > +             engines = user_engines(ctx, pc->num_user_engines,
> > > > > +                                    pc->user_engines);
> > > > > +             if (IS_ERR(engines)) {
> > > > > +                     context_close(ctx);
> > > > > +                     return ERR_CAST(engines);
> > > > > +             }
> > > > > +
> > > > > +             mutex_lock(&ctx->engines_mutex);
> > > > > +             i915_gem_context_set_user_engines(ctx);
> > > > > +             engines = rcu_replace_pointer(ctx->engines, engines, 1);
> > > > > +             mutex_unlock(&ctx->engines_mutex);
> > > >
> > > > More locking code to ditch I guess.
> > >
> > > Sure.  Is it safe to just drop it?  I guess it is?  I'm really shaky
> > > around all the RCU requirements and things.
> >
> > Well the 1 in here should be replace with
> > lockdep_is_held(&ctx->engines_mutex), but the engines_mutex also should
> > go, so really can ditch the entire thing. Also no one can access our
> > context, so we can't fail.
> >
> > Now if you do this naively without dropping the __rcu classifier for
> > ctx->engines then static checkers will complain. So until that's done an
> > rcu_assign_pointer should do.
>
> This is all nuked by the last patch.  If it's all the same to you, I'd
> rather leave the re-typed stupid boiler-plate here and delete it and
> do it properly there.  That patch sets up an engine set once and uses
> RCU_INIT_POINTER.

Yeah I think it's all fine if it's clean in the end. I think we
already maxed out out how to transition in reasonable patches to where
we want to be, and there's definitely no optimal path.

I think a git branch for me to pull for next round would be great, so
I can give the final result a good once-over for checking. Without
having to fiddle with .mbox tooling :-)

Cheers, Daniel

> --Jason
>
> > >
> > > > > +
> > > > > +             free_engines(engines);
> > > >
> > > > Also I guess we shouldn't first create the legacy engines for this case?
> > >
> > > That's fixed in the last patch.
> >
> > Yeah I noticed later on.
> >
> > >
> > > > > +     }
> > > > > +
> > > > >       if (pc->single_timeline) {
> > > > >               ret = drm_syncobj_create(&ctx->syncobj,
> > > > >                                        DRM_SYNCOBJ_CREATE_SIGNALED,
> > > > > @@ -1956,7 +2466,7 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
> > > > >  }
> > > > >
> > > > >  struct create_ext {
> > > > > -     struct i915_gem_context *ctx;
> > > > > +     struct i915_gem_proto_context *pc;
> > > > >       struct drm_i915_file_private *fpriv;
> > > > >  };
> > > > >
> > > > > @@ -1971,7 +2481,7 @@ static int create_setparam(struct i915_user_extension __user *ext, void *data)
> > > > >       if (local.param.ctx_id)
> > > > >               return -EINVAL;
> > > > >
> > > > > -     return ctx_setparam(arg->fpriv, arg->ctx, &local.param);
> > > > > +     return set_proto_ctx_param(arg->fpriv, arg->pc, &local.param);
> > > > >  }
> > > > >
> > > > >  static int invalid_ext(struct i915_user_extension __user *ext, void *data)
> > > > > @@ -1994,7 +2504,7 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
> > > > >  {
> > > > >       struct drm_i915_private *i915 = to_i915(dev);
> > > > >       struct drm_i915_gem_context_create_ext *args = data;
> > > > > -     struct i915_gem_proto_context *pc;
> > > > > +     struct i915_gem_context *ctx;
> > > > >       struct create_ext ext_data;
> > > > >       int ret;
> > > > >       u32 id;
> > > > > @@ -2017,25 +2527,27 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
> > > > >               return -EIO;
> > > > >       }
> > > > >
> > > > > -     pc = proto_context_create(i915, args->flags);
> > > > > -     if (IS_ERR(pc))
> > > > > -             return PTR_ERR(pc);
> > > > > -
> > > > > -     ext_data.ctx = i915_gem_create_context(i915, pc);
> > > > > -     proto_context_close(pc);
> > > > > -     if (IS_ERR(ext_data.ctx))
> > > > > -             return PTR_ERR(ext_data.ctx);
> > > > > +     ext_data.pc = proto_context_create(i915, args->flags);
> > > > > +     if (IS_ERR(ext_data.pc))
> > > > > +             return PTR_ERR(ext_data.pc);
> > > > >
> > > > >       if (args->flags & I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS) {
> > > > >               ret = i915_user_extensions(u64_to_user_ptr(args->extensions),
> > > > >                                          create_extensions,
> > > > >                                          ARRAY_SIZE(create_extensions),
> > > > >                                          &ext_data);
> > > > > -             if (ret)
> > > > > -                     goto err_ctx;
> > > > > +             if (ret) {
> > > > > +                     proto_context_close(ext_data.pc);
> > > > > +                     return ret;
> > > > > +             }
> > > > >       }
> > > > >
> > > > > -     ret = gem_context_register(ext_data.ctx, ext_data.fpriv, &id);
> > > > > +     ctx = i915_gem_create_context(i915, ext_data.pc);
> > > > > +     proto_context_close(ext_data.pc);
> > > > > +     if (IS_ERR(ctx))
> > > > > +             return PTR_ERR(ctx);
> > > > > +
> > > > > +     ret = gem_context_register(ctx, ext_data.fpriv, &id);
> > > > >       if (ret < 0)
> > > > >               goto err_ctx;
> > > > >
> > > > > @@ -2045,7 +2557,7 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
> > > > >       return 0;
> > > > >
> > > > >  err_ctx:
> > > > > -     context_close(ext_data.ctx);
> > > > > +     context_close(ctx);
> > > > >       return ret;
> > > > >  }
> > > > >
> > > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > > > > index 0bf337b6d89ac..2ac341f805c8f 100644
> > > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> > > > > @@ -66,6 +66,55 @@ struct i915_gem_engines_iter {
> > > > >       const struct i915_gem_engines *engines;
> > > > >  };
> > > > >
> > > > > +/**
> > > > > + * enum i915_gem_engine_type - Describes the type of an i915_gem_proto_engine
> > > > > + */
> > > > > +enum i915_gem_engine_type {
> > > > > +     /** @I915_GEM_ENGINE_TYPE_INVALID: An invalid engine */
> > > > > +     I915_GEM_ENGINE_TYPE_INVALID = 0,
> > > > > +
> > > > > +     /** @I915_GEM_ENGINE_TYPE_PHYSICAL: A single physical engine */
> > > > > +     I915_GEM_ENGINE_TYPE_PHYSICAL,
> > > > > +
> > > > > +     /** @I915_GEM_ENGINE_TYPE_BALANCED: A load-balanced engine set */
> > > > > +     I915_GEM_ENGINE_TYPE_BALANCED,
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * struct i915_gem_proto_engine - prototype engine
> > > > > + *
> > > > > + * This struct describes an engine that a context may contain.  Engines
> > > > > + * have three types:
> > > > > + *
> > > > > + *  - I915_GEM_ENGINE_TYPE_INVALID: Invalid engines can be created but they
> > > > > + *    show up as a NULL in i915_gem_engines::engines[i] and any attempt to
> > > > > + *    use them by the user results in -EINVAL.  They are also useful during
> > > > > + *    proto-context construction because the client may create invalid
> > > > > + *    engines and then set them up later as bonded engines.
> > > > > + *
> > > > > + *  - I915_GEM_ENGINE_TYPE_PHYSICAL: A single physical engine, described by
> > > > > + *    i915_gem_proto_engine::engine.
> > > > > + *
> > > > > + *  - I915_GEM_ENGINE_TYPE_BALANCED: A load-balanced engine set, described
> > > > > + *    i915_gem_proto_engine::num_siblings and i915_gem_proto_engine::siblings.
> > > > > + */
> > > > > +struct i915_gem_proto_engine {
> > > > > +     /** @type: Type of this engine */
> > > > > +     enum i915_gem_engine_type type;
> > > > > +
> > > > > +     /** @engine: Engine, for physical */
> > > > > +     struct intel_engine_cs *engine;
> > > > > +
> > > > > +     /** @num_siblings: Number of balanced siblings */
> > > > > +     unsigned int num_siblings;
> > > > > +
> > > > > +     /** @siblings: Balanced siblings */
> > > > > +     struct intel_engine_cs **siblings;
> > > > > +
> > > > > +     /** @sseu: Client-set SSEU parameters */
> > > > > +     struct intel_sseu sseu;
> > > > > +};
> > > > > +
> > > > >  /**
> > > > >   * struct i915_gem_proto_context - prototype context
> > > > >   *
> > > > > @@ -84,6 +133,15 @@ struct i915_gem_proto_context {
> > > > >       /** @sched: See i915_gem_context::sched */
> > > > >       struct i915_sched_attr sched;
> > > > >
> > > > > +     /** @num_user_engines: Number of user-specified engines or -1 */
> > > > > +     int num_user_engines;
> > > > > +
> > > > > +     /** @user_engines: User-specified engines */
> > > > > +     struct i915_gem_proto_engine *user_engines;
> > > > > +
> > > > > +     /** @sseu: Client-set SSEU parameters for the legacy RCS */
> > > > > +     struct intel_sseu legacy_rcs_sseu;
> > > > > +
> > > > >       /** @single_timeline: See See i915_gem_context::syncobj */
> > > > >       bool single_timeline;
> > > > >  };
> > > > > --
> > > > > 2.31.1
> > > >
> > > > Man is this all nasty. Since I don't want to re-review the entire pile,
> > > > assuming we figure out solutions to all the real issues I've raised (and
> > > > not the snarky bikesheds) this is
> > > >
> > > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > >
> > > Ok.  I'm leaving it off for now to remind myself to ensure that we
> > > close on everything.  I'll add it once I've heard back from you on my
> > > questions above.
> >
> > I think we're all good. Mostly :-/
> > -Daniel
> >
> > >
> > > --Jason
> > >
> > > > >
> > > > > _______________________________________________
> > > > > dri-devel mailing list
> > > > > dri-devel@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
