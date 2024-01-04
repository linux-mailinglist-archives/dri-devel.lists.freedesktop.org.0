Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E878245B4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 17:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74A210E4FE;
	Thu,  4 Jan 2024 16:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310B610E4FE
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 16:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704384253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5F2z4XE/4gw5Vx3T38aRtMx57f9BqIh/Xx30qTKp0cc=;
 b=BDFD60yzkUqRV9y7drvGg7G90/4xgRQmRCqOyUyWpUsYh7gXDikRSASLw1KlusoQjm9SSU
 ZfT+ISIcYwCJg9Gkm+sFzEVUOB7PGygfihRStNA7m7T263b/45ZBwAmVNXTrYFm/9D+6rW
 uD9YIDeE3SqM8pY0E6WxZdyOLVCUc9w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-qsBDukTCNxSWrDvz4AuzZQ-1; Thu, 04 Jan 2024 11:04:10 -0500
X-MC-Unique: qsBDukTCNxSWrDvz4AuzZQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1155B881F08;
 Thu,  4 Jan 2024 16:04:05 +0000 (UTC)
Received: from hydra.bos2.lab (unknown [10.39.193.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 701ED1C060AF;
 Thu,  4 Jan 2024 16:04:03 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Subject: [PATCH v7 3/9] drm/plane: Add drm_for_each_primary_visible_plane macro
Date: Thu,  4 Jan 2024 17:00:47 +0100
Message-ID: <20240104160301.185915-4-jfalempe@redhat.com>
In-Reply-To: <20240104160301.185915-1-jfalempe@redhat.com>
References: <20240104160301.185915-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: gpiccoli@igalia.com, Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To support drm_panic, most drivers need to find the current primary
visible plane with a framebuffer attached.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 include/drm/drm_plane.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index c6565a6f9324..41c08a2ddf8d 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -948,6 +948,21 @@ static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
 	list_for_each_entry(plane, &(dev)->mode_config.plane_list, head) \
 		for_each_if (plane->type == DRM_PLANE_TYPE_OVERLAY)
 
+/**
+ * drm_for_each_primary_visible_plane - iterate over all primary visible planes
+ * @plane: the loop cursor
+ * @dev: the DRM device
+ *
+ * Iterate over all primary, visible plane, with a framebuffer.
+ * This is useful for drm_panic, to find the current scanout buffer.
+ */
+#define drm_for_each_primary_visible_plane(plane, dev) \
+	list_for_each_entry((plane), &(dev)->mode_config.plane_list, head) \
+		for_each_if((plane)->type == DRM_PLANE_TYPE_PRIMARY && \
+			    (plane)->state && \
+			    (plane)->state->fb && \
+			    (plane)->state->visible)
+
 /**
  * drm_for_each_plane - iterate over all planes
  * @plane: the loop cursor
-- 
2.43.0

