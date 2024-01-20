Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08828333E2
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jan 2024 12:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C5710E26E;
	Sat, 20 Jan 2024 11:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E9010E249
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 11:26:46 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6d9b37f4804so1708534b3a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 03:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705749942; x=1706354742; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KgsgmfAUCsUK7bv60DL+YeJq8JarB9xRbUnaqW3K3n4=;
 b=mPBH/15cVq8RC7AY4RmuLy2Bb0uqsVhNUVKDRMLvtLZSKwvTcVIX++vCCHKSmWsstQ
 vN2QApIBamFLVfd8hOn+YIzitr/48/lhNPNwGaxjz/65tZw3+0GiLVl+1c8ypkvihDzd
 SA/BN7Yy63fa5pp2tsXNizTfCGeVsbJs4GD1ZGgGUOx+N7/6Od8jGmtoomKvttGHhnfs
 QmAWXuJmrw6FMwEIVJ8HKgFrQcxlGhGstAN614Wh6G/s/vOb+zVWufVHNTsQCpRx77kA
 dKEwC/vzeq0kdXibSLHsQKf1SIzFrOealTHirMZEcHUwVwbsuck0gOoPED2G1wQdZZtV
 bblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705749942; x=1706354742;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KgsgmfAUCsUK7bv60DL+YeJq8JarB9xRbUnaqW3K3n4=;
 b=hk+0TQZoIfjKNprYsQZT428aDJiRvgnvKSD15oNRF6Y1SCfAsQI2m76sFTdxBO1foS
 jslETNTZPGE8dXH/S692PLZHoaTFb3rf8OogIHiFtvG7HpPG09xuBb6KcQIqUaNX3Wp7
 W5uzM1WfX683msi1ijK2z1wFcoIAVtRROAtejra+UMbs9qJcjU7KwjVJaaUHbmKa+C0j
 40K2vWNO5wpUSo6acVLsHND766LUPymmyNLowlg+2PE6Tvvob0S9DIOquK9PwrvKVZ8L
 xiV8EwJsK3ZZ1GqbJ2pzmzyX7GUqKvASppS9i7wOEHx6sbhykKrl2smlOzQXRJ7GSqqT
 YK0A==
X-Gm-Message-State: AOJu0Yz5mjcjJ8EYp4wS2GpUQ812Wn7tk0f7EAiqdhz3IBVwEIYvIZQF
 vuQHZi9txcqVFEVGJIE3AXZY7l97l/Ait7ztzoJbrUuZP6wlB2ZP
X-Google-Smtp-Source: AGHT+IGczytrLQQdYDK7kvLhiVSmKYX9mhpfTIBfzwvIUl99cMSETuw33MUFEt9naz8OE72mObfRxQ==
X-Received: by 2002:a05:6a21:32a8:b0:199:fe49:6bb3 with SMTP id
 yt40-20020a056a2132a800b00199fe496bb3mr1684368pzb.5.1705749941592; 
 Sat, 20 Jan 2024 03:25:41 -0800 (PST)
Received: from archie.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 kr8-20020a056a004b4800b006da73b90fe4sm6790103pfb.14.2024.01.20.03.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jan 2024 03:25:40 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 121831846DB12; Sat, 20 Jan 2024 18:25:36 +0700 (WIB)
Date: Sat, 20 Jan 2024 18:25:36 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [BUG][BISECTED] Freeze at loading init ramdisk
Message-ID: <ZautsJ6a7_YjW5aQ@archie.me>
References: <8a6aa228-f2da-4dcd-93c1-e34614cd6471@alu.unizg.hr>
 <cc813525-5484-443e-a40a-cb98f2ed4e1f@alu.unizg.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Vv+fIX42qDF80RtH"
Content-Disposition: inline
In-Reply-To: <cc813525-5484-443e-a40a-cb98f2ed4e1f@alu.unizg.hr>
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
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Prathu Baronia <prathubaronia2011@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Vv+fIX42qDF80RtH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 07:47:49PM +0100, Mirsad Todorovac wrote:
> On 1/16/24 01:32, Mirsad Todorovac wrote:
> > Hi,
> >=20
> > On the Ubuntu 22.04 LTS Jammy platform, on a mainline vanilla torvalds =
tree kernel, the boot
> > freezes upon first two lines and before any systemd messages.
> >=20
> > (Please find the config attached.)
> >=20
> > Bisecting the bug led to this result:
> >=20
> > marvin@defiant:~/linux/kernel/linux_torvalds$ git bisect good
> > d97a78423c33f68ca6543de510a409167baed6f5 is the first bad commit
> > commit d97a78423c33f68ca6543de510a409167baed6f5
> > Merge: 61da593f4458 689237ab37c5
> > Author: Linus Torvalds <torvalds@linux-foundation.org>
> > Date:=C2=A0=C2=A0 Fri Jan 12 14:38:08 2024 -0800
> >=20
> >  =C2=A0=C2=A0=C2=A0 Merge tag 'fbdev-for-6.8-rc1' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/deller/linux-fbdev
> >  =C2=A0=C2=A0=C2=A0 Pull fbdev updates from Helge Deller:
> >  =C2=A0=C2=A0=C2=A0=C2=A0 "Three fbdev drivers (~8500 lines of code) re=
moved. The Carillo Ranch
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev driver is for an Intel product wh=
ich was never shipped, and for
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the intelfb and the amba-clcd drivers t=
he drm drivers can be used
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 instead.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The other code changes are minor: some =
fb_deferred_io flushing fixes,
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 imxfb margin fixes and stifb cleanups.
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Summary:
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Remove intelfb fbdev driver (Th=
omas Zimmermann)
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Remove amba-clcd fbdev driver (=
Linus Walleij)
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Remove vmlfb Carillo Ranch fbde=
v driver (Matthew Wilcox)
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - fb_deferred_io flushing fixes (=
Nam Cao)
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - imxfb code fixes and cleanups (=
Dario Binacchi)
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - stifb primary screen detection =
cleanups (Thomas Zimmermann)"
> >  =C2=A0=C2=A0=C2=A0 * tag 'fbdev-for-6.8-rc1' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/deller/linux-fbdev: (28 commits)
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev/intelfb: Remove driver
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev/hyperv_fb: Do not clear global sc=
reen_info
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 firmware/sysfb: Clear screen_info state=
 after consuming it
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev/hyperv_fb: Remove firmware frameb=
uffers with aperture helpers
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/hyperv: Remove firmware framebuffer=
s with aperture helper
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev/sis: Remove dependency on screen_=
info
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 video/logo: use %u format specifier for=
 unsigned int values
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 video/sticore: Remove info field from S=
TI struct
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch/parisc: Detect primary video devic=
e from device instance
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev/stifb: Allocate fb_info instance =
with framebuffer_alloc()
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 video/sticore: Store ROM device in STI =
struct
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev: flush deferred IO before closing
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev: flush deferred work in fb_deferr=
ed_io_fsync()
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev: amba-clcd: Delete the old CLCD d=
river
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev: Remove support for Carillo Ranch=
 driver
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev: hgafb: fix kernel-doc comments
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev: mmp: Fix typo and wording in cod=
e comment
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev: fsl-diu-fb: Fix sparse warning d=
ue to virt_to_phys() prototype change
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev: imxfb: add '*/' on a separate li=
ne in block comment
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev: imxfb: use __func__ for function=
 name
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
> >=20
> >  =C2=A0Documentation/fb/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 -
> >  =C2=A0Documentation/fb/intelfb.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 155 --
> >  =C2=A0Documentation/userspace-api/ioctl/ioctl-number.rst |=C2=A0=C2=A0=
=C2=A0 1 -
> >  =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 12 -
> >  =C2=A0arch/parisc/video/fbdev.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +-
> >  =C2=A0drivers/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0=C2=A0 3 +-
> >  =C2=A0drivers/firmware/sysfb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 14 +-
> >  =C2=A0drivers/gpu/drm/hyperv/hyperv_drm_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 8 +-
> >  =C2=A0drivers/video/backlight/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0=C2=A0 7 -
> >  =C2=A0drivers/video/backlight/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0 1 -
> >  =C2=A0drivers/video/backlight/cr_bllcd.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
264 ---
> >  =C2=A0drivers/video/fbdev/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 72 -
> >  =C2=A0drivers/video/fbdev/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 -
> >  =C2=A0drivers/video/fbdev/amba-clcd.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 986 ---------
> >  =C2=A0drivers/video/fbdev/core/fb_defio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0 8 +-
> >  =C2=A0drivers/video/fbdev/fsl-diu-fb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0 2 +-
> >  =C2=A0drivers/video/fbdev/hgafb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 13 +-
> >  =C2=A0drivers/video/fbdev/hyperv_fb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 20 +-
> >  =C2=A0drivers/video/fbdev/imxfb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 179 +-
> >  =C2=A0drivers/video/fbdev/intelfb/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0 8 -
> >  =C2=A0drivers/video/fbdev/intelfb/intelfb.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 382 ----
> >  =C2=A0drivers/video/fbdev/intelfb/intelfb_i2c.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 209 --
> >  =C2=A0drivers/video/fbdev/intelfb/intelfbdrv.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1680 ----------------
> >  =C2=A0drivers/video/fbdev/intelfb/intelfbhw.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2115 --------------------
> >  =C2=A0drivers/video/fbdev/intelfb/intelfbhw.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 609 ------
> >  =C2=A0drivers/video/fbdev/mmp/hw/mmp_spi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0 2 +-
> >  =C2=A0drivers/video/fbdev/sis/sis_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 37 -
> >  =C2=A0drivers/video/fbdev/stifb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 109 +-
> >  =C2=A0drivers/video/fbdev/vermilion/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 6 -
> >  =C2=A0drivers/video/fbdev/vermilion/cr_pll.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 195 --
> >  =C2=A0drivers/video/fbdev/vermilion/vermilion.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1175 -----------
> >  =C2=A0drivers/video/fbdev/vermilion/vermilion.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 245 ---
> >  =C2=A0drivers/video/logo/pnmtologo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 6 +-
> >  =C2=A0drivers/video/sticore.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 5 +
> >  =C2=A0include/linux/amba/clcd-regs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 87 -
> >  =C2=A0include/linux/amba/clcd.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 290 ---
> >  =C2=A0include/video/sticore.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 6 +-
> >  =C2=A037 files changed, 208 insertions(+), 8708 deletions(-)
> >  =C2=A0delete mode 100644 Documentation/fb/intelfb.rst
> >  =C2=A0delete mode 100644 drivers/video/backlight/cr_bllcd.c
> >  =C2=A0delete mode 100644 drivers/video/fbdev/amba-clcd.c
> >  =C2=A0delete mode 100644 drivers/video/fbdev/intelfb/Makefile
> >  =C2=A0delete mode 100644 drivers/video/fbdev/intelfb/intelfb.h
> >  =C2=A0delete mode 100644 drivers/video/fbdev/intelfb/intelfb_i2c.c
> >  =C2=A0delete mode 100644 drivers/video/fbdev/intelfb/intelfbdrv.c
> >  =C2=A0delete mode 100644 drivers/video/fbdev/intelfb/intelfbhw.c
> >  =C2=A0delete mode 100644 drivers/video/fbdev/intelfb/intelfbhw.h
> >  =C2=A0delete mode 100644 drivers/video/fbdev/vermilion/Makefile
> >  =C2=A0delete mode 100644 drivers/video/fbdev/vermilion/cr_pll.c
> >  =C2=A0delete mode 100644 drivers/video/fbdev/vermilion/vermilion.c
> >  =C2=A0delete mode 100644 drivers/video/fbdev/vermilion/vermilion.h
> >  =C2=A0delete mode 100644 include/linux/amba/clcd-regs.h
> >  =C2=A0delete mode 100644 include/linux/amba/clcd.h
> > marvin@defiant:~/linux/kernel/linux_torvalds$
> >=20
> > Hope this helps.
>=20
> P.S.
>=20
> As I see that this is a larger merge commit, with 5K+ lines changed, I do=
n't think I can
> bisect further to determine the culprit.
>=20
> But I thought later that it would be interesting to see why my hardware t=
riggered the freeze
> and probably others did not, or someone would complain already.
>=20
> Both of the boxes were AMD Ryzen: Ryzen 7 5700G and Ryzen 9 7950X.
>=20
> FWIW, I am attaching both hardware listings and the config used, so anyon=
e knowledgeable with
> fbdev could possibly narrow down the search.
>=20

Hi Mirsad,

There is another report from Jens with similar symptom [1]. Can you check if
reverting df67699c9cb0ce ("firmware/sysfb: Clear screen_info state after
consuming it") fixes your regression?

Thanks.

[1]: https://lore.kernel.org/regressions/93ffd2ee-fa83-4469-96fb-fb263c26bb=
3c@kernel.dk/T/#t


--=20
An old man doll... just what I always wanted! - Clara

--Vv+fIX42qDF80RtH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZautrAAKCRD2uYlJVVFO
o29YAP4qDU6M19ID/p65u1gtfVijgmVI7LdZfaouoZtKiSp6qQD+PnHhjXp+whKs
mfJNPqyLT46rJgrGbCanMlqNG7BeuAA=
=iFmQ
-----END PGP SIGNATURE-----

--Vv+fIX42qDF80RtH--
