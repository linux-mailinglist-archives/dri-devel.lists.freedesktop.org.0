Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDEFB03E21
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 14:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE0610E064;
	Mon, 14 Jul 2025 12:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hv1fpmmX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586FE10E064
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 12:04:35 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-553b5165cf5so5181107e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 05:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752494673; x=1753099473; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CBjLuItx33Qfi8z32IrHmB0TWEC92B60Q29ghyqTY00=;
 b=hv1fpmmXvSEzXVV4mShowaLdLDC5nriNEc91XBCmjcdsBmGxReYkIROsPFzYOz7/LU
 P6dNZlazac65K8CJWSJhFJDk1fsoLkwlFt5ygChgfH/O4xPcxK1f/OxTcbq8p62SGY2A
 HCAV9ERqUy5H2Pzb1nHwhTEQ6NVSJP1YXoiXt6tR2HF0nFXbYTkc9FqcRYOQVr8ODakJ
 A8Q5pBGV2XQZdE2F/A1/jQvmx0IRISV6v0H2IFPjMLiyZDxXwWuy1/Kk5d00aF+B3quT
 HxAzKIbDDsxRTeoEHPNnKkxoBQLP626UVR0NC8lCJcKR3m/ZXHXUpoAZ0fM05sonH7f8
 VFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752494673; x=1753099473;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CBjLuItx33Qfi8z32IrHmB0TWEC92B60Q29ghyqTY00=;
 b=KrBjHbBUUffmRmrpl0lFIttdAAwmlRkJ9wbBusOIvjvg4BWyOtU1/dw5nlEpY27Myi
 EOpNVTxtvUl5cFy26wuAEEWcZjPKtyz0FNzIymnzllSzmez8UdN/AoCVnsf1N/bjlZpI
 wpJUHGpNA4jA+3js3oRuJOcHPOaWchezFZpPJHe9XUW17oLrHbaib0zPfqSdsqnL6Obt
 8MjEm9B2IIGqoGwgAPneDQ0tMBsL0nboLbjikei2ZWLWeuuhfMq3I+Pufd+OYKuMQ/yP
 ep27op6/huhi7Bo+HWWL1ZR9mWLQjN1pNRN5foHaKVaQXd9QrjrbB3SJ3AT8au0LR5JW
 Lwhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlEIZwW2lFlsLd0LGftbCjn5uuScB6EKY0SvGG+dQHeLcaxYhScK2OAndSPsw960jcRazzulFGWZU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYH+G+nXoxlhGe69ILYXOBcUle5QdznZ9fNThH3KzbZ4shMhkM
 MYWG+pltYZr7PBKJ9xBUEdkGjFizx7xzMozD2umzi7SH29Z1GdvPyNNZ
X-Gm-Gg: ASbGncvbqUSXYpfly7VbOdgAnP5kFVK9IurkdW0cFhhuVJw3XbR7NgXz83bL6FSocAP
 WRgEDKY3ghB3uMk09OJVXhR1LKHPql9WskW/WcL1V5ncjN4HIAhhkBDL5sGkl+jmARCDyin05Sb
 Eyk6PcCFLEoWcbHLq0/wH7s1OW/Mfti4KGohff+Ajg8Q77gJNuxaIi6UTgZ6/vd4DNXiuvVQxbe
 mIM+OtDHOg6c6JIgBawqYOvvYHqdCXzitJgnPAq0r/AhFl6nQNmMSQlhNx4Sl2W9NElY/KD6BMk
 Y/H+1hUBmEEf+dj5lZ5bTLA5srGFRdFnzG9CwxOQsJAI67ovXkGreYQK5XYCACpSQ1SUNwrftNp
 kLzKcCcosYi0L0CrYpPfqGCdeXcZOjJWL2BC/ob9+67bTjCnl798yiynTVlI=
X-Google-Smtp-Source: AGHT+IFJdEdKVEj7RQIXyvRSvRfuUu9Ds5/AeKDwjQhJnrZ6iAzLBOj2g9OC4r83KdUdjkxZoP6hlA==
X-Received: by 2002:a05:6512:1243:b0:553:cfa8:dd38 with SMTP id
 2adb3069b0e04-55a05864462mr3396855e87.36.1752494672821; 
 Mon, 14 Jul 2025 05:04:32 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b6bb3esm1945786e87.177.2025.07.14.05.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 05:04:32 -0700 (PDT)
Date: Mon, 14 Jul 2025 14:04:30 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, ipedrosa@redhat.com,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/5] drm/sitronix/st7571-i2c: Log probe deferral cause
 for GPIO get failure
Message-ID: <aHTyTsFuakcQsEm7@gmail.com>
References: <20250714104421.323753-1-javierm@redhat.com>
 <20250714104421.323753-3-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6qAGav6rfCaU7+GE"
Content-Disposition: inline
In-Reply-To: <20250714104421.323753-3-javierm@redhat.com>
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


--6qAGav6rfCaU7+GE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 12:44:01PM +0200, Javier Martinez Canillas wrote:
> The driver already uses the dev_err_probe() helper (that only prints error
> messages for the -EPROBE_DEFER case) when fails to get any other resource.
>=20
> Also do the same when it fails to obtain the rest GPIO.
reset GPIO
>=20
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>

--6qAGav6rfCaU7+GE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmh08kgACgkQiIBOb1ld
UjJmDhAAmMCv8Sip9jCsBWQAquCXjyAm/VndN0wHUU0cDGLbeGTBFzOL2N6rJk0s
BSJYlQmvY3NHI5Z2Cnjvb8k7v7ZwVbQvXz/kIHxjA3qu36qhb5iefa0xh5wLwLTl
s2c8Zynb2jxucf05++gzF4IeSuY8K7EWjWFo0LLR1MU71XYdWkKteYRWlMVyT/AU
1Lgp8t0068QYVthOC9Xz8FtgMU+2Q1wNhBpZpL3R3ecp06tl1XqFiiw+8GmRLkav
AF9kr+FNh4WaYyhZ9OjSN9pcHuhsZpRrl8wvyU6Up68dVsgorEHVwHddZK0UhQU3
5YbpEKr1HPS5wstqrblPvG/sL5PjYF6/LltQEtTNLT3w3qqUiMbFvhPxSERopQ3N
3PiZ4KpE+cdx3bf+Jyrcw/kzMhzzYLH9TCMEDgNerxCAXlcFNRSMeXMSRFMdVW89
v5WVoloz5vD5oCC8sQQCHF1TLr3cbzZOUGLxGp1pSSSGAFsCeJPPqg9FuyrHQsOI
c7uzDqUU86hBh5/0TVhJywhtQwgz+Nj8ec1pcqJdgePz+uM+J0HAdoth9UMMI1u1
dB8/RJqOjB8jLP+TicWzQ7DS+YGt5V1bzi/kAMpWjHTR/3cxxUVrVQNXbjFmxXuS
OKaSpf4ecbHV71YSAyyWY/OT0aX8MzSB0x6ttRwgWcsJNzdsL6M=
=G5Vt
-----END PGP SIGNATURE-----

--6qAGav6rfCaU7+GE--
