Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E064B8FF9B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 12:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09B010E409;
	Mon, 22 Sep 2025 10:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OZJoguHu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632FD10E409
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 10:21:56 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-32bb1132c11so4143855a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 03:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758536516; x=1759141316; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qgzrsKFjkdOHqZq8z9KJvQRmwrFpRxJTot1VKAx98R8=;
 b=OZJoguHuDtkNhjLmIkF+V1C/+TNcKOyxY52+nSDOYOEcEOwrERoTJnh7idIH+2GfOO
 7+UPsdRfGNCDp0pAUwkAuJlxyfFi47oOMdso2rvMTZ+zJCHRgmpkTqyOI3JmXQiAy0o8
 15mv3rc5YJe5dnVu1IenRPxDBi2jIwL1k9iWHjc2+fIPFIp85OIqBqDBAqIW5dE1efkp
 R4BeuZfJ53N6yNmwzWXM7Q1tsrARdx8cNwQt8OlkdhvF6mvdCANbWiudKNo63VTh7u+q
 jr54RFD6oOCwnw0Q3N5WSRgoSD+RkgfNANiqWKkVfGwL2oQ0wceIM8Jr2UbDm31jnxq1
 hKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758536516; x=1759141316;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qgzrsKFjkdOHqZq8z9KJvQRmwrFpRxJTot1VKAx98R8=;
 b=Jr8m9Bzjr543MQseupFR5BYdqMnZtxohK0L1t/woZPKa+KXo1zrZrocMNUwRQAPmre
 cnUZ5QmuPljKLND7UI/BuDkrMW8+YrwaKAOl6iiHEzV8EpcJxzHgIt6uqiKAtVwXL1sI
 1FV7ziyp7aCJwcFlFUhl5XVt/sQ26V/Nm9kaidz5jGf2PbAybbKM/PgBEAzyvdSE3AeG
 QvTZmo4un3Y40hXJ+Bz8lEpZn+bL5EHULfT3fG1KIy1wOfiiIFGKT1m0EB+1w703yCng
 6FOPXyoVzh00G8ELuouOZhX6fQ4fRQIZfNdD8c5taY26+1HV2lVl55pJWFwOKjWRTiQv
 ZJXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV93wU6qvsu+pT+XhRNotmxzLlBXDmQRoGPq7YUDxeZZ2YPLQdcXcihaeWDL2NcmjY4zkEKqGxe18=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyT7z/GRdf2i7Q3UzFJWXaVoGwZnaE2nEvLhu/rsOWsJKZLQ2RZ
 n+l1qjrl6A/o0VvYaUEV8+0EIrI+DvoZiTKWcJU6HzI5v2v/4P+R1RI7
X-Gm-Gg: ASbGncsG0YhbL+5CoNjq/M+Ggc0QBaUM3QF/33E7IrD+fyuYOOews6pFuV5SJqshHKp
 OwI3Csp3K7TeQKoVjUtLx5a4tlOmo4bUH0g2JWKzUNCsDUQMyYyrxDp3Pj15JC5SsLhgNVfc4i9
 2SyQDr8eBTp+2+qYzoFJpaO7EMBv/8IKkb2TgHlewmjkc/2i/ezNEe7UlyJ5d5Tv6f50JPjApA6
 7rBMmxa5AsLmiCXjZUMOWTAOJ4nKNATGAQuD7mTz8I4V8IBkKhQrQkiD83Vwvf4ZCY14X7zAmHD
 HON1wF59eDTu5/QugpvjE8fFwf1o80TUgGpUii6NA+d0I1yObymdWTjV5HluWOQZ63Ufvvu7aTN
 1T5TlK/ULX9aN/0Xa8Zs17OQPt6T8tzeZ
X-Google-Smtp-Source: AGHT+IFKvuB8nQ7chq/pZQMYgIgXJUcMFLs1cyYqPT9bIL5ygOY6/yTLZdyMi8zHSlQUMW4v/IZp4A==
X-Received: by 2002:a17:90a:e509:b0:32e:dcc6:cd3f with SMTP id
 98e67ed59e1d1-3305c6d8db1mr15617472a91.14.1758536515713; 
 Mon, 22 Sep 2025 03:21:55 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e70c06ba1sm9402454b3a.67.2025.09.22.03.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 03:21:54 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 98E2B423FA7F; Mon, 22 Sep 2025 17:21:52 +0700 (WIB)
Date: Mon, 22 Sep 2025 17:21:52 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Framebuffer <linux-fbdev@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Helge Deller <deller@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Teddy Wang <teddy.wang@siliconmotion.com>,
 Bernie Thompson <bernie@plugable.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Arvind Sankar <nivedita@alum.mit.edu>
Subject: Re: [PATCH 2/3] Documentation: fb: Retitle driver docs
Message-ID: <aNEjQEY5J5DBTF8P@archie.me>
References: <20250919003640.14867-1-bagasdotme@gmail.com>
 <20250919003640.14867-3-bagasdotme@gmail.com>
 <222d551c-fb01-4a8c-9b83-daef019b6795@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pyPpSPV0lzt8YzEF"
Content-Disposition: inline
In-Reply-To: <222d551c-fb01-4a8c-9b83-daef019b6795@infradead.org>
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


--pyPpSPV0lzt8YzEF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 20, 2025 at 09:08:57PM -0700, Randy Dunlap wrote:
> > diff --git a/Documentation/fb/aty128fb.rst b/Documentation/fb/aty128fb.=
rst
> > index 3f107718f933fc..0da8070a552165 100644
> > --- a/Documentation/fb/aty128fb.rst
> > +++ b/Documentation/fb/aty128fb.rst
> > @@ -1,8 +1,6 @@
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -What is aty128fb?
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > -.. [This file is cloned from VesaFB/matroxfb]
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +aty128fb - ATI Rage128 framebuffer driver
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =20
> >  This is a driver for a graphic framebuffer for ATI Rage128 based devic=
es
> >  on Intel and PPC boxes.
> > diff --git a/Documentation/fb/efifb.rst b/Documentation/fb/efifb.rst
> > index 6badff64756f49..3d4aab406dee0a 100644
> > --- a/Documentation/fb/efifb.rst
> > +++ b/Documentation/fb/efifb.rst
> > @@ -1,6 +1,6 @@
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -What is efifb?
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +efifb - Generic EFI platform driver
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =20
> >  This is a generic EFI platform driver for systems with UEFI firmware. =
The
> >  system must be booted via the EFI stub for this to be usable. efifb su=
pports
> > diff --git a/Documentation/fb/gxfb.rst b/Documentation/fb/gxfb.rst
> > index 5738709bccbbf3..3fda485606bdc1 100644
> > --- a/Documentation/fb/gxfb.rst
> > +++ b/Documentation/fb/gxfb.rst
> > @@ -1,8 +1,6 @@
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -What is gxfb?
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > -.. [This file is cloned from VesaFB/aty128fb]
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +gxfb - AMD Geode GX2 framebuffer driver
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =20
> >  This is a graphics framebuffer driver for AMD Geode GX2 based processo=
rs.
> > =20
> > diff --git a/Documentation/fb/lxfb.rst b/Documentation/fb/lxfb.rst
> > index 863e6b98fbae55..0a176ab376e30e 100644
> > --- a/Documentation/fb/lxfb.rst
> > +++ b/Documentation/fb/lxfb.rst
> > @@ -1,9 +1,6 @@
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -What is lxfb?
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > -.. [This file is cloned from VesaFB/aty128fb]
> > -
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +lxfb - AMD Geode LX framebuffer driver
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =20
> >  This is a graphics framebuffer driver for AMD Geode LX based processor=
s.
> > =20
> > diff --git a/Documentation/fb/matroxfb.rst b/Documentation/fb/matroxfb.=
rst
> > index 6158c49c857148..34cafaa00bab19 100644
> > --- a/Documentation/fb/matroxfb.rst
> > +++ b/Documentation/fb/matroxfb.rst
> > @@ -1,9 +1,6 @@
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -What is matroxfb?
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > -.. [This file is cloned from VesaFB. Thanks go to Gerd Knorr]
> > -
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +matroxfb driver for Matrox devices
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Add a '-' after matroxfb
>=20
> > =20
> >  This is a driver for a graphic framebuffer for Matrox devices on
> >  Alpha, Intel and PPC boxes.
> > diff --git a/Documentation/fb/pvr2fb.rst b/Documentation/fb/pvr2fb.rst
> > index fcf2c21c8fcfeb..315ce085a5855b 100644
> > --- a/Documentation/fb/pvr2fb.rst
> > +++ b/Documentation/fb/pvr2fb.rst
> > @@ -1,6 +1,6 @@
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -What is pvr2fb?
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +pvr2fb - PowerVR 2 graphics frame buffer driver
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =20
> >  This is a driver for PowerVR 2 based graphics frame buffers, such as t=
he
> >  one found in the Dreamcast.
> > diff --git a/Documentation/fb/sa1100fb.rst b/Documentation/fb/sa1100fb.=
rst
> > index 67e2650e017d12..c5ca019b361a94 100644
> > --- a/Documentation/fb/sa1100fb.rst
> > +++ b/Documentation/fb/sa1100fb.rst
> > @@ -1,9 +1,6 @@
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -What is sa1100fb?
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > -.. [This file is cloned from VesaFB/matroxfb]
> > -
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > +sa1100fb - SA-1100 LCD graphic framebuffer driver
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > =20
> >  This is a driver for a graphic framebuffer for the SA-1100 LCD
> >  controller.
> > diff --git a/Documentation/fb/sisfb.rst b/Documentation/fb/sisfb.rst
> > index 8f4e502ea12ea7..9982f5ee05601b 100644
> > --- a/Documentation/fb/sisfb.rst
> > +++ b/Documentation/fb/sisfb.rst
> > @@ -1,6 +1,6 @@
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -What is sisfb?
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +sisfb - SiS framebuffer device driver
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =20
> >  sisfb is a framebuffer device driver for SiS (Silicon Integrated Syste=
ms)
> >  graphics chips. Supported are:
> > diff --git a/Documentation/fb/sm712fb.rst b/Documentation/fb/sm712fb.rst
> > index 8e000f80b5bc6d..abbc6efae25f46 100644
> > --- a/Documentation/fb/sm712fb.rst
> > +++ b/Documentation/fb/sm712fb.rst
> > @@ -1,6 +1,6 @@
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -What is sm712fb?
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +sm712fb - Silicon Motion SM712 graphics framebuffer driver
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =20
> >  This is a graphics framebuffer driver for Silicon Motion SM712 based p=
rocessors.
> > =20
> > diff --git a/Documentation/fb/tgafb.rst b/Documentation/fb/tgafb.rst
> > index 0c50d2134aa433..f0944da1ea5ef1 100644
> > --- a/Documentation/fb/tgafb.rst
> > +++ b/Documentation/fb/tgafb.rst
> > @@ -1,6 +1,6 @@
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -What is tgafb?
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +tgafb - TGA graphics framebuffer driver
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =20
> >  This is a driver for DECChip 21030 based graphics framebuffers, a.k.a.=
 TGA
> >  cards, which are usually found in older Digital Alpha systems. The
> > diff --git a/Documentation/fb/udlfb.rst b/Documentation/fb/udlfb.rst
> > index 99cfbb7a192238..9e75ac6b07c36a 100644
> > --- a/Documentation/fb/udlfb.rst
> > +++ b/Documentation/fb/udlfb.rst
> > @@ -1,6 +1,6 @@
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -What is udlfb?
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +udlfb - DisplayLink USB 2.0 driver
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =20
> >  This is a driver for DisplayLink USB 2.0 era graphics chips.
> > =20
> > diff --git a/Documentation/fb/vesafb.rst b/Documentation/fb/vesafb.rst
> > index f890a4f5623b45..5ffb35efd4538a 100644
> > --- a/Documentation/fb/vesafb.rst
> > +++ b/Documentation/fb/vesafb.rst
> > @@ -1,6 +1,6 @@
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -What is vesafb?
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Generic graphic framebuffer driver (vesafb)
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> vesafb - Generic graphic framebuffer driver
>=20

I'll apply your suggestions in v2.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--pyPpSPV0lzt8YzEF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaNEjPAAKCRD2uYlJVVFO
o0xBAPsF+0ID1n8HvR0EkLu/NKqM0MGLm6ptctFnkIuLD3On3wD2KyiCl8y52YFV
tV983e3Znmh0verqBnsd7h+R1jzQAA==
=h3sz
-----END PGP SIGNATURE-----

--pyPpSPV0lzt8YzEF--
