Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBBC23D9C4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 13:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B9989DC9;
	Thu,  6 Aug 2020 11:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83ADA89DC9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 11:17:13 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id a5so33648846wrm.6
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Aug 2020 04:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=9iOCr7eJp9cKSC0EzGHUv7YGIck1uWeEY2I5uy4YNVw=;
 b=A5uzzMDlT7sF3Aq8xz0Mc97XaqowFT8jF2OuQeB3jO6f0XJE+2jhpT/a9sJR0O8ctk
 j5g0YpEN9bejb6H965LB+B22WyD9ycS4AC0RQRSPwFsS1e34ApOVP1r5oITCkZul4BsK
 U1aXsVJfiZma3bWjGBMgeCaobOkVEOC5PClJU8yEfAWGsNdVpWuJih6LrWHhy0lvdv+r
 vDNqC9C2cxAdiQGjSHIwSXVNcmlUPykFTQeveoTQI9pZ5ML6H7f+7kkPWHBkrlHj7hys
 AuQ6VW8HYXITfNBUKp50OtMPewNmRCVK3k/InR057UlaFsC7nFPkc07eqL8OnAjOM9Vl
 yTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=9iOCr7eJp9cKSC0EzGHUv7YGIck1uWeEY2I5uy4YNVw=;
 b=hkE+i5p2pL89tTfOm8RX2nn5IW32dRG4/ik1WzGkq+jWREySKtNwSK2RB6wpnNarn/
 wu+3rHGeN+UgPf1PAme03gFdrN6XyharI6iRUsH0DHYCSwLM9b0x2kZStIehVxGimY0G
 q1UsEw3VY9VmA8dprDmsP85Ckhgj+glDJKTpHnPekCkA+zGgERTCwl4tPs7Zojat/Cfn
 7tvJu4aLAIpyN6sEk+60FCxIpdA58S4Q1aRZQtHteFKYtoOtzY+PjMWKvlnPe37//qjr
 yu/ti7eTV7Vkg2A7AlAwsFWa9QcbqGMe39tu12xG448xrRAJx4X5VZjr8sV6j0Fmwg4j
 QIwg==
X-Gm-Message-State: AOAM5312Tu2znn18pW80s8jed+VNaF+rIOd8nIaAOW+/0UBjb0PPNiAl
 KWUahqY8NKzYzUVac4tvwMw=
X-Google-Smtp-Source: ABdhPJzAXSYcp8Fz4bXyGNvGF3pByi4yiYy5EZAlfiVFHfBSznTJC2Z/b6aOTAah5qSMecN0pqtvcQ==
X-Received: by 2002:a05:6000:1152:: with SMTP id
 d18mr7443159wrx.357.1596712632165; 
 Thu, 06 Aug 2020 04:17:12 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id x82sm6243352wmb.30.2020.08.06.04.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 04:17:11 -0700 (PDT)
Date: Thu, 6 Aug 2020 08:17:05 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Sidong Yang <realwakka@gmail.com>
Subject: [PATCH v2] drm/vkms: guarantee vblank when capturing crc
Message-ID: <20200806111705.xebopzucxr3367z4@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: kernel-usp@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VKMS needs vblank interrupts enabled to capture CRC. When vblank is
disabled, tests like kms_cursor_crc and kms_pipe_crc_basic getting stuck
waiting for a capture that will not occur until vkms wakes up. This patch
adds a helper to set composer and ensure that vblank remains enabled as
long as the CRC capture is needed.

It clears the execution of the following kms_cursor_crc subtests:
1. pipe-A-cursor-[size,alpha-opaque, NxN-(on-screen, off-screen, sliding,
random, fast-moving])] - successful when running individually.
2. pipe-A-cursor-dpms passes again
3. pipe-A-cursor-suspend also passes

The issue was initially tracked in the sequential execution of IGT
kms_cursor_crc subtest: when running the test sequence or one of its
subtests twice, the odd execs complete and the pairs get stuck in an
endless wait. In the IGT code, calling a wait_for_vblank on preparing for
CRC capture prevented the busy-wait. But the problem persisted in the
pipe-A-cursor-dpms and -suspend subtests.

Checking the history, the pipe-A-cursor-dpms subtest was successful when,
in vkms_atomic_commit_tail, instead of using the flip_done op, it used
wait_for_vblanks. Another way to prevent blocking was wait_one_vblank when
enabling crtc. However, in both cases, pipe-A-cursor-suspend persisted
blocking in the 2nd start of CRC capture, which may indicate that
something got stuck in the step of CRC setup. Indeed, wait_one_vblank in
the crc setup was able to sync things and free all kms_cursor_crc
subtests. Besides, other alternatives to force enabling vblanks or prevent
disabling them such as calling drm_crtc_put_vblank or modeset_enables
before commit_planes + offdelay = 0, also unlock all subtests executions.

Finally, due to vkms's dependence on vblank interruptions to perform
tasks, this patch uses refcount to ensure that vblanks happen when
enabling composer and while crc capture is needed.

Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Co-developed-by: Sidong Yang <realwakka@gmail.com>
Signed-off-by: Sidong Yang <realwakka@gmail.com>
Co-developed-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 20 +++++++++++++++++---
 drivers/gpu/drm/vkms/vkms_drv.h      |  1 +
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index b8b060354667..e2ac2b9759bf 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -233,6 +233,22 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *src_name,
 	return 0;
 }
 
+void vkms_set_composer(struct vkms_output *out, bool enabled)
+{
+	bool old_enabled;
+
+	if (enabled)
+		drm_crtc_vblank_get(&out->crtc);
+
+	spin_lock_irq(&out->lock);
+	old_enabled = out->composer_enabled;
+	out->composer_enabled = enabled;
+	spin_unlock_irq(&out->lock);
+
+	if (old_enabled)
+		drm_crtc_vblank_put(&out->crtc);
+}
+
 int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 {
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
@@ -241,9 +257,7 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 
 	ret = vkms_crc_parse_source(src_name, &enabled);
 
-	spin_lock_irq(&out->lock);
-	out->composer_enabled = enabled;
-	spin_unlock_irq(&out->lock);
+	vkms_set_composer(out, enabled);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index f4036bb0b9a8..2cc86d08bd4e 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -142,6 +142,7 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 			   size_t *values_cnt);
 
 /* Composer Support */
+void vkms_set_composer(struct vkms_output *output, bool enabled);
 void vkms_composer_worker(struct work_struct *work);
 
 #endif /* _VKMS_DRV_H_ */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
