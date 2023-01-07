Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C0F661195
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 21:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECB010E1C3;
	Sat,  7 Jan 2023 20:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 113078 seconds by postgrey-1.36 at gabe;
 Sat, 07 Jan 2023 20:29:33 UTC
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com
 (mailrelay4-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:403::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBAA10E1C3
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 20:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=rLc3YOYbPb9xwmyzxI6Lpp2PYUZ9uu8/nbksT8vM0m4=;
 b=wV1bp9q9M9mWhrbjGKzzHREqP2xOnbX74ksjXsaLvEXewl2gCQHp2fpPRKdtvosNVstynBeW05VDI
 vL8aj2fKWtXR3etkNT6gVUeujgnN9DPXKS+ou1sukMlzERzI/8uszKIpimZOsBi//koZCR1AGZAi6T
 BVyQpARfE77gLhbcmuzbshuHmHlw1FHGzVuIdwFdEgmxysHwdCDipepnYLXQ319OL6j1OQaZYPYoKn
 wB9JcWZtiCooC278G3CuFJMHFIj9mb3Y615H4Af4QUR+Jfcj0foCcKpR/jUpDNiXc+7CIcz5vVePwn
 NPA4yrsm2tHjbcVQ/UaZJT0jBJeYOoA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=rLc3YOYbPb9xwmyzxI6Lpp2PYUZ9uu8/nbksT8vM0m4=;
 b=xr2GmnEO+b/JkiuLoADgRCNiswL18k4T0RfjpdzgokXtktLQVOjcPBMNfhD/w4BhyzamBF3viUlpL
 eh/wIqlBg==
X-HalOne-ID: fc4bdb3e-8ec9-11ed-91a0-87783a957ad9
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4 (Halon) with ESMTPSA
 id fc4bdb3e-8ec9-11ed-91a0-87783a957ad9;
 Sat, 07 Jan 2023 20:29:31 +0000 (UTC)
Date: Sat, 7 Jan 2023 21:29:29 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: xinlei.lee@mediatek.com
Subject: Re: [PATCH 1/2] drm/mediatek: dsi: Reduce the time of dsi from LP11
 to sending cmd
Message-ID: <Y7nWKRHQr9vumv0V@ravnborg.org>
References: <1672974321-18947-1-git-send-email-xinlei.lee@mediatek.com>
 <1672974321-18947-2-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1672974321-18947-2-git-send-email-xinlei.lee@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, thierry.reding@gmail.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 11:05:20AM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> According to Figure 16 Turnaround Procedure on page 36 in [1], you
> can see the status of LP-00 -> LP10 -> LP11. This state can correspond
> to the state of DSI from LP00 -> LP11 in mtk_dsi_lane_ready function
> in mtk_dsi.c.
> 
> LP-00 -> LP10 -> LP11 takes about 2*TLPX time (refer to [1] page 51
> to see that TLPX is 50ns).
> 
> The delay at the end of the mtk_dsi_lane_ready function should be
> greater than the 2*TLPX specified by the DSI spec, and less than
> the time specified by the DSI_RX (generally 6ms to 40ms), to avoid
> problems caused by the RX specification.
> 
> [1]:mipi_D-PHY_specification_v1-1
> 
> Fixes: 39e8d062b03c ("drm/mediatek: Keep dsi as LP00 before dcs cmds transfer")
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Seems OK.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 3b7d13028fb6..9e1363c9fcdb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -721,7 +721,7 @@ static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
>  		mtk_dsi_clk_ulp_mode_leave(dsi);
>  		mtk_dsi_lane0_ulp_mode_leave(dsi);
>  		mtk_dsi_clk_hs_mode(dsi, 0);
> -		msleep(20);
> +		usleep_range(1000, 3000);
>  		/* The reaction time after pulling up the mipi signal for dsi_rx */
>  	}
>  }
> -- 
> 2.18.0
