Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA0E7C5E9B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 22:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C8E10E1DD;
	Wed, 11 Oct 2023 20:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB8910E1DD
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 20:44:26 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5046bf37daeso394396e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 13:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697057064; x=1697661864; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K6aX66cBRnDCOi0/Gtt5IiwJFoyeUsRSX/ZtkBcBa+s=;
 b=ACM2eV5j4Of2TzwQoGy48gvTFJaLidExH6yM9TW9AGrJ320lgE++Uwpp+bTEfLjiyy
 WmRlT4GnpfuxPcbbFeGVpgvkghNxCdxvlHNRlT9LESmwR1S+y0qt//HyV01holh5hHKM
 92Uoy5pI37miPVvYJ4ptd2woYp1xw/qIJU18DmpTvLMtiTMzxhY7v2E1W/ZaLP5ADiZt
 UFAu+jUz8s4nZIg03XgfoIi4wl0kuWWbHfJGtyAO21SUrMrY4/hC0P7Lg4JN+lIERxTm
 x8qhs0Z60GaTai+NmA87byg9kOkREbMCDIGgwQwNMNUV8Qrt9VqJ+O7I1BiVAmIjLXjc
 +00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697057064; x=1697661864;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K6aX66cBRnDCOi0/Gtt5IiwJFoyeUsRSX/ZtkBcBa+s=;
 b=L3IfBa7NkbgTBee0olNZD/dTraS4aR0e9TvtWsyigzCBuJ6Rqt4igpc3qloM6y0fb1
 NEvcC2ZHyKRhJKHmTusTiEJN9KOPkEGdycSZlGdRRwB8X/WUVyeu0JFMZ1zatSku9pN5
 TcOFHfQKWXBb/uR8j0s8KgSO5lpBZRfyxO1t7YnQ3pQVwr2op+rbHfPwLJRjn8vs/V3d
 5wXC6DwwVKlTAdt8KYyoYYa8Ov9sq+6eF/7DvQ42FIAomeV2GRjdUEXTokFAS+R9b6i4
 XLbjPydyMk+y+WcBDVJEhiAkmpw1DHAYkV/UWkZ7LhBWwnBOKizl0iMH6Vy1GwIiB8Dk
 2XQg==
X-Gm-Message-State: AOJu0YyNqNYmWbicZKsSsLnSSybfevdolTmhBQWgBYGWmGXD7oGpel3T
 qsbu8xRLDpSyi2VBWi0NjJo=
X-Google-Smtp-Source: AGHT+IE7sKq4jPXrCAsC/5GytMCkM078l9PvAPXBt3mMese9W1ktImwgukCNXyq+AIq5dY9A6mIVNA==
X-Received: by 2002:ac2:5a5a:0:b0:500:9ab8:b790 with SMTP id
 r26-20020ac25a5a000000b005009ab8b790mr17215603lfn.60.1697057064140; 
 Wed, 11 Oct 2023 13:44:24 -0700 (PDT)
Received: from orome.fritz.box
 (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 k16-20020aa7d8d0000000b0053112d6a40esm9275903eds.82.2023.10.11.13.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 13:44:23 -0700 (PDT)
Date: Wed, 11 Oct 2023 22:44:22 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH] gpu: host1x: Syncpoint interrupt sharding
Message-ID: <ZScJJprT7_OENKCF@orome.fritz.box>
References: <20230901114008.672433-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FC6eHs6d84hP5f0G"
Content-Disposition: inline
In-Reply-To: <20230901114008.672433-1-cyndis@kapsi.fi>
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--FC6eHs6d84hP5f0G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 01, 2023 at 02:40:07PM +0300, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
>=20
> Support sharded syncpoint interrupts on Tegra234+. This feature
> allows specifying one of eight interrupt lines for each syncpoint
> to lower processing latency of syncpoint threshold
> interrupts.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/dev.c        | 28 +++++++++++++++++---
>  drivers/gpu/host1x/dev.h        |  3 ++-
>  drivers/gpu/host1x/hw/intr_hw.c | 46 ++++++++++++++++++++++++---------
>  3 files changed, 60 insertions(+), 17 deletions(-)

Applied, thanks.

Thierry

--FC6eHs6d84hP5f0G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmUnCSYACgkQ3SOs138+
s6Ew/BAArOBHH6vqDRGiO/kZL3ugUGYqKa+95TNhWu4EJWYU8TgAka59tiQgccxB
j4E2kaomdW0JZnrUbZQ1lcyolQbx3lvAlvAU9LuwiqoBrnFbLD6ioKELWm8yzz4d
wX2uRHIOORzfK9PbUK841e8E8IGbt03SQWCRXuKlTJcfZgnkmkl+PICKwpvCYiv5
Z/afeOfyIGHmgVxNrmAzk4DZ7irMZMahGepCO/Cd3Z4WpUD0SINHrFvJYWqO4g/k
KPDMFgmdubjWGTSADIyiblneFVZT9Md8DcfwDUqJSyUwLQx0gfunBf4Sy79lCmxI
U49Q9/hBcOhGEbCCz4xr2nqE00rxwNxAau+7zbzjF4g8LDFiYOcLjoOxBBCk4hB9
4gmY7p87+82ZmTg4BFvlIM5XQnOsxnRj5EoAqF7/TSKlNrrmgUZrzy62GALYpjs5
+93hxN2bLge8h9r+B0dTxpwBEIqvZ60wPzlGHQBUKOROZQCnbIA+HTVmY0d+LScF
MGs+fHAm2nJI9778aGde3aBHooPB+rFgq0jctldbBHnRQdtWfvCmiYmkFM+sM/Sf
efxhaO9ymb+Mzc3vkzK610aBssHBjO+54kubkAWsGZ4bkg6T4tW3mBvMjjwQJNiJ
aZ5N6JRGLJAovX0QgdmOWnu9Vbb59DcN48vP+OglK7Iska1mdTY=
=1sQv
-----END PGP SIGNATURE-----

--FC6eHs6d84hP5f0G--
