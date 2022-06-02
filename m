Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BFE53BFBD
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 22:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE30113479;
	Thu,  2 Jun 2022 20:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD2A113476;
 Thu,  2 Jun 2022 20:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654201494; x=1685737494;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5iVKzHg2aC6sarFPY5Jcp0A0AL32g8HzGVyqht6Aoos=;
 b=gRf7scRhnXvsAogdHZFuGxfgQ/zHp4pCDDBgc49pdo0lic7C7plAiuz2
 3c1UHMiOBuwpq1CgpWc6SNwFwynJ+LwhV0KqdV7Wz6TjsvCnxnGQzqXyl
 0l8H6hAJbO4p0Q/FjJWzyP5vSTRefDU9JdEKHQ2radZIgpMVf4fbOmVAX 8=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Jun 2022 13:24:53 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 13:24:53 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 13:24:53 -0700
Received: from [10.38.242.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 2 Jun 2022
 13:24:51 -0700
Message-ID: <cb7e2c75-286a-2b74-7e21-bee90a83a91d@quicinc.com>
Date: Thu, 2 Jun 2022 13:24:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 0/7] drm/msm: clean up the hw catalog init
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220602202207.1754351-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220602202207.1754351-1-dmitry.baryshkov@linaro.org>
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



On 6/2/2022 1:22 PM, Dmitry Baryshkov wrote:
> Replace superfluous cfg_init functions, which just assign a static
> config to the struct dpu_mdss_cfg, with static instances of struct
> dpu_mdss_cfg.
> 
> Changes since v2:
>   - Add DPU_MIXER_COMBINED_ALPHA to sc7180's mixer features mask (noted
>     by Abhinav).
> 
> Changes since v1:
>   - Turn catalog->perf and catalog->dma_cfg to be pointers, otherwise
>     clang complains that they are not constant.
> 

I see you have dropped the R-bs from all the changes in V2.
Can you please add them back?

> Dmitry Baryshkov (7):
>    drm/msm/dpu: use feature bit for LM combined alpha check
>    drm/msm/dpu: move VBIF_XINL_QOS_LVL_REMAP size to hw_catalog
>    drm/msm/dpu: remove hwversion field from data structures
>    drm/msm/dpu: change catalog->perf to be a const pointer
>    drm/msm/dpu: change catalog->dma_cfg to be a const pointer
>    drm/msm/dpu: constify struct dpu_mdss_cfg
>    drm/msm/dpu: make dpu hardware catalog static const
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  24 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   4 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   4 +-
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  12 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 502 ++++++++----------
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  20 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |   1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    |   5 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |   2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |   1 -
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |   5 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |   1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |   7 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    |   1 -
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |   1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   5 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |   1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   2 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   |   5 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |   1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   6 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  20 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |   2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   2 +-
>   27 files changed, 283 insertions(+), 359 deletions(-)
> 
