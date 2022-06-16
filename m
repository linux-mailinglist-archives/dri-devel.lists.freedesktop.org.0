Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0760354EDF6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 01:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E5E10E6E1;
	Thu, 16 Jun 2022 23:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BE410E6E1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 23:39:31 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id s124so3679254oia.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 16:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=p6AMxpkA8TTGmEn1Bk60SJEuUpFSzeYyFwi5LwIblKY=;
 b=QoS7HSJcdZbZ6I1shW8c8Ggj/S/yYty4RWZXUUryK1d2L/wd7sLzx8TtlNWAr5tKPh
 AnyYnAmWsf3hi92uObQ0MmlBsoxc2/xtqjixO2sIOx+fxaF8R06D9WWa6K1q2kC9XnOW
 0eQNoUmCMLsWlyATgVG8WVyxWQX5zBwuwAGOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=p6AMxpkA8TTGmEn1Bk60SJEuUpFSzeYyFwi5LwIblKY=;
 b=6oGxuZvpQB2QJ4ulLDjGLnaAbQKcASlaFEAZYJYdn0la15FCvmfUVnlrvpivShS5wO
 k14SVDJ/IFIjTlkYUtb7ypelrLbMnBGYenREX1Yv+s6M+7gcNMPH/0kksjSEiz+O6AFv
 UM5VCcJSaJ4vYLrdo4Zfj2yBQT4qH2xXq3xnDbPPrEVB2gwWbDEuajEIQ9CKxQS+Pjfb
 1/9vdIE6QBAXGK4OZZbD6RHx94tPAqoNC6p/LPvGXfqrkf7l/BfKjfSiohZMHYuI82MX
 03EppMJ3zpD5mtBKonkpF/QiTop3lORozDWepc3ZVU4LPAoLlvPGEwId4uklwfo295jD
 8DmA==
X-Gm-Message-State: AJIora/67EmzOMLu6BU+2OGPR7fjvNANPX7b+jADd8gjXTJeoxLyTdny
 Zhrpc2IL2oyJUP8zhFESyjj2o7S3hbOeB1t7K8nL4Q==
X-Google-Smtp-Source: AGRyM1tJkP1MW9aiih9SxFvzYQIAdzAgdaP270BY5q2s7l4Xb6sprjP3JR24sFt3jyoliB8V5lZ19MPRnckBuygfQro=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr3721825oil.193.1655422770319; Thu, 16
 Jun 2022 16:39:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jun 2022 16:39:29 -0700
MIME-Version: 1.0
In-Reply-To: <1655411200-7255-1-git-send-email-quic_khsieh@quicinc.com>
References: <1655411200-7255-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 16 Jun 2022 16:39:29 -0700
Message-ID: <CAE-0n529kPSzweLuwq60b2d7Z49PZO+N_x3rxQW9iHKGgcqrjw@mail.gmail.com>
Subject: Re: [PATCH v9] drm/msm/dp: force link training for display resolution
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

Quoting Kuogee Hsieh (2022-06-16 13:26:40)
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
> This patch will bypass irq_hpd_handle() in favor of directly call
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
> Changes in v7:
> -- drop 0 assignment at local variable (ret = 0)
>
> Changes in v8:
> -- add patch to remove pixel_rate from dp_ctrl
>
> Changes in v9:
> -- forward declare dp_ctrl_on_stream_phy_test_report()
>
> Fixes: 62671d2ef24b ("drm/msm/dp: fixes wrong connection state caused by failure of link train")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
