Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA856A7810B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 19:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F6710E62E;
	Tue,  1 Apr 2025 17:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WkhsX17H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D33010E62E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 17:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743527140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CLUstK61xAXM/gs96bsAOZILqsnCQXzSXUukxAi+2lc=;
 b=WkhsX17HAMMbLYDyjAzu8fjsgEvgJjlorLfIlGuLdjrXsA26pyHlLQBFDuSw8HNdgk6hRF
 LFJEiSJ7lWuR/s+lru9goRiJJ4U/yhUuXLS95V7J6wvfcKUXJ3bYWgMmbIfRRwGLo2Ik5o
 i0r4nP2E+W1nLUpsKlauVppN4iGC3Lw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-CwVWGLadNEa5trB-SijpAw-1; Tue,
 01 Apr 2025 13:05:39 -0400
X-MC-Unique: CwVWGLadNEa5trB-SijpAw-1
X-Mimecast-MFC-AGG-ID: CwVWGLadNEa5trB-SijpAw_1743527136
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6DE7D19560B6; Tue,  1 Apr 2025 17:05:36 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EF0171828A80; Tue,  1 Apr 2025 17:05:33 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 01 Apr 2025 12:03:50 -0400
Subject: [PATCH 07/10] panel/boe-tv101wum-ll2: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-b4-drm-panel-mass-driver-convert-v1-7-cdd7615e1f93@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743523429; l=1472;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=Xzn2wN1O+Drv+RLLltDt9Nl2qRP7FbO46Im5Ji+jRFs=;
 b=qCOpMXB+Q5SsvMpJ7k+WgQX+/FGhc3kgX2dRC14aRN7ThcH0LKYbppz6FXumPi7BNia+ICqQf
 S7uSB28GUyNAUgY4ypEBT7SRqFZht9XZ1dGNkcXNkHRkzWmTMDkpuYT
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
 drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c
index 50e4a5341bc65727b5ed6ba43a11f5ab9ac9f5b9..04c7890cc51db43bdc6e38cdae8f7f21fd48009f 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c
@@ -166,9 +166,11 @@ static int boe_tv101wum_ll2_probe(struct mipi_dsi_device *dsi)
 	struct boe_tv101wum_ll2 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct boe_tv101wum_ll2, panel,
+				   &boe_tv101wum_ll2_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
 
 	ret = devm_regulator_bulk_get_const(&dsi->dev,
 					ARRAY_SIZE(boe_tv101wum_ll2_supplies),
@@ -190,8 +192,6 @@ static int boe_tv101wum_ll2_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_MODE_VIDEO_HSE;
 
-	drm_panel_init(&ctx->panel, dev, &boe_tv101wum_ll2_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
 	ret = drm_panel_of_backlight(&ctx->panel);

-- 
2.48.1

