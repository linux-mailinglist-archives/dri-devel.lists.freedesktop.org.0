Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A41D360F5A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 17:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D806EA76;
	Thu, 15 Apr 2021 15:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE266EA76
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 15:48:34 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id w3so37620146ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 08:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ayGURnHq7wmSKaDUrrltJ9EF5TW5D/i9Qzk+7xK9jcE=;
 b=bTVqVIniyk/vSt6glC8hYD/mGom31RseQA5JKeyjSmx5myZ2gtxEJ+m0q2Pe6vgtrF
 Plrm81Posl68o62eVaPU8gBcTvIRZ1K8pbP7HEmLT98g4mgVbYVVcfgIMtCSqRsn7r8o
 TcJPFU9loC/HUHjAoncJKvmR5TlFCsLfJUlNCld51xw42X3J3NN8A0yWWWf5ivLMPy0r
 U5/u8s53U/Qjw/bjIE4/lCOwgnkKoEn2IH8pJsQDen7bQsH2Z+SoMMEX2Y3gO+d9R0IM
 CkHF7eVdGW10hUfYW+aNtHRWvySGKfdsJTQhp+6yOLpSMOpkKTPPp6R5CaGpALKxw65n
 tdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ayGURnHq7wmSKaDUrrltJ9EF5TW5D/i9Qzk+7xK9jcE=;
 b=hIO28Tp3iaZYsyQrfL4GwTnQ7VbiGv2o5rqX0K7s5UazEj3drPm7RjUKONW5cnWxtQ
 KxUaxPE2GRyDjLg9Mi0L+OXzVk+/pqrjjV2Q8K94Cy1W5Hjm9czwGPOCb57FfBB7v3XD
 c2vIRv1kNRHF5iBsBXk3XRkKHJZSKrJtU7qDkl6yql5wmchspRy2MVz4ymUjkkgFeaG3
 WvSPxU7JkGJNW/9BpIDcBbSsvNSlrk6z+JZ2ba0Cd+RejF+lh/3lMWrGtYT3hmAGMvHd
 FVze4SRs0jqsWOdOTM8tmUXSdk3h2W/qWUiIUm34QBtVQk/3xS4a6rM+SGrZmYlJ1Zj3
 RAgg==
X-Gm-Message-State: AOAM530QFsAWNZanYSgLSgLvl20rK02X3DAe9OTnD59XGMqrx6sO6yi3
 OL4GgYtxcvdzQAdOR1wJFdA=
X-Google-Smtp-Source: ABdhPJx4xzQ1G5vhPZnh9xgVnUGgcnXe8Bvj4eboHAX0kHDGCJy+E++Wx5gf0Uj4FLxS2/rB+DCmpw==
X-Received: by 2002:a17:906:c04a:: with SMTP id
 bm10mr4061202ejb.521.1618501713494; 
 Thu, 15 Apr 2021 08:48:33 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id gn19sm2136640ejc.68.2021.04.15.08.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 08:48:32 -0700 (PDT)
Date: Thu, 15 Apr 2021 17:49:14 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] drm/tegra: Fix shift overflow in
 tegra_shared_plane_atomic_update
Message-ID: <YHhgekKvL5te6K6n@orome.fritz.box>
References: <20210415152913.1363964-1-nathan@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210415152913.1363964-1-nathan@kernel.org>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 clang-built-linux@googlegroups.com, linux-tegra@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1819742502=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1819742502==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ue6mK/lIz3sBypv6"
Content-Disposition: inline


--Ue6mK/lIz3sBypv6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 08:29:14AM -0700, Nathan Chancellor wrote:
> Clang warns:
>=20
> drivers/gpu/drm/tegra/hub.c:513:11: warning: shift count >=3D width of
> type [-Wshift-count-overflow]
>                 base |=3D BIT(39);
>                         ^~~~~~~
>=20
> BIT is unsigned long, which is 32-bit on ARCH=3Darm, hence the overflow
> warning. Switch to BIT_ULL, which is 64-bit and will not overflow.
>=20
> Fixes: 7b6f846785f4 ("drm/tegra: Support sector layout on Tegra194")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1351
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/tegra/hub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This code never runs on 32-bit platforms, so another option would be to
not try and build this on 32-bit configurations either. But none of the
rest of the code is built conditionally, so fixing this is preferable.

Applied, thanks.

Thierry

--Ue6mK/lIz3sBypv6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmB4YHgACgkQ3SOs138+
s6H1eBAApx8g0dh+NPpyZQCcGFt3Hv+BaE/kZh7PJeSDp6ce2EYECbJZ0K92GclY
DrQwJx6ukiYTTNkJiq3cul1lpEgfnbTvG4VRH8mXDxAIOUmje2p0OTXr1yg30IUZ
QqfCS3RLXYXQyLGVlej1/1jhrFM65FQMRxVyHty0bF2j7LQ/C4OIiCjFCMvk+/ML
8HxLpmvH2R159bVxElAW/8B7eakxkwMD84h9/EjUX6EPKxZqEULQb2eMvNHvRCqm
dNjJPUGF5N78pbNSV4n4me3oN1TpB3W4Q0RKZXRksJKj0e/e5iw7LuaDh0DnHDCG
ulD0F7XY7esK4rU/4vBuemcO7u96+2wTTf6UM90UD8w2UTmABLmSBKZXvYUffjYM
fsdtpE2MfG82B2B3GeFgDefDS53bDOR3HMoh8CHP/0jgdxaDM67sk+hnjMgMSIjW
6qky2nOl6DuODDbH6zB2sjeddrg6z7TCMhkE3LueD/vJsO1smMzIuaRQ81NwUOAc
0onVjKmrWsv3NCDPDs3Xd1OtGxLHDqzy+PIco7rM/JuOD0sBSzMYpBXP0zzVf8I9
s+vm53QAuUAV9K9HICZomkkxrUA4ifZ8mpXsAOkH1C3n0g+R3KPMUgDO0mRZmTL7
/udq89CLU/trkJU+ZUkrthPkIYarB/XAx37LCILdunTeEZFivZQ=
=/+7x
-----END PGP SIGNATURE-----

--Ue6mK/lIz3sBypv6--

--===============1819742502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1819742502==--
