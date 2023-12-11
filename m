Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E1780D11D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 17:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB3E10E4A5;
	Mon, 11 Dec 2023 16:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B2D10E4A5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 16:22:03 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1fb04b2251bso3340151fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 08:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702311722; x=1702916522; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/6gM179AhgbJYgtngtZQEEEqDaJNXVBNn+YvWsmBBJo=;
 b=kwhoS9k0uZ1PgIOAL8eF/AiusXHQtc1R/zgCQZiz9dRsaCvX8/VsvkRJ3NREKui+es
 cMJ+9aBVhi4PQEsMmRQTEIk70Q1hNWoTmh32AnEwoK04P+0zGk/USpNaDVb4v+XvoXGk
 QLA4NlExXy6bcRdLsVGGe0SeGtOdicLUY7onzL/hLNdSkwyFU/w8lSg/JISgiRkEsS6G
 22L22dXvW0omuB256q3NzR1xuTA449ER7XTJ0iLPxrq1vuxQsvlX8JjIPYDRdFXTzHPQ
 YE4OookoJoDTtQ68jubwmcHCJ9npFCmsd/cQV4YIDrLIr43clKv+RNvboO1Yd2wSy1Pj
 C/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702311722; x=1702916522;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/6gM179AhgbJYgtngtZQEEEqDaJNXVBNn+YvWsmBBJo=;
 b=bbBou5wBQl5kVqikBTyYyXMfeOUzU4Jnd7X6bk2WrJsGYU8sx4WR3qoT42FMFmf9I2
 2j1sbtHnXQfp9mIaN1mnF7usXdIbNMkrL1MAMH/9bexG1JG7VBX7UnbMrPeqHWO5ysyZ
 zcLFAtG2layhyn17W/xUG91C5lms83nthvOAaw6aW5qC1WICm57xv7DsWABFm9yZXQxF
 2AEziIJCuf0uIyEhC/C6DfBWCtBlb4SfxntzH/otSMCN+0gZH3oOJg8Bst9SbJApjuqD
 jFSnzSwkjNuLb4vdT6OW+jJ74piw7Xmg2CcHa9bDhMVltRo+hFXgpPIK9AhzKeh/4bbM
 MBQA==
X-Gm-Message-State: AOJu0Yw+uULkDzUq6gAenIjPya6ddPtJAxiUnZBOAvyeS4Fzi1k/QinC
 RrA4HHhR7tDN/DzEcyIcdI9n03FIBqH/m6zpRpjbWUffkLf3VhdiAr9xI8XU
X-Google-Smtp-Source: AGHT+IERgX/N6WxJ2f7s+W1y4IPQCtA9N5Au3g8U83QTHBFu4iTUR8qZCwcvhWlqECUYpewXIMLbccd5Gia20X1e5XU=
X-Received: by 2002:a81:dd08:0:b0:5d7:1940:b373 with SMTP id
 e8-20020a81dd08000000b005d71940b373mr3793149ywn.63.1702308088859; Mon, 11 Dec
 2023 07:21:28 -0800 (PST)
MIME-Version: 1.0
References: <20231211145440.3647001-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20231211145440.3647001-1-dmitry.baryshkov@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Dec 2023 17:21:17 +0200
Message-ID: <CAA8EJppn9=jwPL5WhK4Cr5Z=OKG6gVicoYq_x5YJ3eakKmyZUQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: remove extra drm_encoder_cleanup from the
 error path
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Dec 2023 at 16:54, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The drmm handler will perform drm_encoder_cleanup() for us. Moreover if
> we call drm_encoder_cleanup() manually, the drmm_encoder_alloc_release()
> will spawn warnings at drivers/gpu/drm/drm_encoder.c:214. Drop these
> extra drm_encoder_cleanup() calls.
>
> Fixes: cd42c56d9c0b ("drm/msm/dpu: use drmm-managed allocation for dpu_encoder_virt")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>


-- 
With best wishes
Dmitry
