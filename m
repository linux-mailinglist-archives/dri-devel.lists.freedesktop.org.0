Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3A1A7B0E8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 23:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA1510EB75;
	Thu,  3 Apr 2025 21:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZpQUZfOT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C0C10EB72
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 21:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743715514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oZogQhu6L1XhZkbvs0tNuQg2uimzHUPkU3Z9auuq3EM=;
 b=ZpQUZfOTlqsj/pbxP0KdLUsqGUJnaaI1ICipkE6kHcle53r2djslyZwVNnBN6M+yJ1tOis
 /UX5j0meQGCkbrR8SC8SEVYpFBwEiHOEJ5ShL4d9Vuz4FNPIi/CwYQMws7HhvvxZtmuv1J
 pXPZSRvZOROA7lZEAKXc0w1M+866sCE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-253-xOUKERzDMGumsLjLuqsv5g-1; Thu,
 03 Apr 2025 17:25:11 -0400
X-MC-Unique: xOUKERzDMGumsLjLuqsv5g-1
X-Mimecast-MFC-AGG-ID: xOUKERzDMGumsLjLuqsv5g_1743715509
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F00C71800EC5; Thu,  3 Apr 2025 21:25:08 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A5B1A180A803; Thu,  3 Apr 2025 21:25:04 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:21:07 -0400
Subject: [PATCH 36/46] panel/tpo-tpg110: Use refcounted allocation in place
 of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-36-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1256;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=0/kXhDAduzOSSgTL+4Zi3+Km7r2/W7VB8G2TxN8OZo4=;
 b=/+zSXqIQwuMsfQCYR1gmY4Ew+e7nuP8k91qd5elC6ommAtALz7vQ1422Q/TajcBwVflSiCp+W
 zs2v2JlrALHCSq1/Hptk9MWIG5OWAWY+N+itEtVqwQ5+SAZAehkfy8J
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
 drivers/gpu/drm/panel/panel-tpo-tpg110.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-tpo-tpg110.c b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
index f6a212e542cb9301cab1ad19c43e00e4ea07b128..0beba5c08956571aee5c253e460a9d020b800009 100644
--- a/drivers/gpu/drm/panel/panel-tpo-tpg110.c
+++ b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
@@ -405,9 +405,11 @@ static int tpg110_probe(struct spi_device *spi)
 	struct tpg110 *tpg;
 	int ret;
 
-	tpg = devm_kzalloc(dev, sizeof(*tpg), GFP_KERNEL);
-	if (!tpg)
-		return -ENOMEM;
+	tpg = devm_drm_panel_alloc(dev, struct tpg110, panel,
+				   &tpg110_drm_funcs, DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(tpg))
+		return PTR_ERR(tpg);
+
 	tpg->dev = dev;
 
 	/* We get the physical display dimensions from the DT */
@@ -438,9 +440,6 @@ static int tpg110_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
-	drm_panel_init(&tpg->panel, dev, &tpg110_drm_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	ret = drm_panel_of_backlight(&tpg->panel);
 	if (ret)
 		return ret;

-- 
2.48.1

