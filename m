Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6360F4F4F47
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 03:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3C210E9C8;
	Wed,  6 Apr 2022 01:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36AD10E9A0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 01:58:44 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-df22f50e0cso1444717fac.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 18:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=DIVGMsVz0TJ2gV9WgOfFFiA5gprB53tRsUuj8i64WaE=;
 b=IVl44d/QhSPb+vA65mjFI4QChRvBC65acN6oulekqU11IURJUXLWGepW0IbWIkETJy
 +WrVrlZdgkcjdpCGWe5Ypk8BbFo4Srsdx5lGVYum8opBfgNK1ukiEaUzavcB9V0i23rJ
 iGmIv0l4Ztmr9owj6F0mBxOG9orcs5peuCsOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=DIVGMsVz0TJ2gV9WgOfFFiA5gprB53tRsUuj8i64WaE=;
 b=TyZXI7xcubudxRxStVGUWW2KKLZez/LhSjj0U4uJwKv9St4QAfriKqBZGunKaBNBXs
 Asa82Hw0uVQms5xNvLR0gzAqp7w41ydRzea9LAu2w4stI7PiyndxadV+zRS5xbRq6l+H
 r8HHAum5UkZ72zbTpBGOdxusRuVYIoFY/YDMKovHKb1V4pK7sp+k5K0IUGpVEGBskRUg
 18eY+UrHDL4mwYEgdLjSOaKeIEBLuvYF+4Iey4ljozUsD2b/m/3dB9HvsbPRl3Juooei
 K/haBM2R76Ci3e5EtDkh6EFYqXJQI0Vbb3sF8+ygtZwkbj/9wL8RMYsOuZYBAF+j1ps2
 tqog==
X-Gm-Message-State: AOAM5332qsF18TxsU1Bb8OnNzMls6JbBAFtUmIPZ3vzIZZwGZ1um08qa
 HOaXnot3XQmiScC81WUzW0ElfGPzrr3GmoJE2KBoHQ==
X-Google-Smtp-Source: ABdhPJygRyk6aXcwBIkmW3sXOMOwd//3/kqvY2L6PMY2iOeU+lK9xBLITJ+JWL6zDwHPOXhk4dBea47tvccNlzGqjpY=
X-Received: by 2002:a05:6870:e314:b0:e1:e5f0:d777 with SMTP id
 z20-20020a056870e31400b000e1e5f0d777mr2777654oad.193.1649210324223; Tue, 05
 Apr 2022 18:58:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Apr 2022 18:58:43 -0700
MIME-Version: 1.0
In-Reply-To: <20220330223008.649274-5-dmitry.baryshkov@linaro.org>
References: <20220330223008.649274-1-dmitry.baryshkov@linaro.org>
 <20220330223008.649274-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 5 Apr 2022 18:58:43 -0700
Message-ID: <CAE-0n50gmcGrqj5p92tdTe4cyqhT4kiucRahnuLAuNtbZmXWDQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/msm/dp: make dp_connector_mode_valid() more
 precise
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, 
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
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-03-30 15:30:08)
> Make dp_connector_mode_valid() return precise MODE_CLOCK_HIGH rather
> than generic MODE_BAD in case the mode clock is higher than
> DP_MAX_PIXEL_CLK_KHZ (675 MHz).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
