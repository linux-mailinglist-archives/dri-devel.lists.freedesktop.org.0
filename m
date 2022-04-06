Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA42C4F52FD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 06:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A87210ECE3;
	Wed,  6 Apr 2022 04:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC13010ECE3
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 04:01:09 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id e189so1212670oia.8
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 21:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=WGUazAz+54LKBDcmDz/G18fzJNOk0DJxlOhHCUXankQ=;
 b=hfUYXYOTYj6R1wH7vLfFU1M78Xe+pSbNhFcloVsqgMLI7XFRyw+zsprecqCimVMnGH
 +svkrY3vzWiM7LGZC8KNfRKElz2Ta1vlGMevx8Z31we8M0Ju8aO06Rjv0M6R/k5JSc96
 GcWyG+SrXJ9ikL+KNKJZ5ZUKpgammAd+qqRZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=WGUazAz+54LKBDcmDz/G18fzJNOk0DJxlOhHCUXankQ=;
 b=DE35UTpzEaWrDq387jr91VbbOdsHty7LqkHZDC7cw5R6snzgWSUoPlPORUgmKl87ZH
 ph+IF8w/VAc3sO7zzlpAc1WmkiiIhWlrdD271fZeg88IBii9Qj/Clt1nilhU4O4Wo1Ze
 pxMF979P2RnvPU/Q+OKAIjmvuXvzFsPBznQMKIUsJSvhywH0jLx4Rq0Xgu3rsRVnEGzo
 kFnDfGNqXGWMxCnSWqhkoC53DkXImdZGchjr/olelxdpDddiGhBkKYkS9xv485XORoxR
 YKzP6XpoLhtANh0SFlPQlW0cohtFr/05dg27Lo5Rtp9TFoOzxxkBGGRxzHL6DCehQn1T
 JI7Q==
X-Gm-Message-State: AOAM533Se27liI7PT4UHwJUREe4HyTt7dIvupeCXkcURAgFkz8uS9EUD
 6JjBl2bKESOh/NRMFoUO/Cz27KFkmYMCfbrU/4hGBQ==
X-Google-Smtp-Source: ABdhPJxWPA9p5d7NmUiUlh/dFDZl8efg+pQvD/HgLU5K/+3BeTFisXtsgjxxnhu+VH+3biB4raAHw2pEX8Qj/I6wP9A=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr2652702oie.193.1649217669012; Tue, 05
 Apr 2022 21:01:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Apr 2022 21:01:08 -0700
MIME-Version: 1.0
In-Reply-To: <20220405235059.359738-2-dmitry.baryshkov@linaro.org>
References: <20220405235059.359738-1-dmitry.baryshkov@linaro.org>
 <20220405235059.359738-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 5 Apr 2022 21:01:08 -0700
Message-ID: <CAE-0n53X5H6NoWgzo57dbqgh=QhRt5q3=2uiQGfw2HOcGmA5kg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/dpu: remove manual destruction of DRM objects
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

Quoting Dmitry Baryshkov (2022-04-05 16:50:57)
> Remove manual removal of DRM modesetting objects, it is done anyway by
> the drm_mode_config_cleanup() called from msm_drm_uninit(). Other
> MSM display drivers (MDP4, MDP5) do not manually destroy objects and
> trust generic code to do it's work.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
