Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B090F5554F1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 21:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4285810E32E;
	Wed, 22 Jun 2022 19:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100D810E2F2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 19:47:17 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-101d2e81bceso14987734fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 12:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=P5X0i3YLR+vH/xCKeSIiyUzkgZgxeJh3Gr3zEWyGWZw=;
 b=eEevZBp5hzAVO7OVafpFcG7EK/jyT2qs+fcQnakr40EPZB5gEKRLfLtb6iT4RXMmbx
 6itUVdVsCCEnkiujkl3V2MIuXLMOUIaAvjvmT06nYQ07dX1mO4XoDvkKcTdu5rnm0Gcg
 233mkWVIGvdB7XGJZfOVDuqaRuirMlFKKjPzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=P5X0i3YLR+vH/xCKeSIiyUzkgZgxeJh3Gr3zEWyGWZw=;
 b=RmP09l1SW/b353E27RGmIHJ88hRF/h7ItwbW0pSiJa4Z58j4QyfFcATPoyvZT8gL3C
 CNWzrajd0+pjYhd2wLs+k/DUwz7XAbb4h0Ejb0L/5SpFczljYBRFkGxA4HwUf8SDcJfG
 xDDKMj+5Yt6AnL4VB4n49HrnNiakrE6XbDw+T/TfT023LIxplRoag2mr2mI1wtis7EYp
 8zZqukFHjaioSLHGchsjxkMMxFtZYCgXdIjc387hFoe750TOyqw8PqCcdAOq56V9HFmI
 OQoAaEFq2ZIY4+rJvKLTZ7ZiIT8lLJBJN9Kta1hYfYx0PkaWvxLlD2dkxaj5AGNWXKqY
 teOw==
X-Gm-Message-State: AJIora8TM1wd6bMr7Az8E35grPSgTUz2KMvkdYcbRP+mBzKXZeIOhskX
 zXOkqSC9ochKOf0afQVWuUukRFgivHwOzFgVwGYR3Q==
X-Google-Smtp-Source: AGRyM1vZGszeqoU+XZtNEjQiK9wIw0YFJSaflA/w5PO2Z8WdsymdanQ/ymyF27U0fMlIl/UySOprRauZcbmkCjlv4IU=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr8306oap.63.1655927236348; Wed, 22 Jun
 2022 12:47:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jun 2022 15:47:15 -0400
MIME-Version: 1.0
In-Reply-To: <1655916845-31760-1-git-send-email-quic_khsieh@quicinc.com>
References: <1655916845-31760-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 22 Jun 2022 15:47:15 -0400
Message-ID: <CAE-0n52+DSD4Ub5MDD4bBdfHPG-mQzkQjGdB0PwqiRRmWF0HMQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: reset drm_dev to NULL at dp_display_unbind()
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-06-22 09:54:05)
> During msm initialize phase, dp_display_unbind() will be called to undo
> initializations had been done by dp_display_bind() previously if there is
> error happen at msm_drm_bind. Under this kind of circumstance, drm_device
> may not be populated completed which causes system crash at drm_dev_dbg().
> This patch reset drm_dev to NULL so that following drm_dev_dbg() will not
> refer to any internal fields of drm_device to prevent system from crashing.
> Below are panic stack trace,
>
> [   53.584904] Unable to handle kernel paging request at virtual address 0000000070018001
> .
> [   53.702212] Hardware name: Qualcomm Technologies, Inc. sc7280 CRD platform (rev5+) (DT)
> [   53.710445] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   53.717596] pc : string_nocheck+0x1c/0x64
> [   53.721738] lr : string+0x54/0x60
> [   53.725162] sp : ffffffc013d6b650
> [   53.728590] pmr_save: 000000e0
> [   53.731743] x29: ffffffc013d6b650 x28: 0000000000000002 x27: 0000000000ffffff
> [   53.739083] x26: ffffffc013d6b710 x25: ffffffd07a066ae0 x24: ffffffd07a419f97
> [   53.746420] x23: ffffffd07a419f99 x22: ffffff81fef360d4 x21: ffffff81fef364d4
> [   53.753760] x20: ffffffc013d6b6f8 x19: ffffffd07a06683c x18: 0000000000000000
> [   53.761093] x17: 4020386678302f30 x16: 00000000000000b0 x15: ffffffd0797523c8
> [   53.768429] x14: 0000000000000004 x13: ffff0000ffffff00 x12: ffffffd07a066b2c
> [   53.775780] x11: 0000000000000000 x10: 000000000000013c x9 : 0000000000000000
> [   53.783117] x8 : ffffff81fef364d4 x7 : 0000000000000000 x6 : 0000000000000000
> [   53.790445] x5 : 0000000000000000 x4 : ffff0a00ffffff04 x3 : ffff0a00ffffff04
> [   53.797783] x2 : 0000000070018001 x1 : ffffffffffffffff x0 : ffffff81fef360d4
> [   53.805136] Call trace:
> [   53.807667]  string_nocheck+0x1c/0x64
> [   53.811439]  string+0x54/0x60
> [   53.814498]  vsnprintf+0x374/0x53c
> [   53.818009]  pointer+0x3dc/0x40c
> [   53.821340]  vsnprintf+0x398/0x53c
> [   53.824854]  vscnprintf+0x3c/0x88
> [   53.828274]  __trace_array_vprintk+0xcc/0x2d4
> [   53.832768]  trace_array_printk+0x8c/0xb4
> [   53.836900]  drm_trace_printf+0x74/0x9c
> [   53.840875]  drm_dev_dbg+0xfc/0x1b8
> [   53.844480]  dp_pm_suspend+0x70/0xf8
> [   53.848164]  dpm_run_callback+0x60/0x1a0
> [   53.852222]  __device_suspend+0x304/0x3f4
> [   53.856363]  dpm_suspend+0xf8/0x3a8
> [   53.859959]  dpm_suspend_start+0x8c/0xc0
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Any fixes tag?

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
