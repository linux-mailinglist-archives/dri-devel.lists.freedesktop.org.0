Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C54C625DF46
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 18:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB49E6EC83;
	Fri,  4 Sep 2020 16:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956F06EC7E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 16:07:14 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w2so6566220wmi.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 09:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Ibsv6ddruejSLjMuLYQayhLrwfsZ1tQEXkqPyUvVh4=;
 b=YAVAaehYYIfBieDjs4F8kw5eQNMdaVEbMBNB9zFHabEuRqtunDkAxT1cWUDFQn/Brz
 t37znaEqUpNP9oMpB/fUI1v/DCCNo9zOynwhccJzS5M4TxlcU42RBdfTkMq5OjcTYfMw
 AtFK7B3kghhut1pnIMkU6SLWfYVxIDsiYcAa/pdCsaa4Nh4kU+ZKoOa1RT09IoSRgR/k
 VpaoaazeRFlXt7yjuC/1buHewm0Pn8R77uN+jqo2+7s/fcXwnsqXs9MPwxKl3ArK1iFM
 izdtF94yNA7WKer1EjfNoGJzlgDtlMUj+ulKd3zaUv/76akYK36aadqg2uOr+4UGEsVV
 Du1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Ibsv6ddruejSLjMuLYQayhLrwfsZ1tQEXkqPyUvVh4=;
 b=IwcBW/AYtfXdTr8cYqzVkXazsYDyVnFZPIyJWDl/queHdLUEd9C0E09wWLwWRBrLiw
 TtwBOnQziMtRY1TksX5t/j03VUuwq1q51hz2UlywqmQQy+3+d8F6JScGaT/XDQwruIKl
 BlSIU9oDfFmnJjpA596P8RGjgMxPZahyrJ91ItFlECsr6snEl8dplbPrBj0TWilWhKsz
 mlWcBmb/yFSR6i4M4Z8SgATVOPwOC6lXzEwJ5uqd3Tfe7O3X6X4sXbOZvZabkBcgQ+49
 W+M02Mew/P9Z9t+1ea0a9HWD4gS48QvqSn1U9IHsBhvMBmyrCqebwql/DvNpmyk5hcl4
 A7lg==
X-Gm-Message-State: AOAM53184XkBCV6aZ2iwDp75moW1Ualh9HmCbGWk5XrS2rYvKrHrTMzN
 c8Vk33KsOqlx2PAZ9ILmy6wyV+mdJTaafcRN0SI=
X-Google-Smtp-Source: ABdhPJw9O1W8ham7SmrSZRTf9vONyu4vtWeyFH4Tv4+10ugkgyUdeBDG/uVedzzkxU8OAcSF/fW4jw==
X-Received: by 2002:a1c:2086:: with SMTP id g128mr8363878wmg.89.1599235633174; 
 Fri, 04 Sep 2020 09:07:13 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:4cea:81e7:5fd4:93f7])
 by smtp.gmail.com with ESMTPSA id h185sm12467609wme.25.2020.09.04.09.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:07:12 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 04/11] drm/fourcc:  Add AMD DRM modifiers.
Date: Fri,  4 Sep 2020 18:07:02 +0200
Message-Id: <20200904160709.123970-5-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904160709.123970-1-bas@basnieuwenhuizen.nl>
References: <20200904160709.123970-1-bas@basnieuwenhuizen.nl>
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
Cc: maraeo@gmail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds modifiers for GFX9+ AMD GPUs.

As the modifiers need a lot of parameters I split things out in
getters and setters.
  - Advantage: simplifies the code a lot
  - Disadvantage: Makes it harder to check that you're setting all
                  the required fields.

The tiling modes seem to change every generatio, but the structure
of what each tiling mode is good for stays really similar. As such
the core of the modifier is
 - the tiling mode
 - a version. Not explicitly a GPU generation, but splitting out
   a new set of tiling equations.

Sometimes one or two tiling modes stay the same and for those we
specify a canonical version.

Then we have a bunch of parameters on how the compression works.
Different HW units have different requirements for these and we
actually have some conflicts here.

e.g. the render backends need a specific alignment but the display
unit only works with unaligned compression surfaces. To work around
that we have a DCC_RETILE option where both an aligned and unaligned
compression surface are allocated and a writer has to sync the
aligned surface to the unaligned surface on handoff.

Finally there are some GPU parameters that participate in the tiling
equations. These are constant for each GPU on the rendering/texturing
side. The display unit is very flexible however and supports all
of them :|

Some estimates:
 - Single GPU, render+texture: ~10 modifiers
 - All possible configs in a gen, display: ~1000 modifiers
 - Configs of actually existing GPUs in a gen: ~100 modifiers

For formats with a single plane everything gets put in a separate
DRM plane. However, this doesn't fit for some YUV formats, so if
the format has >1 plane, we let the driver pack the surfaces into
1 DRM plane per format plane.

This way we avoid X11 rendering onto the frontbuffer with DCC, but
still fit into 4 DRM planes.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 include/uapi/drm/drm_fourcc.h | 115 ++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 8bc0b31597d8..2f8d2b717285 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -804,6 +804,121 @@ extern "C" {
  */
 #define DRM_FORMAT_MOD_ALLWINNER_TILED fourcc_mod_code(ALLWINNER, 1)
 
+/*
+ * AMD modifiers
+ *
+ * Memory layout:
+ *
+ * without DCC:
+ *   - main surface
+ *
+ * with DCC & without DCC_RETILE:
+ *   - main surface in plane 0
+ *   - DCC surface in plane 1 (RB-aligned, pipe-aligned if DCC_PIPE_ALIGN is set)
+ *
+ * with DCC & DCC_RETILE:
+ *   - main surface in plane 0
+ *   - displayable DCC surface in plane 1 (not RB-aligned & not pipe-aligned)
+ *   - pipe-aligned DCC surface in plane 2 (RB-aligned & pipe-aligned)
+ *
+ * For multi-plane formats the above surfaces get merged into one plane for
+ * each for format plane, based on the required alignment only.
+ */
+#define AMD_FMT_MOD fourcc_mod_code(AMD, 0)
+
+#define IS_AMD_FMT_MOD(val) (((val) >> 56) == DRM_FORMAT_MOD_VENDOR_AMD)
+
+/* Reserve 0 for GFX8 and older */
+#define AMD_FMT_MOD_TILE_VER_GFX9 1
+#define AMD_FMT_MOD_TILE_VER_GFX10 2
+#define AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS 3
+
+/*
+ * 64K_S is the same for GFX9/GFX10/GFX10_RBPLUS and hence has GFX9 as canonical
+ * version.
+ */
+#define AMD_FMT_MOD_TILE_GFX9_64K_S 9
+
+/*
+ * 64K_D for non-32 bpp is the same for GFX9/GFX10/GFX10_RBPLUS and hence has
+ * GFX9 as canonical version.
+ */
+#define AMD_FMT_MOD_TILE_GFX9_64K_D 10
+#define AMD_FMT_MOD_TILE_GFX9_64K_S_X 25
+#define AMD_FMT_MOD_TILE_GFX9_64K_D_X 26
+#define AMD_FMT_MOD_TILE_GFX9_64K_R_X 27
+
+#define AMD_FMT_MOD_DCC_BLOCK_64B 0
+#define AMD_FMT_MOD_DCC_BLOCK_128B 1
+#define AMD_FMT_MOD_DCC_BLOCK_256B 2
+
+#define AMD_FMT_MOD_TILE_VERSION_SHIFT 0
+#define AMD_FMT_MOD_TILE_VERSION_MASK 0xFF
+#define AMD_FMT_MOD_TILE_SHIFT 8
+#define AMD_FMT_MOD_TILE_MASK 0x1F
+
+/* Whether DCC compression is enabled. */
+#define AMD_FMT_MOD_DCC_SHIFT 13
+#define AMD_FMT_MOD_DCC_MASK 0x1
+
+/*
+ * Whether to include two DCC surfaces, one which is rb & pipe aligned, and
+ * one which is not-aligned.
+ */
+#define AMD_FMT_MOD_DCC_RETILE_SHIFT 14
+#define AMD_FMT_MOD_DCC_RETILE_MASK 0x1
+
+/* Only set if DCC_RETILE = false */
+#define AMD_FMT_MOD_DCC_PIPE_ALIGN_SHIFT 15
+#define AMD_FMT_MOD_DCC_PIPE_ALIGN_MASK 0x1
+
+#define AMD_FMT_MOD_DCC_INDEPENDENT_64B_SHIFT 16
+#define AMD_FMT_MOD_DCC_INDEPENDENT_64B_MASK 0x1
+#define AMD_FMT_MOD_DCC_INDEPENDENT_128B_SHIFT 17
+#define AMD_FMT_MOD_DCC_INDEPENDENT_128B_MASK 0x1
+#define AMD_FMT_MOD_DCC_MAX_COMPRESSED_BLOCK_SHIFT 18
+#define AMD_FMT_MOD_DCC_MAX_COMPRESSED_BLOCK_MASK 0x1
+
+/*
+ * DCC supports embedding some clear colors directly in the DCC surface.
+ * However, on older GPUs the rendering HW ignores the embedded clear color
+ * and prefers the driver provided color. This necessitates doing a fastclear
+ * eliminate operation before a process transfers control.
+ *
+ * If this bit is set that means the fastclear eliminate is not needed for these
+ * embeddable colors.
+ */
+#define AMD_FMT_MOD_DCC_CONSTANT_ENCODE_SHIFT 19
+#define AMD_FMT_MOD_DCC_CONSTANT_ENCODE_MASK 0x1
+
+/*
+ * The below fields are for accounting for per GPU differences. These are only
+ * relevant for GFX9 and later and if the tile field is *_X/_T.
+ *
+ * PIPE_XOR_BITS = always needed
+ * BANK_XOR_BITS = only for TILE_VER_GFX9
+ * PACKERS = only for TILE_VER_GFX10_RBPLUS
+ * RB = only for TILE_VER_GFX9 & DCC
+ * PIPE = only for TILE_VER_GFX9 & DCC & (DCC_RETILE | DCC_PIPE_ALIGN)
+ */
+#define AMD_FMT_MOD_PIPE_XOR_BITS_SHIFT 20
+#define AMD_FMT_MOD_PIPE_XOR_BITS_MASK 0x7
+#define AMD_FMT_MOD_BANK_XOR_BITS_SHIFT 23
+#define AMD_FMT_MOD_BANK_XOR_BITS_MASK 0x7
+#define AMD_FMT_MOD_PACKERS_SHIFT 26 /* aliases with BANK_XOR_BITS */
+#define AMD_FMT_MOD_PACKERS_MASK 0x7
+#define AMD_FMT_MOD_RB_SHIFT 29
+#define AMD_FMT_MOD_RB_MASK 0x7
+#define AMD_FMT_MOD_PIPE_SHIFT 32
+#define AMD_FMT_MOD_PIPE_MASK 0x7
+
+#define AMD_FMT_MOD_SET(field, value) \
+	((uint64_t)(value) << AMD_FMT_MOD_##field##_SHIFT)
+#define AMD_FMT_MOD_GET(field, value) \
+	(((value) >> AMD_FMT_MOD_##field##_SHIFT) & AMD_FMT_MOD_##field##_MASK)
+#define AMD_FMT_MOD_CLEAR(field) \
+	(~((uint64_t)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
