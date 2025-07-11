Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A9FB01248
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 06:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB9110E9A3;
	Fri, 11 Jul 2025 04:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JuHGGOpE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8233910E9A4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 04:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752208397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GWTeR8/c8og1zZivLTfFMs4guLGelLhrLnAKtFs0Ahg=;
 b=JuHGGOpEzXZT31L3QT0Xm/RMpaQ3Otc66cBQNJZjd3xLlxQNX5foY3HIvFzSclAwIraiAQ
 DqZGnkLSsdKEkSRaPp7Aw43eiGHiblb+cb8jP0UyGdU0BAon//FmNpvS9yYEb9b5KopW3I
 u/PG+Y1O12EudDvMUfkDPocsnR859jw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-47-Zgph_v_qP0OODgSQpsK7Tg-1; Fri,
 11 Jul 2025 00:33:13 -0400
X-MC-Unique: Zgph_v_qP0OODgSQpsK7Tg-1
X-Mimecast-MFC-AGG-ID: Zgph_v_qP0OODgSQpsK7Tg_1752208391
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6067718002ED; Fri, 11 Jul 2025 04:33:11 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.240])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 37E5A18002B5; Fri, 11 Jul 2025 04:33:08 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 10 Jul 2025 23:31:24 -0500
Subject: [PATCH 13/14] drm/panel/boe-tv101wum-nl6: Use refcounted
 allocation in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-b4-driver-convert-last-part-july-v1-13-de73ba81b2f5@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752208280; l=1515;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=a6ZNYWyy1tj4pWbYzR6Lh3OvSPa78NsH3QPr0ODN52k=;
 b=aaLAXmAYTYPXIf6rYqGtaHTBQU8AWJBRxjzPVIQsvNsueaKycU2N4n5l1Cs7Y0P0ac3dxJC98
 f6YN3atFk7aAuH3Dgxrwe3L15e1LmPkaaiFkiqOqchKro9jSrraiN9c
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
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 3e5b0d8636d087596aeb3ef0a9feef14157942ca..d5fe105bdbdde5147c5392945928148ebfdf53b5 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1720,8 +1720,6 @@ static int boe_panel_add(struct boe_panel *boe)
 
 	boe->base.prepare_prev_first = true;
 
-	drm_panel_init(&boe->base, dev, &boe_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	err = of_drm_get_panel_orientation(dev->of_node, &boe->orientation);
 	if (err < 0) {
 		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, err);
@@ -1746,9 +1744,11 @@ static int boe_panel_probe(struct mipi_dsi_device *dsi)
 	int ret;
 	const struct panel_desc *desc;
 
-	boe = devm_kzalloc(&dsi->dev, sizeof(*boe), GFP_KERNEL);
-	if (!boe)
-		return -ENOMEM;
+	boe = devm_drm_panel_alloc(&dsi->dev, __typeof(*boe), base,
+				   &boe_panel_funcs, DRM_MODE_CONNECTOR_DSI);
+
+	if (IS_ERR(boe))
+		return PTR_ERR(boe);
 
 	desc = of_device_get_match_data(&dsi->dev);
 	dsi->lanes = desc->lanes;

-- 
2.48.1

