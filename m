Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0033CA864
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 20:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4D66E898;
	Thu, 15 Jul 2021 18:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FD16E898
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 18:59:04 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 75-20020a9d08510000b02904acfe6bcccaso7225046oty.12
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 11:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=uARztaoGqxtCxUXEaCvWao2wggByc75Y4p//QGKTuik=;
 b=LqDvHuMNbdE0uDYqjIOxiAwbKh9hOZDODAww90m7DQpUrwC70XXUuSiu6YEaCAdaNQ
 ghSilahZ7d4up2ZoTWDFxx/t7+u5Tg3UodsaG+ERm94RSO2gVHm6/+cQHjynp6nShTG1
 mLnXZ2KFhfrXejXJU/K+whj+HikZ8JbISEJ5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=uARztaoGqxtCxUXEaCvWao2wggByc75Y4p//QGKTuik=;
 b=WNyS0TwT94ayGllx5Nl0dN/fY7E5axSDEcVE6xvJCAUQlqOmE756m7YMCvy9nFzUEn
 FZBZlHX0mrXwKdHACHcJjPOpf9c3BeyfxMLPRpJNJ6iYf4IAM2S7UudkegGvEPpGPIUg
 1wCdrsv00/R8esZMlo/N3t9KZtCQ19RzieXP4rEFq4mil62zKPNAZTHXqRaUAzdlIc2k
 r6EG0tWTEkuqk3fd+6hiP9Ogp+kkrUxzPyGWlo7uM/0oBQJzHbXMxwvsnN1NBd7pax8F
 m6PFr2tdQOyuMNa2Qi0WdfwghMB8o/LKZQQdcCfVKI4WS6qHqaQaRg7sDkeMXkqSSsuv
 ShmA==
X-Gm-Message-State: AOAM531M/FwWa76LFkR0TqvlWr1rqsROf5NN6RrRCowvFj45hgX1x+PT
 T8scAJoSIS2uqfy2IvKQ5M4lrV/7QlWPuNLVH5x3WQ==
X-Google-Smtp-Source: ABdhPJz2Jj/5ttUOdkAzHnEsQQtTBLdlipJ0FFoTKaILvuwmNCpcrDU/Ba0wfcqwVexPBLr2ZVKReu7ek9znD8Q5/l0=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr4993040otf.25.1626375544249;
 Thu, 15 Jul 2021 11:59:04 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jul 2021 20:59:03 +0200
MIME-Version: 1.0
In-Reply-To: <ef24f67a334698610b7b8e607a727b5d@codeaurora.org>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
 <1625592020-22658-3-git-send-email-khsieh@codeaurora.org>
 <CAE-0n52WyMKdQ96ji=5YLBxpndgB_CLsxscXaFexMPdLducrkQ@mail.gmail.com>
 <ef24f67a334698610b7b8e607a727b5d@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 15 Jul 2021 20:59:03 +0200
Message-ID: <CAE-0n53M1XWa1Ng-+bBLQyKLRzabbTOofOMqknQbF+PWuE6=hw@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/msm/dp: reduce link rate if failed at link
 training 1
To: khsieh@codeaurora.org
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, bjorn.andersson@linaro.org,
 dri-devel@lists.freedesktop.org, aravindh@codeaurora.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting khsieh@codeaurora.org (2021-07-09 10:46:41)
> On 2021-07-08 00:33, Stephen Boyd wrote:
> >> +
> >> +static bool dp_ctrl_any_lane_cr_lose(struct dp_ctrl_private *ctrl,
> >> +                                       u8 *cr_status)
> >> +{
> >> +       int i;
> >> +       u8 status;
> >> +       int lane = ctrl->link->link_params.num_lanes;
> >> +
> >> +       for (i = 0; i < lane; i++) {
> >> +               status = cr_status[i / 2];
> >> +               status >>= ((i % 2) * 4);
> >> +               if (!(status & DP_LANE_CR_DONE))
> >> +                       return true;
> >> +       }
> >> +
> >> +       return false;
> >> +}
> >
> > Why not use !drm_dp_clock_recovery_ok() for dp_ctrl_any_lane_cr_lose()?
> ok,
>
> > And then move dp_ctrl_any_lane_cr_done() next to
> > drm_dp_clock_recovery_ok() and call it drm_dp_clock_recovery_any_ok()?
> no understand how it work, can you elaborate it more?

I'm suggesting to make a new function called
drm_dp_clock_recovery_any_ok(), written next to
drm_dp_clock_recovery_ok(). Then call it from here instead of implement
it locally in the qcom DP driver.
