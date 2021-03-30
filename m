Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0280D34DCD0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 02:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B226E5A5;
	Tue, 30 Mar 2021 00:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A94A6E5A5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 00:09:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88665102;
 Tue, 30 Mar 2021 02:09:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1617062950;
 bh=SULwTA7frnKKJ4yMBVE8tMgx2rIzXaQP85+dyqtey2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nWYxtZysg0Kk//olKQXxwg5HY+SI/gvtcupji9H1ZkcmF5Aagr+r4ZWXYf/sXOcyH
 L3APEF0Wq9HRrekRb0r0b/J1eKsI8tefktwKbVZgSPbFvbYTm5JMcuTuyAFgqOOXtq
 451fXeEJZsZlyNjAxIa9vAK77c5IcrNMmy3RvBTk=
Date: Tue, 30 Mar 2021 03:08:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: Re: [PATCH v2 2/3] drm/mediatek: Don't support hdmi connector creation
Message-ID: <YGJr+jopSvH4SdsL@pendragon.ideasonboard.com>
References: <20210329153632.17559-1-dafna.hirschfeld@collabora.com>
 <20210329153632.17559-3-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210329153632.17559-3-dafna.hirschfeld@collabora.com>
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

On Mon, Mar 29, 2021 at 05:36:31PM +0200, Dafna Hirschfeld wrote:
> commit f01195148967 ("drm/mediatek: mtk_dpi: Create connector for bridges")
> broke the display support for elm device since mtk_dpi calls
> drm_bridge_attach with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR
> while mtk_hdmi does not yet support this flag.
> 
> Fix this by accepting DRM_BRIDGE_ATTACH_NO_CONNECTOR in bridge attachment.
> Implement the drm_bridge_funcs .detect() and .get_edid() operations, and
> call drm_bridge_hpd_notify() to report HPD. This provides the
> necessary API to support disabling connector creation.
> 
> This patch is inspired by a similar patch for bridge/synopsys/dw-hdmi.c:
> commit ec971aaa6775 ("drm: bridge: dw-hdmi: Make connector creation optional")
> But with the difference that in mtk-hdmi only the option of not creating
> a connector is supported.
> 
> Fixes: f01195148967 ("drm/mediatek: mtk_dpi: Create connector for bridges")
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 129 ++++++++++------------------
>  1 file changed, 44 insertions(+), 85 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index f2c810b767ef..1eeb211b1536 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -186,11 +186,6 @@ static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
>  	return container_of(b, struct mtk_hdmi, bridge);
>  }
>  
> -static inline struct mtk_hdmi *hdmi_ctx_from_conn(struct drm_connector *c)
> -{
> -	return container_of(c, struct mtk_hdmi, conn);
> -}
> -
>  static u32 mtk_hdmi_read(struct mtk_hdmi *hdmi, u32 offset)
>  {
>  	return readl(hdmi->regs + offset);
> @@ -1201,48 +1196,30 @@ mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi)
>  	       connector_status_connected : connector_status_disconnected;
>  }
>  
> -static enum drm_connector_status hdmi_conn_detect(struct drm_connector *conn,
> -						  bool force)
> -{
> -	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
> -	return mtk_hdmi_update_plugged_status(hdmi);
> -}
> -
> -static void hdmi_conn_destroy(struct drm_connector *conn)
> +static struct edid *mtk_hdmi_get_edid(struct mtk_hdmi *hdmi,
> +				      struct drm_connector *connector)
>  {
> -	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
> -
> -	mtk_cec_set_hpd_event(hdmi->cec_dev, NULL, NULL);
> -
> -	drm_connector_cleanup(conn);
> -}
> -
> -static int mtk_hdmi_conn_get_modes(struct drm_connector *conn)
> -{
> -	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
>  	struct edid *edid;
> -	int ret;
>  
>  	if (!hdmi->ddc_adpt)
> -		return -ENODEV;
> -
> -	edid = drm_get_edid(conn, hdmi->ddc_adpt);
> +		return NULL;
> +	edid = drm_get_edid(connector, hdmi->ddc_adpt);
>  	if (!edid)
> -		return -ENODEV;
> -
> +		return NULL;
>  	hdmi->dvi_mode = !drm_detect_monitor_audio(edid);
> +	return edid;
> +}
>  
> -	drm_connector_update_edid_property(conn, edid);
> -
> -	ret = drm_add_edid_modes(conn, edid);
> -	kfree(edid);
> -	return ret;
> +static enum drm_connector_status mtk_hdmi_detect(struct mtk_hdmi *hdmi)
> +{
> +	return mtk_hdmi_update_plugged_status(hdmi);
>  }
>  
> -static int mtk_hdmi_conn_mode_valid(struct drm_connector *conn,
> -				    struct drm_display_mode *mode)
> +static int mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
> +				      const struct drm_display_info *info,
> +				      const struct drm_display_mode *mode)
>  {
> -	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
> +	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>  	struct drm_bridge *next_bridge;
>  
>  	dev_dbg(hdmi->dev, "xres=%d, yres=%d, refresh=%d, intl=%d clock=%d\n",
> @@ -1267,74 +1244,50 @@ static int mtk_hdmi_conn_mode_valid(struct drm_connector *conn,
>  	return drm_mode_validate_size(mode, 0x1fff, 0x1fff);
>  }
>  
> -static struct drm_encoder *mtk_hdmi_conn_best_enc(struct drm_connector *conn)
> -{
> -	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
> -
> -	return hdmi->bridge.encoder;
> -}
> -
> -static const struct drm_connector_funcs mtk_hdmi_connector_funcs = {
> -	.detect = hdmi_conn_detect,
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = hdmi_conn_destroy,
> -	.reset = drm_atomic_helper_connector_reset,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
> -static const struct drm_connector_helper_funcs
> -		mtk_hdmi_connector_helper_funcs = {
> -	.get_modes = mtk_hdmi_conn_get_modes,
> -	.mode_valid = mtk_hdmi_conn_mode_valid,
> -	.best_encoder = mtk_hdmi_conn_best_enc,
> -};
> -
>  static void mtk_hdmi_hpd_event(bool hpd, struct device *dev)
>  {
>  	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>  
> -	if (hdmi && hdmi->bridge.encoder && hdmi->bridge.encoder->dev)
> +	if (hdmi && hdmi->bridge.encoder && hdmi->bridge.encoder->dev) {
> +		static enum drm_connector_status status;
> +
> +		status = mtk_hdmi_detect(hdmi);
>  		drm_helper_hpd_irq_event(hdmi->bridge.encoder->dev);

I think you can drop this, as drm_bridge_connector_hpd_cb() calls
drm_kms_helper_hotplug_event().

> +		drm_bridge_hpd_notify(&hdmi->bridge, status);
> +	}
>  }
>  
>  /*
>   * Bridge callbacks
>   */
>  
> +static enum drm_connector_status mtk_hdmi_bridge_detect(struct drm_bridge *bridge)
> +{
> +	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
> +
> +	return mtk_hdmi_detect(hdmi);
> +}
> +
> +static struct edid *mtk_hdmi_bridge_get_edid(struct drm_bridge *bridge,
> +					     struct drm_connector *connector)
> +{
> +	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
> +
> +	return mtk_hdmi_get_edid(hdmi, connector);

As mtk_hdmi_get_edid() is only called here, you could inline it in this
function. Up to you.

> +}
> +
>  static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
>  				  enum drm_bridge_attach_flags flags)
>  {
>  	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>  	int ret;
>  
> -	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> -		DRM_ERROR("Fix bridge driver to make connector optional!");
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		DRM_ERROR("%s: The flag DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied\n",
> +			  __func__);
>  		return -EINVAL;
>  	}
>  
> -	ret = drm_connector_init_with_ddc(bridge->encoder->dev, &hdmi->conn,
> -					  &mtk_hdmi_connector_funcs,
> -					  DRM_MODE_CONNECTOR_HDMIA,
> -					  hdmi->ddc_adpt);
> -	if (ret) {
> -		dev_err(hdmi->dev, "Failed to initialize connector: %d\n", ret);
> -		return ret;
> -	}
> -	drm_connector_helper_add(&hdmi->conn, &mtk_hdmi_connector_helper_funcs);
> -
> -	hdmi->conn.polled = DRM_CONNECTOR_POLL_HPD;
> -	hdmi->conn.interlace_allowed = true;
> -	hdmi->conn.doublescan_allowed = false;
> -
> -	ret = drm_connector_attach_encoder(&hdmi->conn,
> -						bridge->encoder);
> -	if (ret) {
> -		dev_err(hdmi->dev,
> -			"Failed to attach connector to encoder: %d\n", ret);
> -		return ret;
> -	}
> -
>  	if (hdmi->next_bridge) {
>  		ret = drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
>  					bridge, flags);
> @@ -1444,6 +1397,7 @@ static void mtk_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
>  }
>  
>  static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
> +	.mode_valid = mtk_hdmi_bridge_mode_valid,
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  	.atomic_reset = drm_atomic_helper_bridge_reset,
> @@ -1454,6 +1408,8 @@ static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
>  	.mode_set = mtk_hdmi_bridge_mode_set,
>  	.atomic_pre_enable = mtk_hdmi_bridge_atomic_pre_enable,
>  	.atomic_enable = mtk_hdmi_bridge_atomic_enable,
> +	.detect = mtk_hdmi_bridge_detect,
> +	.get_edid = mtk_hdmi_bridge_get_edid,
>  };
>  
>  static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
> @@ -1762,6 +1718,9 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
>  
>  	hdmi->bridge.funcs = &mtk_hdmi_bridge_funcs;
>  	hdmi->bridge.of_node = pdev->dev.of_node;
> +	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
> +			   | DRM_BRIDGE_OP_HPD;

Nitpicking, I'd align the | to the =.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>  	drm_bridge_add(&hdmi->bridge);
>  
>  	ret = mtk_hdmi_clk_enable_audio(hdmi);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
