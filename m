Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE29B503592
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 11:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6536510EB0F;
	Sat, 16 Apr 2022 09:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BB710EB0F
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 09:12:33 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4F2AC3F66F;
 Sat, 16 Apr 2022 11:12:31 +0200 (CEST)
Date: Sat, 16 Apr 2022 11:12:29 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: drm/msm/dsi: fix error checks and return values for DSI xmit
 functions
Message-ID: <20220416091229.pwek4wblroaabhio@SoMainline.org>
References: <20220401231104.967193-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401231104.967193-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On 2022-04-02 02:11:04, Dmitry Baryshkov wrote:
> As noticed by Dan ([1] an the followup thread) there are multiple issues
> with the return values for MSM DSI command transmission callback. In
> the error case it can easily return a positive value when it should
> have returned a proper error code.
> 
> This commits attempts to fix these issues both in TX and in RX paths.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20211001123617.GH2283@kili/
> 
> Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Thank you for your patience waiting for the requested tests; this patch
seems to have no adverse effect on our cmdmode panels.

Tested-by: Marijn Suijten <marijn.suijten@somainline.org>

On the following devices:
- Sony Xperia X (Loire Suzu, MSM8976), on Linux 5.17;
- Sony Xperia 10 II (Seine PDX201, SM6125), on -next 20220318;
- Sony Xperia XA2 Ultra (Nile Discovery, SDM630), on Linux 5.16.

Apologies for the older kernel versions, that's what happens when having
too many patches to dig through and too little hobby time to send them.
Let me know if there's a patch dependency that you like to be included.

- Marijn

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index d51e70fab93d..8925f60fd9ec 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1341,10 +1341,10 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
>  			dsi_get_bpp(msm_host->format) / 8;
>  
>  	len = dsi_cmd_dma_add(msm_host, msg);
> -	if (!len) {
> +	if (len < 0) {
>  		pr_err("%s: failed to add cmd type = 0x%x\n",
>  			__func__,  msg->type);
> -		return -EINVAL;
> +		return len;
>  	}
>  
>  	/* for video mode, do not send cmds more than
> @@ -1363,10 +1363,14 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
>  	}
>  
>  	ret = dsi_cmd_dma_tx(msm_host, len);
> -	if (ret < len) {
> -		pr_err("%s: cmd dma tx failed, type=0x%x, data0=0x%x, len=%d\n",
> -			__func__, msg->type, (*(u8 *)(msg->tx_buf)), len);
> -		return -ECOMM;
> +	if (ret < 0) {
> +		pr_err("%s: cmd dma tx failed, type=0x%x, data0=0x%x, len=%d, ret=%d\n",
> +			__func__, msg->type, (*(u8 *)(msg->tx_buf)), len, ret);
> +		return ret;
> +	} else if (ret < len) {
> +		pr_err("%s: cmd dma tx failed, type=0x%x, data0=0x%x, ret=%d len=%d\n",
> +			__func__, msg->type, (*(u8 *)(msg->tx_buf)), ret, len);
> +		return -EIO;
>  	}
>  
>  	return len;
> @@ -2092,9 +2096,12 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *host,
>  		}
>  
>  		ret = dsi_cmds2buf_tx(msm_host, msg);
> -		if (ret < msg->tx_len) {
> +		if (ret < 0) {
>  			pr_err("%s: Read cmd Tx failed, %d\n", __func__, ret);
>  			return ret;
> +		} else if (ret < msg->tx_len) {
> +			pr_err("%s: Read cmd Tx failed, too short: %d\n", __func__, ret);
> +			return -ECOMM;
>  		}
>  
>  		/*
