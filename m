Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 531F8347583
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 11:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1CB76E9A8;
	Wed, 24 Mar 2021 10:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C705A6E9A8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 10:11:16 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id j18so23812886wra.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 03:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9UWhVxrBDTnf1xWRIlnCIU7DzbRlOGLlbilwpjER61c=;
 b=VSqZLrICyosXKp5sUstEztTk32gH1nX5XRFI5Z9t59H7lbVAW5bGV/I5Cn02sz4Aov
 3P8hSNCvn68lcTV5fvsVtoxd7GGRoAp3lI70BDQF1apcgawAgOp/EqEDudlf/tQCSebb
 l7WBMXoWMQaojJCsfQu2yyJz/vtZvGq0Vsz4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9UWhVxrBDTnf1xWRIlnCIU7DzbRlOGLlbilwpjER61c=;
 b=EE9yYRZgU+NeH+pBj//CvEtWPbZh3W6WV2AIjHAzK1QONFAbDpxEl4mO69lTeILkL3
 dZB5e1k1rs1KeSW1oIsiCHjHxXT78nncLUWh5hEfQpcPqS3McafdaEAWvm3P6t7e+TkG
 v+OPzAUpuzrtSkszBrQmhkFdhveEJiXjsQxuoxoIejfptNJaOOWAi+owz6BH4cqKOzeV
 YpRm4dAAAOIfpJb58rah8k0Z5RVhhmRGNuWg++gjPYSbhWRcwiC3fiNcrgDgghPlzUBj
 K7girKoOGDSbYk3KZWhDJ+MWa+/0ewkB4SW6hY7b0QVLSwaZdL5zuPxP/ZzdgDIrEaiz
 eNwQ==
X-Gm-Message-State: AOAM531T3i9xsKpuDNNnx6AqAHUOOoM4h0wQ+gaVjBFb8B8xd5JsdBtx
 je5YJ1yMNbbGQhqUr4emoF/SsNhHU4inBRjJ
X-Google-Smtp-Source: ABdhPJwPTTY6aqSs9EBBiEMgx4oBoJ4yQYjrD4RUSSGriSp0zi9LpQiGoLwdNtYYDjW8DeIXE/2j1A==
X-Received: by 2002:adf:ecc8:: with SMTP id s8mr2579659wro.11.1616580675424;
 Wed, 24 Mar 2021 03:11:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i3sm2416100wra.66.2021.03.24.03.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 03:11:14 -0700 (PDT)
Date: Wed, 24 Mar 2021 11:11:13 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v9 68/70] drm/i915: Pass ww ctx to pin_map
Message-ID: <YFsQQfwwyZhq5BBF@phenom.ffwll.local>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
 <20210323155059.628690-69-maarten.lankhorst@linux.intel.com>
 <CAM0jSHPL44qRd7dybPmmEz-8pr8xS0d9VXhRYm8iNj3YyX7h-A@mail.gmail.com>
 <79e6f35b-0df6-0f45-e349-8f49529f7382@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <79e6f35b-0df6-0f45-e349-8f49529f7382@linux.intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 Matthew Auld <matthew.william.auld@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 10:31:26AM +0100, Maarten Lankhorst wrote:
> Op 23-03-2021 om 18:30 schreef Matthew Auld:
> > On Tue, 23 Mar 2021 at 15:51, Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com> wrote:
> >> This will allow us to explicitly pass the ww to pin_pages,
> >> when it starts taking it.
> >>
> >> This allows us to finally kill off the explicit passing of ww
> >> by retrieving it from the obj.
> >>
> >> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> ---
> >>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  7 ++++---
> >>  drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  2 +-
> >>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  1 +
> >>  .../gpu/drm/i915/gem/i915_gem_object_blt.c    |  4 ++--
> >>  drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 21 +++++++++++++++----
> >>  .../drm/i915/gem/selftests/i915_gem_context.c |  8 ++++---
> >>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  2 +-
> >>  drivers/gpu/drm/i915/gt/gen7_renderclear.c    |  2 +-
> >>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
> >>  drivers/gpu/drm/i915/gt/intel_engine_pm.c     |  2 +-
> >>  drivers/gpu/drm/i915/gt/intel_lrc.c           |  4 ++--
> >>  drivers/gpu/drm/i915/gt/intel_renderstate.c   |  2 +-
> >>  drivers/gpu/drm/i915/gt/intel_ring.c          |  2 +-
> >>  .../gpu/drm/i915/gt/intel_ring_submission.c   |  2 +-
> >>  drivers/gpu/drm/i915/gt/intel_timeline.c      |  7 ++++---
> >>  drivers/gpu/drm/i915/gt/intel_timeline.h      |  3 ++-
> >>  drivers/gpu/drm/i915/gt/intel_workarounds.c   |  2 +-
> >>  drivers/gpu/drm/i915/gt/mock_engine.c         |  2 +-
> >>  drivers/gpu/drm/i915/gt/selftest_lrc.c        |  2 +-
> >>  drivers/gpu/drm/i915/gt/selftest_rps.c        | 10 ++++-----
> >>  .../gpu/drm/i915/gt/selftest_workarounds.c    |  6 +++---
> >>  drivers/gpu/drm/i915/gvt/cmd_parser.c         |  4 ++--
> >>  drivers/gpu/drm/i915/i915_perf.c              |  4 ++--
> >>  drivers/gpu/drm/i915/selftests/igt_spinner.c  |  2 +-
> >>  24 files changed, 60 insertions(+), 43 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> >> index dcfcae9c841b..73dd2a7673f5 100644
> >> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> >> @@ -1340,7 +1340,7 @@ static int __reloc_gpu_alloc(struct i915_execbuffer *eb,
> >>         if (err)
> >>                 goto err_pool;
> >>
> >> -       cmd = i915_gem_object_pin_map(pool->obj, pool->type);
> >> +       cmd = i915_gem_object_pin_map(pool->obj, &eb->ww, pool->type);
> >>         if (IS_ERR(cmd)) {
> >>                 err = PTR_ERR(cmd);
> >>                 goto err_pool;
> >> @@ -2489,7 +2489,8 @@ static int eb_parse_pipeline(struct i915_execbuffer *eb,
> >>                         goto err_shadow;
> >>         }
> >>
> >> -       pw->shadow_map = i915_gem_object_pin_map(shadow->obj, I915_MAP_WB);
> >> +       pw->shadow_map = i915_gem_object_pin_map(shadow->obj, &eb->ww,
> >> +                                                I915_MAP_WB);
> >>         if (IS_ERR(pw->shadow_map)) {
> >>                 err = PTR_ERR(pw->shadow_map);
> >>                 goto err_trampoline;
> >> @@ -2500,7 +2501,7 @@ static int eb_parse_pipeline(struct i915_execbuffer *eb,
> >>
> >>         pw->batch_map = ERR_PTR(-ENODEV);
> >>         if (needs_clflush && i915_has_memcpy_from_wc())
> >> -               pw->batch_map = i915_gem_object_pin_map(batch, I915_MAP_WC);
> >> +               pw->batch_map = i915_gem_object_pin_map(batch, &eb->ww, I915_MAP_WC);
> >>
> >>         if (IS_ERR(pw->batch_map)) {
> >>                 err = i915_gem_object_pin_pages(batch);
> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> >> index 2561a2f1e54f..edac8ee3be9a 100644
> >> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> >> @@ -439,7 +439,7 @@ vm_access(struct vm_area_struct *area, unsigned long addr,
> >>                 goto out;
> >>
> >>         /* As this is primarily for debugging, let's focus on simplicity */
> >> -       vaddr = i915_gem_object_pin_map(obj, I915_MAP_FORCE_WC);
> >> +       vaddr = i915_gem_object_pin_map(obj, &ww, I915_MAP_FORCE_WC);
> >>         if (IS_ERR(vaddr)) {
> >>                 err = PTR_ERR(vaddr);
> >>                 goto out;
> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> >> index 1a8ec4035112..9bd9b47dcc8d 100644
> >> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> >> @@ -450,6 +450,7 @@ void i915_gem_object_writeback(struct drm_i915_gem_object *obj);
> >>   * ERR_PTR() on error.
> >>   */
> >>  void *__must_check i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
> >> +                                          struct i915_gem_ww_ctx *ww,
> >>                                            enum i915_map_type type);
> >>
> >>  void *__must_check i915_gem_object_pin_map_unlocked(struct drm_i915_gem_object *obj,
> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c b/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
> >> index df8e8c18c6c9..fae18622d2da 100644
> >> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
> >> @@ -58,7 +58,7 @@ struct i915_vma *intel_emit_vma_fill_blt(struct intel_context *ce,
> >>         /* we pinned the pool, mark it as such */
> >>         intel_gt_buffer_pool_mark_used(pool);
> >>
> >> -       cmd = i915_gem_object_pin_map(pool->obj, pool->type);
> >> +       cmd = i915_gem_object_pin_map(pool->obj, ww, pool->type);
> >>         if (IS_ERR(cmd)) {
> >>                 err = PTR_ERR(cmd);
> >>                 goto out_unpin;
> >> @@ -283,7 +283,7 @@ struct i915_vma *intel_emit_vma_copy_blt(struct intel_context *ce,
> >>         /* we pinned the pool, mark it as such */
> >>         intel_gt_buffer_pool_mark_used(pool);
> >>
> >> -       cmd = i915_gem_object_pin_map(pool->obj, pool->type);
> >> +       cmd = i915_gem_object_pin_map(pool->obj, ww, pool->type);
> >>         if (IS_ERR(cmd)) {
> >>                 err = PTR_ERR(cmd);
> >>                 goto out_unpin;
> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> >> index 58e222030e10..232832398457 100644
> >> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> >> @@ -341,6 +341,7 @@ static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
> >>
> >>  /* get, pin, and map the pages of the object into kernel space */
> >>  void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
> >> +                             struct i915_gem_ww_ctx *ww,
> >>                               enum i915_map_type type)
> >>  {
> >>         enum i915_map_type has_type;
> >> @@ -408,13 +409,25 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
> >>  void *i915_gem_object_pin_map_unlocked(struct drm_i915_gem_object *obj,
> >>                                        enum i915_map_type type)
> >>  {
> >> +       struct i915_gem_ww_ctx ww;
> >>         void *ret;
> >> +       int err;
> >>
> >> -       i915_gem_object_lock(obj, NULL);
> >> -       ret = i915_gem_object_pin_map(obj, type);
> >> -       i915_gem_object_unlock(obj);
> >> +       i915_gem_ww_ctx_init(&ww, true);
> >> +retry:
> >> +       err = i915_gem_object_lock(obj, &ww);
> >> +       if (!err)
> >> +               ret = i915_gem_object_pin_map(obj, &ww, type);
> >> +       if (IS_ERR(ret))
> > This looks a little dodgy, since ret might not be initialized here,
> > say if we encounter an error when grabbing the lock?
> >
> > Also maybe s/ret/ptr/? Seeing ret makes me think it's a plain integer.
> 
> Ack, good catch!
> 
> Will send a new version to fix it.

Can you pls just update this patch with in-reply-to? I'm starting to
apply.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
