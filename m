Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 493928245B3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 17:04:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6AE10E501;
	Thu,  4 Jan 2024 16:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3CD10E4FC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704384250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=140eyH6b90lDiolSviea0J9UQn8w6l18j+lIZ/zRq1o=;
 b=Ja8Q7bFz+JYKJeo/ZnWZc+97l6ILiHCWjRxh+CfuAEWGTaAZKLFfQBEscncYyIId830Uof
 UlwLMj2Kjo7eupyopsMCXQwW++ISy9M7WfzJBjMsrb+dV56icA35sSz9HT64s/k3H4hNdY
 uznT1zfUoXR+eYeKCevkYCCUSe4hLAw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-J-lJQN6vN7SwJopBDCm3pQ-1; Thu, 04 Jan 2024 11:04:07 -0500
X-MC-Unique: J-lJQN6vN7SwJopBDCm3pQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE3811019C82;
 Thu,  4 Jan 2024 16:04:06 +0000 (UTC)
Received: from hydra.bos2.lab (unknown [10.39.193.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 495FC1C060AF;
 Thu,  4 Jan 2024 16:04:05 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Subject: [PATCH v7 4/9] drm/panic: Add drm_panic_is_format_supported()
Date: Thu,  4 Jan 2024 17:00:48 +0100
Message-ID: <20240104160301.185915-5-jfalempe@redhat.com>
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

So driver knows early if drm_panic will be able to display something
on the current scanout buffer.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 13 +++++++++++++
 include/drm/drm_panic.h     |  4 ++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 362a696ec48a..c68167cd4c08 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -348,6 +348,19 @@ void drm_panic_unregister(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_panic_unregister);
 
+/**
+ * drm_panic_is_format_supported()
+ * @format: a fourcc color code
+ * Returns: true if supported, false otherwise.
+ *
+ * Check if drm_panic will be able to use this color format.
+ */
+bool drm_panic_is_format_supported(u32 format)
+{
+	return drm_fb_convert_from_xrgb8888(0xffffff, format) != 0;
+}
+EXPORT_SYMBOL(drm_panic_is_format_supported);
+
 /**
  * drm_panic_init() - Initialize drm-panic subsystem
  *
diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
index bcf392b6fa1b..1549c8eb8dcc 100644
--- a/include/drm/drm_panic.h
+++ b/include/drm/drm_panic.h
@@ -84,6 +84,8 @@ void drm_panic_exit(void);
 void drm_panic_register(struct drm_device *dev);
 void drm_panic_unregister(struct drm_device *dev);
 
+bool drm_panic_is_format_supported(u32 format);
+
 #else
 
 static inline void drm_panic_init(void) {}
@@ -92,6 +94,8 @@ static inline void drm_panic_exit(void) {}
 static inline void drm_panic_register(struct drm_device *dev) {}
 static inline void drm_panic_unregister(struct drm_device *dev) {}
 
+bool drm_panic_is_format_supported(u32 format) {return false; }
+
 #endif
 
 #endif /* __DRM_PANIC_H__ */
-- 
2.43.0

