Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE0BD122DE
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1677610E372;
	Mon, 12 Jan 2026 11:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nz/EWcBJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0F110E372
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ds4zxHDAdxiP9GSjpOxJKWMTU6fu+TphWp4jYLkqpKc=; b=nz/EWcBJ/aZ1c0s0y5m3Pe2f6Q
 mb1WljP2z9Be715BX/LVVs/cPVaOL3TUL1uRixG9StLjcJ3ThxixAXqvVshMy7x3K9TbGQXCd6msO
 NVVV4unnL/GCHxHFuI92BnN1TfDJN++KpFjjlOmNO1VQXdK+kROwG0sLedMRs5p+2gsFnvYb54RmR
 OectBwCqsgKtOcK/ZAdfG+3eWb2R4aP1zEqhTMXzWstP6GW/i1Jvw8qLdDQM/v1k2PDtKMHTNlpfU
 p6XQBjiGHBA5ndOrDEPuTNlDJFtGRzGGx/PqITQq8lWMVBw4sGlP/jORgSzL11lrkjTVmAw8uab8w
 yGFr5bQQ==;
Received: from 84.124.69.144.static.user.ono.com ([84.124.69.144]
 helo=[192.168.0.17]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vfFmu-004N0g-Ul; Mon, 12 Jan 2026 12:08:44 +0100
Message-ID: <68438d1d3cb16b38ce050dfc1c30f8331e3923ae.camel@igalia.com>
Subject: Re: [PATCH 2/2] drm/v3d: Convert v3d logging to device-based DRM
 helpers
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,  Simona Vetter
 <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
Date: Mon, 12 Jan 2026 12:08:34 +0100
In-Reply-To: <84c6fd9e-9b7e-4e6c-8f2d-4fc17afb3e43@igalia.com>
References: <20260109-v3d-drm-debug-v1-0-02041c873e4d@igalia.com>
 <20260109-v3d-drm-debug-v1-2-02041c873e4d@igalia.com>
 <67d99227733bbb662550a20a9a6f27bf5a62d956.camel@igalia.com>
 <84c6fd9e-9b7e-4e6c-8f2d-4fc17afb3e43@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

El lun, 12-01-2026 a las 07:53 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> Hi Iago,
>=20
> On 12/01/26 04:57, Iago Toral wrote:
> > El vie, 09-01-2026 a las 15:35 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> > (...)
> > > @@ -126,9 +126,9 @@ v3d_reset(struct v3d_dev *v3d)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	struct drm_device *dev =3D &v3d->drm;
> > > =C2=A0=20
> > > -	DRM_DEV_ERROR(dev->dev, "Resetting GPU for hang.\n");
> > > -	DRM_DEV_ERROR(dev->dev, "V3D_ERR_STAT: 0x%08x\n",
> > > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V3D_CORE_READ(0, V3D_ERR_STAT));
> > > +	drm_warn(dev, "Resetting GPU for hang.\n");
> > > +	drm_warn(dev, "V3D_ERR_STAT: 0x%08x\n", V3D_CORE_READ(0,
> > > V3D_ERR_STAT));
> > > +
> >=20
> > These look like they should be drm_err, no?
>=20
> Actually, I decided to change to a warning as a GPU reset is not
> always
> an error. For example, we have the DRM_GPU_SCHED_STAT_NO_HANG
> scenario,
> in which the GPU isn't actually hung.

But we only use that if we are not actually resetting the GPU, no? the
messages above are for when we actually reset.

>  Also, sometimes we have GPU resets
> that recover the GPU and the user doesn't see any disruption.
>=20

In the event of a reset there is always going to be at least a
performance hiccup which would be noticeable by users, but more
importantly, unless we are deciding to reset the GPU for some internal
reason unrelated to the user (I don't think we ever do this?) it signs
that something has gone really wrong, so making it an explicit error
message makes more sense to me.

> I believe a warning is a good compromise between an error and a debug
> message, but I'm fine with changing it back to an error if you
> believe
> it's more suitable.
>=20
> >=20
> > (...)
> >=20
> >=20
> > > =C2=A0=C2=A0static int
> > > -v3d_get_multisync_post_deps(struct drm_file *file_priv,
> > > +v3d_get_multisync_post_deps(struct v3d_dev *v3d,
> >=20
> > Same comment as in the previous patch. Again, not necessarily
> > against
> > it.
>=20
> I'll address it in v2. Thanks!
>=20
> >=20
> > > +			=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv,
> > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0 struct v3d_submit_ext *se,
> > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0 u32 count, u64 handles)
> > > =C2=A0=C2=A0{
> > > @@ -346,7 +347,7 @@ v3d_get_multisync_post_deps(struct drm_file
> > > *file_priv,
> > > =C2=A0=20
> > > =C2=A0=C2=A0		if (copy_from_user(&out, post_deps++,
> > > sizeof(out)))
> > > {
> > > =C2=A0=C2=A0			ret =3D -EFAULT;
> > > -			DRM_DEBUG("Failed to copy post dep
> > > handles\n");
> > > +			drm_dbg(&v3d->drm, "Failed to copy post
> > > dep
> > > handles\n");
> >=20
> > I think we have a lot of these kind of things as dbg that sould
> > probably be err, no? Not sure if that is very relevant though, but
> > we
> > can fix that separately if we want to.
>=20
> I have the impression that those messages are more useful for us,
> developers, than the end user. For such reason, I believe that a
> debug
> message is more suitable, as the userspace will (hopefully) handle
> the
> errno gracefully and in case of a bug, we can use ``drm.debug`` to
> investigate it without swamping the user's kernel log.

I think many of these would only happen in OOM scenarios, at which
point swamping the user's kernel log is probably the least of their
concerns... but in any case, I think these would be rare enough that is
not a big deal if we dump them as debug or error messages, so I am okay
with keeping this as-is.

Iago

>=20
> Best regards,
> - Ma=C3=ADra
>=20
> >=20
> > Iago
> >=20
> > > =C2=A0=C2=A0			goto fail;
> > > =C2=A0=C2=A0		}
> > > =C2=A0=20
>=20
>=20

