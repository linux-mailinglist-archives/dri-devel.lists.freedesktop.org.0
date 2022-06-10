Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ABE547005
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 01:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF9011A3FF;
	Fri, 10 Jun 2022 23:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF0911A36D;
 Fri, 10 Jun 2022 23:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654903938; x=1686439938;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=w/FOh0Rryq87K89eHJ8OClXAVl0+b6TmG4Pvq3oySnw=;
 b=jGzHwKuHLVBrYNWojn+WYa8NwDU7561BCuHqa3dIF8RN0FR7vOZai1Vh
 JSO/49WAp5clKYZlGVP0BsBM1lPRDO3FDX1oSFTN+CKsdvrJ0NKBuA0e/
 fNUuZVRIApUjnbZbuwG8kh0k1WmyKzrstP3qA7OSJwgR+I0iaHVDP1XMB c=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 10 Jun 2022 16:32:17 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 16:32:17 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 10 Jun 2022 16:32:16 -0700
Received: from [10.38.242.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 10 Jun
 2022 16:32:13 -0700
Message-ID: <92f47c6f-779c-d651-b4c0-6eade1a2653a@quicinc.com>
Date: Fri, 10 Jun 2022 16:32:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dsi: Use single function for reset
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, <dri-devel@lists.freedesktop.org>
References: <20220610220259.220622-1-luca@z3ntu.xyz>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220610220259.220622-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, phone-devel@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/10/2022 3:02 PM, Luca Weiss wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> There is currently two function for performing reset: dsi_sw_reset and
> dsi_sw_reset_restore. Only difference betwean those is that latter one
betwean --> between
> assumes that DSI controller is enabled. In contrary former one assumes
> that controller is disabled and executed during power-on. However this
> assumtion is not true mobile devices which have boot splash set up by
> boot-loader.
> 
> This patch removes dsi_sw_reset_restore and makes dsi_sw_reset disable
> DSI controller during reset sequence if it's enabled.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Otherwise, looks good to me,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 48 +++++++++++++-----------------
>   1 file changed, 21 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index a95d5df52653..bab2634ebd11 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1080,12 +1080,32 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   
>   static void dsi_sw_reset(struct msm_dsi_host *msm_host)
>   {
> +	u32 ctrl;
> +
> +	ctrl = dsi_read(msm_host, REG_DSI_CTRL);
> +
> +	if (ctrl & DSI_CTRL_ENABLE) {
> +		dsi_write(msm_host, REG_DSI_CTRL, ctrl & ~DSI_CTRL_ENABLE);
> +		/*
> +		 * dsi controller need to be disabled before
> +		 * clocks turned on
> +		 */
> +		wmb();
> +	}
> +
>   	dsi_write(msm_host, REG_DSI_CLK_CTRL, DSI_CLK_CTRL_ENABLE_CLKS);
>   	wmb(); /* clocks need to be enabled before reset */
>   
> +	/* dsi controller can only be reset while clocks are running */
>   	dsi_write(msm_host, REG_DSI_RESET, 1);
>   	msleep(DSI_RESET_TOGGLE_DELAY_MS); /* make sure reset happen */
>   	dsi_write(msm_host, REG_DSI_RESET, 0);
> +	wmb(); /* controller out of reset */
> +
> +	if (ctrl & DSI_CTRL_ENABLE) {
> +		dsi_write(msm_host, REG_DSI_CTRL, ctrl);
> +		wmb();	/* make sure dsi controller enabled again */
> +	}
>   }
>   
>   static void dsi_op_mode_config(struct msm_dsi_host *msm_host,
> @@ -1478,32 +1498,6 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
>   	return len;
>   }
>   
> -static void dsi_sw_reset_restore(struct msm_dsi_host *msm_host)
> -{
> -	u32 data0, data1;
> -
> -	data0 = dsi_read(msm_host, REG_DSI_CTRL);
> -	data1 = data0;
> -	data1 &= ~DSI_CTRL_ENABLE;
> -	dsi_write(msm_host, REG_DSI_CTRL, data1);
> -	/*
> -	 * dsi controller need to be disabled before
> -	 * clocks turned on
> -	 */
> -	wmb();
> -
> -	dsi_write(msm_host, REG_DSI_CLK_CTRL, DSI_CLK_CTRL_ENABLE_CLKS);
> -	wmb();	/* make sure clocks enabled */
> -
> -	/* dsi controller can only be reset while clocks are running */
> -	dsi_write(msm_host, REG_DSI_RESET, 1);
> -	msleep(DSI_RESET_TOGGLE_DELAY_MS); /* make sure reset happen */
> -	dsi_write(msm_host, REG_DSI_RESET, 0);
> -	wmb();	/* controller out of reset */
> -	dsi_write(msm_host, REG_DSI_CTRL, data0);
> -	wmb();	/* make sure dsi controller enabled again */
> -}
> -
>   static void dsi_hpd_worker(struct work_struct *work)
>   {
>   	struct msm_dsi_host *msm_host =
> @@ -1520,7 +1514,7 @@ static void dsi_err_worker(struct work_struct *work)
>   
>   	pr_err_ratelimited("%s: status=%x\n", __func__, status);
>   	if (status & DSI_ERR_STATE_MDP_FIFO_UNDERFLOW)
> -		dsi_sw_reset_restore(msm_host);
> +		dsi_sw_reset(msm_host);
>   
>   	/* It is safe to clear here because error irq is disabled. */
>   	msm_host->err_work_state = 0;
