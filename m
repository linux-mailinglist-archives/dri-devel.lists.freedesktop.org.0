Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD726348DD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 22:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D457310E47F;
	Tue, 22 Nov 2022 20:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A24C10E473
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 20:59:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EF8C2B81D9B;
 Tue, 22 Nov 2022 20:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28861C43470;
 Tue, 22 Nov 2022 20:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669150745;
 bh=qc7k/CCsM3pSWa+GWYQH/mlrBU+SIsMDGf6pclLEiUs=;
 h=From:Date:Subject:References:In-Reply-To:To:Reply-To:From;
 b=Q9YhAJ7Qr3CGz58qMiJhpyEdz1iOVy5Xys1DFpZMU/cZkmnkV3GuJNhQ7QEbjIYxZ
 WqMinatpSmMjLWyIpP5WxdeIi26BcqAWtl83GkXeFF6t8cKAOlc1dgqaQj7GYHgiCj
 lKSSkGFYXBhRurIPAzSZHg9Q4yGinKGibszmIl9ugxzg9WVz6a5yHG1N6n7JEAEiBD
 z4/7KXUo5cqSctYmpS8BGOdPMnJL/8XO3nAGaYhztmIYJjhA6vStHW4Mu864ApVIAY
 kWx1v4bz97cwdQrQe760146BlVhrQC1SA+E+ZhZHSf5jaUjNpRkarZsaRHgh1w0cqY
 0SA8nN1FTBacQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 0E664C46467;
 Tue, 22 Nov 2022 20:59:05 +0000 (UTC)
From: Noralf Trønnes via B4 Submission Endpoint <devnull@kernel.org>
Date: Tue, 22 Nov 2022 21:58:42 +0100
Subject: [PATCH 4/6] drm/gud: Split up gud_flush_work()
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20221122-gud-shadow-plane-v1-4-9de3afa3383e@tronnes.org>
References: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
In-Reply-To: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, stable@kernel.org,
	Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
	Hans de Goede <hdegoede@redhat.com>,
	Noralf Trønnes <noralf@tronnes.org>,
	Maxime Ripard <mripard@kernel.org>,
	Javier Martinez Canillas <javierm@redhat.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1669150743; l=3252;
 i=noralf@tronnes.org; s=20221122; h=from:subject:message-id;
 bh=ahKXg6Xr5HyjHv3T70OJ3XcsDN6UVfaIf3j92RcQJLk=;
 b=hkaLXrdhOvsy9qN2VfPsRyfI9DZkqa2UeUx0U0XU0wFHKawXhNL2KI2S1T+ur/NDk3fi8kqzYPF/
 TjXmjMmeDSfIANrGmBl1cTuF7PzO6FiDTYqy1fc07oh/atsvo1XY
X-Developer-Key: i=noralf@tronnes.org; a=ed25519;
 pk=0o9is4iddvvlrY3yON5SVtAbgPnVs0LfQsjfqR2Hvz8=
X-Endpoint-Received: by B4 Submission Endpoint for noralf@tronnes.org/20221122
 with auth_id=8
X-Original-From: Noralf Trønnes <noralf@tronnes.org>
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
Reply-To: noralf@tronnes.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Noralf Trønnes <noralf@tronnes.org>

In preparation for inlining synchronous flushing split out the part of
gud_flush_work() that can be shared by the sync and async code paths.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/gud/gud_pipe.c | 72 +++++++++++++++++++++++-------------------
 1 file changed, 39 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index ff1358815af5..d2af9947494f 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -333,15 +333,49 @@ void gud_clear_damage(struct gud_device *gdrm)
 	gdrm->damage.y2 = 0;
 }
 
+static void gud_flush_damage(struct gud_device *gdrm, struct drm_framebuffer *fb,
+			     struct drm_rect *damage)
+{
+	const struct drm_format_info *format;
+	unsigned int i, lines;
+	size_t pitch;
+	int ret;
+
+	format = fb->format;
+	if (format->format == DRM_FORMAT_XRGB8888 && gdrm->xrgb8888_emulation_format)
+		format = gdrm->xrgb8888_emulation_format;
+
+	/* Split update if it's too big */
+	pitch = drm_format_info_min_pitch(format, 0, drm_rect_width(damage));
+	lines = drm_rect_height(damage);
+
+	if (gdrm->bulk_len < lines * pitch)
+		lines = gdrm->bulk_len / pitch;
+
+	for (i = 0; i < DIV_ROUND_UP(drm_rect_height(damage), lines); i++) {
+		struct drm_rect rect = *damage;
+
+		rect.y1 += i * lines;
+		rect.y2 = min_t(u32, rect.y1 + lines, damage->y2);
+
+		ret = gud_flush_rect(gdrm, fb, format, &rect);
+		if (ret) {
+			if (ret != -ENODEV && ret != -ECONNRESET &&
+			    ret != -ESHUTDOWN && ret != -EPROTO)
+				dev_err_ratelimited(fb->dev->dev,
+						    "Failed to flush framebuffer: error=%d\n", ret);
+			gdrm->prev_flush_failed = true;
+			break;
+		}
+	}
+}
+
 void gud_flush_work(struct work_struct *work)
 {
 	struct gud_device *gdrm = container_of(work, struct gud_device, work);
-	const struct drm_format_info *format;
 	struct drm_framebuffer *fb;
 	struct drm_rect damage;
-	unsigned int i, lines;
-	int idx, ret = 0;
-	size_t pitch;
+	int idx;
 
 	if (!drm_dev_enter(&gdrm->drm, &idx))
 		return;
@@ -356,35 +390,7 @@ void gud_flush_work(struct work_struct *work)
 	if (!fb)
 		goto out;
 
-	format = fb->format;
-	if (format->format == DRM_FORMAT_XRGB8888 && gdrm->xrgb8888_emulation_format)
-		format = gdrm->xrgb8888_emulation_format;
-
-	/* Split update if it's too big */
-	pitch = drm_format_info_min_pitch(format, 0, drm_rect_width(&damage));
-	lines = drm_rect_height(&damage);
-
-	if (gdrm->bulk_len < lines * pitch)
-		lines = gdrm->bulk_len / pitch;
-
-	for (i = 0; i < DIV_ROUND_UP(drm_rect_height(&damage), lines); i++) {
-		struct drm_rect rect = damage;
-
-		rect.y1 += i * lines;
-		rect.y2 = min_t(u32, rect.y1 + lines, damage.y2);
-
-		ret = gud_flush_rect(gdrm, fb, format, &rect);
-		if (ret) {
-			if (ret != -ENODEV && ret != -ECONNRESET &&
-			    ret != -ESHUTDOWN && ret != -EPROTO)
-				dev_err_ratelimited(fb->dev->dev,
-						    "Failed to flush framebuffer: error=%d\n", ret);
-			gdrm->prev_flush_failed = true;
-			break;
-		}
-
-		gdrm->prev_flush_failed = false;
-	}
+	gud_flush_damage(gdrm, fb, &damage);
 
 	drm_framebuffer_put(fb);
 out:

-- 
b4 0.10.1

