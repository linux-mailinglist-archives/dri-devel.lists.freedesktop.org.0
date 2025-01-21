Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05CBA18002
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 15:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441FA10E5D3;
	Tue, 21 Jan 2025 14:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QVRz11X+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4061310E5D5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 14:38:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 096D9C000C;
 Tue, 21 Jan 2025 14:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737470292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QuufuVa/g1o21UorwLjFyv4koJbCSFzjFYgF/podHmw=;
 b=QVRz11X+qDTY9MoeglEk3G4W7VmbPKcUHe+dQeHEeR8pjbIkVNgbXdQ8rZVUPaiQuHmDA6
 6xpkCL7sDJr9c0CBMvpDJfsfWTTY0ZDaDSzK3kw+PSFyIzrTLFUW2Tqap6oGkxkr4VOmBF
 EAZ8rCxXjty3ZTcK6D8KRKKJES57r/vuQNQZaHB+6XISNxrnzwrv2LYRMDWw7b1p8OcQ5K
 qOpffbPQQeSENifB+OhDDufHRaOFrCdl8hZCqgprhCp5ulm2b4xiWQ2VWh8XFTw1DDTCDF
 0mGUItGHsqYnPvwOVxY4KSna1+G+Kl1sMF2EaNO16NizoRKf0Lq43ItE6XCe/Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 15:34:56 +0100
Subject: [PATCH RFC v3 12/14] drm/vkms: Introduce configfs for connector id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-google-config-fs-v3-12-8154a6945142@bootlin.com>
References: <20250121-google-config-fs-v3-0-8154a6945142@bootlin.com>
In-Reply-To: <20250121-google-config-fs-v3-0-8154a6945142@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: jose.exposito89@gmail.com, dri-devel@lists.freedesktop.org, 
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1444;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=l8g6VjX5NCcSXOoIqBvGFqtrZkGAS8ayIn0WYIC8uI8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj7FDsg8CdITBHzn2RQlXGvPE3hRUCY38A9s+T
 sOm9xG6x3uJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4+xQwAKCRAgrS7GWxAs
 4vbUEADDwBtu3eCQtJYERUFeVWZ0I9XyoMfTHnqewzpop4wPVpqHi9SUkjLtqPdbosEPiivbXSK
 /5nMC6ZdPCQOoYLF131JbsCtrNOcAbVNPI9C2gjiLlhaJAybfGPPxjmuyCb0k/APbkwLW48RsDu
 Qty7VD6JUGTXHNB2jjR6pABMfLwlF+BaihSRnN/DcwvAa/BiVSTVKg6NnHO7fTXv69/r6Cor9VV
 YPyf4X1efjZw8vxMHmuC90mzaHQkFe7jqYhsvbdhcqK0700PDn+A2H9tQPqIbpZGb4N7ydZztiN
 bPHBpfZA2D3/vhqQ1dAk89uqkuAvWe+22y4HMxrKJZwnlByXh3i5dwrFEC9sDQcVqjBb0AuFNUy
 s0ExeZnG42x/NA18BSXdxRPieYm49TPvedrmc6tDkB06G2/gKadSw9wrlDGBDRX9RaIAQ1t9C++
 KZeeCK8d+U630VUhxnEdben9OUCkdtCom0HAPoizsLLjJZEogT6LlzpgRDSXuGK8r2cf/kek/+N
 CFnjjtUc+AuNd5K5NC/OMPIJd4UHnfvLkjh4l7giW4VdvXnAiGMHz6IilE6ysU79e12UJ5yHUQM
 qu2kJq+mRm6IxDLruUpWbVKCfWbZPAp7RF7fUiGxxLIZP++YqDKltVih+dc5S+bLOA9udUJ0afu
 lHPrOK+fr8f4XPw==
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

A connector can't be identified by a name, so add a configfs file to
retrieve its id.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 09d9ac3cb3e25e980473686b7b0d2e66e78cf163..76f28862c7652fbd9e84c42b60ad818ddee1485b 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -814,12 +814,31 @@ static ssize_t connector_status_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t connector_id_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_device *vkms_configfs =
+		connector_child_item_to_vkms_configfs_device(item);
+	struct vkms_config_connector *connector;
+
+	scoped_guard(mutex, &vkms_configfs->lock)
+	{
+		connector = connector_item_to_vkms_configfs_connector(item)->vkms_config_connector;
+		if (vkms_configfs->enabled)
+			return sprintf(page, "%d\n",
+				       connector->connector->base.id);
+		return -EINVAL;
+	}
+	return -EINVAL;
+}
+
 CONFIGFS_ATTR(connector_, type);
 CONFIGFS_ATTR(connector_, status);
+CONFIGFS_ATTR_RO(connector_, id);
 
 static struct configfs_attribute *connector_attrs[] = {
 	&connector_attr_type,
 	&connector_attr_status,
+	&connector_attr_id,
 	NULL,
 };
 

-- 
2.47.1

