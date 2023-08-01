Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA3276B30F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 13:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6FC10E3BC;
	Tue,  1 Aug 2023 11:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FA210E3BC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 11:22:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83E3B6154C;
 Tue,  1 Aug 2023 11:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD8BC433C8;
 Tue,  1 Aug 2023 11:22:48 +0000 (UTC)
Message-ID: <ee03c6c9-4e6a-2732-0416-43fd5418c950@xs4all.nl>
Date: Tue, 1 Aug 2023 13:22:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 01/47] media/vivid: Use fbdev I/O helpers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 javierm@redhat.com, sam@ravnborg.org
References: <20230801101541.900-1-tzimmermann@suse.de>
 <20230801101541.900-2-tzimmermann@suse.de>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230801101541.900-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 kvm@vger.kernel.org, linux-geode@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/08/2023 12:13, Thomas Zimmermann wrote:
> Set struct fb_ops and with FB_DEFAULT_IO_OPS, fbdev's initializer
> for I/O memory. Sets the callbacks to the cfb_ and fb_io_ functions.
> Select the correct modules with Kconfig's FB_IO_HELPERS token.
> 
> The macro and token set the currently selected values, so there is
> no functional change.
> 
> v2:
> 	* updated to use _IOMEM_ tokens
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Acked-by: Helge Deller <deller@gmx.de>
> Cc: Hans Verkuil <hverkuil@xs4all.nl>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  drivers/media/test-drivers/vivid/Kconfig     | 4 +---
>  drivers/media/test-drivers/vivid/vivid-osd.c | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vivid/Kconfig b/drivers/media/test-drivers/vivid/Kconfig
> index 318799d317ba..5b08a5ad291e 100644
> --- a/drivers/media/test-drivers/vivid/Kconfig
> +++ b/drivers/media/test-drivers/vivid/Kconfig
> @@ -3,11 +3,9 @@ config VIDEO_VIVID
>  	tristate "Virtual Video Test Driver"
>  	depends on VIDEO_DEV && !SPARC32 && !SPARC64 && FB
>  	depends on HAS_DMA
> +	select FB_IOMEM_HELPERS
>  	select FONT_SUPPORT
>  	select FONT_8x16
> -	select FB_CFB_FILLRECT
> -	select FB_CFB_COPYAREA
> -	select FB_CFB_IMAGEBLIT
>  	select VIDEOBUF2_VMALLOC
>  	select VIDEOBUF2_DMA_CONTIG
>  	select VIDEO_V4L2_TPG
> diff --git a/drivers/media/test-drivers/vivid/vivid-osd.c b/drivers/media/test-drivers/vivid/vivid-osd.c
> index 051f1805a16d..5c931b94a7b5 100644
> --- a/drivers/media/test-drivers/vivid/vivid-osd.c
> +++ b/drivers/media/test-drivers/vivid/vivid-osd.c
> @@ -246,12 +246,10 @@ static int vivid_fb_blank(int blank_mode, struct fb_info *info)
>  
>  static const struct fb_ops vivid_fb_ops = {
>  	.owner = THIS_MODULE,
> +	FB_DEFAULT_IOMEM_OPS,

This macro also sets fb_read and fb_write ops here, in addition to the
cfb_* ops, based on this patch:

https://lore.kernel.org/all/20230729193157.15446-2-tzimmermann@suse.de/#Z2e.:20230729193157.15446-2-tzimmermann::40suse.de:1include:linux:fb.h

But those two ops were never set in this driver before.

It's been ages since I last worked with this, so I can't tell whether that's
good or bad, all I know is that it makes what appears to be a functional change.

Can you explain a bit more? Am I missing something?

Regards,

	Hans

>  	.fb_check_var   = vivid_fb_check_var,
>  	.fb_set_par     = vivid_fb_set_par,
>  	.fb_setcolreg   = vivid_fb_setcolreg,
> -	.fb_fillrect    = cfb_fillrect,
> -	.fb_copyarea    = cfb_copyarea,
> -	.fb_imageblit   = cfb_imageblit,
>  	.fb_cursor      = NULL,
>  	.fb_ioctl       = vivid_fb_ioctl,
>  	.fb_pan_display = vivid_fb_pan_display,

