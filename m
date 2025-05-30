Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A38AC86A3
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 04:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6966110E7B6;
	Fri, 30 May 2025 02:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Q5vRaPDz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2969A10E7B7
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 02:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748573633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZIQ7E466bXnslXSEUgJ5DD5EHDB1GW1m+jviSQ7lLg=;
 b=Q5vRaPDztcbtQFsOaVLQkf0+QubP7Jb0/3w6AeDf22wCjA1gHzPAjgT3S7dsB6CpLJqv08
 aqF+shw7yW8896qwkKuGF2KMV3zCARTlre5hi7HxgyK2ytDPAgeJAHzAblH3V275aRLbJQ
 LfnXMGG9ChjNLDz6R2UGe9yfiHEIoig=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-150-SvqrCgbLOFOdD7cWgLqzVQ-1; Thu,
 29 May 2025 22:53:51 -0400
X-MC-Unique: SvqrCgbLOFOdD7cWgLqzVQ-1
X-Mimecast-MFC-AGG-ID: SvqrCgbLOFOdD7cWgLqzVQ_1748573628
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AA65A1956094; Fri, 30 May 2025 02:53:48 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4DF151955D82; Fri, 30 May 2025 02:53:44 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:47 -0500
Subject: [PATCH v2 45/46] panel/panel-lvds: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-45-5d75a3711e40@redhat.com>
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1341;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=k6xcBrcjqleZnQdzDWNa+H5TX2zZYm4KLejiUJ3CeHU=;
 b=SY9Mh+vQcoTUhXwIh3Gti5CFO6tD/B+DWrq2Flu1UAsxVU0AWqpjDKKowb0dV9PMKd5Ic434A
 LcCJnfQXw8IAWcY6rsx1stnw9n/JTuVgIZccPYmLCZKoyEW8aoVipwS
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: none.
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

