Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153F9ABEA9D
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 06:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AEF10E623;
	Wed, 21 May 2025 04:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LvlwVEKO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B4610E5D5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 04:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747800588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UTPVsnbjSOjTovSZMWoHigUam2q1Qy5eT/mmkcQBsZ0=;
 b=LvlwVEKOAwDHN+7wd6HmvFoFdOjm/xRofIuRlLkq956F6rox+g5FiRMJLnqNUGJNBJgQmU
 sj59QyJNlNMWaxWbDS81h3/wfqM7XCaPzjRWkczMmvzu1icVAbNsn+ovTewhJXHkhYxNKy
 XxI5SudNULnZEOVNiXlfvPXpfsStjIM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-2OkxguWsM8GIJG3tBb0XlA-1; Wed,
 21 May 2025 00:09:43 -0400
X-MC-Unique: 2OkxguWsM8GIJG3tBb0XlA-1
X-Mimecast-MFC-AGG-ID: 2OkxguWsM8GIJG3tBb0XlA_1747800581
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0462D180048E; Wed, 21 May 2025 04:09:41 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.184])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1BB1B195608F; Wed, 21 May 2025 04:09:34 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 20 May 2025 22:03:38 -0500
Subject: [PATCH v3 07/30] panel/ilitek-ili9341: Use refcounted allocation
 in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-drivers-mass-convert-part2-v3-7-f7ae7b723c68@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747796667; l=1427;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=0fJK8sZO/M/aw8fddBJTupShEp49HcVnV0hGAZbmby4=;
 b=hrtTIT0CjDk5scpXkVgDcRijni5VzlJE3wudF2NwmSMIxQDWSXtDo622ivfwQH6lGCnnOdQ5Y
 hfNMpKyWU+DATPV/5tIDZGciqIovixWE7DXeWpXexKy6VNW9AmHXIJB
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
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index ff39f5dd4097e8da0a0e16c50c5bfd45c078d91c..bcd561e06465444440e0a5d143219c06e2121218 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -490,9 +490,11 @@ static int ili9341_dpi_probe(struct spi_device *spi, struct gpio_desc *dc,
 	struct ili9341 *ili;
 	int ret;
 
-	ili = devm_kzalloc(dev, sizeof(struct ili9341), GFP_KERNEL);
-	if (!ili)
-		return -ENOMEM;
+	ili = devm_drm_panel_alloc(dev, struct ili9341, panel,
+				   &ili9341_dpi_funcs,
+				   DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(ili))
+		return PTR_ERR(ili);
 
 	ili->dbi = devm_kzalloc(dev, sizeof(struct mipi_dbi),
 				GFP_KERNEL);
@@ -526,8 +528,6 @@ static int ili9341_dpi_probe(struct spi_device *spi, struct gpio_desc *dc,
 	}
 
 	ili->max_spi_speed = ili->conf->max_spi_speed;
-	drm_panel_init(&ili->panel, dev, &ili9341_dpi_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
 	drm_panel_add(&ili->panel);
 
 	return 0;

-- 
2.48.1

