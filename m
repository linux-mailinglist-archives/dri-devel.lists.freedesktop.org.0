Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2011BBA0CDD
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 19:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3FA10E996;
	Thu, 25 Sep 2025 17:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="iOpkIZ6M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D0B10E996
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 17:20:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1C159C011FF;
 Thu, 25 Sep 2025 17:19:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 64BE060665;
 Thu, 25 Sep 2025 17:20:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 36952102F18A6; 
 Thu, 25 Sep 2025 19:20:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758820811; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xHjzQbM/4RJWH0CChP1hj2HXRcgPGp7OejUh4qefmG0=;
 b=iOpkIZ6MraXlaLq3hs/jbA/mLz0DmdJ+9nEQHFO1/iIwjjkzLZln5Ril8MpIUAItw2Qfua
 tyu5D+f3jZXsMKcrPhT8Zhnwf3iw5n5iNUt8FI1yRVqexgmR+cqhZKYq8by2nvGSQJvGQZ
 7gmjv2mx53Vd+KywFNpeea0CCxMTC+sM5ynUqJ0DdWq/C39AAZiRQW+8lVkUyjsSMIPsr4
 e2zHPnBVOONEgfGJzJHf+lmSpaGiXdEud97ABlHeUn5Tkw4Qb9hZu2m131vGg3/K0KdWGT
 T2SwFKY54sAXAsScuTqkVZImbMQlJa3FQUfpYaGWqOMHbnvihwe7PsZSA3c3ow==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 25 Sep 2025 19:19:49 +0200
Subject: [PATCH 1/2] drm/connector: allow a .destroy callback for
 drmm-allocated connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-drm-bridge-alloc-getput-bridge-connector-v1-1-f0736e1c73ee@bootlin.com>
References: <20250925-drm-bridge-alloc-getput-bridge-connector-v1-0-f0736e1c73ee@bootlin.com>
In-Reply-To: <20250925-drm-bridge-alloc-getput-bridge-connector-v1-0-f0736e1c73ee@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
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

Some code is going to need connector-specific cleanup actions (namely
drm_bridge_connector will need to put refcounted bridges).

The .destroy callback is appropriate for this task but it is currently
forbidden by drmm_connector_init(). Relax this limitation and document it.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

The other obvious approach would be adding a separate .cleanup callback for
the cleanup-only actions. I tried both, they both apparently work, so any
arguments and opinions on which approach is best within the overall DRM
design would be very useful here.
---
 drivers/gpu/drm/drm_connector.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 272d6254ea4784e97ca894ec4d463beebf9fdbf0..bd0220513a23afcb096b0c4c4d2b957b81f21ee1 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -513,7 +513,8 @@ static void drm_connector_cleanup_action(struct drm_device *dev,
  *
  * The connector structure should be allocated with drmm_kzalloc().
  *
- * The @drm_connector_funcs.destroy hook must be NULL.
+ * The @drm_connector_funcs.destroy hook must only do connector-specific
+ * cleanups if any is needed, not dealloacte the connector.
  *
  * Returns:
  * Zero on success, error code on failure.
@@ -526,9 +527,6 @@ int drmm_connector_init(struct drm_device *dev,
 {
 	int ret;
 
-	if (drm_WARN_ON(dev, funcs && funcs->destroy))
-		return -EINVAL;
-
 	ret = drm_connector_init_and_add(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;

-- 
2.51.0

