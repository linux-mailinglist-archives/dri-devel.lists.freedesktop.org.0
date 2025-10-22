Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BB1BFB051
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 10:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDBE10E70C;
	Wed, 22 Oct 2025 08:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="yI8qH9Bm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2736A10E70C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 08:58:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 95CF31A15CD;
 Wed, 22 Oct 2025 08:58:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6AC9A606DC;
 Wed, 22 Oct 2025 08:58:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2060F102F242C; 
 Wed, 22 Oct 2025 10:58:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761123534; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=h3wyVAAjgpfAxuh8GhpQv3L/iuVzTsI8pLm/DOPP3nE=;
 b=yI8qH9Bmmj+bpaMMWZZa1WzEVRgeh7bv/rOJ6iBmWn23Rbcl/n+Yf4jtRC2mR9lz0LF0Tn
 BOealVg3vVP5jxBp4OvheZwT10E4JDQYJHq+eBBvgajOLjmvExN3xS8cL6/uQfGdR1EVLY
 7jBylk06ZeSoUuLXGj+EqmpxsZXuiX7Nun95HQMhaPHqstX+a2LTHaCaJhZaAS9DZ1jyxJ
 GiHUQWjTwdmVoAFkRU21Wgl1HHs8zQrvNDOKGvgHWzYIb7fBDJCRMPC4Xv6umb6cawr0yt
 TWRhDs0dLc1MhanFgjk6VSym/Ux5jJz9RRO5f0eV1Wk4Nw75kwHy23TQVFMTXw==
Date: Wed, 22 Oct 2025 10:58:40 +0200
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
Message-ID: <20251022105840.5e1f06bf@kmaincent-XPS-13-7390>
In-Reply-To: <5269c71a-b439-46d3-acb4-590eee2406f4@ideasonboard.com>
References: <20251014143229.559564-1-kory.maincent@bootlin.com>
 <5269c71a-b439-46d3-acb4-590eee2406f4@ideasonboard.com>
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

On Wed, 22 Oct 2025 10:05:47 +0300
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Hi,
>=20
> On 14/10/2025 17:32, Kory Maincent wrote:
> > From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
> >=20
> > The drm_kms_helper_poll_fini() and drm_atomic_helper_shutdown() helpers
> > should only be called when the device has been successfully registered.
> > Currently, these functions are called unconditionally in tilcdc_fini(),
> > which causes warnings during probe deferral scenarios.
> >=20
> > [    7.972317] WARNING: CPU: 0 PID: 23 at
> > drivers/gpu/drm/drm_atomic_state_helper.c:175
> > drm_atomic_helper_crtc_duplicate_state+0x60/0x68 ... [    8.005820]
> > drm_atomic_helper_crtc_duplicate_state from
> > drm_atomic_get_crtc_state+0x68/0x108 [    8.005858]
> > drm_atomic_get_crtc_state from drm_atomic_helper_disable_all+0x90/0x1c8=
 [
> >  8.005885]  drm_atomic_helper_disable_all from
> > drm_atomic_helper_shutdown+0x90/0x144 [    8.005911]
> > drm_atomic_helper_shutdown from tilcdc_fini+0x68/0xf8 [tilcdc] [
> > 8.005957]  tilcdc_fini [tilcdc] from tilcdc_pdev_probe+0xb0/0x6d4 [tilc=
dc]
> >=20
> > Fix this by moving both drm_kms_helper_poll_fini() and
> > drm_atomic_helper_shutdown() inside the priv->is_registered conditional
> > block, ensuring they only execute after successful device registration.
> >=20
> > Fixes: 3c4babae3c4a ("drm: Call drm_atomic_helper_shutdown() at
> > shutdown/remove time for misc drivers") Signed-off-by: Kory Maincent
> > (TI.com) <kory.maincent@bootlin.com> =20
>=20
> Should this be cc: stable?

Indeed I think so.

--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
