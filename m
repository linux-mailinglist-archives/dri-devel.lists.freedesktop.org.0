Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F19C4B7D85
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 03:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8605B10E615;
	Wed, 16 Feb 2022 02:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7DE10E60D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 02:35:06 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id q8so1043191oiw.7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 18:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=PlgslkolwKT8ECeonpQQtcOPkDq0gdHQS+7KK4BVmgk=;
 b=a2haUXr+v2kALve20JSLzgExCWHPXTKUFI8Xjo+aP0WlPIFoRb/cvpg7x4rK6eAGBk
 sflk7cjEnHyIWrhoDXOjZONiEyOSSbmuhGLzSi+E30KGbs8u1+vF0//Jap/c1NAB0aRe
 V7I3S0YRtHvqJhLK3/u1Id+ydO5aptVl0KK+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=PlgslkolwKT8ECeonpQQtcOPkDq0gdHQS+7KK4BVmgk=;
 b=gDrXrYrSGKtrp7vBHBFTBZc++WHR7lEhZddbXcGcso+13d8cfxZG0lwp50MriDWggO
 Lssg8W8z1NN4yQpsAXccssy99e5CdU1bvj3BwW0EWXuiYBdWn5fX3rFRUN0k/efh1snD
 U2B/Xer0h4sCKFmVYdoJsZixniofrphkVt4y2GQZRy3gk1pUr4Fg2JfsJzvIr8s1tMDb
 cIdVdDE2dFwTOI8Dl8ElWP2E5uOa/v9BACqqCySPmAG3F9juAXNkEqFQXz3IrVMpArZz
 oVYZSbcrUbj8mIx4EtLiwjp7f0GIp4RgPnHEfeqn0dGgB3qi518oUU/xPOAXYErntvGF
 alPg==
X-Gm-Message-State: AOAM532yUzx5bnpidxUc6AaxFbhwgj/L5LtnypmS8YE56AAJhCR6ZekH
 u+7/16hZt5C/eX2L31Ya0Uhy8uYq9DQLo5+rAjKUtQ==
X-Google-Smtp-Source: ABdhPJwOtjytPL+xYhnUaf+oMOlWs4QPLJh7SxbeMP0me9/HgOnownxFWMVw/manmzPwSdPltpwpaFklezhTdlNw3oI=
X-Received: by 2002:a05:6808:b2f:b0:2cf:9af3:1687 with SMTP id
 t15-20020a0568080b2f00b002cf9af31687mr341027oij.112.1644978906051; Tue, 15
 Feb 2022 18:35:06 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:35:05 -0800
MIME-Version: 1.0
In-Reply-To: <20220131210513.2177652-3-dmitry.baryshkov@linaro.org>
References: <20220131210513.2177652-1-dmitry.baryshkov@linaro.org>
 <20220131210513.2177652-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 18:35:05 -0800
Message-ID: <CAE-0n52Z3fX1Q=Hi0zFp6U7+gQd_A4t_KhtmrVQ9GBN2Oxj5ZQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/msm/dp: rewrite dss_module_power to use bulk
 clock functions
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-01-31 13:05:13)
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 094b39bfed8c..f16072f33cdb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -10,7 +10,6 @@
>  #include <linux/phy/phy.h>
>  #include <linux/phy/phy-dp.h>
>
> -#include "dp_clk_util.h"
>  #include "msm_drv.h"
>
>  #define DP_LABEL "MDSS DP DISPLAY"
> @@ -106,6 +105,22 @@ struct dp_regulator_cfg {
>         struct dp_reg_entry regs[DP_DEV_REGULATOR_MAX];
>  };
>
> +enum dss_clk_type {
> +       DSS_CLK_AHB, /* no set rate. rate controlled through rpm */
> +       DSS_CLK_PCLK,
> +};
> +
> +struct dss_clk {
> +       enum dss_clk_type type;
> +       unsigned long rate;
> +};
> +
> +struct dss_module_power {
> +       unsigned int num_clk;
> +       struct clk_bulk_data *clocks;
> +       struct dss_clk *clk_config;
> +};
> +
>  /**
>   * struct dp_parser - DP parser's data exposed to clients
>   *
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
> index b48b45e92bfa..318e1f8629cb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.c
> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> @@ -105,59 +105,40 @@ static int dp_power_clk_init(struct dp_power_private *power)
>         ctrl = &power->parser->mp[DP_CTRL_PM];
>         stream = &power->parser->mp[DP_STREAM_PM];
>
> -       rc = msm_dss_get_clk(dev, core->clk_config, core->num_clk);
> +       rc = devm_clk_bulk_get(dev, core->num_clk, core->clocks);

Could we go further and devm_clk_bulk_get_all() and then either have
some new clk API that goes through the bulk list and finds the one named
something and hands over a pointer to it, think "clk_get() on top of
clk_bulk_data", or just get the clk again that you want to set a rate on
and have two pointers but otherwise it's a don't care. Then we wouldn't
need to do much at all here to store the rate settable clk and find it
in a loop.

>         if (rc) {
>                 DRM_ERROR("failed to get %s clk. err=%d\n",
>                         dp_parser_pm_name(DP_CORE_PM), rc);
>                 return rc;
>         }
>
> -       rc = msm_dss_get_clk(dev, ctrl->clk_config, ctrl->num_clk);
> +       rc = devm_clk_bulk_get(dev, ctrl->num_clk, ctrl->clocks);
>         if (rc) {
>                 DRM_ERROR("failed to get %s clk. err=%d\n",
>                         dp_parser_pm_name(DP_CTRL_PM), rc);
> -               msm_dss_put_clk(core->clk_config, core->num_clk);
>                 return -ENODEV;
>         }
>
> -       rc = msm_dss_get_clk(dev, stream->clk_config, stream->num_clk);
> +       rc = devm_clk_bulk_get(dev, stream->num_clk, stream->clocks);
>         if (rc) {
>                 DRM_ERROR("failed to get %s clk. err=%d\n",
>                         dp_parser_pm_name(DP_CTRL_PM), rc);
> -               msm_dss_put_clk(core->clk_config, core->num_clk);
>                 return -ENODEV;
>         }
>
>         return 0;
>  }
>
> -static int dp_power_clk_deinit(struct dp_power_private *power)
> -{
> -       struct dss_module_power *core, *ctrl, *stream;
> -
> -       core = &power->parser->mp[DP_CORE_PM];
> -       ctrl = &power->parser->mp[DP_CTRL_PM];
> -       stream = &power->parser->mp[DP_STREAM_PM];
> -
> -       if (!core || !ctrl || !stream) {
> -               DRM_ERROR("invalid power_data\n");
> -               return -EINVAL;
> -       }
> -
> -       msm_dss_put_clk(ctrl->clk_config, ctrl->num_clk);
> -       msm_dss_put_clk(core->clk_config, core->num_clk);
> -       msm_dss_put_clk(stream->clk_config, stream->num_clk);
> -       return 0;
> -}
> -
>  static int dp_power_clk_set_link_rate(struct dp_power_private *power,
> -                       struct dss_clk *clk_arry, int num_clk, int enable)
> +                       struct dss_module_power *mp, int enable)
>  {
> +       struct dss_clk *clk_arry = mp->clk_config;
> +       int num_clk = mp->num_clk;
>         u32 rate;
>         int i, rc = 0;
>
>         for (i = 0; i < num_clk; i++) {
> -               if (clk_arry[i].clk) {
> +               if (mp->clocks[i].clk) {
>                         if (clk_arry[i].type == DSS_CLK_PCLK) {
>                                 if (enable)
>                                         rate = clk_arry[i].rate;
> @@ -168,9 +149,49 @@ static int dp_power_clk_set_link_rate(struct dp_power_private *power,
>                                 if (rc)
>                                         break;
>                         }
> +               } else {
> +                       DRM_ERROR("%pS->%s: '%s' is not available\n",
> +                               __builtin_return_address(0), __func__,
> +                               mp->clocks[i].id);
> +                       rc = -EPERM;
> +                       break;
> +               }
> +       }
> +       return rc;
> +}
> +
> +static int dp_clk_set_rate(struct dss_module_power *mp)
> +{
> +       struct dss_clk *clk_arry = mp->clk_config;
> +       int num_clk = mp->num_clk;
> +       int i, rc = 0;
>
> +       for (i = 0; i < num_clk; i++) {
> +               if (mp->clocks[i].clk) {
> +                       if (clk_arry[i].type != DSS_CLK_AHB) {

This loops is gross.

> +                               DRM_DEBUG("%pS->%s: '%s' rate %ld\n",
> +                                       __builtin_return_address(0), __func__,
> +                                       mp->clocks[i].id,
> +                                       clk_arry[i].rate);
> +                               rc = clk_set_rate(mp->clocks[i].clk,
> +                                       clk_arry[i].rate);
> +                               if (rc) {
> +                                       DRM_ERROR("%pS->%s: %s failed. rc=%d\n",
> +                                               __builtin_return_address(0),
> +                                               __func__,
> +                                               mp->clocks[i].id, rc);
> +                                       break;
> +                               }
> +                       }
> +               } else {
> +                       DRM_ERROR("%pS->%s: '%s' is not available\n",
> +                               __builtin_return_address(0), __func__,
> +                               mp->clocks[i].id);
> +                       rc = -EPERM;
> +                       break;
>                 }
>         }
> +
>         return rc;
>  }
>
