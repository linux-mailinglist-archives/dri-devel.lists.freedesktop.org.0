Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84059ABEAAC
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 06:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E632710E66E;
	Wed, 21 May 2025 04:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XUAWKDCH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C8110E66E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 04:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747800649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TW79Jh3KwNC+QuZ9kgw4Yun1XkHovUCnzGtnp9Oh6wM=;
 b=XUAWKDCHmrcRWp15v/6EMNTFNj0vgvfEg4UFJKMfx7BMaeukJtIGNcOk7BBjwfbhPfb2k8
 sEcxJT4SlINBotbpNhBHWdo9aDxbNFimJYme9NtfX4aE0JBzTG6itRltrCStkhLixRZZjq
 TAGYHvljSn6Gtm5XolCDd1c9F6de5ro=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-638-NJxqDD-lOjGiyC2BOBBwuA-1; Wed,
 21 May 2025 00:10:45 -0400
X-MC-Unique: NJxqDD-lOjGiyC2BOBBwuA-1
X-Mimecast-MFC-AGG-ID: NJxqDD-lOjGiyC2BOBBwuA_1747800643
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E30921800446; Wed, 21 May 2025 04:10:42 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.184])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6BBCD1956095; Wed, 21 May 2025 04:10:37 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 20 May 2025 22:03:48 -0500
Subject: [PATCH v3 17/30] panel/lg-lg4573: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-drivers-mass-convert-part2-v3-17-f7ae7b723c68@redhat.com>
References: <20250520-drivers-mass-convert-part2-v3-0-f7ae7b723c68@redhat.com>
In-Reply-To: <20250520-drivers-mass-convert-part2-v3-0-f7ae7b723c68@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, 
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Michael Walle <mwalle@kernel.org>, Jagan Teki <jagan@edgeble.ai>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Jianhua Lu <lujianhua000@gmail.com>, Stefan Mavrodiev <stefan@olimex.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747796667; l=1268;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=AhVr1/6J9D1jWS1zGNGnwXsG4VGES5b8ge+DGWp2RrI=;
 b=M7tBMYqtfP4SkadqsQEZutrnu5I5mMCx4HMwvaJqtJFuun5bWZKqH37cacoSqArsRVsKaKy31
 O33aMTEj7g1DdXLPUUGg3gBzfT7wts09dj1tpMr72adMymBb+h1S5Rp
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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
v3: none.
v2: none.
---
 drivers/gpu/drm/panel/panel-lg-lg4573.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-lg4573.c b/drivers/gpu/drm/panel/panel-lg-lg4573.c
index cf246d15b7b628a0b3821bfb2697842b6e484319..dec619902c15f8fbfdd138ef3bd2aa7cae921375 100644
--- a/drivers/gpu/drm/panel/panel-lg-lg4573.c
+++ b/drivers/gpu/drm/panel/panel-lg-lg4573.c
@@ -243,9 +243,11 @@ static int lg4573_probe(struct spi_device *spi)
 	struct lg4573 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(&spi->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(&spi->dev, struct lg4573, panel,
+				   &lg4573_drm_funcs,
+				   DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->spi = spi;
 
@@ -258,9 +260,6 @@ static int lg4573_probe(struct spi_device *spi)
 		return ret;
 	}
 
-	drm_panel_init(&ctx->panel, &spi->dev, &lg4573_drm_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	drm_panel_add(&ctx->panel);
 
 	return 0;

-- 
2.48.1

