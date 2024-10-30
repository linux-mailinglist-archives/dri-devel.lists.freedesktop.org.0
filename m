Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC569B6735
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 16:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665BD10E2BE;
	Wed, 30 Oct 2024 15:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ERJhU7iR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E9E10E2BE
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 15:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730301363;
 bh=7XcxJbm5D06UQvHD13AF8g7v8ihVLD5KCzQURgAp7kU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ERJhU7iRdQt3Ta6xEIfOl56LPJ98BnvTE/P4yiw/i53Fgv+Jk1aqeMImi99ynfxlS
 rMzXMzZrA7rnNxdphfDyXmFJyPwonUPC4E0FehRzhpwKefqpq7TEt29BcnU0RiR2NI
 liqImFb3bGtyCAv2G3YRb5z5CegdyrBAhZCjbqp4m3DSc7mOCNr7fcu09JdI6JVrZe
 HFMWw3HoNo9/gsEXNhqPTeFtFLoQnci9sT1JtAb+BnDTJFND3KLvjeq4TXZ9a90s+W
 gLyeyT4SGSbg+yRxUoYqRJS8Q7rl7ewIO5SzjM2kKRHP/+9XYyZDEU3j1FsL4j9vay
 xFCCmNHpQnYlQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BCE517E3636;
 Wed, 30 Oct 2024 16:16:03 +0100 (CET)
Date: Wed, 30 Oct 2024 16:15:59 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, Liviu Dudau
 <liviu.dudau@arm.com>, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?=
 <peron.clem@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Grant Likely
 <grant.likely@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/panthor: Fix OPP refcnt leaks in devfreq
 initialisation
Message-ID: <20241030161559.7edff79d@collabora.com>
In-Reply-To: <20241030161358.3b78b423@collabora.com>
References: <20241003133037.3398144-1-adrian.larumbe@collabora.com>
 <20241003133037.3398144-2-adrian.larumbe@collabora.com>
 <20241030161358.3b78b423@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 30 Oct 2024 16:13:58 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Thu,  3 Oct 2024 14:30:29 +0100
> Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:
>=20
> > Make sure in case of errors between the first fetch of an OPP in
> > panthor_devfreq_init and its successive put, the error path decrements =
its
> > reference count to avoid OPP object leaks when removing the device.
> >=20
> > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> > Fixes: fac9b22df4b1 ("drm/panthor: Add the devfreq logical block") =20
>=20
> It doesn't apply on top of drm-misc-fixes. Could you send a v3 based
> on drm-misc-fixes please?

Sorry, I meant v4. v3 exists, but doesn't apply correctly on
drm-misc-fixes.

>=20
> > ---
> >  drivers/gpu/drm/panthor/panthor_devfreq.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/dr=
m/panthor/panthor_devfreq.c
> > index 9d0f891b9b53..ce0ac4563f65 100644
> > --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> > +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> > @@ -197,7 +197,7 @@ int panthor_devfreq_init(struct panthor_device *ptd=
ev)
> >  	if (ret && ret !=3D -ENODEV) {
> >  		if (ret !=3D -EPROBE_DEFER)
> >  			DRM_DEV_ERROR(dev, "Couldn't retrieve/enable sram supply\n");
> > -		return ret;
> > +		goto opp_err;
> >  	}
> > =20
> >  	/*
> > @@ -207,7 +207,7 @@ int panthor_devfreq_init(struct panthor_device *ptd=
ev)
> >  	ret =3D dev_pm_opp_set_opp(dev, opp);
> >  	if (ret) {
> >  		DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
> > -		return ret;
> > +		goto opp_err;
> >  	}
> > =20
> >  	dev_pm_opp_put(opp);
> > @@ -242,6 +242,10 @@ int panthor_devfreq_init(struct panthor_device *pt=
dev)
> >  		DRM_DEV_INFO(dev, "Failed to register cooling device\n");
> > =20
> >  	return 0;
> > +
> > +opp_err:
> > +	dev_pm_opp_put(opp);
> > +	return ret;
> >  }
> > =20
> >  int panthor_devfreq_resume(struct panthor_device *ptdev) =20
>=20

