Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 582414F3CA0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 18:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AC910EB3E;
	Tue,  5 Apr 2022 16:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FDC10EB3D;
 Tue,  5 Apr 2022 16:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649176161; x=1680712161;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sgkmuD5Q/bXwbmH1VXjyWtRp1MnQCr2LuBfHrrC73qI=;
 b=LhL9VLPdYa1pU/Xbr0OdD/aDDdlPYlbf8gQgE3dcwkEustY/nKaSAG6m
 9suSJVtPI6WOM7zyjRuTNRafiFAJF++zBL4RcqnT8vetrGEx6BFVjjv91
 zNsMyYP6WfsejqeT/u97PSG9cxWIDZ0m0P2vVn9TyIW0pDCm6to9065yD U=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 05 Apr 2022 09:29:19 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 09:29:03 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 5 Apr 2022 09:29:03 -0700
Received: from [10.38.244.111] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 5 Apr 2022
 09:29:01 -0700
Message-ID: <2a276e9b-c1d1-ab75-4aaf-e5475143bb07@quicinc.com>
Date: Tue, 5 Apr 2022 09:28:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dsi: fix error checks and return values for DSI
 xmit functions
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220401231104.967193-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220401231104.967193-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/1/2022 4:11 PM, Dmitry Baryshkov wrote:
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

Looks reasonable to me,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++++-------
>   1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index d51e70fab93d..8925f60fd9ec 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1341,10 +1341,10 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
>   			dsi_get_bpp(msm_host->format) / 8;
>   
>   	len = dsi_cmd_dma_add(msm_host, msg);
> -	if (!len) {
> +	if (len < 0) {
>   		pr_err("%s: failed to add cmd type = 0x%x\n",
>   			__func__,  msg->type);
> -		return -EINVAL;
> +		return len;
>   	}
>   
>   	/* for video mode, do not send cmds more than
> @@ -1363,10 +1363,14 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
>   	}
>   
>   	ret = dsi_cmd_dma_tx(msm_host, len);
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
>   	}
>   
>   	return len;
> @@ -2092,9 +2096,12 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *host,
>   		}
>   
>   		ret = dsi_cmds2buf_tx(msm_host, msg);
> -		if (ret < msg->tx_len) {
> +		if (ret < 0) {
>   			pr_err("%s: Read cmd Tx failed, %d\n", __func__, ret);
>   			return ret;
> +		} else if (ret < msg->tx_len) {
> +			pr_err("%s: Read cmd Tx failed, too short: %d\n", __func__, ret);
> +			return -ECOMM;
>   		}
>   
>   		/*
