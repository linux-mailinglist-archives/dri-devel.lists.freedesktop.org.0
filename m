Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7DFA9F5C6
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 18:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B117110E616;
	Mon, 28 Apr 2025 16:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fKTyMEvR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A26610E616
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 16:27:07 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-54d65cb6e8aso6447428e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 09:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745857626; x=1746462426; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NEz+7HnlSD9gBpRqA1Xm5hcc+9kBO2HYG+echiMcxYU=;
 b=fKTyMEvRwD0Lh4O1HCu+ru/suNG3tkKer21HzZczfQ/nZEZYT3eu2Euw+HthTdp0Cl
 otwLyiaodSoAjj9sWzjEi1yEogfCzWKc3jB3lGm6p+2AdWuSoRbt9TxSmBz6uRty8tm8
 C3G1LjzxWWLBPjmrF4IrTcQ9O4qQySWIPlJelRfnTDxRmEaGMRUlB2IPTwH9JZ4/txwp
 2ENKVCw6ky8xPpz9xb/X/IqXFL04Pyk/1xM86B+/jPmicf0XxiLHCmLdlOuKTVW1n7dQ
 bwFS+8yvySECZC3jfI71uQ9y5N4Gbz25JAMcRjVv0JmChPNLWM/1XaLLwNf7n5/e+XY7
 YLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745857626; x=1746462426;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NEz+7HnlSD9gBpRqA1Xm5hcc+9kBO2HYG+echiMcxYU=;
 b=jgvCDhR5VsXEHNQd0A6zGRhzZSfvVQtRpx8lzLzSoDcW4uyBnIHOdzAMIEfTs5dPyD
 lVyJq72AEnaTJYQ0F/cpTO+pbpFUgO/oQ9rGtzXjqYvRe/goUjq9fPjBovWDfEDdKcHx
 sK78/g+c4S0Q5UJBCr6vXVQA9DYY5R60wTeeCMXVx10T5wW6YuU1VN0yRHoap/esXx+E
 yAyTlrpAWqcpsAI2JO71rMkDwjeKPBoNb1ISJl2prY8w1b5oWy2e+PgDT/d94jZ7ASGs
 B9D/BxD8YCzyfzH3TxZFX1+ZFgoyQS8MZobohiatlWsLjg7otfsr67CaAi4gGsk/wFcS
 Jb7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxv+Xj32bkYPOT8zDEwT37Y9Sssv5LC6tiuIs9bOwrbhQRqKB/LHYJgz+mp4y2u4kwwz66xvMzcCI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWsDVMyZnoqdJmNFX7+iQPs0EnNjcwTWJl8JkRAcZmvI8yYMCl
 OFsoh2SpeeR0lUYF/bqYuOepJ/BLGNTngZRZhVh8VK3IUcQQPOUY
X-Gm-Gg: ASbGncv4zmQg9YDbSwgsenYV2qWwkwHKoX05a8rBnLE8wR/26FZ0oAdBI2nOYJqYzxt
 uybw2VFiDZIuSYJkBw6S8/pxXd6o+AK0XX8F1WetI4NDRKSTgx/z2aJgs082xTg1OFdpF5i0EYI
 AXKqMFPglQFGV1Xl0uu/zLnfJjI7spC/IemO2OHn/TTTAgjSGc8iVIerGniSNhGkzZrwxmKsEgb
 eo2/Sa+V7BL9jDqi1XIUNHdxHqb5jYdTXFbhrwGqiMCbC5EPnbzp/pRuoZhY0naRlj/rYUybNa0
 O/q2ghLx2PR0LU90g8DvIeGWq8mCWVuu5wN/kxDev5emfhyXLMSvGduMvyNHvG+p9p6TBNhC1Kp
 Hmg==
X-Google-Smtp-Source: AGHT+IGr6BX7don/g6ZzfnnNUrD4Fex9BPlhWoDzwbCr+DZza31LV5r8+5jBFKfRTAtrCQtlTb7OFA==
X-Received: by 2002:a19:6458:0:b0:54d:6aa1:8f5a with SMTP id
 2adb3069b0e04-54e8cbd5b23mr2738532e87.13.1745857625379; 
 Mon, 28 Apr 2025 09:27:05 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb7cf7sm1648779e87.214.2025.04.28.09.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 09:27:04 -0700 (PDT)
Date: Mon, 28 Apr 2025 18:27:02 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, David Lechner <david@lechnology.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Alex Lanzano <lanzano.alex@gmail.com>,
 Kerem Karabay <kekrby@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/st7571-i2c: select CONFIG_DRM_CLIENT_SELECTION
Message-ID: <aA-sVpH4JprVJfvi@gmail.com>
References: <20250428150752.3970145-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="o3c6wV1GzZxPmN44"
Content-Disposition: inline
In-Reply-To: <20250428150752.3970145-1-arnd@kernel.org>
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


--o3c6wV1GzZxPmN44
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 05:07:45PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The newly added driver calls drm_client_setup(), but that is not
> always built in:
>=20
> x86_64-linux-ld: vmlinux.o: in function `st7571_probe':
> st7571-i2c.c:(.text+0x7b7119): undefined reference to `drm_client_setup'
>=20
> Select the appropriate Kconfig symbol.
>=20
> Fixes: 4b35f0f41ee2 ("drm/st7571-i2c: add support for Sitronix ST7571 LCD=
 controller")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>


--o3c6wV1GzZxPmN44
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmgPrFIACgkQiIBOb1ld
UjLJRg/+OXeqfy4JHuaJu1E/9ak8qieFsIFnvYtHXHj42ZXnyeaMV8lrdx/MYlA7
ci/Ql/XnIA4Dh9qFMNPBrfRw5zRs7pSXBQY2Ic61ocvTtVS3XRATYKLSIcCDRhFF
owscA1AZMXAMru6+jOg43b4L2TqRMT+OGa7Xj3m3oUW+atlnRDPGRxrnOHKDjZmI
9X1g+vm36QkLFIoVoMTrPp/oa4kgKxr+ZRRdqIfPtsr5MyG/yLBgrr1IOI2fF9kX
wsWEuaBDEQtLgPmBo4iK8FLLeQHkYOBNKmR2za3ItOZEe2d1OKCHqXk4T1nbit4I
8DqMAV2mc19hM7mHGE0/+DfBAmhvJhduJJ5aln+lacYJsUZotJZP2oSI9qqEpygw
JvQb44d1JLoVIETuqC5tyNtKo9nuQD4ylingsy/1BIul0FcSqtBVIADoNSpY2Ed7
iyT4+GV1dX16AjGPJx4kJEGGk7uoL6KX4jG1muWHkSGqEDrJNIfc3egDCkZziHJ6
Mgm+uD8gphzFh6Q7SIAYpm4lxY/Mcidk7slhow+QtRvsEfkQ6peeU4csUkUjfCfg
zy/plSitlaVAARLzF6jJ8oWXa4267Ve1ivpkxC4cFebYSajCRABHW4NN8rqJfaRF
XGr2EZCdk3Q5CzJq61QQFJAwF/ZncTY/N6N9xxheYeiDNS7fTB4=
=WotX
-----END PGP SIGNATURE-----

--o3c6wV1GzZxPmN44--
