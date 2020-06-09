Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 382B21F4651
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 20:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1053D89AC3;
	Tue,  9 Jun 2020 18:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B1389AC3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 18:28:21 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C2F1380519;
 Tue,  9 Jun 2020 20:28:17 +0200 (CEST)
Date: Tue, 9 Jun 2020 20:28:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v5 01/13] drm/mipi_dbi: Convert pr_debug calls to
 DRM_DEBUG_DRIVER
Message-ID: <20200609182816.GA110769@ravnborg.org>
References: <20200608210505.48519-1-sean@poorly.run>
 <20200608210505.48519-2-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200608210505.48519-2-sean@poorly.run>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=cm27Pg_UAAAA:8 a=e5mUnYsNAAAA:8
 a=s1L4AgR-kFYTF7rkPywA:9 a=CjuIK1q_8ugA:10 a=xmb-EsYY8bH0VWELuYED:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 Sean Paul <seanpaul@chromium.org>, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sean Paul.
On Mon, Jun 08, 2020 at 05:04:51PM -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Use the drm logging helpers to output these messages to ensure they'll
> be included by the drm tracefs instance.
> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> 
> Changes in v5:
> -Added to the set
> ---
>  drivers/gpu/drm/drm_mipi_dbi.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index fd8d672972a9..ff6f83eeee09 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -769,9 +769,7 @@ static int mipi_dbi_spi1e_transfer(struct mipi_dbi *dbi, int dc,
>  	int i, ret;
>  	u8 *dst;
>  
> -	if (drm_debug_enabled(DRM_UT_DRIVER))
> -		pr_debug("[drm:%s] dc=%d, max_chunk=%zu, transfers:\n",
> -			 __func__, dc, max_chunk);
> +	DRM_DEBUG_DRIVER("dc=%d, max_chunk=%zu, transfers:\n", dc, max_chunk);
Today we have drm_dbg(...) as the preferred logging method.

	Sam

>  
>  	tr.speed_hz = mipi_dbi_spi_cmd_max_speed(spi, len);
>  	spi_message_init_with_transfers(&m, &tr, 1);
> @@ -893,9 +891,7 @@ static int mipi_dbi_spi1_transfer(struct mipi_dbi *dbi, int dc,
>  	max_chunk = dbi->tx_buf9_len;
>  	dst16 = dbi->tx_buf9;
>  
> -	if (drm_debug_enabled(DRM_UT_DRIVER))
> -		pr_debug("[drm:%s] dc=%d, max_chunk=%zu, transfers:\n",
> -			 __func__, dc, max_chunk);
> +	DRM_DEBUG_DRIVER("dc=%d, max_chunk=%zu, transfers:\n", dc, max_chunk);
>  
>  	max_chunk = min(max_chunk / 2, len);
>  
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
