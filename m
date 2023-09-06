Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C16DE7945F5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 00:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05A110E72D;
	Wed,  6 Sep 2023 22:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A935D10E72D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 22:05:46 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-501bef6e0d3so444310e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 15:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694037945; x=1694642745;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=jXhej4cvrOszHeClcSERUsV6+B3yIbtViW4bGC1f9ds=;
 b=ISRG8neWFm3XQ0B6K4r5cadnXlsQf7T4nUD4y8DDtjbOyTkgZq/n4GsHijDX+cd/qW
 T3ZgtjvmXby6cqvOoemjLIpMu7DCMgfFvEeYhOKmocicR20auXO+UG/DcqWmzKt+eKE7
 VQ6zttmPRaEtVqM90ourAmPlMmiyfaqVzAH+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694037945; x=1694642745;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jXhej4cvrOszHeClcSERUsV6+B3yIbtViW4bGC1f9ds=;
 b=FRjHNHpyFj93MUV+MYQEpE+5CrkaiFAMEwblEUAKDYOA3cOnOpnRMDzbbNXK5ObnFB
 phXML1mBofQbaU8fKD4HHZF/FIbgJbkVIAas87EcLsXOMaCGGmtRKe4oJ1yCtjreenSx
 4B8beHIRZBVZa22G3cHQw0L/i/XUBAH1+RuiTEi04O17y3JY7LvQJy4czyEIaZOnilTQ
 MqfsGn+OLpKW8R2b2aUwd98btvStAw/SsOX1n57ALPlBmlsvX66gh9OqguTMr988h+Ek
 jyXc3Skc3ztZMyUTuWR4GOhCQmMxRhsFI6+RrLO8obuFP3L+aY5SrXI4ghXMWeOt83bt
 0aKA==
X-Gm-Message-State: AOJu0YyDfktlvxkoJ6MmwcBD48p3x6Aedf1XaId56oywP1V6GVAMHwz7
 X4dcD8GenBGyWnrCTQSCueEln8jnvD7kZ0TTy6VVlg==
X-Google-Smtp-Source: AGHT+IEhMKwojT+m2voBXcESzDghYyCXzNWBGzfOl9tKYEOWjtKcMUgC2QaGAu0qmCAUiXjB5mhREyuiJwX/wmv3Nzg=
X-Received: by 2002:a19:4f52:0:b0:500:9d4a:89ff with SMTP id
 a18-20020a194f52000000b005009d4a89ffmr3220273lfk.62.1694037944892; Wed, 06
 Sep 2023 15:05:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 17:05:44 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-6-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
 <20230904020454.2945667-6-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Sep 2023 17:05:44 -0500
Message-ID: <CAE-0n50859GHEpOjtk+1ukYxgoumKiOyT3kwGJ6K8CDd9FbADw@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] drm/msm/dpu: enable INTF TE operations only when
 supported by HW
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-09-03 19:04:51)
> The DPU_INTF_TE bit is set for all INTF blocks on DPU >= 5.0, however
> only INTF_1 and INTF_2 actually support tearing control (both are
> INTF_DSI). Rather than trying to limit the DPU_INTF_TE feature bit to
> those two INTF instances, check for the major && INTF type.
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
