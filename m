Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A279998E70
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 19:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2E010E9A1;
	Thu, 10 Oct 2024 17:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jd3jsYTG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E40510E982
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 17:39:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C63F06000C;
 Thu, 10 Oct 2024 17:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728581954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rkf9ZB1RI/rNCaGK7I5+lWCo2AWKpanKigvlMgvMjRM=;
 b=jd3jsYTGnV4aC195SBKC7P2bszl6mmEW3hsOyW0utC1awdr1sJN0KPDMukDZS8PblI74g+
 v/Ou0QFlo+maIaFvuSwq2i8eqsJgq6cg7WNNsv2XAduYWkEqw58zHa2EekqaE6O7VPctR9
 WEFgIWkXtCg++ogSi5H7V2kBdUSVGfzsg4r6/cPpdUAQx5O7J76f+8t9i33bgbwBk/9Rfq
 vFMXNmqPFt1azUoNQN0nP/hpXq2oT6TnFjEVUnCoE9Aj5dwFEZRsMOtB6hOXbY4YtEZlw4
 j7tEDvYabZ6ys8Tp8fcOfGxnE8gKKCh7cHIy0ebMt4uAXAI9HGPA7jLSCqS7+Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 10 Oct 2024 19:39:07 +0200
Subject: [PATCH v4 5/5] drm/vkms: Switch to managed for writeback connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-google-vkms-managed-v4-5-ed04a62ad2e3@bootlin.com>
References: <20241010-google-vkms-managed-v4-0-ed04a62ad2e3@bootlin.com>
In-Reply-To: <20241010-google-vkms-managed-v4-0-ed04a62ad2e3@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 20241010-vkms-remove-index-v2-1-6b8d6cfd5a15@bootlin.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1615;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=8l77jL6QEAistTQ7vNwYyQyAA5lIi9scXT9/twYXbAM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnCBE7NMO1dp5i+Q/LysJmR6xywG87t8hEhM9fr
 IaTJ+AmyPWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZwgROwAKCRAgrS7GWxAs
 4q0cD/9y2FmV7crb8LSRzxX3vslwV2c0WJ2Z83sCtWbNYhfCWx9VLSQjlfW73ToISTCqS8PUXZT
 nNyQqHNlCPIvI+ktCS/vnrp7rbrJCfqZRcUdc5objMlmFV8OvLnKi3/aZTh7LmqhHOiiLq54xfd
 S2BZIJrSsCDd0uNlBn3EhGkAfKOcPmcF5hdnhoPibf5EciGBhVDYgBrTLpdbTH8AvHyuO0WKO5y
 mOIV6OexhxgJTroHBn6NatGFOtQkgHjkNJIpib07+YMhQpSCgGpG8qFUExQBQGB12VFryyYCIaT
 Vt+PPU8nmI7QfhMoUfA+QuPT4wlJXVUr+kBfvMl9Z5X1TYqH+YuU0wLBFCwyxtV3HBtVjye8qEu
 1Hr79nE5REqzJ5dSkOs1qTLupHNJoa+VHUncRkjxpuIQDzTv2NSeIoiUb5B3iO9j4ADsniJh48R
 uXtx1D7Rzw6PdN6sNpL6SbfY3/ycGsC8XA6rRxa4mKS0AiyGj0fzuTJO3CcJYjb3fonBKQtYlmF
 LtwdwgjQKARXs28tWIuylvn+qVkom3Rc2XWuvo425nTF5cF0NuSh04vEebgiinsxrf1OLjnIHHW
 WFLkAnoG+pTrqtS3rYnapMwRnBu/yRSaXVFlQbJCzwBi+XTyRitYjsngZ7fIAAAUt4D0DSh/i77
 D63+ljQmuADkEbg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

The current VKMS driver uses non-managed function to create
writeback connectors. It is not an issue yet, but in order
to support multiple devices easily, convert this code to
use drm and device managed helpers.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_writeback.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index bc724cbd5e3a..a948f4598764 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -24,7 +24,6 @@ static const u32 vkms_wb_formats[] = {
 
 static const struct drm_connector_funcs vkms_wb_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -174,10 +173,10 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
 
 	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
 
-	return drm_writeback_connector_init(&vkmsdev->drm, wb,
-					    &vkms_wb_connector_funcs,
-					    NULL,
-					    vkms_wb_formats,
-					    ARRAY_SIZE(vkms_wb_formats),
-					    1);
+	return drmm_writeback_connector_init(&vkmsdev->drm, wb,
+					     &vkms_wb_connector_funcs,
+					     NULL, NULL,
+					     vkms_wb_formats,
+					     ARRAY_SIZE(vkms_wb_formats),
+					     1);
 }

-- 
2.46.2

