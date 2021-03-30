Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEF534DCBD
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 02:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6003E6E5A0;
	Tue, 30 Mar 2021 00:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4996E5A0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 00:03:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2B03102;
 Tue, 30 Mar 2021 02:03:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1617062585;
 bh=z08DZ+zSaLkhCxLYzk2DbSu2wZCH3gpsOvQtJqa4s8c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I7jDfa1MyAI8vHprTjDaLv0F2CW7Ew2AwAn8x8RYuQmM2Zk9dI87gr5Aj3oqBwXxZ
 5FdT9LJE0XpTaoSm6Ww6EyL6bqiSlW0uJoC7d/jtmXhDHGA/LVpZMF/EnGJF+4qtnj
 2lrV+B8/IVPTk0EJ1jDpfYWf/I0z4ZMwdBECJw5I=
Date: Tue, 30 Mar 2021 03:02:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: Re: [PATCH v2 1/3] drm/mediatek: Switch the hdmi bridge ops to the
 atomic versions
Message-ID: <YGJqjPp2COsP18As@pendragon.ideasonboard.com>
References: <20210329153632.17559-1-dafna.hirschfeld@collabora.com>
 <20210329153632.17559-2-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210329153632.17559-2-dafna.hirschfeld@collabora.com>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, dafna3@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, enric.balletbo@collabora.com,
 kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dafna,

Thank you for the patch.

On Mon, Mar 29, 2021 at 05:36:30PM +0200, Dafna Hirschfeld wrote:
> The bridge operation '.enable' and the audio cb '.get_eld'
> access hdmi->conn. In the future we will want to support
> the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR and then we will
> not have direct access to the connector.
> The atomic version '.atomic_enable' allows accessing the
> current connector from the state.
> This patch switches the bridge to the atomic version to
> prepare access to the connector in later patches.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 8ee55f9e2954..f2c810b767ef 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1357,7 +1357,8 @@ static bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
>  	return true;
>  }
>  
> -static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge)
> +static void mtk_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *old_bridge_state)
>  {
>  	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>  
> @@ -1371,7 +1372,8 @@ static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge)
>  	hdmi->enabled = false;
>  }
>  
> -static void mtk_hdmi_bridge_post_disable(struct drm_bridge *bridge)
> +static void mtk_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +						struct drm_bridge_state *old_state)
>  {
>  	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>  
> @@ -1406,7 +1408,8 @@ static void mtk_hdmi_bridge_mode_set(struct drm_bridge *bridge,
>  	drm_mode_copy(&hdmi->mode, adjusted_mode);
>  }
>  
> -static void mtk_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
> +static void mtk_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +					      struct drm_bridge_state *old_state)
>  {
>  	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>  
> @@ -1426,7 +1429,8 @@ static void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi,
>  		mtk_hdmi_setup_vendor_specific_infoframe(hdmi, mode);
>  }
>  
> -static void mtk_hdmi_bridge_enable(struct drm_bridge *bridge)
> +static void mtk_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
> +					  struct drm_bridge_state *old_state)
>  {
>  	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>  
> @@ -1440,13 +1444,16 @@ static void mtk_hdmi_bridge_enable(struct drm_bridge *bridge)
>  }
>  
>  static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
>  	.attach = mtk_hdmi_bridge_attach,
>  	.mode_fixup = mtk_hdmi_bridge_mode_fixup,
> -	.disable = mtk_hdmi_bridge_disable,
> -	.post_disable = mtk_hdmi_bridge_post_disable,
> +	.atomic_disable = mtk_hdmi_bridge_atomic_disable,
> +	.atomic_post_disable = mtk_hdmi_bridge_atomic_post_disable,
>  	.mode_set = mtk_hdmi_bridge_mode_set,
> -	.pre_enable = mtk_hdmi_bridge_pre_enable,
> -	.enable = mtk_hdmi_bridge_enable,
> +	.atomic_pre_enable = mtk_hdmi_bridge_atomic_pre_enable,
> +	.atomic_enable = mtk_hdmi_bridge_atomic_enable,
>  };
>  
>  static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
