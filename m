Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F74A7810E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 19:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D0610E631;
	Tue,  1 Apr 2025 17:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Dz52bJ8A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CAB10E630
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 17:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743527147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BHX+3yqeMKPpAXIntW1GU/ef/CqzXQ3nBZkiDoHj/KE=;
 b=Dz52bJ8AsyzLJOpMmUajm7iJyg9tjTsBo3rzueQ5ERrJgp/QDeKENFJth5+XuN/3bGo4AN
 xWep+soonNcfPqKwVOEusjo1t0CP5iRjbvEREgLPb+gGbe/iupC7HD024eMgEu3Sabvj3w
 YMHF6a58V5illUn//CM9Zvs3lIm6DSY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-Ru7ijFl-NfShNc40GJyc3w-1; Tue,
 01 Apr 2025 13:05:44 -0400
X-MC-Unique: Ru7ijFl-NfShNc40GJyc3w-1
X-Mimecast-MFC-AGG-ID: Ru7ijFl-NfShNc40GJyc3w_1743527142
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0BD1F19560B3; Tue,  1 Apr 2025 17:05:42 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9504A180B492; Tue,  1 Apr 2025 17:05:39 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 01 Apr 2025 12:03:52 -0400
Subject: [PATCH 09/10] panel/ebbg-ft8719: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-b4-drm-panel-mass-driver-convert-v1-9-cdd7615e1f93@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743523429; l=1466;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=rzO1AuFXRSgcgeIKDm0iaxEhQBnNbaUXv9QevkGsp74=;
 b=+yVl0L5Bu/w954rRUCyMNxFEuYQRqblrb4Jcg39V0IBmT84DDkS0zrsUXJN8ftHcNAtRHYX9W
 hb4MEPjo5nQCEC5mHKxhsLt6rA2IhMKTTud4gk+E7ygx1EIJOJxyVJH
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
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
index 0bfed0ec0bbcef79c767db05846a3e3da56e82ad..fb9f9f42be4f26e75d4481742d8d1c81ea7095d1 100644
--- a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
+++ b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
@@ -163,9 +163,11 @@ static int ebbg_ft8719_probe(struct mipi_dsi_device *dsi)
 	struct ebbg_ft8719 *ctx;
 	int i, ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct ebbg_ft8719, panel,
+				   &ebbg_ft8719_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++)
 		ctx->supplies[i].supply = regulator_names[i];
@@ -196,9 +198,6 @@ static int ebbg_ft8719_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
-	drm_panel_init(&ctx->panel, dev, &ebbg_ft8719_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");

-- 
2.48.1

