Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DAD56A7E1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 18:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB223112628;
	Thu,  7 Jul 2022 16:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3428C10FDFF;
 Thu,  7 Jul 2022 16:20:24 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 73so3994877pgb.10;
 Thu, 07 Jul 2022 09:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TQXT+Vn5CgtfH4Lkw1DN2mXJFuK6qLYy5tuOuFlvcck=;
 b=ep481detKf6cnRtYgWwYl8Ve2Q20j9MBngIbyhXi+uUiMyNsCkJPVNnqV4+9GEhQMI
 5r1BEG5VeuXECmy0qa1BEBQ6bsTHw3NZbroX0bjTLLy01n8EJ8mAk5kqew8XKjiFk3cX
 ppiMuPBWMYfwraZz6UOODNf3GAhRBmy/Assivb9cqXlaSodfiAa5hIapIWjlPEkelT98
 zVcpWRM4+ZtOZ382zBMtZJumB5PmIIl70vSgkIem6zVa5wnPbw+b+Lqs+D7k+ZnxBRJJ
 RcwcxN2L9fTv0LJKfZzwj/fnvwPHkHniErWhqoAe6s1/AeXORF3nj9RWw78U2egOuoEk
 ODqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TQXT+Vn5CgtfH4Lkw1DN2mXJFuK6qLYy5tuOuFlvcck=;
 b=z8u5yQuz5KieNyNN5PGFPlu6BlE80b7kY+dfK8rpvNvotZ93ghQgzgNSgsvKcOMMwt
 2h6IY4rllQbHRiwvAcbd4c0Vliyom2xylie+G65nLD6LnFDmS2ewWT6z8TtlntvA+8N1
 XLCKvUAkoo7x2FIa9CFTXQQgeK4GO1GISVu0lCwzRv5i8O2KFK1xLd/afGoptDyF0LQB
 jEMguf/En2WEKSK6x4udbTD8N32Swu2leOWfOJEaGKmelh4LgpC1jRH+xWaCGm+LpuV0
 LPd+t4Q6jStFwTmSdbIDl4xI7iAd+wuIGK+CIOTkXxReLv6b/58lAeAIkqVi7YDWwoPp
 N4gw==
X-Gm-Message-State: AJIora/vNAkf9A82ZLpg43D4+3MKa4P7vcynTca9Xuxm+kKRL8qXroY6
 Pa+A+SN4a6yN7LCZtl84Itf2NCjyuWc=
X-Google-Smtp-Source: AGRyM1u9SEtnL4jQMZBKg67l2QvltlcdhvaT46D8WMwmZH1uvR/26Gg6+iZyybeAlJ1r2Lx9Ozai7w==
X-Received: by 2002:a17:902:ea0e:b0:16b:f92b:a3c3 with SMTP id
 s14-20020a170902ea0e00b0016bf92ba3c3mr13342583plg.10.1657210822934; 
 Thu, 07 Jul 2022 09:20:22 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 ik30-20020a170902ab1e00b0016bee668a5asm7138661plb.161.2022.07.07.09.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 09:20:21 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/mdp5: Fix global state lock backoff
Date: Thu,  7 Jul 2022 09:20:37 -0700
Message-Id: <20220707162040.1594855-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We need to grab the lock after the early return for !hwpipe case.
Otherwise, we could have hit contention yet still returned 0.

Fixes an issue that the new CONFIG_DRM_DEBUG_MODESET_LOCK stuff flagged
in CI:

   WARNING: CPU: 0 PID: 282 at drivers/gpu/drm/drm_modeset_lock.c:296 drm_modeset_lock+0xf8/0x154
   Modules linked in:
   CPU: 0 PID: 282 Comm: kms_cursor_lega Tainted: G        W         5.19.0-rc2-15930-g875cc8bc536a #1
   Hardware name: Qualcomm Technologies, Inc. DB820c (DT)
   pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
   pc : drm_modeset_lock+0xf8/0x154
   lr : drm_atomic_get_private_obj_state+0x84/0x170
   sp : ffff80000cfab6a0
   x29: ffff80000cfab6a0 x28: 0000000000000000 x27: ffff000083bc4d00
   x26: 0000000000000038 x25: 0000000000000000 x24: ffff80000957ca58
   x23: 0000000000000000 x22: ffff000081ace080 x21: 0000000000000001
   x20: ffff000081acec18 x19: ffff80000cfabb80 x18: 0000000000000038
   x17: 0000000000000000 x16: 0000000000000000 x15: fffffffffffea0d0
   x14: 0000000000000000 x13: 284e4f5f4e524157 x12: 5f534b434f4c5f47
   x11: ffff80000a386aa8 x10: 0000000000000029 x9 : ffff80000cfab610
   x8 : 0000000000000029 x7 : 0000000000000014 x6 : 0000000000000000
   x5 : 0000000000000001 x4 : ffff8000081ad904 x3 : 0000000000000029
   x2 : ffff0000801db4c0 x1 : ffff80000cfabb80 x0 : ffff000081aceb58
   Call trace:
    drm_modeset_lock+0xf8/0x154
    drm_atomic_get_private_obj_state+0x84/0x170
    mdp5_get_global_state+0x54/0x6c
    mdp5_pipe_release+0x2c/0xd4
    mdp5_plane_atomic_check+0x2ec/0x414
    drm_atomic_helper_check_planes+0xd8/0x210
    drm_atomic_helper_check+0x54/0xb0
    ...
   ---[ end trace 0000000000000000 ]---
   drm_modeset_lock attempting to lock a contended lock without backoff:
      drm_modeset_lock+0x148/0x154
      mdp5_get_global_state+0x30/0x6c
      mdp5_pipe_release+0x2c/0xd4
      mdp5_plane_atomic_check+0x290/0x414
      drm_atomic_helper_check_planes+0xd8/0x210
      drm_atomic_helper_check+0x54/0xb0
      drm_atomic_check_only+0x4b0/0x8f4
      drm_atomic_commit+0x68/0xe0

Fixes: d59be579fa93 ("drm/msm/mdp5: Return error code in mdp5_pipe_release when deadlock is detected")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
index a4f5cb90f3e8..e4b8a789835a 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c
@@ -123,12 +123,13 @@ int mdp5_pipe_release(struct drm_atomic_state *s, struct mdp5_hw_pipe *hwpipe)
 {
 	struct msm_drm_private *priv = s->dev->dev_private;
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
-	struct mdp5_global_state *state = mdp5_get_global_state(s);
+	struct mdp5_global_state *state;
 	struct mdp5_hw_pipe_state *new_state;
 
 	if (!hwpipe)
 		return 0;
 
+	state = mdp5_get_global_state(s);
 	if (IS_ERR(state))
 		return PTR_ERR(state);
 
-- 
2.36.1

