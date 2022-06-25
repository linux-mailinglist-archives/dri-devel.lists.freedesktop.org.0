Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F8255A5FD
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 04:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A1C10EA83;
	Sat, 25 Jun 2022 02:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0992D10E99E;
 Sat, 25 Jun 2022 02:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656122910; x=1687658910;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=p7jXD5vye8mCo99cLlAj5I1u+KfHTKoq179EEVaPDA0=;
 b=pOitx4nEYe4zD54oK/JHupxioUlCwjGHhqAp+ZeE9ukFKzFFPXDhVyg4
 z+6ODe+OGGLXbIg1fP4gXsTCEmKI35w/opWUNW/Hs5/wbGsgAeDV1NxjF
 ytWrLyrQscIvlYPyioXoOicCl+HZaxjQ0+pCNfledVT0wxo9gn5CvBtQy 4=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 24 Jun 2022 19:08:29 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 19:08:29 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 24 Jun 2022 19:08:28 -0700
Received: from [10.111.168.196] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 24 Jun
 2022 19:08:26 -0700
Message-ID: <5fa4aead-985b-e87b-5c66-5d9449fa1b5f@quicinc.com>
Date: Fri, 24 Jun 2022 19:08:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2] drm/msm/dpu: simplify and unify dpu_encoder_get_intf
 and dpu_encoder_get_wb
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220625003028.383259-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220625003028.383259-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/24/2022 5:30 PM, Dmitry Baryshkov wrote:
> Remove extra nestting level from the dpu_encoder_get_intf(), replacing it
> with the explicit return in case the INTF_WB was passed to the function.
> 
> While we are at it, also change dpu_encoder_get_wb() to also use
> explicit return rather than the goto.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> 
> Changes since v1: fix the typo (noticed by Stephen)
> 
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index f435baa500f8..c682d4e02d1b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1255,12 +1255,13 @@ static enum dpu_intf dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
>   {
>   	int i = 0;
>   
> -	if (type != INTF_WB) {
> -		for (i = 0; i < catalog->intf_count; i++) {
> -			if (catalog->intf[i].type == type
> -				&& catalog->intf[i].controller_id == controller_id) {
> -				return catalog->intf[i].id;
> -			}
> +	if (type == INTF_WB)
> +		return INTF_MAX;
> +
> +	for (i = 0; i < catalog->intf_count; i++) {
> +		if (catalog->intf[i].type == type
> +		    && catalog->intf[i].controller_id == controller_id) {
> +			return catalog->intf[i].id;
>   		}
>   	}
>   
> @@ -1273,14 +1274,13 @@ static enum dpu_wb dpu_encoder_get_wb(const struct dpu_mdss_cfg *catalog,
>   	int i = 0;
>   
>   	if (type != INTF_WB)
> -		goto end;
> +		return WB_MAX;
>   
>   	for (i = 0; i < catalog->wb_count; i++) {
>   		if (catalog->wb[i].id == controller_id)
>   			return catalog->wb[i].id;
>   	}
>   
> -end:
>   	return WB_MAX;
>   }
>   
