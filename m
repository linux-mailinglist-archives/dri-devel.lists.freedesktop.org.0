Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A325A880CCC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 09:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE7210E7A4;
	Wed, 20 Mar 2024 08:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="YJXieyJr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6B010E00D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 08:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1710922360; x=1711527160; i=deller@gmx.de;
 bh=qi698Fr0cK/LGYkHXD/4rGactapeAbDOhymD1DLW/A0=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=YJXieyJruFzfF6yXeMG/LMaNhuXrfojPYvhJ9bKeGu5ARuhbCaP1/zwlfSsDEkSc
 /oCK0Zyc6/9LYZGL5eXbw24g6YHA703ja33yJCpLkYywtbNKGS/hy9x3wljaJK6ni
 9ZX7/NUpW/WybXzj2I64xKdU0/+apGafuSb9QrA2Jd+HrQmctwccqSOsW5IKDFMSf
 gHTctUbOGcgbPDmRtZXFBHdMLvNFDOWXHZzToEJASUCNRuXLr0S2LHS3RpBu3omaR
 dNsMczh3gOmULuayqFPaFI04JAMhLz4u0Rehp6A1jMuIvu8X6QEBNCdu1BgwIJ4Jl
 ot4jKB7RLhmCLHybeA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.145.175]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDysg-1rfC5E1Ieq-00A0yq; Wed, 20
 Mar 2024 09:12:40 +0100
Message-ID: <6cef8e77-dca8-4c8f-9af5-62586578609a@gmx.de>
Date: Wed, 20 Mar 2024 09:12:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] video: fbdev: panel-tpo-td043mtea1: Convert sprintf()
 family to sysfs_emit() family
Content-Language: en-US
To: Li Zhijian <lizhijian@fujitsu.com>, linux-kernel@vger.kernel.org
Cc: linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20240319092333.1590322-1-lizhijian@fujitsu.com>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240319092333.1590322-1-lizhijian@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DLWcJwmNZ97AysVmjGiBxzRfzOzprNYeT4qnhhw4Xji4rUuvAzV
 7J7beNhn9NVGOhZUH/mR+dccYsWTIkZTb0ChZK2h8c+J/vXnxoCBYjOt1FNx74rF6YhRL0U
 ylUbB4rmSlRnPe8qdx8Kwh25np6b+DgHnEdjRDENKL1qkJtsOXxtS8SlExalHQAa5aVLdTp
 cxCVi4xrFD20tlZ2ct14g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rXL+fvDm1co=;ZBP+SfNavm5a+fpFx63zYFa3BC+
 OrqwBCMFT1cuu8t2mA81YX38gjPRPNIfYqXileQLaQEhKUoSWbiJqkTx3AKJjX78e+W+LhkPR
 zVXYX0qJKWBLTK8qiwSh1HvXXbw0A537dARGLdugz74ZoIvyWnOv5wX3gzZ9jJucbZLgHdPnb
 yh5+oU+6/etSy2fVZQFnAEE9S9xZv563K9Kht+zw+nD2RXC0E3hyBEMv4CljigWPU7yKmrXb4
 Oc9ABkOZorhfHwksDvbLvLpUcUNJtIJPWGPn+zhLFIdCzax32WXfu/z/MT0wmlgnqxSCpwNTe
 kKAITUVVmNACKxtOhh/3X0B1dqggCq85LeXJGUpz4Jgrw0dD1zbCFt3lDLBraLsmn6NcCzRk/
 nqI8YsAHqX+ldUS06ltdd31xCia+ra0XrZmicz/v3t4qxv6vW/LDr9hwMZ4VVxrwtcBApN35F
 tLDJy428LSW8UiboN5IVTniKhOOxrvmswHsY0idJso5tZsQleSHDTe87ybc3ibTOp0i7Otfso
 BxnF21XYPVNYgfoQZVPETxR97re/t2N1+SaPeBpy3WaUFL9Qx1vdo7RbHQ776Rm/QOlpAdFmd
 /GJDlZTZllGokzRFeGXljPlxsSAEFKhowTiZzhA0Mr/mxJL3RTfQD+2PcX53bPlo0W9NsWkKC
 /qw/GM2CiB+vbguBLbmc0ksUz4ULmVmty3Ru87gYt6dPcJ3FLShy6BEQJomYyGyvKMvbODyH3
 gLvkouADIqtog5zUTJbPs8CYQv955JNOLaJlp8dCfHXkxxpmM1893QTFAHA0o/jVBAbdUfCX8
 POIU6mv4I12EkgyWCBHycFIEVaUFs2Ri3vJvZf1SFPPLk=
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

On 3/19/24 10:23, Li Zhijian wrote:
> Per filesystems/sysfs.rst, show() should only use sysfs_emit()
> or sysfs_emit_at() when formatting the value to be returned to user spac=
e.
>
> coccinelle complains that there are still a couple of functions that use
> snprintf(). Convert them to sysfs_emit().
>
> sprintf() and scnprintf() will be converted as well if they have.
>
> Generally, this patch is generated by
> make coccicheck M=3D<path/to/file> MODE=3Dpatch \
> COCCI=3Dscripts/coccinelle/api/device_attr_show.cocci
>
> No functional change intended
>
> CC: Helge Deller <deller@gmx.de>
> CC: linux-omap@vger.kernel.org
> CC: linux-fbdev@vger.kernel.org
> CC: dri-devel@lists.freedesktop.org
> Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>

applied to fbdev git tree.
Thanks!
Helge

> ---
> V3:
>     split it from a mess of drm,fbdev, becuase they are not the same sub=
system.
>
> V2:
>     Fix missing '+' before '=3D' in drivers/video/fbdev/omap2/omapfb/dis=
plays/panel-tpo-td043mtea1.c
>
> This is a part of the work "Fix coccicheck device_attr_show warnings"[1]
> Split them per subsystem so that the maintainer can review it easily
> [1] https://lore.kernel.org/lkml/20240116041129.3937800-1-lizhijian@fuji=
tsu.com/
> ---
>   .../omap2/omapfb/displays/panel-tpo-td043mtea1.c     | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mt=
ea1.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
> index 477789cff8e0..3624452e1dd0 100644
> --- a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
> +++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.c
> @@ -228,14 +228,10 @@ static ssize_t tpo_td043_gamma_show(struct device =
*dev,
>   	int ret;
>   	int i;
>
> -	for (i =3D 0; i < ARRAY_SIZE(ddata->gamma); i++) {
> -		ret =3D snprintf(buf + len, PAGE_SIZE - len, "%u ",
> -				ddata->gamma[i]);
> -		if (ret < 0)
> -			return ret;
> -		len +=3D ret;
> -	}
> -	buf[len - 1] =3D '\n';
> +	for (i =3D 0; i < ARRAY_SIZE(ddata->gamma); i++)
> +		len +=3D sysfs_emit_at(buf, len, "%u ", ddata->gamma[i]);
> +	if (len)
> +		buf[len - 1] =3D '\n';
>
>   	return len;
>   }

