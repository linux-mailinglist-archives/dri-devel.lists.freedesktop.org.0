Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE12160924
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 04:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389C06E486;
	Mon, 17 Feb 2020 03:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 92E126E44C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 03:44:23 +0000 (UTC)
X-UUID: 2a26b73339d345c0ab84a9d7e89edf7a-20200217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=t94t8oVrB/2x1V0xqotqa7NVwVrZU5xruUOUaNPm/Ck=; 
 b=gFbOVRIfs89aOPosJ7mvekkKq5sEBx1Hdsy8fEb3HeB6MnqVWYt6cN6wxDemI+95zAVePzF+g+tXzbrccuA9GvEhEkAeRlo1oN/wmQJ8JS1M9RhCIDqmjWTnkZMCBVG63ZVrnkSN360Ee5sLf2zTLVWd52v1lvMl/CLEKxl/ngg=;
X-UUID: 2a26b73339d345c0ab84a9d7e89edf7a-20200217
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 2037310682; Mon, 17 Feb 2020 11:44:19 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 11:44:18 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 17 Feb 2020 11:43:55 +0800
Message-ID: <1581911058.12629.1.camel@mtksdaap41>
Subject: Re: [PATCH v2 2/2] drm/mediatek: fix race condition for HDMI jack
 status reporting
From: CK Hu <ck.hu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 17 Feb 2020 11:44:18 +0800
In-Reply-To: <20200217105513.2.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
References: <20200217031653.52345-1-tzungbi@google.com>
 <20200217105513.2.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
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
Cc: alsa-devel@alsa-project.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org, cychiang@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Tzhung-Bi:

On Mon, 2020-02-17 at 11:16 +0800, Tzung-Bi Shih wrote:
> hdmi_conn_detect and mtk_hdmi_audio_hook_plugged_cb would be called
> by different threads.
> 
> Imaging the following calling sequence:
>            Thread A                            Thread B
> --------------------------------------------------------------------
> mtk_hdmi_audio_hook_plugged_cb()
> mtk_cec_hpd_high() -> disconnected
>                                      hdmi_conn_detect()
>                                      mtk_cec_hpd_high() -> connected
>                                      plugged_cb(connected)
> plugged_cb(disconnected)
> 
> The latest disconnected is false reported.  Makes mtk_cec_hpd_high
> and plugged_cb atomic to fix.
> 
> Also uses the same lock to protect read/write of plugged_cb and codec_dev.
> 
> Fixes: 5d3c64477392 ("drm/mediatek: support HDMI jack status reporting")

This patch looks good to me, but please merge this patch with the patch
it fix.

Regards,
CK

> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 03aeb73005ef..d80017e3d84a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -12,6 +12,7 @@
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/mutex.h>
>  #include <linux/of_platform.h>
>  #include <linux/of.h>
>  #include <linux/of_gpio.h>
> @@ -171,6 +172,7 @@ struct mtk_hdmi {
>  	bool enabled;
>  	hdmi_codec_plugged_cb plugged_cb;
>  	struct device *codec_dev;
> +	struct mutex update_plugged_status_lock;
>  };
>  
>  static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
> @@ -1199,10 +1201,13 @@ static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
>  static enum drm_connector_status
>  mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi)
>  {
> -	bool connected = mtk_cec_hpd_high(hdmi->cec_dev);
> +	bool connected;
>  
> +	mutex_lock(&hdmi->update_plugged_status_lock);
> +	connected = mtk_cec_hpd_high(hdmi->cec_dev);
>  	if (hdmi->plugged_cb && hdmi->codec_dev)
>  		hdmi->plugged_cb(hdmi->codec_dev, connected);
> +	mutex_unlock(&hdmi->update_plugged_status_lock);
>  
>  	return connected ?
>  	       connector_status_connected : connector_status_disconnected;
> @@ -1669,8 +1674,11 @@ static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
>  {
>  	struct mtk_hdmi *hdmi = data;
>  
> +	mutex_lock(&hdmi->update_plugged_status_lock);
>  	hdmi->plugged_cb = fn;
>  	hdmi->codec_dev = codec_dev;
> +	mutex_unlock(&hdmi->update_plugged_status_lock);
> +
>  	mtk_hdmi_update_plugged_status(hdmi);
>  
>  	return 0;
> @@ -1729,6 +1737,7 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	mutex_init(&hdmi->update_plugged_status_lock);
>  	platform_set_drvdata(pdev, hdmi);
>  
>  	ret = mtk_hdmi_output_init(hdmi);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
