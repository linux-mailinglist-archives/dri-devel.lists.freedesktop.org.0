Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 531F099378D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 21:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD25310E414;
	Mon,  7 Oct 2024 19:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="R5+QuSma";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE6B10E414
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 19:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1728330291; x=1728935091; i=deller@gmx.de;
 bh=mALG0FCZdA9fk6IIVMAR1eyUmLvOK5fpSTSX/envIYU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=R5+QuSmaKcfG55Lh3rqlRffPHH3BVYBYrtDktZTweP74bm36zoFUaIAlMg3lvEi9
 d2uC+QEOnlTdmb9BlM1IhgMGuCCicvAE2KKueIPQANvDPXL/v2Z+BUDpIGYiDR5iS
 fPx+F0s9swcxPKilMv3WBEg9p7hcsiuNm14kqNk2gV2U9qRxFsuddkMVEN/ZMSblg
 tUZn1Z0onPIbdZ9STaX7BQ4zXswSrB5A3OpiZmzxS0vSi8i+PPKq+zgCRauWD8R3/
 Ftxe2MRPCEcfIr3UvGxSJWijSNXhcWs3EqvQK+YG3Bl1BMNcKHaWpPWHv+LdNlw1d
 t3RMmg9CwrWOg2f8AA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlf4c-1tgXrt1TgA-00o1Xx; Mon, 07
 Oct 2024 21:44:51 +0200
Message-ID: <12bbc163-10fe-496c-845e-11220f6abc83@gmx.de>
Date: Mon, 7 Oct 2024 21:44:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20241007163516.433885-2-u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241007163516.433885-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Jxf5eObjRMahX6ux+ZKFDmPXGb3ITogUcbBETjXqd5hKA3mwJI1
 3uqqn3dXn20y4fSyKW00gB8w4MVoDXfT/bpjnZ/ONr/qvkUdpgVjPhp/r3wrP6tfrc3rHDN
 WkHbCHHRRb7k8KEoe56ncGkGLbrAT+hz5ZFjxR+L68ZzYOkTyAVTB1S8ptLqEj2GiBmr0vP
 fgPaLrB1+6hmNc61R9XxA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aSEBqU7/GPM=;YOzDAO1PJS3THoYVQ6Oa4fAXS3h
 ONuSkKDdKYMQwpCNDWgLa4+Y0W6uVOmMzeQRX9bkZh/JhNOvqvlY1cJ0GKx7HHYoMdntU0dUt
 Vpyjv8xUHCZAab6YRsS0XEz9agugBQYo79VTx1ipFyYPV/AsPt5NeeoIvaisO4W7zEG4XNiCs
 i+Npf9tWZEiGbQ86BSeLG6TyrsBGtkQdod2e2JTzCN6k0m0B25TVcSfo4FCek/9UOx6rQGFPJ
 1Tq81ETnqKI3tCFhSBzc1+Rrl4dkWi2eV5aKFqdYrNC0ZGlg2UKOyiAC9K51SDklZfOwCtaZ1
 69RB/qaldaoVNcLb7THHbrGmylRhy8bOrue9ZKFYfBHT5v/DXTZbIPpxQhO2VESyaKHNsAsYX
 kzQnjYUrykwyFjEuiDRADCqcfxd6UZQZHxzu5huxdpm/x0Pm+q9pOtNUaBaw2ps12Ew7tL9Ri
 ruWtn5m3kJESudS59rGxwK+8kcxfBkR4cWKU/icvGaR3gzk3K4kTpvOsO0cb4PteruZ20ktTz
 YWyfV2RG55CvO4KKoI/RRYsD04o57B9TgJKBXilIuY/JebmuhFzk7eTZ++fKIe5M4+zASGe7W
 GlqCD4bqcRzQFgNLFh+zk5yvhbRXMm9myHE/Pcw93xGaJcQggKu5zp3C81QHxThE6zwTlPEZc
 ttyW29mRkqCTWafBPkXLL6viNBgO4AKPxCHhP6Shd0Nrn01L1+w9v78spl33O65Y53L0QUnnt
 mT8a9m2rCz5DxK070/WKKrXPRZHwS9GCT7Qls3kEHtg+NtAtPQwNHo+cR8x5RDlwdMlw1ZSlF
 WsSPSzU+GeWiMuSuB+hyBbgw==
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

Hi Uwe,

On 10/7/24 18:35, Uwe Kleine-K=C3=B6nig wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>
> Convert all platform drivers below drivers/dma after the previous
> conversion commits apart from the wireless drivers to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
>
> While touching these files, make indention of the struct initializer
> consistent in several files.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>
> given the simplicity of the individual changes I do this all in a single
> patch. I you don't agree, please tell and I will happily split it.

I'm not a fan of everything in one patch since it makes backporting
other patches complicated. But in this case I think we should keep it
simple by using one patch.

> It's based on Friday's next, feel free to drop changes that result in a
> conflict when you come around to apply this. I'll care for the fallout
> at a later time then. (Having said that, if you use b4 am -3 and git am
> -3, there should be hardly any conflict.)

Patch applied cleanly.

> Note I didn't Cc: all the individual driver maintainers to not trigger
> sending limits and spam filters.

I think that's ok.

I've added your patch as-is to the fbdev for-next git tree to
check for possible errors.
Let's monitor it a few days, then I suppose we should push it upstream.

Thanks!
Helge

>
> Best regards
> Uwe
>
>   drivers/video/fbdev/amifb.c                               | 4 ++--
>   drivers/video/fbdev/arcfb.c                               | 2 +-
>   drivers/video/fbdev/atmel_lcdfb.c                         | 2 +-
>   drivers/video/fbdev/au1100fb.c                            | 2 +-
>   drivers/video/fbdev/au1200fb.c                            | 2 +-
>   drivers/video/fbdev/broadsheetfb.c                        | 2 +-
>   drivers/video/fbdev/bw2.c                                 | 2 +-
>   drivers/video/fbdev/cg14.c                                | 2 +-
>   drivers/video/fbdev/cg3.c                                 | 2 +-
>   drivers/video/fbdev/cg6.c                                 | 2 +-
>   drivers/video/fbdev/clps711x-fb.c                         | 2 +-
>   drivers/video/fbdev/cobalt_lcdfb.c                        | 2 +-
>   drivers/video/fbdev/da8xx-fb.c                            | 2 +-
>   drivers/video/fbdev/ep93xx-fb.c                           | 2 +-
>   drivers/video/fbdev/ffb.c                                 | 2 +-
>   drivers/video/fbdev/fsl-diu-fb.c                          | 6 +++---
>   drivers/video/fbdev/gbefb.c                               | 6 +++---
>   drivers/video/fbdev/goldfishfb.c                          | 2 +-
>   drivers/video/fbdev/grvga.c                               | 2 +-
>   drivers/video/fbdev/hecubafb.c                            | 2 +-
>   drivers/video/fbdev/hgafb.c                               | 2 +-
>   drivers/video/fbdev/hitfb.c                               | 2 +-
>   drivers/video/fbdev/imxfb.c                               | 2 +-
>   drivers/video/fbdev/leo.c                                 | 2 +-
>   drivers/video/fbdev/mb862xx/mb862xxfbdrv.c                | 2 +-
>   drivers/video/fbdev/metronomefb.c                         | 2 +-
>   drivers/video/fbdev/ocfb.c                                | 2 +-
>   drivers/video/fbdev/offb.c                                | 4 ++--
>   drivers/video/fbdev/omap/omapfb_main.c                    | 2 +-
>   .../fbdev/omap2/omapfb/displays/connector-analog-tv.c     | 2 +-
>   drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c | 2 +-
>   .../video/fbdev/omap2/omapfb/displays/connector-hdmi.c    | 2 +-
>   .../video/fbdev/omap2/omapfb/displays/encoder-opa362.c    | 2 +-
>   .../video/fbdev/omap2/omapfb/displays/encoder-tfp410.c    | 2 +-
>   .../video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.c | 2 +-
>   drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c     | 2 +-
>   drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c  | 2 +-
>   .../fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c | 2 +-
>   drivers/video/fbdev/omap2/omapfb/dss/core.c               | 6 +++---
>   drivers/video/fbdev/omap2/omapfb/dss/dispc.c              | 2 +-
>   drivers/video/fbdev/omap2/omapfb/dss/dpi.c                | 4 ++--
>   drivers/video/fbdev/omap2/omapfb/dss/dsi.c                | 2 +-
>   drivers/video/fbdev/omap2/omapfb/dss/dss.c                | 2 +-
>   drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c              | 6 +++---
>   drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c              | 2 +-
>   drivers/video/fbdev/omap2/omapfb/dss/sdi.c                | 6 +++---
>   drivers/video/fbdev/omap2/omapfb/dss/venc.c               | 6 +++---
>   drivers/video/fbdev/omap2/omapfb/omapfb-main.c            | 2 +-
>   drivers/video/fbdev/p9100.c                               | 2 +-
>   drivers/video/fbdev/platinumfb.c                          | 2 +-
>   drivers/video/fbdev/pxa168fb.c                            | 2 +-
>   drivers/video/fbdev/pxa3xx-gcu.c                          | 8 ++++----
>   drivers/video/fbdev/pxafb.c                               | 2 +-
>   drivers/video/fbdev/s1d13xxxfb.c                          | 2 +-
>   drivers/video/fbdev/s3c-fb.c                              | 2 +-
>   drivers/video/fbdev/sh7760fb.c                            | 2 +-
>   drivers/video/fbdev/sh_mobile_lcdcfb.c                    | 2 +-
>   drivers/video/fbdev/simplefb.c                            | 2 +-
>   drivers/video/fbdev/sm501fb.c                             | 2 +-
>   drivers/video/fbdev/tcx.c                                 | 2 +-
>   drivers/video/fbdev/uvesafb.c                             | 2 +-
>   drivers/video/fbdev/vesafb.c                              | 2 +-
>   drivers/video/fbdev/vfb.c                                 | 2 +-
>   drivers/video/fbdev/vga16fb.c                             | 2 +-
>   drivers/video/fbdev/via/via-gpio.c                        | 2 +-
>   drivers/video/fbdev/via/via_i2c.c                         | 2 +-
>   drivers/video/fbdev/vt8500lcdfb.c                         | 2 +-
>   drivers/video/fbdev/wm8505fb.c                            | 2 +-
>   drivers/video/fbdev/wmt_ge_rops.c                         | 2 +-
>   drivers/video/fbdev/xilinxfb.c                            | 2 +-
>   70 files changed, 88 insertions(+), 88 deletions(-)
>
> diff --git a/drivers/video/fbdev/amifb.c b/drivers/video/fbdev/amifb.c
> index 132638240521..1116a0789ca4 100644
> --- a/drivers/video/fbdev/amifb.c
> +++ b/drivers/video/fbdev/amifb.c
> @@ -3774,8 +3774,8 @@ static void __exit amifb_remove(struct platform_de=
vice *pdev)
>    * triggers a section mismatch warning.
>    */
>   static struct platform_driver amifb_driver __refdata =3D {
> -	.remove_new =3D __exit_p(amifb_remove),
> -	.driver   =3D {
> +	.remove =3D __exit_p(amifb_remove),
> +	.driver =3D {
>   		.name	=3D "amiga-video",
>   	},
>...

