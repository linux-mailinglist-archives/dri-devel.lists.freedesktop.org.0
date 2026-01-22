Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIulKdc4cmmadwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 15:48:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB493681D8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 15:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933D510E06A;
	Thu, 22 Jan 2026 14:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="n6CtIly1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CDA10E06A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 14:48:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E22CB1A2AAD;
 Thu, 22 Jan 2026 14:48:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AFB01606B6;
 Thu, 22 Jan 2026 14:48:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4717D119B80D3; Thu, 22 Jan 2026 15:48:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769093328; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=j08CZYreWkoiN+l1Th5hMC9vcpfI9DQRPaNd9bd6GEg=;
 b=n6CtIly1fP5j1hMNuel0x4IJ8soH2Y27mG0LvBri9txYrMg8cZER1vYfcL9yJtxNrKMBg+
 rhXDMCJe+gffQTTjPsRnAH7GqnCpy+BTRhK4TmLM0H+MioItDgnC/qM8EWsQkjvIqHBxI0
 lz950Po5n0+lcL1n2z1iy3FS3INpMLlJ0IJbO0YhH4dXKoWEZMSQZNhWNaDdSDtSy8Ll4c
 foHOGs+RryPdVSdBNpvFEfNqQPMPM8AUk25pQs+GJVPhH8b/mLgSdHbneG40g9D018R6gX
 MR0icGk6lg1P12qn75OSgYLvo+G9C5LZCF1f/YdytVkqUFWXkVUi94cv/tXShQ==
Date: Thu, 22 Jan 2026 15:48:40 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony Lindgren" <tony@atomide.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Markus
 Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v4 18/25] drm/tilcdc: Convert to DRM managed resources
Message-ID: <20260122154840.5185671a@kmaincent-XPS-13-7390>
In-Reply-To: <DFSVOBV5UY37.3HTQHOJT3A40N@bootlin.com>
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
 <20260116-feature_tilcdc-v4-18-2c1c22143087@bootlin.com>
 <DFSVOBV5UY37.3HTQHOJT3A40N@bootlin.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:brgl@bgdev.pl,m:tony@atomide.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:msp@baylibre.com,m:praneeth@ti.com,m:louis.chauvet@bootlin.com,m:thomas.petazzoni@bootlin.com,m:miguel.gazquez@bootlin.com,m:herve.codina@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-omap@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[31];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[iki.fi,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,armlinux.org.uk,bgdev.pl,atomide.com,intel.com,linaro.org,kwiboo.se,baylibre.com,ti.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email,bootlin.com:url,bootlin.com:dkim]
X-Rspamd-Queue-Id: DB493681D8
X-Rspamd-Action: no action

On Mon, 19 Jan 2026 22:19:26 +0100
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:

> On Fri Jan 16, 2026 at 6:02 PM CET, Kory Maincent (TI.com) wrote:
> > Convert the tilcdc driver to use DRM managed resources (drmm_* APIs)
> > to eliminate resource lifetime issues, particularly in probe deferral
> > scenarios.
> >
> > This conversion addresses potential use-after-free bugs by ensuring
> > proper cleanup ordering through the DRM managed resource framework.
> > The changes include:
> > - Replace drm_crtc_init_with_planes() with drmm_crtc_alloc_with_planes()
> > - Replace drm_universal_plane_init() with drmm_universal_plane_alloc()
> > - Replace drm_simple_encoder_init() with drmm_simple_encoder_alloc()
> > - Remove manual cleanup in tilcdc_crtc_destroy() and error paths
> > - Remove drm_encoder_cleanup() from encoder error handling paths
> > - Use drmm_add_action_or_reset() for remaining cleanup operations
> >
> > This approach is recommended by the DRM subsystem for improved resource
> > lifetime management and is particularly important for drivers that may
> > experience probe deferral.
> >
> > Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> > ---
> >
> > Change in v4:
> > - Newt patch. =20
>=20
> Why? Adding patches along the way does not help getting your series merged
> timely. If there's a good reason for adding a new patch, please mention it
> here.

Thanks for your review.

Sorry for that. The reason is that I faced a null pointer dereference koops=
 if
for example the panel module is not installed. Then the
drm_of_find_panel_or_bridge() function return eprobe defer and something go=
es
wrong with the DRM resources. Using DRM managed resources solves it.
I will mention it for the v5.

> > +	tilcdc_crtc =3D drmm_crtc_alloc_with_planes(dev, struct tilcdc_crtc,
> > base,
> > +						  &primary->base,
> > +						  NULL,
> > +						  &tilcdc_crtc_funcs,
> > +						  "tilcdc crtc");
> > +	if (IS_ERR(tilcdc_crtc)) {
> > +		dev_err(dev->dev, "Failed to init CRTC: %pe\n",
> > tilcdc_crtc);
> > +		return PTR_ERR(tilcdc_crtc);
> > +	}
> > +
> > +	tilcdc_crtc->primary =3D primary; =20
>=20
> (*) see below
>=20
> >
> >  	init_completion(&tilcdc_crtc->palette_loaded);
> >  	tilcdc_crtc->palette_base =3D dmam_alloc_coherent(dev->dev,
> > @@ -978,10 +992,6 @@ int tilcdc_crtc_create(struct drm_device *dev)
> >
> >  	crtc =3D &tilcdc_crtc->base;
> >
> > -	ret =3D tilcdc_plane_init(dev, &tilcdc_crtc->primary);
> > -	if (ret < 0)
> > -		goto fail;
> > -
> >  	mutex_init(&tilcdc_crtc->enable_lock);
> >
> >  	init_waitqueue_head(&tilcdc_crtc->frame_done_wq);
> > @@ -989,20 +999,12 @@ int tilcdc_crtc_create(struct drm_device *dev)
> >  	spin_lock_init(&tilcdc_crtc->irq_lock);
> >  	INIT_WORK(&tilcdc_crtc->recover_work, tilcdc_crtc_recover_work);
> >
> > -	ret =3D drm_crtc_init_with_planes(dev, crtc,
> > -					&tilcdc_crtc->primary,
> > -					NULL,
> > -					&tilcdc_crtc_funcs,
> > -					"tilcdc crtc");
> > -	if (ret < 0)
> > -		goto fail;
> > -
> >  	drm_crtc_helper_add(crtc, &tilcdc_crtc_helper_funcs);
> >
> > +	ret =3D drmm_add_action_or_reset(dev, tilcdc_crtc_destroy, priv);
> > +	if (ret)
> > +		return ret; =20
>=20
> Not related to your patch, but if the dmam_alloc_coherent() (not visible =
in
> the diff) fails, tilcdc_crtc_destroy() won't be called. Is this intended?
> At first sight this drmm_add_action_or_reset() should be moved at (*), ju=
st
> after the allocation.

You are totally right.

> However being not related to your patch I'd leave this for another series
> anyway, to avoid making this series a moving target.

I think it is related to this patch.
Before this patch there was no need for cleanup as the only action before t=
he
dmam_alloc_coherent() was a devm_kzalloc().
Now the plane and the crtc are initialize before the dmam_alloc_coherent() =
so
the cleanup need to happen if it fails an error.

> I find this patch hard to read and I think because it is converting
> multiple things at once. Splitting it in small steps would have been nice,
> even thought I'm not 100% sure it would have been doable.

Yes, it brought more error when not converting the whole to DRM Managed
resources in one go.

>=20
> Nevertheless it looks correct, so:
>=20
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Thanks, but I will remove it due to the small change.=20
Or maybe it is ok for you if I keep it with only the move of
drmm_add_action_or_reset().

Regards.
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
