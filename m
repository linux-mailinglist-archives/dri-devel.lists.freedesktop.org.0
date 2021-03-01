Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9437B3293E5
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 22:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3486E0AB;
	Mon,  1 Mar 2021 21:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EC66E0AB
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 21:41:54 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id k9so8016097lfo.12
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 13:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y0nwR1AwY5pVQ0Nz4+ZuZuQPwcfLVnsZ3mxhVOAYPs4=;
 b=HNBZInMzcEaCJA5KlSiW+cWsrJhdPO/K+qNFUyDf3+MPRBgbG+/Qt+7+XRLNhfkgwh
 XGTUJUybeocqQ46oRrHvBvxTFFE/NRTW50bdplFT8faFHhKpCpwbUrtdvYK0xwuqYnEj
 7UNi7bc3uB8QNX5QUta5AZRpdwfCd6h9j4u6kms0PLrXrRg7BH+rWJjUdGSxv2Vv3cup
 hEccxzasX/M0hcrIcVwiflf1tMaNA59cs01WdjIhSFtV0F8tSXQjlf29nQydcljlr6LP
 1howDRoiRaCUiXWU0O9uvPpsOWaeBvXbEfVR3zJ4pWb1KxNTEhhINnqp2ObLBcwy+ou3
 JEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y0nwR1AwY5pVQ0Nz4+ZuZuQPwcfLVnsZ3mxhVOAYPs4=;
 b=Hre6bpdbS9hKlvCstiQL7nvu48HkcxGVvhDCYl3XuWFxrY/mL286beGJYaBKPG4fx1
 4vOsKwZ1ZdaGFxrF2Ix9AqoqSFuf96I9jTyYlMVrRINddLUVfwN4ifsio1FHbLMo2IG5
 isHnIBn4Y/UE0Y/n2fgC5Ru5NXdKedIR7GSy+gTaUSaJ5aO1/OFIWCL2wFBk8YZBhOKw
 kxprLkA8bZyjwwy9pxVgbVcd+VnzQS0huEAh5tLsQSxp0CtT1XwBdw6RqwIWQMPXSUAL
 PSIU8TG4T/O3bG/jNCLCvdeaYa8ddmYhvwU1Da+royELT3btrQzWQ918PEDsS5AIfmx8
 L9Eg==
X-Gm-Message-State: AOAM5338HLUSJFiMIRvFI9WlBZ49p6d7aCZ6vos/P/neAPYYAe3GRRjA
 JzUCUPTvB/44j87BSkYGJn0dnA==
X-Google-Smtp-Source: ABdhPJyX81jFiRjQbjDhw5btDlV5Bw8oqfTNPQamCrTmQPFNBvX3ObXJGLFIG3CJ9eFW+n2q4cW63A==
X-Received: by 2002:a05:6512:2356:: with SMTP id
 p22mr10073795lfu.3.1614634913192; 
 Mon, 01 Mar 2021 13:41:53 -0800 (PST)
Received: from umbar.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id 197sm167575ljf.70.2021.03.01.13.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 13:41:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH] gpu/drm/msm: fix shutdown hook in case GPU components failed
 to bind
Date: Tue,  2 Mar 2021 00:41:52 +0300
Message-Id: <20210301214152.1805737-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

if GPU components have failed to bind, shutdown callback would fail with
the following backtrace. Add safeguard check to stop that oops from
happening and allow the board to reboot.

[   66.617046] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[   66.626066] Mem abort info:
[   66.628939]   ESR = 0x96000006
[   66.632088]   EC = 0x25: DABT (current EL), IL = 32 bits
[   66.637542]   SET = 0, FnV = 0
[   66.640688]   EA = 0, S1PTW = 0
[   66.643924] Data abort info:
[   66.646889]   ISV = 0, ISS = 0x00000006
[   66.650832]   CM = 0, WnR = 0
[   66.653890] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000107f81000
[   66.660505] [0000000000000000] pgd=0000000100bb2003, p4d=0000000100bb2003, pud=0000000100897003, pmd=0000000000000000
[   66.671398] Internal error: Oops: 96000006 [#1] PREEMPT SMP
[   66.677115] Modules linked in:
[   66.680261] CPU: 6 PID: 352 Comm: reboot Not tainted 5.11.0-rc2-00309-g79e3faa756b2 #38
[   66.688473] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
[   66.695347] pstate: 60400005 (nZCv daif +PAN -UAO -TCO BTYPE=--)
[   66.701507] pc : msm_atomic_commit_tail+0x78/0x4e0
[   66.706437] lr : commit_tail+0xa4/0x184
[   66.710381] sp : ffff8000108f3af0
[   66.713791] x29: ffff8000108f3af0 x28: ffff418c44337000
[   66.719242] x27: 0000000000000000 x26: ffff418c40a24490
[   66.724693] x25: ffffd3a842a4f1a0 x24: 0000000000000008
[   66.730146] x23: ffffd3a84313f030 x22: ffff418c444ce000
[   66.735598] x21: ffff418c408a4980 x20: 0000000000000000
[   66.741049] x19: 0000000000000000 x18: ffff800010710fbc
[   66.746500] x17: 000000000000000c x16: 0000000000000001
[   66.751954] x15: 0000000000010008 x14: 0000000000000068
[   66.757405] x13: 0000000000000001 x12: 0000000000000000
[   66.762855] x11: 0000000000000001 x10: 00000000000009b0
[   66.768306] x9 : ffffd3a843192000 x8 : ffff418c44337000
[   66.773757] x7 : 0000000000000000 x6 : 00000000a401b34e
[   66.779210] x5 : 00ffffffffffffff x4 : 0000000000000000
[   66.784660] x3 : 0000000000000000 x2 : ffff418c444ce000
[   66.790111] x1 : ffffd3a841dce530 x0 : ffff418c444cf000
[   66.795563] Call trace:
[   66.798075]  msm_atomic_commit_tail+0x78/0x4e0
[   66.802633]  commit_tail+0xa4/0x184
[   66.806217]  drm_atomic_helper_commit+0x160/0x390
[   66.811051]  drm_atomic_commit+0x4c/0x60
[   66.815082]  drm_atomic_helper_disable_all+0x1f4/0x210
[   66.820355]  drm_atomic_helper_shutdown+0x80/0x130
[   66.825276]  msm_pdev_shutdown+0x14/0x20
[   66.829303]  platform_shutdown+0x28/0x40
[   66.833330]  device_shutdown+0x158/0x330
[   66.837357]  kernel_restart+0x40/0xa0
[   66.841122]  __do_sys_reboot+0x228/0x250
[   66.845148]  __arm64_sys_reboot+0x28/0x34
[   66.849264]  el0_svc_common.constprop.0+0x74/0x190
[   66.854187]  do_el0_svc+0x24/0x90
[   66.857595]  el0_svc+0x14/0x20
[   66.860739]  el0_sync_handler+0x1a4/0x1b0
[   66.864858]  el0_sync+0x174/0x180
[   66.868269] Code: 1ac020a0 2a000273 eb02007f 54ffff01 (f9400285)
[   66.874525] ---[ end trace 20dedb2a3229fec8 ]---

Fixes: 9d5cbf5fe46e ("drm/msm: add shutdown support for display platform_driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_atomic.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 6a326761dc4a..2fd0cf6421ad 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -207,7 +207,12 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	struct msm_kms *kms = priv->kms;
 	struct drm_crtc *async_crtc = NULL;
 	unsigned crtc_mask = get_crtc_mask(state);
-	bool async = kms->funcs->vsync_time &&
+	bool async;
+
+	if (!kms)
+		return;
+
+	async = kms->funcs->vsync_time &&
 			can_do_async(state, &async_crtc);
 
 	trace_msm_atomic_commit_tail_start(async, crtc_mask);
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
