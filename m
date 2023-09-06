Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F39AA794575
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 23:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0422910E1D2;
	Wed,  6 Sep 2023 21:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA0210E1D2
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 21:54:23 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4ff8f2630e3so412086e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 14:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694037261; x=1694642061;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=s/cOj9Q0GUj97eQPpIlNz2VDt48sU68k3aZtrr+hpuk=;
 b=Fz40QQkzPYnexteuIJ4DUa3qj78MNM1BJATjklogNPYBf96YJPf2WjUVbnL+XDD4IH
 7TIhooYzZbYlZuPg3sHxFMHKeqeiXydNiBOear18ag8F7ocwFB+bpVYlDConJOkg7fzS
 O9C9/48Jw1up20LgsBkCiEo8VLD3rjUkDT6Qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694037261; x=1694642061;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s/cOj9Q0GUj97eQPpIlNz2VDt48sU68k3aZtrr+hpuk=;
 b=lsUgBNjthsUw9eYXRSDyzIkhIZyO9IKMur6v+85HalJWGbxW7U5Z5crPfXlzzQwzP5
 YqJfZuyPxhRAwMCBSUvec1NInhmt5zLJdhcq0osFXtWETK0AnMQ4CmVKqPZ5DSyNmfbd
 2Zs6lRqsTVFyaN5/K/2oQebzjtWlfitJYal5mpcdwrWLF9CM0OMIzcYv4nq8nrVgk/Wv
 6JSS7OPayM+rACBLzketcBP8yY+JSbFhRXRoPQ5sW8jT54VI5tJ9E1svLZuo0JmTyK/R
 /CHxUMzrbBLYhTYVy9HLeT4TDf0AmAq1B9PBX94fxmfcy/DvDUzY+79yRIje0dCIA2bq
 zt5g==
X-Gm-Message-State: AOJu0YwVmqJiR2P5Wcd0R01UTq2KG5LW0D+raVdPKmQyjoFNvO1E02HI
 ceVEOtRlXekZWvAIaVUnL/VscVxGkzkSHLR0BqGCtQ==
X-Google-Smtp-Source: AGHT+IGXEYQwSmCl4dKdeY9V+gR3MIjglme5MGP+iBVm4TEGUm6JjAd1CBrovJy6qUN+sXnPG36Am8fUTFYgiyGfd1o=
X-Received: by 2002:a05:6512:3c8b:b0:4f6:3677:54e with SMTP id
 h11-20020a0565123c8b00b004f63677054emr3816276lfv.36.1694037261406; Wed, 06
 Sep 2023 14:54:21 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 16:54:21 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-3-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
 <20230904020454.2945667-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Sep 2023 16:54:21 -0500
Message-ID: <CAE-0n505YyrVi=5TYvYJzwfvNmsxDT_MaR5KPefDAbn3vvhdOQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] drm/msm/dpu: enable PINGPONG TE operations only
 when supported by HW
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

Quoting Dmitry Baryshkov (2023-09-03 19:04:48)
> The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
> Rather than checking for the flag, check for the presense of the

s/presense/presence/

> corresponding interrupt line.

The patch checks for the major version though?
