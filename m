Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B083ADD019
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 16:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CA210E744;
	Tue, 17 Jun 2025 14:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mE7L8t74";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zk6iCbrJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mE7L8t74";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zk6iCbrJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C92510E18F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 14:39:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2E5F12116E;
 Tue, 17 Jun 2025 14:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750171188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPbsU+HM5R1Ir+3l72OWjroBmNdGbyifV+C0W2K93rE=;
 b=mE7L8t74PCp/mfxCPq1kN8WN/940izc6uJ8THNCa9rjO2ZdVSqx4kyntWCLGTWkAYrSPPq
 tNRNgoe5qC8qkvr1w/fOKH7/PyFTKwN/0TeAY2A1NzcAUiPuaZuNKK5lEHtN7M0/am8qxL
 sAPaVrMN9bp1XCVkPOVG5CJjiwucUNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750171188;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPbsU+HM5R1Ir+3l72OWjroBmNdGbyifV+C0W2K93rE=;
 b=zk6iCbrJ2ItEGaYA/9p1x0rfIZNxoleKFpC2pLuQAMploItth2/mhdeIVFQOY5YIs+JK1A
 y6yjEVhAlRditaBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750171188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPbsU+HM5R1Ir+3l72OWjroBmNdGbyifV+C0W2K93rE=;
 b=mE7L8t74PCp/mfxCPq1kN8WN/940izc6uJ8THNCa9rjO2ZdVSqx4kyntWCLGTWkAYrSPPq
 tNRNgoe5qC8qkvr1w/fOKH7/PyFTKwN/0TeAY2A1NzcAUiPuaZuNKK5lEHtN7M0/am8qxL
 sAPaVrMN9bp1XCVkPOVG5CJjiwucUNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750171188;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPbsU+HM5R1Ir+3l72OWjroBmNdGbyifV+C0W2K93rE=;
 b=zk6iCbrJ2ItEGaYA/9p1x0rfIZNxoleKFpC2pLuQAMploItth2/mhdeIVFQOY5YIs+JK1A
 y6yjEVhAlRditaBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0E5B013AE1;
 Tue, 17 Jun 2025 14:39:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WNIUAjR+UWh8bQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Jun 2025 14:39:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/9] video: pixel_format: Add compare helpers
Date: Tue, 17 Jun 2025 16:23:13 +0200
Message-ID: <20250617143649.143967-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617143649.143967-1-tzimmermann@suse.de>
References: <20250617143649.143967-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
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
2.49.0

