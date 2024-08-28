Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAE39624DE
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 12:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6966D10E0BC;
	Wed, 28 Aug 2024 10:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="SA9veBoW";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="H7NSLpY8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B1C10E0BC
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 10:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1724840781; x=1756376781;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Knix3gTfsk7LSNTMHm5Va4lYcZn+o5QZz1keMxn7ZmU=;
 b=SA9veBoWKarc8US5sNZbst4KdfklCnFKYaLiVgtskvxpIBAVcbBOqAeR
 lRPFbbedCyvvCgMvI+0eZQX4oC9S/mX0VvzAwGRT3U1tAp0hfIoF/jSzb
 5ZjD/82TmVeEUMKsFju6zeyp89b3Ah/qs/sdj88eOobK+lsMTuInLfnFY
 sOJ/oFYVqWR6/UPKDWf+eLM0iicycVxlBScH5hFlP1v9QuZib2ooXxTbg
 m+ZiXvBQCZO42GMMc3Qssd+X5QZKLM2NAogpECABBCaep2gg9GyGqo9bK
 iqm79HhvYzoRMRRGe4n7PiNWadHCqwIKn441WJV5R3+jxppyKEZzyEepa w==;
X-CSE-ConnectionGUID: wgq9+zxRRT+2Ri6eXAu/Rw==
X-CSE-MsgGUID: 8Zt6dMMTStmGvyUoMy6LpQ==
X-IronPort-AV: E=Sophos;i="6.10,182,1719871200"; d="scan'208";a="38632945"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 28 Aug 2024 12:26:19 +0200
X-CheckPoint: {66CEFB49-C-E520F13A-D17B83D9}
X-MAIL-CPID: 45F1CF7BC257182E676DAD49BD8217F7_2
X-Control-Analysis: str=0001.0A782F29.66CEFB49.013F, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0B96E1653C2; Wed, 28 Aug 2024 12:26:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1724840773;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=Knix3gTfsk7LSNTMHm5Va4lYcZn+o5QZz1keMxn7ZmU=;
 b=H7NSLpY8I8UDVBrVgDJyy6p48SRovpQeWYq1lXWAHfWRCZAYrp4v7qc9y5cjntnHR+Y3ZR
 fv8NM7DtihQSxReLg8ZIIfoUTsAXdWj66x6jUNXugXEhglYZGHQ7SPyW36JFigMcctW96b
 CGvI+Q8TwvODWfoCx5OpaZwuL7Ia5MhfrvULkVVoz9IQ/a9Kj0Sy5Ku2tbqBqpqzlIOkX6
 NGu8SImgO7jelh5IpnVmVn81SZt3W4+/R76ia40aJpC5CC+wmn121Blt8T0mnliYa0LtJz
 4IcxvEKDJ+5S9aM610fntl7a4tiy83Ybx4/uxK0CQ7k/lDHxG+zOS06iyAfRVw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Subject: fbdev mmap regression since 'Merge v6.10-rc6 into drm-next'
Date: Wed, 28 Aug 2024 12:26:12 +0200
Message-ID: <23636953.6Emhk5qWAg@steina-w>
Organization: TQ-Systems GmbH
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hello,

I noticed that on linux-next one platform (TQMa6S imx6qdl-mba6.dtsi, using
i.MX6 Solo) I'm hitting SIGBUS errors when using fb-test on /dev/fb0.
strace shows:
> openat(AT_FDCWD, "/dev/fb0", O_RDWR|O_LARGEFILE) =3D 4
> ioctl(4, FBIOGET_VSCREENINFO, 0x4cb818) =3D 0
> ioctl(4, FBIOGET_FSCREENINFO, 0x4cb8b8) =3D 0
> write(1, "fb res 1920x1080 virtual 1920x10"..., 58fb res 1920x1080 virtual
> 1920x1080, line_len 3840, bpp 16 ) =3D 58
> mmap2(NULL, 4147200, PROT_READ|PROT_WRITE, MAP_SHARED, 4, 0) =3D 0xb6a940=
00
> --- SIGBUS {si_signo=3DSIGBUS, si_code=3DBUS_ADRERR, si_addr=3D0xb6a94000=
} ---
> +++ killed by SIGBUS (core dumped) +++

Using weston instead of fb-test works without issues.

I was able to track it down to commit 86634fa4e6aef ("Merge v6.10-rc6
into drm-next"). Unfortunately this is a merge and *both* bases are okay.

A requirement for this bug to trigger is having CMA area in Normal zone.
This automatically happens on systems with 512MiB RAM only:
> cma: Reserved 64 MiB at 0x2a800000 on node -1
>=20
> Zone ranges:
>   Normal   [mem 0x0000000010000000-0x000000002fffffff]
>   HighMem  empty

On different modules providing 1GiB RAM there is also a HighMem zone availa=
ble
which is used by default for CMA, unless the allocation explicitly specifie=
d.
In this case mmap works as expected. But even on modules having HighMem mmap
does not work when CMA is specified in Normal zone, refer to [1].=20

Despite the bisect I also tried the following commits directly, which
introduced the changes affecting the merge:
* d92a7580392ad ("drm/fbdev-dma: Only set smem_start is enable per module o=
ption")
* 808a40b694680 ("drm/fbdev-dma: Implement damage handling and deferred I/O=
")

But these commits by itself work as before. Cherry-picking d92a7580392ad on
top of 808a40b694680 already triggers the problem.
CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is unset, so I think commit d92a7580392ad
("drm/fbdev-dma: Only set smem_start is enable per module option") is
the culprit here.

How can this be fixed?

Best regards,
Alexander

[1] https://lore.kernel.org/all/20240827142458.265558-1-alexander.stein@ew.=
tq-group.com/
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


