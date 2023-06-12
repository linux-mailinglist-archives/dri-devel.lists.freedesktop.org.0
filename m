Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3590A72CAB8
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 17:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E09410E2A2;
	Mon, 12 Jun 2023 15:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [46.30.211.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F9410E2A2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 15:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=0dH/oRTF+guHoZ2aCWN+cBBdc2GgeZgNnM5H0oi1HW4=;
 b=DMtMgFCAz8w7xuqqwYQEelOFxaeBNhQtvqYwwISUTOg8g2iShVN++VhldRLQdgcDAgvH99ZUi+oJp
 CwVxMrM7vajMBm9WqrSlplxhTAPwSVuEnkGTno6XKYuvIHAEFf2trhvCjt0tgZohDlZGk1cctDlKDy
 sZs/PNip22Gz1uuHwbDZ+dQbas6FDwiXHLJt+Ef99n4SGti2R0Kau+Vtm2gi1Jjsva1ATGOG7pShy/
 OpN/jmoHycVOlVrUt1s/DaVTsMu1uHiejykIGIYDjIxg7EFpiYzHHh33eIev94IBXKB73gW1gQYE+C
 rFawV5zUMLGMnV1vsOHCAF3gsTQZRpw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=0dH/oRTF+guHoZ2aCWN+cBBdc2GgeZgNnM5H0oi1HW4=;
 b=kFjPfBgFI4g//7VhHuxMhjP+4sZby/YSx6Dh7J8cEwhi3J80mOiahDnmMFj548RhMJQlsKeOvepCH
 N2dDRd0CA==
X-HalOne-ID: f48a10d7-0938-11ee-bd17-231b2edd0ed2
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id f48a10d7-0938-11ee-bd17-231b2edd0ed2;
 Mon, 12 Jun 2023 15:51:14 +0000 (UTC)
Date: Mon, 12 Jun 2023 17:51:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 21/38] fbdev/radeonfb: Reorder backlight and
 framebuffer cleanup
Message-ID: <20230612155112.GB1243864@ravnborg.org>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-22-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612141352.29939-22-tzimmermann@suse.de>
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
Cc: daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, geert+renesas@glider.be,
 linux-sh@vger.kernel.org, jingoohan1@gmail.com, deller@gmx.de, lee@kernel.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, michael.j.ruhl@intel.com,
 linux-omap@vger.kernel.org, dan.carpenter@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Jun 12, 2023 at 04:07:59PM +0200, Thomas Zimmermann wrote:
> The driver's backlight code requires the framebuffer to be
> registered. Therefore reorder the cleanup calls for both data
> structures. The init calls are already in the correct order.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/video/fbdev/aty/radeon_base.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
> index 972c4bbedfa36..8f2a527c26ebf 100644
> --- a/drivers/video/fbdev/aty/radeon_base.c
> +++ b/drivers/video/fbdev/aty/radeon_base.c
> @@ -2517,9 +2517,8 @@ static void radeonfb_pci_unregister(struct pci_dev *pdev)
>  
>  	del_timer_sync(&rinfo->lvds_timer);
>  	arch_phys_wc_del(rinfo->wc_cookie);
> -        unregister_framebuffer(info);
> -
>          radeonfb_bl_exit(rinfo);
> +	unregister_framebuffer(info);
>  
>          iounmap(rinfo->mmio_base);
>          iounmap(rinfo->fb_base);
The mix of spaces and tabs for indent looks strange in the diff.
Consider to use the style of the surrounding code if you are going to
refresh the patch-set.

	Sam
