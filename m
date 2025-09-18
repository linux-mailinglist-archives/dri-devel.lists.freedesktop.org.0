Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9BBB839AA
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 10:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FB910E0C2;
	Thu, 18 Sep 2025 08:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MXYJT/c5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A2B10E0C2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 08:54:37 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-56088927dcbso851171e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 01:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758185676; x=1758790476; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=L1zfXr+TiF68xYIu/QjAZG5Rv3z8es1PBrKaRHiISSE=;
 b=MXYJT/c5xj69W4Rf5etugiWphWGgSESssjOXpGC/PF8HAPkxIKdKNwUM0jAqNrRboA
 pquUd1VOvVPVGxGy/exsUvxA642c25/wB25J2nw3ZUF6RO+5Plw4h7QDGEXl04Ew51n/
 yRKfW+OgHxF+TIjLk8mdYj29Cn4crecHbRtq7oiTtnZdc1Vq6hhkGrIgSSiv/OLF5+N+
 7lxqQqnPVUIAIJqhDujRxe2DSayw6xX0jkRSrzSP1xjaBsUKWWiSq/ueMvS2mu4148pa
 uUzeG1f7InU1NQ576BXRWjuuxz8BabljHvvFbaIhgWOi9spLpIBIE6TtJGVwOZEtBcKK
 QcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758185676; x=1758790476;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L1zfXr+TiF68xYIu/QjAZG5Rv3z8es1PBrKaRHiISSE=;
 b=nfar+tI23nJF3zJdH/qSHwkrLq0etmHspHba0nM3dC7Rh4AeOVfRwzBIbBvdMNxhn8
 T70AjF0OGNSxEFYSLPSXmDcmz/TKcw/x/TW0aIvITkDHUDJG3avz9WjT5MgYsomP74/M
 BMSb0AFNNXT9olaYE8BrN2GGdzj1f0kwWrmZzu9XB3qE0XPT8bD3456lru5lXhDiuOEr
 Z7BzicAXLskAiUJTJKLfb3PJwhhcSbjUZETCCHExVLdEIhFRt06qUs81mDKAvG6o5hzC
 JHQeEZf19IivsUJbL4MfQV9KV3WviBTlVk66gBy5nFTKwMdXIBPUCiznwXD1+TidWHNs
 z0fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtTLoS8AWrw2UngAqILkmbdQVQ8QPtQb8sh5JYNlsb6V9k19cVhqYt4EVNhvBgffNDkwDPQW7UnEM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzzqlt+eW5cMxIOkfturUFU3FXfkT9JBl/GXpAGuQ3FlEZBkrw0
 BkOCCc3rfy0OYmaYBQKBDSrVZsit168cb8AfcaI3HoruAU/AHRMmmRrF
X-Gm-Gg: ASbGncu8xUdnC+nDLQm+bXDRPFKdZ/5yF9tOP0xnS/S+j7uRkf+R0b+6u9K7ku+m7LA
 WzyBtgZYT3WThjCY/w4yprUCG2p4RNuy3g2LXUSEGSp5nFfu4Tm1PSCDmJ3ZVLrNfyCatDBKRI1
 TuLUXG8o/cWh1vRW3NGYR7OA7kEFHtg0Jx78YYzc6GrE76/ZNNpWGwXYuFrOuR0IT63vOQqHmrU
 FsvywWmIewuqApCMRY2AqZT+MlBQlZtLwgL/2m/psV4puD2WFHU4wWOC5R5v0zuJ2cpykStSpSP
 1kqobcLpVO1mRgZxey5xTPcOg94yimL8LiTngNlxoGbs18PHq+I8H1rNVVAbo0knLh6wgV8KzLk
 zlAN58bqRcMFnTDntVJJ8wH9Lwo7UtuuskAsqSXuQmFkufh9pMcFGuRvaJvN90amuaWQaGIrEsy
 +ChZKhhyY6joxW
X-Google-Smtp-Source: AGHT+IGm2JShN6Sv81lo1T5JnLxBfIgmRooL50eCyiXCHruGwYMx2R2gX19XGt4JW1t8LOnfM1W53w==
X-Received: by 2002:a05:6512:33d0:b0:573:78df:c19c with SMTP id
 2adb3069b0e04-57799fa0ac8mr1911319e87.22.1758185675774; 
 Thu, 18 Sep 2025 01:54:35 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-578a99507c8sm498643e87.117.2025.09.18.01.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 01:54:34 -0700 (PDT)
Date: Thu, 18 Sep 2025 10:54:32 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sitronix/st7571-i2c: reset position before clearing
 display
Message-ID: <aMvIyOJkXE39sp8T@gmail.com>
References: <20250913-st7571-reset-v1-1-ae5f58acdf8d@gmail.com>
 <87o6r9o25m.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Ug0YIJ+ijkQ2jjPA"
Content-Disposition: inline
In-Reply-To: <87o6r9o25m.fsf@minerva.mail-host-address-is-not-set>
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


--Ug0YIJ+ijkQ2jjPA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Javier,

On Wed, Sep 17, 2025 at 11:32:05AM +0200, Javier Martinez Canillas wrote:
> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>=20
> > We cannot know where the write pointer is, always reset position to
> > (0,0) before clearing display.
> >
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
>=20
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>=20
> Marcus, do you already have commit rights in drm-misc or do you want me to
> apply this patch ?

I sent a request for commit rights yesterday, once it is approved I will
apply this patch myself :-)


>=20
> --=20
> Best regards,
>=20
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>=20

Best regards,
Marcus Folkesson

--Ug0YIJ+ijkQ2jjPA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmjLyMEACgkQiIBOb1ld
UjKZmw//WN2aCTIg5Fi513sCawMQyeWG9g8gsNWGqu81U/hM4UOzZnjzhvEND+JT
Ud1R7lIiAvpcigeZvbNbk1v7WZu+PN47d01G/S07zOyYz+yW5lMy1xeS3sqMyJ5F
m8lkvz8/XSdG85PjvgHL5fRGAjATi1oxxm/k0V+BUhFqbGw0STm0tG/ReBfUheXg
O+/90scHHBfuO5e24cfia2kbcaQBg3y8s8S8ionXQIqhJIFogZPsMyhM7twF8xtD
EpyU/iZccX95WHorgIkVejKk8YNZD9dQPYy2lXOjDm499ZdFomyB/YB6eX3qQgmi
eHjVcC71f/4A0002avJJ6ywKSA65YKP/D5J9z/jFyPeVbtnaECR3CWJHQu2v5Zwf
Ak/2ak4M3i9s3Pjua59fQFF1d5405ZRAvpZWVcmky5Hs4dJBFrMHXYVA+4qvLvvG
ospz+JDo0dDArgetNOCtWrM4AQTZ7zMS+gNf/lLrQPIBy7364JKsxIHIaK3AObQO
sB+qZIkXsGC129tfFsr6vZnocGSqhKlnRmJUnrLeZK1Yp8cgR6uNZidsDGJpPfTd
GYs7U1YmD5HTkEDO87edVgDIjwbZSqFra4zHlX5UJ0DpOr0Pgil0bgVoL7Jko1jQ
pmF0IdOuZLyJVFDPa0d4Vxr1Wpqdy+qQIL6JLLmX8wxUetzWzVA=
=+vpd
-----END PGP SIGNATURE-----

--Ug0YIJ+ijkQ2jjPA--
