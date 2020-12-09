Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B79A2D46D4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 17:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2406E193;
	Wed,  9 Dec 2020 16:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B176E193
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 16:35:45 +0000 (UTC)
Date: Wed, 09 Dec 2020 16:35:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607531743;
 bh=v56CUSJ98MMK8WQm7+cX9UiPGonC7nr2J/u2cOL4gt0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=TJhV04L2+qrmzn2PQEBmoi5X010d2zo6zwrYX1ymA5bSUprR1uOKqKSbRwBWMGzzj
 w8hjXA7RRfmZMfO4GtaPrwGERU+3291+nGu5GsjTLcfwdd1QT70rEWKXmroZ3KkMFy
 2rL9Ds5+lnzSmvoLZ6H0tND8rrjxPI3LsQYRJCfzovb8+9V8xFI3p1r7nDG9ouXMPf
 yBfzYlRai7XKOZyURBf98zQYnAoMH+0uXptdRwiHTlHiUrIbKsCOfALoF9BrGRfSmj
 H1W3PpYpk+ShRJXOK3WFM/fT6k7zG0HnD9in5/M2qLh7HBvpPqv/+CYOJtngGGLV1c
 KOhYJOpOJuhjw==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: rework description of primary and cursor planes
Message-ID: <W7ZhvStaUaGjlhYSldWxC93V0-tjSEwm-ldyPBpmvkJ9xRw1krfB1TNd5X4hEjkamaEhH1ASD0yiFzMCh72oG8vCeg-HeOt5dRN5U5v_q34=@emersion.fr>
In-Reply-To: <20201209160223.GT401619@phenom.ffwll.local>
References: <wrDqxEGdxtotWKrfQH8W8tl2Z8JgdHzUs3wuTth4@cp4-web-027.plabs.ch>
 <20201209004223.GL401619@phenom.ffwll.local>
 <0zedd9O9Bp0DfEH26xBTGvZtqA5bdE2EJDN3z5TXiDIyiwfTnRapgDy69MjAlhMWrzqKTzoYwovpGANNhp1PmneSCrm-xzw9DIeauv1SkgM=@emersion.fr>
 <20201209160223.GT401619@phenom.ffwll.local>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, December 9th, 2020 at 5:02 PM, Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, 9 Dec 2020 01:42:23 +0100
> Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > On Sun, Dec 06, 2020 at 04:34:15PM +0000, Simon Ser wrote:
> > > The previous wording could be understood by user-space evelopers as "a
> > > primary/cursor plane is only compatible with a single CRTC" [1].
> > >
> > > Reword the planes description to make it clear the DRM-internal
> > > drm_crtc.primary and drm_crtc.cursor planes are for legacy uAPI.
> > >
> > > [1]: https://github.com/swaywm/wlroots/pull/2333#discussion_r456788057
> > >
> > > Signed-off-by: Simon Ser <contact@emersion.fr>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > > ---
> > >  drivers/gpu/drm/drm_crtc.c  |  3 +++
> > >  drivers/gpu/drm/drm_plane.c | 16 +++++++++-------
> > >  2 files changed, 12 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> > > index 74090fc3aa55..c71b134d663a 100644
> > > --- a/drivers/gpu/drm/drm_crtc.c
> > > +++ b/drivers/gpu/drm/drm_crtc.c
> > > @@ -256,6 +256,9 @@ struct dma_fence *drm_crtc_create_fence(struct drm_crtc *crtc)
> > >   * planes). For really simple hardware which has only 1 plane look at
> > >   * drm_simple_display_pipe_init() instead.
> > >   *
> > > + * The @primary and @cursor planes are only relevant for legacy uAPI, see
> > > + * &drm_crtc.primary and &drm_crtc.cursor.
> > > + *
> > >   * Returns:
> > >   * Zero on success, error code on failure.
> > >   */
> > > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > > index e6231947f987..7a5697bc9e04 100644
> > > --- a/drivers/gpu/drm/drm_plane.c
> > > +++ b/drivers/gpu/drm/drm_plane.c
> > > @@ -49,14 +49,16 @@
> > >   * &struct drm_plane (possibly as part of a larger structure) and registers it
> > >   * with a call to drm_universal_plane_init().
> > >   *
> > > - * Cursor and overlay planes are optional. All drivers should provide one
> > > - * primary plane per CRTC to avoid surprising userspace too much. See enum
> > > - * drm_plane_type for a more in-depth discussion of these special uapi-relevant
> > > - * plane types. Special planes are associated with their CRTC by calling
> > > - * drm_crtc_init_with_planes().
> > > - *
> > >   * The type of a plane is exposed in the immutable "type" enumeration property,
> > > - * which has one of the following values: "Overlay", "Primary", "Cursor".
> > > + * which has one of the following values: "Overlay", "Primary", "Cursor" (see
> > > + * enum drm_plane_type). A plane can be compatible with multiple CRTCs, see
> > > + * &drm_plane.possible_crtcs.
> > > + *
> > > + * Legacy uAPI doesn't expose the primary and cursor planes directly. DRM core
> > > + * relies on the driver to set the primary and optionally the cursor plane used
> > > + * for legacy IOCTLs. This is done by calling drm_crtc_init_with_planes(). All
> > > + * drivers should provide one primary plane per CRTC to avoid surprising legacy
>
> s/should/must/?

Unsure about this. Do we really want to WARN_ON(!crtc->primary)?

> > > + * userspace too much.
>
> I think it would also be useful for atomic userspace. Sure, atomic
> userspace can be expected handle failures, but if there is not at least
> one primary type KMS plane available for a CRTC, then userspace
> probably never uses that CRTC which means the end user could be left
> without an output they wanted.

The reason why I explicitly mentionned legacy user-space here is that the whole
paragraph is about the internal legacy primary/cursor pointers. I don't want to
mix in requirements for atomic user-space in here.

But yes some atomic user-space will misbehave if it finds a CRTC without any
candidate primary plane. I guess we could add a new paragraph among those
lines:

    Each CRTC should be compatible with at least one primary plane to avoid
    surprising userspace too much.

But it's not enough, can't have a single primary plane for two CRTCs.

    Each CRTC should be compatible with at least one primary plane, and there
    should be as many primary planes as there are CRTCs to avoid suprising
    userspace too much.

But it's not enough, can't have two CRTCs with the same primary plane. Well,
I give up, it's just simpler to use Daniel's criteria.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
