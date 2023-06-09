Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB9772A0EB
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 19:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827C910E6C9;
	Fri,  9 Jun 2023 17:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A139310E6C9
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 17:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686330591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jdi1ahNEpgpsHvIKoDJGTzIDYZ+gLZdkQID+ItWX/g4=;
 b=HPRadmnq9jWzwOfZxKgptqB6cnTBqa6zCBCSgPrfewgEblxFtGtCG7YeEYQciQNfPfhBdG
 gMcRL1E2Vkm0EjkCR5+pUHSt3+oGAuE68DIfqhfrLTPeTQx45Srl5KrkZKWYpRscyGbT/O
 c8s0CEoMngnDZOSYqhgQ5HO3u1zo8cg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-fs-NtcF0N8mc3Rfd8en50w-1; Fri, 09 Jun 2023 13:09:50 -0400
X-MC-Unique: fs-NtcF0N8mc3Rfd8en50w-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f7e4dc0fe5so11152885e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 10:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686330589; x=1688922589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jdi1ahNEpgpsHvIKoDJGTzIDYZ+gLZdkQID+ItWX/g4=;
 b=czLB5S2xuMnLl82YAJdeHYzkD8994UgJadM8v3POeiLN58D3PdTmzORwIdbr+id3aZ
 Hca/YIxRoGrsZTEZCvCi0eX9FVscnxEgErGpD49S5rlx5ouAnPO3aX6VaUAMK3WFzw/Z
 GNPEAWl0Eb2LNSTJ7wUcNJexczdEwUlLVrFby5Qar5Gl91lGpPuR2iTNdG/o/cC+B+md
 jl0mITZP+z6ervl9/u9hAe49wO6uWCVebItFXVbi1MclCLqehkOcLIqnoGtu5sFw53Kf
 uZ7s+I93s5koLTml7IGMxo/BB6blvgeY/o7vKWgcGbA+GgJ289MOGJk1x6eb2bdZJSg4
 IM/g==
X-Gm-Message-State: AC+VfDxJ2lHIumSBMQ9JD17083MiT4ljCzB9A5oMU3aYKcQcYnoAOP2i
 ixFGv3S53xsvQaSMimDIkDVdoVEuxCJs2B1LhyLSFKrUpa4w7g3w9m8e3Ov2HSZX71TFoiI0Hft
 s18yhllyEP+amshI5anBSlWx08lyn
X-Received: by 2002:a05:600c:b41:b0:3f7:eadb:941d with SMTP id
 k1-20020a05600c0b4100b003f7eadb941dmr1733485wmr.19.1686330589509; 
 Fri, 09 Jun 2023 10:09:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ49SbMDizpqOezr2iQZk3XoEoL+OAzSiMPqUuMSREper0lOeVD4/Oq8Xk7SYTZOS1sEaSGSrg==
X-Received: by 2002:a05:600c:b41:b0:3f7:eadb:941d with SMTP id
 k1-20020a05600c0b4100b003f7eadb941dmr1733473wmr.19.1686330589330; 
 Fri, 09 Jun 2023 10:09:49 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0ad500b003f7310a3ffasm3265526wmr.2.2023.06.09.10.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 10:09:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] drm/ssd130x: Set the page height value in the device
 info data
Date: Fri,  9 Jun 2023 19:09:38 +0200
Message-Id: <20230609170941.1150941-4-javierm@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609170941.1150941-1-javierm@redhat.com>
References: <20230609170941.1150941-1-javierm@redhat.com>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver only supports OLED controllers that have a page height of 8 but
there are devices that have different page heights. So it is better to not
hardcode this value and instead have it as a per controller data value.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

(no changes since v1)

 drivers/gpu/drm/solomon/ssd130x.c | 15 +++++++++++----
 drivers/gpu/drm/solomon/ssd130x.h |  1 +
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index a0e5e26c0bc9..5cac1149e34e 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -102,6 +102,7 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.default_width = 132,
 		.default_height = 64,
 		.page_mode_only = 1,
+		.page_height = 8,
 	},
 	[SSD1305_ID] = {
 		.default_vcomh = 0x34,
@@ -109,6 +110,7 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.default_dclk_frq = 7,
 		.default_width = 132,
 		.default_height = 64,
+		.page_height = 8,
 	},
 	[SSD1306_ID] = {
 		.default_vcomh = 0x20,
@@ -117,6 +119,7 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.need_chargepump = 1,
 		.default_width = 128,
 		.default_height = 64,
+		.page_height = 8,
 	},
 	[SSD1307_ID] = {
 		.default_vcomh = 0x20,
@@ -125,6 +128,7 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.need_pwm = 1,
 		.default_width = 128,
 		.default_height = 39,
+		.page_height = 8,
 	},
 	[SSD1309_ID] = {
 		.default_vcomh = 0x34,
@@ -132,6 +136,7 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.default_dclk_frq = 10,
 		.default_width = 128,
 		.default_height = 64,
+		.page_height = 8,
 	}
 };
 EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
@@ -437,7 +442,8 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x, u8 *buf,
 	unsigned int width = drm_rect_width(rect);
 	unsigned int height = drm_rect_height(rect);
 	unsigned int line_length = DIV_ROUND_UP(width, 8);
-	unsigned int pages = DIV_ROUND_UP(height, 8);
+	unsigned int page_height = ssd130x->device_info->page_height;
+	unsigned int pages = DIV_ROUND_UP(height, page_height);
 	struct drm_device *drm = &ssd130x->drm;
 	u32 array_idx = 0;
 	int ret, i, j, k;
@@ -559,16 +565,17 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
 				struct drm_rect *rect)
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
+	unsigned int page_height = ssd130x->device_info->page_height;
 	struct iosys_map dst;
 	unsigned int dst_pitch;
 	int ret = 0;
 	u8 *buf = NULL;
 
 	/* Align y to display page boundaries */
-	rect->y1 = round_down(rect->y1, 8);
-	rect->y2 = min_t(unsigned int, round_up(rect->y2, 8), ssd130x->height);
+	rect->y1 = round_down(rect->y1, page_height);
+	rect->y2 = min_t(unsigned int, round_up(rect->y2, page_height), ssd130x->height);
 
-	dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
+	dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), page_height);
 	buf = kcalloc(dst_pitch, drm_rect_height(rect), GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index a2bc8d75078b..87968b3e7fb8 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -39,6 +39,7 @@ struct ssd130x_deviceinfo {
 	u32 default_dclk_frq;
 	u32 default_width;
 	u32 default_height;
+	u32 page_height;
 	int need_pwm;
 	int need_chargepump;
 	bool page_mode_only;
-- 
2.40.1

