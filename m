Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06410BF6B44
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 15:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE8F10E5E3;
	Tue, 21 Oct 2025 13:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="THN0jJkn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7C610E5E3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 13:14:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0B401C0B887
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 13:14:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 97C2F60680;
 Tue, 21 Oct 2025 13:14:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2E6FA102F2403; 
 Tue, 21 Oct 2025 15:14:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761052487; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=lKeQTm9TBCdl3jhEh30xKHzcJ/AvP84waFAJQyNp9dQ=;
 b=THN0jJknB2+qSSzRX7sNi1IniQBFcb6kSYu5+ANMhlR6MFFP01X2sqo7gqWEVKQjTdzrXw
 2NpAajNFdCjkJrceZhVvo1Wc8G3OycyhpZbNImBZCLgyIKRwvMOFKNNIPlRoZb+Bo19gWc
 MgPByYkndtpcmunCfQXY7/Qn9f7RMfP/2Zn5Mem9I5qZJGtHpHPSSYcjOr9oUvf1js43ZS
 WQl4vwvcH/wWLkf8hmXjRUwGctHb7cez4GZMDO/p0hjwEXWkVZ1QlCDZzYn7meg3nSPufl
 2RjRKJh0wZctq+3kZ7tlo5TPfs2m2c58nmcn2QDRpc+znhm4sLo41A0zcfLtLw==
Date: Tue, 21 Oct 2025 15:14:35 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Douglas Anderson
 <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bajjuri Praneeth <praneeth@ti.com>, Louis
 Chauvet <louis.chauvet@bootlin.com>, thomas.petazzoni@bootlin.com, Jyri
 Sarha <jyri.sarha@iki.fi>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Subject: Re: [PATCH] drm/tilcdc: Fix removal actions in case of failed probe
Message-ID: <20251021151435.23a03b85@kmaincent-XPS-13-7390>
In-Reply-To: <20251014182122.5f63b027@kmaincent-XPS-13-7390>
References: <20251014143229.559564-1-kory.maincent@bootlin.com>
 <p4u2goyadub3dfuz4empf3g7a44b2ausy4hjjkcwj7nzgeochx@xztpij2i2lao>
 <20251014182122.5f63b027@kmaincent-XPS-13-7390>
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

On Tue, 14 Oct 2025 18:21:22 +0200
Kory Maincent <kory.maincent@bootlin.com> wrote:

> Hello Maxime,
>=20
> On Tue, 14 Oct 2025 17:36:47 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Tue, Oct 14, 2025 at 04:32:28PM +0200, Kory Maincent wrote: =20
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
> > > (TI.com) <kory.maincent@bootlin.com> ---
> > >  drivers/gpu/drm/tilcdc/tilcdc_drv.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> > > b/drivers/gpu/drm/tilcdc/tilcdc_drv.c index 7caec4d38ddf..2031267a3490
> > > 100644 --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> > > +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> > > @@ -172,11 +172,11 @@ static void tilcdc_fini(struct drm_device *dev)
> > >  	if (priv->crtc)
> > >  		tilcdc_crtc_shutdown(priv->crtc);
> > > =20
> > > -	if (priv->is_registered)
> > > +	if (priv->is_registered) {
> > >  		drm_dev_unregister(dev);
> > > -
> > > -	drm_kms_helper_poll_fini(dev);
> > > -	drm_atomic_helper_shutdown(dev);
> > > +		drm_kms_helper_poll_fini(dev);
> > > +		drm_atomic_helper_shutdown(dev);
> > > +	}
> > >  	tilcdc_irq_uninstall(dev);
> > >  	drm_mode_config_cleanup(dev);   =20
> >=20
> > I don't think that's the right fix. tilcdc_fini is pretty complex
> > because it gets called from multiple locations with various level of
> > initialisation.
> >=20
> > This is done because tilcdc_init is using a bunch of deprecated
> > functions with better alternatives now, and those would make the job of
> > tilcdc_fini much easier.
> >=20
> > That's what we should be focusing on. =20
>=20
> I am also currently focusing on improving this driver (which has indeed s=
ome
> weird code leftover), but this work will land in drm misc next while this=
 is a
> fix for the current implementation which fix an unwanted warning.

Maxime is it okay to merge this to the right drm fix branch as I am current=
ly
working on the tilcdc cleaning process that will land into drm misc next.

Also I intend to remove the tilcdc panel subdriver and its binding as it
can be replaced by the simple panel driver. I know it is unusual to remove a
binding but the driver and the binding are crappy and legacy. What do you t=
hink?

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
