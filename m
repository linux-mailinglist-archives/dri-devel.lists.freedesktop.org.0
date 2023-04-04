Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C733F6D6D03
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 21:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEBF10E775;
	Tue,  4 Apr 2023 19:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E92010E775
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 19:16:34 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id ek18so134891815edb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 12:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680635792; x=1683227792;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eworcs+FS5N7Z5pvybSDUFQM4vAotz4kjrv0Fz9G5CM=;
 b=S8QVKvaZOxOP03YtvEVJ03LLMzBooHuMTOpd4C0KPfhoYLOtjw6atLKod+1mQM4aJD
 84bpfzxwLT7p4HX+wCCBDpCn4T6IZhbRSpgwjjtvvmcoepRtD7wSYZJ9DKkdLSUQTVap
 ULQPyxhH/SGlpcgC6Rx1JqoqydLXdi+ftojIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680635792; x=1683227792;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Eworcs+FS5N7Z5pvybSDUFQM4vAotz4kjrv0Fz9G5CM=;
 b=jVw0S/ljXt8e4G2LUcZLpzmVNoM0wcm+F70TgLyO8npQ29v85mgM/omOvgGYkTchji
 uEzBfmxSKplQxQ2nKUhlHOOkuVNS4yOCQgOxM+AuJvGP94mkQw/bGB9c3aVKm2ZHgRDP
 X1gXktvVvE+WTBvrgn/Z6tdruo+Hobf866PbY934fr07f/RcHcZoqP67/g3CSntZvlBF
 axXDyI69iy+OMeFuNwxktsCnPJFe76l8dHEFF4VPS/9DUFNWIQ+8UjYfAZMzLFaS6WJW
 PwBX7pX8B78NwBuq2Ws0cNl3xrWkDMgHhE4hdk5o3R4LhAR7BykmH1hf+WLLA/RbOZUw
 7wJA==
X-Gm-Message-State: AAQBX9dXIUuO/w7lD97iUt/2IWD98LSiuWQ7Yogq33ToB+DlfC7gMlrh
 yFwqPVdVgQOHHhPPrHkcgynazQ==
X-Google-Smtp-Source: AKy350ZD7c6CgJzTRzTOviQ9uHhtRHgmNr38y4A17xt2b4GdR222T6lp1xKS6NPQaXKgwkercB2BHw==
X-Received: by 2002:a17:906:51c6:b0:92e:f520:7762 with SMTP id
 v6-20020a17090651c600b0092ef5207762mr708844ejk.6.1680635792149; 
 Tue, 04 Apr 2023 12:16:32 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 n13-20020a170906688d00b0093210cf625bsm6311135ejr.187.2023.04.04.12.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 12:16:31 -0700 (PDT)
Date: Tue, 4 Apr 2023 21:16:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v10 11/15] drm/atomic-helper: Set fence deadline for vblank
Message-ID: <ZCx3jUJfC1vmbhI6@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Turner <mattst88@gmail.com>, freedreno@lists.freedesktop.org
References: <20230308155322.344664-1-robdclark@gmail.com>
 <20230308155322.344664-12-robdclark@gmail.com>
 <dfc21f18-7e1e-48f0-c05a-d659b9c90b91@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfc21f18-7e1e-48f0-c05a-d659b9c90b91@linaro.org>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Matt Turner <mattst88@gmail.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 04, 2023 at 08:22:05PM +0300, Dmitry Baryshkov wrote:
> On 08/03/2023 17:53, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > For an atomic commit updating a single CRTC (ie. a pageflip) calculate
> > the next vblank time, and inform the fence(s) of that deadline.
> > 
> > v2: Comment typo fix (danvet)
> > v3: If there are multiple CRTCs, consider the time of the soonest vblank
> > 
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/drm_atomic_helper.c | 37 +++++++++++++++++++++++++++++
> >   1 file changed, 37 insertions(+)
> 
> As I started playing with hotplug on RB5 (sm8250, DSI-HDMI bridge), I found
> that this patch introduces the following backtrace on HDMI hotplug. Is there
> anything that I can do to debug/fix the issue? The warning seems harmless,
> but it would be probably be good to still fix it. With addresses decoded:

Bit a shot in the dark, but does the below help?


diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index f21b5a74176c..6640d80d84f3 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1528,6 +1528,9 @@ static void set_fence_deadline(struct drm_device *dev,
 	for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
 		ktime_t v;
 
+		if (drm_atomic_crtc_needs_modeset(new_crtc_state))
+			continue;
+
 		if (drm_crtc_next_vblank_start(crtc, &v))
 			continue;
 
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 78a8c51a4abf..7ae38e8e27e8 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1001,6 +1001,9 @@ int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktime)
 	struct drm_display_mode *mode = &vblank->hwmode;
 	u64 vblank_start;
 
+	if (!drm_dev_has_vblank(crtc->dev))
+		return -EINVAL;
+
 	if (!vblank->framedur_ns || !vblank->linedur_ns)
 		return -EINVAL;
 

> 
> [   31.151348] ------------[ cut here ]------------
> [   31.157043] msm_dpu ae01000.display-controller:
> drm_WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev))
> [   31.157177] WARNING: CPU: 0 PID: 13 at drivers/gpu/drm/drm_vblank.c:728
> drm_crtc_vblank_helper_get_vblank_timestamp_internal
> (drivers/gpu/drm/drm_vblank.c:728)
> [   31.180629] Modules linked in:
> [   31.184106] CPU: 0 PID: 13 Comm: kworker/0:1 Not tainted
> 6.3.0-rc2-00008-gd39e48ca80c0 #542
> [   31.193358] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
> [   31.200796] Workqueue: events lt9611uxc_hpd_work
> [   31.205990] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS
> BTYPE=--)
> [   31.213722] pc : drm_crtc_vblank_helper_get_vblank_timestamp_internal
> (drivers/gpu/drm/drm_vblank.c:728)
> [   31.222032] lr : drm_crtc_vblank_helper_get_vblank_timestamp_internal
> (drivers/gpu/drm/drm_vblank.c:728)
> [   31.230341] sp : ffff8000080bb8d0
> [   31.234061] x29: ffff8000080bb900 x28: 0000000000000038 x27:
> ffff61a7956b8d60
> [   31.242051] x26: 0000000000000000 x25: 0000000000000000 x24:
> ffff8000080bb9c4
> [   31.250038] x23: 0000000000000001 x22: ffffbf0033b94ef0 x21:
> ffff61a7957901d0
> [   31.258029] x20: ffff61a795710000 x19: ffff61a78128b000 x18:
> fffffffffffec278
> [   31.266014] x17: 0040000000000465 x16: 0000000000000020 x15:
> 0000000000000060
> [   31.274001] x14: 0000000000000001 x13: ffffbf00354550e0 x12:
> 0000000000000825
> [   31.281989] x11: 00000000000002b7 x10: ffffbf00354b1208 x9 :
> ffffbf00354550e0
> [   31.289976] x8 : 00000000ffffefff x7 : ffffbf00354ad0e0 x6 :
> 00000000000002b7
> [   31.297963] x5 : ffff61a8feebbe48 x4 : 40000000fffff2b7 x3 :
> ffffa2a8c9f64000
> [   31.305947] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
> ffff61a780283100
> [   31.313934] Call trace:
> [   31.316719] drm_crtc_vblank_helper_get_vblank_timestamp_internal
> (drivers/gpu/drm/drm_vblank.c:728)
> [   31.324646] drm_crtc_vblank_helper_get_vblank_timestamp
> (drivers/gpu/drm/drm_vblank.c:843)
> [   31.331528] drm_crtc_get_last_vbltimestamp
> (drivers/gpu/drm/drm_vblank.c:884)
> [   31.337170] drm_crtc_next_vblank_start
> (drivers/gpu/drm/drm_vblank.c:1006)
> [   31.342430] drm_atomic_helper_wait_for_fences
> (drivers/gpu/drm/drm_atomic_helper.c:1531
> drivers/gpu/drm/drm_atomic_helper.c:1578)
> [   31.348561] drm_atomic_helper_commit
> (drivers/gpu/drm/drm_atomic_helper.c:2007)
> [   31.353724] drm_atomic_commit (drivers/gpu/drm/drm_atomic.c:1444)
> [   31.358127] drm_client_modeset_commit_atomic
> (drivers/gpu/drm/drm_client_modeset.c:1045)
> [   31.364146] drm_client_modeset_commit_locked
> (drivers/gpu/drm/drm_client_modeset.c:1148)
> [   31.370071] drm_client_modeset_commit
> (drivers/gpu/drm/drm_client_modeset.c:1174)
> [   31.375233] drm_fb_helper_set_par (drivers/gpu/drm/drm_fb_helper.c:254
> drivers/gpu/drm/drm_fb_helper.c:229 drivers/gpu/drm/drm_fb_helper.c:1644)
> [   31.380108] drm_fb_helper_hotplug_event
> (drivers/gpu/drm/drm_fb_helper.c:2302 (discriminator 4))
> [   31.385456] drm_fb_helper_output_poll_changed
> (drivers/gpu/drm/drm_fb_helper.c:2331)
> [   31.391376] drm_kms_helper_hotplug_event
> (drivers/gpu/drm/drm_probe_helper.c:697)
> [   31.396825] drm_bridge_connector_hpd_cb
> (drivers/gpu/drm/drm_bridge_connector.c:129)
> [   31.402175] drm_bridge_hpd_notify (drivers/gpu/drm/drm_bridge.c:1315)
> [   31.406954] lt9611uxc_hpd_work
> (drivers/gpu/drm/bridge/lontium-lt9611uxc.c:185)
> [   31.411450] process_one_work (kernel/workqueue.c:2395)
> [   31.415949] worker_thread (include/linux/list.h:292
> kernel/workqueue.c:2538)
> [   31.426843] kthread (kernel/kthread.c:376)
> [   31.437182] ret_from_fork (arch/arm64/kernel/entry.S:871)
> [   31.447828] irq event stamp: 44642
> [   31.458284] hardirqs last enabled at (44641): __up_console_sem
> (arch/arm64/include/asm/irqflags.h:182 (discriminator 1)
> arch/arm64/include/asm/irqflags.h:202 (discriminator 1)
> kernel/printk/printk.c:345 (discriminator 1))
> [   31.474540] hardirqs last disabled at (44642): el1_dbg
> (arch/arm64/kernel/entry-common.c:335 arch/arm64/kernel/entry-common.c:406)
> [   31.489882] softirqs last enabled at (42912): _stext
> (arch/arm64/include/asm/current.h:19 arch/arm64/include/asm/preempt.h:13
> kernel/softirq.c:415 kernel/softirq.c:600)
> [   31.505256] softirqs last disabled at (42907): ____do_softirq
> (arch/arm64/kernel/irq.c:81)
> [   31.521139] ---[ end trace 0000000000000000 ]---
> 
> 
> 
> -- 
> With best wishes
> Dmitry
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
