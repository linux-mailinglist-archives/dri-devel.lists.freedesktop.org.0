Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4E44F88E9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 23:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6CB10E05B;
	Thu,  7 Apr 2022 21:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AE110E05B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 21:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649368025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zm4Kc2Z38sFTwVni4XsdHNcmNLb8rSRyAxAWAT7EHNc=;
 b=O9MXevtXlaZ+ILrTJNFDIzJKRBsP26HIy2onNG1ExAu+LmMtFeo5kRkitVt7DRE6Ya1xaj
 RG1uWq7Yxjrjr0tZUp9BrtcV/U/j/x9JfbLBQR8WEj9hbs9B5EPbd3xzOQKIeWPBFFLSkS
 bufMYF6GhVD6e3HqMsnh6e/RZm/kpIU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-5OTkuIR5M6iavSqr0mVXDQ-1; Thu, 07 Apr 2022 17:47:04 -0400
X-MC-Unique: 5OTkuIR5M6iavSqr0mVXDQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 u8-20020ac858c8000000b002e1b3ceb167so6445047qta.10
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 14:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zm4Kc2Z38sFTwVni4XsdHNcmNLb8rSRyAxAWAT7EHNc=;
 b=Kwxi5rxcVTqICYzcJn4kiOjU4JkKzurFeOcuaeR+y6vRxxnbTSiAjHvNs0LzghYEXW
 rk5NMRT8ycZfwH3iWGaZ++LOnu3Qr7z6l4GO4uHXfPF02RDSctjqEp9o3M/IYSTCzWWY
 JudyG/GjRP4qusKR43QyahrMuxq/P/4+EzaXjEy8x9TECOIUfCGxqyljXiv83KiLaNut
 /ixIsPiFHvnHLNMp5WkeSudgmrO2L2dFyT+dLwDE1s6LUeevx4E/dZetBRfRubCQfYpM
 fHxwv+FafHaX70z567Wb7raMi/rIgNKfTLYuVqo8QLPtHcuL779L4IhCyv0pVG9ji4Ft
 6LOQ==
X-Gm-Message-State: AOAM531WtLlmk6oQAV7EuXTf7EccLlkDKSVk1OwHXN05B7UnNKwkXAI/
 eXZShj/FiDwHUMTul4xBs2ErIc74ZxILEBcbbiTlIQbrmaamH3Tvzoq0eTYj/I3EdelEJ1Mhjfl
 2n+nhKV+7h460bzmW8/6A2Ci/AW/7
X-Received: by 2002:a0c:f052:0:b0:443:db73:ea02 with SMTP id
 b18-20020a0cf052000000b00443db73ea02mr13458043qvl.22.1649368023092; 
 Thu, 07 Apr 2022 14:47:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUr1XsECjLKx2asPU9r2fKI70Bmh3b31Erlm+3yNrCJZiozuWX7crOmp2bRZEQ1FsyLT55ag==
X-Received: by 2002:a0c:f052:0:b0:443:db73:ea02 with SMTP id
 b18-20020a0cf052000000b00443db73ea02mr13458024qvl.22.1649368022740; 
 Thu, 07 Apr 2022 14:47:02 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 r7-20020ac85c87000000b002e234014a1fsm17464554qta.81.2022.04.07.14.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 14:47:02 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/radeon: change cayman_default_state table from global to
 static
Date: Thu,  7 Apr 2022 17:46:59 -0400
Message-Id: <20220407214659.2519967-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cayman_default_state and cayman_default_size are only
used in ni.c.  Single file symbols should be static.
So move their definitions to cayman_blit_shaders.h
and change their storage-class-specifier to static.

Remove unneeded cayman_blit_shader.c

cayman_ps/vs definitions were removed with
commit 4f8629675800 ("drm/radeon/kms: remove r6xx+ blit copy routines")
So their declarations in cayman_blit_shader.h
are not needed, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/radeon/Makefile              |   2 +-
 drivers/gpu/drm/radeon/cayman_blit_shaders.c | 320 -------------------
 drivers/gpu/drm/radeon/cayman_blit_shaders.h | 294 ++++++++++++++++-
 3 files changed, 290 insertions(+), 326 deletions(-)
 delete mode 100644 drivers/gpu/drm/radeon/cayman_blit_shaders.c

diff --git a/drivers/gpu/drm/radeon/Makefile b/drivers/gpu/drm/radeon/Makefile
index 664381f4eb07..2425a3612d6c 100644
--- a/drivers/gpu/drm/radeon/Makefile
+++ b/drivers/gpu/drm/radeon/Makefile
@@ -42,7 +42,7 @@ radeon-y += radeon_device.o radeon_asic.o radeon_kms.o \
 	r200.o radeon_legacy_tv.o r600_cs.o r600_blit_shaders.o \
 	radeon_pm.o atombios_dp.o r600_hdmi.o dce3_1_afmt.o \
 	evergreen.o evergreen_cs.o evergreen_blit_shaders.o \
-	evergreen_hdmi.o radeon_trace_points.o ni.o cayman_blit_shaders.o \
+	evergreen_hdmi.o radeon_trace_points.o ni.o \
 	atombios_encoders.o radeon_semaphore.o radeon_sa.o atombios_i2c.o si.o \
 	radeon_prime.o cik.o cik_blit_shaders.o \
 	r600_dpm.o rs780_dpm.o rv6xx_dpm.o rv770_dpm.o rv730_dpm.o rv740_dpm.o \
diff --git a/drivers/gpu/drm/radeon/cayman_blit_shaders.c b/drivers/gpu/drm/radeon/cayman_blit_shaders.c
deleted file mode 100644
index 9fec4d09f383..000000000000
--- a/drivers/gpu/drm/radeon/cayman_blit_shaders.c
+++ /dev/null
@@ -1,320 +0,0 @@
-/*
- * Copyright 2010 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- *
- * Authors:
- *     Alex Deucher <alexander.deucher@amd.com>
- */
-
-#include <linux/bug.h>
-#include <linux/types.h>
-#include <linux/kernel.h>
-
-/*
- * evergreen cards need to use the 3D engine to blit data which requires
- * quite a bit of hw state setup.  Rather than pull the whole 3D driver
- * (which normally generates the 3D state) into the DRM, we opt to use
- * statically generated state tables.  The register state and shaders
- * were hand generated to support blitting functionality.  See the 3D
- * driver or documentation for descriptions of the registers and
- * shader instructions.
- */
-
-const u32 cayman_default_state[] =
-{
-	0xc0066900,
-	0x00000000,
-	0x00000060, /* DB_RENDER_CONTROL */
-	0x00000000, /* DB_COUNT_CONTROL */
-	0x00000000, /* DB_DEPTH_VIEW */
-	0x0000002a, /* DB_RENDER_OVERRIDE */
-	0x00000000, /* DB_RENDER_OVERRIDE2 */
-	0x00000000, /* DB_HTILE_DATA_BASE */
-
-	0xc0026900,
-	0x0000000a,
-	0x00000000, /* DB_STENCIL_CLEAR */
-	0x00000000, /* DB_DEPTH_CLEAR */
-
-	0xc0036900,
-	0x0000000f,
-	0x00000000, /* DB_DEPTH_INFO */
-	0x00000000, /* DB_Z_INFO */
-	0x00000000, /* DB_STENCIL_INFO */
-
-	0xc0016900,
-	0x00000080,
-	0x00000000, /* PA_SC_WINDOW_OFFSET */
-
-	0xc00d6900,
-	0x00000083,
-	0x0000ffff, /* PA_SC_CLIPRECT_RULE */
-	0x00000000, /* PA_SC_CLIPRECT_0_TL */
-	0x20002000, /* PA_SC_CLIPRECT_0_BR */
-	0x00000000,
-	0x20002000,
-	0x00000000,
-	0x20002000,
-	0x00000000,
-	0x20002000,
-	0xaaaaaaaa, /* PA_SC_EDGERULE */
-	0x00000000, /* PA_SU_HARDWARE_SCREEN_OFFSET */
-	0x0000000f, /* CB_TARGET_MASK */
-	0x0000000f, /* CB_SHADER_MASK */
-
-	0xc0226900,
-	0x00000094,
-	0x80000000, /* PA_SC_VPORT_SCISSOR_0_TL */
-	0x20002000, /* PA_SC_VPORT_SCISSOR_0_BR */
-	0x80000000,
-	0x20002000,
-	0x80000000,
-	0x20002000,
-	0x80000000,
-	0x20002000,
-	0x80000000,
-	0x20002000,
-	0x80000000,
-	0x20002000,
-	0x80000000,
-	0x20002000,
-	0x80000000,
-	0x20002000,
-	0x80000000,
-	0x20002000,
-	0x80000000,
-	0x20002000,
-	0x80000000,
-	0x20002000,
-	0x80000000,
-	0x20002000,
-	0x80000000,
-	0x20002000,
-	0x80000000,
-	0x20002000,
-	0x80000000,
-	0x20002000,
-	0x80000000,
-	0x20002000,
-	0x00000000, /* PA_SC_VPORT_ZMIN_0 */
-	0x3f800000, /* PA_SC_VPORT_ZMAX_0 */
-
-	0xc0016900,
-	0x000000d4,
-	0x00000000, /* SX_MISC */
-
-	0xc0026900,
-	0x000000d9,
-	0x00000000, /* CP_RINGID */
-	0x00000000, /* CP_VMID */
-
-	0xc0096900,
-	0x00000100,
-	0x00ffffff, /* VGT_MAX_VTX_INDX */
-	0x00000000, /* VGT_MIN_VTX_INDX */
-	0x00000000, /* VGT_INDX_OFFSET */
-	0x00000000, /* VGT_MULTI_PRIM_IB_RESET_INDX */
-	0x00000000, /* SX_ALPHA_TEST_CONTROL */
-	0x00000000, /* CB_BLEND_RED */
-	0x00000000, /* CB_BLEND_GREEN */
-	0x00000000, /* CB_BLEND_BLUE */
-	0x00000000, /* CB_BLEND_ALPHA */
-
-	0xc0016900,
-	0x00000187,
-	0x00000100, /* SPI_VS_OUT_ID_0 */
-
-	0xc0026900,
-	0x00000191,
-	0x00000100, /* SPI_PS_INPUT_CNTL_0 */
-	0x00000101, /* SPI_PS_INPUT_CNTL_1 */
-
-	0xc0016900,
-	0x000001b1,
-	0x00000000, /* SPI_VS_OUT_CONFIG */
-
-	0xc0106900,
-	0x000001b3,
-	0x20000001, /* SPI_PS_IN_CONTROL_0 */
-	0x00000000, /* SPI_PS_IN_CONTROL_1 */
-	0x00000000, /* SPI_INTERP_CONTROL_0 */
-	0x00000000, /* SPI_INPUT_Z */
-	0x00000000, /* SPI_FOG_CNTL */
-	0x00100000, /* SPI_BARYC_CNTL */
-	0x00000000, /* SPI_PS_IN_CONTROL_2 */
-	0x00000000, /* SPI_COMPUTE_INPUT_CNTL */
-	0x00000000, /* SPI_COMPUTE_NUM_THREAD_X */
-	0x00000000, /* SPI_COMPUTE_NUM_THREAD_Y */
-	0x00000000, /* SPI_COMPUTE_NUM_THREAD_Z */
-	0x00000000, /* SPI_GPR_MGMT */
-	0x00000000, /* SPI_LDS_MGMT */
-	0x00000000, /* SPI_STACK_MGMT */
-	0x00000000, /* SPI_WAVE_MGMT_1 */
-	0x00000000, /* SPI_WAVE_MGMT_2 */
-
-	0xc0016900,
-	0x000001e0,
-	0x00000000, /* CB_BLEND0_CONTROL */
-
-	0xc00e6900,
-	0x00000200,
-	0x00000000, /* DB_DEPTH_CONTROL */
-	0x00000000, /* DB_EQAA */
-	0x00cc0010, /* CB_COLOR_CONTROL */
-	0x00000210, /* DB_SHADER_CONTROL */
-	0x00010000, /* PA_CL_CLIP_CNTL */
-	0x00000004, /* PA_SU_SC_MODE_CNTL */
-	0x00000100, /* PA_CL_VTE_CNTL */
-	0x00000000, /* PA_CL_VS_OUT_CNTL */
-	0x00000000, /* PA_CL_NANINF_CNTL */
-	0x00000000, /* PA_SU_LINE_STIPPLE_CNTL */
-	0x00000000, /* PA_SU_LINE_STIPPLE_SCALE */
-	0x00000000, /* PA_SU_PRIM_FILTER_CNTL */
-	0x00000000, /*  */
-	0x00000000, /*  */
-
-	0xc0026900,
-	0x00000229,
-	0x00000000, /* SQ_PGM_START_FS */
-	0x00000000,
-
-	0xc0016900,
-	0x0000023b,
-	0x00000000, /* SQ_LDS_ALLOC_PS */
-
-	0xc0066900,
-	0x00000240,
-	0x00000000, /* SQ_ESGS_RING_ITEMSIZE */
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-
-	0xc0046900,
-	0x00000247,
-	0x00000000, /* SQ_GS_VERT_ITEMSIZE */
-	0x00000000,
-	0x00000000,
-	0x00000000,
-
-	0xc0116900,
-	0x00000280,
-	0x00000000, /* PA_SU_POINT_SIZE */
-	0x00000000, /* PA_SU_POINT_MINMAX */
-	0x00000008, /* PA_SU_LINE_CNTL */
-	0x00000000, /* PA_SC_LINE_STIPPLE */
-	0x00000000, /* VGT_OUTPUT_PATH_CNTL */
-	0x00000000, /* VGT_HOS_CNTL */
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000, /* VGT_GS_MODE */
-
-	0xc0026900,
-	0x00000292,
-	0x00000000, /* PA_SC_MODE_CNTL_0 */
-	0x00000000, /* PA_SC_MODE_CNTL_1 */
-
-	0xc0016900,
-	0x000002a1,
-	0x00000000, /* VGT_PRIMITIVEID_EN */
-
-	0xc0016900,
-	0x000002a5,
-	0x00000000, /* VGT_MULTI_PRIM_IB_RESET_EN */
-
-	0xc0026900,
-	0x000002a8,
-	0x00000000, /* VGT_INSTANCE_STEP_RATE_0 */
-	0x00000000,
-
-	0xc0026900,
-	0x000002ad,
-	0x00000000, /* VGT_REUSE_OFF */
-	0x00000000,
-
-	0xc0016900,
-	0x000002d5,
-	0x00000000, /* VGT_SHADER_STAGES_EN */
-
-	0xc0016900,
-	0x000002dc,
-	0x0000aa00, /* DB_ALPHA_TO_MASK */
-
-	0xc0066900,
-	0x000002de,
-	0x00000000, /* PA_SU_POLY_OFFSET_DB_FMT_CNTL */
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-
-	0xc0026900,
-	0x000002e5,
-	0x00000000, /* VGT_STRMOUT_CONFIG */
-	0x00000000,
-
-	0xc01b6900,
-	0x000002f5,
-	0x76543210, /* PA_SC_CENTROID_PRIORITY_0 */
-	0xfedcba98, /* PA_SC_CENTROID_PRIORITY_1 */
-	0x00000000, /* PA_SC_LINE_CNTL */
-	0x00000000, /* PA_SC_AA_CONFIG */
-	0x00000005, /* PA_SU_VTX_CNTL */
-	0x3f800000, /* PA_CL_GB_VERT_CLIP_ADJ */
-	0x3f800000, /* PA_CL_GB_VERT_DISC_ADJ */
-	0x3f800000, /* PA_CL_GB_HORZ_CLIP_ADJ */
-	0x3f800000, /* PA_CL_GB_HORZ_DISC_ADJ */
-	0x00000000, /* PA_SC_AA_SAMPLE_LOCS_PIXEL_X0Y0_0 */
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0x00000000,
-	0xffffffff, /* PA_SC_AA_MASK_X0Y0_X1Y0 */
-	0xffffffff,
-
-	0xc0026900,
-	0x00000316,
-	0x0000000e, /* VGT_VERTEX_REUSE_BLOCK_CNTL */
-	0x00000010, /*  */
-};
-
-const u32 cayman_default_size = ARRAY_SIZE(cayman_default_state);
diff --git a/drivers/gpu/drm/radeon/cayman_blit_shaders.h b/drivers/gpu/drm/radeon/cayman_blit_shaders.h
index f5d0e9a60267..1dca73d9e005 100644
--- a/drivers/gpu/drm/radeon/cayman_blit_shaders.h
+++ b/drivers/gpu/drm/radeon/cayman_blit_shaders.h
@@ -20,16 +20,300 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  * DEALINGS IN THE SOFTWARE.
  *
+ * Authors:
+ *     Alex Deucher <alexander.deucher@amd.com>
  */
 
 #ifndef CAYMAN_BLIT_SHADERS_H
 #define CAYMAN_BLIT_SHADERS_H
 
-extern const u32 cayman_ps[];
-extern const u32 cayman_vs[];
-extern const u32 cayman_default_state[];
+/*
+ * evergreen cards need to use the 3D engine to blit data which requires
+ * quite a bit of hw state setup.  Rather than pull the whole 3D driver
+ * (which normally generates the 3D state) into the DRM, we opt to use
+ * statically generated state tables.  The register state and shaders
+ * were hand generated to support blitting functionality.  See the 3D
+ * driver or documentation for descriptions of the registers and
+ * shader instructions.
+ */
+static const u32 cayman_default_state[] = {
+	0xc0066900,
+	0x00000000,
+	0x00000060, /* DB_RENDER_CONTROL */
+	0x00000000, /* DB_COUNT_CONTROL */
+	0x00000000, /* DB_DEPTH_VIEW */
+	0x0000002a, /* DB_RENDER_OVERRIDE */
+	0x00000000, /* DB_RENDER_OVERRIDE2 */
+	0x00000000, /* DB_HTILE_DATA_BASE */
+
+	0xc0026900,
+	0x0000000a,
+	0x00000000, /* DB_STENCIL_CLEAR */
+	0x00000000, /* DB_DEPTH_CLEAR */
+
+	0xc0036900,
+	0x0000000f,
+	0x00000000, /* DB_DEPTH_INFO */
+	0x00000000, /* DB_Z_INFO */
+	0x00000000, /* DB_STENCIL_INFO */
+
+	0xc0016900,
+	0x00000080,
+	0x00000000, /* PA_SC_WINDOW_OFFSET */
+
+	0xc00d6900,
+	0x00000083,
+	0x0000ffff, /* PA_SC_CLIPRECT_RULE */
+	0x00000000, /* PA_SC_CLIPRECT_0_TL */
+	0x20002000, /* PA_SC_CLIPRECT_0_BR */
+	0x00000000,
+	0x20002000,
+	0x00000000,
+	0x20002000,
+	0x00000000,
+	0x20002000,
+	0xaaaaaaaa, /* PA_SC_EDGERULE */
+	0x00000000, /* PA_SU_HARDWARE_SCREEN_OFFSET */
+	0x0000000f, /* CB_TARGET_MASK */
+	0x0000000f, /* CB_SHADER_MASK */
+
+	0xc0226900,
+	0x00000094,
+	0x80000000, /* PA_SC_VPORT_SCISSOR_0_TL */
+	0x20002000, /* PA_SC_VPORT_SCISSOR_0_BR */
+	0x80000000,
+	0x20002000,
+	0x80000000,
+	0x20002000,
+	0x80000000,
+	0x20002000,
+	0x80000000,
+	0x20002000,
+	0x80000000,
+	0x20002000,
+	0x80000000,
+	0x20002000,
+	0x80000000,
+	0x20002000,
+	0x80000000,
+	0x20002000,
+	0x80000000,
+	0x20002000,
+	0x80000000,
+	0x20002000,
+	0x80000000,
+	0x20002000,
+	0x80000000,
+	0x20002000,
+	0x80000000,
+	0x20002000,
+	0x80000000,
+	0x20002000,
+	0x80000000,
+	0x20002000,
+	0x00000000, /* PA_SC_VPORT_ZMIN_0 */
+	0x3f800000, /* PA_SC_VPORT_ZMAX_0 */
+
+	0xc0016900,
+	0x000000d4,
+	0x00000000, /* SX_MISC */
+
+	0xc0026900,
+	0x000000d9,
+	0x00000000, /* CP_RINGID */
+	0x00000000, /* CP_VMID */
+
+	0xc0096900,
+	0x00000100,
+	0x00ffffff, /* VGT_MAX_VTX_INDX */
+	0x00000000, /* VGT_MIN_VTX_INDX */
+	0x00000000, /* VGT_INDX_OFFSET */
+	0x00000000, /* VGT_MULTI_PRIM_IB_RESET_INDX */
+	0x00000000, /* SX_ALPHA_TEST_CONTROL */
+	0x00000000, /* CB_BLEND_RED */
+	0x00000000, /* CB_BLEND_GREEN */
+	0x00000000, /* CB_BLEND_BLUE */
+	0x00000000, /* CB_BLEND_ALPHA */
+
+	0xc0016900,
+	0x00000187,
+	0x00000100, /* SPI_VS_OUT_ID_0 */
+
+	0xc0026900,
+	0x00000191,
+	0x00000100, /* SPI_PS_INPUT_CNTL_0 */
+	0x00000101, /* SPI_PS_INPUT_CNTL_1 */
+
+	0xc0016900,
+	0x000001b1,
+	0x00000000, /* SPI_VS_OUT_CONFIG */
+
+	0xc0106900,
+	0x000001b3,
+	0x20000001, /* SPI_PS_IN_CONTROL_0 */
+	0x00000000, /* SPI_PS_IN_CONTROL_1 */
+	0x00000000, /* SPI_INTERP_CONTROL_0 */
+	0x00000000, /* SPI_INPUT_Z */
+	0x00000000, /* SPI_FOG_CNTL */
+	0x00100000, /* SPI_BARYC_CNTL */
+	0x00000000, /* SPI_PS_IN_CONTROL_2 */
+	0x00000000, /* SPI_COMPUTE_INPUT_CNTL */
+	0x00000000, /* SPI_COMPUTE_NUM_THREAD_X */
+	0x00000000, /* SPI_COMPUTE_NUM_THREAD_Y */
+	0x00000000, /* SPI_COMPUTE_NUM_THREAD_Z */
+	0x00000000, /* SPI_GPR_MGMT */
+	0x00000000, /* SPI_LDS_MGMT */
+	0x00000000, /* SPI_STACK_MGMT */
+	0x00000000, /* SPI_WAVE_MGMT_1 */
+	0x00000000, /* SPI_WAVE_MGMT_2 */
+
+	0xc0016900,
+	0x000001e0,
+	0x00000000, /* CB_BLEND0_CONTROL */
+
+	0xc00e6900,
+	0x00000200,
+	0x00000000, /* DB_DEPTH_CONTROL */
+	0x00000000, /* DB_EQAA */
+	0x00cc0010, /* CB_COLOR_CONTROL */
+	0x00000210, /* DB_SHADER_CONTROL */
+	0x00010000, /* PA_CL_CLIP_CNTL */
+	0x00000004, /* PA_SU_SC_MODE_CNTL */
+	0x00000100, /* PA_CL_VTE_CNTL */
+	0x00000000, /* PA_CL_VS_OUT_CNTL */
+	0x00000000, /* PA_CL_NANINF_CNTL */
+	0x00000000, /* PA_SU_LINE_STIPPLE_CNTL */
+	0x00000000, /* PA_SU_LINE_STIPPLE_SCALE */
+	0x00000000, /* PA_SU_PRIM_FILTER_CNTL */
+	0x00000000, /*  */
+	0x00000000, /*  */
+
+	0xc0026900,
+	0x00000229,
+	0x00000000, /* SQ_PGM_START_FS */
+	0x00000000,
+
+	0xc0016900,
+	0x0000023b,
+	0x00000000, /* SQ_LDS_ALLOC_PS */
+
+	0xc0066900,
+	0x00000240,
+	0x00000000, /* SQ_ESGS_RING_ITEMSIZE */
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+
+	0xc0046900,
+	0x00000247,
+	0x00000000, /* SQ_GS_VERT_ITEMSIZE */
+	0x00000000,
+	0x00000000,
+	0x00000000,
+
+	0xc0116900,
+	0x00000280,
+	0x00000000, /* PA_SU_POINT_SIZE */
+	0x00000000, /* PA_SU_POINT_MINMAX */
+	0x00000008, /* PA_SU_LINE_CNTL */
+	0x00000000, /* PA_SC_LINE_STIPPLE */
+	0x00000000, /* VGT_OUTPUT_PATH_CNTL */
+	0x00000000, /* VGT_HOS_CNTL */
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000, /* VGT_GS_MODE */
+
+	0xc0026900,
+	0x00000292,
+	0x00000000, /* PA_SC_MODE_CNTL_0 */
+	0x00000000, /* PA_SC_MODE_CNTL_1 */
+
+	0xc0016900,
+	0x000002a1,
+	0x00000000, /* VGT_PRIMITIVEID_EN */
+
+	0xc0016900,
+	0x000002a5,
+	0x00000000, /* VGT_MULTI_PRIM_IB_RESET_EN */
+
+	0xc0026900,
+	0x000002a8,
+	0x00000000, /* VGT_INSTANCE_STEP_RATE_0 */
+	0x00000000,
+
+	0xc0026900,
+	0x000002ad,
+	0x00000000, /* VGT_REUSE_OFF */
+	0x00000000,
+
+	0xc0016900,
+	0x000002d5,
+	0x00000000, /* VGT_SHADER_STAGES_EN */
+
+	0xc0016900,
+	0x000002dc,
+	0x0000aa00, /* DB_ALPHA_TO_MASK */
+
+	0xc0066900,
+	0x000002de,
+	0x00000000, /* PA_SU_POLY_OFFSET_DB_FMT_CNTL */
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+
+	0xc0026900,
+	0x000002e5,
+	0x00000000, /* VGT_STRMOUT_CONFIG */
+	0x00000000,
+
+	0xc01b6900,
+	0x000002f5,
+	0x76543210, /* PA_SC_CENTROID_PRIORITY_0 */
+	0xfedcba98, /* PA_SC_CENTROID_PRIORITY_1 */
+	0x00000000, /* PA_SC_LINE_CNTL */
+	0x00000000, /* PA_SC_AA_CONFIG */
+	0x00000005, /* PA_SU_VTX_CNTL */
+	0x3f800000, /* PA_CL_GB_VERT_CLIP_ADJ */
+	0x3f800000, /* PA_CL_GB_VERT_DISC_ADJ */
+	0x3f800000, /* PA_CL_GB_HORZ_CLIP_ADJ */
+	0x3f800000, /* PA_CL_GB_HORZ_DISC_ADJ */
+	0x00000000, /* PA_SC_AA_SAMPLE_LOCS_PIXEL_X0Y0_0 */
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0x00000000,
+	0xffffffff, /* PA_SC_AA_MASK_X0Y0_X1Y0 */
+	0xffffffff,
+
+	0xc0026900,
+	0x00000316,
+	0x0000000e, /* VGT_VERTEX_REUSE_BLOCK_CNTL */
+	0x00000010, /*  */
+};
 
-extern const u32 cayman_ps_size, cayman_vs_size;
-extern const u32 cayman_default_size;
+static const u32 cayman_default_size = ARRAY_SIZE(cayman_default_state);
 
 #endif
-- 
2.27.0

