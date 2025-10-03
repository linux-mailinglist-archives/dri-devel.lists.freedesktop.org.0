Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B7ABB6037
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 08:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB9810E090;
	Fri,  3 Oct 2025 06:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mz3mYPLf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352D710E090
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 06:57:43 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-58af7f8b79dso1765798e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 23:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759474661; x=1760079461; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yQdQXw7+avsuC5hhfujv1yVVicy+u0sf+WMMAeSOEQE=;
 b=Mz3mYPLffDATWEUZi0Zf/0X44zXbdz2D3pZyHrHQ+/2iP4FonZW9BUjlk/bvFb2iwY
 yhx/Is3J+KOtZC0ezushgFKrpykMibuwW9jddJBAto+0HdU0jFh0YVECMD2aa+4mD2GN
 IdC6FPjsdYlf70x2c94aRzfRHGQP26RB3Avxc2TdCEAKW1ulsG2et2IZ8gy68RcPN57p
 bDZfbkyr5FdnSdC3y8KdD5KDDPaJYnBTCXA6oMV9fisMx40t9qtJbcRPnXvikWQWQP1A
 GDTLhuHHlPwWNUMonWcgZ3fQkrkng6/Vk2UbhCmzfutP5pykCw7uNai098kkkCgp1R3e
 1mIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759474661; x=1760079461;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yQdQXw7+avsuC5hhfujv1yVVicy+u0sf+WMMAeSOEQE=;
 b=ifUdIpe2eT0CTZxrkRoHLr8ahV5kucLsC0znoPmqOE9IPZdKa2bARnT3zmxTPpd6eC
 I8en9F9Kf2KZfZ0IBuNyYZuaaRsU7DS4AmKFjwkXZe4RKYC2Hm1inOV1mBg7pXAYJtPF
 LgB3IHoCc5Hcav65yo0Q6l3gGbwcS/hctv+1/LIBwq7MIXsG3FoeqWVNutLbiZQKCLhN
 qwXmBR88TPgAD/z/KBJeElVtWy0Vo4U1wULMehNp20hMWcHetg9VeDQtSK2Sr7xq/xV6
 IuZYVYGEcPxpYgS3ciSCyB+iVkI0TpH2IzltbJcnFylq7wewkQI6fpj+v7H9+8s3R0XJ
 8TeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBaB7G1xJiC0neMnUv3++YfvAwGTIcVLEbVTVNc4Mll4uu7FPnPhokevCA31v4M+3qyLd/hDokp98=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtTmqz1dseWOl8517us1Q2cN9bvy29W+HBWp3alpxdn0pEhBl1
 IH3G2uTmD634T0uRJY+lQpOnicLHu9pp9uaDZ5a34ozJQT+CQa0ctJA/
X-Gm-Gg: ASbGncu4IeBscGk+grzRwZjtDIVJATszwNY4YfncIvWJ6aa/3Q+cbTSCvKPqZP+K6rN
 2+cZUYKzumfqJLi7KqRbGI0Hze4a0lv/CPCCnp5k0dMl1YqrMFyVAOR0nT8XtVhfnoYV/YkRGgN
 +k6GDCmeaUTR0qfc/o181M4Kb505AkCoLCCkgao/SwBxS/WPvqBEVXndVpVLy/RS9SX5P3g8SPf
 AbWP6lYcW9hIi2/9/KXFR3uVojBoAiI51dlKxzBag5M12cNV/5PNKbdihwc9pmAezT10933hC/3
 FGHaucyOj3KtnwwNOaqvKyOnYDN6X7KnyhZr4aaYqoi9geUbBCzYLtN+1JRSt2fm9yyt0HgoX5y
 DERUuGLsDhBT6sZZIY3LUZN7QRB/b/muvgrX2imdo8V+TJP8uCp5k4oYfidDTFNi5tc2xqL4Z2U
 vdnPcAu1Q=
X-Google-Smtp-Source: AGHT+IFykhT+qoW3okH4MQ58h/3zC+W0SukcWJAG7Lz3Pob97kZlcMYuRXV/fQcvc293Rdd5UPr+nw==
X-Received: by 2002:a05:6512:2315:b0:579:fb79:45ba with SMTP id
 2adb3069b0e04-58cbbbeed8cmr523242e87.48.1759474660918; 
 Thu, 02 Oct 2025 23:57:40 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b011ae145sm1542943e87.123.2025.10.02.23.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 23:57:40 -0700 (PDT)
Date: Fri, 3 Oct 2025 08:57:38 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sitronix/st7571-i2c: reset position before clearing
 display
Message-ID: <aN9z4pdh1aBZZLdz@gmail.com>
References: <20250913-st7571-reset-v1-1-ae5f58acdf8d@gmail.com>
 <87o6r9o25m.fsf@minerva.mail-host-address-is-not-set>
 <aMvIyOJkXE39sp8T@gmail.com>
 <87a52saujd.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bS1gySna/1bzmu0S"
Content-Disposition: inline
In-Reply-To: <87a52saujd.fsf@minerva.mail-host-address-is-not-set>
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


--bS1gySna/1bzmu0S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Javier,

On Thu, Sep 18, 2025 at 01:07:18PM +0200, Javier Martinez Canillas wrote:
> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>=20
> Hello Marcus,
>=20
> > Hello Javier,
> >
> > On Wed, Sep 17, 2025 at 11:32:05AM +0200, Javier Martinez Canillas wrot=
e:
> >> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
> >>=20
> >> > We cannot know where the write pointer is, always reset position to
> >> > (0,0) before clearing display.
> >> >
> >> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> >> > ---
> >>=20
> >> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> >>=20
> >> Marcus, do you already have commit rights in drm-misc or do you want m=
e to
> >> apply this patch ?
> >
> > I sent a request for commit rights yesterday, once it is approved I will
> > apply this patch myself :-)
> >

It took longer than expected to get commit rights.

Could you please apply this patch so that I could get it of my TODO-list
:-)

>=20
> Sounds good. Thanks!
>=20
> --=20
> Best regards,
>=20
> Javier Martinez Canillas
> Core Platforms
> Red Hat

Thanks,
Marcus Folkesson

--bS1gySna/1bzmu0S
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmjfc9wACgkQiIBOb1ld
UjJvqw//S8X/vaqyxIZtYmGNPjRVvzWOXLt1Yx8S5L5t5a3SNj9R5eNaeO2rtSKm
bhFtZ07j9AqkC3Xvjf7q7M+uvsFpzcw1tA1Z2mG8JOymXcgu6JkwIPKdA/a9DGwF
viXAgw92/CjiC2ODFVoMZ6ckmyfICviF957vm0SdLu32Ion4UNGmQmm3LYHQwTpc
BrDflx32LvwIzRwcjFFUI17a2iy3yDwjy8ZKsyTSepLTFVaqiJQUG241BIzO8gLQ
1QzoWKqhEVjxZ0lh5teDh+hF/Yar4B3zC3b0kRwUhYYpQaCxGYqab0KrECOc351/
PyS+CP+gx2FUlQRfpgLsSzumipTi6znLkxBS8XI2jZokK+deWmI683V4Adob0y8O
TWPASyG8m1pJUXm9nKR5pk23yL02lDjn6dPBBol3NZWOwlPws0owNIZ1CEBHXypj
flg7yO9wSMVaSEsS/Dlg0N1GXauYy9ENR6V6BSUElfZdLKgFI7lIPFWD1XqcsRxJ
U9REa6XS1P/xKoITX0S+v5/TNImBdVc344+jkAXUFR0Nas0qL1hAyX+NGc2o0aii
A+S/ZhRCXSkRUEvBWqngTY2RnJMUZ7MBt+Vy/tdvpYpK+fDlGMBJjUp5Z9unevp6
vRa4+DpsHAA4YUh+rZ/GGOLnAc4FiG+F4BD1gb7F9bmxRBJb9CQ=
=FoRv
-----END PGP SIGNATURE-----

--bS1gySna/1bzmu0S--
