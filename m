Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F6C3902A0
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14AA89CD7;
	Tue, 25 May 2021 13:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E3189C96;
 Tue, 25 May 2021 13:37:37 +0000 (UTC)
IronPort-SDR: nel6YYkeB8QgMioWpFFmwBw6ig84PA3Nln+iJg9+614XeOm2xkjN4/3GqVDJp6B02ACjP7f+w9
 Ti3RyjagcxLg==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="202211187"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="202211187"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 06:37:32 -0700
IronPort-SDR: oeNNfTENPVKCqm0o3j/YOHMpdcM+XqG/TqNd6otZaGDXbIKwsUs/iRKp25e2WaLNp5U0aVJDXO
 DNZZ1paZhcVw==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="476426302"
Received: from tmuluk-mobl.ger.corp.intel.com ([10.249.254.198])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 06:37:29 -0700
Message-ID: <30dc2d316b643a07babbb3a985b6ff2bbf533345.camel@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 09/12] drm/ttm: Document and optimize
 ttm_bo_pipeline_gutting()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 25 May 2021 15:37:27 +0200
In-Reply-To: <CAM0jSHO59Kr534HC-i816yRMJ22-XNN-AHwdoSFtK5KBiD99=g@mail.gmail.com>
References: <20210521153253.518037-1-thomas.hellstrom@linux.intel.com>
 <20210521153253.518037-10-thomas.hellstrom@linux.intel.com>
 <CAM0jSHO59Kr534HC-i816yRMJ22-XNN-AHwdoSFtK5KBiD99=g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-05-25 at 12:00 +0100, Matthew Auld wrote:
> On Fri, 21 May 2021 at 16:33, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
> > 
> > If the bo is idle when calling ttm_bo_pipeline_gutting(), we
> > unnecessarily
> > create a ghost object and push it out to delayed destroy.
> > Fix this by adding a path for idle, and document the function.
> > 
> > Also avoid having the bo end up in a bad state vulnerable to user-
> > space
> > triggered kernel BUGs if the call to ttm_tt_create() fails.
> > 
> > Finally reuse ttm_bo_pipeline_gutting() in ttm_bo_evict().
> > 
> > Cc: Christian König <christian.koenig@amd.com>
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/ttm/ttm_bo.c      | 20 ++++++------
> >  drivers/gpu/drm/ttm/ttm_bo_util.c | 52
> > ++++++++++++++++++++++++++++---
> >  drivers/gpu/drm/ttm/ttm_tt.c      |  5 +++
> >  include/drm/ttm/ttm_tt.h          | 10 ++++++
> >  4 files changed, 73 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > b/drivers/gpu/drm/ttm/ttm_bo.c
> > index ca1b098b6a56..a8fa3375b8aa 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -501,10 +501,15 @@ static int ttm_bo_evict(struct
> > ttm_buffer_object *bo,
> >         bdev->funcs->evict_flags(bo, &placement);
> > 
> >         if (!placement.num_placement &&
> > !placement.num_busy_placement) {
> > -               ttm_bo_wait(bo, false, false);
> > +               ret = ttm_bo_wait(bo, true, false);
> > +               if (ret)
> > +                       return ret;
> > 
> > -               ttm_bo_cleanup_memtype_use(bo);
> > -               return ttm_tt_create(bo, false);
> > +               /*
> > +                * Since we've already synced, this frees backing
> > store
> > +                * immediately.
> > +                */
> > +               return ttm_bo_pipeline_gutting(bo);
> >         }
> > 
> >         ret = ttm_bo_mem_space(bo, &placement, &evict_mem, ctx);
> > @@ -974,13 +979,8 @@ int ttm_bo_validate(struct ttm_buffer_object
> > *bo,
> >         /*
> >          * Remove the backing store if no placement is given.
> >          */
> > -       if (!placement->num_placement && !placement-
> > >num_busy_placement) {
> > -               ret = ttm_bo_pipeline_gutting(bo);
> > -               if (ret)
> > -                       return ret;
> > -
> > -               return ttm_tt_create(bo, false);
> > -       }
> > +       if (!placement->num_placement && !placement-
> > >num_busy_placement)
> > +               return ttm_bo_pipeline_gutting(bo);
> > 
> >         /*
> >          * Check whether we need to move buffer.
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > index 4a7d3d672f9a..7fa9b3a852eb 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > @@ -585,26 +585,70 @@ int ttm_bo_move_accel_cleanup(struct
> > ttm_buffer_object *bo,
> >  }
> >  EXPORT_SYMBOL(ttm_bo_move_accel_cleanup);
> > 
> > +/**
> > + * ttm_bo_pipeline_gutting - purge the contents of a bo
> > + * @bo: The buffer object
> > + *
> > + * Purge the contents of a bo, async if the bo is not idle.
> > + * After a successful call, the bo is left unpopulated in
> > + * system placement. The function may wait uninterruptible
> > + * for idle on OOM.
> > + *
> > + * Return: 0 if successful, negative error code on failure.
> > + */
> >  int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
> >  {
> >         static const struct ttm_place sys_mem = { .mem_type =
> > TTM_PL_SYSTEM };
> >         struct ttm_buffer_object *ghost;
> > +       struct ttm_tt *ttm;
> >         int ret;
> > 
> > -       ret = ttm_buffer_object_transfer(bo, &ghost);
> > +       /* If already idle, no need for ghost object dance. */
> > +       ret = ttm_bo_wait(bo, false, true);
> > +       if (ret != -EBUSY) {
> > +               if (!bo->ttm) {
> > +                       ret = ttm_tt_create(bo, true);
> 
> Why do we now unconditionally add clearing? Below also.

Here we've dropped the bo content and we add but do not populate a page
vector. Now if someone resurrects this object we obtain new pages and
those must be cleared, at least that's the intention.

/Thomas



