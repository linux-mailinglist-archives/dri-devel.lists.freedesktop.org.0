Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F0894D75B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 21:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851CA10E9EF;
	Fri,  9 Aug 2024 19:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="qlghef/t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com
 [95.215.58.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA4210E9EF
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 19:36:23 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1723232181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jzac6s167f/EibwxsfpMGlvZd8RAd5X1jF/kZBreWa0=;
 b=qlghef/ttCZexKig9Jch5lSW2xzc7BANS7o9DC1GOHOq2kxjB71oEFiEt0WkpXzg/M7aBT
 PPzsOlK9tE+2thach6XanfFKFbREhHDTS//1b5Qs3OE1nPurVT23GxbwYm0ZEBrkTRl19R
 bczk3ly0v1y2D5tdvhKaTtoIcwr/tGE=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 David Airlie <airlied@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v6 1/8] drm: zynqmp_kms: Unplug DRM device before removal
Date: Fri,  9 Aug 2024 15:35:53 -0400
Message-Id: <20240809193600.3360015-2-sean.anderson@linux.dev>
In-Reply-To: <20240809193600.3360015-1-sean.anderson@linux.dev>
References: <20240809193600.3360015-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Prevent userspace accesses to the DRM device from causing
use-after-frees by unplugging the device before we remove it. This
causes any further userspace accesses to result in an error without
further calls into this driver's internals.

Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
Closes: https://lore.kernel.org/dri-devel/4d8f4c9b-2efb-4774-9a37-2f257f79b2c9@linux.dev/
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---
Thanks to Maxime for pointing out the correct function to use here.

Changes in v6:
- New

 drivers/gpu/drm/xlnx/zynqmp_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index bd1368df7870..4556af2faa0f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -536,7 +536,7 @@ void zynqmp_dpsub_drm_cleanup(struct zynqmp_dpsub *dpsub)
 {
 	struct drm_device *drm = &dpsub->drm->dev;
 
-	drm_dev_unregister(drm);
+	drm_dev_unplug(drm);
 	drm_atomic_helper_shutdown(drm);
 	drm_encoder_cleanup(&dpsub->drm->encoder);
 	drm_kms_helper_poll_fini(drm);
-- 
2.35.1.1320.gc452695387.dirty

