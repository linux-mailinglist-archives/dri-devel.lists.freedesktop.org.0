Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56720AF8D61
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7A010E9BE;
	Fri,  4 Jul 2025 09:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MXqzRntM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9EC10E9BD
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 09:04:15 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso589035f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 02:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751619853; x=1752224653; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xmoB8n0Z4syEgccodxuTLOggzIieavLdMU4wg56tJKc=;
 b=MXqzRntMvNQQI/IaAFn0y4v4HPXRMXhcPwZ3aN4zPlP4R77srfQxEtmJeDWnZNxLi8
 jsLDvD5h0nMxewveTg9wCbp+oOHZFBLpjdwQ/T3TUWBvkrYcEThs3MfWYpyaj0MAPsJU
 WLvEEy9NrxZzPhh3oGVZqmRBHEPlgPx/wCje5tFozf9Jx+ij8Xc4kbdObz9G+T4atnMb
 3SPkNsMMZ3BueBOtn3pv6OAXX3HNNQszc7Q4wPoX51THwuiwW2Mm4d8IGE9sYZw5R48/
 haENpznoe9U3VzQKrQ0JhSS44Uhx9zc3drzlRi5DL3NC5RMvaOkK3CNOJKgEqA/aH/lS
 Jsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751619853; x=1752224653;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xmoB8n0Z4syEgccodxuTLOggzIieavLdMU4wg56tJKc=;
 b=JABk6e173WwKJP39r89EI3mcFrgiZWPBXcQdeqP6NLT0/j4Vk4xrqowQ+yV956o9i2
 Kw8nNriBG5XTCfOrPkdf4JEGhAN1UtLvoZx9M2FMYkzU2jEr4W4U3Db4Xbtj6fsToIBm
 YcjSiCdG4LY09Ra939FGdqLtGcpDOr5PzSJhLzIPJeI9O/Q8qXUiEVCO5Yj3O8gPWCcM
 GHukxDR8XSzEWuI91QANNJ5n5cW5/nqyNIVA3esPLzRAUpXFpT/oe31KBb1t0FRdTbEK
 OxV9q9T4dJpo75ofRmk4l0MhcUi1hpHCtESF/OD1lDScn+QBtyz7XuHM8c9/9y3V4nth
 +MZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwzDWEBEcfV7hZnZQpidXuqTaalq7pUA9AsF+CxJOYL9/06vJFfH3lR9/CTPGDtc/uF6xSw5pEUDQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyb/aoZ+Pja07j6BIaVBpZy0ZhDOeCaw6R0bctvwn6+uCXRSMDp
 GZhbkUFkCoCuLq/I/yn+XJ4h+4FJUtrtfFboHO41T0iWIV+h161RyKMw
X-Gm-Gg: ASbGnctZlVrORwI5/AQMkVyvjeh2Nr/Z6UXIPEG8cyGm5ERSS7afi4hRsluj9cPL+oN
 GrPnl2q0zibTV+xGnqE6kAdkpblpXL0gaQ5HE61hz0PLaV1k5pABz5AlKrBALvuyqm/tYA70Dcb
 g9FDSoOQT6/i2ZGxoTEkHug9M61JOSmkS22EjKbUqiPte4HlSqCkb4TDVncJVRzecQZaN90/h9y
 We9kIs7QgouSpn0CWtWFI6SVjtqWGE4rtknzhx6F1Amt60/TpNbpPPxCcuMvZf75CtvxBCPwone
 dO4EIIMCPBvwCpEFr5HRz7q/RfxFV6Rv8kJGKl/O5xle2x8lsJ8c7fiEPsh+BD51mG/WEIyXPSR
 4ipCpfMCAoePdORGceydWS2uuRvCS5Ci4nNNUGEpA8P487kay
X-Google-Smtp-Source: AGHT+IFJzuBUZQoUNCnvDmPwB16Bmhy777Kn9Cs20ip851c8+j7zobt9tyDy2OdLtI0fu0nStUXG7g==
X-Received: by 2002:a05:6000:2f85:b0:3a5:1471:d885 with SMTP id
 ffacd0b85a97d-3b497036450mr1143833f8f.56.1751619853023; 
 Fri, 04 Jul 2025 02:04:13 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453b35309casm62086065e9.1.2025.07.04.02.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 02:04:11 -0700 (PDT)
Date: Fri, 4 Jul 2025 11:04:09 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/3] NVIDIA Tegra210 NVJPG support
Message-ID: <yvzfp5igm2trom4kil337wfsyum75amvgmxkadi537dohmnbqy@wgbm3zxojldc>
References: <20250630-diogo-nvjpg-v3-0-a553c7e91354@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gvr2nbabnfc4vmvb"
Content-Disposition: inline
In-Reply-To: <20250630-diogo-nvjpg-v3-0-a553c7e91354@tecnico.ulisboa.pt>
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


--gvr2nbabnfc4vmvb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/3] NVIDIA Tegra210 NVJPG support
MIME-Version: 1.0

On Mon, Jun 30, 2025 at 09:48:41AM +0100, Diogo Ivo wrote:
> Hello,
>=20
> This series adds support for the NVJPG hardware accelerator found in the
> Tegra210 SoC.
>=20
> The kernel driver is essentially a copy of the NVDEC driver as both
> engines are Falcon-based.
>=20
> For the userspace part I have written a Mesa Gallium backend [1] that,
> while still very much experimental, works in decoding images with VA-API.
>=20
> I have been using ffmpeg to call VA-API with the following command:
>=20
> ffmpeg -v verbose -hwaccel vaapi -hwaccel_device /dev/dri/renderD129 -i <=
input.jpg> -pix_fmt bgra -f fbdev /dev/fb0
>=20
> which decodes <input.jpg> and shows the result in the framebuffer.
>=20
> The firmware for the engine can be obtained from a Linux for Tegra
> distribution. Due to the way the Gallium implementation works for Tegra
> the GPU also needs to be enabled.
>=20
> Thanks!
>=20
> Diogo
>=20
> To: Thierry Reding <thierry.reding@gmail.com>
> To: Mikko Perttunen <mperttunen@nvidia.com>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Jonathan Hunter <jonathanh@nvidia.com>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>=20
> [1]: https://gitlab.freedesktop.org/d.ivo/mesa/-/tree/diogo/vaapi_gl?ref_=
type=3Dheads

Dave, Simona,

This doesn't add new userspace ABI and instead reuses the same ABI that
we use for VIC and NVDEC, but it does technically add a new driver for
one of the multimedia engines.

Given that we have Diogo's VA-API work on gitlab, I think all of the
criteria are met to exercise this.

If you don't have any objections, I'd like to apply this for the
upcoming release.

Thanks,
Thierry

--gvr2nbabnfc4vmvb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhnmQUACgkQ3SOs138+
s6Gvrg//RBWFOyzIiciJCnRpaPXaJguaqWSDT3ITFN3DgPnwSglQ1Ct0MBe9Tit0
/IwLwU8UwWqodKMZ2Jx+VAYQOG6zGt0aYq8oXLHk2aS/ZB28Wn9vcEfF9Ahm75XL
Ujrt7l1TAxSQm/I3TlDbcyNb1rBF+14RmbH6O3EXx17OTneM/VTVH9nvrpGBXfxT
cYHpnq2o2leHEGvulcslwXYSWgMKpc2avCZpxjc/Qd7Cw0OMciJ2PEmADv/fU7h3
JWWfCFtGH0wjVtBkSp/tvY+7rW4ZtySAzMIcHQj0GlapPK0Jemfaw+R29W9xxMZ6
q7rf3Oopvc63Ye4GC1HbDr5k4TFVfP3qNi9MBcDxOkerLclhRRSZUGC8+9YA7HXU
5amDK7JjIrWrhfvy6CwAqPG8DYHN+ueYVBmvzYeFqd6UGXiVzoXNYbEXlF1pXgUr
RZjdoWXNLGodF8iuWwTyOsFbFG41/Uf/WbuubzlvV0PpEIoxKyFqH2peC0tjZcPh
aOegvyojSZ1U5PJ5qWpxUHB7EjHEchjE+NJ/wTyvasWOW9DiE0npAOOQ8aLWJDyw
t+AvriA2bkX9v+Gr+nXni6/N78wT5oqzsUvZFp5cgAPLn0h9dgtmI/aAdfyTMT4i
bBSscD0/FJQlFUyFIuw8vfffpXj6EgSfxr3ggB/ut6MpiItdtjE=
=gKHf
-----END PGP SIGNATURE-----

--gvr2nbabnfc4vmvb--
