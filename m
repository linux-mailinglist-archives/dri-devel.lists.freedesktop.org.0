Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCB583D2B7
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 03:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B149210E73A;
	Fri, 26 Jan 2024 02:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BA610E73A;
 Fri, 26 Jan 2024 02:47:12 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a31713c8bdbso144807866b.2; 
 Thu, 25 Jan 2024 18:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706237171; x=1706841971; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=44A2+oP7sNzN6xYPE3g+bk3EKfVLFxMaTi3qVJ0M6ms=;
 b=clNXYIW+Ima0jbV2fRAOOpD3Q//FGXA6UrL+Ln5xDL7f5DpU5WWYiWoZzaJe9vhFfe
 T6MBw3svVh2oguqI1D1s9IXf7KU+Lqcp/IUKLsMVLPs0iLVtG8ruO3NOeVEhujLrX81y
 9rCKxdIV7qjKLrwwMZeetnHMQRS8XPnSpiUHfxrnSXvPKgNTCRV2EjLKa+OU9HMFdq9x
 6wyEd9aDmD2U1jI3tZ5VhUxL9XBoRb4ajD9p/xN9Dg8Sty2gShIk582y9G6G8wkYRJj9
 P6FBWZ95Op2Wwi7QAS98tAyTh245RRXwLkWMgqwzG/XUA4XopuIgpWsHafPPQ5p2GxVK
 CIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706237171; x=1706841971;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=44A2+oP7sNzN6xYPE3g+bk3EKfVLFxMaTi3qVJ0M6ms=;
 b=pIqb5/DePc4Zb4eMh0GMHf+epO9xSppBubETeAMAD1x8kxjsdSIdd5RrFtBMuDfL1i
 bWQ3OmxLTUh+AAGuLX9jlpPYp6yC8BoQ1p6Q48QFlneR9US3KZZiipS1U1UFjle+6Zoe
 FSSn5YQCF4gImWrP2EG+A7qXJYsDCsgYCXT5zZY1tHZM6MxTFcGL0SKLlLbwcr2zJgwG
 q/iQUitu84T/dEw1bb34AbQ7QN0APZvyiCRIs+vkOtLgF1PHO95RAUeEhGMwChX9anC7
 V1hqZ1Zr0Navv1a4sDuyx/L88qQFjqrw9EiX5R7Plg8NY4tQu8LSkCbvWmJ05D4YEXXs
 N0Lg==
X-Gm-Message-State: AOJu0Yz/SUPHNXsnq0JPv3h1CkWHoly1qjXGykF7tsLnspRP6hKE+U87
 f1q0xyxtjnsBF+sTRfe8IhyQnBMHOAhSmP1ywKhM+E5wupyHLBA+TyY1w09vqZZfFXGfMRu8YHl
 79DMpZbFEHrmk7rs7qJq47oaWMpU=
X-Google-Smtp-Source: AGHT+IHM1Jd6kTOcFueXiZs1u+zQG2ytcerbbB2AUQRMBCssGAdKH9So4Y4hRKeGiCHzknID3AdnQi6KK72QJRw0auI=
X-Received: by 2002:a17:906:19c9:b0:a2c:1061:c645 with SMTP id
 h9-20020a17090619c900b00a2c1061c645mr256069ejd.44.1706237170541; Thu, 25 Jan
 2024 18:46:10 -0800 (PST)
MIME-Version: 1.0
References: <20240124210811.1639040-1-matthew.brost@intel.com>
 <67f3e729-f5fc-415e-8fa0-f6df4e1336d1@suse.cz>
 <ZbKazWaBOiRLzcNJ@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZbKazWaBOiRLzcNJ@DUT025-TGLU.fm.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 26 Jan 2024 12:45:58 +1000
Message-ID: <CAPM=9twHZboE7-=StQg9zKkRYcaDRLUzj=J9+EmXzfMLfAz=sw@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Drain all entities in DRM sched run job worker
To: Matthew Brost <matthew.brost@intel.com>
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
Cc: ltuikov89@gmail.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thorsten Leemhuis <regressions@leemhuis.info>,
 Mario Limonciello <mario.limonciello@amd.com>, daniel@ffwll.ch,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, christian.koenig@amd.com,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 Just FYI I'm pulling this into drm-fixes straight as is, since if
fixes the regression and avoids the revert, however please keep
discussing until we are sure things are right, and we can deal with
any fixes in a follow-up patch.

Dave.

On Fri, 26 Jan 2024 at 03:32, Matthew Brost <matthew.brost@intel.com> wrote:
>
> On Thu, Jan 25, 2024 at 10:24:24AM +0100, Vlastimil Babka wrote:
> > On 1/24/24 22:08, Matthew Brost wrote:
> > > All entities must be drained in the DRM scheduler run job worker to
> > > avoid the following case. An entity found that is ready, no job found
> > > ready on entity, and run job worker goes idle with other entities + jobs
> > > ready. Draining all ready entities (i.e. loop over all ready entities)
> > > in the run job worker ensures all job that are ready will be scheduled.
> > >
> > > Cc: Thorsten Leemhuis <regressions@leemhuis.info>
> > > Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> > > Closes: https://lore.kernel.org/all/CABXGCsM2VLs489CH-vF-1539-s3in37=bwuOWtoeeE+q26zE+Q@mail.gmail.com/
> > > Reported-and-tested-by: Mario Limonciello <mario.limonciello@amd.com>
> > > Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3124
> > > Link: https://lore.kernel.org/all/20240123021155.2775-1-mario.limonciello@amd.com/
> > > Reported-by: Vlastimil Babka <vbabka@suse.cz>
> >
> > Can change to Reported-and-tested-by: Vlastimil Babka <vbabka@suse.cz>
> >
>
> +1, got it.
>
> Matt
>
> > Thanks!
> >
> > > Closes: https://lore.kernel.org/dri-devel/05ddb2da-b182-4791-8ef7-82179fd159a8@amd.com/T/#m0c31d4d1b9ae9995bb880974c4f1dbaddc33a48a
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/scheduler/sched_main.c | 15 +++++++--------
> > >  1 file changed, 7 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 550492a7a031..85f082396d42 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -1178,21 +1178,20 @@ static void drm_sched_run_job_work(struct work_struct *w)
> > >     struct drm_sched_entity *entity;
> > >     struct dma_fence *fence;
> > >     struct drm_sched_fence *s_fence;
> > > -   struct drm_sched_job *sched_job;
> > > +   struct drm_sched_job *sched_job = NULL;
> > >     int r;
> > >
> > >     if (READ_ONCE(sched->pause_submit))
> > >             return;
> > >
> > > -   entity = drm_sched_select_entity(sched);
> > > +   /* Find entity with a ready job */
> > > +   while (!sched_job && (entity = drm_sched_select_entity(sched))) {
> > > +           sched_job = drm_sched_entity_pop_job(entity);
> > > +           if (!sched_job)
> > > +                   complete_all(&entity->entity_idle);
> > > +   }
> > >     if (!entity)
> > > -           return;
> > > -
> > > -   sched_job = drm_sched_entity_pop_job(entity);
> > > -   if (!sched_job) {
> > > -           complete_all(&entity->entity_idle);
> > >             return; /* No more work */
> > > -   }
> > >
> > >     s_fence = sched_job->s_fence;
> > >
> >
