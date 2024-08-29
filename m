Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C650F963F35
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 10:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6389710E07E;
	Thu, 29 Aug 2024 08:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VlZx/VtG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E4D10E07E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 08:55:46 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3719f0758c6so266935f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 01:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724921745; x=1725526545; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rL7eUiNCa7z8MXaxi2E5ZWkv5vKZI2iuxFJhMM35xqI=;
 b=VlZx/VtGApLrEDBE+vz8APdvi9wue8zoYp2hDCZ1xfQDJ2bnGIZiKCwXYR6UZ1VBXg
 gJ96zZMGE06Nfgkdy6EaVzUJqkh+5iYO1Ph2bZk1uhffp4KPbVkLOI7Wx8KhqPE1OrCw
 cDpKQn1UX0QveJWUw6j9guQER4/BNTlVB2loaq6oGh/g9Hjpffx37xXSqKkvMkswh4PQ
 MD/uQogUZ++uUf+3c+Je6Anj1g8YbFhRFyq6gbW1bLEsrp0+IjI2OE7DgrBtWj5tpVYK
 4zoo861boCNLmuRqLj5urjjmLlCtTAG6LC4iTsQ3K0d9Xtg4PVR31uIWlzcK+osaS5DK
 72AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724921745; x=1725526545;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rL7eUiNCa7z8MXaxi2E5ZWkv5vKZI2iuxFJhMM35xqI=;
 b=Ul1P9NEvCRkDWSEfWt3ynqPdncQVw6S3uHkMpD5Yr15EeaBIqV01Mmok4pJ48IFrdb
 wnUhQgYET3NL1Y+dWih0LwW03RSP0J7X503OIFvNzRaCNh7cyjwfVaSp14/U532SHsxi
 wYJdGh0DvwblmHmIGneB0Z13m/yg/wI4G8s+QCSm3vBfwcMJ8nCL+isWbL8NCooQBujY
 3USXv/BvR1UQQO9cC53RxaoZ9EnMQeFpBQdQ8G1bQE52c9oTsal0WIC0jRYuUUlji5O+
 fW62T6f+B02KiIo23wv3HlnPRk89rMC1TC5q9Db1KLEj7WOxio6dJozsIfnjmVxqXl3s
 pZMw==
X-Gm-Message-State: AOJu0YzpTqUrmiISdnXLc4FqvaCQxGT3g0RYDn+pPh6bPGgaW335ceAY
 xHRsGDF3WSxsjKyY7e6ECovfVD3+cuKKr9KvHfqJOYvYUQc+Ymie
X-Google-Smtp-Source: AGHT+IFTA5y6CfgOeEJGB4wOYr0CbGN4fvA7Y3QtW7T8qovMYdaXNKLfd4sZdRm2dEyC2hK5IpG8NQ==
X-Received: by 2002:adf:e882:0:b0:374:8f90:b78b with SMTP id
 ffacd0b85a97d-3749b5816f1mr1575181f8f.44.1724921744113; 
 Thu, 29 Aug 2024 01:55:44 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ef812b2sm849361f8f.75.2024.08.29.01.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 01:55:43 -0700 (PDT)
Date: Thu, 29 Aug 2024 10:55:42 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH 4/6] drm/tegra: convert to struct drm_edid
Message-ID: <qdzaanzxm3yfkyokc5pacfuuyic5zbfmp2teaxfcf2knimvleb@gdd6g4htpfv5>
References: <cover.1724348429.git.jani.nikula@intel.com>
 <e764b50f4ad2de95e449ccb37f49c3f37b3333fc.1724348429.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gfx7cbgrsffo6veg"
Content-Disposition: inline
In-Reply-To: <e764b50f4ad2de95e449ccb37f49c3f37b3333fc.1724348429.git.jani.nikula@intel.com>
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


--gfx7cbgrsffo6veg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 08:42:50PM GMT, Jani Nikula wrote:
> Prefer the struct drm_edid based functions for reading the EDID and
> updating the connector.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>=20
> ---
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/tegra/drm.h    |  2 +-
>  drivers/gpu/drm/tegra/output.c | 29 +++++++++++++++++------------
>  2 files changed, 18 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> index 682011166a8f..2f3781e04b0a 100644
> --- a/drivers/gpu/drm/tegra/drm.h
> +++ b/drivers/gpu/drm/tegra/drm.h
> @@ -133,7 +133,7 @@ struct tegra_output {
>  	struct drm_bridge *bridge;
>  	struct drm_panel *panel;
>  	struct i2c_adapter *ddc;
> -	const struct edid *edid;
> +	const struct drm_edid *drm_edid;

It perhaps might've been less confusing if this wasn't gratuitously
renamed, but either way (and assuming you want to take this through
drm-misc):

Acked-by: Thierry Reding <treding@nvidia.com>

--gfx7cbgrsffo6veg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbQN4oACgkQ3SOs138+
s6FeDxAAkH31xWOme5EUhsUwG4ZFu3t5BXXTVUqw0UtdLknE726QTF6BDiZRYTLS
/1Q4mL51TA+l90EU/R6BzXGaL51cZw8HxHvBBrw/cYGsXV4w90FsrL/JESRbZ5TQ
Yc5VSBm89E4NrSIsse3wvHkt/7VXpBmWwCHSLWNH4tmVeDYoCUuT/fnT6ijYp89b
JoePNhiWr/2V9UnPJBuhzp9EBqUSKs1j1Qc7TNhQ6PiMeUq3SjdiIRIZDu/2WQP9
JTVLVDAFLbkOVv7xbgiTx3rT3mDYUWgRlyv+vxcOj6dAFltxIjL2ANHDFrs65kcK
SRd7m96VkG5XwcEgpPNAuiKU59AhBg6BDV/El/KN44nj5LFv3M5NmsIj++Cls2Wg
92LClw1PC7N98OhwwsBlBIZjUx5//2UUw1jz/flMQeFKjt/eeeIuOdZuhKF4CpNM
qEHkHkkiJkqw3dwfn8DIHE6xZThaV2EHvTBV/dx9itFsutzx6P5OCqfmFktrw+P7
KY+61JNrB8Fjx+uO9FkSCEgiT7tRwqqNsLEpzYk0mzX167xqANjY0ygO6S5103ur
cg0qyj02Q9f0Tjm3ioWnLDLNKx7lzgDgjUfb1IULIL+iDUTXIj9kDRjDRHPuECEY
zzz803190eoFwwYHNhSovNBw6vTWfUimqnac4K9voQm0iTITFcg=
=Kwt0
-----END PGP SIGNATURE-----

--gfx7cbgrsffo6veg--
