Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1843A2B2312
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 18:55:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB546E5CD;
	Fri, 13 Nov 2020 17:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FD76E5CA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 17:55:34 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id w24so9498061wmi.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 09:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W+H8gSv47GmnZ8PNmJXKOXGjnxoVWQS3wMbT7DJ1igU=;
 b=LOL3trtQ8wnpHXkIeRJV1OroFkfXkfPlxqLjRU/IJ22J63vMMxpRL0qiXTRmuA5+QB
 Ww6Km4uOTw2kzbVocgwOvwJMLV7gHyVZZzjOfwW3x3T4u3bqfjL10tvvHAsusCeoH6EC
 QRkOyMsR54K3NYvlo5RgNxy6Se4yh+4CGVjKf+yNFWUSS9mjsq/vyxyNBEItU+7eYdqe
 Ie4Oo30V0MSvgqg/ugaxW46hDqRWA4edqkIM5Tn/jFM9aYuarz0g4dmTugFDQUYwmWc6
 nJsodpeZj+eb+XdKLf23JuOmpUMJqZDBE/qi034ZibVCMDjGaKRGG2cvT0ozsnNTHq2H
 5Acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W+H8gSv47GmnZ8PNmJXKOXGjnxoVWQS3wMbT7DJ1igU=;
 b=DqgAkWH8nFHdD2Xz96tr016hv8PIGMOJi4LmXj+Mwr69+6I7ZZ5d/OZZ0zxX4/FDx0
 b30nUi0mYKqRDgI64QPVDT3b5x6qKhwYq5FpX+dEA/l+gqUhLeaDk3kv6H2rTdMCg3vD
 LPtXxdvEnF/l8h8dn4fGsIz0y7xIjcexhq2/ORAOchN650xYWuunrcmX8eZlSrEYRZZU
 hlz+tGdHPHrYJ2k2JOeycRWcY1/NZX2Z1/UC9m9GaT1i0y5hhGCdjyotYqmVCu7Y9avH
 xqguh5YWY9Q5oSgevOFMfU8sh9nbTYvagagnK0PslH+iP8j0jBj83z7Hy2w0V2jO8XjN
 SuGQ==
X-Gm-Message-State: AOAM5300SuWHhok7bJR5c82BWOEgn8vbAEAj4HPTeW9d38SsJr/H0hkU
 9zQTiz2cd798KqC700AqFzKJyA==
X-Google-Smtp-Source: ABdhPJwlVCwldF1pWbknahDpJulYrWqRowyQgY/B/XjJFZZqYib540NbOrKH/X6O7ysN7rDBlNW2FA==
X-Received: by 2002:a1c:5f45:: with SMTP id t66mr3451490wmb.132.1605290128046; 
 Fri, 13 Nov 2020 09:55:28 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:4cea:81e7:5fd4:93f7])
 by smtp.gmail.com with ESMTPSA id d2sm6834952wra.73.2020.11.13.09.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 09:55:27 -0800 (PST)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/fourcc: Fix modifier field mask for AMD modifiers.
Date: Fri, 13 Nov 2020 18:55:33 +0100
Message-Id: <20201113175533.731834-1-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.29.2
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DCC_MAX_COMPRESSED_BLOCK has to contain one of
AMD_FMT_MOD_DCC_BLOCK_* and with 3 values this doesn't
fit in 1 bit.

Fix this cleanly while it is only in drm-next.

Fixes: 8ba16d599374 ("drm/fourcc: Add AMD DRM modifiers.")
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 include/uapi/drm/drm_fourcc.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index df56e71a7380..a878664ba41c 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -1129,7 +1129,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define AMD_FMT_MOD_DCC_INDEPENDENT_128B_SHIFT 17
 #define AMD_FMT_MOD_DCC_INDEPENDENT_128B_MASK 0x1
 #define AMD_FMT_MOD_DCC_MAX_COMPRESSED_BLOCK_SHIFT 18
-#define AMD_FMT_MOD_DCC_MAX_COMPRESSED_BLOCK_MASK 0x1
+#define AMD_FMT_MOD_DCC_MAX_COMPRESSED_BLOCK_MASK 0x3
 
 /*
  * DCC supports embedding some clear colors directly in the DCC surface.
@@ -1140,7 +1140,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
  * If this bit is set that means the fastclear eliminate is not needed for these
  * embeddable colors.
  */
-#define AMD_FMT_MOD_DCC_CONSTANT_ENCODE_SHIFT 19
+#define AMD_FMT_MOD_DCC_CONSTANT_ENCODE_SHIFT 20
 #define AMD_FMT_MOD_DCC_CONSTANT_ENCODE_MASK 0x1
 
 /*
@@ -1153,15 +1153,15 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
  * RB = only for TILE_VER_GFX9 & DCC
  * PIPE = only for TILE_VER_GFX9 & DCC & (DCC_RETILE | DCC_PIPE_ALIGN)
  */
-#define AMD_FMT_MOD_PIPE_XOR_BITS_SHIFT 20
+#define AMD_FMT_MOD_PIPE_XOR_BITS_SHIFT 21
 #define AMD_FMT_MOD_PIPE_XOR_BITS_MASK 0x7
-#define AMD_FMT_MOD_BANK_XOR_BITS_SHIFT 23
+#define AMD_FMT_MOD_BANK_XOR_BITS_SHIFT 24
 #define AMD_FMT_MOD_BANK_XOR_BITS_MASK 0x7
-#define AMD_FMT_MOD_PACKERS_SHIFT 26 /* aliases with BANK_XOR_BITS */
+#define AMD_FMT_MOD_PACKERS_SHIFT 27 /* aliases with BANK_XOR_BITS */
 #define AMD_FMT_MOD_PACKERS_MASK 0x7
-#define AMD_FMT_MOD_RB_SHIFT 29
+#define AMD_FMT_MOD_RB_SHIFT 30
 #define AMD_FMT_MOD_RB_MASK 0x7
-#define AMD_FMT_MOD_PIPE_SHIFT 32
+#define AMD_FMT_MOD_PIPE_SHIFT 33
 #define AMD_FMT_MOD_PIPE_MASK 0x7
 
 #define AMD_FMT_MOD_SET(field, value) \
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
