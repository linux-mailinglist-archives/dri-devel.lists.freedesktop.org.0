Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F911900B4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 22:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC016E3C6;
	Mon, 23 Mar 2020 21:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B176E3C6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 21:53:52 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id C252C5C0BDA;
 Mon, 23 Mar 2020 22:53:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1585000430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dsVr+Yn3lEvrL6e2ojshDCSKZcuKQC9RRE+xtD0sYGU=;
 b=uFVMSauP4q63r1wR7r4ngu9LLMA3x0nmSNue06EYx0oDJ0XBAFY2eVhlnpMfUid2Do/NP+
 1jlk53ccw88aHgUaoU0DV6glREOd7OIC0vDYi22MEngVfcUbmCXR/DtmmOs/EpQExr/zl0
 gTN9orr6hQYlZopAlFxyJ2WQd+580C0=
MIME-Version: 1.0
Date: Mon, 23 Mar 2020 22:53:50 +0100
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 09/21] drm: mxsfb: Remove unneeded includes
In-Reply-To: <20200309195216.31042-10-laurent.pinchart@ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-10-laurent.pinchart@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <a681c7b8f663ac32b5504aaed3eec429@agner.ch>
X-Sender: stefan@agner.ch
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-03-09 20:52, Laurent Pinchart wrote:
> A fair number of includes are not needed. Drop them, and add a couple of
> required includes that were included indirectly.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Out of curiosity, do you have some kind of tool helping with this?

Reviewed-by: Stefan Agner <stefan@agner.ch>

> ---
>  drivers/gpu/drm/mxsfb/mxsfb_crtc.c | 12 +++---------
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c  |  5 -----
>  2 files changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> index aef72adabf41..c4f1575b4210 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> @@ -10,19 +10,13 @@
>  
>  #include <linux/clk.h>
>  #include <linux/iopoll.h>
> -#include <linux/of_graph.h>
> -#include <linux/platform_data/simplefb.h>
> +#include <linux/spinlock.h>
>  
> -#include <video/videomode.h>
> -
> -#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_fb_cma_helper.h>
> -#include <drm/drm_fb_helper.h>
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_of.h>
> -#include <drm/drm_plane_helper.h>
> -#include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
>  #include <drm/drm_vblank.h>
>  
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index cffc70257bd3..204c1e52e9aa 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -9,15 +9,10 @@
>   */
>  
>  #include <linux/clk.h>
> -#include <linux/component.h>
>  #include <linux/dma-mapping.h>
> -#include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> -#include <linux/of_graph.h>
> -#include <linux/of_reserved_mem.h>
>  #include <linux/pm_runtime.h>
> -#include <linux/dma-resv.h>
>  #include <linux/spinlock.h>
>  
>  #include <drm/drm_atomic.h>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
