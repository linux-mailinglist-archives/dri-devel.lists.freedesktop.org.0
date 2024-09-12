Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C01EF976A74
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235F010EB76;
	Thu, 12 Sep 2024 13:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XOL+xtlq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D4A10EB76
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:25:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5DC640004;
 Thu, 12 Sep 2024 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1726147521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GpsUVuEinW8EH03g2sq6CYyNt8DLqEZWlJ6lw4FIIPs=;
 b=XOL+xtlq+3fW3c90nkqTHAkDg05uAloEPpZwAvKKEXlPviuxzF74NJUPA7KqceRTJ8orz5
 eu6zmn/EPORKMPNt8N0VDKfeVMntOnw/1Qi+vzzlRN2lQ2FL7HUtLrEW0ienFElTH9VXxy
 +7yAhf+rdVSvRMYaDVf0MxC7N4b4DpH3HxZkIs7H0/0tkK2yX2P/bzMEoiO45u1j/qC4+q
 UyDkiDDOymUszEzzVjwWf5EF5IHXvBEnpAJTbLAe71pt1wtnS15yJx6jRIgNLae0Bup705
 Lsb1nDZevhVTacGn3xoL9tAtAP6092NZXGkJWuM0H0DVrPMyjT61RslXtGZxFQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 12 Sep 2024 15:25:17 +0200
Subject: [PATCH v3 4/4] drm/vkms: Switch to managed for writeback connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-google-vkms-managed-v3-4-7708d6ad262d@bootlin.com>
References: <20240912-google-vkms-managed-v3-0-7708d6ad262d@bootlin.com>
In-Reply-To: <20240912-google-vkms-managed-v3-0-7708d6ad262d@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1671;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=HqLDT2kDdULA6wIcAVsiwZrhSN52t305f8ag1ydTtms=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBm4uu8HmEzwmBUqDedxhCpcmLkeGIsQmnbc78CJ
 gD1o3ASgxGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZuLrvAAKCRAgrS7GWxAs
 4hOUEADPaf75OVqrMBKKKcdS+p3NTt7BeEqESVcTeUu2oeqy6UA04saIrLTEYeepHPof/5s/OEt
 8km3IzxHuXgab7DlPzD+2etQSepvFoYz6KQ6evbM3QsGP5QBeGctSDqH//MwFxJvLQ5NUDT9glT
 HVKes/lvoTu3U+HPEsAi0WfYmG+5jA2AoRFeDiXdpwPsD5t/Ed9ei18q2Rj3Xyt44CqUFxqgbVo
 8kUNfAvX5u/Xp8I8fT7PfUJrT2lOb8IoPAkmo2meR2jzk+9doaFsRAW6nCmxSzNx5gqzaHbHwKk
 RaIFbmnhH7O38wksRjHod0Lti35fVeQkMYXyUq/AG/prQe4sgwijieXBU0szRcKIr6VJy7gXzxv
 29k9em18r3gEjMMTlBXIA4bSBuXHTwjVwBPy74DjPIWbcFFdUoPWeGSYPbVQ4p6oLtOFpH9Oh0a
 TZUhTNLEgzLt1jphWgglWgA3VGY87jkSwWqSA7kSb2OfLFvur7cdyC4tXQ8An20QEUXwuasaUMw
 8OCShttF8LHm+7YmvVXZdPDgKxquDxKWI3QyQb/FQes22v6wtf9Ay6GG+xC9o1k26CLIPZ2k8A2
 Cbtl6CX4Qly7E5wzw1dwuWkff2ttkYPhEMl90KD5L8F1kDFeoT1tcqiK2FnSCTfNVdE9rnNtmia
 hVQAp2sKRM1K5Iw==
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
index bc724cbd5e3a79705bdc091a7a13430f67ecf65f..a948f4598764efef971f76e1016fc1a963fbbba7 100644
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
2.44.2

