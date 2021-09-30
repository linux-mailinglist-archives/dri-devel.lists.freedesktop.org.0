Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1431C41D067
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 02:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454EC6E2A3;
	Thu, 30 Sep 2021 00:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C786E2A3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 00:02:41 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 x33-20020a9d37a4000000b0054733a85462so5062661otb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 17:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=sz4qPh2dIGtWybWIz2+FjL1xXs0xQ2gcPE6MG4pSh9s=;
 b=G5lm0rNGleMtnm89OwP5wrX1UP7DVgf1ffpI+keySiETKAx+04oGYa2qSV9N45Dae5
 4oSFDuhP7WYfWr4MFksVnueKfrzQ5VwNgoqGiHqwEFI9DEoNAs7RrciO/LQx4rFXBuY4
 WL/6osoaLWCDuTBcByfs5EdFt7hXSfiLPRyBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=sz4qPh2dIGtWybWIz2+FjL1xXs0xQ2gcPE6MG4pSh9s=;
 b=DgJ0Xaze2GitLBcT0GatQb3UWu+XkvFVm1r0lG99IuPLvhkCNxGzKNYWUNQLaAzNDJ
 Vk10LCe9m2F7nr5SG6e6dQ0ftPZE9kbulmp83TlBms6N3JxvNbdBnxWH7hxq/pjuY4b2
 hnfY2IhJ5ldeZn+deQJW6JtMzGMb2rUbhpSOsivafvQ7n4e+uZBO0NTvMcMaiWKqmpnp
 uu+dMQYBaqZnOntLsGOxl0PMmoGUh+XbjC1ir8rkckICy8jbBxFPNqACm9gkE8mAWAAv
 7f1GGbEcyxgbIkOyWPfVQ5L6X8iqEuSSAVn5LPQzA1iNmZ57murcICsfoNmxAZcezAcR
 K+7w==
X-Gm-Message-State: AOAM531NotM1TMNjl9okeoh6A2nsKpWbOBVcraH3rpQNc0AAITXIEqgD
 JDOjmBVUKmn8225UcoCWTJVSkFtX5rqZxRakr0do4A==
X-Google-Smtp-Source: ABdhPJxnw99W4CrkwEhmaBpAMawQdJMBR5h0AmtsSMqnz3MManm3XK032vWPW2BVu2aphVCq7lnE3qq6RcZ6fDGC+FU=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr2543966otn.126.1632960161028; 
 Wed, 29 Sep 2021 17:02:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Sep 2021 17:02:40 -0700
MIME-Version: 1.0
In-Reply-To: <1632932224-25102-1-git-send-email-khsieh@codeaurora.org>
References: <1632932224-25102-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 29 Sep 2021 17:02:40 -0700
Message-ID: <CAE-0n52iO3rSE59OBOgJ1sZMckweoBxN5ih9fY2dg_ht9cctfw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: only signal audio when disconnected
 detected at dp_pm_resume
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-09-29 09:17:04)
> Currently there is audio not working problem after system resume from suspend
> if hdmi monitor stay plugged in at DUT. However this problem does not happen
> at normal operation but at a particular test case. The root cause is DP driver
> signal audio with connected state at resume which trigger audio trying to setup
> audio data path through DP main link but failed due to display port is not setup
> and enabled by upper layer framework yet. This patch only have DP driver signal
> audio only when DP is in disconnected state so that audio option shows correct
> state after system resume. DP driver will not signal audio with connected state
> until display enabled executed by upper layer framework where display port is
> setup completed and main link is running.
>
> Changes in V2:
> -- add details commit text
>
> Fixes: 078867ce04ed ("drm/msm/dp: signal audio plugged change at dp_pm_resume")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
