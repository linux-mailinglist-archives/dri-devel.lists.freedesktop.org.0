Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4B1794569
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 23:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A81710E728;
	Wed,  6 Sep 2023 21:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1343E10E728
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 21:49:05 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4ff09632194so406009e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 14:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694036943; x=1694641743;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=zODF48arHxEUmG5YwHnLNmTWm5hE5D/m+hZRjIw53xs=;
 b=JSvFh1M+XCdJte7ze09ho7G9I3StqhkDKB7EgoD7ycOYufoY2qVmf2NVyTvqnIuVkf
 0xqa8rADtgL/yGss1EyQ1mhrPkoJBGJZuT9hY22S2pH3VXFacj4i5MoR+D01qN6liczF
 dpORPUm/utGKrax+4SJhqsjbI8HHBUH3aDcGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694036943; x=1694641743;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zODF48arHxEUmG5YwHnLNmTWm5hE5D/m+hZRjIw53xs=;
 b=lU0YeDQaFxI3cyAVq9HubovSyQ8miuq55EafSA+P2nOikBf/5eQbsvwfKeRJoDFZns
 rQxqhKDgJfrUQlRPyeJWY6adFyMjFYej/U26cYpg71Jau2Frk8bQKfn1Sj81PzsahoY5
 spr/rSHtSPkDFdDZ6QkunmJy/ARSh8SjkZxdzV9jUnBfpvRst5+q92HPIkAjUzmsrNHM
 iRoJFoTNAT/bz4ky/ivPhvDZ6Vg9TdSdVLw1nh+d60Oxam/yatH8QeIoZz9o6U0m+rI3
 6Cl8QbtjEaebTNY0zKhtcm9Sofbz40ILGLR2ukJjC0z4dY+LBoEEfYllZRF+fxatoVjs
 5tBQ==
X-Gm-Message-State: AOJu0Ywu0RGBLAGMQ1z4ocIoStvI7bnzgAGWbdwtmcpcKHP/JYqXv32V
 lMUWb3/UUKLPw+2kTAA8Qp+Tn3HCfJ6qh23UegY8RzjpBR1+TMJp
X-Google-Smtp-Source: AGHT+IEppiQEcjzv1kgekJwTQhO9E5ahaKHYtKaSUNZr55bKaMROTpPQkM9dHWVlUeNxngRoEUY4F5A8nlqEYK7E/PY=
X-Received: by 2002:ac2:5f9c:0:b0:4ff:a8c6:d1aa with SMTP id
 r28-20020ac25f9c000000b004ffa8c6d1aamr2949184lfe.48.1694036943232; Wed, 06
 Sep 2023 14:49:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 16:49:02 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-2-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
 <20230904020454.2945667-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Sep 2023 16:49:02 -0500
Message-ID: <CAE-0n52-eL=McFLPPSENFE_ziA6E2ghsdM3JrVdfS4jFXgJT8w@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] drm/msm/dpu: inline _setup_pingpong_ops()
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

Quoting Dmitry Baryshkov (2023-09-03 19:04:47)
> Inline the _setup_pingpong_ops() function, it makes it easier to handle
> different conditions involving PINGPONG configuration.
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
