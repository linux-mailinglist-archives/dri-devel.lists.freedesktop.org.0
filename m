Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65188C0016
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 16:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9F710FF97;
	Wed,  8 May 2024 14:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fVUXtWd7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FFF112D42
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 14:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+NA+J/bQSCWdZDkFXYko4h0ERSj6upNKeSgk+LB/dDQ=; b=fVUXtWd72kQQQJnOvYTnCsExGa
 qfQBvb/TibEedr/o9AdLJMp7X2d2Mkd9N93oGwa2eFWGcFV7EUzee3ZpTQ6fYbtlnzhZJr1i567BJ
 lxHTb+C/VVrDoC9bqeaK+t1HOGouQOi6OcaYvWISrprihPT0n8tRedWjWDwoVEyc3DLTtdRLN6nDW
 on/XekoVgi4f8iIn4p0tCRXeRLUsbjcvjF7oGuDyDrEbbgK4eH81Bf/FNaX5Pxp0j7MgxBDjp4Obj
 Xuf3yUPo9wJ+eUG27nB7jciAmN9DFQa7DDHAI9i4LMnG7T/lRyHPefVk1LQ8b3QJm5FR0F4FJiROM
 I89kj9wg==;
Received: from [179.234.232.152] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s4iNq-002ogv-Av; Wed, 08 May 2024 16:35:02 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 =?UTF-8?q?Juan=20A=20=2E=20Su=C3=A1rez?= <jasuarez@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 2/6] drm/v3d: Different V3D versions can have different number
 of perfcnt
Date: Wed,  8 May 2024 11:30:44 -0300
Message-ID: <20240508143306.2435304-4-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240508143306.2435304-2-mcanal@igalia.com>
References: <20240508143306.2435304-2-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Currently, even though V3D 7.1 has 93 performance counters, it is not
possible to create counters bigger than 87, as
`v3d_perfmon_create_ioctl()` understands that counters bigger than 87
are invalid.

Therefore, create a device variable to expose the maximum
number of counters for a given V3D version and make
`v3d_perfmon_create_ioctl()` check this variable.

This commit fixes CTS failures in the performance queries tests
(dEQP-VK.query_pool.performance_query.*) [1]

Link: https://gitlab.freedesktop.org/mesa/mesa/-/commit/ea1f09a5f21839f4f3b93610b58507c4bd9b9b81 [1]
Fixes: 6fd9487147c4 ("drm/v3d: add brcm,2712-v3d as a compatible V3D device")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c     | 7 +++++++
 drivers/gpu/drm/v3d/v3d_drv.h     | 5 +++++
 drivers/gpu/drm/v3d/v3d_perfmon.c | 3 ++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 28b7ddce7747..6b9dd26df9fe 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -294,6 +294,13 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	v3d->cores = V3D_GET_FIELD(ident1, V3D_HUB_IDENT1_NCORES);
 	WARN_ON(v3d->cores > 1); /* multicore not yet implemented */
 
+	if (v3d->ver >= 71)
+		v3d->max_counters = ARRAY_SIZE(v3d_v71_performance_counters);
+	else if (v3d->ver >= 42)
+		v3d->max_counters = ARRAY_SIZE(v3d_v42_performance_counters);
+	else
+		v3d->max_counters = 0;
+
 	v3d->reset = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(v3d->reset)) {
 		ret = PTR_ERR(v3d->reset);
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 671375a3bb66..bd1e38f7d10a 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -104,6 +104,11 @@ struct v3d_dev {
 	int ver;
 	bool single_irq_line;
 
+	/* Different revisions of V3D have different total number of performance
+	 * counters
+	 */
+	unsigned int max_counters;
+
 	void __iomem *hub_regs;
 	void __iomem *core_regs[3];
 	void __iomem *bridge_regs;
diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_perfmon.c
index e1be7368b87d..f268d9466c0f 100644
--- a/drivers/gpu/drm/v3d/v3d_perfmon.c
+++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
@@ -123,6 +123,7 @@ int v3d_perfmon_create_ioctl(struct drm_device *dev, void *data,
 {
 	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
 	struct drm_v3d_perfmon_create *req = data;
+	struct v3d_dev *v3d = v3d_priv->v3d;
 	struct v3d_perfmon *perfmon;
 	unsigned int i;
 	int ret;
@@ -134,7 +135,7 @@ int v3d_perfmon_create_ioctl(struct drm_device *dev, void *data,
 
 	/* Make sure all counters are valid. */
 	for (i = 0; i < req->ncounters; i++) {
-		if (req->counters[i] >= V3D_PERFCNT_NUM)
+		if (req->counters[i] >= v3d->max_counters)
 			return -EINVAL;
 	}
 
-- 
2.44.0

