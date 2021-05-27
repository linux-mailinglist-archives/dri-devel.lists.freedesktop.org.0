Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CD4393908
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 01:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A3E6E2E6;
	Thu, 27 May 2021 23:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55326E0F7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 23:14:31 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id j184so2424587qkd.6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XUv/H2tSnyEpa0je+9CNljGuyS/P4gW1vHKFaYDtrQ4=;
 b=ChVZOb7exsfcVgpIA48kpnMbJAqreH3Kr6NAAbL2WgkKUno/5lrDjOfss9Eox06/W7
 LM87HKJfFVcDtuZwpowGUsyjjZhnTpZEDp44jB8tdAJt25wDjckkAG8bZnG0fZs9HpaA
 BSTdfbWDFTdH+8lb8BDAXE8xF1696WkGaCu90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XUv/H2tSnyEpa0je+9CNljGuyS/P4gW1vHKFaYDtrQ4=;
 b=hIAi11ji+uGna3mjU83Ttsw+INx58f/Ouk8DSbiz/sLaxx1BQQ7th5FZzvI86Cz6v2
 nvMkLKWIpcesKXxnFnTfpBwELHvQk++WF9//cwpJoY17qupQEwLkEhcIFump0Ybp344S
 sgzvkxDIn/0GX3+wKZ8ldsBJQLEHuj+jkVruzVKJMr6+Jf3bVHU7Ef+eyvqq7rNGRNy2
 z+5bSNJWwp5OW30UQ/oM4TgW9AtZEVyJT4SpI7vGqrXvzj51/Vc0BJ+F49mj4Z4kTOZB
 TkhWc+1mMFB2x/bx/2f/nb+nIOLKFaRYnxP7tn9ylcLGn0NuIXZF7gH/nQrzBhZ5GlaD
 7s5w==
X-Gm-Message-State: AOAM532NOT8ALRIyw2dzGu2RF7BrGDBJNVZF9lfeL1/8Gnn5tX1nnY+e
 j9SUW1E8XcqhB0GKDMfUZWhSR/TdqA/vOw==
X-Google-Smtp-Source: ABdhPJwStgtGCh42ttx1DYubQfq1Zj4YxpVjC5gdNi9XD90wBEMjqh6W5pt8Ia75S5HX/xCObFq/PA==
X-Received: by 2002:a37:af84:: with SMTP id y126mr1033853qke.450.1622157270320; 
 Thu, 27 May 2021 16:14:30 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173])
 by smtp.gmail.com with ESMTPSA id e20sm2287658qto.93.2021.05.27.16.14.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 16:14:29 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id z38so3000879ybh.5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:14:29 -0700 (PDT)
X-Received: by 2002:a25:b801:: with SMTP id v1mr9231563ybj.32.1622157269138;
 Thu, 27 May 2021 16:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <1622092076-5100-1-git-send-email-mkrishn@codeaurora.org>
In-Reply-To: <1622092076-5100-1-git-send-email-mkrishn@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 27 May 2021 16:14:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UQzM=cEsEYbR4QwaovT377dn4vLxqcK7xrLMutZPVDeQ@mail.gmail.com>
Message-ID: <CAD=FV=UQzM=cEsEYbR4QwaovT377dn4vLxqcK7xrLMutZPVDeQ@mail.gmail.com>
Subject: Re: [v1] drm/msm/disp/dpu1: avoid perf update in frame done event
To: Krishna Manikandan <mkrishn@codeaurora.org>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, May 26, 2021 at 10:08 PM Krishna Manikandan
<mkrishn@codeaurora.org> wrote:
>
> Crtc perf update from frame event work can result in
> wrong bandwidth and clock update from dpu if the work
> is scheduled after the swap state has happened.
>
> Avoid such issues by moving perf update to complete
> commit once the frame is accepted by the hardware.
>
> Fixes: a29c8c024165 ("drm/msm/disp/dpu1: fix display underruns during modeset")
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

I don't know much about this code or any of the theory behind it, but
I can confirm that this fixes the hang I was seeing with the previous
patch. On sc7180-trogdor-lazor:

Tested-by: Douglas Anderson <dianders@chromium.org>
