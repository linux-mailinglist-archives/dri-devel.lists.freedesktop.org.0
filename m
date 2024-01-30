Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CBC8420C2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F50112ED5;
	Tue, 30 Jan 2024 10:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0D0112EF1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:07:52 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 663301FD05;
 Tue, 30 Jan 2024 10:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=so6KT7kh3b+C7BLDuaCQJ5P2b9NqIntMf+pAqaa2jWE=;
 b=1MpVmoPFvZA6nVHNmMxh2lUI6wijas1FRcKG/dyd/lpQXhIIak1uQzzGGH7EpPEhPzwXzi
 2CeuZHqTtnWgtZw5KneD92xDactc4NPDFU6YrUXnvXbshLpam2Vutb3DUtXG1GmTLTZQLa
 5VKs1q8NeGgQBtz0G4aBiXPQ+3gewDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609240;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=so6KT7kh3b+C7BLDuaCQJ5P2b9NqIntMf+pAqaa2jWE=;
 b=E6c5PdGyHgOCXD4WDxvR1I2tLeNvMTxxPLlPET/GvzB4IuUQdLGXfuFOax7h2qI42ThmJz
 8L9ivsXsjA3QAyCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=so6KT7kh3b+C7BLDuaCQJ5P2b9NqIntMf+pAqaa2jWE=;
 b=1MpVmoPFvZA6nVHNmMxh2lUI6wijas1FRcKG/dyd/lpQXhIIak1uQzzGGH7EpPEhPzwXzi
 2CeuZHqTtnWgtZw5KneD92xDactc4NPDFU6YrUXnvXbshLpam2Vutb3DUtXG1GmTLTZQLa
 5VKs1q8NeGgQBtz0G4aBiXPQ+3gewDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609240;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=so6KT7kh3b+C7BLDuaCQJ5P2b9NqIntMf+pAqaa2jWE=;
 b=E6c5PdGyHgOCXD4WDxvR1I2tLeNvMTxxPLlPET/GvzB4IuUQdLGXfuFOax7h2qI42ThmJz
 8L9ivsXsjA3QAyCw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 458B413462;
 Tue, 30 Jan 2024 10:07:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id SGLhD1jKuGXdcwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Jan 2024 10:07:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com
Subject: [PATCH 22/23] [DO NOT MERGE] drm/format-helper: Support blitting from
 C1 to XRGB8888
Date: Tue, 30 Jan 2024 10:53:57 +0100
Message-ID: <20240130100714.12608-23-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130100714.12608-1-tzimmermann@suse.de>
References: <20240130100714.12608-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [1.90 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; R_MISSING_CHARSET(2.50)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; TO_DN_SOME(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLson8px8pywph8mow9a7f4xe8)];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: *
X-Spam-Score: 1.90
X-Spam-Flag: NO
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implemented for drawing fonts, the C1-to-XRGB8888 blitting code writes
single bits into an XRGB8888-based buffer. The color is read from the
given palette.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 39 +++++++++++++++++++++++++++++
 include/drm/drm_format_helper.h     |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 2588871672b6d..a61f45636a111 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -462,6 +462,45 @@ static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void *sbuf, unsigne
 	}
 }
 
+static void drm_fb_c1_to_xrgb8888_line(void *dbuf, const void *sbuf, unsigned int pixels,
+			       		 const struct drm_color_lut *palette)
+{
+	__le32 *dbuf32 = dbuf;
+	const __le32 *sbuf32 = sbuf;
+	unsigned int shift = 0;
+	unsigned int x;
+	u32 pix;
+	u32 bit;
+	u32 val32;
+
+	for (x = 0; x < pixels; x++) {
+		if (!shift) {
+			pix = le32_to_cpu(sbuf32[x / 32]);
+			shift = 32;
+		}
+		--shift;
+		bit = (pix >> shift) & BIT(0);
+
+		val32 = GENMASK(31, 24) |
+			((palette[bit].red   >> 8) << 16) |
+			((palette[bit].green >> 8) << 8) |
+			((palette[bit].blue  >> 8));
+		dbuf32[x] = cpu_to_le32(val32);
+	}
+}
+
+void drm_fb_c1_to_xrgb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
+			   const struct drm_pixmap *src_pix, struct drm_format_conv_state *state)
+{
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
+		4,
+	};
+
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src_pix, false, state,
+		    drm_fb_c1_to_xrgb8888_line);
+}
+EXPORT_SYMBOL(drm_fb_c1_to_xrgb8888);
+
 /**
  * drm_fb_xrgb8888_to_rgb332 - Convert XRGB8888 to RGB332 clip buffer
  * @dst: Array of RGB332 destination buffers
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 464812080f3dc..d5ee8bdb0f619 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -109,6 +109,8 @@ void drm_fb_swab(struct drm_device *dev,
 		 struct iosys_map *dst, const unsigned int *dst_pitch,
 		 const struct drm_pixmap *src_pix, bool cached,
 		 struct drm_format_conv_state *state);
+void drm_fb_c1_to_xrgb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
+			   const struct drm_pixmap *src_pix, struct drm_format_conv_state *state);
 void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct drm_pixmap *src_pix, struct drm_format_conv_state *state);
 void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
-- 
2.43.0

