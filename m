Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFC86A0F7B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 19:31:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E276A10E062;
	Thu, 23 Feb 2023 18:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A276010E062
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 18:31:31 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id w42so11801227qtc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 10:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C4N7cZ0/7CHDOW1p6vH7UAxdq0MkhqFg8+WKoj2WG74=;
 b=iw8JhBBnsBiQKVAmvlEyLj6IQJF/JoClvl5H8P1lE7elDxLiERzV/VPawf+L97Gfi2
 NMI/ww8dYwILYPKTWQmd7MP7T0u1ZwIjyTpeaz4p3jCxSJHfdFrB/gM4kMiKG1Y6X7BW
 GOpRpNb0XPWPuQ+vJ1r3M3d0A4QlJPIFEE8CkBbOjBuF4g4+e+pQZU9N/DEHVtrxGqwt
 Nn3IW88oo8EME7wQZlBt6Uu31lxsp8EsaRS5bDe84r9GoCVH+SI3uSv0NCJ7UUe1oH6m
 w1icI9krpddDOR+SyLwNYUd6owfFwbYyfx1OqaJqCzqiSxv6EMueNgsajSkiC83h0Og+
 A9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C4N7cZ0/7CHDOW1p6vH7UAxdq0MkhqFg8+WKoj2WG74=;
 b=UEw37rvaS8OnIiELVJPKL43JUlORa/f0SYtxjOs/SUyDbiMldrze7DFbz+IraEIB/l
 N0NoJ704w2Rqq8HxWGYdjj3SyBDzXSNNV3pC5czgZcQN3wABnEl7Uhe9TGvPPt1wUfr5
 BBp+WRNuFIHWAN0Mstn+IG4BFNmlZyThEY6IUQ6clUkjgeVgxNiVYDz/0mH77KBnps2U
 5cTlO/F0D2QNLyseHWga5zChpZLOWC6TS08Yoe+o971uhw6MB/ZRWmBKAn2KqETcGw7d
 nfJ6mo5FZUOEJAxiU6GC+TBSoBT6o1HF4xKWdBoOrYXZ7Bom4CR5O4OPlZt/5XgWVVgP
 qy3g==
X-Gm-Message-State: AO0yUKX+kPYe5h9tJRUYaSL8+7pJOWJpWYyG60JJjorG/Yxd+VdSafx8
 YSpJQ7CK7WucG2qRmMJVyvgUqfsvYT2049lxWMWHEw==
X-Google-Smtp-Source: AK7set+Y2TWZKB9Sh4MOlDdtXXuzM1mi9gMyx3uO9DD7HQDEvrWGS4CscEEKsy1rEpO6c4fCw4uWq1BQkCyemGNaGwk=
X-Received: by 2002:a05:622a:1b86:b0:3bf:b829:46ca with SMTP id
 bp6-20020a05622a1b8600b003bfb82946camr302902qtb.1.1677177090574; Thu, 23 Feb
 2023 10:31:30 -0800 (PST)
MIME-Version: 1.0
References: <20230223095708.3688148-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230223095708.3688148-1-dmitry.baryshkov@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Fri, 24 Feb 2023 00:00:54 +0530
Message-ID: <CAMi1Hd07=8Kyb4MtgLOGwuJZ_vSM1vmoBrciXSEPFu-aPtznjA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: fix stack smashing in
 dpu_hw_ctl_setup_blendstage
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Feb 2023 at 15:27, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The rewritten dpu_hw_ctl_setup_blendstage() can lightly smash the stack
> when setting the SSPP_NONE pipe. However it was unnoticed until the
> kernel was tested under AOSP (with some kind of stack protection/check).
>
> This fixes the following backtrace:

Tested-by: Amit Pundir <amit.pundir@linaro.org>

>
> Unexpected kernel BRK exception at EL1
> Internal error: BRK handler: 00000000f20003e8 [#1] PREEMPT SMP
> Hardware name: Thundercomm Dragonboard 845c (DT)
> pstate: a0400005 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
> lr : _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
> sp : ffffffc00bdcb720
> x29: ffffffc00bdcb720 x28: ffffff8085debac0 x27: 0000000000000002
> x26: ffffffd74af18320 x25: ffffff8083af75a0 x24: ffffffc00bdcb878
> x23: 0000000000000001 x22: 0000000000000000 x21: ffffff8085a70000
> x20: ffffff8083012dc0 x19: 0000000000000001 x18: 0000000000000000
> x17: 000000040044ffff x16: 045000f4b5593519 x15: 0000000000000000
> x14: 000000000000000b x13: 0000000000000001 x12: 0000000000000000
> x11: 0000000000000001 x10: ffffffc00bdcb764 x9 : ffffffd74af06a08
> x8 : 0000000000000001 x7 : 0000000000000001 x6 : 0000000000000000
> x5 : ffffffc00bdcb878 x4 : 0000000000000002 x3 : ffffffffffffffff
> x2 : ffffffc00bdcb878 x1 : 0000000000000000 x0 : 0000000000000002
> Call trace:
>  dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
>  _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
>  dpu_crtc_atomic_begin+0xd8/0x22c [msm]
>  drm_atomic_helper_commit_planes+0x80/0x208 [drm_kms_helper]
>  msm_atomic_commit_tail+0x134/0x6f0 [msm]
>  commit_tail+0xa4/0x1a4 [drm_kms_helper]
>  drm_atomic_helper_commit+0x170/0x184 [drm_kms_helper]
>  drm_atomic_commit+0xac/0xe8
>  drm_mode_atomic_ioctl+0xbf0/0xdac
>  drm_ioctl_kernel+0xc4/0x178
>  drm_ioctl+0x2c8/0x608
>  __arm64_sys_ioctl+0xa8/0xec
>  invoke_syscall+0x44/0x104
>  el0_svc_common.constprop.0+0x44/0xec
>  do_el0_svc+0x38/0x98
>  el0_svc+0x2c/0xb4
>  el0t_64_sync_handler+0xb8/0xbc
>  el0t_64_sync+0x1a0/0x1a4
> Code: 52800016 52800017 52800018 17ffffc7 (d4207d00)
>
> Fixes: 4488f71f6373 ("drm/msm/dpu: simplify blend configuration")
> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index b88a2f3724e6..6c53ea560ffa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -446,7 +446,9 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>                          * CTL_LAYER has 3-bit field (and extra bits in EXT register),
>                          * all EXT registers has 4-bit fields.
>                          */
> -                       if (cfg->idx == 0) {
> +                       if (cfg->idx == -1) {
> +                               continue;
> +                       } else if (cfg->idx == 0) {
>                                 mixercfg[0] |= mix << cfg->shift;
>                                 mixercfg[1] |= ext << cfg->ext_shift;
>                         } else {
> --
> 2.30.2
>
