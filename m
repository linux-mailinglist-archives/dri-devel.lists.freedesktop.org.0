Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABA1A07AAF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 16:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370BE10EE7D;
	Thu,  9 Jan 2025 15:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QEdI2JVu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rrsFXEqv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jZZapTnC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lk77pFGn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5660B10EE88;
 Thu,  9 Jan 2025 15:03:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E721F21171;
 Thu,  9 Jan 2025 15:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736435000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NqQRjOkhm9SJSbhxaHLS/kALWSX7OjgIi0zWzKpICPM=;
 b=QEdI2JVuAtwjaRpn1a9OFWgjqj3vZJaOLtdoeqSUYNcWQ0K6AyVe+NKAdTRqaF6xN4rwoS
 S+VajvQzfi8eTK2zzPVPpGspbAVlr8roJzhPrF9leDWOcqqtMReUqvg3WtmTH5NpkluLiB
 LTNkrCxWe2dNbcRRiiAqUZYOnoZ5SzM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736435000;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NqQRjOkhm9SJSbhxaHLS/kALWSX7OjgIi0zWzKpICPM=;
 b=rrsFXEqv5/RIaAjhK/LJO8o69DayAQL2H8fXVM7CAdBqkRlT8d89QpRS0vSV3VCS608hTO
 /Bzn4WflsHwfjsCQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jZZapTnC;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lk77pFGn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1736434999; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NqQRjOkhm9SJSbhxaHLS/kALWSX7OjgIi0zWzKpICPM=;
 b=jZZapTnCAdx/tMhB9e9FyPhemBcaQ4RAHrohqqdY389CpOLMQTTOCdQX5lB3Imxmwh+NsX
 PZ/WqOMlY1IeD/th3PyUpFmUOY8iRO4YQ5Zm7ftZPMo2cbIWjI9dCYxVq4aie9WhZXfbDS
 VWB3SvqFdopGa/7hrVfP33ejnWntyWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1736434999;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NqQRjOkhm9SJSbhxaHLS/kALWSX7OjgIi0zWzKpICPM=;
 b=lk77pFGnfUgqy1c2btVrQZ4ATtWNUyGXXQlWLRvPjL5pkBLWiohlrYrIJokVOs0r+/es+Y
 Oxmj8v4C7fw0aWCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 50C0913A8B;
 Thu,  9 Jan 2025 15:03:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MFNqEjflf2c1awAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Jan 2025 15:03:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
Subject: [PATCH v2 09/25] drm/hibmc: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Date: Thu,  9 Jan 2025 15:57:03 +0100
Message-ID: <20250109150310.219442-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109150310.219442-1-tzimmermann@suse.de>
References: <20250109150310.219442-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E721F21171
X-Spam-Score: -1.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,linaro.org:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCPT_COUNT_TWELVE(0.00)[25]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
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

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 128.

The hibmc driver's new hibmc_dumb_create() is similar to the one
in GEM VRAM helpers. The driver was the only caller of
drm_gem_vram_fill_create_dumb(). Remove the now unused helper.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Yongqin Liu <yongqin.liu@linaro.org>
Cc: John Stultz <jstultz@google.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c         | 65 -------------------
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 25 ++++++-
 include/drm/drm_gem_vram_helper.h             |  6 --
 3 files changed, 24 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 15cd564cbeac..b4cf8134df6d 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -444,71 +444,6 @@ void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo,
 }
 EXPORT_SYMBOL(drm_gem_vram_vunmap);
 
-/**
- * drm_gem_vram_fill_create_dumb() - Helper for implementing
- *				     &struct drm_driver.dumb_create
- *
- * @file:		the DRM file
- * @dev:		the DRM device
- * @pg_align:		the buffer's alignment in multiples of the page size
- * @pitch_align:	the scanline's alignment in powers of 2
- * @args:		the arguments as provided to
- *			&struct drm_driver.dumb_create
- *
- * This helper function fills &struct drm_mode_create_dumb, which is used
- * by &struct drm_driver.dumb_create. Implementations of this interface
- * should forwards their arguments to this helper, plus the driver-specific
- * parameters.
- *
- * Returns:
- * 0 on success, or
- * a negative error code otherwise.
- */
-int drm_gem_vram_fill_create_dumb(struct drm_file *file,
-				  struct drm_device *dev,
-				  unsigned long pg_align,
-				  unsigned long pitch_align,
-				  struct drm_mode_create_dumb *args)
-{
-	size_t pitch, size;
-	struct drm_gem_vram_object *gbo;
-	int ret;
-	u32 handle;
-
-	pitch = args->width * DIV_ROUND_UP(args->bpp, 8);
-	if (pitch_align) {
-		if (WARN_ON_ONCE(!is_power_of_2(pitch_align)))
-			return -EINVAL;
-		pitch = ALIGN(pitch, pitch_align);
-	}
-	size = pitch * args->height;
-
-	size = roundup(size, PAGE_SIZE);
-	if (!size)
-		return -EINVAL;
-
-	gbo = drm_gem_vram_create(dev, size, pg_align);
-	if (IS_ERR(gbo))
-		return PTR_ERR(gbo);
-
-	ret = drm_gem_handle_create(file, &gbo->bo.base, &handle);
-	if (ret)
-		goto err_drm_gem_object_put;
-
-	drm_gem_object_put(&gbo->bo.base);
-
-	args->pitch = pitch;
-	args->size = size;
-	args->handle = handle;
-
-	return 0;
-
-err_drm_gem_object_put:
-	drm_gem_object_put(&gbo->bo.base);
-	return ret;
-}
-EXPORT_SYMBOL(drm_gem_vram_fill_create_dumb);
-
 /*
  * Helpers for struct ttm_device_funcs
  */
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index e6de6d5edf6b..81768577871f 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -18,10 +18,12 @@
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_mode.h>
 #include <drm/drm_module.h>
 #include <drm/drm_vblank.h>
 
@@ -54,7 +56,28 @@ static irqreturn_t hibmc_interrupt(int irq, void *arg)
 static int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
 			     struct drm_mode_create_dumb *args)
 {
-	return drm_gem_vram_fill_create_dumb(file, dev, 0, 128, args);
+	struct drm_gem_vram_object *gbo;
+	int ret;
+
+	ret = drm_mode_size_dumb(dev, args, SZ_128, 0);
+	if (ret)
+		return ret;
+
+	gbo = drm_gem_vram_create(dev, args->size, 0);
+	if (IS_ERR(gbo))
+		return PTR_ERR(gbo);
+
+	ret = drm_gem_handle_create(file, &gbo->bo.base, &args->handle);
+	if (ret)
+		goto err_drm_gem_object_put;
+
+	drm_gem_object_put(&gbo->bo.base);
+
+	return 0;
+
+err_drm_gem_object_put:
+	drm_gem_object_put(&gbo->bo.base);
+	return ret;
 }
 
 static const struct drm_driver hibmc_driver = {
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 00830b49a3ff..b6e821f5dd03 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -100,12 +100,6 @@ int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct iosys_map *map);
 void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo,
 			 struct iosys_map *map);
 
-int drm_gem_vram_fill_create_dumb(struct drm_file *file,
-				  struct drm_device *dev,
-				  unsigned long pg_align,
-				  unsigned long pitch_align,
-				  struct drm_mode_create_dumb *args);
-
 /*
  * Helpers for struct drm_driver
  */
-- 
2.47.1

