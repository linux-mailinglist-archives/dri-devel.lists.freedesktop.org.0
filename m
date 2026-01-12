Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A067DD11024
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 08:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282FF10E052;
	Mon, 12 Jan 2026 07:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="SKGSkFC8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9990510E04C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 07:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0VzaTIIfxOHpn487a6oX9fg6N5Zf2sSyZ7MAnyJaz5A=; b=SKGSkFC8BiwFJXdjSfqCbG0yCb
 lZj/tgpLUegmeeRdqSLywZ93+SHpF8P168wCK9gFqf52+6nQ1ciIF/KIDbWAIS7Fj7MN6caE6PsIe
 qubCdnKIXvjNdWNZXsHlh6twfIkmx0HvPFBIx57sz/fGbMs7bk092Pi2G0bVn3/+vw/0X09FaRCiW
 LBBXul43fO7naVjPVaySWQJLXsSP05LBLxkbMIVePFG+Q4GTop/bJ8HY1jRzHPSGHDkxG/NEdMKmF
 wDEOQzH66AP/1Kwr12NjCikMPE2KiZGEtTlGXY+Vu9Vg3jhAlmTI5UI71CiwNzqv7K+X/OEWTkLJ5
 KCuxYeRA==;
Received: from 84.124.69.144.static.user.ono.com ([84.124.69.144]
 helo=[192.168.0.17]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vfCnh-004IGB-FX; Mon, 12 Jan 2026 08:57:21 +0100
Message-ID: <67d99227733bbb662550a20a9a6f27bf5a62d956.camel@igalia.com>
Subject: Re: [PATCH 2/2] drm/v3d: Convert v3d logging to device-based DRM
 helpers
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,  Simona Vetter
 <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
Date: Mon, 12 Jan 2026 08:57:10 +0100
In-Reply-To: <20260109-v3d-drm-debug-v1-2-02041c873e4d@igalia.com>
References: <20260109-v3d-drm-debug-v1-0-02041c873e4d@igalia.com>
 <20260109-v3d-drm-debug-v1-2-02041c873e4d@igalia.com>
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

El vie, 09-01-2026 a las 15:35 -0300, Ma=C3=ADra Canal escribi=C3=B3:
(...)=C2=A0
> @@ -126,9 +126,9 @@ v3d_reset(struct v3d_dev *v3d)
> =C2=A0{
> =C2=A0	struct drm_device *dev =3D &v3d->drm;
> =C2=A0
> -	DRM_DEV_ERROR(dev->dev, "Resetting GPU for hang.\n");
> -	DRM_DEV_ERROR(dev->dev, "V3D_ERR_STAT: 0x%08x\n",
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V3D_CORE_READ(0, V3D_ERR_STAT));
> +	drm_warn(dev, "Resetting GPU for hang.\n");
> +	drm_warn(dev, "V3D_ERR_STAT: 0x%08x\n", V3D_CORE_READ(0,
> V3D_ERR_STAT));
> +

These look like they should be drm_err, no?

(...)


> =C2=A0static int
> -v3d_get_multisync_post_deps(struct drm_file *file_priv,
> +v3d_get_multisync_post_deps(struct v3d_dev *v3d,

Same comment as in the previous patch. Again, not necessarily against
it.

> +			=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct v3d_submit_ext *se,
> =C2=A0			=C2=A0=C2=A0=C2=A0 u32 count, u64 handles)
> =C2=A0{
> @@ -346,7 +347,7 @@ v3d_get_multisync_post_deps(struct drm_file
> *file_priv,
> =C2=A0
> =C2=A0		if (copy_from_user(&out, post_deps++, sizeof(out)))
> {
> =C2=A0			ret =3D -EFAULT;
> -			DRM_DEBUG("Failed to copy post dep
> handles\n");
> +			drm_dbg(&v3d->drm, "Failed to copy post dep
> handles\n");

I think we have a lot of these kind of things as dbg that sould
probably be err, no? Not sure if that is very relevant though, but we
can fix that separately if we want to.

Iago

> =C2=A0			goto fail;
> =C2=A0		}
> =C2=A0
