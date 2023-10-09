Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E04CA7BE9A1
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D45210E2BC;
	Mon,  9 Oct 2023 18:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C26C10E2BC
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 18:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696876586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j5ZrsHwzLorvUYPP8a8dcsR2FiW1aaopcCHsyKU7r9w=;
 b=XPmxasJlcU753qVmr0YVbBbmc0atS/oc9rgntHMMBtMa+YHJcpOio3LVixE9tcOw6WaCIL
 dBYIgYvQN8LZi5FyykaUmVUUdV30fCWQLURgrvSTvh5JgmBgLc8IuzcKw6aLNMEp5dY43M
 X3hHrdWe5qNmO8TLKchI7wIdiHzRP1g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-YBZxkFXON5uhw8ebi8NMpQ-1; Mon, 09 Oct 2023 14:36:05 -0400
X-MC-Unique: YBZxkFXON5uhw8ebi8NMpQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30e4943ca7fso3409624f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 11:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696876564; x=1697481364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j5ZrsHwzLorvUYPP8a8dcsR2FiW1aaopcCHsyKU7r9w=;
 b=Fdj3KRZKO67wPBrg/W9WLOJOW3aq46xnCIXy38kEJq54Dp5GIoXm8mKlUxYUWL1cS4
 o6dEK9kT6iviMIKSYCHmAi8HIiU8XFj2PtgnGCg+Mv2ET4hhvYalbvY+6d776l0o073C
 4Ql4rEihtLrszusIs9EKdAfq7bm6Jc2ldFY0q9JOnOyjWS1wu3vChPOxf64lwLo/hlA3
 j82sVwtyBQHQVI1gzCrMIyxJDduHqDUq6Fw4GHqHQoHAEiU2gYm8RVo9WL8izTnzDrDc
 nD9XzwVsHQO8UTayVLq2h65ckuaWTJ+iHFh/9nQ1Uf8f3ERTOYyzga4S0EQ9oTZLNknP
 s74A==
X-Gm-Message-State: AOJu0Yz9De+c06hCSeGVVSg831/B2B3wojPwvWFi4FTgFjtR1N/ApMvA
 RSQEoF+HJ53GWGeBAZqudRNm9lliEVfHhD3Mq0nHVfZk3Znc5kOOkKnZmWNghXrdRfLaFT5uuYO
 oX0493y4MB9mHMkBxHi2x11koNSRw
X-Received: by 2002:a5d:5187:0:b0:31f:ec06:20f with SMTP id
 k7-20020a5d5187000000b0031fec06020fmr13559049wrv.14.1696876564202; 
 Mon, 09 Oct 2023 11:36:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqZW1dmkwdaHjEnu5wPTZrKs4GUXK67CJwBipf1KKjzq7yNzfyAyt2SuzJkZ1eYkixZxo4Qg==
X-Received: by 2002:a5d:5187:0:b0:31f:ec06:20f with SMTP id
 k7-20020a5d5187000000b0031fec06020fmr13559037wrv.14.1696876563940; 
 Mon, 09 Oct 2023 11:36:03 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x8-20020adfcc08000000b003296bb21c77sm9747623wrh.80.2023.10.09.11.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:36:03 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] drm/ssd13xx: Use drm_format_info_min_pitch() to calculate
 the dest_pitch
Date: Mon,  9 Oct 2023 20:34:18 +0200
Message-ID: <20231009183522.543918-5-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009183522.543918-1-javierm@redhat.com>
References: <20231009183522.543918-1-javierm@redhat.com>
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

Don't assume bpp of 1 and instead compute the destination pitch using the
intermediate buffer pixel format info when doing a format conversion.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd13xx.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd13xx.c b/drivers/gpu/drm/solomon/ssd13xx.c
index d29be17665b5..9747f8656636 100644
--- a/drivers/gpu/drm/solomon/ssd13xx.c
+++ b/drivers/gpu/drm/solomon/ssd13xx.c
@@ -148,6 +148,8 @@ struct ssd13xx_plane_state {
 	struct drm_shadow_plane_state base;
 	/* Intermediate buffer to convert pixels from XRGB8888 to HW format */
 	u8 *buffer;
+	/* Pixel format info for the intermediate buffer */
+	const struct drm_format_info *fi;
 };
 
 static inline struct ssd13xx_crtc_state *to_ssd13xx_crtc_state(struct drm_crtc_state *state)
@@ -602,8 +604,9 @@ static void ssd13xx_clear_screen(struct ssd13xx_device *ssd13xx, u8 *data_array)
 
 static int ssd13xx_fb_blit_rect(struct drm_framebuffer *fb,
 				const struct iosys_map *vmap,
-				struct drm_rect *rect,
-				u8 *buf, u8 *data_array)
+				struct drm_rect *rect, u8 *buf,
+				const struct drm_format_info *fi,
+				u8 *data_array)
 {
 	struct ssd13xx_device *ssd13xx = drm_to_ssd13xx(fb->dev);
 	struct iosys_map dst;
@@ -614,7 +617,7 @@ static int ssd13xx_fb_blit_rect(struct drm_framebuffer *fb,
 	rect->y1 = round_down(rect->y1, SSD130X_PAGE_HEIGHT);
 	rect->y2 = min_t(unsigned int, round_up(rect->y2, SSD130X_PAGE_HEIGHT), ssd13xx->height);
 
-	dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
+	dst_pitch = drm_format_info_min_pitch(fi, 0, drm_rect_width(rect));
 
 	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
 	if (ret)
@@ -664,6 +667,8 @@ static int ssd13xx_primary_plane_atomic_check(struct drm_plane *plane,
 	if (!ssd13xx_state->buffer)
 		return -ENOMEM;
 
+	ssd13xx_state->fi = fi;
+
 	return 0;
 }
 
@@ -695,6 +700,7 @@ static void ssd13xx_primary_plane_atomic_update(struct drm_plane *plane,
 
 		ssd13xx_fb_blit_rect(fb, &shadow_plane_state->data[0], &dst_clip,
 				     ssd13xx_plane_state->buffer,
+				     ssd13xx_plane_state->fi,
 				     ssd13xx_crtc_state->data_array);
 	}
 
-- 
2.41.0

