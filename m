Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3496DA0D1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 21:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8680310ECA6;
	Thu,  6 Apr 2023 19:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.sf-mail.de (mail.sf-mail.de
 [IPv6:2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED09110ECA6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 19:15:16 +0000 (UTC)
Received: (qmail 22331 invoked from network); 6 Apr 2023 19:08:40 -0000
Received: from unknown ([2001:9e8:6dc6:3c00:76d4:35ff:feb7:be92]:48442 HELO
 eto.sf-tec.de) (auth=eike@sf-mail.de)
 by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted)
 ESMTPSA for <arnd@arndb.de>; Thu, 06 Apr 2023 21:08:40 +0200
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
To: arnd@arndb.de, daniel.vetter@ffwll.ch, deller@gmx.de, javierm@redhat.com,
 gregkh@linuxfoundation.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 12/18] arch/parisc: Implement fb_is_primary_device() under
 arch/parisc
Date: Thu, 06 Apr 2023 21:08:33 +0200
Message-ID: <5921681.lOV4Wx5bFT@eto.sf-tec.de>
In-Reply-To: <20230405150554.30540-13-tzimmermann@suse.de>
References: <20230405150554.30540-1-tzimmermann@suse.de>
 <20230405150554.30540-13-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4819412.31r3eYUQgx";
 micalg="pgp-sha1"; protocol="application/pgp-signature"
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart4819412.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Date: Thu, 06 Apr 2023 21:08:33 +0200
Message-ID: <5921681.lOV4Wx5bFT@eto.sf-tec.de>
In-Reply-To: <20230405150554.30540-13-tzimmermann@suse.de>

Am Mittwoch, 5. April 2023, 17:05:48 CEST schrieb Thomas Zimmermann:
> Move PARISC's implementation of fb_is_primary_device() into the
> architecture directory. This the place of the declaration and
> where other architectures implement this function. No functional
> changes.

> diff --git a/arch/parisc/video/fbdev.c b/arch/parisc/video/fbdev.c
> new file mode 100644
> index 000000000000..4a0ae08fc75b
> --- /dev/null
> +++ b/arch/parisc/video/fbdev.c
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2000 Philipp Rumpf <prumpf@tux.org>
> + * Copyright (C) 2001-2020 Helge Deller <deller@gmx.de>
> + * Copyright (C) 2001-2002 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> + */
> +
> +#include <linux/module.h>
> +
> +#include <asm/fb.h>
> +
> +#include <video/sticore.h>
> +
> +int fb_is_primary_device(struct fb_info *info)
> +{

Looking at this makes me wonder why the argument to all of these functions 
isn't const? Not your fault, but could be a candidate for patch #19?

Eike
--nextPart4819412.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCZC8YsQAKCRBcpIk+abn8
TroxAKCInC1+nDFT2zUZ2BABKO6rWJJXygCfXz1dtt8vvCEpTBZxHF+hSbDdIVk=
=5z1v
-----END PGP SIGNATURE-----

--nextPart4819412.31r3eYUQgx--



