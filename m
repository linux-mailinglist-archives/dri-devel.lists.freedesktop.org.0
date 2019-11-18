Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7A9100669
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 14:24:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564A26E49C;
	Mon, 18 Nov 2019 13:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8BF6E49C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 13:24:00 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t1so19454737wrv.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 05:24:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2+oThujBvfTQ1HHMZe0kADM+M8gUvebDa4eh+e7Lnqs=;
 b=AyxCz0NNz5vUMDQh/MvA+cfAEts9vbeObT7mK3lEQossUQLfj+GWhtoEa8nNUdkZJL
 ptnvmAbdwRZUuZSllbtGD/fZ8hP0p8Zq57h0HDelSPcaC1XHH84d6mAgZcMZbmjp39XQ
 P1qO/dT1ImWmnCG1R6ouLbiRMY8TTiOP8O44vuoWVb6DOALHepuiNeon3Zv2pKsMtEFS
 RMRj6kO8VE5ufq0eZ8XVG79mGoPttKOWSf3r5Xxns6OJzl3fpPf2zNApkRQAEbZ2He94
 4EmOcwrLw48PfpTuregcyMgw00hlg5dobC1WXcnzthZ65g7fC30lp8luNASvG+f5YxMY
 /GqQ==
X-Gm-Message-State: APjAAAXikc0w1+lNoWgXkbCd7SZhOljsrFn84PMwHYchQSbqmsFEicBo
 Ei9Ln5JXtrtZwqbpp7L/c+c=
X-Google-Smtp-Source: APXvYqxneYQYNTdLLRfiG4+4rOyHceDXAy++0/66oG+zWkA+g6tzBXSeQJkywQCBNP+wasSE2f1Mhg==
X-Received: by 2002:adf:ab41:: with SMTP id r1mr32232759wrc.281.1574083439269; 
 Mon, 18 Nov 2019 05:23:59 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id h140sm21933957wme.22.2019.11.18.05.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 05:23:58 -0800 (PST)
Date: Mon, 18 Nov 2019 14:23:57 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: zhengbin <zhengbin13@huawei.com>
Subject: Re: [PATCH 0/2] drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code
Message-ID: <20191118132357.GC2246533@ulmo>
References: <1574077572-59152-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1574077572-59152-1-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2+oThujBvfTQ1HHMZe0kADM+M8gUvebDa4eh+e7Lnqs=;
 b=sJaT2KEehNTiHjFieCJzDp/BvOFMujl/mfXgyF6MZPTgiB3OuZ3iqG723MLvdVZXBr
 VDtOPfzcXfqGOHYCdnWzC8lotS+Bhi4IHetCt5pYCtN3Rq+2h5w4RO9+ONKNDdYq4quX
 S4QvnIykhOZD8t/1gwqcRf14XWlG4y/Y8pecFjtmdIg53jINX4PBWvQ1R/mdf6qRWRvC
 /KlKoaCJh9p7Qs7lUAPGxsHBY8dWX1D/47xminyUjusn91SuyG9/XmJyFb24roe86AV/
 NBft9XrHE5RZm/XrmYIB0Qg3tHDabCAyyfqtu4Iz580CVLG9ecLJc6Wb065D/WvpEIK2
 iNUg==
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, treding@nvidia.com
Content-Type: multipart/mixed; boundary="===============0555400056=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0555400056==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zCKi3GIZzVBPywwA"
Content-Disposition: inline


--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 07:46:10PM +0800, zhengbin wrote:
> zhengbin (2):
>   drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code in
>     tegra_bo_dumb_create
>   drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code in tegra_gem_create
>=20
>  drivers/gpu/drm/tegra/drm.c | 5 +----
>  drivers/gpu/drm/tegra/gem.c | 5 +----
>  2 files changed, 2 insertions(+), 8 deletions(-)

As I explained in response to the same patches sent for other drivers
already, I don't think this has any merit.

Thierry

--zCKi3GIZzVBPywwA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3Sm20ACgkQ3SOs138+
s6Evdg//QOlrbxFxraVGzdTmFWlFsmJ6OwQSOGxufr2gbH2Cpk9BOiAhspTui/RH
GQYR2dUFFihpoXrC3PUVAASsg05R6cinxYDRps838ekBdHd3hSP/jtNpnYJ7+A0n
7nf4+j43HPLQ1PfHGx4UQzyzuorNLy6q3JrUNDaumU6EO9yQYW1i6z6pbaEY74/I
tcFm5eU2iSY9yeIMJcYdOHrzpiKF7w4Nq5sy5iY1t949VMj3dJv101gHSoK2cZ5D
3iw2aYg5rhsOmflfWlktmwyT1eCYINB6NveSvWKRKo/0cHq2xg6jlJJMBnG4dioa
nmksq2eQwXLrktKjvlQ2Bz8E5Sj4SDyHIFWERYqdWoPOPhuNiawrUgY67C6PDl9L
Qm91wBibK+ih9hHvZ9NHmBJofU01p77PFN4MDF/j9im7hvfSYfqwN7f+C3hhnq2z
NU0DYyRG1TLpHNLItF7LVEJ+1NYFsoafDKuogNaQV66CSMEZ33vZkLHTaoKcKZrE
0XRGISUHCf5Uw6NKTbIml+l8/YlBoHU+MaOTuBOs1NPFKko3bN3ZIHyR6TNh2gg9
Veb6pq1LRp/ZqcgqmcnC3AOmTIG5F37kNtE0f8YXdt5jrvdq8UrHlVsS4DD6rEtq
MkT7umxMr/xTulGBLXPHiHCPQ836zY9oCUkbLNlDZdx1W93YTKk=
=4hdT
-----END PGP SIGNATURE-----

--zCKi3GIZzVBPywwA--

--===============0555400056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0555400056==--
