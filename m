Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82655789187
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 00:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0ED610E166;
	Fri, 25 Aug 2023 22:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE07310E166
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 22:15:27 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fe8c16c1b4so2075628e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 15:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693001726; x=1693606526;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=/oqL3CaI52R4xwwACyvqkfUn3lyVF+eURVewn5XEQWs=;
 b=EfzFzZAn/a8rKKyeZQTU8Gzpt/Zepp9lOBzn5ImT2VFozn3W9o21PB1iwKvXL8jQuV
 rLUHqq9RobaJuFy5nuBTwIlDNY6Sq/SeDyc7z5eU1AdqbJB61hsX5GylLWHqLpbyKDG1
 Lh7YFCC3SFX2fcZcEt+nuLS7T/99ZD7ybm/IE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693001726; x=1693606526;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/oqL3CaI52R4xwwACyvqkfUn3lyVF+eURVewn5XEQWs=;
 b=Xh3a25UKsXconbgPJa60iCOANdaI+u7bPlTcCmai1NY/cr9OhiZ9xa5duE7caqaHMk
 68WGuqQ3TaI2PXErAxuqcM+g4d5x2HanoBsTq8wPYGReVB3TccgilvTaSq5WHax7zO35
 NzHoH2FTK5gdDWzqRr0Ty7UzC128m7DbtM25ZluiZj8Mfr1tvwJ+U/BXMGlJnvlTCaVx
 bQZ4Nj8IjxjSVnp5fPz45iqM94nJP5mqAAQxiJG1vS2BV1DZNuhdAj3LK9MezL9VIFE0
 TmNiMLLVc6bQQSITupqPMqDvgjXFW74ypwbsE7V5A4HxJ6sbMSd1ILWa3ITV7PGrf+QC
 td1A==
X-Gm-Message-State: AOJu0YwCeMFze+YSGu0mZq3moe5BR1K7eTpbpEuzefwYNG8HA+yLErAI
 L1LsFs/cPo45HOqvBpBjgYa69aYAVAbOflaDWAITnQ==
X-Google-Smtp-Source: AGHT+IFbWLLnN9fk5RSN+FQtgJAAnKq83w5gE4BkHbudmXPtFvVL1JNBDUODmjB8soko9tV8gAZ6IX/A5gGSsCSlfLI=
X-Received: by 2002:a05:6512:200d:b0:4ff:86c7:f17e with SMTP id
 a13-20020a056512200d00b004ff86c7f17emr12242200lfb.50.1693001726185; Fri, 25
 Aug 2023 15:15:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Aug 2023 17:15:25 -0500
MIME-Version: 1.0
In-Reply-To: <1691533190-19335-1-git-send-email-quic_khsieh@quicinc.com>
References: <1691533190-19335-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 25 Aug 2023 17:15:25 -0500
Message-ID: <CAE-0n53K538miRUbiW2OKwSeZ9juEPAcw42NDcD+T6M58hjnAA@mail.gmail.com>
Subject: Re: [PATCH v1] drm/msm/dp: do not reinitialize phy unless retry
 during link training
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
 airlied@gmail.com, 
 andersson@kernel.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org, 
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2023-08-08 15:19:50)
> DP PHY re-initialization done using dp_ctrl_reinitialize_mainlink() will
> cause PLL unlocked initially and then PLL gets locked at the end of
> initialization. PLL_UNLOCKED interrupt will fire during this time if the
> interrupt mask is enabled.
> However currently DP driver link training implementation incorrectly
> re-initializes PHY unconditionally during link training as the PHY was
> already configured in dp_ctrl_enable_mainlink_clocks().
>
> Fix this by re-initializing the PHY only if the previous link training
> failed.
>
> [drm:dp_aux_isr] *ERROR* Unexpected DP AUX IRQ 0x01000000 when not busy
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/30
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
