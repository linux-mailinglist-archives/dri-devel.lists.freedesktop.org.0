Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A8F54D1BE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 21:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B2F10F79C;
	Wed, 15 Jun 2022 19:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6970010F79C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 19:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=MaORVJKokOiv4uLx1FnFMPqkLfVRdqqApsAsnHPVKkU=;
 b=gp0iX/TobMwx+0jYKqg4yqip6VuG+pHw7YCtBzf7GkUGbR9vTt3N38kH6jnWDeiFYJ28X8TQ+C9Gi
 E47RUsvhkW7+OGTwwqLgnVbmGtdZTaTnLZpPq1tdT/6DmzFL+50FvD1bgbKL8z+0D5MdSRjGlTPv+4
 t6OtpkIiKgLokNdDyzBQPJJAsm9gSFLYLYIpd9qzUYQirWK0/MiHu2wItQLAxAevj/cikmAvrBoMDF
 Au/0nubZ3JX3JhxZO8sa9sRxvrIo5ZVjYNYMXHMvlLipXb9g2jRRSxrBTQnNapPgBVgYSD9vxFgEVk
 CfhGGWvbawqK8traSjeQxUMB+8cDzwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=MaORVJKokOiv4uLx1FnFMPqkLfVRdqqApsAsnHPVKkU=;
 b=LC+ZxDn2tbfPh9mmhwJTxanQWbQlDEKDpdkka/LFk0ktmR2J1bFrj/ar3DqKZ5i6MopjzgRC/j7iv
 QH/WqNDAA==
X-HalOne-Cookie: 6658136e901833609fc7fc2b1ebe8cadacd96117
X-HalOne-ID: c4445ebd-ece2-11ec-be78-d0431ea8bb03
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id c4445ebd-ece2-11ec-be78-d0431ea8bb03;
 Wed, 15 Jun 2022 19:38:44 +0000 (UTC)
Date: Wed, 15 Jun 2022 21:38:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 1/8] drm: Drop drm_edid.h from drm_crtc.h
Message-ID: <Yqo1Qo9HlaHT8mSI@ravnborg.org>
References: <20220613200317.11305-1-ville.syrjala@linux.intel.com>
 <20220613200317.11305-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220613200317.11305-2-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville,

On Mon, Jun 13, 2022 at 11:03:10PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm_crtc.h has no need for drm_edid.h, so don't include it.
> Avoids useless rebuilds of the entire universe when
> touching drm_edid.h.
> 
> Quite a few placs do currently depend on drm_edid.h without
> actually including it directly. All of those need to be fixed
> up.
This is a very nice reduction in implicit includes.

> 
> diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
> index 204c869d9fe2..43de2ac8f27e 100644
> --- a/drivers/gpu/drm/arm/malidp_mw.c
> +++ b/drivers/gpu/drm/arm/malidp_mw.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_fourcc.h>
Please maintain the alphabetic order of the includes.
This reduces the risk of conflict when we have multiple edits
in different parallel commits.


> diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
> index 14a058a42854..4f2fd69c4a4e 100644
> --- a/drivers/gpu/drm/imx/imx-ldb.c
> +++ b/drivers/gpu/drm/imx/imx-ldb.c
> @@ -22,6 +22,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_fb_helper.h>
> +#include <drm/drm_edid.h>
ditto
>  #include <drm/drm_managed.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
> diff --git a/drivers/gpu/drm/imx/imx-tve.c b/drivers/gpu/drm/imx/imx-tve.c
> index 2b1fdf2cbbce..9a2fa352a433 100644
> --- a/drivers/gpu/drm/imx/imx-tve.c
> +++ b/drivers/gpu/drm/imx/imx-tve.c
> @@ -19,6 +19,7 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_fb_helper.h>
> +#include <drm/drm_edid.h>
ditto
>  #include <drm/drm_managed.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
> index 63ba2ad84679..5a91a5c82057 100644
> --- a/drivers/gpu/drm/imx/parallel-display.c
> +++ b/drivers/gpu/drm/imx/parallel-display.c
> @@ -15,6 +15,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_fb_helper.h>
> +#include <drm/drm_edid.h>
ditto
>  #include <drm/drm_managed.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> index 4017b0a621fc..52eaa10712ec 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> @@ -16,6 +16,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_fb_helper.h>
> +#include <drm/drm_edid.h>
ditto
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>


With the above fixed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>
