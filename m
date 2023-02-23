Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E356A07C5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 12:54:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE4610E4A4;
	Thu, 23 Feb 2023 11:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650EC10E186
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 11:53:53 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-536bbe5f888so180951967b3.8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 03:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w5vFA5woKdP31zz1MYFFSTK/8C5in6StonTFARcQSxc=;
 b=zdgnTMUYSKxrHmptZYB1txbg5XdYZbMJmp6zZQP60Od2bIm6d6jZvQFdxKtCN9W+ds
 teF7nUxlb98zWxM7BJlGLpn7Plii/DjGBdRLG8eL+O7bE1LMGOYGo+/TYNgnLkBZOMi4
 gPxVSAY+JNyveb+gLYrDInJGUg5lpfYXvw30nrJXkHe2sBRDebWKorFrGJAHQv6QK0ZC
 gyf3peY34HC+LdFo5zPmWk3okfIloKSKWYJguTNrG9v56H+sOK5b1JgBvCjZNbERL8gM
 Tp95lZHR1QuCkdw4v3LC1sMpdD7HrHvpPoFwqQ0lp4XTUIVXy9v0Vxjq0kjvwlbz072P
 Zv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w5vFA5woKdP31zz1MYFFSTK/8C5in6StonTFARcQSxc=;
 b=fWuMi2XM5/F/HlQ60ew4V54WzK1nCORcvErGua3yefXUxcF4ZX8WC7zjo6Ei7tOyJT
 ZauvVgnACRsCW8yyiz4/sAzvjFiUPl6TahSJhVZSJgyIpp1pV00hmwzIdMOvKsVqyFBO
 SzXgOyeAd9wYHAfQ9EPXV7PeDtGVURRvZIM0/cRycDnF9LsatiOz0pZLWo+NyDMg/MSO
 D18AfG5mpZTGCGMNvHf1ZGMUYzLBv9Xfx9h2Wzi4gH+C8iGuI7gPcLlyU9cFKa/g3sk8
 mRA1S48K+Meu9pY0+XTfNQwNoLW9o36lpyliPe9ApinM5+IHWrl4a+47DKK0BpHYBWRe
 Kgzg==
X-Gm-Message-State: AO0yUKVn3a43YHeqN8WzLG0Ks3oyu7/c/SlNoV3qB7wsEkPO2Vr2I8OI
 JqDba4lqc5RgOmiB/G6WBIv9iPVraj3GwvNAji/9aA==
X-Google-Smtp-Source: AK7set8ADM3JyIy92RuH/QhTaMHo2xmNRRrEeVWSFEkvKKjyBxV3bprFl7ligPErd83/AXMtNQFr6PprUcnXTbRRc0Y=
X-Received: by 2002:a05:690c:c13:b0:52a:9eac:92b with SMTP id
 cl19-20020a05690c0c1300b0052a9eac092bmr2733502ywb.4.1677153232506; Thu, 23
 Feb 2023 03:53:52 -0800 (PST)
MIME-Version: 1.0
References: <20230223095708.3688148-1-dmitry.baryshkov@linaro.org>
 <0efb141d-aab6-a13f-8cd7-0de0deae9af2@linaro.org>
In-Reply-To: <0efb141d-aab6-a13f-8cd7-0de0deae9af2@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Feb 2023 13:53:41 +0200
Message-ID: <CAA8EJpo2Vp-n_kBTT-vfaGAE4jO58=NCh0MpMhTEjL3GonxWsg@mail.gmail.com>
Subject: Re: drm/msm/dpu: fix stack smashing in dpu_hw_ctl_setup_blendstage
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: Amit Pundir <amit.pundir@linaro.org>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Feb 2023 at 12:57, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 23.02.2023 10:57, Dmitry Baryshkov wrote:
> > The rewritten dpu_hw_ctl_setup_blendstage() can lightly smash the stack
> > when setting the SSPP_NONE pipe. However it was unnoticed until the
> > kernel was tested under AOSP (with some kind of stack protection/check).
> >
> > This fixes the following backtrace:
> >
> > Unexpected kernel BRK exception at EL1
> > Internal error: BRK handler: 00000000f20003e8 [#1] PREEMPT SMP
> > Hardware name: Thundercomm Dragonboard 845c (DT)
> > pstate: a0400005 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > pc : dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
> > lr : _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
> > sp : ffffffc00bdcb720
> > x29: ffffffc00bdcb720 x28: ffffff8085debac0 x27: 0000000000000002
> > x26: ffffffd74af18320 x25: ffffff8083af75a0 x24: ffffffc00bdcb878
> > x23: 0000000000000001 x22: 0000000000000000 x21: ffffff8085a70000
> > x20: ffffff8083012dc0 x19: 0000000000000001 x18: 0000000000000000
> > x17: 000000040044ffff x16: 045000f4b5593519 x15: 0000000000000000
> > x14: 000000000000000b x13: 0000000000000001 x12: 0000000000000000
> > x11: 0000000000000001 x10: ffffffc00bdcb764 x9 : ffffffd74af06a08
> > x8 : 0000000000000001 x7 : 0000000000000001 x6 : 0000000000000000
> > x5 : ffffffc00bdcb878 x4 : 0000000000000002 x3 : ffffffffffffffff
> > x2 : ffffffc00bdcb878 x1 : 0000000000000000 x0 : 0000000000000002
> > Call trace:
> >  dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
> >  _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
> >  dpu_crtc_atomic_begin+0xd8/0x22c [msm]
> >  drm_atomic_helper_commit_planes+0x80/0x208 [drm_kms_helper]
> >  msm_atomic_commit_tail+0x134/0x6f0 [msm]
> >  commit_tail+0xa4/0x1a4 [drm_kms_helper]
> >  drm_atomic_helper_commit+0x170/0x184 [drm_kms_helper]
> >  drm_atomic_commit+0xac/0xe8
> >  drm_mode_atomic_ioctl+0xbf0/0xdac
> >  drm_ioctl_kernel+0xc4/0x178
> >  drm_ioctl+0x2c8/0x608
> >  __arm64_sys_ioctl+0xa8/0xec
> >  invoke_syscall+0x44/0x104
> >  el0_svc_common.constprop.0+0x44/0xec
> >  do_el0_svc+0x38/0x98
> >  el0_svc+0x2c/0xb4
> >  el0t_64_sync_handler+0xb8/0xbc
> >  el0t_64_sync+0x1a0/0x1a4
> > Code: 52800016 52800017 52800018 17ffffc7 (d4207d00)
> >
> > Fixes: 4488f71f6373 ("drm/msm/dpu: simplify blend configuration")
> > Reported-by: Amit Pundir <amit.pundir@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > index b88a2f3724e6..6c53ea560ffa 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > @@ -446,7 +446,9 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
> >                        * CTL_LAYER has 3-bit field (and extra bits in EXT register),
> >                        * all EXT registers has 4-bit fields.
> >                        */
> > -                     if (cfg->idx == 0) {
> > +                     if (cfg->idx == -1) {
> if (cfg->idx == ctl_blend_config[SSPP_NONE][0].idx)?

Why? -1 is simpler and more obvious (and doesn't bind it only to SSPP_NONE).

>
> Konrad
> > +                             continue;
> > +                     } else if (cfg->idx == 0) {
> >                               mixercfg[0] |= mix << cfg->shift;
> >                               mixercfg[1] |= ext << cfg->ext_shift;
> >                       } else {
> >



-- 
With best wishes
Dmitry
