Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F16D222A6B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 19:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC36D6E10E;
	Thu, 16 Jul 2020 17:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848156E10E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 17:50:35 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 9D83520024;
 Thu, 16 Jul 2020 19:50:33 +0200 (CEST)
Date: Thu, 16 Jul 2020 19:50:32 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/2] drm/panel-simple: Fix inverted V/H SYNC for Frida
 FRD350H54004 panel
Message-ID: <20200716175032.GD2235355@ravnborg.org>
References: <20200716125647.10964-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716125647.10964-1-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8 a=ER_8r6IbAAAA:8
 a=etWGH2V3dnbwptkrp_gA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=9LHmKk7ezEChjTCyhBa9:22
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
Cc: stable@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 16, 2020 at 02:56:46PM +0200, Paul Cercueil wrote:
> The FRD350H54004 panel was marked as having active-high VSYNC and HSYNC
> signals, which sorts-of worked, but resulted in the picture fading out
> under certain circumstances.
> 
> Fix this issue by marking VSYNC and HSYNC signals active-low.
> 
> v2: Rebase on drm-misc-next
> 
> Fixes: 7b6bd8433609 ("drm/panel: simple: Add support for the Frida FRD350H54004 panel")
> Cc: stable@vger.kernel.org # v5.5
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Thanks for the re-submit. Applied both patches to drm-misc-next.

	Sam

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index f42249b72548..8b0bab9dd075 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1763,7 +1763,7 @@ static const struct drm_display_mode frida_frd350h54004_mode = {
>  	.vsync_start = 240 + 2,
>  	.vsync_end = 240 + 2 + 6,
>  	.vtotal = 240 + 2 + 6 + 2,
> -	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
> +	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>  };
>  
>  static const struct panel_desc frida_frd350h54004 = {
> -- 
> 2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
