Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 114297DB9CA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 13:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1799A10E0BE;
	Mon, 30 Oct 2023 12:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8D910E2A2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 12:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3CANlt0bzcdI4D7h59VnZbtPlMmOGO5OUX/Fhx2orbM=; b=S0iXVcmqQjAXoLhfJ9QE5UsQvH
 f0PtHj8dLjJjvidzX4t2ODSU4LvKsyYlOOnxg771+h6/I3B2E0Yl+oUMjG4RnRHUd7bYJtwRb665+
 qvwL7e/FqVGXdZSh5RaKDwrig16keIC1Mn6vzQLfGLwzLiw/++3t9dU+8+XbVt1kpdLBtkpZ+F4YT
 g2QL8H12s8pklpvHVU3kNI0Jf3wKViMc7Fz5uM5rhKmhobd7COVwSweS7bVRvcgKZnNKdVrFmwz/B
 Yu3AySmhJCe/Pe02l0KTeBG8SoDmVVwHl6M1GYUkowXgFme1bNKj9kZQO3ny0VokZdqWM4vlBJGVE
 t+Hgageg==;
Received: from 229.48.60.213.dynamic.reverse-mundo-r.com ([213.60.48.229]
 helo=[192.168.0.100]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qxRGB-00Eu19-Vx; Mon, 30 Oct 2023 13:20:48 +0100
Message-ID: <5a5fd75945b6446783171e870e0c9f157bba557e.camel@igalia.com>
Subject: Re: [PATCH 1/2] drm/v3d: wait for all jobs to finish before
 unregistering
From: Iago Toral <itoral@igalia.com>
To: Maira Canal <mcanal@igalia.com>, Emma Anholt <emma@anholt.net>, Melissa
 Wen <mwen@igalia.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 30 Oct 2023 13:20:47 +0100
In-Reply-To: <abb70285-d7ae-7b8a-8af0-1282de9314bf@igalia.com>
References: <20231023105927.101502-1-mcanal@igalia.com>
 <807b6fd6f6100c7cd824f4aa1a80ec1421d7222c.camel@igalia.com>
 <abb70285-d7ae-7b8a-8af0-1282de9314bf@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

El mar, 24-10-2023 a las 07:05 -0300, Maira Canal escribi=C3=B3:
> Hi Iago,
>=20
> On 10/24/23 02:57, Iago Toral wrote:
> > El lun, 23-10-2023 a las 07:58 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> > > Currently, we are only warning the user if the BIN or RENDER jobs
> > > don't
> > > finish before we unregister V3D. We must wait for all jobs to
> > > finish
> > > before unregistering. Therefore, warn the user if TFU or CSD jobs
> > > are not done by the time the driver is unregistered.
> > >=20
> > > Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/v3d/v3d_gem.c | 2 ++
> > > =C2=A0=C2=A01 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/v3d/v3d_gem.c
> > > b/drivers/gpu/drm/v3d/v3d_gem.c
> > > index 2e94ce788c71..afa7d170d1ff 100644
> > > --- a/drivers/gpu/drm/v3d/v3d_gem.c
> > > +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> > > @@ -1072,6 +1072,8 @@ v3d_gem_destroy(struct drm_device *dev)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0WARN_ON(v3d->bi=
n_job);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0WARN_ON(v3d->re=
nder_job);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0WARN_ON(v3d->tfu_job);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0WARN_ON(v3d->csd_job);
> >=20
> > I guess we should do this for cache clean jobs too, right?
>=20
> As the cache clean jobs are synchronous, we don't keep track of the
> current cache clean job. When I say that the cache clean jobs are
> synchronous, it means that the end of the job is not determined by
> an interruption. Therefore, there is no need to make sure that the
> cache clean jobs are still running.

I see, thanks Ma=C3=ADra.

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

>=20
> Best Regards,
> - Ma=C3=ADra
>=20
> >=20
> > Iago
> >=20
> > > =C2=A0=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_mm_takedown=
(&v3d->mm);
> > > =C2=A0=20
> >=20
>=20

