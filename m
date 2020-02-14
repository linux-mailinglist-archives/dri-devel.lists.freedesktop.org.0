Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0707715D288
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 08:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9D86E450;
	Fri, 14 Feb 2020 07:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0D4E46E450
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 07:07:26 +0000 (UTC)
X-UUID: 3885370f7ce3465aa5177912297affa6-20200214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=AAKmt3psV2g2K8EVhgPpwHcYTt/PyKL1ctLHR7lIS6k=; 
 b=ij1BKawuDxx6m4M9NOhNWshiLpr6/8t96cXtzq1Ezlt///aK3HTxOLs7egK+M9Rdfjos+YMM/x6/EHsZrwNSMHMcOQkxDUgfnghJTOhqRE24YTwcFwyCdda4awt7XIBdU/8AiJMVE7crCaqWcaau5pxfAziSFj9rW89jheQLhoE=;
X-UUID: 3885370f7ce3465aa5177912297affa6-20200214
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1965851174; Fri, 14 Feb 2020 15:07:23 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 14 Feb 2020 15:06:38 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 14 Feb 2020 15:07:21 +0800
Message-ID: <1581664042.20487.4.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: fix race condition for HDMI jack status
 reporting
From: CK Hu <ck.hu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 14 Feb 2020 15:07:22 +0800
In-Reply-To: <20200213153226.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
References: <20200213153226.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
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

Hi, Tzung-Bi:

On Thu, 2020-02-13 at 15:59 +0800, Tzung-Bi Shih wrote:
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
> plugged_cb and codec_dev are also in danger of race condition.  Instead
> of using mutex to protect them:
> - Checks NULLs first.
> - Uses WRITE_ONCE() to prevent store tearing (i.e. write to plugged_cb
>   after codec_dev).
> - Uses codec_dev as a signal to report HDMI jack status.
> 
> Fixes: 5d3c64477392 ("drm/mediatek: support HDMI jack status reporting")
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> Previous discussion: https://patchwork.kernel.org/patch/11367625/
> Previous attempt: https://patchwork.kernel.org/patch/11378413/
> 
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 03aeb73005ef..b1e5d0c538fa 100644
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
> -	if (hdmi->plugged_cb && hdmi->codec_dev)
> +	mutex_lock(&hdmi->update_plugged_status_lock);
> +	connected = mtk_cec_hpd_high(hdmi->cec_dev);
> +	if (hdmi->codec_dev)
>  		hdmi->plugged_cb(hdmi->codec_dev, connected);
> +	mutex_unlock(&hdmi->update_plugged_status_lock);
>  
>  	return connected ?
>  	       connector_status_connected : connector_status_disconnected;
> @@ -1669,8 +1674,12 @@ static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
>  {
>  	struct mtk_hdmi *hdmi = data;
>  
> -	hdmi->plugged_cb = fn;
> -	hdmi->codec_dev = codec_dev;
> +	if (!fn || !codec_dev)

I think sound driver could be removed for some reason, and fn should be
set to NULL before sound driver removed. In this case, codec_dev != NULL
and fn == NULL.

Regards,
CK

> +		return -EINVAL;
> +
> +	/* Use WRITE_ONCE() to prevent store tearing. */
> +	WRITE_ONCE(hdmi->plugged_cb, fn);
> +	WRITE_ONCE(hdmi->codec_dev, codec_dev);
>  	mtk_hdmi_update_plugged_status(hdmi);
>  
>  	return 0;
> @@ -1729,6 +1738,7 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
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
