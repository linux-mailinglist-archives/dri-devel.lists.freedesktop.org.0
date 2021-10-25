Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ACD43A16B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 21:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486A16E207;
	Mon, 25 Oct 2021 19:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D4D6E207
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 19:37:16 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id k28so20183692uaa.10
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 12:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vTJgeD6lPy222typZ3Q5onBN26bymP3kzPrhRNt/7Mo=;
 b=UhdUzw7RZQG5A2XwZjEsGAPXXWws8ksxEHvolJG/p4VAQhZa4f7PcQ7P0mj6j73SOh
 3nSbVm1IPtKeEX/gjJ7kns2hs6F37Tc7FkX1noWLWhBWwm39YqqLyyLj7JEmgjd4he+t
 zYk2ErMvC4vdaA51nFwEeM/dacIhjEi5tewQ5BvFUtDCord/gMTO68hbRUwUsGapKpn7
 vF3wEvQCjTf/imB5rSA+lf4boTHikPwyiPHr2BPfbw90UF/rREsKsbPUYeno1oSMdefu
 rf0zHvoJI4+Tf0zQ60bPYuZe7IDuiVuPHJnD2PFdgLHbY34t+8a/Aa+zXYbpX6Ytyeq0
 vSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vTJgeD6lPy222typZ3Q5onBN26bymP3kzPrhRNt/7Mo=;
 b=Ho/UVKcz6N+z0d4bPwpmm0bHPvVfWSlpgJjpw3dTlspS1YeYHcqPWA9GmTlkSr+GW+
 uDKmzja2l1DSxxhU1LDMu8MPeZo0AKpYlXtTFduuy2DATqbGZtnanQrCiUTdZKLm/RQi
 TD3Krfh3YYj+arkeDjNHb0mux7paFUKfxe5iOiUWGaQz37iBt5hDqJ9Acy6fBXKepJlr
 KvFe9e1ZWYjrB2iJV/MM4oIUrLJzbY0eXRzDYYygusZ2AG2QTp0A/PKshgH6/tyYiXAK
 vt8gZWy+R407+iGlG9WTTv6aTXYBt15IgfWWmtuKHMgWnZHxh5r0zitMZYFnxtcwxXkz
 M4Nw==
X-Gm-Message-State: AOAM530M2I2/qWNjKG/7CeOUgELYmz2tP+DQstc95HiUV4cizRJyJy8m
 MmUUFHuCEdIixFGOLJbH+ek=
X-Google-Smtp-Source: ABdhPJxlv+3Fl/EI2C9ZKJbhHrTP92hgZ7yIviZFixOx4+b1z+2+car1+0+u6nf9a5TngNljcuv3BA==
X-Received: by 2002:a67:ed5a:: with SMTP id m26mr17103662vsp.35.1635190635918; 
 Mon, 25 Oct 2021 12:37:15 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:5469:b11e:67b8:49d2:1744])
 by smtp.googlemail.com with ESMTPSA id k1sm10722013uaq.0.2021.10.25.12.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 12:37:15 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Cc: Igor Torrente <igormtorrente@gmail.com>, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, airlied@linux.ie, contact@emersion.fr,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/8] drm: vkms: Exposes ARGB_1616161616 and adds
 XRGB_16161616 formats
Date: Mon, 25 Oct 2021 16:34:43 -0300
Message-Id: <20211025193444.131207-8-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211025193444.131207-1-igormtorrente@gmail.com>
References: <20211025193444.131207-1-igormtorrente@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This will be useful to write tests that depends on these formats.

ARGB format is already used as the universal format for internal uses.
Here we are just exposing it to the user space.

XRGB follows the a similar implementation of the former format.
Just overwriting the alpha channel.

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c  |  4 ++++
 drivers/gpu/drm/vkms/vkms_formats.h   | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c     |  5 ++++-
 drivers/gpu/drm/vkms/vkms_writeback.c |  2 ++
 4 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 69fe3a89bdc9..f16fcfc88cea 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -164,6 +164,8 @@ static void ((*get_line_fmt_transform_function(u32 format))
 		return &ARGB8888_to_ARGB16161616;
 	else if (format == DRM_FORMAT_ARGB16161616)
 		return &get_ARGB16161616;
+	else if (format == DRM_FORMAT_XRGB16161616)
+		return &XRGB16161616_to_ARGB16161616;
 	else
 		return &XRGB8888_to_ARGB16161616;
 }
@@ -175,6 +177,8 @@ static void ((*get_output_line_function(u32 format))
 		return &convert_to_ARGB8888;
 	else if (format == DRM_FORMAT_ARGB16161616)
 		return &convert_to_ARGB16161616;
+	else if (format == DRM_FORMAT_XRGB16161616)
+		return &convert_to_XRGB16161616;
 	else
 		return &convert_to_XRGB8888;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index 5b850fce69f3..aa433edd00bd 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -89,6 +89,19 @@ static void get_ARGB16161616(void *pixels_addr, int length, u64 *line_buffer)
 	}
 }
 
+static void XRGB16161616_to_ARGB16161616(void *pixels_addr, int length,
+					 u64 *line_buffer)
+{
+	__le64 *src_pixels = pixels_addr;
+	int i;
+
+	for (i = 0; i < length; i++) {
+		line_buffer[i] = le64_to_cpu(*src_pixels) | (0xffffllu << 48);
+
+		src_pixels++;
+	}
+}
+
 /*
  * The following functions are used as blend operations. But unlike the
  * `alpha_blend`, these functions take an ARGB16161616 pixel from the
@@ -152,4 +165,16 @@ static void convert_to_ARGB16161616(void *pixels_addr, int length,
 	}
 }
 
+static void convert_to_XRGB16161616(void *pixels_addr, int length,
+				    u64 *line_buffer)
+{
+	__le64 *dst_pixels = pixels_addr;
+	int i;
+
+	for (i = 0; i < length; i++) {
+		*dst_pixels = cpu_to_le64(line_buffer[i] | (0xffffllu << 48));
+		dst_pixels++;
+	}
+}
+
 #endif /* _VKMS_FORMATS_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 0a28cb7a85e2..516e48b38806 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -13,11 +13,14 @@
 
 static const u32 vkms_formats[] = {
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XRGB16161616
 };
 
 static const u32 vkms_plane_formats[] = {
 	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_XRGB8888
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XRGB16161616,
+	DRM_FORMAT_ARGB16161616
 };
 
 static struct drm_plane_state *
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 42f3396c523a..0f7bb77f981e 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -14,6 +14,8 @@
 
 static const u32 vkms_wb_formats[] = {
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XRGB16161616,
+	DRM_FORMAT_ARGB16161616
 };
 
 static const struct drm_connector_funcs vkms_wb_connector_funcs = {
-- 
2.30.2

