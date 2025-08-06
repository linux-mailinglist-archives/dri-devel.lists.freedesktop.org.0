Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0840AB1C503
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 13:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC2F10E3D0;
	Wed,  6 Aug 2025 11:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LJLJLzE0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F319610E3D0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 11:40:21 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3b786421e36so3740635f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 04:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754480420; x=1755085220;
 darn=lists.freedesktop.org; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XSGyJYGmgppKdW+VxJo4QN8FcNbtIB/YCjQ/boslr30=;
 b=LJLJLzE0+hiaeWoFB6GzVe/jaYxDB+jmEXU74B7IPuns2tvfGdlNncrWdLYjlF76VJ
 D/r9jEE+QxOr3y94ZzlH/cdpJ0KuV6Llb8yrYBkt0vGIPEcQyakIcn7MAH6fphO44UFE
 e0mcMYhS4cimk2UWfJUYJQ4Ccbdz5PmOEXBMl8UvispgdEzGpTpMBg3iFUJ10FueY1Eb
 W78r72shbeFfq7J//90swxxNZacyfY6HVTx1TZXtip3xn0EZxqjr4zkoTIj/NqvtoxXn
 C1/lbYdirOg3tDWGAcb7PebJXxQfPShq/r+lDY/3L7nzFLZzyMRQUSKPvtnpBQK4sILr
 gFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754480420; x=1755085220;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XSGyJYGmgppKdW+VxJo4QN8FcNbtIB/YCjQ/boslr30=;
 b=B73xbb0HaK+kJP0sme7McmGOldjU7gB1rh1LnDdWdk+mAcZGqz1xn2umZhxVMIax0T
 WQj3IH2J9qC4vIIWR3wDRM8y+I7g3GY1JT8gDfu1tf732ZaqXw1KEg621+5oCFkj22E+
 8EOvpxSfCzEYEMOAoaPKAbWgx8UhRBNOkeUoDjODSbKK9TFyV+UsXJF39FAULPBYfBAU
 AjXaKkK6+bxqzPzWiHf5H65uhZGS4g9X5uiYHfTC5/2UEvr69Luyg+v1rSxqVTsMDVnz
 FqAZ/fWjN6po1EPoKisbOTTdmu1/lRgeHxxW/at3UwmNCrQCq04Q2IDdjKQFjzaNmVcC
 0/Gw==
X-Gm-Message-State: AOJu0YwB7kjsnLNaimmRZEDJNy/PsDshsvsjResUvICMIFqumi9CyQB9
 zf3K8IBfX+1pALtGiuq+RrjBgYiRjTN1HUs5Xk5gL13y7fRTAohgXQjziX9yKrbJysk=
X-Gm-Gg: ASbGncvaP6QRLf9CRbWMNmCpU6jh+3ZWjZNBdYYsN4HoZx/kEbKOAmrvTAptDd+cJpq
 kh0zxBYiv9lR2CCtkXgN77YF7j3aR/XRtFEfzLGEA6xJkjbYIj//VZheMYGJEwvomxtrBgxzjvJ
 quVs3f+G4gWfmIFt3dRLXiEPuBNU4zbmpflCQD5il2O2A7uKBo7YJxCCevCFGJVt47lv28bqQ/b
 CkehgE5gIZ2pClUPy9AN8iGz3Ef7nrVn4aoO0IuGwaRsxId9T6xWnxA5+qCU8lZ4C9fiEiuKn+U
 O+ImqjAUvTvJoqLq/slacMTmxhhyPdbXlEF4jiYYp6cpUe5DdEIc+OBNNgAgE7Zog1TxKjPjouY
 XqSxOmypc/CrvL7QF1OInz3lTS7uOsDAxA5w5oXK8nhIumSHQcrESmf2HtauqeCse
X-Google-Smtp-Source: AGHT+IGaTSevp4cnPzYyR4KMtJUUTe8IypMzAYen+0KPkM2RtXUhgdyD50zhM6uWVvl65Hfeh3Bs/A==
X-Received: by 2002:a05:6000:1886:b0:3b7:8d80:e382 with SMTP id
 ffacd0b85a97d-3b8f41b269bmr2044590f8f.4.1754480420205; 
 Wed, 06 Aug 2025 04:40:20 -0700 (PDT)
Received: from localhost
 (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de.
 [2003:f6:5f06:ab04::1b9]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3ac51asm23244777f8f.1.2025.08.06.04.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 04:40:19 -0700 (PDT)
Date: Wed, 6 Aug 2025 13:40:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Subject: tilcdc reliably hits warning in
 drm_atomic_helper_crtc_duplicate_state() on BeagleBone black
Message-ID: <zctqvdcyzjzvi4fg2jhiwhb2m6jgzmote4haq5ov3rax5c2njq@nj7aij77twhf>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4s5ue6djf753yf64"
Content-Disposition: inline
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


--4s5ue6djf753yf64
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: tilcdc reliably hits warning in
 drm_atomic_helper_crtc_duplicate_state() on BeagleBone black
MIME-Version: 1.0

Hello,

running a plain Debian 6.16 kernel on a BeagleBone black board (with
nothing connected to the graphics output) I reliably hit:

[   91.228190] tilcdc 4830e000.lcdc: no encoders/connectors found
[   91.343877] ------------[ cut here ]------------
[   91.348862] WARNING: CPU: 0 PID: 325 at drivers/gpu/drm/drm_atomic_state_helper.c:174 drm_atomic_helper_crtc_duplicate_state+0x68/0x70 [drm_kms_helper]
[   91.363362] Modules linked in: tilcdc(+) stp llc drm_dma_helper omap_aes_driver omap_sham drm_client_lib omap_crypto crypto_engine drm_kms_helper omap_rng ti_am335x_adc kfifo_buf tps65218_pwrbutton industrialio at24 leds_gpio cpufreq_dt binfmt_misc drm configfs nfnetlink ip_tables x_tables autofs4 ext4 mbcache jbd2 crc32c_cryptoapi smsc crc16 davinci_mdio mdio_bitbang mdio_devres ti_cpsw_new cpsw_common of_mdio fixed_phy fwnode_mdio libphy mdio_bus sdhci_omap omap_hwspinlock sdhci_pltfm musb_dsps sdhci musb_hdrc omap_wdt udc_core phy_gmii_sel phy_am335x usbcore ti_am335x_tscadc tps65217 phy_am335x_control cppi41 phy_generic
[   91.421946] CPU: 0 UID: 0 PID: 325 Comm: (udev-worker) Not tainted 6.16-armmp #1 NONE  Debian 6.16-1~exp1
[   91.421984] Hardware name: Generic AM33XX (Flattened Device Tree)
[   91.422000] Call trace:
[   91.422021]  unwind_backtrace from show_stack+0x18/0x1c
[   91.422100]  show_stack from dump_stack_lvl+0x54/0x68
[   91.422160]  dump_stack_lvl from __warn+0x88/0x11c
[   91.422213]  __warn from warn_slowpath_fmt+0x188/0x194
[   91.422253]  warn_slowpath_fmt from drm_atomic_helper_crtc_duplicate_state+0x68/0x70 [drm_kms_helper]
[   91.422390]  drm_atomic_helper_crtc_duplicate_state [drm_kms_helper] from drm_atomic_get_crtc_state+0x70/0x110 [drm]
[   91.422829]  drm_atomic_get_crtc_state [drm] from drm_atomic_helper_disable_all+0x98/0x1d0 [drm_kms_helper]
[   91.423080]  drm_atomic_helper_disable_all [drm_kms_helper] from drm_atomic_helper_shutdown+0x98/0x150 [drm_kms_helper]
[   91.423193]  drm_atomic_helper_shutdown [drm_kms_helper] from tilcdc_fini+0x58/0xd0 [tilcdc]
[   91.423376]  tilcdc_fini [tilcdc] from tilcdc_init.constprop.0+0x1dc/0x60c [tilcdc]
[   91.423498]  tilcdc_init.constprop.0 [tilcdc] from tilcdc_pdev_probe+0x58/0xac [tilcdc]
[   91.423613]  tilcdc_pdev_probe [tilcdc] from platform_probe+0x64/0xbc
[   91.423703]  platform_probe from really_probe+0xd8/0x3ac
[   91.423741]  really_probe from __driver_probe_device+0x94/0x1e0
[   91.423774]  __driver_probe_device from driver_probe_device+0x38/0xd4
[   91.423806]  driver_probe_device from __driver_attach+0xc0/0x1b8
[   91.423837]  __driver_attach from bus_for_each_dev+0x84/0xd4
[   91.423868]  bus_for_each_dev from bus_add_driver+0xf8/0x21c
[   91.423896]  bus_add_driver from driver_register+0x88/0x124
[   91.423927]  driver_register from do_one_initcall+0x50/0x258
[   91.423960]  do_one_initcall from do_init_module+0x5c/0x254
[   91.423993]  do_init_module from init_module_from_file+0x9c/0xec
[   91.424022]  init_module_from_file from sys_finit_module+0x1d0/0x334
[   91.424052]  sys_finit_module from __sys_trace_return+0x0/0x10
[   91.424081] Exception stack(0xe0141fa8 to 0xe0141ff0)
[   91.424108] 1fa0:                   b56b8d73 00000000 0000001c b56bde10 00000004 02240ea0
[   91.424133] 1fc0: b56b8d73 00000000 69828600 0000017b 022392c0 0223e780 00000000 00000000
[   91.424151] 1fe0: bef00618 bef00608 b56b96e9 b6b13312
[   91.638906] ---[ end trace 0000000000000000 ]---
[   91.643839] tilcdc 4830e000.lcdc: [drm] *ERROR* Disabling all crtc's during unload failed with -12

during late boot.

The problem seems to be old, because 6.12 emits a very similar warning.

I didn't try to debug that, but if you have things to test, I can
probably do that.

Best regards
Uwe

--4s5ue6djf753yf64
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmiTPx8ACgkQj4D7WH0S
/k4SFggAua6MltTSOPxfDA8Y010L0Jb+OJR1rXK2kQTQy+FGIT/KrbkHA8Lsxb8G
XMqd2v1IgRARJJO1FPUhlW8IZjA6r/eN3KDiK5nAt1UUc5WNURVlEg2F7YwI/Jg/
tLyejWtLd8ilWUIoceBKHL0w+WgrvZ9Sfzyzp6XvRtrkoI+K2cOCmrboxSFSTpOR
w9afGrXVaa6jg7S11/Ji8N8lzkPJFhlboiLnUfjBOjNq3RLP7GPH8whdEEcXbEyj
YXBHvu16cPUhDlYWduR7ZRee1Prg6d8J7aF9Xdkef0DisOmyKI/ptrxd083sz4I8
3JOLC0iJFyoOE7wM+EKRS01phApGbA==
=9v3n
-----END PGP SIGNATURE-----

--4s5ue6djf753yf64--
