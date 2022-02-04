Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A334AA029
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 20:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500FB10EBC0;
	Fri,  4 Feb 2022 19:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9755210EBB6
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 19:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644003208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/83AWJ2QXmVDCR/iJI/WoEuakD23PhH4n5nOKEaMm0w=;
 b=RoZ5H4eCpkezwgopg4XcbRY9RiFz/ItDlouO6RKfSrOEC9ntgsmriYND1QqKPivWCur//u
 n6vQdXYISFO7EK5R0ErSFWMcY6iJPnHN6Axx+G6jtucAnAimWWnv1P2O/Fjv8X0B4FLhwh
 NYO3E0CiUFYsexvonVrU/FidCzsr/lM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-9ARC1m5oOoK5jjhHLluHaw-1; Fri, 04 Feb 2022 14:33:25 -0500
X-MC-Unique: 9ARC1m5oOoK5jjhHLluHaw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB52810B7440;
 Fri,  4 Feb 2022 19:33:23 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.33.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 396ED5D6D7;
 Fri,  4 Feb 2022 19:33:22 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau/backlight: Just set all backlight types as RAW
Date: Fri,  4 Feb 2022 14:33:19 -0500
Message-Id: <20220204193319.451119-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we can get a warning on systems with eDP backlights like so:

  nv_backlight: invalid backlight type
  WARNING: CPU: 4 PID: 454 at drivers/video/backlight/backlight.c:420
    backlight_device_register+0x226/0x250

This happens as a result of us not filling out props.type for the eDP
backlight, even though we do it for all other backlight types.

Since nothing in our driver uses anything but BACKLIGHT_RAW, let's take the
props\.type assignments out of the codepaths for individual backlight types
and just set it unconditionally to prevent this from happening again.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 6eca310e8924 ("drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau")
Cc: <stable@vger.kernel.org> # v5.15+
---
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index 6af12dc99d7f..daf9f87477ba 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -101,7 +101,6 @@ nv40_backlight_init(struct nouveau_encoder *encoder,
 	if (!(nvif_rd32(device, NV40_PMC_BACKLIGHT) & NV40_PMC_BACKLIGHT_MASK))
 		return -ENODEV;
 
-	props->type = BACKLIGHT_RAW;
 	props->max_brightness = 31;
 	*ops = &nv40_bl_ops;
 	return 0;
@@ -343,7 +342,6 @@ nv50_backlight_init(struct nouveau_backlight *bl,
 	else
 		*ops = &nva3_bl_ops;
 
-	props->type = BACKLIGHT_RAW;
 	props->max_brightness = 100;
 
 	return 0;
@@ -411,6 +409,7 @@ nouveau_backlight_init(struct drm_connector *connector)
 		goto fail_alloc;
 	}
 
+	props.type = BACKLIGHT_RAW;
 	bl->dev = backlight_device_register(backlight_name, connector->kdev,
 					    nv_encoder, ops, &props);
 	if (IS_ERR(bl->dev)) {
-- 
2.34.1

