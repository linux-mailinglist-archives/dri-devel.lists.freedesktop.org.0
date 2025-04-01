Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66846A78109
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 19:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3984510E62C;
	Tue,  1 Apr 2025 17:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BmnNNjuR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A57410E62D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 17:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743527137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dbOko1i5Djwa/7oAwM/HgeHYZ+TPRLMxpGP21lRFZHU=;
 b=BmnNNjuRZLL788Y1BEvv9BsiVpFe9KDRcoeYMachgO/lhUWSQrUxWmcn//8ylo0QPHQodN
 sFaUMF4QgoKSegAgQXv2JeFGOBUsm1UCbpQHdBuPXngDhU6P5lpnGtmlXzvlihznvAVIzA
 ZhcQKmlBgQdgTzdKodKKNfsOFTgHFwc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-92-OEljgcvPPtK0FnKmVmCkSA-1; Tue,
 01 Apr 2025 13:05:35 -0400
X-MC-Unique: OEljgcvPPtK0FnKmVmCkSA-1
X-Mimecast-MFC-AGG-ID: OEljgcvPPtK0FnKmVmCkSA_1743527134
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BEF6918004A9; Tue,  1 Apr 2025 17:05:33 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E83C8180B487; Tue,  1 Apr 2025 17:05:30 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 01 Apr 2025 12:03:49 -0400
Subject: [PATCH 06/10] panel/th101mb31ig002-28a: Use refcounted allocation
 in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-b4-drm-panel-mass-driver-convert-v1-6-cdd7615e1f93@redhat.com>
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
In-Reply-To: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, Joel Selvaraj <jo@jsfamily.in>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743523429; l=1448;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=3A6rEhPpNi9ipO+apTpL1dxwKTytpp7SPV9JlxiG0gg=;
 b=eiJFXCSxlZCKggM1JaZdRbz5Vp2c337BAIll29x2NLJNkyoYh0Ds/Nbbd6+0wZGfe6pXI46Lg
 fBWghLmznRNAKO2HcNINwoyv34QmQz6WlvOPMwc0i0Ky1KJME9EnRQ/
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

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
index 0b87f1e6ecaea71f10a249bdc53466d281f07a34..7ae196424b6dfb731cd1ea48363c4fa1e6c36464 100644
--- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
+++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
@@ -349,9 +349,11 @@ static int boe_th101mb31ig002_dsi_probe(struct mipi_dsi_device *dsi)
 	const struct panel_desc *desc;
 	int ret;
 
-	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	panel = devm_drm_panel_alloc(dev, struct panel_desc, panel,
+				     &boe_th101mb31ig002_funcs,
+				     DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
 
 	mipi_dsi_set_drvdata(dsi, ctx);
 	ctx->dsi = dsi;
@@ -383,9 +385,6 @@ static int boe_th101mb31ig002_dsi_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(&dsi->dev, ret,
 				     "Failed to get orientation\n");
 
-	drm_panel_init(&ctx->panel, &dsi->dev, &boe_th101mb31ig002_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
 		return ret;

-- 
2.48.1

