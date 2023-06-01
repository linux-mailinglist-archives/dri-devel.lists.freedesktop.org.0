Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6591071974D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 11:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E763910E52E;
	Thu,  1 Jun 2023 09:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A08810E1AF;
 Thu,  1 Jun 2023 09:42:45 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-510d6b939bfso1042830a12.0; 
 Thu, 01 Jun 2023 02:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685612563; x=1688204563;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7q5khLoEX4J3lidnUZjzKtgn8/eZ/Y3adwlIXy+1pGo=;
 b=DOk+vfUpNWI6QjumU5Q8+7tLd2D676JlGoIQM4t1DetpGC9GA89dMTgrSitzFdCjeN
 Z77tsGABwvU36zQJ2XcPN5KRSYoPcsSCNtdMjbV3W84CJI8D40lGXeEH+pGa3ob3liUO
 I5DqokWzpfOu/jU0+/NveUCl6Gv4CFsXhYJZyvVW7hGnYAJRsRlbBj/rZkXkfRW+62tC
 v/hIZyCWXaXmcOZDAYUhB9UtQ8nr/4l3/EBrhO1EKwjqVc7SjAYpDtb/bCUF/RiOGS/e
 jGgBjF+wuFDJ79cqaBA4FNM/aiRA+bs51RAV/5u+pTNzxt7ZPSEs/fsg6Tak4a/ReNNO
 cxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685612563; x=1688204563;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7q5khLoEX4J3lidnUZjzKtgn8/eZ/Y3adwlIXy+1pGo=;
 b=Qy1ikvl050jEp6zSM7ew/s9hTTxT6zss05YUVdPdx/yXEd3+zcGvospeXMoCecLZiF
 OGZQfTwZwtCU6y9d38Z8lEGfTGkZwQll27mOu6FpQNWANDK82GATG1T+soxVxsLjVn1x
 g/Wd434G/GU4jC6P/IsJdsHqf5Eu3/9r5nlb6lLR7XfCZ+zGzyEHIotFqmNN7z+sK/T6
 ny76Rvjp7p4NYcz97gn1x9j8TeaLIXl2MUnjj7iDCczt6wm4iznKmR+DQZSkHARqC7sK
 Qtet+orDd7+lVbCbY+sQ4C+ivOxdNdRGkwqn2fxesORS4VIQzwy41AXH5BzvJKLvZkDH
 0lpw==
X-Gm-Message-State: AC+VfDxnQWUjAqHoD9Hqh0/aWe5mf64p0iGGS3qfkCeDNuQX9iRH1GEG
 pFMtaiycuQ6903UWFrHFhV4=
X-Google-Smtp-Source: ACHHUZ4Ut/2p85sdNMlqXBYqd/kF5rcU9VA6xQW4nb4z+SUKQQBkigJa799rdC1rKMIMKpGvTRQY1g==
X-Received: by 2002:a05:6402:349:b0:50b:c89f:f381 with SMTP id
 r9-20020a056402034900b0050bc89ff381mr5344371edw.29.1685612563085; 
 Thu, 01 Jun 2023 02:42:43 -0700 (PDT)
Received: from orome (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05640206cf00b004fbdfbb5acesm6916135edy.89.2023.06.01.02.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 02:42:42 -0700 (PDT)
Date: Thu, 1 Jun 2023 11:42:40 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v5 09/13] drm/tegra: Use regular fbdev I/O helpers
Message-ID: <ZHhoEHn_i79j8IAf@orome>
References: <20230530151228.22979-1-tzimmermann@suse.de>
 <20230530151228.22979-10-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J8y/7sWNqq9Yj/uK"
Content-Disposition: inline
In-Reply-To: <20230530151228.22979-10-tzimmermann@suse.de>
User-Agent: Mutt/2.2.10 (2023-03-25)
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 suijingfeng@loongson.cn, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, sam@ravnborg.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--J8y/7sWNqq9Yj/uK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 05:12:24PM +0200, Thomas Zimmermann wrote:
> Use the regular fbdev helpers for framebuffer I/O instead of DRM's
> helpers. Tegra does not use damage handling, so DRM's fbdev helpers
> are mere wrappers around the fbdev code.
>=20
> By using fbdev helpers directly within each DRM fbdev emulation,
> we can eventually remove DRM's wrapper functions entirely.
>=20
> v4:
> 	* use initializer macros for struct fb_ops
> v2:
> 	* use FB_SYS_HELPERS option
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/Kconfig | 1 +
>  drivers/gpu/drm/tegra/fbdev.c | 8 +++-----
>  2 files changed, 4 insertions(+), 5 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--J8y/7sWNqq9Yj/uK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmR4aBAACgkQ3SOs138+
s6EMnhAApvbF83jJgB6q5JCxzWJ69rSVfi9hjhGoa9Wz9miYwATuP3yzLuDbf21b
6diFMn3cJ9yU+3PrBZasS4/WLyXsu0DIW8ZWsexZ2nCnjEmMjBshzfr7CaOHCHAQ
PeobxSDdVCgv898nMOwOOlDHSVpuGbexSge1pq9Tsfid4IDWZHTap1y3a56iyhxy
tsP27T0aQ+2jKYTegSaokFocUaeFper7JWV3mSr1FZH4N8CqskB3p+YMSzdWp9K4
KiSrfAo8w09MPTwy3A/LxzIGXaGofiOUITd/zk6CWEl33Be2v1iva7Anq3cljKiT
KU5vNPVgmK3Fhz0o08cFuUS6t42GtMh/iij/1ZE5HePx5IPkZjJGSpg/9DXNHOA1
68V0xsUPRSUpEIm6Q91oPZVFTF4PGK0rYkRWCIH+C6JW67wvfKbRoUgwbEN+ZrC7
yQMNtpi9HKHq3v/+PahWPiWTEp3K7GAy2HAoEdtP5whzNqohKwn+qIHXC7Cu9tPC
aexe4C80Aq8PBX1v2E/cVRq69BnzDwDZEiBXjRugfzDZn0KhMuPNxFJxwyi27ibK
dWrkkLHypmvS04FY0HGzt5OxuuIPTiiPfg57DAfl9LmTisbXRI9RyPHF508ll9T6
HgJJLHycd7x1y639mAntcOoe9GfgQwA9rUiv4mvIe3EkrJQqBgg=
=793F
-----END PGP SIGNATURE-----

--J8y/7sWNqq9Yj/uK--
