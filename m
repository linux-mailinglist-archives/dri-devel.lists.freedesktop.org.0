Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1178AB0434D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 17:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E82C10E223;
	Mon, 14 Jul 2025 15:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E5210E4B3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:18:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7917421222;
 Mon, 14 Jul 2025 15:18:23 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 58D3E13A57;
 Mon, 14 Jul 2025 15:18:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wL9IFL8fdWhbMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Jul 2025 15:18:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/9] video: pixel_format: Add compare helpers
Date: Mon, 14 Jul 2025 17:13:01 +0200
Message-ID: <20250714151513.309475-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250714151513.309475-1-tzimmermann@suse.de>
References: <20250714151513.309475-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 7917421222
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
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

Add helpers that compare two pixel-format descriptions against
each other.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 include/video/pixel_format.h | 58 ++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/include/video/pixel_format.h b/include/video/pixel_format.h
index b5104b2a3a13..c57019cd6ea8 100644
--- a/include/video/pixel_format.h
+++ b/include/video/pixel_format.h
@@ -38,4 +38,62 @@ struct pixel_format {
 #define PIXEL_FORMAT_XRGB2101010 \
 	{ 32, false, { .alpha = {0, 0}, .red = {20, 10}, .green = {10, 10}, .blue = {0, 10} } }
 
+#define __pixel_format_cmp_field(lhs, rhs, name) \
+	{ \
+		int ret = ((lhs)->name) - ((rhs)->name); \
+		if (ret) \
+			return ret; \
+	}
+
+#define __pixel_format_cmp_bitfield(lhs, rhs, name) \
+	{ \
+		__pixel_format_cmp_field(lhs, rhs, name.offset); \
+		__pixel_format_cmp_field(lhs, rhs, name.length); \
+	}
+
+/**
+ * pixel_format_cmp - Compares two pixel-format descriptions
+ *
+ * @lhs: a pixel-format description
+ * @rhs: a pixel-format description
+ *
+ * Compares two pixel-format descriptions for their order. The semantics
+ * are equivalent to memcmp().
+ *
+ * Returns:
+ * 0 if both arguments describe the same pixel format, less-than-zero if lhs < rhs,
+ * or greater-than-zero if lhs > rhs.
+ */
+static inline int pixel_format_cmp(const struct pixel_format *lhs, const struct pixel_format *rhs)
+{
+	__pixel_format_cmp_field(lhs, rhs, bits_per_pixel);
+	__pixel_format_cmp_field(lhs, rhs, indexed);
+
+	if (lhs->indexed) {
+		__pixel_format_cmp_bitfield(lhs, rhs, index);
+	} else {
+		__pixel_format_cmp_bitfield(lhs, rhs, alpha);
+		__pixel_format_cmp_bitfield(lhs, rhs, red);
+		__pixel_format_cmp_bitfield(lhs, rhs, green);
+		__pixel_format_cmp_bitfield(lhs, rhs, blue);
+	}
+
+	return 0;
+}
+
+/**
+ * pixel_format_equal - Compares two pixel-format descriptions for equality
+ *
+ * @lhs: a pixel-format description
+ * @rhs: a pixel-format description
+ *
+ * Returns:
+ * True if both arguments describe the same pixel format, or false otherwise.
+ */
+static inline bool pixel_format_equal(const struct pixel_format *lhs,
+				      const struct pixel_format *rhs)
+{
+	return !pixel_format_cmp(lhs, rhs);
+}
+
 #endif
-- 
2.50.0

