Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC7954EA8A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 22:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4964310E1F6;
	Thu, 16 Jun 2022 20:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FED10E061
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 20:08:47 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id p8so3106560oip.8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 13:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=g0MarIt5zRodY5q9IT6cX4QN+5PJlnj/cbQklvA9bo4=;
 b=oTc4txpVR+TRxDf03YAXJnd7w7kMIi15kQifCYdOP4xSViIWnr3t4XdzyNNG3rpIIL
 bNG9Eu5YKM3U3pgITzRQaAiAOJW8ZSgNfpq4DPWzIZP7TWcp/eKjqPTSGgRIqlkVwsr5
 l6AesSXhoR2lJujYbPylYoJ2fMKm6T7HXLxUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=g0MarIt5zRodY5q9IT6cX4QN+5PJlnj/cbQklvA9bo4=;
 b=0bO0mpzlHJGU6Bwxg0QBkfSm0Jau2VXEE1ueJmVZoIrBUnphVJ2Bp/nCQoPfsiibxt
 VnAlHp0mGNZAgwomLpBG/7aAxNzOymfflLWdjo3GsFQa13ds6yVpGSU2DLCiWdAcILt4
 95OPeHSnYOykgrjdKAWIHgVsXsMbld4k9Aeg+UN/4vEJcNUIpG/WEUoRkbxUb2PqVje0
 6LNZGVo8Rvhc2P7vXUoOQCa9aJEAlzkWvvcHk8cOem2o2Kkiq/2TXHlI2i55GziDcqON
 4Ivo2eTz5aSSeK8Sl2ub74cKQtyGefnUsAUtD2bGpm1Ofc86/T+aqxKxiI67BNdHSxtN
 QwsQ==
X-Gm-Message-State: AJIora8VorlHvwKdYbbhFyRhnhnxKtw1BuYTR3w7XUfVTXR8I+e1rEQZ
 X0RexM5uNIoJLCi33SgTjWy7Dt46urpwPnKvXLD9KA==
X-Google-Smtp-Source: AGRyM1sw7huEffOPIjsyUJ0iDsYukEI2Ma5CpHqS1GYaR2Fbt5m5eafAbo4hwgXr8lsWXVCfQrNZQeEDYyui4gfCEp0=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr3354859oil.193.1655410127124; Thu, 16
 Jun 2022 13:08:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jun 2022 13:08:46 -0700
MIME-Version: 1.0
In-Reply-To: <1655399361-10842-2-git-send-email-quic_khsieh@quicinc.com>
References: <1655399361-10842-1-git-send-email-quic_khsieh@quicinc.com>
 <1655399361-10842-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 16 Jun 2022 13:08:46 -0700
Message-ID: <CAE-0n50GVKagM5Q0vZnMREesJqa99bEouiiB7PeG1nzix7EmdQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] drm/msm/dp: force link training for display
 resolution change
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-06-16 10:09:20)
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 0745fde..9a39b00 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -21,7 +21,8 @@ struct dp_ctrl {
>  };
>
>  int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
> -int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
> +int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train);
> +int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl);

Instead of declaring it here how about forward declaring it in the C
file and making it static?

>  int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
>  int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl);
>  int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
