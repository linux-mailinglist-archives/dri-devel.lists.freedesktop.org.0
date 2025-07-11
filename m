Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 948C3B01230
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 06:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F356910E997;
	Fri, 11 Jul 2025 04:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="baOuA31v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BA510E997
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 04:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752208360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xQUarlWgtFzkfaxvo6Stgpx0YLZvaw7V296iJ+ntFzU=;
 b=baOuA31vI7cbREc/fwTznka76fwFnW2seOgcJImnFQv9bBwGmGaM7WMJrzk4LSJq9S7KLZ
 kX9l6Nt3WZ+PaQJcTWoPwo3nIq5Pg/+JGU0w68OkYPZ2Wf7/DtZH+Dn8unEY3jpSa0U3yx
 H9HqhlYAYnSP+l3kDGZhaCOwbYCPHs4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-645-dnNUbXklPjmFYkBbpRGbEQ-1; Fri,
 11 Jul 2025 00:32:34 -0400
X-MC-Unique: dnNUbXklPjmFYkBbpRGbEQ-1
X-Mimecast-MFC-AGG-ID: dnNUbXklPjmFYkBbpRGbEQ_1752208352
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1A67E19560B0; Fri, 11 Jul 2025 04:32:32 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.240])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D02B0180045B; Fri, 11 Jul 2025 04:32:28 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 10 Jul 2025 23:31:13 -0500
Subject: [PATCH 02/14] drm/panel/raspberrypi: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-b4-driver-convert-last-part-july-v1-2-de73ba81b2f5@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752208280; l=1432;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=LJdVqDotBZJHwUhVUj/AbpJUyN2rg5fcXdBIRDVzgoc=;
 b=/rOcO1OmXqQxMD4khbrmy4pweqRXf/Lpxzij5a767i9xDVvUlaavbBZLBBaY1yQnlH57rd2Rv
 8UEbs+ZEgcJBBEWJ8GKEDwl/yk9jzvr33bjwPAmH6CR4LHQS5Du7b54
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
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index e10e469aa7a6c5684c9240ea74c8d1184c7723a5..dc4bb8ad913185f94e3f7e1a34fbddc31f21f098 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -373,9 +373,12 @@ static int rpi_touchscreen_probe(struct i2c_client *i2c)
 		.node = NULL,
 	};
 
-	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
-	if (!ts)
-		return -ENOMEM;
+	ts = devm_drm_panel_alloc(dev, __typeof(*ts), base,
+				  &rpi_touchscreen_funcs,
+				  DRM_MODE_CONNECTOR_DSI);
+
+	if (IS_ERR(ts))
+		return PTR_ERR(ts);
 
 	i2c_set_clientdata(i2c, ts);
 
@@ -428,9 +431,6 @@ static int rpi_touchscreen_probe(struct i2c_client *i2c)
 		return PTR_ERR(ts->dsi);
 	}
 
-	drm_panel_init(&ts->base, dev, &rpi_touchscreen_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	/* This appears last, as it's what will unblock the DSI host
 	 * driver's component bind function.
 	 */

-- 
2.48.1

