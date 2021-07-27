Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0663C3D8015
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 23:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085C86EA3B;
	Tue, 27 Jul 2021 21:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8BE6E835
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 20:59:14 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 a4-20020a17090aa504b0290176a0d2b67aso6632988pjq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 13:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5dgtbc2dgc03WrB3zCW8xCKeemPdJxAysWeYGPrb2AU=;
 b=F8BhKjlELwZQZC/NHilmj8UHyJiciojqkD21zu2phAh9IjoM/fxQim890WscudGWkn
 ITiddmP/I7AMAah42EqEpj+RLkluZCVZ837vhUSZ98pD/iRc3avt5dWcp6Jyky58KYKr
 5cCh2GoKzu208b1IjBoT3Lt5g7EZOYb86oyL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5dgtbc2dgc03WrB3zCW8xCKeemPdJxAysWeYGPrb2AU=;
 b=qbl0Bz3L6NylqUeTESUtxopKAncFa2TsHrJ4bOqwl0vh/8JVHq1EbiIIeLd1x8Hrr/
 0J0UUaLLTjymfLc8lKBsiroH4PpNYoznz4bC1Ht/7GZudZdMw9lJC4isCYptUjCgNtsQ
 xUPKZDFWWY/AsvTWShSehoeXW/2Og8CVASjy3J1w6KxMAUjZYHCUjWsq+/FQS600oRoz
 MABZheLnIsJg/zy7tyuUQtKCVUAMaNIN0yyP1w6nJ+2E/0IWgUpPI2DV80LFgsvYlP1o
 DIH99Wt0OOzvvVFMyftsOa4DkgCQ6rDsL/hStoKEtheNyvVN6f/JGmHJyQMWuzGf5ALi
 aKsg==
X-Gm-Message-State: AOAM532nIqwXVJJBj7WRgshSWtKJhHmCznBEeBZ+bKlWenBndcTty6SE
 7YdQNs+NhbCUOYsu9aPWo9lisg==
X-Google-Smtp-Source: ABdhPJzHaCRGy5F+C/0IwVa3T6DxyU5SU0Rk1IFN+C3HrONrQCAZIHyVl0Jwr71UKmZc4kOAdrOx9Q==
X-Received: by 2002:a17:90a:9511:: with SMTP id
 t17mr6099598pjo.194.1627419553892; 
 Tue, 27 Jul 2021 13:59:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j185sm977660pfb.86.2021.07.27.13.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 13:59:09 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 25/64] drm/mga/mga_ioc32: Use struct_group() for memcpy()
 region
Date: Tue, 27 Jul 2021 13:58:16 -0700
Message-Id: <20210727205855.411487-26-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4623; h=from:subject;
 bh=k+K5bstPCbcyrh+sSnGNbOYkreiUUA/e+oUv7j7SsRI=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOF7lb8jaGmB5ldx4AxyJ1hPHdl4meiY4XD8VCT
 /iMBLayJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzhQAKCRCJcvTf3G3AJvoJD/
 92twoEjqLmo87BW6EPdn7+I36/Lfz4+EvdPI46UzDmOPeZZUdda/FVtlnjMfEf8Q7C65xjksxGuB11
 ICT3mXYX/OI+OAHyDSDJYypVceEdn64IHFBqpq/oGwo5Yb3yImt3/puNdHix7T+reDMD9k3/10f1ea
 64Pu/new1rtTnvCeLNrJVYFxo0r1FdR5tKQNjHTB90tHMLn2iIIKqbGXb20uLxtV+x7a+H7Us4Yvg3
 jBkDEA9pd2OgCVOKGOgKUslD+d3uAxjiRTujQwyQFyuAcD0eO5bQmNCY2KVkY+N60I7KJX/+7VpO5f
 qXqg2QaavL2tumHBfYyNzwOsb6LN7zfwVX0ckRUzhnavSPV/D+qSZF3dIhW70wEeMyjzR0utNMhCoC
 xrhy6krEgk3kh6c5GIkeWWNBw1+HaHq84ZW7T0ZralGra2hddUdIcxJyigKD3DhXNPHoV1jCEMnjsR
 j27XJySoAwc8IRtRRcu1+lBrjuaYvhUsBhqRGiDppkxlrH8BYE9FWSEkYmo2/nR/nqvaO5kWIGopgr
 mtojfttWXR/DK1oruTB5GXelPdoUZCcw1LKaQBQtAAO+8wvNFMXwZCmCS87o/0cJrigkN+rbxsB6Fr
 kAar1dAvIQiU7igsE6A2DuLJrW43uIMso5wzoAuX6TFDDP3PcPS65gbtCqYg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, netdev@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memcpy(), memmove(), and memset(), avoid
intentionally writing across neighboring fields.

Use struct_group() in struct drm32_mga_init around members chipset, sgram,
maccess, fb_cpp, front_offset, front_pitch, back_offset, back_pitch,
depth_cpp, depth_offset, depth_pitch, texture_offset, and texture_size,
so they can be referenced together. This will allow memcpy() and sizeof()
to more easily reason about sizes, improve readability, and avoid future
warnings about writing beyond the end of chipset.

"pahole" shows no size nor member offset changes to struct drm32_mga_init.
"objdump -d" shows no meaningful object code changes (i.e. only source
line number induced differences and optimizations).

Note that since this includes a UAPI header, struct_group() has been
explicitly redefined local to the header.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/mga/mga_ioc32.c | 30 ++++++++++++++------------
 include/uapi/drm/mga_drm.h      | 37 ++++++++++++++++++++++++---------
 2 files changed, 44 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/mga/mga_ioc32.c b/drivers/gpu/drm/mga/mga_ioc32.c
index 4fd4de16cd32..fbd0329dbd4f 100644
--- a/drivers/gpu/drm/mga/mga_ioc32.c
+++ b/drivers/gpu/drm/mga/mga_ioc32.c
@@ -38,16 +38,21 @@
 typedef struct drm32_mga_init {
 	int func;
 	u32 sarea_priv_offset;
-	int chipset;
-	int sgram;
-	unsigned int maccess;
-	unsigned int fb_cpp;
-	unsigned int front_offset, front_pitch;
-	unsigned int back_offset, back_pitch;
-	unsigned int depth_cpp;
-	unsigned int depth_offset, depth_pitch;
-	unsigned int texture_offset[MGA_NR_TEX_HEAPS];
-	unsigned int texture_size[MGA_NR_TEX_HEAPS];
+	struct_group(always32bit,
+		int chipset;
+		int sgram;
+		unsigned int maccess;
+		unsigned int fb_cpp;
+		unsigned int front_offset;
+		unsigned int front_pitch;
+		unsigned int back_offset;
+		unsigned int back_pitch;
+		unsigned int depth_cpp;
+		unsigned int depth_offset;
+		unsigned int depth_pitch;
+		unsigned int texture_offset[MGA_NR_TEX_HEAPS];
+		unsigned int texture_size[MGA_NR_TEX_HEAPS];
+	);
 	u32 fb_offset;
 	u32 mmio_offset;
 	u32 status_offset;
@@ -67,9 +72,8 @@ static int compat_mga_init(struct file *file, unsigned int cmd,
 
 	init.func = init32.func;
 	init.sarea_priv_offset = init32.sarea_priv_offset;
-	memcpy(&init.chipset, &init32.chipset,
-		offsetof(drm_mga_init_t, fb_offset) -
-		offsetof(drm_mga_init_t, chipset));
+	memcpy(&init.always32bit, &init32.always32bit,
+	       sizeof(init32.always32bit));
 	init.fb_offset = init32.fb_offset;
 	init.mmio_offset = init32.mmio_offset;
 	init.status_offset = init32.status_offset;
diff --git a/include/uapi/drm/mga_drm.h b/include/uapi/drm/mga_drm.h
index 8c4337548ab5..61612e5ecab2 100644
--- a/include/uapi/drm/mga_drm.h
+++ b/include/uapi/drm/mga_drm.h
@@ -265,6 +265,16 @@ typedef struct _drm_mga_sarea {
 #define DRM_IOCTL_MGA_WAIT_FENCE    DRM_IOWR(DRM_COMMAND_BASE + DRM_MGA_WAIT_FENCE, __u32)
 #define DRM_IOCTL_MGA_DMA_BOOTSTRAP DRM_IOWR(DRM_COMMAND_BASE + DRM_MGA_DMA_BOOTSTRAP, drm_mga_dma_bootstrap_t)
 
+#define __struct_group(name, fields) \
+	union { \
+		struct { \
+			fields \
+		}; \
+		struct { \
+			fields \
+		} name; \
+	}
+
 typedef struct _drm_mga_warp_index {
 	int installed;
 	unsigned long phys_addr;
@@ -279,20 +289,25 @@ typedef struct drm_mga_init {
 
 	unsigned long sarea_priv_offset;
 
-	int chipset;
-	int sgram;
+	__struct_group(always32bit,
+		int chipset;
+		int sgram;
 
-	unsigned int maccess;
+		unsigned int maccess;
 
-	unsigned int fb_cpp;
-	unsigned int front_offset, front_pitch;
-	unsigned int back_offset, back_pitch;
+		unsigned int fb_cpp;
+		unsigned int front_offset;
+		unsigned int front_pitch;
+		unsigned int back_offset;
+		unsigned int back_pitch;
 
-	unsigned int depth_cpp;
-	unsigned int depth_offset, depth_pitch;
+		unsigned int depth_cpp;
+		unsigned int depth_offset;
+		unsigned int depth_pitch;
 
-	unsigned int texture_offset[MGA_NR_TEX_HEAPS];
-	unsigned int texture_size[MGA_NR_TEX_HEAPS];
+		unsigned int texture_offset[MGA_NR_TEX_HEAPS];
+		unsigned int texture_size[MGA_NR_TEX_HEAPS];
+	);
 
 	unsigned long fb_offset;
 	unsigned long mmio_offset;
@@ -302,6 +317,8 @@ typedef struct drm_mga_init {
 	unsigned long buffers_offset;
 } drm_mga_init_t;
 
+#undef __struct_group
+
 typedef struct drm_mga_dma_bootstrap {
 	/**
 	 * \name AGP texture region
-- 
2.30.2

