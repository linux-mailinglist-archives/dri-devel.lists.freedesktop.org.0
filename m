Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306F1526D49
	for <lists+dri-devel@lfdr.de>; Sat, 14 May 2022 01:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CABF10E6D1;
	Fri, 13 May 2022 23:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3761A10E868;
 Fri, 13 May 2022 23:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652482952; x=1684018952;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MQ2siNTqD+G9ABJGcW9zpt5yW8C6C+FKy6bdjl0PIeY=;
 b=C+BKdiDJ/QGzOplvRv/As7h4ulbPgrrTf/HilhSOkgcEsWrkYO/SFoaL
 cWKH7QhGfdeMQPr4F7pkQU8o5I43J5yT3icsue3g+5NNhqu8QmXnCgFi9
 C2BNpa8ZRl0UsB5BbnCUD4iFQYDa971kKTd/xkC1Mh48sIX3j88K9s93t I=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 13 May 2022 16:02:31 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 16:02:30 -0700
Received: from [10.71.108.57] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 13 May
 2022 16:02:30 -0700
Message-ID: <67655b35-ba92-8dd1-e939-b45335b0b24e@quicinc.com>
Date: Fri, 13 May 2022 16:02:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] drm/msm/dpu: limit writeback modes according to
 max_linewidth
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 <freedreno@lists.freedesktop.org>
References: <20220513225959.19004-1-quic_abhinavk@quicinc.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20220513225959.19004-1-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, quic_aravindh@quicinc.com,
 quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/13/2022 3:59 PM, Abhinav Kumar wrote:
> Writeback modes were being added according to mode_config.max_width
> but this is assigned to double of max_mixer_width.
> 
> For compositors/clients using a single SSPP, this will fail
> the dpu_plane's atomic check as it checks for max_linewidth.
> 
> Limit writeback modes according to max_linewidth to allow
> even compositors/clients which use only a single SSPP to
> use writeback.
> 
> Fixes: 77b001acdcfeb ("drm/msm/dpu: add the writeback connector layer")
> Reported-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # Trogdor (SC8170)

> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> index 7620ffe55779..399115e4e217 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -8,8 +8,10 @@
>   static int dpu_wb_conn_get_modes(struct drm_connector *connector)
>   {
>   	struct drm_device *dev = connector->dev;
> +	struct msm_drm_private *priv = dev->dev_private;
> +	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>   
> -	return drm_add_modes_noedid(connector, dev->mode_config.max_width,
> +	return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_linewidth,
>   			dev->mode_config.max_height);
>   }
>   
> -- 
> 2.35.1
> 
