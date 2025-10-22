Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D9BBFB0C9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 11:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DA010E6EA;
	Wed, 22 Oct 2025 09:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="BRsA2xdL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA4610E712
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 09:04:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 111821A15D0;
 Wed, 22 Oct 2025 09:04:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DAFC6606DC;
 Wed, 22 Oct 2025 09:04:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EC1EC102F2424; 
 Wed, 22 Oct 2025 11:04:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761123869; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=TPfFMBERm5dyXammymO+1vkoeJ/PAmEMHoRiaPzuWiE=;
 b=BRsA2xdLFHxr5wkHQuVgtmzHR8hGlOzwut65jYHV16OJttkXiYP9Mk+6cA+1JL391boUKl
 Ytxx1L4Qyh4CFndUy+Q+09ce37oPbPs52IpJVVv53gBfBfBwns/hQFIWvdrg7OHIs3c0wy
 Ben67npuuzn+dXIEpxJlGXWdgGhHYR5gm4pOeEXnYCO2nQQGJ55vixLTewyM2Wim+zS+sQ
 0aEuNt3dDglk6GHWI8WzCd6C7LiPyNEqL1BM+DWWHFGjrYOn6gaNbaxk0n4V5UV9UR5jTM
 HasfWNk9NScktaUVnu/3z4coRPzBUM+cjq1VU/RyVz7v5D6eqPbwFZ0opAgpjw==
Date: Wed, 22 Oct 2025 11:04:24 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Douglas Anderson <dianders@chromium.org>, Maxime Ripard
 <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bajjuri Praneeth <praneeth@ti.com>, Louis
 Chauvet <louis.chauvet@bootlin.com>, thomas.petazzoni@bootlin.com, Jyri
 Sarha <jyri.sarha@iki.fi>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Subject: Re: [PATCH] drm/tilcdc: Fix removal actions in case of failed probe
Message-ID: <20251022110424.36a63ad3@kmaincent-XPS-13-7390>
In-Reply-To: <20251022105840.5e1f06bf@kmaincent-XPS-13-7390>
References: <20251014143229.559564-1-kory.maincent@bootlin.com>
 <5269c71a-b439-46d3-acb4-590eee2406f4@ideasonboard.com>
 <20251022105840.5e1f06bf@kmaincent-XPS-13-7390>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
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

On Wed, 22 Oct 2025 10:58:40 +0200
Kory Maincent <kory.maincent@bootlin.com> wrote:

> On Wed, 22 Oct 2025 10:05:47 +0300
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
>=20
> > Hi,
> >=20
> > On 14/10/2025 17:32, Kory Maincent wrote: =20
> > > From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
> > >=20
> > > The drm_kms_helper_poll_fini() and drm_atomic_helper_shutdown() helpe=
rs
> > > should only be called when the device has been successfully registere=
d.
> > > Currently, these functions are called unconditionally in tilcdc_fini(=
),
> > > which causes warnings during probe deferral scenarios.
> > >=20
> > > [    7.972317] WARNING: CPU: 0 PID: 23 at
> > > drivers/gpu/drm/drm_atomic_state_helper.c:175
> > > drm_atomic_helper_crtc_duplicate_state+0x60/0x68 ... [    8.005820]
> > > drm_atomic_helper_crtc_duplicate_state from
> > > drm_atomic_get_crtc_state+0x68/0x108 [    8.005858]
> > > drm_atomic_get_crtc_state from drm_atomic_helper_disable_all+0x90/0x1=
c8 [
> > >  8.005885]  drm_atomic_helper_disable_all from
> > > drm_atomic_helper_shutdown+0x90/0x144 [    8.005911]
> > > drm_atomic_helper_shutdown from tilcdc_fini+0x68/0xf8 [tilcdc] [
> > > 8.005957]  tilcdc_fini [tilcdc] from tilcdc_pdev_probe+0xb0/0x6d4 [ti=
lcdc]
> > >=20
> > > Fix this by moving both drm_kms_helper_poll_fini() and
> > > drm_atomic_helper_shutdown() inside the priv->is_registered condition=
al
> > > block, ensuring they only execute after successful device registratio=
n.
> > >=20
> > > Fixes: 3c4babae3c4a ("drm: Call drm_atomic_helper_shutdown() at
> > > shutdown/remove time for misc drivers") Signed-off-by: Kory Maincent
> > > (TI.com) <kory.maincent@bootlin.com>   =20
> >=20
> > Should this be cc: stable? =20
>=20
> Indeed I think so.

Should I send a new version with the stable tag included?

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
