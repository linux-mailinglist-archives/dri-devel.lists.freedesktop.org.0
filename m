Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7547D3B06D2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 16:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8792B6E514;
	Tue, 22 Jun 2021 14:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412356E231;
 Tue, 22 Jun 2021 14:10:09 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BEADB1FD62;
 Tue, 22 Jun 2021 14:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624371007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XsJmECcbxKYWzgWM+GhT6n6OjKfo8RxVmXLyN/vgtpw=;
 b=BUi1DVTzs86YDdOPQVYjsdDkqllyVGA+OElzBTMGAQT+B6lLSjeOE0G80KnH/bq0c/WNbR
 oppQsQGTP6D+3QZ6BixOfe9MgINH6cgnur/yXNcBp7JI4OFsnz3S3PG8k2Fv60qvDgxIj1
 GzBPKB1KoMv4I/ylE9zJj6+8Hr/x0vc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624371007;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XsJmECcbxKYWzgWM+GhT6n6OjKfo8RxVmXLyN/vgtpw=;
 b=rIGg8WxURXKt4E3OGOg5dgPfCzqXwb8OfaLCtrAwSehfabseXfx8mql65euBbjLgGwLTEI
 vI1cfztFBFyJ8RDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id A638311A98;
 Tue, 22 Jun 2021 14:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624371007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XsJmECcbxKYWzgWM+GhT6n6OjKfo8RxVmXLyN/vgtpw=;
 b=BUi1DVTzs86YDdOPQVYjsdDkqllyVGA+OElzBTMGAQT+B6lLSjeOE0G80KnH/bq0c/WNbR
 oppQsQGTP6D+3QZ6BixOfe9MgINH6cgnur/yXNcBp7JI4OFsnz3S3PG8k2Fv60qvDgxIj1
 GzBPKB1KoMv4I/ylE9zJj6+8Hr/x0vc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624371007;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XsJmECcbxKYWzgWM+GhT6n6OjKfo8RxVmXLyN/vgtpw=;
 b=rIGg8WxURXKt4E3OGOg5dgPfCzqXwb8OfaLCtrAwSehfabseXfx8mql65euBbjLgGwLTEI
 vI1cfztFBFyJ8RDA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id oMatJz7v0WD3UAAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Jun 2021 14:10:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, james.qian.wang@arm.com,
 liviu.dudau@arm.com, mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzysztof.kozlowski@canonical.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 p.zabel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 chunkuang.hu@kernel.org, matthias.bgg@gmail.com, bskeggs@redhat.com,
 tomba@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 benjamin.gaignard@linaro.org, yannick.fertre@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jyri.sarha@iki.fi,
 emma@anholt.net, linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com
Subject: [PATCH v2 03/22] drm/radeon: Track IRQ state in local device state
Date: Tue, 22 Jun 2021 16:09:43 +0200
Message-Id: <20210622141002.11590-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622141002.11590-1-tzimmermann@suse.de>
References: <20210622141002.11590-1-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace usage of struct drm_device.irq_enabled with the driver's
own state field struct radeon_device.irq.installed. The field in
the DRM device structure is considered legacy and should not be
used by KMS drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon_fence.c   |  2 +-
 drivers/gpu/drm/radeon/radeon_irq_kms.c | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
index 0d8ef2368adf..7ec581363e23 100644
--- a/drivers/gpu/drm/radeon/radeon_fence.c
+++ b/drivers/gpu/drm/radeon/radeon_fence.c
@@ -288,7 +288,7 @@ static void radeon_fence_check_lockup(struct work_struct *work)
 		return;
 	}
 
-	if (fence_drv->delayed_irq && rdev->ddev->irq_enabled) {
+	if (fence_drv->delayed_irq && rdev->irq.installed) {
 		unsigned long irqflags;
 
 		fence_drv->delayed_irq = false;
diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
index 84d0b1a3355f..a36ce826d0c0 100644
--- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
@@ -357,7 +357,7 @@ void radeon_irq_kms_sw_irq_get(struct radeon_device *rdev, int ring)
 {
 	unsigned long irqflags;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	if (atomic_inc_return(&rdev->irq.ring_int[ring]) == 1) {
@@ -396,7 +396,7 @@ void radeon_irq_kms_sw_irq_put(struct radeon_device *rdev, int ring)
 {
 	unsigned long irqflags;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	if (atomic_dec_and_test(&rdev->irq.ring_int[ring])) {
@@ -422,7 +422,7 @@ void radeon_irq_kms_pflip_irq_get(struct radeon_device *rdev, int crtc)
 	if (crtc < 0 || crtc >= rdev->num_crtc)
 		return;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	if (atomic_inc_return(&rdev->irq.pflip[crtc]) == 1) {
@@ -448,7 +448,7 @@ void radeon_irq_kms_pflip_irq_put(struct radeon_device *rdev, int crtc)
 	if (crtc < 0 || crtc >= rdev->num_crtc)
 		return;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	if (atomic_dec_and_test(&rdev->irq.pflip[crtc])) {
@@ -470,7 +470,7 @@ void radeon_irq_kms_enable_afmt(struct radeon_device *rdev, int block)
 {
 	unsigned long irqflags;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	spin_lock_irqsave(&rdev->irq.lock, irqflags);
@@ -492,7 +492,7 @@ void radeon_irq_kms_disable_afmt(struct radeon_device *rdev, int block)
 {
 	unsigned long irqflags;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	spin_lock_irqsave(&rdev->irq.lock, irqflags);
@@ -514,7 +514,7 @@ void radeon_irq_kms_enable_hpd(struct radeon_device *rdev, unsigned hpd_mask)
 	unsigned long irqflags;
 	int i;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	spin_lock_irqsave(&rdev->irq.lock, irqflags);
@@ -537,7 +537,7 @@ void radeon_irq_kms_disable_hpd(struct radeon_device *rdev, unsigned hpd_mask)
 	unsigned long irqflags;
 	int i;
 
-	if (!rdev->ddev->irq_enabled)
+	if (!rdev->irq.installed)
 		return;
 
 	spin_lock_irqsave(&rdev->irq.lock, irqflags);
-- 
2.32.0

