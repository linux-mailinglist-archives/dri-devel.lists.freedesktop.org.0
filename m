Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7E2B01245
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 06:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF0010E99F;
	Fri, 11 Jul 2025 04:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bP9XWHKE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338F010E9A1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 04:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752208387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ASpOxMdhH1Ni6FA6cOiOM+xnxokYtM9/grNQla7mZ4=;
 b=bP9XWHKECFntcI6bBjlvNMeH9gmKZqZWNVDE5lfYp9ftVg8d1TrJ7NB4cMA3F9v1AXnZdn
 XlNBPz9QytvtZvc+w+WVmJZbOOzbUcQQZIns2UUXJNLjwTmbDH0mxQVzNEapyjO2KGaZ4F
 6e624AdxEgM7I7b3At+exIfiuBpTwBo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-99-0afFhi0sNVKFQBd9kZ0sUQ-1; Fri,
 11 Jul 2025 00:33:02 -0400
X-MC-Unique: 0afFhi0sNVKFQBd9kZ0sUQ-1
X-Mimecast-MFC-AGG-ID: 0afFhi0sNVKFQBd9kZ0sUQ_1752208380
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 98CF418089B4; Fri, 11 Jul 2025 04:33:00 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.240])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 818CE180045B; Fri, 11 Jul 2025 04:32:57 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 10 Jul 2025 23:31:21 -0500
Subject: [PATCH 10/14] drm/panel/lpm102a188a: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-b4-driver-convert-last-part-july-v1-10-de73ba81b2f5@redhat.com>
References: <20250710-b4-driver-convert-last-part-july-v1-0-de73ba81b2f5@redhat.com>
In-Reply-To: <20250710-b4-driver-convert-last-part-july-v1-0-de73ba81b2f5@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752208280; l=1518;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=76yWT/SXjPcOqdfDoug/udmadP1Sboehs0wZbeLGz0I=;
 b=CQH52r9at6hFa1Ymf8GJHoUDHfBxW7YTCZJGYAmSh6pqT6Q+ZQB3zYIxMmVhn63/Z8u5Zik6u
 XP2rofWeeouCEuvIMkofaRsIK4J8YECn/v8jJIHDz+9k8N2ynZA3brP
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
panel. In the call to the new API, avoid using explicit type and use
__typeof() for more type safety.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
index 5b5082efb282bcf705cf2d38dea24901e9803648..5f897e143758c2be51c39a20eeda2ecd09e1fbee 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
@@ -435,9 +435,6 @@ static int jdi_panel_add(struct jdi_panel *jdi)
 		return dev_err_probe(dev, PTR_ERR(jdi->backlight),
 				     "failed to create backlight\n");
 
-	drm_panel_init(&jdi->base, &jdi->link1->dev, &jdi_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	drm_panel_add(&jdi->base);
 
 	return 0;
@@ -475,10 +472,13 @@ static int jdi_panel_dsi_probe(struct mipi_dsi_device *dsi)
 
 	/* register a panel for only the DSI-LINK1 interface */
 	if (secondary) {
-		jdi = devm_kzalloc(&dsi->dev, sizeof(*jdi), GFP_KERNEL);
-		if (!jdi) {
+		jdi = devm_drm_panel_alloc(&dsi->dev, __typeof(*jdi),
+					   base, &jdi_panel_funcs,
+					   DRM_MODE_CONNECTOR_DSI);
+
+		if (IS_ERR(jdi)) {
 			put_device(&secondary->dev);
-			return -ENOMEM;
+			return PTR_ERR(jdi);
 		}
 
 		mipi_dsi_set_drvdata(dsi, jdi);

-- 
2.48.1

