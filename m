Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9646F6DCBD2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Apr 2023 21:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952C910E30C;
	Mon, 10 Apr 2023 19:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1C710E30C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 19:54:47 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-54ee9ad5eb3so113801187b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 12:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681156486;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hVSuxMbAqEPyVi9yC8m6tq1S+nROIsHX2hkvUDvRI/o=;
 b=YOBTOqGxNCmNhgEmYv0FNp0qxvtNLFWoU6pCg8staBFs6JHY3hDi7xVDJPoLCc3H1C
 EprPsB5Pt8sGVU1O+P7VbUX/VGdSszLu4mheYIHdzJCot9D1XI6gtEpMBsuNUfFcK+YF
 jzUv+cp5t0W60N1uC28sAV4Ek5bCr7nk0ZhgZkRAfY0edgUb8RKJVfh1sCe3Rf3PjZQp
 4fiAPJX8c5yBAJbuXSjy8GgkMXam0KpQRXxPu+vXu3p3/jZhhtBR7nKRJKdgxSsvWit9
 yNJyGfcFGeyKXFfJjQF54Yhs0VuRYHNrG2UCMm7ZRNFVhUXFkQfOmQHjAZlqfdkCs5/V
 px8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681156486;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hVSuxMbAqEPyVi9yC8m6tq1S+nROIsHX2hkvUDvRI/o=;
 b=POzSCIIFsclYm4859vxlDBYJA1hUvGItLguk39it8tMpyURWiRFX6jk1bm3vpKXsHB
 Vr1mlCdvhBG1Oq8bFC+k54RnzUY5RtKPjL0ESiuUDuQbTx435kpfX0r3ZTqPvyHx3+Z9
 Gq+S2X69d5WU3jpbZsfmOFG1d4zBBQ05OkaxdTw1fpeOWEYnvnial/816EA3L5V7rbM3
 x0NwaxifY47SPYZDRJ4t+dfvcoRGfWbf+sLuj7y8zpvj2+qGdyDEKkY8223CggBAGOub
 EfTgPozuTDzm2xvf2k5N16EmFLbvpKt/a1bukpGzT08c5ZMHbfwa6djQSqmznX2I+N94
 zcog==
X-Gm-Message-State: AAQBX9eCOguUCHkxMzmWDhdoE4RnMA09YouYNL3j3Q7CTjYzgI440OqQ
 mARbb1mJSnhFofB5rj7sMm7EsyZufYvcqKVj0uVt/A==
X-Google-Smtp-Source: AKy350ZgRZcZYpWJQUeIosylHkgPa4AxB8416V8GRr7Kq8Bb3lqiDtKZkIPHZeIbY0SdqCZNDCk2b/r4BVo2IMy4MwM=
X-Received: by 2002:a81:ae51:0:b0:54c:1ab:6aaf with SMTP id
 g17-20020a81ae51000000b0054c01ab6aafmr6290994ywk.5.1681156485968; Mon, 10 Apr
 2023 12:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230409011329.2365570-1-dmitry.baryshkov@linaro.org>
 <CAE-0n51mkvb0nmF19NTXeLegzJJU=53ywUOqEP0skMtU3Oh3xA@mail.gmail.com>
In-Reply-To: <CAE-0n51mkvb0nmF19NTXeLegzJJU=53ywUOqEP0skMtU3Oh3xA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 10 Apr 2023 22:54:35 +0300
Message-ID: <CAA8EJpqvuOTd-_aLDxoRnBx1rFg2scwGEH=W76G0aEUEX9uOgA@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/msm/a5xx: really check for A510 in a5xx_gpu_init
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, Adam Skladowski <a39.skl@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Apr 2023 at 22:28, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2023-04-08 18:13:29)
> > The commit 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno
> > 510") added special handling for a510 (this SKU doesn't seem to support
> > preemption, so the driver should clamp nr_rings to 1). However the
> > gpu->revn is not yet set (it is set later, in adreno_gpu_init()) and
> > thus the condition is always false. Check config->rev instead.
> >
> > Fixes: 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno 510")
> > Reported-by: Adam Skladowski <a39.skl@gmail.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Maybe as a followup you can put a WARN_ON_ONCE() inside a new function
> that gets gpu->revn and warns if the value is 0?

Sounds like a good idea.

-- 
With best wishes
Dmitry
