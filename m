Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C7543842B
	for <lists+dri-devel@lfdr.de>; Sat, 23 Oct 2021 17:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BA76E083;
	Sat, 23 Oct 2021 15:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8136E083;
 Sat, 23 Oct 2021 15:54:53 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d3so6151884wrh.8;
 Sat, 23 Oct 2021 08:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=am9pYlyD4sqItWQ5sg1zos0Wosa6VEKxvGgkRtisPcQ=;
 b=U6flVDT0l6AN2czKcdJq5iCYkJaZVNxh8OfmCSRvXsuPctG685yRoCsplHlybfAmFs
 3fk8XjWAYeXVtYTiKxStIK7u94aUqGLU/TNuYm4OpSQQe//ZVbGC/jsd7MTS68A97GIz
 7P3oINwnwXnPaU8RhMgHMhs8SG+52YMmLkkxubP5rh5QmNCNvGDi64czphfZrE67CZK/
 UWI1plVe+k5Jm8NpDKaIYnjla3vHEOD9m4x1TZMvssJLTt/ZFjPNj8VWHWOXirlBezGf
 mckfL0R717a2PdXHmlMUVEyPD2w3ls1LJagN2k5GufnGfYtjFIorFNEYhxRZNJstdYPI
 tTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=am9pYlyD4sqItWQ5sg1zos0Wosa6VEKxvGgkRtisPcQ=;
 b=pnSzoKZELTqixyRxxCuDuaecVZju5WdmGMVyIlad/2Rux6T2YcpSIbR/DAlSqzooh1
 YUo6YwXlVB7UBYjLDl5Vj1DiSS/et70JmaOKKQ/8SWW8qUJFghSNi7ZKb5/em7YU/VCb
 2iQ1IBZR+Iu4OgcXNUfiY/fmcx/V0MhnxPXoNhXOmVZkKR2ueY0Ud26LlS83hZ/5lNvL
 qCtCHFKi7BY8/a9TC66ddC/htRConcckUhXCdGxNVebDbeJm3Lhva5O8alp5V+tzWGFH
 bub1ayT7UuxEdJBsbWkjTtj8Xs3PBDXg0ORervylwAslPP5MmpvQTItP6Xciox/5nDt/
 OOSA==
X-Gm-Message-State: AOAM5308fXX+81W1gK4d/JJcSGG01mK70QjUNoqiXMDGyr15hj5uDXMj
 LgqpRTSe7CVSG9UesVQiPImbCX8iCujlLUIJ2ms=
X-Google-Smtp-Source: ABdhPJxNaVYbVTV4+4OavorKty9RZc/dq/dZ9486awmBURfrow3yuy4jNXT+cQQVrj+9qCAqxwdkwCN4877B0EdJ92E=
X-Received: by 2002:a5d:4845:: with SMTP id n5mr8306231wrs.251.1635004492231; 
 Sat, 23 Oct 2021 08:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211022172053.3219597-1-robdclark@gmail.com>
 <20211022172053.3219597-2-robdclark@gmail.com>
 <d40ffca4-b7fd-1797-31b4-35b15e7a438b@codeaurora.org>
In-Reply-To: <d40ffca4-b7fd-1797-31b4-35b15e7a438b@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 23 Oct 2021 08:59:32 -0700
Message-ID: <CAF6AEGseh=y5NWewd_zgDk6O_QzMgkzv2zP_8HEV=r-watavUA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: Remove dynamic allocation from atomic
 context
To: Jessica Zhang <jesszhan@codeaurora.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maxime Ripard <maxime@cerno.tech>, Abhinav Kumar <abhinavk@codeaurora.org>, 
 Stephen Boyd <swboyd@chromium.org>, Krishna Manikandan <mkrishn@codeaurora.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Mark Yacoub <markyacoub@google.com>, 
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Oct 22, 2021 at 12:15 PM Jessica Zhang <jesszhan@codeaurora.org> wr=
ote:
>
> On 10/22/2021 10:20 AM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > We know the upper bound on # of mixers (ie. two), so lets just allocate
> > this on the stack.
> >
> > Fixes:
> >
> >     BUG: sleeping function called from invalid context at include/linux=
/sched/mm.h:201
> >     in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 0, name: s=
wapper/0
> >     INFO: lockdep is turned off.
> >     irq event stamp: 43642
> >     hardirqs last  enabled at (43641): [<ffffffe24dd276bc>] cpuidle_ent=
er_state+0x158/0x25c
> >     hardirqs last disabled at (43642): [<ffffffe24dfff450>] enter_el1_i=
rq_or_nmi+0x10/0x1c
> >     softirqs last  enabled at (43620): [<ffffffe24d4103fc>] __do_softir=
q+0x1e4/0x464
> >     softirqs last disabled at (43615): [<ffffffe24d48bd90>] __irq_exit_=
rcu+0x104/0x150
> >     CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.15.0-rc=
3-debug+ #105
> >     Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
> >     Call trace:
> >      dump_backtrace+0x0/0x18c
> >      show_stack+0x24/0x30
> >      dump_stack_lvl+0xa0/0xd4
> >      dump_stack+0x18/0x34
> >      ___might_sleep+0x1e0/0x1f0
> >      __might_sleep+0x78/0x8c
> >      slab_pre_alloc_hook.constprop.0+0x48/0x6c
> >      __kmalloc+0xc8/0x21c
> >      dpu_crtc_vblank_callback+0x158/0x1f8
> >      dpu_encoder_vblank_callback+0x70/0xc4
> >      dpu_encoder_phys_vid_vblank_irq+0x50/0x12c
> >      dpu_core_irq+0x1bc/0x1d0
> >      dpu_irq+0x1c/0x28
> >      msm_irq+0x34/0x40
> >      __handle_irq_event_percpu+0x15c/0x308
> >      handle_irq_event_percpu+0x3c/0x90
> >      handle_irq_event+0x54/0x98
> >      handle_level_irq+0xa0/0xd0
> >      handle_irq_desc+0x2c/0x44
> >      generic_handle_domain_irq+0x28/0x34
> >      dpu_mdss_irq+0x90/0xe8
> >      handle_irq_desc+0x2c/0x44
> >      handle_domain_irq+0x54/0x80
> >      gic_handle_irq+0xd4/0x148
> >      call_on_irq_stack+0x2c/0x54
> >      do_interrupt_handler+0x4c/0x64
> >      el1_interrupt+0x30/0xd0
> >      el1h_64_irq_handler+0x18/0x24
> >      el1h_64_irq+0x78/0x7c
> >      arch_local_irq_enable+0xc/0x14
> >      cpuidle_enter+0x44/0x5c
> >      do_idle+0x248/0x268
> >      cpu_startup_entry+0x30/0x48
> >      rest_init+0x188/0x19c
> >      arch_call_rest_init+0x1c/0x28
> >      start_kernel+0x704/0x744
> >      __primary_switched+0xc0/0xc8
> >
> > Fixes: 78d9b458cc21 ("drm/msm/dpu: Add CRC support for DPU")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 16 +++++-----------
> >   1 file changed, 5 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 0ae397044310..80c0ae688734 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -182,21 +182,19 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc=
)
> >   {
> >       struct dpu_crtc_state *crtc_state;
> >       struct dpu_crtc_mixer *m;
> > -     u32 *crcs;
> > +     u32 crcs[CRTC_DUAL_MIXERS];
> >
> >       int i =3D 0;
> >       int rc =3D 0;
> >
> >       crtc_state =3D to_dpu_crtc_state(crtc->state);
> > -     crcs =3D kcalloc(crtc_state->num_mixers, sizeof(*crcs), GFP_KERNE=
L);
> >
> > -     if (!crcs)
> > -             return -ENOMEM;
> > +     static_assert(ARRAY_SIZE(crcs) =3D=3D ARRAY_SIZE(crtc_state->mixe=
rs));
> >
>
> Getting a C90 compiler warning for static_assert():
>
>      In file included from ./include/linux/bits.h:22,
>                      from ./include/linux/bitops.h:6,
>                      from ./include/linux/kernel.h:12,
>                      from ./include/linux/list.h:9,
>                      from ./include/linux/wait.h:7,
>                      from ./include/linux/wait_bit.h:8,
>                      from ./include/linux/fs.h:6,
>                      from ./include/linux/debugfs.h:15,
>                      from drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:10:
>      drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c: In function
> =E2=80=98dpu_crtc_get_crc=E2=80=99:
>      ./include/linux/build_bug.h:78:41: warning: ISO C90 forbids mixed
> declarations and code [-Wdeclaration-after-statement]
>          78 | #define __static_assert(expr, msg, ...)
> _Static_assert(expr, msg)
>          |                                         ^~~~~~~~~~~~~~
>      ./include/linux/build_bug.h:77:34: note: in expansion of macro
> =E2=80=98__static_assert=E2=80=99
>          77 | #define static_assert(expr, ...) __static_assert(expr,
> ##__VA_ARGS__, #expr)
>          |                                  ^~~~~~~~~~~~~~~
>      drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:192:2: note: in expansion
> of macro =E2=80=98static_assert=E2=80=99
>      192 |  static_assert(ARRAY_SIZE(crcs) =3D=3D
> ARRAY_SIZE(crtc_state->mixers));
>          |  ^~~~~~~~~~~~~
>
> Can be fixed by moving the static_assert() before `crtc_state =3D ...`
>

I was trying to avoid moving that because I've seen tools flag things
like that as use-before-init before.  But I guess I can use
BUILD_BUG_ON() instead.

BR,
-R

> Thanks,
>
> Jessica Zhang
>
> >       /* Skip first 2 frames in case of "uncooked" CRCs */
> >       if (crtc_state->crc_frame_skip_count < 2) {
> >               crtc_state->crc_frame_skip_count++;
> > -             goto cleanup;
> > +             return 0;
> >       }
> >
> >       for (i =3D 0; i < crtc_state->num_mixers; ++i) {
> > @@ -210,16 +208,12 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc=
)
> >
> >               if (rc) {
> >                       DRM_DEBUG_DRIVER("MISR read failed\n");
> > -                     goto cleanup;
> > +                     return rc;
> >               }
> >       }
> >
> > -     rc =3D drm_crtc_add_crc_entry(crtc, true,
> > +     return drm_crtc_add_crc_entry(crtc, true,
> >                       drm_crtc_accurate_vblank_count(crtc), crcs);
> > -
> > -cleanup:
> > -     kfree(crcs);
> > -     return rc;
> >   }
> >
> >   static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
