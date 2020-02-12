Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA1C15A31D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25006E97A;
	Wed, 12 Feb 2020 08:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 070656E97A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 08:19:20 +0000 (UTC)
X-UUID: 9f5fe6e7d3f145549f39c0a0532a0b1d-20200212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WTR3IyGTtiHoAq1wxcteE4V4GBjK4qM6cnQ1Vs7Y5e4=; 
 b=oLhNGi+I+Rma92S81fCP0y77PVdsTJDZmWur1Ou+uMLG7m1Jjf1OSTtFg9/apKKesd4YcQWwFvOEniTA4bZZ191ouvazyElHbawHgrd0FLQ1m5aWyVC4I88H8cZNSGOVi3Fy7+iJ+qyGp4Lll98mWkoZZFKurC+uXxqF3kTA6+4=;
X-UUID: 9f5fe6e7d3f145549f39c0a0532a0b1d-20200212
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 2015734826; Wed, 12 Feb 2020 16:19:15 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 12 Feb 2020 16:17:37 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 12 Feb 2020 16:19:42 +0800
Message-ID: <1581495554.22603.2.camel@mtksdaap41>
Subject: Re: [PATCH v2 2/3] drm/mediatek: support HDMI jack status reporting
From: CK Hu <ck.hu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 12 Feb 2020 16:19:14 +0800
In-Reply-To: <20200206102509.2.I230fd59de28e73934a91cb01424e25b9e84727f4@changeid>
References: <20200206031752.193298-1-tzungbi@google.com>
 <20200206102509.2.I230fd59de28e73934a91cb01424e25b9e84727f4@changeid>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: alsa-devel@alsa-project.org, cychiang@google.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Tzung-Bi:

On Thu, 2020-02-06 at 11:17 +0800, Tzung-Bi Shih wrote:
> 1.
> Provides a callback (i.e. mtk_hdmi_audio_hook_plugged_cb) to hdmi-codec.
> When ASoC machine driver calls hdmi_codec_set_jack_detect(), the
> callback will be invoked to save plugged_cb and codec_dev parameters.
> 
> +---------+  set_jack_  +------------+ plugged_cb  +----------+
> | machine | ----------> | hdmi-codec | ----------> | mtk-hdmi |
> +---------+  detect()   +------------+ codec_dev   +----------+
> 
> 2.
> When there is any jack status changes, mtk-hdmi will call the
> plugged_cb() to notify hdmi-codec.  And then hdmi-codec will call
> snd_soc_jack_report().
> 
> +----------+ plugged_cb  +------------+
> | mtk-hdmi | ----------> | hdmi-codec | -> snd_soc_jack_report()
> +----------+ codec_dev   +------------+
>              connector_status
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 34 ++++++++++++++++++++++++++---
>  1 file changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 23c2b0e8693d..fccdd975947d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -169,6 +169,8 @@ struct mtk_hdmi {
>  	bool audio_enable;
>  	bool powered;
>  	bool enabled;
> +	hdmi_codec_plugged_cb plugged_cb;
> +	struct device *codec_dev;
>  };
>  
>  static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
> @@ -1194,13 +1196,23 @@ static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
>  	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_SPDIF]);
>  }
>  
> +static enum drm_connector_status
> +mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi)
> +{
> +	bool connected = mtk_cec_hpd_high(hdmi->cec_dev);
> +
> +	if (hdmi->plugged_cb && hdmi->codec_dev)
> +		hdmi->plugged_cb(hdmi->codec_dev, connected);
> +
> +	return connected ?
> +	       connector_status_connected : connector_status_disconnected;
> +}
> +
>  static enum drm_connector_status hdmi_conn_detect(struct drm_connector *conn,
>  						  bool force)
>  {
>  	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
> -
> -	return mtk_cec_hpd_high(hdmi->cec_dev) ?
> -	       connector_status_connected : connector_status_disconnected;
> +	return mtk_hdmi_update_plugged_status(hdmi);
>  }
>  
>  static void hdmi_conn_destroy(struct drm_connector *conn)
> @@ -1648,20 +1660,36 @@ static int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
>  	return 0;
>  }
>  
> +static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
> +					  hdmi_codec_plugged_cb fn,
> +					  struct device *codec_dev)
> +{
> +	struct mtk_hdmi *hdmi = data;
> +
> +	hdmi->plugged_cb = fn;
> +	hdmi->codec_dev = codec_dev;
> +	mtk_hdmi_update_plugged_status(hdmi);

I think hdmi_conn_detect() and mtk_hdmi_audio_hook_plugged_cb() would be
called in different thread. So it's necessary to use a mutex to protect
this.

Regards,
CK

> +
> +	return 0;
> +}
> +
>  static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
>  	.hw_params = mtk_hdmi_audio_hw_params,
>  	.audio_startup = mtk_hdmi_audio_startup,
>  	.audio_shutdown = mtk_hdmi_audio_shutdown,
>  	.digital_mute = mtk_hdmi_audio_digital_mute,
>  	.get_eld = mtk_hdmi_audio_get_eld,
> +	.hook_plugged_cb = mtk_hdmi_audio_hook_plugged_cb,
>  };
>  
>  static int mtk_hdmi_register_audio_driver(struct device *dev)
>  {
> +	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>  	struct hdmi_codec_pdata codec_data = {
>  		.ops = &mtk_hdmi_audio_codec_ops,
>  		.max_i2s_channels = 2,
>  		.i2s = 1,
> +		.data = hdmi,
>  	};
>  	struct platform_device *pdev;
>  

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
