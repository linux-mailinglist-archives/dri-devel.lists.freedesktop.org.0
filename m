Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A459CEFA30
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 10:55:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDE66E98A;
	Tue,  5 Nov 2019 09:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F318E6E98A;
 Tue,  5 Nov 2019 09:55:13 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 6so16105995wmf.0;
 Tue, 05 Nov 2019 01:55:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QVOGXOR5z3z9S+IAuOwn5dLHaPdb1fFyiscI5E8C7HY=;
 b=ACKE0t79vM/hHHIo2WUfWa/X1i/7rqaHBwklyU901yB+8b9rPoKzutjB3URaTq1gAn
 Udhiys3Tf39s8A3VocrL44W37ZDVOEVq/L5k4c6aSBURhqre8jA9LaH9/AXL//ssJ2hD
 omE7lpHGLVVEDq185x9Q2epoyMPTfyVFAc8tqnQV0Dv87BzD+NOmqe366lP40hxCsn+4
 eLjCR04UzgW8tKYl4mXAqx+XjGM12WOHj51IgWusSbqkoM47wJTEcJ/YL0lrboT4+sET
 acRZk+AgLRehtwmWyWrjSZTrUgPvl2UONAyHy1AGN43YCs+9OqUA/03HcFQs7CWStm0V
 nxuA==
X-Gm-Message-State: APjAAAVJVYK2B2P3INnAMEq39RKtKDIjMaBZtQgI3lKTNh568XH0UiRC
 rsVlnZJbzyc3Djfo4rE3JX2YjsMd
X-Google-Smtp-Source: APXvYqwPtnn2BnkfYLYU5tUTjGydA8m72+6aAim+Sk4wbYHWfIkQ4Lh1urGRjppdhnZoMWqBooLWbQ==
X-Received: by 2002:a1c:67d7:: with SMTP id b206mr3268864wmc.68.1572947712564; 
 Tue, 05 Nov 2019 01:55:12 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id l5sm17852413wmj.44.2019.11.05.01.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 01:55:11 -0800 (PST)
Date: Tue, 5 Nov 2019 10:55:10 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 5/5] drm/dsi: add helpers for DSI compression mode and
 PPS packets
Message-ID: <20191105095510.GC1607358@ulmo>
References: <20191028150047.22048-1-jani.nikula@intel.com>
 <20191028150047.22048-5-jani.nikula@intel.com>
MIME-Version: 1.0
In-Reply-To: <20191028150047.22048-5-jani.nikula@intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QVOGXOR5z3z9S+IAuOwn5dLHaPdb1fFyiscI5E8C7HY=;
 b=FpuchXC75efoRHFc2FvLXWQc9Yq/FiVRd9uLvppjJE+Ey8wfMwW0L7ncKifLrVlUEZ
 o28hrC8CsB6wR3J+YoniUWIYm4cgdq52aGGJiz9vwTUq7PcI0mE1Hr5pVSEhFYE+TfYv
 C/jprrPYlIXud12Ch4XQ5RA/WUYVK+u4G9eF50jU2BoPhQV918hPeP6hdMFAJpK2Y0ry
 6x770029MqNAw4W79XrklJJhC8s0AiWvK0Vc8qN3dG+A/2UfeJwdMXDatskILb1utMuY
 al/FzgjXN+JpwvAadrg9Bqd/AOUyTLl7REbis3LcicsfoLReNmTFG6WPKKyHDmRdJJ9U
 wq6A==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1686533265=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1686533265==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XMCwj5IQnwKtuyBG"
Content-Disposition: inline


--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2019 at 05:00:47PM +0200, Jani Nikula wrote:
> Add helper functions for sending the DSI compression mode and picture
> parameter set data type packets. For the time being, limit the support
> to using VESA DSC 1.1 and the default PPS. This may need updating if the
> need arises for proprietary compression or non-default PPS, however keep
> it simple for starters.
>=20
> v2: Add missing EXPORT_SYMBOL
>=20
> Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 51 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_mipi_dsi.h     |  4 +++
>  2 files changed, 55 insertions(+)

Looks good:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--XMCwj5IQnwKtuyBG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3BRvsACgkQ3SOs138+
s6EKMA//QB10EwD6UvSWkeNmA61pfpHrKfgLxU7jChKqaD1ZlyRs8tDxMph9D0Jx
/3OwNAWG651eT1wI7omGrE4aeZl46YsGV1dDcn/7grnG4uDZsVeVHMUWbb7pPmhx
9jrHiyOkyGvMyj7LHeSHiKOlE1oYhX6Wcq/evwJR5maFJSJGu0r3wq2GvGpRfQHe
zrbfegYINh+5eVkb0pd84kj5VLpHbxP8nImTG8Ns5XNJ6pOHvXEPCeaLN7O9CWC3
L8mLvFgjtGgcS+9Z086f2zq9gLfZ0xGX6VWfpnz6a5GAyTb3akM+djAJ6HuqNtIw
r94JPbimhxCMd5YQeK2qpKI90n+LFN70AZFXUrIcIuJDZpwruhO15rGtZSvhj/kT
uWIPvj8mlSGNz4oq52qBH0LeKbtAG7uEkiEbSbEGuQepiV6qgbHLT2uo9eaM8ISq
Plrxt7m4Usks2IoNI+cTz7GcsqKManWKn+6eGXI6ecRzF4e68nMyvhTM9vxYjowh
Xx3H91HfjVFo85tK5rVXQdEg06O1XHRtVMtLQgG8Y2ZQwRyHDxVHuf2uVEFoRKQA
9GjbHdb/Zo2e1OOu6WbYxnN47R/cvwtWZ3bvgB3rd0EhIDYtI7ja+3bsSc48HoZF
5BfTmZN8QXRcA7EIHd+VDDjidonPX4khuxv/5vuxWfjEtbmL+Fk=
=kzu8
-----END PGP SIGNATURE-----

--XMCwj5IQnwKtuyBG--

--===============1686533265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1686533265==--
