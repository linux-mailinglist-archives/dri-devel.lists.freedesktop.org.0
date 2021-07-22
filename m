Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CB93D2C93
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 21:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8C16E7D0;
	Thu, 22 Jul 2021 19:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3DE6E84F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 19:15:51 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 31-20020a9d0ea20000b02904d360fbc71bso3573697otj.10
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 12:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=EusEYbQ13bFWsLQf0HYpb/wdiNyPX9L+F2ViR+RO33Y=;
 b=D+iysSmfAuVRkVd1YCYohemSgnbS7Iy5ZzkvKR3YyklHA+zasDTCgz+zlrYctzR1wL
 XdFzJdjD60jMBjjnHX03lBmHM5x+f8uWfK8s2/CYBx5lCppC463LwBRMfxza0K3f/wWy
 UfdzO0P+5ciJiKjBzO/O61wwUDVvT2F8Pd+xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=EusEYbQ13bFWsLQf0HYpb/wdiNyPX9L+F2ViR+RO33Y=;
 b=V+0i3ydD2DpQkdEhGjgt/4KVV0WxwZ88eYPETsSLAV7vtl869GYRkpBCvtcQOTEDmm
 oVLmED3zUUnPg8dv/CqTfCSB8q0W5xBvw1s9zupeIwCJiO7Q11FTsavhT1Y/PjLKjZna
 2rcGn+NYL3y1mupe/cPHq3TzKzKeewkbV87du1W0sS/XAoADrrBV5JL/rUQ0aTaTF5yX
 VEwOtw3wNJJa12Cv90ldELaAHcLUEnje1z+czanozpubRP1+SiMtDAMVo6/MaBzgq3tr
 4fYqO30JZR5eski4c93Kl4OLER+RK7snzRw7twLqfG4NGn4rRDDGiSky/tTBFBg7dLq0
 GsxA==
X-Gm-Message-State: AOAM531iC6ua3p8S1rx+9PPOU+uFlwgl/scNpV+Ql3jBVvspnl06S1g+
 c/irm4dVLyIkPk44WR60/VnFDqnbleoutLGsMSg3yQ==
X-Google-Smtp-Source: ABdhPJxZi6ghcXO9BFFOzhyS7XDAHh9cxgA1qHQYoljh9jZDXj31sg2BDKAeSnxi1yD6Oc1FE7A9cj0f1/F2ivB0p2U=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr859418otl.233.1626981350381; 
 Thu, 22 Jul 2021 12:15:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 19:15:50 +0000
MIME-Version: 1.0
In-Reply-To: <1626191647-13901-7-git-send-email-khsieh@codeaurora.org>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org>
 <1626191647-13901-7-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 19:15:49 +0000
Message-ID: <CAE-0n53e0cM2dFxwOGwUTW+u-X8yTPka1HyzAPPcuwq43zBh4w@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] drm/msm/dp: do not end dp link training until
 video is ready
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-07-13 08:54:06)
> Initialize both pre-emphasis and voltage swing level to 0 before
> start link training and do not end link training until video is
> ready to reduce the period between end of link training and video
> start to meet Link Layer CTS requirement.  This fixes Link Layer
> CTS cases 4.3.2.1, 4.3.2.2, 4.3.2.3 and 4.3.2.4.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Any fixes tag?

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
