Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F10192B205F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 17:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450786E536;
	Fri, 13 Nov 2020 16:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56F86E52A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 16:25:57 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s13so8968803wmh.4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 08:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Oj64UVS3kgQm4nYE9V200203c/VtFiAEvLoYxu+fXfc=;
 b=UYan0Il/LECFTOjE1jxMAd7W+tB0yaJrmCL9/UlDohWUErEUANJRG0qMCctUFEtmap
 DH/g7KKPm7svJ4gwCTX9Nq2Swa2pOjwAFUOpEoxwlE57digCg4eyvUE3xkffq8FIJSDu
 Q8Vw3R+BS+/fv0Yn8gBtxTWOZJ5X5qhElNCObIItytDIfb21XNlWOPyWH6IF8ApGmH84
 yMlJCxUHxZJWp5ogjlE8I/guzrYj/fQejl7AsumCDqT9TV7AvP8aHjfGtVbCGqBONkwI
 IFjacp3JSEY1ZFkFe+LwLuXKz4sotjuNKwGSTaBCRkVRAGS+c6ZFGmK6UcxkBCdhJj2Y
 r+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Oj64UVS3kgQm4nYE9V200203c/VtFiAEvLoYxu+fXfc=;
 b=szHtSCuM1vro3ZCZxno7gPHKE/XTH4Q8enyJKJ7DXiF46M7ZLXHC2UJgUzLn9T5AtD
 AZwbBnZ9r4ullmi83zJSyXQvEe14Id0Sh8rqU+UUYjd+71YDKXqLRDYyn4z0tCH78xOJ
 hhX3M/3g30330foMc9BIYNqgmOlRb0tRRnYsYvnLbzbbbuE8lH2Mw/KdlhVqK8eKbPDr
 YEBjx4/5cU50ruJprUFCuwWADd5xuul7qtzcoLwYpPZjMkI+H7MKc519CclLra4okvDv
 51HBuQIWvCPe6MqjMtV5dqFWIeDffHTp6SBmdjYNoS3t3R+Fbr6tEFdEmNSQ65IBiCMI
 vpMA==
X-Gm-Message-State: AOAM530vrXa6VydSCTTdUVJ/h1BKHtgRTgnXv5b/HL51q+KCNQ9SHpLt
 GL7228ihQX8/P5dn6VOJ5C6NCA==
X-Google-Smtp-Source: ABdhPJybrJSZnkN1l7XOxLa42UIPyopLxcADFPH/N1z/7z0qof8Q09KUbemjYVqBoYCyTkUZhDH3BA==
X-Received: by 2002:a1c:1982:: with SMTP id 124mr3310829wmz.74.1605284751561; 
 Fri, 13 Nov 2020 08:25:51 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:4cea:81e7:5fd4:93f7])
 by smtp.gmail.com with ESMTPSA id c8sm11111151wrv.26.2020.11.13.08.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 08:25:50 -0800 (PST)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/fourcc: Fix modifier field mask for AMD modifiers.
Date: Fri, 13 Nov 2020 17:25:56 +0100
Message-Id: <20201113162556.672966-1-bas@basnieuwenhuizen.nl>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DCC_MAX_COMPRESSED_BLOCK has to contain one of
AMD_FMT_MOD_DCC_BLOCK_* and with 3 values this doesn't
fit in 1 bit.

Fix this cleanly while it is only in drm-next.

Fixes: 8ba16d5993749c3f31fd2b49e16f0dc1e1770b9c
---

Found while reviewing Simon's drm_info PR: https://github.com/ascent12/drm_info/pull/63/commits/eaeae6ee78764a03d959cbc97c8b514f81a94c63

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
