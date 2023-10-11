Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7742C7C5E9C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 22:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B3910E1E9;
	Wed, 11 Oct 2023 20:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7875110E1E9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 20:44:43 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9b6559cbd74so42519466b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 13:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697057082; x=1697661882; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ekSd27xlwThNX/Q4Rmy9BVkLLGiyelkBChOxdtoZaAU=;
 b=AU4c0evwP2UOO4+nOGVMArlIRdwF9HKwTuUNMymkPefUcpSCqWvUs32scjVek5YR28
 EW3ojyBwLDzjb/8S/Z/KHUqCbWfRAbfY5Xc5eCblINSrWM+gLKHFuXc31dqgz4WgKAXh
 Bdpko4kDqfQfPIzReVyeA6nv+w3G03nqM/bM0lEgbYLLBPAlq9+63+aFG44PeHoSNu3f
 lYDvVSwb5WnujDcPxJknHuwXjXqCDcSYG2ynuTtZ18Jq0P+DpLMePkOfo1o1PS95Dmud
 TeVGDwghOJcuyw5ohZUdmekwA9WFAjwJC1mhkoZrzzwkNGt/vBNue3A7F2ygt6m80e5M
 CbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697057082; x=1697661882;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ekSd27xlwThNX/Q4Rmy9BVkLLGiyelkBChOxdtoZaAU=;
 b=N8zY9U51JWKCQIorRPPj1lq6PZ2p0w7hsMvSMGubgGRaxwTGecnFmqVz2vCialWjnc
 i3uLukfm/hZD/ALurRJneE05ij8qGWZJchhmP6hhx2F1Yhs4pgEc8qGeRwSg1qGV3qtD
 FVSzmcMKqrGywN41GSVYBR+inICkaD+e3FsFbJs+egSCpge6RQO8kW4CwBvpn8fiH7vR
 whlipS+ikMwEtRnKsN7KPEDTzGz+QRx35qMyNfjD94UxsAvuIWZo2pmF/TEpmruudfXc
 OqtLHbiz5McpjrcfwhDsWjKgjM6PKWT+Sayi8VHjODfeaJuNPOQ/rTAgY1iF4VXksozX
 32iA==
X-Gm-Message-State: AOJu0YyndHFyOnIdgzlMJhKP3aBrX5lUdejRa8TmGM0zxNwrSHUkgTnp
 yMXD/CEsigrWxpVDKVtoR8Q=
X-Google-Smtp-Source: AGHT+IGs+QPMwkJTsynUOVn4VkRAiWxZMwrR441kv446Bslzb6MbVsgant46R2AnlsPNf3FCwukPnQ==
X-Received: by 2002:a17:906:5a6b:b0:9a9:e3a9:af02 with SMTP id
 my43-20020a1709065a6b00b009a9e3a9af02mr20192152ejc.8.1697057081631; 
 Wed, 11 Oct 2023 13:44:41 -0700 (PDT)
Received: from orome.fritz.box
 (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ov19-20020a170906fc1300b009a193a5acffsm10125559ejb.121.2023.10.11.13.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 13:44:41 -0700 (PDT)
Date: Wed, 11 Oct 2023 22:44:39 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH 1/2] gpu: host1x: Correct allocated size for contexts
Message-ID: <ZScJN6I2zdO5Jeum@orome.fritz.box>
References: <20230901115910.701518-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zsqpP2XHutRMmF6h"
Content-Disposition: inline
In-Reply-To: <20230901115910.701518-1-cyndis@kapsi.fi>
User-Agent: Mutt/2.2.12 (2023-09-09)
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
Cc: linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Johnny Liu <johnliu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zsqpP2XHutRMmF6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 01, 2023 at 02:59:09PM +0300, Mikko Perttunen wrote:
> From: Johnny Liu <johnliu@nvidia.com>
>=20
> Original implementation over allocates the memory size for the
> contexts list. The size of memory for the contexts list is based
> on the number of iommu groups specified in the device tree.
>=20
> Fixes: 8aa5bcb61612 ("gpu: host1x: Add context device management code")
> Signed-off-by: Johnny Liu <johnliu@nvidia.com>
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/context.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Both patches applied, thanks.

Thierry

--zsqpP2XHutRMmF6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmUnCTcACgkQ3SOs138+
s6GZEA/9EdvqUmfzSRbzjrdgiT88qxR7YL/IsDRoy2WAc4H+VIn5GdsUOrrhhvOy
417AETxf+XE82vrtEJtLDcrDCO96pyt0BvKySl1nuD1VS/67s4c6gAS5xXd4tn+/
Az7rKc0h/7Ut15oo991yUldkqNZG1CNJvLdBfeeALQQswxEPQmwtJpxK4I8ze2HD
UOU5i6QRJDPhq8F+yD6mzX86Sb+yAplPw9dLDDzE7k+KIX2ccgLjtwy0D03fpHq0
dnjfJiSiPdhZNaD6rWBtqtLOz4+rg9ADtwJxG0mWnTfZopfdUe3Od8LCibBmcaiM
d6sCnC9WG2PtKc1+dfscs/LRq7yvQh35K0Jh5Y8NY4/YoQh4rZB1MtvP7HknFes3
arm3dLaQjNYXOJxY2IQBAuniATwtxxp61aS+vO/hgiTShXwiPTz8ZRm5rAxwX8Xj
Zb2xPOwQiBD8HzAwuddwqFuQ//0byWE6HkJXm7L5cEK3d9yvSedIEau4uYilT8aw
/NaCme/LVVs1YTrMUtwkGgj9zxs5fikzfNE3ErTZZXFLJPUxJknrVPN9VZ8NcHsh
N/wDrikDp0bE9GujnEgaWMhfkaOGcEOsHewtFZkB+rN9TeZ2KY1G8eJMqV15MWrS
dksIMqcpjU0d9Oc8M9GzIANN1dgS8GTNieAOnWtwLHrj4fDGGcs=
=cyGi
-----END PGP SIGNATURE-----

--zsqpP2XHutRMmF6h--
