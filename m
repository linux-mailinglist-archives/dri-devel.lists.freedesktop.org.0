Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9504D9B31E9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 14:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D209110E4B1;
	Mon, 28 Oct 2024 13:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=steffen.cc header.i=@steffen.cc header.b="TLwDU7Ed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197AF10E4B1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 13:42:33 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4XcZMB4z28z9spY;
 Mon, 28 Oct 2024 14:42:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=steffen.cc; s=MBO0001; 
 t=1730122950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SnAt2WGdW9o/tfYw/mDO16S2oXry5gmhCCzZ6QXpMaY=;
 b=TLwDU7EdjMHnB/kN4w7klFnTpfTh39T+w2Ip2Z+SNLYnTrNRaz3gaXvV6Rj26Swm4jMozt
 rLKv2xX7gKI++qMioucgmHWSs57O7qvQwMKA6i+OgpSiyFaRuilbGMvTebtZESFRtkV/F3
 J/bhWVMteFxlD2ypar6tvgSmhqcMprefpYQE2/QfSHPyPTcPTUYIZu8t3GdoD9k3xwA0ac
 OFfIaZRGYLf2VaObHIenOR+PQ41w6FwUflA9yJ8i/3BOYY0aU40tRil1kdb3BaKMKdP7lP
 jU/qYdtuqGQg/QFUnCp6XPVmYboQXtIviDqqeEtmOzHIunSinUueiboohKBE8A==
From: Steffen Dirkwinkel <lists@steffen.cc>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, stable@vger.kernel.org,
 Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm: xlnx: zynqmp_dpsub: fix hotplug detection
Date: Mon, 28 Oct 2024 14:42:17 +0100
Message-ID: <20241028134218.54727-1-lists@steffen.cc>
In-Reply-To: <f7fbd696-d739-457b-bebb-571b32ecc1d6@ideasonboard.com>
References: <f7fbd696-d739-457b-bebb-571b32ecc1d6@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>

drm_kms_helper_poll_init needs to be called after zynqmp_dpsub_kms_init.
zynqmp_dpsub_kms_init creates the connector and without it we don't
enable hotplug detection.

Fixes: eb2d64bfcc17 ("drm: xlnx: zynqmp_dpsub: Report HPD through the bridge")
Cc: stable@vger.kernel.org
Signed-off-by: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
---
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index bd1368df7870..311397cee5ca 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -509,12 +509,12 @@ int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 	if (ret)
 		return ret;
 
-	drm_kms_helper_poll_init(drm);
-
 	ret = zynqmp_dpsub_kms_init(dpsub);
 	if (ret < 0)
 		goto err_poll_fini;
 
+	drm_kms_helper_poll_init(drm);
+
 	/* Reset all components and register the DRM device. */
 	drm_mode_config_reset(drm);
 
-- 
2.47.0

