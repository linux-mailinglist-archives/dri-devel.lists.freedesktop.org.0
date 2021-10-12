Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21612429E7A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 09:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD736E5CE;
	Tue, 12 Oct 2021 07:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006316E5CE
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 07:21:24 +0000 (UTC)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi
 [91.158.153.130])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31B81F1;
 Tue, 12 Oct 2021 09:21:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1634023283;
 bh=UdFCjI4cwaSDdeWWXv/2XqR4Rxx5UVD22jWQA8TQ7/o=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=HGHS9HXB3+qbhYLqY2jHEU/IwHJk1VsZ+KFTLgjyWp0JmU6FxuVHWH5dpLodndPEb
 uXOdIJFkSXtzpiyPzLAC6BTsBKup7eGyxP5GQwUBDlCPPYZFLggtZ56o7Vo4wXU3Zl
 G+BhhuFQMsfIQKmeZXZL6Z6U2yJ4OmXZv3RfRYNU=
Subject: Re: [PATCH v5 1/8] drm/omap: Add ability to check if requested plane
 modes can be supported
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 Benoit Parrot <bparrot@ti.com>
References: <20210923070701.145377-1-narmstrong@baylibre.com>
 <20210923070701.145377-2-narmstrong@baylibre.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <e69a1c23-3ea2-9777-c251-b5afd1cf4590@ideasonboard.com>
Date: Tue, 12 Oct 2021 10:21:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923070701.145377-2-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 23/09/2021 10:06, Neil Armstrong wrote:
> From: Benoit Parrot <bparrot@ti.com>
> 
> We currently assume that an overlay has the same maximum width and
> maximum height as the overlay manager. This assumption is incorrect. On
> some variants the overlay manager maximum width is twice the maximum
> width that the overlay can handle. We need to add the appropriate data
> per variant as well as export a helper function to retrieve the data so
> check can be made dynamically in omap_plane_atomic_check().
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/gpu/drm/omapdrm/dss/dispc.c  | 22 ++++++++++++++++++++++
>   drivers/gpu/drm/omapdrm/dss/dss.h    |  2 ++
>   drivers/gpu/drm/omapdrm/omap_plane.c | 14 ++++++++++++++
>   3 files changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
> index 3c4a4991e45a..bdecec8f4d88 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
> @@ -92,6 +92,8 @@ struct dispc_features {
>   	u8 mgr_height_start;
>   	u16 mgr_width_max;
>   	u16 mgr_height_max;
> +	u16 ovl_width_max;
> +	u16 ovl_height_max;
>   	unsigned long max_lcd_pclk;
>   	unsigned long max_tv_pclk;
>   	unsigned int max_downscale;
> @@ -2599,6 +2601,12 @@ static int dispc_ovl_calc_scaling(struct dispc_device *dispc,
>   	return 0;
>   }
>   
> +void dispc_ovl_get_max_size(struct dispc_device *dispc, u16 *width, u16 *height)
> +{
> +	*width = dispc->feat->ovl_width_max;
> +	*height = dispc->feat->ovl_height_max;
> +}
> +
>   static int dispc_ovl_setup_common(struct dispc_device *dispc,
>   				  enum omap_plane_id plane,
>   				  enum omap_overlay_caps caps,
> @@ -4240,6 +4248,8 @@ static const struct dispc_features omap24xx_dispc_feats = {
>   	.mgr_height_start	=	26,
>   	.mgr_width_max		=	2048,
>   	.mgr_height_max		=	2048,
> +	.ovl_width_max		=	2048,
> +	.ovl_height_max		=	2048,
>   	.max_lcd_pclk		=	66500000,
>   	.max_downscale		=	2,
>   	/*
> @@ -4278,6 +4288,8 @@ static const struct dispc_features omap34xx_rev1_0_dispc_feats = {
>   	.mgr_height_start	=	26,
>   	.mgr_width_max		=	2048,
>   	.mgr_height_max		=	2048,
> +	.ovl_width_max		=	2048,
> +	.ovl_height_max		=	2048,
>   	.max_lcd_pclk		=	173000000,
>   	.max_tv_pclk		=	59000000,
>   	.max_downscale		=	4,
> @@ -4313,6 +4325,8 @@ static const struct dispc_features omap34xx_rev3_0_dispc_feats = {
>   	.mgr_height_start	=	26,
>   	.mgr_width_max		=	2048,
>   	.mgr_height_max		=	2048,
> +	.ovl_width_max		=	2048,
> +	.ovl_height_max		=	2048,
>   	.max_lcd_pclk		=	173000000,
>   	.max_tv_pclk		=	59000000,
>   	.max_downscale		=	4,
> @@ -4348,6 +4362,8 @@ static const struct dispc_features omap36xx_dispc_feats = {
>   	.mgr_height_start	=	26,
>   	.mgr_width_max		=	2048,
>   	.mgr_height_max		=	2048,
> +	.ovl_width_max		=	2048,
> +	.ovl_height_max		=	2048,
>   	.max_lcd_pclk		=	173000000,
>   	.max_tv_pclk		=	59000000,
>   	.max_downscale		=	4,
> @@ -4383,6 +4399,8 @@ static const struct dispc_features am43xx_dispc_feats = {
>   	.mgr_height_start	=	26,
>   	.mgr_width_max		=	2048,
>   	.mgr_height_max		=	2048,
> +	.ovl_width_max		=	2048,
> +	.ovl_height_max		=	2048,
>   	.max_lcd_pclk		=	173000000,
>   	.max_tv_pclk		=	59000000,
>   	.max_downscale		=	4,
> @@ -4418,6 +4436,8 @@ static const struct dispc_features omap44xx_dispc_feats = {
>   	.mgr_height_start	=	26,
>   	.mgr_width_max		=	2048,
>   	.mgr_height_max		=	2048,
> +	.ovl_width_max		=	2048,
> +	.ovl_height_max		=	2048,
>   	.max_lcd_pclk		=	170000000,
>   	.max_tv_pclk		=	185625000,
>   	.max_downscale		=	4,
> @@ -4457,6 +4477,8 @@ static const struct dispc_features omap54xx_dispc_feats = {
>   	.mgr_height_start	=	27,
>   	.mgr_width_max		=	4096,
>   	.mgr_height_max		=	4096,
> +	.ovl_width_max		=	2048,
> +	.ovl_height_max		=	4096,
>   	.max_lcd_pclk		=	170000000,
>   	.max_tv_pclk		=	192000000,
>   	.max_downscale		=	4,
> diff --git a/drivers/gpu/drm/omapdrm/dss/dss.h b/drivers/gpu/drm/omapdrm/dss/dss.h
> index a547527bb2f3..14c39f7c3988 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/dss.h
> @@ -397,6 +397,8 @@ int dispc_get_num_mgrs(struct dispc_device *dispc);
>   const u32 *dispc_ovl_get_color_modes(struct dispc_device *dispc,
>   					    enum omap_plane_id plane);
>   
> +void dispc_ovl_get_max_size(struct dispc_device *dispc, u16 *width, u16 *height);
> +
>   u32 dispc_read_irqstatus(struct dispc_device *dispc);
>   void dispc_clear_irqstatus(struct dispc_device *dispc, u32 mask);
>   void dispc_write_irqenable(struct dispc_device *dispc, u32 mask);
> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
> index 512af976b7e9..d0a67b7ed1a0 100644
> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> @@ -109,11 +109,18 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
>   {
>   	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
>   										 plane);
> +	struct omap_drm_private *priv = plane->dev->dev_private;
>   	struct drm_crtc_state *crtc_state;
> +	u16 width, height;
> +	u32 width_fp, height_fp;

I think naming these max_w/max_width etc. would be better.

  Tomi
