Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE4385D87E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 13:58:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433DD10E684;
	Wed, 21 Feb 2024 12:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UdKPRwEC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAAE10E72D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 12:58:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 661C6614F1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 12:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1BEC43143
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 12:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708520282;
 bh=1TWLwgToepSu30zbDCWs2ZgY/rtur75CkADwYOfIBsY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UdKPRwECJKElQYcSAZtOfz/iB3EYfilk/MgbRPXwkCLQyo8vhlIgiomGfcNdnbf5K
 ET85t0/dMUrfK3uXnbeDPff0F5vv0/KUVN62femlT9PI3jATEGwL5U4utznVyI0t1f
 iK4c6H5VMPsEGSbZQnILYASvXfEpFuiIlbX9wyD2o6SvRCHDNQJnY+vqhiDRbHsD79
 vvR9AhGFEZ+xnGeMhfOC702q6IHHgd/ux93X051Svh+MCY8TUDDvcKFDMO3r6sftoS
 OsbtcoBo4biif5kuVrunXFB2u6n1PumBF02Mx6hPgqo/ZxgDzbrcatcqSVDnIwyToi
 N0uCqZb982vfQ==
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-60818d338bfso36618177b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 04:58:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVWxb9EMASaKVbQxTWG56rHA7NkdbxgPvbTW7Cz3UlivN6QUZEVMpOWhEoBGOv3jUNNFIz2P3tUnmIIRZ9wsUaQk820Jpx0V4J4fF+kYAo7
X-Gm-Message-State: AOJu0Yyn+1XKI5xjqNJgdOFHaf0N8Y2VNx3J6bYUBHcnxP9tKqYyoogw
 NdPCgmvzABaYCAKDO8GGl4mpXU8TPWaGJAUHXJohqXoACdC63I+Uh5qpnNvWBz2MqkVGxdUeD+o
 Bjf8I3DXTBVYdP6tjsFcG8pa9zVJSwF6GVjX6Ag==
X-Google-Smtp-Source: AGHT+IFgbAoLfqrHy9g3EYgZEroOpOMGTsflQT9hp0EKR3hL74SADZIJ51gIATJfd6T/pAEhbkaNx2QUtFcDDZKXM50=
X-Received: by 2002:a05:690c:f06:b0:608:290d:9f1b with SMTP id
 dc6-20020a05690c0f0600b00608290d9f1bmr10883310ywb.49.1708520282100; Wed, 21
 Feb 2024 04:58:02 -0800 (PST)
MIME-Version: 1.0
References: <20230822115200.712231-1-alexander.stein@ew.tq-group.com>
 <3209672.5fSG56mABF@steina-w>
In-Reply-To: <3209672.5fSG56mABF@steina-w>
From: Robert Foss <rfoss@kernel.org>
Date: Wed, 21 Feb 2024 13:57:50 +0100
X-Gmail-Original-Message-ID: <CAN6tsi4y_WGgfRYLAQez_vX+gEQS0i6uH5PxX-E=+8L8gRpmyA@mail.gmail.com>
Message-ID: <CAN6tsi4y_WGgfRYLAQez_vX+gEQS0i6uH5PxX-E=+8L8gRpmyA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] drm/bridge: Silence error messages upon probe
 deferral
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Feb 20, 2024 at 3:43=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi everyone,
>
> Am Dienstag, 22. August 2023, 13:52:00 CET schrieb Alexander Stein:
> > When -EPROBE_DEFER is returned do not raise an error, but silently retu=
rn
> > this error instead. Fixes error like this:
> > [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@3080=
0000/mipi-dsi@30a00000 to encoder None-34: -517
> > [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@3080=
0000/mipi-dsi@30a00000 to encoder None-34: -517
> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > Changes in v2:
> > * Adjust the indentation
> >
> > Considering Laurent's input IMHO -517 should not occur when using compo=
nent
> > framework, e.g. drivers/gpu/drm/mcde/mcde_drv.c. This should warrant to=
 only
> > print an error if it is not deferred probe.
> > dev_err_probe() sounds reasonable, but this is something which should b=
e done
> > in drivers. It is also arguable if this message is "hidden" within a de=
bug
> > statement.
>
> Any additional feedback on this? I'd like to get rid of an error message =
which just prints
> a regular probe deferral.
>
> Best regards,
> Alexander
>
> >  drivers/gpu/drm/drm_bridge.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.=
c
> > index 39e68e45bb124..132180a03c0eb 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -352,13 +352,15 @@ int drm_bridge_attach(struct drm_encoder *encoder=
, struct drm_bridge *bridge,
> >       bridge->encoder =3D NULL;
> >       list_del(&bridge->chain_node);
> >
> > +     if (ret !=3D -EPROBE_DEFER) {
> >  #ifdef CONFIG_OF
> > -     DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
> > -               bridge->of_node, encoder->name, ret);
> > +             DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d=
\n",
> > +                     bridge->of_node, encoder->name, ret);
> >  #else
> > -     DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
> > -               encoder->name, ret);
> > +             DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
> > +                     encoder->name, ret);

checkpatch --strict warns for both of the above chunks.

CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis

With this fixed please add my r-b.
