Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D19CC2135D3
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 10:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A216EA17;
	Fri,  3 Jul 2020 08:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5EC6EA16
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 08:07:45 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id o2so33087379wmh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 01:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LrAaYs53s/z1iv5bVLRtnzC+1Oun/iXiyK2qaKijDuU=;
 b=Laus+5j3YNevclRYYUCi4YVDK91XWl8BUwxhii80Ed/v0IggUlAan8JZ4E8+3CFXli
 X3Cygr/7qIG41o4kOs9ipx+mQpAjiaxoWIYVeZ0ZNDopMdGXNycAi4MNSdDBi7UybeX2
 JYBvxGgGQXs+jSZYUdf7eYviqIag8z5oU68CnZFA+EOCqnurd+VJK46c6jAAtJz1wtxC
 EwKSuQZl49S+L4VGV8Q9qdtb+7Y+w4BeRCXqvUuiciKd1JXZam39V/Y1W3M0D0UOYsnL
 yw+yGjxKoyJI6iQlxzTVYDBQsBysHuz4Ip5U3FzVra5M8WnW/ITD/PoOKyBcv3hcAcVV
 9rvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LrAaYs53s/z1iv5bVLRtnzC+1Oun/iXiyK2qaKijDuU=;
 b=cSBoXTT/WXaNhum66rr3yV5ZAjvvtPBeAY0Za63A+QfFU2M/pqAua9MfB+tCf7OPml
 rK0FzZYa3MIL+GXoAomCgB6rG8OaKZdK/gyGHh8LkYio0sQtD7UcRPYEfT15EcLhdc9p
 oaWHQKJBUgADSPiQAt1QzSqBbkwgO5Y4twwvWbQb8jRRa7zD2PIS6Gq2HaF6EvIMqHcd
 7M9/cnG+DxtZQB64cgYIwwCBnsrAqVCU1N3n+OsqHl9JDGeZgLOBabxueqfYc/sPXX+p
 DdcJFeqK0bEXOJROurfnKBt6+vyBMYkt9y1Za58ri0RSJMYlL0xjCnQfqr0tut0c+qSv
 Bmow==
X-Gm-Message-State: AOAM532d8qcNcsSqrrNuJJkQc4X6F56C7g5Nj5lC+iRn8RbB0Z5SQT6r
 4RNouFZ7t9gAI9xpSW5nmp+8zg==
X-Google-Smtp-Source: ABdhPJzX5k1i5r8s9fDNvSWDNAPPRelDlrCD79abcF4sbtYxOfHwj8r0iEmeXN9k9vmXsKp9KAMilw==
X-Received: by 2002:a1c:2906:: with SMTP id p6mr35885064wmp.68.1593763663665; 
 Fri, 03 Jul 2020 01:07:43 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:6959:e617:6562:cabf])
 by smtp.gmail.com with ESMTPSA id 1sm12682403wmf.0.2020.07.03.01.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 01:07:42 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 4/6] drm/meson: overlay: setup overlay for Amlogic FBC
 Memory Saving mode
Date: Fri,  3 Jul 2020 10:07:26 +0200
Message-Id: <20200703080728.25207-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200703080728.25207-1-narmstrong@baylibre.com>
References: <20200703080728.25207-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
Cc: jianxin.pan@amlogic.com, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Setup the Amlogic FBC decoder for the VD1 video overlay plane to use
a different superblock size for the Memory Saving mode.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/gpu/drm/meson/meson_overlay.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 293f606ba164..1566a887d482 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -486,6 +486,10 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 					  AFBC_HOLD_LINE_NUM(8) |
 					  AFBC_BURST_LEN(2);
 
+		if (fb->modifier & DRM_FORMAT_MOD_AMLOGIC_FBC(0,
+						AMLOGIC_FBC_OPTION_MEM_SAVING))
+			priv->viu.vd1_afbc_mode |= AFBC_BLK_MEM_MODE;
+
 		priv->viu.vd1_afbc_en = 0x1600 | AFBC_DEC_ENABLE;
 
 		priv->viu.vd1_afbc_conv_ctrl = AFBC_CONV_LBUF_LEN(256);
@@ -671,12 +675,17 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 	}
 
 	if (priv->viu.vd1_afbc) {
+		/* Default mode is 4k per superblock */
+		unsigned long block_size = 4096;
 		unsigned long body_size;
 
-		/* Default mode is 4k per superblock */
+		/* 8bit mem saving mode is 3072bytes per superblock */
+		if (priv->viu.vd1_afbc_mode & AFBC_BLK_MEM_MODE)
+			block_size = 3072;
+
 		body_size = (ALIGN(priv->viu.vd1_stride0, 64) / 64) *
 			    (ALIGN(priv->viu.vd1_height0, 32) / 32) *
-			    4096;
+			    block_size;
 
 		priv->viu.vd1_afbc_body_addr = priv->viu.vd1_addr0 >> 4;
 
@@ -734,6 +743,9 @@ static bool meson_overlay_format_mod_supported(struct drm_plane *plane,
 		unsigned int layout = modifier &
 			DRM_FORMAT_MOD_AMLOGIC_FBC(
 				__fourcc_mod_amlogic_layout_mask, 0);
+		unsigned int options =
+			(modifier >> __fourcc_mod_amlogic_options_shift) &
+			__fourcc_mod_amlogic_options_mask;
 
 		if (format != DRM_FORMAT_YUV420_8BIT &&
 		    format != DRM_FORMAT_YUV420_10BIT) {
@@ -748,6 +760,13 @@ static bool meson_overlay_format_mod_supported(struct drm_plane *plane,
 			return false;
 		}
 
+		if (options &&
+		    options != AMLOGIC_FBC_OPTION_MEM_SAVING) {
+			DRM_DEBUG_KMS("%llx invalid layout %x\n",
+				      modifier, layout);
+			return false;
+		}
+
 		return true;
 	}
 
@@ -781,6 +800,8 @@ static const uint32_t supported_drm_formats[] = {
 };
 
 static const uint64_t format_modifiers[] = {
+	DRM_FORMAT_MOD_AMLOGIC_FBC(AMLOGIC_FBC_LAYOUT_BASIC,
+				   AMLOGIC_FBC_OPTION_MEM_SAVING),
 	DRM_FORMAT_MOD_AMLOGIC_FBC(AMLOGIC_FBC_LAYOUT_BASIC, 0),
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID,
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
