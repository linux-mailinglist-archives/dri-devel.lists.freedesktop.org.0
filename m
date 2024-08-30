Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59435965839
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 09:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC21510E832;
	Fri, 30 Aug 2024 07:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="UkIGCMlj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADBF10E832
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 07:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1725002265;
 bh=f2HCDSTkTkCbIafIoSatL/nTKpy+odGB0YR86K1BIL0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UkIGCMljMuRbtSoV000F3kIuCGjuuKCG5kjxKHGD4W6C/z1H839STQYJkAa3Mwkc5
 VYEp5C8gkhkcfymnyfODbTCbrgknvwpMmjJsKBJ6vWVDWnAohNlT1Cs3r3wFsklyhA
 rjYBvhwCfG3DeKQBO10nR7O90EslWIQzVr+ML+j4=
Date: Fri, 30 Aug 2024 09:17:45 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Helge Deller <deller@gmx.de>, Bert Karwatzki <spasswolf@web.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Peter Jones <pjones@redhat.com>
Subject: Re: [PATCH 3/5] fbdev: Introduce devm_register_framebuffer()
Message-ID: <8b52669c-4c99-45e2-8b5e-9348e5e00f70@t-8ch.de>
References: <20240827-efifb-sysfs-v1-0-c9cc3e052180@weissschuh.net>
 <20240827-efifb-sysfs-v1-3-c9cc3e052180@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240827-efifb-sysfs-v1-3-c9cc3e052180@weissschuh.net>
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

Hi everybody,

On 2024-08-27 17:25:14+0000, Thomas Weißschuh wrote:
> Introduce a device-managed variant of register_framebuffer() which
> automatically unregisters the framebuffer on device destruction.
> This can simplify the error handling and resource management in drivers.

Bert reported that this series broke his framebuffer ([0], [1]).

[0] https://lore.kernel.org/lkml/20240829224124.2978-1-spasswolf@web.de/
[1] https://lore.kernel.org/lkml/20240829230438.3226-1-spasswolf@web.de/

> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>  drivers/video/fbdev/core/fbmem.c | 24 ++++++++++++++++++++++++
>  include/linux/fb.h               |  1 +
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 4c4ad0a86a50..d17a2daa2483 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -544,6 +544,30 @@ unregister_framebuffer(struct fb_info *fb_info)

[..]

> +/**
> + *	devm_register_framebuffer - resource-managed frame buffer device registration
> + *	@dev: device the framebuffer belongs to
> + *	@fb_info: frame buffer info structure
> + *
> + *	Registers a frame buffer device @fb_info to device @dev.
> + *
> + *	Returns negative errno on error, or zero for success.
> + *
> + */
> +int
> +devm_register_framebuffer(struct device *dev, struct fb_info *fb_info)
> +{
> +	return devm_add_action_or_reset(dev, devm_unregister_framebuffer, fb_info);
> +}
> +EXPORT_SYMBOL(devm_register_framebuffer);

This implementation is wrong, it never actually registers the
framebuffer. It should look like this:

int
devm_register_framebuffer(struct device *dev, struct fb_info *fb_info)
{
	int ret;

	ret = register_framebuffer(fb_info);
	if (ret)
		return ret;

	return devm_add_action_or_reset(dev, devm_unregister_framebuffer, fb_info);
}
EXPORT_SYMBOL(devm_register_framebuffer);

Bert, could you test this?
Helge, do you want me to resend the series, minus the original patch 1?
