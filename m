Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BF5595DA3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 15:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C27ACDF6;
	Tue, 16 Aug 2022 13:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0CD98E90
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 13:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660657603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=p5OSIpWT90frefg7xGzBYHPg0+V86mBzdAKs9FXoz/g=;
 b=NTagCNoHMDOIKsqwYHwpF/o7RAF8iKGgVB22FEYk8kNs3dwPC2OpDS6tvR73O1wCuGgGUM
 MDBikhQC5sfytrMt3D+wcD0ZyFsJ9t1tThTcr4z1LODQe6kBtXZquBWcWx7VvYie6I1v4R
 czf/sykJmo8mPwebkof8Ebo2metbvhs=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-488-qIVtFHspP-mwOLBR2a19aA-1; Tue, 16 Aug 2022 09:46:42 -0400
X-MC-Unique: qIVtFHspP-mwOLBR2a19aA-1
Received: by mail-ua1-f70.google.com with SMTP id
 d18-20020ab03192000000b0038785905f99so3140288uan.16
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 06:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=p5OSIpWT90frefg7xGzBYHPg0+V86mBzdAKs9FXoz/g=;
 b=ftZx6GnjrDoG6e400ofWrNGQjB7hqks1o9Eqc5B4QNDyXiM/9rG9o1xzP6UXx31mT5
 P3cHghyI56rUcrbGCzn5EGy5N78RjeIXjcjq8+5Vy+J1HkvQM4TG1IeyKykftzmXfYoR
 Blv/gCI0TjMZ6EylddtmR8z8TitStJSDm2fIvfGP/FhdVnVi/z7SCXcD+LeqOOpuxH7t
 Px6G1zJ8YK8p3PFPtpWuKPL0217xSZi4gC1vf19HvZQhuGlgkXlSvlZdzjSPC9a1125p
 lDvmsPCql1anAmdtUCWP17drAHoo7ZGhYJJVXhBqjWcaJuO95Wqe7XBSr1QKkU9cdc3e
 LfoQ==
X-Gm-Message-State: ACgBeo2kynj/ArdXLksGva1AOYor40gL4s44EMFuoN0nKtliS5qOZ/ck
 PHuc/gl0ZOWKvlZnWcsvRnppu58Qi685L2WNqS2WLcHC03PGKg4kbqWHTzrL8m1cHUBKXnIrieZ
 EOs1HsTbMp9fCc4Wv4GKe04Q4agFM
X-Received: by 2002:a05:6102:3d24:b0:388:4323:8e78 with SMTP id
 i36-20020a0561023d2400b0038843238e78mr8492052vsv.86.1660657601136; 
 Tue, 16 Aug 2022 06:46:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7dYbwWeCNwNJfUHQbDiDlC8h6iUJ+La5uDCvvn1TuftLxbb9HVYmT4vCD5UcNhSSTnlyNyGQ==
X-Received: by 2002:a05:6102:3d24:b0:388:4323:8e78 with SMTP id
 i36-20020a0561023d2400b0038843238e78mr8492037vsv.86.1660657600840; 
 Tue, 16 Aug 2022 06:46:40 -0700 (PDT)
Received: from minerva.. ([181.120.137.43]) by smtp.gmail.com with ESMTPSA id
 g11-20020ab0130b000000b0038275916987sm7116550uae.14.2022.08.16.06.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 06:46:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4] drm/msm: Make .remove and .shutdown HW shutdown consistent
Date: Tue, 16 Aug 2022 15:46:12 +0200
Message-Id: <20220816134612.916527-1-javierm@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers' .remove and .shutdown callbacks are executed on different code
paths. The former is called when a device is removed from the bus, while
the latter is called at system shutdown time to quiesce the device.

This means that some overlap exists between the two, because both have to
take care of properly shutting down the hardware. But currently the logic
used in these two callbacks isn't consistent in msm drivers, which could
lead to kernel panic.

For example, on .remove the component is deleted and its .unbind callback
leads to the hardware being shutdown but only if the DRM device has been
marked as registered.

That check doesn't exist in the .shutdown logic and this can lead to the
driver calling drm_atomic_helper_shutdown() for a DRM device that hasn't
been properly initialized.

A situation like this can happen if drivers for expected sub-devices fail
to probe, since the .bind callback will never be executed. If that is the
case, drm_atomic_helper_shutdown() will attempt to take mutexes that are
only initialized if drm_mode_config_init() is called during a device bind.

This bug was attempted to be fixed in commit 623f279c7781 ("drm/msm: fix
shutdown hook in case GPU components failed to bind"), but unfortunately
it still happens in some cases as the one mentioned above, i.e:

  systemd-shutdown[1]: Powering off.
  kvm: exiting hardware virtualization
  platform wifi-firmware.0: Removing from iommu group 12
  platform video-firmware.0: Removing from iommu group 10
  ------------[ cut here ]------------
  WARNING: CPU: 6 PID: 1 at drivers/gpu/drm/drm_modeset_lock.c:317 drm_modeset_lock_all_ctx+0x3c4/0x3d0
  ...
  Hardware name: Google CoachZ (rev3+) (DT)
  pstate: a0400009 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : drm_modeset_lock_all_ctx+0x3c4/0x3d0
  lr : drm_modeset_lock_all_ctx+0x48/0x3d0
  sp : ffff80000805bb80
  x29: ffff80000805bb80 x28: ffff327c00128000 x27: 0000000000000000
  x26: 0000000000000000 x25: 0000000000000001 x24: ffffc95d820ec030
  x23: ffff327c00bbd090 x22: ffffc95d8215eca0 x21: ffff327c039c5800
  x20: ffff327c039c5988 x19: ffff80000805bbe8 x18: 0000000000000034
  x17: 000000040044ffff x16: ffffc95d80cac920 x15: 0000000000000000
  x14: 0000000000000315 x13: 0000000000000315 x12: 0000000000000000
  x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
  x8 : ffff80000805bc28 x7 : 0000000000000000 x6 : 0000000000000000
  x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
  x2 : ffff327c00128000 x1 : 0000000000000000 x0 : ffff327c039c59b0
  Call trace:
   drm_modeset_lock_all_ctx+0x3c4/0x3d0
   drm_atomic_helper_shutdown+0x70/0x134
   msm_drv_shutdown+0x30/0x40
   platform_shutdown+0x28/0x40
   device_shutdown+0x148/0x350
   kernel_power_off+0x38/0x80
   __do_sys_reboot+0x288/0x2c0
   __arm64_sys_reboot+0x28/0x34
   invoke_syscall+0x48/0x114
   el0_svc_common.constprop.0+0x44/0xec
   do_el0_svc+0x2c/0xc0
   el0_svc+0x2c/0x84
   el0t_64_sync_handler+0x11c/0x150
   el0t_64_sync+0x18c/0x190
  ---[ end trace 0000000000000000 ]---
  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000018
  Mem abort info:
    ESR = 0x0000000096000004
    EC = 0x25: DABT (current EL), IL = 32 bits
    SET = 0, FnV = 0
    EA = 0, S1PTW = 0
    FSC = 0x04: level 0 translation fault
  Data abort info:
    ISV = 0, ISS = 0x00000004
    CM = 0, WnR = 0
  user pgtable: 4k pages, 48-bit VAs, pgdp=000000010eab1000
  [0000000000000018] pgd=0000000000000000, p4d=0000000000000000
  Internal error: Oops: 96000004 [#1] PREEMPT SMP
  ...
  Hardware name: Google CoachZ (rev3+) (DT)
  pstate: a0400009 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : ww_mutex_lock+0x28/0x32c
  lr : drm_modeset_lock_all_ctx+0x1b0/0x3d0
  sp : ffff80000805bb50
  x29: ffff80000805bb50 x28: ffff327c00128000 x27: 0000000000000000
  x26: 0000000000000000 x25: 0000000000000001 x24: 0000000000000018
  x23: ffff80000805bc10 x22: ffff327c039c5ad8 x21: ffff327c039c5800
  x20: ffff80000805bbe8 x19: 0000000000000018 x18: 0000000000000034
  x17: 000000040044ffff x16: ffffc95d80cac920 x15: 0000000000000000
  x14: 0000000000000315 x13: 0000000000000315 x12: 0000000000000000
  x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
  x8 : ffff80000805bc28 x7 : 0000000000000000 x6 : 0000000000000000
  x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
  x2 : ffff327c00128000 x1 : 0000000000000000 x0 : 0000000000000018
  Call trace:
   ww_mutex_lock+0x28/0x32c
   drm_modeset_lock_all_ctx+0x1b0/0x3d0
   drm_atomic_helper_shutdown+0x70/0x134
   msm_drv_shutdown+0x30/0x40
   platform_shutdown+0x28/0x40
   device_shutdown+0x148/0x350
   kernel_power_off+0x38/0x80
   __do_sys_reboot+0x288/0x2c0
   __arm64_sys_reboot+0x28/0x34
   invoke_syscall+0x48/0x114
   el0_svc_common.constprop.0+0x44/0xec
   do_el0_svc+0x2c/0xc0
   el0_svc+0x2c/0x84
   el0t_64_sync_handler+0x11c/0x150
   el0t_64_sync+0x18c/0x190
  Code: aa0103f4 d503201f d2800001 aa0103e3 (c8e37c02)
  ---[ end trace 0000000000000000 ]---
  Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
  Kernel Offset: 0x495d77c00000 from 0xffff800008000000
  PHYS_OFFSET: 0xffffcd8500000000
  CPU features: 0x800,00c2a015,19801c82
  Memory Limit: none
  ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

Fixes: 9d5cbf5fe46e ("drm/msm: add shutdown support for display platform_driver")
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---

Changes in v4:
- Remove the kernel log timestamps and just keep the stacktrace (Abhinav Kumar).
- Add Abhinav Kumar Reviewed-by tag.

Changes in v3:
- Drop the msm_shutdown_hw() wrapper and just call drm_atomic_helper_shutdown()
  in both callbacks (Dmitry Baryshkov).
- Copy the comment in msm_drm_uninit() to msm_drv_shutdown() (Dmitry Baryshkov).

Changes in v2:
- Take the registered check out of the msm_shutdown_hw() and make callers to check instead.
- Make msm_shutdown_hw() an inline function.
- Add a Fixes: tag.

 drivers/gpu/drm/msm/msm_drv.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 1d0bafedd585..226d8d4629d2 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1242,10 +1242,15 @@ void msm_drv_shutdown(struct platform_device *pdev)
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct drm_device *drm = priv ? priv->dev : NULL;
 
-	if (!priv || !priv->kms)
-		return;
-
-	drm_atomic_helper_shutdown(drm);
+	/*
+	 * Shutdown the hw if we're far enough along where things might be on.
+	 * If we run this too early, we'll end up panicking in any variety of
+	 * places. Since we don't register the drm device until late in
+	 * msm_drm_init, drm_dev->registered is used as an indicator that the
+	 * shutdown will be successful.
+	 */
+	if (drm && drm->registered)
+		drm_atomic_helper_shutdown(drm);
 }
 
 static struct platform_driver msm_platform_driver = {
-- 
2.37.1

