Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA82A20A08
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 12:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D515C10E258;
	Tue, 28 Jan 2025 11:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Yex3qh3e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C9A10E258
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 11:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738065499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=58JOKwE3B4ptPErvwF68tQ+YT/gMYrRZ8LTZTTrEboE=;
 b=Yex3qh3eczFUydWPt/F5B33RzlDP4TiKejkW9kg2H8y8OxylSDwAaIPZiimZqg4a69rmWJ
 yC06eR1pl3LI0H7xVZHAzpyYHnDTPMF93tlIUaCNmhrnq3CNntN0zDzEn49ejk22TRcQUj
 LMmwL7+fs9l3VjQ2ybNMVTC+hhqinyA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-A8jwwVPMNDq42-4wDmY6rw-1; Tue, 28 Jan 2025 06:58:17 -0500
X-MC-Unique: A8jwwVPMNDq42-4wDmY6rw-1
X-Mimecast-MFC-AGG-ID: A8jwwVPMNDq42-4wDmY6rw
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4679aeb21e6so92885651cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 03:58:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738065497; x=1738670297;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=58JOKwE3B4ptPErvwF68tQ+YT/gMYrRZ8LTZTTrEboE=;
 b=I2hPxSM6C5zp/2PlAiB80/6FTOaeLUrtGe/MFLr0hODrL1+n7XnauyX2WLmweAVg9m
 COJOII1b+M6m97SQ/9wIlUGe97x8nKpwgfj6uqwdVpNMa+5xozDLTGMe1mk3wQamUNOY
 2JGMpYdFTu5hviSoBdwUEVDsW+jlbmkMgEoUHu4fPzl5V47IjtaLV4ukVLDmPg2IsSLr
 3j1LrX5TwCawnW/xBKFg9gHFoB1uJII2IK7Kzjqfxov93RC25WR7RpyDEf98+jePAZfH
 /kwK/CapSwSCcKH+oHqqMCK9LfN5cc31bQqHiZ8umK/FLoOjmQSIHHGMVs8hY1t+Z3EW
 I5Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2CWtc2+wmtCsIFmiMpXDuvMS2dj/8k1fyY12G34/N9InA1H6HGUcBgHhwr1UbWrNJRNCkru31CM8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsMsCBvUweG+kKS8fidLkODAGIsO4WcmBWuOa6siasOXz4P7Bb
 y7Akh9W0Zxc9q/ppz7hZ1us/9HK0J+1EKmCWPNZTxNYqjj+E2GdQ5wehFcViYZsa7fI8Omq/bEH
 JBbwjd5AitKcRRXzpHRBAABf7hRQyFI8Vu5eul1deA2pUgvo7JPon5Vjh7gmZi2tCLg==
X-Gm-Gg: ASbGncueGdoQAqm0ffyVD3vtqwJTZn6Lp2JbnJOf0vzA+PCe00uHo//AMUl3OPb4LON
 Yz7HVt/SxJRYYn/8yuyD6aS4booRiviiRoswV1ynt5BmLuBLcC+rvQ/uZRQIqOetuSm+4Cqf2/3
 hIzlBdEWBx69PUWcCGTSQBa59EDrPOiszlSq1sOUjp5uqjZShI3JfUtXbCmuRT/UeY6+uA+FKF/
 /cgTQpKHq3urCLCK21o8+TkiLuc7rEqqLqfM9KxQE/DbARafo+FNP4X4T1T11mSRakpID3iuUpd
 eQ==
X-Received: by 2002:ac8:5746:0:b0:466:99a9:c354 with SMTP id
 d75a77b69052e-46e12a96f59mr584717071cf.22.1738065497399; 
 Tue, 28 Jan 2025 03:58:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKTSZUkwKgOmc86HrQqzorzRgdDmzYgCb/05m4RKf7CKbWvot+1cHZpQJRxGbwHDuwrI8kug==
X-Received: by 2002:ac8:5746:0:b0:466:99a9:c354 with SMTP id
 d75a77b69052e-46e12a96f59mr584716841cf.22.1738065497043; 
 Tue, 28 Jan 2025 03:58:17 -0800 (PST)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e2051362b1sm44408026d6.19.2025.01.28.03.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 03:58:16 -0800 (PST)
Date: Tue, 28 Jan 2025 12:58:13 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update drm/rcar-du maintainers
Message-ID: <wodib3ste3l7lsgjur4i4q6is6eoxxu4jazb7pern5yenwsyw4@np6ad5p5ofbp>
References: <20250128-rcar-du-maintainers-v1-1-c429ca421c52@ideasonboard.com>
 <yvdba4secotjc4xvyophckuroywx6nv35kusdj3off3dsrnxr4@7buakt7wvten>
 <e92601be-a9c9-4aa7-a250-4e3514202e7b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="nz4qsc4lc5t6os55"
Content-Disposition: inline
In-Reply-To: <e92601be-a9c9-4aa7-a250-4e3514202e7b@ideasonboard.com>
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


--nz4qsc4lc5t6os55
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MAINTAINERS: Update drm/rcar-du maintainers
MIME-Version: 1.0

On Tue, Jan 28, 2025 at 12:50:18PM +0200, Tomi Valkeinen wrote:
> Hi,
>=20
> On 28/01/2025 12:41, Maxime Ripard wrote:
> > On Tue, Jan 28, 2025 at 12:28:48PM +0200, Tomi Valkeinen wrote:
> > > Add myself as drm/rcar-du maintainer. Switch Kieran from a maintainer=
 to
> > > reviewer.
> > >=20
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > ---
> > > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > > ---
> > >   MAINTAINERS | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index ed86d884ee0d..5b1bf5fd56fd 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -7760,7 +7760,8 @@ F:	include/uapi/drm/tegra_drm.h
> > >   DRM DRIVERS FOR RENESAS R-CAR
> > >   M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > -M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > +M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > +R:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > >   L:	dri-devel@lists.freedesktop.org
> > >   L:	linux-renesas-soc@vger.kernel.org
> > >   S:	Supported
> >=20
> > If I understood right that email
> > https://lore.kernel.org/dri-devel/096e85a5-30d9-4b53-bdcd-a70cde6baa4f@=
ideasonboard.com/
> >=20
> > rcar-du is now de-facto under the drm-misc umbrella. It should be docum=
ented as well.
>=20
> Good point. I believe this should be enough?
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b1bf5fd56fd..16af21c3a48a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7604,7 +7604,6 @@ X:        drivers/gpu/drm/mediatek/
>  X:     drivers/gpu/drm/msm/
>  X:     drivers/gpu/drm/nouveau/
>  X:     drivers/gpu/drm/radeon/
> -X:     drivers/gpu/drm/renesas/rcar-du/
>  X:     drivers/gpu/drm/tegra/
>=20
>  DRM DRIVERS FOR ALLWINNER A10
> @@ -7765,7 +7764,7 @@ R:        Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com>
>  L:     dri-devel@lists.freedesktop.org
>  L:     linux-renesas-soc@vger.kernel.org
>  S:     Supported
> -T:     git git://linuxtv.org/pinchartl/media drm/du/next
> +T:     git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:
> Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
>  F: Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
>  F:     Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml

Yep, looks good

Maxime

--nz4qsc4lc5t6os55
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5jGVQAKCRAnX84Zoj2+
dhmNAYDI5MP+ScIvUhwMsGGqQWPQyGu/TzTWDO0PMsojy0wyohVcLHkHCJMy2ubD
7qFod+8Bf0q0Wzr/F5h8mMzRx+KPNI5I84PVhUnR5j/zNQGxPwevlLAWxrIh4u8E
jiv9JJ1+5g==
=CMv+
-----END PGP SIGNATURE-----

--nz4qsc4lc5t6os55--

