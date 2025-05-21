Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8049BABEAA4
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 06:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE8610E637;
	Wed, 21 May 2025 04:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="B0KLN17t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B68710E63E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 04:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747800618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o+3Zjug7oTkJfbWcS0iuVVo0Ze0IMq05kgV8N81sqg4=;
 b=B0KLN17tDuMv/pFNNQ9jWbTS0d38M37XVNGlE0pMJ5wdChyb5nrD8qk8xQ0ALNr0vo+cec
 7hV3nkM3J8+k9sdakhyqftX6F3CpJD/lgyEKfLaFSGy9me730A9w2b37imk4KaDIk/SBc0
 xtbEgRN2siJK6+Pf5JQqJubaDZyt6c8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-638-1InNf8vhOoGhrrBDO5Yvdw-1; Wed,
 21 May 2025 00:10:14 -0400
X-MC-Unique: 1InNf8vhOoGhrrBDO5Yvdw-1
X-Mimecast-MFC-AGG-ID: 1InNf8vhOoGhrrBDO5Yvdw_1747800612
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 57BBC195608A; Wed, 21 May 2025 04:10:12 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.184])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7E8D2195608F; Wed, 21 May 2025 04:10:06 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 20 May 2025 22:03:43 -0500
Subject: [PATCH v3 12/30] panel/innolux-p079zca: Use refcounted allocation
 in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-drivers-mass-convert-part2-v3-12-f7ae7b723c68@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747796667; l=1415;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=GOgjlncNc6TFQSkDmYJCSIvrF5uq0WIGPfIMxI1wRzo=;
 b=g6LQe+BghuahCuV0hNfRywkVgz87nJW9b5UWo6HU3tqa8EiOg/lpCxtBEXh6g0tPBsMibfgh+
 L6lTmmXGCbaBGTXynfEwFQuxnAcTPbYKeUtNSQO5HwgLYpiD4zhr8e8
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
 drivers/gpu/drm/panel/panel-innolux-p079zca.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
index d95c0d4f3e3534d70901864fa9ed0fff8f37d236..80afeeab9475fa13ddadb44cd03a1519d448e24e 100644
--- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
+++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
@@ -382,9 +382,11 @@ static int innolux_panel_add(struct mipi_dsi_device *dsi,
 	struct device *dev = &dsi->dev;
 	int err, i;
 
-	innolux = devm_kzalloc(dev, sizeof(*innolux), GFP_KERNEL);
-	if (!innolux)
-		return -ENOMEM;
+	innolux = devm_drm_panel_alloc(dev, struct innolux_panel, base,
+				       &innolux_panel_funcs,
+				       DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(innolux))
+		return PTR_ERR(innolux);
 
 	innolux->desc = desc;
 
@@ -410,9 +412,6 @@ static int innolux_panel_add(struct mipi_dsi_device *dsi,
 		innolux->enable_gpio = NULL;
 	}
 
-	drm_panel_init(&innolux->base, dev, &innolux_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	err = drm_panel_of_backlight(&innolux->base);
 	if (err)
 		return err;

-- 
2.48.1

