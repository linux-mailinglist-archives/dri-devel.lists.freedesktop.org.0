Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E172B51F5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768D76EA57;
	Mon, 16 Nov 2020 20:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A096E0EC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 20:08:13 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A1AA320A8B;
 Mon, 16 Nov 2020 20:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605557293;
 bh=c8VgzEkqwERkRAY+dkH9SFt/xXBqPaGtdhqo1tB0QKc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mX/+Fs7fntpGEjdyn3BXW3M3Ifm0j2MBT5dXO9ckfqXrVZiP32zsiFmHeEqnNwmLc
 4ynDNObF+192IVStFtv4tWCIUK1LIkhpzO0AXi5KNQg2xZOUREg4dbd4tK5H9ksabX
 8bhVF1DklWQ1NIuaVepVLqZaSiyLlE7RKj/fjKl0=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1keknL-00B7cF-RX; Mon, 16 Nov 2020 20:08:12 +0000
From: Marc Zyngier <maz@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/4] drm/meson: Free RDMA resources after tearing down DRM
Date: Mon, 16 Nov 2020 20:07:41 +0000
Message-Id: <20201116200744.495826-2-maz@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201116200744.495826-1-maz@kernel.org>
References: <20201116200744.495826-1-maz@kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 kernel-team@android.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Removing the meson DRM module results in the following splat:

[ 2179.451346] Hardware name:  , BIOS 2021.01-rc2-00012-gde865f7ee1 11/16/2020
[ 2179.458316] Workqueue: events drm_mode_rmfb_work_fn [drm]
[ 2179.463597] pstate: 80c00009 (Nzcv daif +PAN +UAO -TCO BTYPE=--)
[ 2179.469558] pc : meson_rdma_writel_sync+0x44/0xb0 [meson_drm]
[ 2179.475243] lr : meson_g12a_afbcd_reset+0x34/0x60 [meson_drm]
[ 2179.480930] sp : ffffffc01212bb70
[ 2179.484207] x29: ffffffc01212bb70 x28: ffffff8044f66f00
[ 2179.489469] x27: ffffff8045b13800 x26: 0000000000000001
[ 2179.494730] x25: 0000000000000000 x24: 0000000000000001
[ 2179.499991] x23: 0000000000000000 x22: 0000000000000000
[ 2179.505252] x21: 0000000000280000 x20: 0000000000001a01
[ 2179.510513] x19: ffffff8046029480 x18: 0000000000000000
[ 2179.515775] x17: 0000000000000000 x16: 0000000000000000
[ 2179.521036] x15: 0000000000000000 x14: 0000000000000000
[ 2179.526297] x13: 0040000000000326 x12: 0309030303260300
[ 2179.531558] x11: 03000000054004a0 x10: 0418054004000400
[ 2179.536820] x9 : ffffffc008fe4914 x8 : ffffff8040a1adc0
[ 2179.542081] x7 : 0000000000000000 x6 : ffffff8042aa0080
[ 2179.547342] x5 : ffffff8044f66f00 x4 : ffffffc008fe5bc8
[ 2179.552603] x3 : 0000000000010101 x2 : 0000000000000001
[ 2179.557865] x1 : 0000000000000000 x0 : 0000000000000000
[ 2179.563127] Call trace:
[ 2179.565548]  meson_rdma_writel_sync+0x44/0xb0 [meson_drm]
[ 2179.570894]  meson_g12a_afbcd_reset+0x34/0x60 [meson_drm]
[ 2179.576241]  meson_plane_atomic_disable+0x38/0xb0 [meson_drm]
[ 2179.581966]  drm_atomic_helper_commit_planes+0x1e0/0x21c [drm_kms_helper]
[ 2179.588684]  drm_atomic_helper_commit_tail_rpm+0x68/0xb0 [drm_kms_helper]
[ 2179.595410]  commit_tail+0xac/0x190 [drm_kms_helper]
[ 2179.600326]  drm_atomic_helper_commit+0x16c/0x390 [drm_kms_helper]
[ 2179.606484]  drm_atomic_commit+0x58/0x70 [drm]
[ 2179.610880]  drm_framebuffer_remove+0x398/0x434 [drm]
[ 2179.615881]  drm_mode_rmfb_work_fn+0x68/0x8c [drm]
[ 2179.620575]  process_one_work+0x1cc/0x49c
[ 2179.624538]  worker_thread+0x200/0x444
[ 2179.628246]  kthread+0x14c/0x160
[ 2179.631439]  ret_from_fork+0x10/0x38

caused by the fact that the RDMA buffer has already been freed,
resulting in meson_rdma_writel_sync() getting a NULL pointer.

Move the afbcd reset and meson_rdma_free calls after the DRM
unregistration is complete so that the teardown can safely complete.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/gpu/drm/meson/meson_drv.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 8b9c8dd788c4..324fa489f1c4 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -389,15 +389,15 @@ static void meson_drv_unbind(struct device *dev)
 		meson_canvas_free(priv->canvas, priv->canvas_id_vd1_2);
 	}
 
-	if (priv->afbcd.ops) {
-		priv->afbcd.ops->reset(priv);
-		meson_rdma_free(priv);
-	}
-
 	drm_dev_unregister(drm);
 	drm_irq_uninstall(drm);
 	drm_kms_helper_poll_fini(drm);
 	drm_dev_put(drm);
+
+	if (priv->afbcd.ops) {
+		priv->afbcd.ops->reset(priv);
+		meson_rdma_free(priv);
+	}
 }
 
 static const struct component_master_ops meson_drv_master_ops = {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
