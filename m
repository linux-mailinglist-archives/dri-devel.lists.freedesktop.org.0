Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 461733D186F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 22:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E8B6E1BE;
	Wed, 21 Jul 2021 20:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8176E1BE
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 20:54:35 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1m6JEg-0006hs-Dm; Wed, 21 Jul 2021 22:54:34 +0200
Message-ID: <36057b25e939270c98d66fd24823b5edfa789d60.camel@pengutronix.de>
Subject: Re: [RESEND PATCH v6 07/14] drm/etnaviv: Change buffer dump checks
 to target syslog
From: Lucas Stach <l.stach@pengutronix.de>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 ppaalanen@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de,  airlied@linux.ie, daniel.vetter@ffwll.ch
Date: Wed, 21 Jul 2021 22:54:29 +0200
In-Reply-To: <20210721175526.22020-8-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
 <20210721175526.22020-8-sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Sean Paul <seanpaul@chromium.org>, etnaviv@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, dem 21.07.2021 um 13:55 -0400 schrieb Sean Paul:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Since the logs protected by these checks specifically target syslog,
> use the new drm_debug_syslog_enabled() call to avoid triggering
> these prints when only trace is enabled.
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

Acked-by: Lucas Stach <l.stach@pengutronix.de>

> Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-8-sean@poorly.run #v5
> 
> Changes in v5:
> -Added to the set
> Changes in v6:
> -None
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> index 76d38561c910..7713474800e8 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> @@ -353,7 +353,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
>  
>  	lockdep_assert_held(&gpu->lock);
>  
> -	if (drm_debug_enabled(DRM_UT_DRIVER))
> +	if (drm_debug_syslog_enabled(DRM_UT_DRIVER))
>  		etnaviv_buffer_dump(gpu, buffer, 0, 0x50);
>  
>  	link_target = etnaviv_cmdbuf_get_va(cmdbuf,
> @@ -509,13 +509,13 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
>  		 etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
>  		 + buffer->user_size - 4);
>  
> -	if (drm_debug_enabled(DRM_UT_DRIVER))
> +	if (drm_debug_syslog_enabled(DRM_UT_DRIVER))
>  		pr_info("stream link to 0x%08x @ 0x%08x %p\n",
>  			return_target,
>  			etnaviv_cmdbuf_get_va(cmdbuf, &gpu->mmu_context->cmdbuf_mapping),
>  			cmdbuf->vaddr);
>  
> -	if (drm_debug_enabled(DRM_UT_DRIVER)) {
> +	if (drm_debug_syslog_enabled(DRM_UT_DRIVER)) {
>  		print_hex_dump(KERN_INFO, "cmd ", DUMP_PREFIX_OFFSET, 16, 4,
>  			       cmdbuf->vaddr, cmdbuf->size, 0);
>  
> @@ -534,6 +534,6 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
>  				    VIV_FE_LINK_HEADER_PREFETCH(link_dwords),
>  				    link_target);
>  
> -	if (drm_debug_enabled(DRM_UT_DRIVER))
> +	if (drm_debug_syslog_enabled(DRM_UT_DRIVER))
>  		etnaviv_buffer_dump(gpu, buffer, 0, 0x50);
>  }


