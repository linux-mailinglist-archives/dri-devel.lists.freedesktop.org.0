Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB5E4C4D6D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 19:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C0B10E928;
	Fri, 25 Feb 2022 18:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D45A10E928
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 18:13:58 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so7321268oos.9
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 10:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Fagoys/mnguEDY3pl+5sEoAekwrN1hXZMmE77Ir6Qfs=;
 b=hxBADu8QpohF0yutsmwPqmQlJ5vH4rfHMO43pUPkQ3zD+/AxpPBOrlFKGve21EVmSn
 Pvx1oUpXteHi4Oe0mliT2aJlgWMAtBeq85PCVsob6gU3/c6aQfSkQeHJ3In7+IZd9RG4
 +j6cDftYrrsCehirVuVu0t3rhTorY76CTwgNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Fagoys/mnguEDY3pl+5sEoAekwrN1hXZMmE77Ir6Qfs=;
 b=7sMhaFMWPfICUXmF4NgAYbTke4v7GP+4d8jNWBxpbQVFBKilTpkSz3jFz8UlyfAXrQ
 4e/VFc1rqgvDK9EIkPVDZG91jbpDD9nneAfzqBl4nYyC3m5uyHkTm4UlwHKyFg/svZ6L
 CIVxWjh6uvzTaVSJ9Ehb9OiIMbSJQSdpYq+iZ+bXCu9tEVSkUUbJPTODUkLcxXy+8bJa
 tZW6dT8hNyRmgOGtpnn7430g0C1PrLLDYWnQ3nJRWJKvWWIVZ9j9MZZdWTBFURaZrb3S
 pYyA0FfHhgTuS+0m2veooZH3IK5FKgGxjaEqC8ouQyzxqEjacgQLVVDUAIrJ9blSGlH7
 u4Vg==
X-Gm-Message-State: AOAM532FGS4C254dZuNQ8+GnOs1bBqqEBdJuTzXt4KMq6gKVNWF8GWAe
 VPIQ8QDV1dl4xOg9i+NzVcutqs+FwG9Y2LzOAQZcCVbVAhw=
X-Google-Smtp-Source: ABdhPJzLlkAkQdrZ22FiuMj2KKEe2l3uCK3eG6+MQ+vgJaB4N4/OV+2sjXjnVbX7YZ0UHqLBoWWYOwu4siva5+HTxms=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr1849727oao.8.1645812837029; Fri, 25 Feb
 2022 10:13:57 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Feb 2022 10:13:56 -0800
MIME-Version: 1.0
In-Reply-To: <1645576060-3046-4-git-send-email-quic_khsieh@quicinc.com>
References: <1645576060-3046-1-git-send-email-quic_khsieh@quicinc.com>
 <1645576060-3046-4-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 25 Feb 2022 10:13:56 -0800
Message-ID: <CAE-0n506iRCF0TjPDT2Aqe--RXEJbPe8961JiGmW6K2M5VJRUw@mail.gmail.com>
Subject: Re: [PATCH v10 3/4] drm/msm/dpu: revise timing engine programming to
 support widebus feature
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-02-22 16:27:39)
> Widebus feature will transmit two pixel data per pixel clock to interface.
> Timing engine provides driving force for this purpose. This patch base
> on HPG (Hardware Programming Guide) to revise timing engine register
> setting to accommodate both widebus and non widebus application. Also
> horizontal width parameters need to be reduced by half since two pixel
> data are clocked out per pixel clock when widebus feature enabled.
>
> Widebus can be enabled individually at DP. However at DSI, widebus have
> to be enabled along with DSC to achieve pixel clock rate be scaled down
> with same ratio as compression ratio when 10 bits per source component.
> Therefore this patch add no supports of DSI related widebus and compression.
>
> Changes in v2:
> -- remove compression related code from timing
> -- remove op_info from  struct msm_drm_private
> -- remove unnecessary wide_bus_en variables
> -- pass wide_bus_en into timing configuration by struct msm_dp
>
> Changes in v3:
> -- split patch into 3 patches
>
> Changes in v4:
> -- rework timing engine to not interfere with dsi/hdmi
> -- cover both widebus and compression
>
> Changes in v5:
> -- remove supports of DSI widebus and compression
>
> Changes in v7:
> -- split this patch into 3 patches
> -- add Tested-by
>
> Changes in v8:
> -- move new registers writes under DATA_HCTL_EN features check.
>
> Changes in v10:
> -- add const inside dpu_encoder_is_widebus_enabled()
> -- drop useless parenthesis please
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
