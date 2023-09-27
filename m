Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 411C67B0B12
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 19:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741AA10E588;
	Wed, 27 Sep 2023 17:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D6D10E585
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 17:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695835748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=STMNnper8GaF7paBIRqpKvfx18OJyJePJt/NZvV3inc=;
 b=iNNmMJKrXl3tJ56ozNfbV/opueSTXkFOOxnPa2OVXxNwBdyJOy+wiE6BRWLR3/Gvwm08bc
 p//g6Ua/K6GZ8cD8JAaKwBeBDYL1ey6scU2ASM6d3KO/RKIm9pjYXS4fJInJ5tYJXG61Jf
 q8QhUOHix7W9cLOplB3vZL46xUhvkBo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-PP9R6MaOP6eNGnofqU--rA-1; Wed, 27 Sep 2023 13:29:05 -0400
X-MC-Unique: PP9R6MaOP6eNGnofqU--rA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67813805B32;
 Wed, 27 Sep 2023 17:29:04 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.195.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEDBAC154CA;
 Wed, 27 Sep 2023 17:29:02 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net
Subject: [PATCH v3 1/3] drm/format-helper: Export
 drm_fb_xrgb8888_to_rgb565_line
Date: Wed, 27 Sep 2023 19:22:50 +0200
Message-ID: <20230927172849.193996-2-jfalempe@redhat.com>
In-Reply-To: <20230927172849.193996-1-jfalempe@redhat.com>
References: <20230927172849.193996-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

drm_panic will need the low-level drm_fb_xxxx_line functions.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_format_helper.c | 3 ++-
 include/drm/drm_format_helper.h     | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index f93a4efcee90..e2d3bc2707ea 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -320,7 +320,7 @@ void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pi
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
 
-static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigned int pixels)
+void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
 	__le16 *dbuf16 = dbuf;
 	const __le32 *sbuf32 = sbuf;
@@ -336,6 +336,7 @@ static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigne
 		dbuf16[x] = cpu_to_le16(val16);
 	}
 }
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565_line);
 
 /* TODO: implement this helper as conversion to RGB565|BIG_ENDIAN */
 static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 291deb09475b..ca4ac4ff0801 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -67,4 +67,6 @@ size_t drm_fb_build_fourcc_list(struct drm_device *dev,
 				const u32 *native_fourccs, size_t native_nfourccs,
 				u32 *fourccs_out, size_t nfourccs_out);
 
+
+void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigned int pixels);
 #endif /* __LINUX_DRM_FORMAT_HELPER_H */
-- 
2.41.0

