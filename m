Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFF3A7B0FC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 23:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231BD10EB7A;
	Thu,  3 Apr 2025 21:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VYSauRbS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B6310EB7C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 21:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743715558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ZefKouxdk2s2Ql6IByovuwIIKwtbooPP2gBa2Hj9jU=;
 b=VYSauRbSXewR1lHaBQBNe7Du0Gynu5IsVzBwdkZSv2fycCFnQE8oBBO+wThqZ7oGBe0nCP
 0esq5utdjjU6/vnoSpYVF73wylPzKjIbNBarIhTRs7eZ7x1w2JKALVn1MA6bGi3rRjjNtU
 /7Sq0McV9j5WOndvn6UcEpSXaTkVeh8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-rE8bwvX_NNG36MZnvfJCbA-1; Thu,
 03 Apr 2025 17:25:53 -0400
X-MC-Unique: rE8bwvX_NNG36MZnvfJCbA-1
X-Mimecast-MFC-AGG-ID: rE8bwvX_NNG36MZnvfJCbA_1743715550
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AD085180AB16; Thu,  3 Apr 2025 21:25:50 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 67496180A803; Thu,  3 Apr 2025 21:25:46 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:21:16 -0400
Subject: [PATCH 45/46] panel/panel-lvds: Use refcounted allocation in place
 of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-45-965b15ad5b8e@redhat.com>
References: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-0-965b15ad5b8e@redhat.com>
In-Reply-To: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-0-965b15ad5b8e@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Chiras <robert.chiras@nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Artur Weber <aweber.kernel@gmail.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1268;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=RwAD8zHoXh9imZAn0XpyAjhqKL5F3ms/GsD2bDW/UBs=;
 b=Cb+/GlG9jXKEcnvoMxboMijoXXfoIwm4Lyvy+S37K/BL2VKcFcJvj8VOChDr3+NaMOoaapqSW
 tCchboCYuV2DteCGY4kdmN212loyk2iZJczGpG7Lxcb1dU1NpG9wi90
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
 drivers/gpu/drm/panel/panel-lvds.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index ba6c015aabba9e03a37058e0fcf7cb39d1595d70..23fd535d8f479045a87b0f51bec17cd7c66b0f75 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -164,9 +164,11 @@ static int panel_lvds_probe(struct platform_device *pdev)
 	struct panel_lvds *lvds;
 	int ret;
 
-	lvds = devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
-	if (!lvds)
-		return -ENOMEM;
+	lvds = devm_drm_panel_alloc(&pdev->dev, struct panel_lvds, panel,
+				    &panel_lvds_funcs,
+				    DRM_MODE_CONNECTOR_LVDS);
+	if (IS_ERR(lvds))
+		return PTR_ERR(lvds);
 
 	lvds->dev = &pdev->dev;
 
@@ -214,10 +216,6 @@ static int panel_lvds_probe(struct platform_device *pdev)
 	 * driver.
 	 */
 
-	/* Register the panel. */
-	drm_panel_init(&lvds->panel, lvds->dev, &panel_lvds_funcs,
-		       DRM_MODE_CONNECTOR_LVDS);
-
 	ret = drm_panel_of_backlight(&lvds->panel);
 	if (ret)
 		return ret;

-- 
2.48.1

