Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED316A7A61F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 17:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E88110EA19;
	Thu,  3 Apr 2025 15:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xl064cle";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A448210EA19
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 15:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743693503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4YtI7Km9VBvu4HgQrCUx8dvhsghxh/J2EXv9TMkg96A=;
 b=Xl064cle2G5lhGSmjK7bfDryxudBn6NQb52ejjjdqaF7D0CXGv3KB5Q9YUuKROuh8qyzKc
 f2bjegbReONPfsONGp3HbdJA/cx3s0GD9KWcAZlxHrnJPRYUHZ7fpSQP/m8Oubx45OiZwf
 H1Pu2hNV+82uDOe6tIG3rXnNYFtuXKc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-340-MZD_15DbPNuzpPmZbfOFOQ-1; Thu,
 03 Apr 2025 11:18:20 -0400
X-MC-Unique: MZD_15DbPNuzpPmZbfOFOQ-1
X-Mimecast-MFC-AGG-ID: MZD_15DbPNuzpPmZbfOFOQ_1743693498
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 225F61956053; Thu,  3 Apr 2025 15:18:18 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D651A1801752; Thu,  3 Apr 2025 15:18:13 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 10:16:14 -0400
Subject: [PATCH v2 07/30] panel/ilitek-ili9341: Use refcounted allocation
 in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_convert_part2-v2-7-260c8a44c56b@redhat.com>
References: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
In-Reply-To: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743689775; l=1448;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=A9bzGrCEuaETUaYsFZMAVKRZzaxpNSaaYvX8YFVJT1A=;
 b=gJeYyeNzx1I2KiCR3UkyaKESPE7M6fLnAXD2vquOiVq82Cf1UrzmmGRsH89L0HBjVLM2MK2QS
 d4PafdlFYTgCSBuyK4Z1ZxVzDKcLowrCs7bpesctq0LcvkCjgT3Wi7R
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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
v2: Remove drm_panel_init() from the probe. It is taken care of in the
new helper.(Ondrej Jirman)
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

