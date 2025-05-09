Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D774FAB0D6D
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 10:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63C010E977;
	Fri,  9 May 2025 08:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SN8Xf9GS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D4YbIjHO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LrfKmvFd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="38pp+9Sh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4683110E9DB
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 08:42:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 35AE621160;
 Fri,  9 May 2025 08:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1746780140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9GnF9uk/wVM48NdSU+dd1m9I35poLfkpdDAdTK8NVq4=;
 b=SN8Xf9GSDeoraycOSDOJQjA4OhOXPakjhT57eWNYcjQirhBahAocXLQFEuCXXqcjHhsNrf
 T/YCHsDmI3iH8yT6p50N5v8mcGNxjxl6shbMpiw7WaRjb6U1BvpAUBv6/XFeAaLf+MIoL2
 iNATzfnWan2NPtjv5EVX4rxgxiL83V8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1746780140;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9GnF9uk/wVM48NdSU+dd1m9I35poLfkpdDAdTK8NVq4=;
 b=D4YbIjHOf8FZaXLBPXotCqkMJKggInwQozjOCe481zmEJnM7NL8Q+gyN6a6Qjqg0z4cETn
 BTS9m0pxP1KQtsDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1746780139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9GnF9uk/wVM48NdSU+dd1m9I35poLfkpdDAdTK8NVq4=;
 b=LrfKmvFdHGLyWPpaH0lq8oVjaJcZmHEuJ04t7iWzKeuS/UDsXmPQU1QH6ung+C5TtKkKuD
 DwvSHe5dDA/zuECfFQ9qx4218YWV+/XAxtuERlmVOFv8zhHeSAPWDyouPGnTU7ktuRqqA/
 aOzJlHb67DNRgT9CNyXJc0craJBFJsw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1746780139;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9GnF9uk/wVM48NdSU+dd1m9I35poLfkpdDAdTK8NVq4=;
 b=38pp+9ShdpbcZVxOotByGwQIcXHH1bXDyI+i7JLhUIEfzLtu5TDgu8TTHQB+uWU61VULFG
 iZjT6O5kHpZbbICg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB15513A2C;
 Fri,  9 May 2025 08:42:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iFowOOq/HWgpXwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 09 May 2025 08:42:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, airlied@redhat.com,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/5] drm: Add helpers for programming hardware gamma LUTs
Date: Fri,  9 May 2025 10:23:15 +0200
Message-ID: <20250509083911.39018-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509083911.39018-1-tzimmermann@suse.de>
References: <20250509083911.39018-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,linux.intel.com,kernel.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
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

Provide helpers that program hardware gamma LUTs. Tha gamma ramp is
either provided by the driver or generated by the helper.

The DRM driver exports the GAMMA_LUT property with a fixed number of
entries per color component, such as 256 on 8-bit-wide components. The
entries describe the gamma ramp of each individual component. The new
helper drm_crtc_load_gamma_888() loads such gamma ramp to hardware. The
hardware uses each displayed pixel's individial components as indeces
into the hardware gamma table.

For color modes with less than 8 bits per color component, the helpers
drm_crtc_load_gamma_565_from() and drm_crtc_load_gamma_555_from_888()
interpolate the provided gamma ramp to reduce it to the correct number
of entries; 5/6/5 for RGB565-like formats and 5/5/5 for RGB1555-like
formats.

If no gamma ramp has been provided, drivers can use the new helper
drm_crtc_fill_gamma_888() to load a default gamma ramp with 256 entries
per color component. For color modes with less bits, the new helpers
drm_crtc_fill_gamma_565() and drm_crtc_fill_gamma_555() are available.
The default gamma ramp uses a gamma factor of 1. Later patches can
change this. For PCs, a gamma factor of 2.2 is common.

For color modes with palette, drm_crtc_load_palette_8() load an 8-bit
palette into the hardware. If no palette has been specified,
drm_crtc_fill_palette_8() load a system-specific default palette. This
is currently only a grey-scale palette with increasing luminance, but
later patches can change this. For PCs, a VGA default palette could
be used.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_color_mgmt.c | 206 +++++++++++++++++++++++++++++++
 include/drm/drm_color_mgmt.h     |  27 ++++
 2 files changed, 233 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 3969dc548cff..dd3e06605180 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -630,3 +630,209 @@ int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests)
 	return 0;
 }
 EXPORT_SYMBOL(drm_color_lut_check);
+
+/*
+ * Gamma-LUT programming
+ */
+
+/**
+ * drm_crtc_load_gamma_888 - Programs gamma ramp for RGB888-like formats
+ * @crtc: The displaying CRTC
+ * @lut: The gamma ramp to program
+ * @set_gamma: Callback for programming the hardware gamma LUT
+ *
+ * Programs the gamma ramp specified in @lut to hardware. The input gamma
+ * ramp must have 256 entries per color component.
+ */
+void drm_crtc_load_gamma_888(struct drm_crtc *crtc, const struct drm_color_lut *lut,
+			     drm_crtc_set_lut_func set_gamma)
+{
+	unsigned int i;
+
+	for (i = 0; i < 256; ++i)
+		set_gamma(crtc, i, lut[i].red, lut[i].green, lut[i].blue);
+}
+EXPORT_SYMBOL(drm_crtc_load_gamma_888);
+
+/**
+ * drm_crtc_load_gamma_565_from_888 - Programs gamma ramp for RGB565-like formats
+ * @crtc: The displaying CRTC
+ * @lut: The gamma ramp to program
+ * @set_gamma: Callback for programming the hardware gamma LUT
+ *
+ * Programs the gamma ramp specified in @lut to hardware. The input gamma
+ * ramp must have 256 entries per color component. The helper interpolates
+ * the individual color components to reduce the number of entries to 5/6/5.
+ */
+void drm_crtc_load_gamma_565_from_888(struct drm_crtc *crtc, const struct drm_color_lut *lut,
+				      drm_crtc_set_lut_func set_gamma)
+{
+	unsigned int i;
+	u16 r, g, b;
+
+	for (i = 0; i < 32; ++i) {
+		r = lut[i * 8 + i / 4].red;
+		g = lut[i * 4 + i / 16].green;
+		b = lut[i * 8 + i / 4].blue;
+		set_gamma(crtc, i, r, g, b);
+	}
+	/* Green has one more bit, so add padding with 0 for red and blue. */
+	for (i = 32; i < 64; ++i) {
+		g = lut[i * 4 + i / 16].green;
+		set_gamma(crtc, i, 0, g, 0);
+	}
+}
+EXPORT_SYMBOL(drm_crtc_load_gamma_565_from_888);
+
+/**
+ * drm_crtc_load_gamma_555_from_888 - Programs gamma ramp for RGB555-like formats
+ * @crtc: The displaying CRTC
+ * @lut: The gamma ramp to program
+ * @set_gamma: Callback for programming the hardware gamma LUT
+ *
+ * Programs the gamma ramp specified in @lut to hardware. The input gamma
+ * ramp must have 256 entries per color component. The helper interpolates
+ * the individual color components to reduce the number of entries to 5/5/5.
+ */
+void drm_crtc_load_gamma_555_from_888(struct drm_crtc *crtc, const struct drm_color_lut *lut,
+				      drm_crtc_set_lut_func set_gamma)
+{
+	unsigned int i;
+	u16 r, g, b;
+
+	for (i = 0; i < 32; ++i) {
+		r = lut[i * 8 + i / 4].red;
+		g = lut[i * 8 + i / 4].green;
+		b = lut[i * 8 + i / 4].blue;
+		set_gamma(crtc, i, r, g, b);
+	}
+}
+EXPORT_SYMBOL(drm_crtc_load_gamma_555_from_888);
+
+static void fill_gamma_888(struct drm_crtc *crtc, unsigned int i, u16 r, u16 g, u16 b,
+			   drm_crtc_set_lut_func set_gamma)
+{
+	r = (r << 8) | r;
+	g = (g << 8) | g;
+	b = (b << 8) | b;
+
+	set_gamma(crtc, i, r, g, b);
+}
+
+/**
+ * drm_crtc_fill_gamma_888 - Programs a default gamma ramp for RGB888-like formats
+ * @crtc: The displaying CRTC
+ * @set_gamma: Callback for programming the hardware gamma LUT
+ *
+ * Programs a default gamma ramp to hardware.
+ */
+void drm_crtc_fill_gamma_888(struct drm_crtc *crtc, drm_crtc_set_lut_func set_gamma)
+{
+	unsigned int i;
+
+	for (i = 0; i < 256; ++i)
+		fill_gamma_888(crtc, i, i, i, i, set_gamma);
+}
+EXPORT_SYMBOL(drm_crtc_fill_gamma_888);
+
+static void fill_gamma_565(struct drm_crtc *crtc, unsigned int i, u16 r, u16 g, u16 b,
+			   drm_crtc_set_lut_func set_gamma)
+{
+	r = (r << 11) | (r << 6) | (r << 1) | (r >> 4);
+	g = (g << 10) | (g << 4) | (g >> 2);
+	b = (b << 11) | (b << 6) | (b << 1) | (b >> 4);
+
+	set_gamma(crtc, i, r, g, b);
+}
+
+/**
+ * drm_crtc_fill_gamma_565 - Programs a default gamma ramp for RGB565-like formats
+ * @crtc: The displaying CRTC
+ * @set_gamma: Callback for programming the hardware gamma LUT
+ *
+ * Programs a default gamma ramp to hardware.
+ */
+void drm_crtc_fill_gamma_565(struct drm_crtc *crtc, drm_crtc_set_lut_func set_gamma)
+{
+	unsigned int i;
+
+	for (i = 0; i < 32; ++i)
+		fill_gamma_565(crtc, i, i, i, i, set_gamma);
+	/* Green has one more bit, so add padding with 0 for red and blue. */
+	for (i = 32; i < 64; ++i)
+		fill_gamma_565(crtc, i, 0, i, 0, set_gamma);
+}
+EXPORT_SYMBOL(drm_crtc_fill_gamma_565);
+
+static void fill_gamma_555(struct drm_crtc *crtc, unsigned int i, u16 r, u16 g, u16 b,
+			   drm_crtc_set_lut_func set_gamma)
+{
+	r = (r << 11) | (r << 6) | (r << 1) | (r >> 4);
+	g = (g << 11) | (g << 6) | (g << 1) | (g >> 4);
+	b = (b << 11) | (b << 6) | (b << 1) | (r >> 4);
+
+	set_gamma(crtc, i, r, g, b);
+}
+
+/**
+ * drm_crtc_fill_gamma_555 - Programs a default gamma ramp for RGB555-like formats
+ * @crtc: The displaying CRTC
+ * @set_gamma: Callback for programming the hardware gamma LUT
+ *
+ * Programs a default gamma ramp to hardware.
+ */
+void drm_crtc_fill_gamma_555(struct drm_crtc *crtc, drm_crtc_set_lut_func set_gamma)
+{
+	unsigned int i;
+
+	for (i = 0; i < 32; ++i)
+		fill_gamma_555(crtc, i, i, i, i, set_gamma);
+}
+EXPORT_SYMBOL(drm_crtc_fill_gamma_555);
+
+/*
+ * Color-LUT programming
+ */
+
+/**
+ * drm_crtc_load_palette_8 - Programs palette for C8-like formats
+ * @crtc: The displaying CRTC
+ * @lut: The palette to program
+ * @set_palette: Callback for programming the hardware palette
+ *
+ * Programs the palette specified in @lut to hardware. The input palette
+ * must have 256 entries per color component.
+ */
+void drm_crtc_load_palette_8(struct drm_crtc *crtc, const struct drm_color_lut *lut,
+			     drm_crtc_set_lut_func set_palette)
+{
+	unsigned int i;
+
+	for (i = 0; i < 256; ++i)
+		set_palette(crtc, i, lut[i].red, lut[i].green, lut[i].blue);
+}
+EXPORT_SYMBOL(drm_crtc_load_palette_8);
+
+static void fill_palette_8(struct drm_crtc *crtc, unsigned int i,
+			   drm_crtc_set_lut_func set_palette)
+{
+	u16 Y = (i << 8) | i; // relative luminance
+
+	set_palette(crtc, i, Y, Y, Y);
+}
+
+/**
+ * drm_crtc_fill_palette_8 - Programs a default palette for C8-like formats
+ * @crtc: The displaying CRTC
+ * @set_palette: Callback for programming the hardware gamma LUT
+ *
+ * Programs a default palette to hardware.
+ */
+void drm_crtc_fill_palette_8(struct drm_crtc *crtc, drm_crtc_set_lut_func set_palette)
+{
+	unsigned int i;
+
+	for (i = 0; i < 256; ++i)
+		fill_palette_8(crtc, i, set_palette);
+}
+EXPORT_SYMBOL(drm_crtc_fill_palette_8);
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index ed81741036d7..6cb577f6dba6 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -118,4 +118,31 @@ enum drm_color_lut_tests {
 };
 
 int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests);
+
+/*
+ * Gamma-LUT programming
+ */
+
+typedef void (*drm_crtc_set_lut_func)(struct drm_crtc *, unsigned int, u16, u16, u16);
+
+void drm_crtc_load_gamma_888(struct drm_crtc *crtc, const struct drm_color_lut *lut,
+			     drm_crtc_set_lut_func set_gamma);
+void drm_crtc_load_gamma_565_from_888(struct drm_crtc *crtc, const struct drm_color_lut *lut,
+				      drm_crtc_set_lut_func set_gamma);
+void drm_crtc_load_gamma_555_from_888(struct drm_crtc *crtc, const struct drm_color_lut *lut,
+				      drm_crtc_set_lut_func set_gamma);
+
+void drm_crtc_fill_gamma_888(struct drm_crtc *crtc, drm_crtc_set_lut_func set_gamma);
+void drm_crtc_fill_gamma_565(struct drm_crtc *crtc, drm_crtc_set_lut_func set_gamma);
+void drm_crtc_fill_gamma_555(struct drm_crtc *crtc, drm_crtc_set_lut_func set_gamma);
+
+/*
+ * Color-LUT programming
+ */
+
+void drm_crtc_load_palette_8(struct drm_crtc *crtc, const struct drm_color_lut *lut,
+			     drm_crtc_set_lut_func set_palette);
+
+void drm_crtc_fill_palette_8(struct drm_crtc *crtc, drm_crtc_set_lut_func set_palette);
+
 #endif
-- 
2.49.0

