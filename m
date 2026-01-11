Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A79D0F9CB
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 19:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E736910E25F;
	Sun, 11 Jan 2026 18:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Z5hB/2E2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8463610E25F
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 18:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1768157952; x=1768762752; i=deller@gmx.de;
 bh=YD6qnOGS4BH6RHEjHTwhI+VFS3Q5J/BZ51yccOxceRE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Z5hB/2E2J2nAlsywBGtZTFDZW3XRM1vF0Lc3GtYh2I6UVe3ue2GmhGybxGNPbwKS
 GKpF3Jhzp7SBNLA0nfzVybRZVjJpzZ2fVPeR47CDMDrjKpe9hlIw+dtAOIjtxAbMe
 NLBS2fjTc2aQhHz2m7fTiuLpSyMD4aQaMmJO5l4pRTjzxzYXnhppUmCfKxDCw1EhY
 +MRfEbI9QTTxPXxIAj0z+ksdrTRh64we2sf+JHhrXaeojAJ1NA3CPa11cGtQfwsf5
 ukvpQmHERW/vxogAAT/C8w8H94DRxg4X0bnH0BH5v0BkCrY9jGXSzbLZdYjz9jqWh
 y9Bacn1Fu4jxXtmutQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.120]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwQXH-1vxEOb2UDt-00vrly; Sun, 11
 Jan 2026 19:59:12 +0100
Message-ID: <1adf55f0-3524-46e6-840b-d897c3f4dc9e@gmx.de>
Date: Sun, 11 Jan 2026 19:59:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] video/logo: allow custom boot logo and simplify
 logic
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-m68k@lists.linux-m68k.org
References: <20260108-custom-logo-v3-0-5a7aada7a6d4@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260108-custom-logo-v3-0-5a7aada7a6d4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JDzcJj4sr49ItHYapb5Q/AngnQkYMnF6soBQK2OT4D2d2deWhWG
 3elQUkoPE40nefmkuu1KbGlPfDXiCXvGCAmqH2a3AqnVCtk6xeZA0bEWGwqHsHquG78kgHM
 kL5Zbs5gG/hZLl0UkJv5sxtYx+FartNYPlyCAp5Sh6ssywDI734Gs+T565GXYRodNqAbaSV
 ticBhfu4wtrf/5VX9cd6g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TF+6AIAOhNM=;QKGMmxOQAGmIJMa+LCqwRllP1oz
 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
 iFI2b+2g=
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

On 1/8/26 20:04, Vincent Mailhol wrote:
> This series allows the user to replace the default kernel boot logo by
> a custom one directly in the kernel configuration. This makes it
> easier to customise the boot logo without the need to modify the
> sources and allows such customisation to remain persistent after
> applying the configuration to another version of the kernel.
>=20
> Patch #1 and #2 are clean-up and preparation while patch #3 is the
> main feature of this series: making the boot logo customisable.
>=20
> While working on this, I realised that managing the logo file directly
> in Kbuild allows us to simplify how we handle the different existing
> variants of the Tux logo. This series thus ends with a clean-up which
> moves all the logo selection logic to Kbuild except from one special
> case (details in the patch description), simplifying the Makefile and
> the C code.
>=20
> Patch #4 and #5 do a tree-wide clean-up on the Kconfig symbols that
> are to be removed in patch #7. Patch #6 removes the Macintosh 68k logo
> which is conflicting with our simplification plans. Patch #7 finally
> simplifies the logic as explained above.
>=20
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>

series applied to fbdev git tree.

Thanks!
Helge

> Changes in v3:
>=20
>    - v2 broke the logo selection for m68k resulting in the MAC logo
>      replacing the default logo on some machine where it shouldn't.
>      v3 resolves the conflict by removing that logo.
>=20
>    - Typo fix in patch #4 description.
>=20
> Link to v2: https://lore.kernel.org/r/20260101-custom-logo-v2-0-8eec06df=
bf85@kernel.org
>=20
> Changes in v2:
>=20
>    - By removing the logo_spe_clut224.o target from the Makefile, v1
>      also removed the logo_spe_clut224 object which is still being
>      referenced in
>=20
>        arch/powerpc/platforms/cell/spu_base.c
>=20
>      Restore the logo_spe_clut224.o target.
>=20
> Link to v1: https://lore.kernel.org/r/20251230-custom-logo-v1-0-47363745=
69ee@kernel.org
>=20
> ---
> Vincent Mailhol (7):
>        video/logo: remove orphan .pgm Makefile rule
>        video/logo: add a type parameter to the logo makefile function
>        video/logo: allow custom logo
>        newport_con: depend on LOGO_LINUX_CLUT224 instead of LOGO_SGI_CLU=
T224
>        sh: defconfig: remove CONFIG_LOGO_SUPERH_*
>        video/logo: remove logo_mac_clut224
>        video/logo: move logo selection logic to Kconfig
>=20
>   arch/sh/configs/dreamcast_defconfig      |    2 -
>   arch/sh/configs/ecovec24_defconfig       |    2 -
>   arch/sh/configs/kfr2r09_defconfig        |    2 -
>   arch/sh/configs/migor_defconfig          |    2 -
>   arch/sh/configs/rts7751r2d1_defconfig    |    2 -
>   arch/sh/configs/rts7751r2dplus_defconfig |    2 -
>   arch/sh/configs/se7724_defconfig         |    2 -
>   arch/sh/configs/se7780_defconfig         |    2 -
>   arch/sh/configs/sh7785lcr_defconfig      |    3 -
>   arch/sh/configs/urquell_defconfig        |    3 -
>   drivers/video/console/newport_con.c      |    4 +-
>   drivers/video/logo/Kconfig               |   82 +-
>   drivers/video/logo/Makefile              |   29 +-
>   drivers/video/logo/logo.c                |   46 +-
>   drivers/video/logo/logo_mac_clut224.ppm  | 1604 ----------------------=
=2D-------
>   include/linux/linux_logo.h               |    8 -
>   16 files changed, 63 insertions(+), 1732 deletions(-)
> ---
> base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
> change-id: 20251227-custom-logo-932df316a02c
>=20
> Best regards,

