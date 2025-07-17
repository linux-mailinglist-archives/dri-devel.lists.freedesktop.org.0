Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DF2B08755
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 09:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609A310E78A;
	Thu, 17 Jul 2025 07:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d+2qY54v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148A110E78C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 07:49:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EC7BD5C67BF;
 Thu, 17 Jul 2025 07:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 039F1C4CEE3;
 Thu, 17 Jul 2025 07:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752738588;
 bh=lCe8k0xLAnoePBb9VOg83ZvZf0tvpcfN4JNOrba3MHE=;
 h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
 b=d+2qY54vB9fy6aXCceheWQgbYj4RDBbgnnTkd9LQgLT5gM3rXYd8UJY5wruWLbvxs
 wDWb0+dGU8ZYilizf8HyfMMEyihU5PzM2/0evDvD6RlSPD9S2HaVfqFxFPST74l2lX
 N7PoRwu0VDlH8fzpvGHEkno8ER8h8N2HxC0aGD/G3zaK6ycEUcqEc7WoNRjZeXi+Wd
 Nyg+2LjOYTDI0RQWcVreeAJDp3wvjchMYVy+0Ip95WrPvsZpv6HAouzCploJtmsdZr
 uH30l+1yBhfT3Sk75XFswazp5gfWJLOAhcikgPxIAEuZBJh4/xVauerZB9SngmQcuS
 FBCBbMiLyvFGA==
Content-Type: multipart/signed;
 boundary=2528c810b34643996ff67ed0beac53f10af6388f53f0aef94521334da5c0;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 17 Jul 2025 09:49:44 +0200
Message-Id: <DBE5Z1SRJ086.NA0KUAWX1MS3@kernel.org>
Cc: "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] drm/tidss: encoder: convert to devm_drm_bridge_alloc()
X-Mailer: aerc 0.16.0
References: <20250716134107.4084945-1-mwalle@kernel.org>
 <20250717094153.35f854b7@booty>
In-Reply-To: <20250717094153.35f854b7@booty>
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

--2528c810b34643996ff67ed0beac53f10af6388f53f0aef94521334da5c0
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

thanks for taking a look!

> However allocating an encoder using a bridge alloc function (while we
> used to call an encoder allocation function) looks counter-intuitive.
>
> We had discussed on IRC a different idea, adding a wrapper structure
> around the bridge. Quoting your proposal:
>
>   struct tidss_encoder_bridge {
>     struct drm_bridge bridge;
>     struct tidss_encoder *encoder
>   }
>
> and then in the bridge funcs go from drm_bridge to tidss_encoder_brigde
> and use the pointer to get the original private struct.

I was doing that until I've realized that meson/meson_encoder_* is
doing it the way this patch does it.

> That would be cleaner and more intuitive, but use a bit more memory and
> have an additional pointer deref, thus I think we can live with the
> patch you just sent, at least for now.

I'm fine with changing it to the wrapper struct. It's your/the
maintainers call :)

-michael

> In the long term it may be that more and more components of the DRM
> subsystem become dynamically allocated like bridges and panels [0] have
> recently become. So at some point it may make sense to add the bridge
> wrapper struct and then go back to drmm_simple_encoder_alloc() for
> allocation.
>
> [0] https://lore.kernel.org/all/20250331-b4-panel-refcounting-v4-1-dad50c=
60c6c9@redhat.com/
>
> Luca

--2528c810b34643996ff67ed0beac53f10af6388f53f0aef94521334da5c0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaHirGBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hiWAGAjuCe5nmNGmSFueL2hDyFq0YxawTOQe1d
ghvQSekNAqMr2ftu1BvmvDIUvgM3ijp2AX0Uj7SV8d25FWZSiysPfK1GsR59Oatd
fZ2/ldGnjlQzjbFURRkDtjk4mRTJteTVo/Y=
=unKS
-----END PGP SIGNATURE-----

--2528c810b34643996ff67ed0beac53f10af6388f53f0aef94521334da5c0--
