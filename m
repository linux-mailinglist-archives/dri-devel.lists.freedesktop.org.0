Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC0DA70811
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 18:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B56810E5C2;
	Tue, 25 Mar 2025 17:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VPVEl754";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F10210E5BF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 17:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742923462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yNj7p5akUefe7MFBWckCoaFQF271l+ai2Y2L65F/Zmc=;
 b=VPVEl754YbOlXlEIf6ISz/pnWqwuOMKtZeUWI0+7jzyQvc2WmCHaAhFyWLsymtdArZnrck
 bc1PID13MKB1S3bK6dZ1SiTG0PIFPjQE31Yp2iQn13Ii9L0Qb/fNbEt7f1WoW6p/m49JZT
 LcEmVosnTcdStoaQOqAThysiPkUlpu4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-673-grCqgMQoOu2ZzMY0LBGFBQ-1; Tue,
 25 Mar 2025 13:24:18 -0400
X-MC-Unique: grCqgMQoOu2ZzMY0LBGFBQ-1
X-Mimecast-MFC-AGG-ID: grCqgMQoOu2ZzMY0LBGFBQ_1742923457
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E643D1800349; Tue, 25 Mar 2025 17:24:16 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.186])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3F5A8180A802; Tue, 25 Mar 2025 17:24:14 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 25 Mar 2025 13:24:08 -0400
Subject: [PATCH 1/5] drm/panel: Add new helpers for refcounted panel allocatons
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-b4-panel-refcounting-v1-1-4e2bf5d19c5d@redhat.com>
References: <20250325-b4-panel-refcounting-v1-0-4e2bf5d19c5d@redhat.com>
In-Reply-To: <20250325-b4-panel-refcounting-v1-0-4e2bf5d19c5d@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742923451; l=3050;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=3plMta6SV34gCg4hxGEvoJNswR4Pewdmgy+AquhfFao=;
 b=RVT7sUNo4JPMqKU6K5afiHqH7PBvn4MhyjHxxQmylyRSMFd6+UjKc8PahHJ9bt/RFquerpaRe
 qrM7mB/qsugBI4ryqA3QVzTcHRQWw9iswNNcY1EbPkd0viPqOEEgedB
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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

Introduce reference counted allocations for panels to avoid
use-after-free. The patch adds the macro devm_drm_bridge_alloc()
to allocate a new refcounted panel. Followed the documentation for
drmm_encoder_alloc() and devm_drm_dev_alloc and other similar
implementations for this purpose.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/drm_panel.c | 25 +++++++++++++++++++++++++
 include/drm/drm_panel.h     | 22 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index c627e42a7ce70459f50eb5095fffc806ca45dabf..bdeab5710ee324dc1742fbc77582250960556308 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -355,6 +355,31 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
 }
 EXPORT_SYMBOL(of_drm_find_panel);
 
+void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
+			     const struct drm_panel_funcs *funcs,
+			     int connector_type)
+{
+	void *container;
+	struct drm_panel *panel;
+
+	if (!funcs) {
+		dev_warn(dev, "Missing funcs pointer\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	container = devm_kzalloc(dev, size, GFP_KERNEL);
+	if (!container)
+		return ERR_PTR(-ENOMEM);
+
+	panel = container + offset;
+	panel->funcs = funcs;
+
+	drm_panel_init(panel, dev, funcs, connector_type);
+
+	return container;
+}
+EXPORT_SYMBOL(__devm_drm_panel_alloc);
+
 /**
  * of_drm_get_panel_orientation - look up the orientation of the panel through
  * the "rotation" binding from a device tree node
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index a9c042c8dea1a82ef979c7a68204e0b55483fc28..63fb1dbe15a0556e7484bc18737a6b1f4c208b0c 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -28,6 +28,7 @@
 #include <linux/errno.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/kref.h>
 
 struct backlight_device;
 struct dentry;
@@ -268,6 +269,27 @@ struct drm_panel {
 	bool enabled;
 };
 
+void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
+			     const struct drm_panel_funcs *funcs,
+			     int connector_type);
+
+/**
+ * devm_drm_panel_alloc - Allocate and initialize an refcounted panel
+ * @dev: struct device of the panel device
+ * @type: the type of the struct which contains struct &drm_panel
+ * @member: the name of the &drm_panel within @type
+ * @funcs: callbacks for this panel
+ * @connector_type: connector type of the driver
+ * The returned refcount is initialised to 1
+ *
+ * Returns:
+ * Pointer to new panel, or ERR_PTR on failure.
+ */
+#define devm_drm_panel_alloc(dev, type, member, funcs, connector_type) \
+	((type *)__devm_drm_panel_alloc(dev, sizeof(type), \
+					offsetof(type, member), funcs, \
+					connector_type))
+
 void drm_panel_init(struct drm_panel *panel, struct device *dev,
 		    const struct drm_panel_funcs *funcs,
 		    int connector_type);

-- 
2.48.1

