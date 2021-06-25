Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CCD3B3EAA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 10:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078EA6ECFD;
	Fri, 25 Jun 2021 08:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDCE6E16F;
 Fri, 25 Jun 2021 08:22:29 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 45DD121C1F;
 Fri, 25 Jun 2021 08:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624609348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vCvMaakhW43FBHwwwgIT0NH9WFXQUbPBWotzOXDN7eU=;
 b=W888Bid/cwe7OvhgPpbpeW6HO4y/LtFvzNXdGjC0L7eX7jTOWHez5DVo8YTC4wbrowJt2l
 78STX3etyjzYBkEY3/ZNztGJBAqwjn7QgagSt1mYU2Z4DporOqUmw63fT/u3Kx2mpRkSrn
 QfmysRfn9YoaalY2gy+I5GYcAyxEeYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624609348;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vCvMaakhW43FBHwwwgIT0NH9WFXQUbPBWotzOXDN7eU=;
 b=IyMpBO36rSzIgYWvkMVS5YmIDTj2HEJ8P+Wob/ikUGG55daM31/MsGfHUc691qwnQxl8ud
 LVJMZByeVTf9pmCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2BC8611C9B;
 Fri, 25 Jun 2021 08:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624609348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vCvMaakhW43FBHwwwgIT0NH9WFXQUbPBWotzOXDN7eU=;
 b=W888Bid/cwe7OvhgPpbpeW6HO4y/LtFvzNXdGjC0L7eX7jTOWHez5DVo8YTC4wbrowJt2l
 78STX3etyjzYBkEY3/ZNztGJBAqwjn7QgagSt1mYU2Z4DporOqUmw63fT/u3Kx2mpRkSrn
 QfmysRfn9YoaalY2gy+I5GYcAyxEeYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624609348;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vCvMaakhW43FBHwwwgIT0NH9WFXQUbPBWotzOXDN7eU=;
 b=IyMpBO36rSzIgYWvkMVS5YmIDTj2HEJ8P+Wob/ikUGG55daM31/MsGfHUc691qwnQxl8ud
 LVJMZByeVTf9pmCw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id kL3fCUOS1WAISwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Fri, 25 Jun 2021 08:22:27 +0000
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
 yannick.fertre@foss.st.com, philippe.cornu@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@csie.org,
 jernej.skrabec@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 jyri.sarha@iki.fi, emma@anholt.net, linux-graphics-maintainer@vmware.com,
 zackr@vmware.com, hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, linux@armlinux.org.uk,
 kieran.bingham+renesas@ideasonboard.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Subject: [PATCH v4 03/27] drm/radeon: Track IRQ state in local device state
Date: Fri, 25 Jun 2021 10:21:58 +0200
Message-Id: <20210625082222.3845-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210625082222.3845-1-tzimmermann@suse.de>
References: <20210625082222.3845-1-tzimmermann@suse.de>
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
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace usage of struct drm_device.irq_enabled with the driver's
own state field struct radeon_device.irq.installed. The field in
the DRM device structure is considered legacy and should not be
used by KMS drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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

