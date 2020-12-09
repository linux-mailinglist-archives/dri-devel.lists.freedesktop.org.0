Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 312162D4A9A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 20:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001316E133;
	Wed,  9 Dec 2020 19:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CE36E133
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 19:40:34 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t4so3018497wrr.12
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 11:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/ndpcZIffHkvfeSgAOYs1vW51rxZGrcNbwAm7hSNScc=;
 b=hj60k+bdAJAHTayGpQo5A/WANJK7zJxOZuSHrM3D5hspTsbvO+mDcreuzZEx2vz6Rq
 L0wYtBJYCJU0Mwa/jjDRd3ZqCGL+FurglW5CbbNVgeWb0RLxIot/qawbM2QdICf7Z2Kv
 79DVlXE0d+2a1m07HadmPfBzen8QPjmEmw7nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/ndpcZIffHkvfeSgAOYs1vW51rxZGrcNbwAm7hSNScc=;
 b=Xmon+wLM9L3e+F/JzNOQ2OgZM49ED7wm1qmDoGbOMZqasfEkzRXdZGlqORbAvN/9GV
 JO2aVwNkX5DJlYt6qoCRikNcjXawVWu1Vez8u7V70fKK8xfjroHIYS1wEg6uF65iUXJ1
 NvzhGtEU5l5y9J/R4ZXePB/vQNUns2OaCDQHxS7hiq5XIqlpl1FLDWv0N/0KBBvQ1rp7
 W9crZ3N6PL4cA05qJsFVa53D7wiiei95klTc1SvBy8PwlJhPU/n6A4UCgxqnlKXSwoQ0
 06BSAv3MvpTnEDZffLZLVyDLO0OttUcmSbLHJZJC8mwi+RJjYLyCh8mheAmsB9+WQQTe
 twBA==
X-Gm-Message-State: AOAM531xvmOfpoctgVDK5XzBENCJIIgkP9QCAasQGiAJnxxsDRCith5m
 TiAw5Xm3B5mhkIzS7KM/0T+CkiXUwR0n+Q==
X-Google-Smtp-Source: ABdhPJwsjIRBbh+DJDhcdwEFjSt8E6GCTLLGxcK4ylpHg5g7pgrm3lY1a05W0WpJTpgvQYGTkev3MA==
X-Received: by 2002:adf:8b09:: with SMTP id n9mr4266037wra.180.1607542833096; 
 Wed, 09 Dec 2020 11:40:33 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h14sm5507883wrx.37.2020.12.09.11.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 11:40:32 -0800 (PST)
Date: Wed, 9 Dec 2020 20:40:30 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: rework description of primary and cursor planes
Message-ID: <20201209194030.GV401619@phenom.ffwll.local>
References: <wrDqxEGdxtotWKrfQH8W8tl2Z8JgdHzUs3wuTth4@cp4-web-027.plabs.ch>
 <20201209004223.GL401619@phenom.ffwll.local>
 <0zedd9O9Bp0DfEH26xBTGvZtqA5bdE2EJDN3z5TXiDIyiwfTnRapgDy69MjAlhMWrzqKTzoYwovpGANNhp1PmneSCrm-xzw9DIeauv1SkgM=@emersion.fr>
 <20201209160223.GT401619@phenom.ffwll.local>
 <W7ZhvStaUaGjlhYSldWxC93V0-tjSEwm-ldyPBpmvkJ9xRw1krfB1TNd5X4hEjkamaEhH1ASD0yiFzMCh72oG8vCeg-HeOt5dRN5U5v_q34=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <W7ZhvStaUaGjlhYSldWxC93V0-tjSEwm-ldyPBpmvkJ9xRw1krfB1TNd5X4hEjkamaEhH1ASD0yiFzMCh72oG8vCeg-HeOt5dRN5U5v_q34=@emersion.fr>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 09, 2020 at 04:35:31PM +0000, Simon Ser wrote:
> On Wednesday, December 9th, 2020 at 5:02 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Wed, 9 Dec 2020 01:42:23 +0100
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > > On Sun, Dec 06, 2020 at 04:34:15PM +0000, Simon Ser wrote:
> > > > The previous wording could be understood by user-space evelopers as "a
> > > > primary/cursor plane is only compatible with a single CRTC" [1].
> > > >
> > > > Reword the planes description to make it clear the DRM-internal
> > > > drm_crtc.primary and drm_crtc.cursor planes are for legacy uAPI.
> > > >
> > > > [1]: https://github.com/swaywm/wlroots/pull/2333#discussion_r456788057
> > > >
> > > > Signed-off-by: Simon Ser <contact@emersion.fr>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_crtc.c  |  3 +++
> > > >  drivers/gpu/drm/drm_plane.c | 16 +++++++++-------
> > > >  2 files changed, 12 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> > > > index 74090fc3aa55..c71b134d663a 100644
> > > > --- a/drivers/gpu/drm/drm_crtc.c
> > > > +++ b/drivers/gpu/drm/drm_crtc.c
> > > > @@ -256,6 +256,9 @@ struct dma_fence *drm_crtc_create_fence(struct drm_crtc *crtc)
> > > >   * planes). For really simple hardware which has only 1 plane look at
> > > >   * drm_simple_display_pipe_init() instead.
> > > >   *
> > > > + * The @primary and @cursor planes are only relevant for legacy uAPI, see
> > > > + * &drm_crtc.primary and &drm_crtc.cursor.
> > > > + *
> > > >   * Returns:
> > > >   * Zero on success, error code on failure.
> > > >   */
> > > > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > > > index e6231947f987..7a5697bc9e04 100644
> > > > --- a/drivers/gpu/drm/drm_plane.c
> > > > +++ b/drivers/gpu/drm/drm_plane.c
> > > > @@ -49,14 +49,16 @@
> > > >   * &struct drm_plane (possibly as part of a larger structure) and registers it
> > > >   * with a call to drm_universal_plane_init().
> > > >   *
> > > > - * Cursor and overlay planes are optional. All drivers should provide one
> > > > - * primary plane per CRTC to avoid surprising userspace too much. See enum
> > > > - * drm_plane_type for a more in-depth discussion of these special uapi-relevant
> > > > - * plane types. Special planes are associated with their CRTC by calling
> > > > - * drm_crtc_init_with_planes().
> > > > - *
> > > >   * The type of a plane is exposed in the immutable "type" enumeration property,
> > > > - * which has one of the following values: "Overlay", "Primary", "Cursor".
> > > > + * which has one of the following values: "Overlay", "Primary", "Cursor" (see
> > > > + * enum drm_plane_type). A plane can be compatible with multiple CRTCs, see
> > > > + * &drm_plane.possible_crtcs.
> > > > + *
> > > > + * Legacy uAPI doesn't expose the primary and cursor planes directly. DRM core
> > > > + * relies on the driver to set the primary and optionally the cursor plane used
> > > > + * for legacy IOCTLs. This is done by calling drm_crtc_init_with_planes(). All
> > > > + * drivers should provide one primary plane per CRTC to avoid surprising legacy
> >
> > s/should/must/?
> 
> Unsure about this. Do we really want to WARN_ON(!crtc->primary)?

Lack of crtc->primary breaks the world: fbdev stops working, most boot
splashes and simplistic userspace stops working, the entire legacy uapi
stops working.

If the hw can at all do it, we'll require it. So I really think we should
require the MUST here (and the warning on top perhaps, or the more
elaborate validation I proposed).

> > > > + * userspace too much.
> >
> > I think it would also be useful for atomic userspace. Sure, atomic
> > userspace can be expected handle failures, but if there is not at least
> > one primary type KMS plane available for a CRTC, then userspace
> > probably never uses that CRTC which means the end user could be left
> > without an output they wanted.
> 
> The reason why I explicitly mentionned legacy user-space here is that the whole
> paragraph is about the internal legacy primary/cursor pointers. I don't want to
> mix in requirements for atomic user-space in here.
> 
> But yes some atomic user-space will misbehave if it finds a CRTC without any
> candidate primary plane. I guess we could add a new paragraph among those
> lines:
> 
>     Each CRTC should be compatible with at least one primary plane to avoid
>     surprising userspace too much.
> 
> But it's not enough, can't have a single primary plane for two CRTCs.
> 
>     Each CRTC should be compatible with at least one primary plane, and there
>     should be as many primary planes as there are CRTCs to avoid suprising
>     userspace too much.
> 
> But it's not enough, can't have two CRTCs with the same primary plane. Well,
> I give up, it's just simpler to use Daniel's criteria.

Yeah, also with the validation check we'll now real quick if any driver
gets it wrong. Then I think we can have a useful discussion about why, and
what to do with that case. As-is we're kinda drafting specs in the void,
which is always a bit tough ...

That's kinda another reason for doing the stricter check I proposed, it's
easier to check and guarantee (on both the driver and compositor side
hopefully).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
