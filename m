Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C8B733CBC
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 01:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D790810E6A9;
	Fri, 16 Jun 2023 23:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C47E10E6A9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 23:05:48 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4A955213B4;
 Sat, 17 Jun 2023 01:05:46 +0200 (CEST)
Date: Sat, 17 Jun 2023 01:05:44 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 00/19] drm/msm/dpu: another catalog rework
Message-ID: <rr3kwr3gdrek2ly25j6ja4echf2k7s5zbcllgoge5t3e3lyufz@ewysafbh4hpj>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-16 13:02:58, Dmitry Baryshkov wrote:
> Having a macro with 10 arguments doesn't seem like a good idea. It makes
> it inherently harder to compare the actual structure values. Also this
> leads to adding macros covering varieties of the block.
> 
> As it was previously discussed, inline all foo_BLK macros in order to
> ease performing changes to the catalog data.
> 
> Major part of the conversion was performed using vim script found at
> [1]. Then some manual cleanups were applied, like dropping fields set to
> 0.
> 
> Dependencies: msm-next-lumag.
> 
> Changes since v2:
>  - Rebased on top of msm-next-lumag
>  - Fixed MSM_DP/DSI_CONTROLLER_n usage in sm6350 and sm6375 catalog data
>    (Abhinav, Marijn).
> 
> Changes since v1:
>  - Rebased on top of msm-next
>  - Dropped dependency on interrupt rework
> 
> [1] https://pastebin.ubuntu.com/p/26cdW5VpYB/
> [2] https://patchwork.freedesktop.org/patch/542142/?series=119220&rev=1
> 
> Dmitry Baryshkov (19):
>   drm/msm: enumerate DSI interfaces
>   drm/msm/dpu: always use MSM_DP/DSI_CONTROLLER_n
>   drm/msm/dpu: simplify peer LM handling
>   drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
>   drm/msm/dpu: drop enum dpu_mdp and MDP_TOP value
>   drm/msm/dpu: expand .clk_ctrls definitions
>   drm/msm/dpu: drop zero features from dpu_mdp_cfg data
>   drm/msm/dpu: drop zero features from dpu_ctl_cfg data
>   drm/msm/dpu: correct indentation for CTL definitions
>   drm/msm/dpu: inline SSPP_BLK macros
>   drm/msm/dpu: inline DSPP_BLK macros
>   drm/msm/dpu: inline LM_BLK macros
>   drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2 macros
>   drm/msm/dpu: inline MERGE_3D_BLK macros
>   drm/msm/dpu: inline various PP_BLK_* macros
>   drm/msm/dpu: inline WB_BLK macros
>   drm/msm/dpu: inline INTF_BLK and INTF_BLK_DSI_TE macros

Not sure if I'm ready to manually review all the inline patches before
the weekend, so for now this should do:

Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
(On SM8350 and SDM845 for now)

That is, after fixing the cfg-not-assigned regression in patch 4 where
mdp_count is dropped.

- Marijn

>   drm/msm/dpu: drop empty features mask MERGE_3D_SM8150_MASK
>   drm/msm/dpu: drop empty features mask INTF_SDM845_MASK
> 
>  .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 329 ++++++++----
>  .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 348 +++++++++----
>  .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 411 ++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 448 +++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 430 +++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    | 184 +++++--
>  .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  88 +++-
>  .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    | 188 ++++---
>  .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  88 +++-
>  .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  95 +++-
>  .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 418 ++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    | 244 ++++++---
>  .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 484 +++++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 445 +++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 467 ++++++++++++-----
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 130 -----
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   5 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   5 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |  34 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |   7 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  34 +-
>  drivers/gpu/drm/msm/msm_drv.h                 |   8 +-
>  23 files changed, 3320 insertions(+), 1572 deletions(-)
> 
> -- 
> 2.39.2
> 
