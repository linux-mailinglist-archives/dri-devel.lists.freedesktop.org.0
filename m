Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DE31EC2C7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 21:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81976E45D;
	Tue,  2 Jun 2020 19:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E2B6E45D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 19:32:26 +0000 (UTC)
IronPort-SDR: aKurbRKu3NqV0Ar3wz+8zZoWhkJqpgIhgum4PMhmycvP5TomVD398Ag2IbrDHDg9/lduMLwjkb
 M77VY3DiT+sQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2020 12:32:25 -0700
IronPort-SDR: sEjLOyBrgJ/iRCfkHU7TaDu1waDXaVzijhGsGt4Y9ggaY2xoecR1MWmZFQuXdU7to0vKhi53ek
 4wiVqUx0WgUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,465,1583222400"; d="scan'208";a="444821760"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com)
 ([10.165.21.211])
 by orsmga005.jf.intel.com with ESMTP; 02 Jun 2020 12:32:25 -0700
Date: Tue, 2 Jun 2020 12:33:10 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: document how user-space should use link-status
Message-ID: <20200602193309.GB6277@intel.com>
References: <krnCwRP0UCcVJbY-8ILP_gEFf4EaUdKPSuuHisFkphFaoOl2EAnU032oOWAeJi2xlsFsA7qeR8lypXs71-SoULZnd2gP5C7ohDEfsWTB5-A=@emersion.fr>
 <20200602103846.5c38d080@eldfell.localdomain>
 <20200602095836.GB20149@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200602095836.GB20149@phenom.ffwll.local>
User-Agent: Mutt/1.5.24 (2015-08-30)
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

On Tue, Jun 02, 2020 at 11:58:36AM +0200, Daniel Vetter wrote:
> On Tue, Jun 02, 2020 at 10:38:46AM +0300, Pekka Paalanen wrote:
> > On Mon, 01 Jun 2020 14:48:58 +0000
> > Simon Ser <contact@emersion.fr> wrote:
> > 
> > > Describe what a "BAD" link-status means for user-space and how it should
> > > handle it. The logic described has been implemented in igt [1].
> > > 
> > > [1]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/fbe61f529737191d0920521946a575bd55f00fbe
> > > 
> > > Signed-off-by: Simon Ser <contact@emersion.fr>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Manasi Navare <manasi.d.navare@intel.com>
> > > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > > ---
> > >  drivers/gpu/drm/drm_connector.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > index f2b20fd66319..08ba84f9787a 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -994,6 +994,12 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
> > >   *      after modeset, the kernel driver may set this to "BAD" and issue a
> > >   *      hotplug uevent. Drivers should update this value using
> > >   *      drm_connector_set_link_status_property().
> > > + *
> > > + *      When user-space receives the hotplug uevent and detects a "BAD"
> > > + *      link-status, the connector is no longer enabled. The list of available
> 
> "no longer enabled" is kinda wrong, you can keep doing pageflip. It's just
> that the pixels aren't getting to the screen anymore.
> 
> "enabled" wrt an output has a different meaning in kms, the internal
> drm_crtc_state->enabled state is very much still set. Including what that
> all means for the uapi.

Yes I was about to comment on that too. And here we should mention, that rather
when user space recieves the hotplug uevent and detects a BAD link status, that
means connector's physical link failed to train correctly hence no output across
the link and a black screen seen on the display. In this case the userspace
should respond to this uevent by reprobing the connector to get a modelist
now as per the new capabilities of the connector after the fallback in link rate/lane count
and retry a full modeset resetting the link-status to GOOD

Also to answer Pekka's concern here about modelist being empty, this should not happen
since the kernel fallsback the link capabilities until it reaches the lowest RBR and 1 lane count
and with this most panels should be still able to do the lowest available mode in their modelist.
And likely the link training will pass for this minimum resolution and minimum capabilities.

Manasi

> 
> Also I think we need some words here on what automatically happens when
> you do an atomic commit with the connector with the bad link status
> (auto-reset to good, which might make the atomic modeset fail). On irc we
> had some discussions that we should only do this if ALLOW_MODESET is set,
> but that's atm not the case.
> -Daniel
> 
> > > + *      modes may have changed. User-space is expected to pick a new mode if
> > > + *      the current one has disappeared and perform a new modeset with
> > > + *      link-status set to "GOOD" to re-enable the connector.
> > >   * non_desktop:
> > >   * 	Indicates the output should be ignored for purposes of displaying a
> > >   * 	standard desktop environment or console. This is most likely because
> > 
> > Hi,
> > 
> > makes sense to me. Can it happen that there will be no modes left in
> > the list?
> > 
> > What if userspace is driving two connectors from the same CRTC, and only
> > one connector gets link-status bad, what does it mean? Is the other
> > connector still running as normal, as if the failed connector didn't
> > even exist?
> > 
> > That is mostly a question about what happens if userspace does not fix
> > up the link-status=bad connector and does not detach it from the CRTC,
> > but keeps on flipping or modesetting as if the failure never happened.
> > I guess I could ask it about both a CRTC that has another connector
> > still good, and a CRTC where the failed connector was the only one.
> > 
> > Can I trust that if the other connector is in any way affected, it too
> > will get link-status bad?
> > 
> > 
> > Thanks,
> > pq
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
