Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1124E7BF004
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 03:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CDD10E1AB;
	Tue, 10 Oct 2023 01:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.197])
 by gabe.freedesktop.org (Postfix) with ESMTP id C715010E1AB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 01:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=FzHLQ
 KCQCe9j9DqxYPIrCIskpk0ziqCortfqEhdrsn0=; b=hnY+GRDmZiXvlbgt7IdZv
 e7z61Bu1PYgBILbTajmgX5RoIYXhO0YFcf6+0SgxFHO27jv9N/F06paaQJq/0vK7
 rydcB75Im6mGLr/qwWoWIQnQ6evqx9zSaWMmODGkGYrVY2wBqoCwVHtNmdmmUT7E
 hTzW+niHtxDe7WYhqgfuCw=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
 by zwqz-smtp-mta-g3-4 (Coremail) with SMTP id _____wDnj20EoiRlFh6DAA--.58085S4;
 Tue, 10 Oct 2023 08:59:56 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com,
 tzimmermann@suse.de, lyude@redhat.com, noralf@tronnes.org,
 u.kleine-koenig@pengutronix.de, mripard@kernel.org, make_ruc2021@163.com
Subject: [PATCH v2] drm/i2c/ch7006: fix a possible null pointer dereference
Date: Tue, 10 Oct 2023 08:59:47 +0800
Message-Id: <20231010005947.4057756-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnj20EoiRlFh6DAA--.58085S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr4rAr1fWF17WF48tr1DJrb_yoW8JFWUpF
 ZrG34YyFW8JF97uF18Ja4avF15G3W7JF1I9w40van3C3Zayryqqr13Xry3GryfAFyaqF12
 q3sxZF1xWF12yr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziCPfPUUUUU=
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/xtbBFRwEC2B9ocN2nAABsS
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In ch7006_encoder_get_modes(), the return value of drm_mode_duplicate()
is assigned to mode, which will lead to a NULL pointer dereference
on failure of drm_mode_duplicate(). Add a check to avoid npd.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 drivers/gpu/drm/i2c/ch7006_drv.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
index 131512a5f3bd..619f626c8371 100644
--- a/drivers/gpu/drm/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -229,6 +229,7 @@ static int ch7006_encoder_get_modes(struct drm_encoder *encoder,
 {
 	struct ch7006_priv *priv = to_ch7006_priv(encoder);
 	const struct ch7006_mode *mode;
+	struct drm_display_mode *encoder_mode;
 	int n = 0;
 
 	for (mode = ch7006_modes; mode->mode.clock; mode++) {
@@ -236,8 +237,10 @@ static int ch7006_encoder_get_modes(struct drm_encoder *encoder,
 		    ~mode->valid_norms & 1<<priv->norm)
 			continue;
 
-		drm_mode_probed_add(connector,
-				drm_mode_duplicate(encoder->dev, &mode->mode));
+		encoder_mode = drm_mode_duplicate(encoder->dev, &mode->mode);
+		if (!encoder_mode)
+			continue;
+		drm_mode_probed_add(connector, encoder_mode);
 
 		n++;
 	}
-- 
2.37.2

