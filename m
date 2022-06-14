Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1465354BD27
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 23:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2067210F0A2;
	Tue, 14 Jun 2022 21:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3723B112A85
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 21:59:08 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id h187so13305371oif.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 14:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=5yJj86hSPwBzwhbQhqdV1Hn3ZaFbVir/hOB/SXTT3bI=;
 b=ZdGEZsOt+TRm+aYxq42AYd4MLTcEpKed0OVtU15Eb9mKcEjoxGxefcc8Hou/DOFmCp
 ki0mc220xUAOCHMnS/OCVj7tuFFIQ/OhnyOzgqy38WOee9k8w1eGsxVOtxPZOic5yyPU
 8l81rocDbnMve9NNM0Jcnj6qmGymABDBeO0dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=5yJj86hSPwBzwhbQhqdV1Hn3ZaFbVir/hOB/SXTT3bI=;
 b=Lgv04Hm3J9PxspOP8UVJuQM4bqufff4RvUrJ3fWX6EflXUAIFKVkj5naW9NDTrShte
 Y7D3Sh9j7GOLOUkbtNXOJZOIR3cHS6NIgKXwSYMRfMaSaRaVSpRmW/epZuwsj78PyUhQ
 aKebmd43qDaIetBvx3fHWq88VOXlV6LuTepFoy5TBITRfI98izJddxkpxASwRr13ih1J
 bvQjMEowwhQUKBecpAlvSCYusNEvVJESB1iuj768X5O6SMMaHfUGYDcKLoimBfhgiaoW
 1vLn4BdBQetAMxiRowbeVClNmr+wYXgO84t52nsp42INbM6B6kh7ZNMYYHsHgAah+rnC
 q1jA==
X-Gm-Message-State: AOAM532VoYiH/mxd6ORk+dBq/lBZFtQVqqemEwLJbS3hmDp879+5aCUa
 pVqSn87kki731Eiv2re2SLTzd8t4wv0SvMHap/EWSA==
X-Google-Smtp-Source: ABdhPJxDYah7bUTWBiwxr/l4NWNy6VphDHyLT3XGi+NAYbfMAhtii820vbsYtQ0n/RqMQE67M2fjkNbG1wG1z9Wq3cE=
X-Received: by 2002:a05:6808:1703:b0:32e:851e:7f81 with SMTP id
 bc3-20020a056808170300b0032e851e7f81mr3333511oib.63.1655243947436; Tue, 14
 Jun 2022 14:59:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 Jun 2022 14:59:06 -0700
MIME-Version: 1.0
In-Reply-To: <1655240702-12230-1-git-send-email-quic_khsieh@quicinc.com>
References: <1655240702-12230-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 14 Jun 2022 14:59:06 -0700
Message-ID: <CAE-0n52EAyTcQd6CiwXT1T658C-b+2r14BK_3-tf-ZiJdzqaAw@mail.gmail.com>
Subject: Re: [PATCH v6] drm/msm/dp: force link training for display resolution
 change
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-06-14 14:05:02)
> Display resolution change is implemented through drm modeset. Older
> modeset (resolution) has to be disabled first before newer modeset
> (resolution) can be enabled. Display disable will turn off both
> pixel clock and main link clock so that main link have to be
> re-trained during display enable to have new video stream flow
> again. At current implementation, display enable function manually
> kicks up irq_hpd_handle which will read panel link status and start
> link training if link status is not in sync state.
>
> However, there is rare case that a particular panel links status keep
> staying in sync for some period of time after main link had been shut
> down previously at display disabled. In this case, main link retraining
> will not be executed by irq_hdp_handle(). Hence video stream of newer
> display resolution will fail to be transmitted to panel due to main
> link is not in sync between host and panel.
>
> This patch will bypass irq_hpd_hanle() in favor of directly call

s/hanle/handle/

> dp_ctrl_on_stream() to always perform link training in regardless of
> main link status. So that no unexpected exception resolution change
> failure cases will happen. Also this implementation are more efficient
> than manual kicking off irq_hpd_handle function.
>
> Changes in v2:
> -- set force_link_train flag on DP only (is_edp == false)
>
> Changes in v3:
> -- revise commit  text
> -- add Fixes tag
>
> Changes in v4:
> -- revise commit  text
>
> Changes in v5:
> -- fix spelling at commit text
>
> Changes in v6:
> -- split dp_ctrl_on_stream() for phy test case
> -- revise commit text for modeset
>
> Fixes: 62671d2ef24b ("drm/msm/dp: fixes wrong connection state caused by failure of link train")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 31 +++++++++++++++++++++++--------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 ++++++-------
>  3 files changed, 31 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index af7a80c..cb9c7af 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1807,7 +1807,27 @@ static int dp_ctrl_link_retrain(struct dp_ctrl_private *ctrl)
>         return dp_ctrl_setup_main_link(ctrl, &training_step);
>  }
>
> -int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
> +int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
> +{
> +       int ret = 0;

Drop assignment please.

> +       struct dp_ctrl_private *ctrl;
> +
> +       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +       ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
> +
> +       ret = dp_ctrl_enable_stream_clocks(ctrl);
> +       if (ret) {
> +               DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> +               return ret;
> +       }
> +
> +       dp_ctrl_send_phy_test_pattern(ctrl);

None of this code needs to be run in the normal display on case?

> +
> +       return 0;
> +}
> +
> +int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
>  {
>         int ret = 0;
>         bool mainlink_ready = false;
> @@ -1843,12 +1863,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>                 goto end;
>         }
>
> -       if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
> -               dp_ctrl_send_phy_test_pattern(ctrl);
> -               return 0;
> -       }
> -
> -       if (!dp_ctrl_channel_eq_ok(ctrl))
> +       if (force_link_train || !dp_ctrl_channel_eq_ok(ctrl))
>                 dp_ctrl_link_retrain(ctrl);
>
>         /* stop txing train pattern to end link training */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c388323..b6d25ab 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1688,10 +1689,12 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>
>         state =  dp_display->hpd_state;
>
> -       if (state == ST_DISPLAY_OFF)
> +       if (state == ST_DISPLAY_OFF) {
>                 dp_display_host_phy_init(dp_display);
> +               force_link_train = true;
> +       }
>
> -       dp_display_enable(dp_display, 0);
> +       dp_display_enable(dp_display, force_link_train);

Do we need to pass it from here? Why can't dp_display_enable() simply
check for 'state == ST_DISPLAY_OFF' and then force retrain the link?
