Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCF950CAC7
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 15:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0ED610FDA7;
	Sat, 23 Apr 2022 13:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BBE10FDA7
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 13:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650721450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ryHOMrXeAjR16kXur3oAxXbrl3wAU9njmDIW+D1VS/Y=;
 b=XwyuwQUYzyxm8gm32fClAFbIzWyguKQCzs59Ps/fGQofMjlxElIhCSDvbofs5OJ8wWGYaT
 N6/IR5Af1YI+QlE1Gka7RpjfmSmhQx4beX6TWODCRFba0AG8Y8414bNK9boYvTWoljgt0/
 PxNtZZkLZdm6d3VAnHY2rqgE4kJL5Jc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-pGIb48PiMJ25AI-wkM5Mtg-1; Sat, 23 Apr 2022 09:44:07 -0400
X-MC-Unique: pGIb48PiMJ25AI-wkM5Mtg-1
Received: by mail-qt1-f199.google.com with SMTP id
 m11-20020ac807cb000000b002f33f7f7d69so6076413qth.3
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 06:44:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ryHOMrXeAjR16kXur3oAxXbrl3wAU9njmDIW+D1VS/Y=;
 b=c83DDZvg2dIV/Obc/HSw758JVG780kJizWsMjsVfTfLbxUOYaNmJ5JOIScT/odhtFz
 Vmb3hdyYMBJqWSoP/+fDlQHAw5GhnwmwRr1kLlI0sVfimZhJbJKKwyNyTfqyb24P4ft4
 H+IoLrN7/rpWCdtRdbpGTm7H4OT/EapjXdDKeY0YTb+SJVEm4+T/WC7fAQvv/CJq0pp7
 C8+XjG29thvNWiO1QV4y5kCvdGBUtog9nwdv7ka37I4moV6eHKxy5BgDlkZZeCijzkU3
 Zc2xwIk0UT1ivmfpe2FsrPdJINEVKRb6I8hw0aQMpyV9rVwIwfysyjQ+6QE9Sxwhui3i
 BY3w==
X-Gm-Message-State: AOAM533ei+GmG9gNfcMNETiXID1AkGpfs9y5/9Qpnpyf1UWgmqxr3IQk
 EN5fiOGVA1wRNPyzWsHzasPPrjz3mzweGkKPpSAUxrglJgZIpX5Dt+GO5S+iKKnHDfifJBoPaPY
 xsBA3nG9UTaG6SUreaUyjEEZIc3GY
X-Received: by 2002:ac8:5e4e:0:b0:2f3:5df5:5b3f with SMTP id
 i14-20020ac85e4e000000b002f35df55b3fmr3777676qtx.295.1650721446555; 
 Sat, 23 Apr 2022 06:44:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCE04WBAi73oXGLgi8Qv79dmpBTOM/pId/2mhwgDAlB2YFZLdQMOdAT6d/K0lWciHf8luhLg==
X-Received: by 2002:ac8:5e4e:0:b0:2f3:5df5:5b3f with SMTP id
 i14-20020ac85e4e000000b002f35df55b3fmr3777655qtx.295.1650721446258; 
 Sat, 23 Apr 2022 06:44:06 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a05622a05d200b002f07ed88a54sm3107157qtb.46.2022.04.23.06.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 06:44:05 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/radeon: change cik_default_state table from global to
 static
Date: Sat, 23 Apr 2022 09:44:02 -0400
Message-Id: <20220423134402.3726385-1-trix@redhat.com>
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

Sparse reports these issues
cik_blit_shaders.c:31:11: warning: symbol 'cik_default_state' was not declared. Should it be static?
cik_blit_shaders.c:246:11: warning: symbol 'cik_default_size' was not declared. Should it be static?

cik_default_state and cik_default_size are only used in cik.c. Single file symbols
should be static. So move their definitions to cik_blit_shaders.h and change their
storage-class-specifier to static.

Remove unneeded cik_blit_shader.c

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/radeon/Makefile           |   2 +-
 drivers/gpu/drm/radeon/cik_blit_shaders.c | 246 ----------------------
 drivers/gpu/drm/radeon/cik_blit_shaders.h | 219 ++++++++++++++++++-
 3 files changed, 218 insertions(+), 249 deletions(-)
 delete mode 100644 drivers/gpu/drm/radeon/cik_blit_shaders.c

diff --git a/drivers/gpu/drm/radeon/Makefile b/drivers/gpu/drm/radeon/Makefile
index 1045d2c46a76..ea5380e24c3c 100644
--- a/drivers/gpu/drm/radeon/Makefile
+++ b/drivers/gpu/drm/radeon/Makefile
@@ -44,7 +44,7 @@ radeon-y += radeon_device.o radeon_asic.o radeon_kms.o \
 	evergreen.o evergreen_cs.o \
 	evergreen_hdmi.o radeon_trace_points.o ni.o \
 	atombios_encoders.o radeon_semaphore.o radeon_sa.o atombios_i2c.o si.o \
-	radeon_prime.o cik.o cik_blit_shaders.o \
+	radeon_prime.o cik.o \
 	r600_dpm.o rs780_dpm.o rv6xx_dpm.o rv770_dpm.o rv730_dpm.o rv740_dpm.o \
 	rv770_smc.o cypress_dpm.o btc_dpm.o sumo_dpm.o sumo_smc.o trinity_dpm.o \
 	trinity_smc.o ni_dpm.o si_smc.o si_dpm.o kv_smc.o kv_dpm.o ci_smc.o \
diff --git a/drivers/gpu/drm/radeon/cik_blit_shaders.c b/drivers/gpu/drm/radeon/cik_blit_shaders.c
deleted file mode 100644
index ff1311806e91..000000000000
--- a/drivers/gpu/drm/radeon/cik_blit_shaders.c
+++ /dev/null
@@ -1,246 +0,0 @@
-/*
- * Copyright 2012 Advanced Micro Devices, Inc.
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
-#include <linux/types.h>
-#include <linux/bug.h>
-#include <linux/kernel.h>
-
-const u32 cik_default_state[] =
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
-	0xc0046900,
-	0x00000008,
-	0x00000000, /* DB_DEPTH_BOUNDS_MIN */
-	0x00000000, /* DB_DEPTH_BOUNDS_MAX */
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
-	0xc0046900,
-	0x00000100,
-	0xffffffff, /* VGT_MAX_VTX_INDX */
-	0x00000000, /* VGT_MIN_VTX_INDX */
-	0x00000000, /* VGT_INDX_OFFSET */
-	0x00000000, /* VGT_MULTI_PRIM_IB_RESET_INDX */
-
-	0xc0046900,
-	0x00000105,
-	0x00000000, /* CB_BLEND_RED */
-	0x00000000, /* CB_BLEND_GREEN */
-	0x00000000, /* CB_BLEND_BLUE */
-	0x00000000, /* CB_BLEND_ALPHA */
-
-	0xc0016900,
-	0x000001e0,
-	0x00000000, /* CB_BLEND0_CONTROL */
-
-	0xc00c6900,
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
-const u32 cik_default_size = ARRAY_SIZE(cik_default_state);
diff --git a/drivers/gpu/drm/radeon/cik_blit_shaders.h b/drivers/gpu/drm/radeon/cik_blit_shaders.h
index dfe7314f9ff4..d2a2e2316814 100644
--- a/drivers/gpu/drm/radeon/cik_blit_shaders.h
+++ b/drivers/gpu/drm/radeon/cik_blit_shaders.h
@@ -20,13 +20,228 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  * DEALINGS IN THE SOFTWARE.
  *
+ * Authors:
+ *     Alex Deucher <alexander.deucher@amd.com>
  */
 
 #ifndef CIK_BLIT_SHADERS_H
 #define CIK_BLIT_SHADERS_H
 
-extern const u32 cik_default_state[];
+static const u32 cik_default_state[] =
+{
+	0xc0066900,
+	0x00000000,
+	0x00000060, /* DB_RENDER_CONTROL */
+	0x00000000, /* DB_COUNT_CONTROL */
+	0x00000000, /* DB_DEPTH_VIEW */
+	0x0000002a, /* DB_RENDER_OVERRIDE */
+	0x00000000, /* DB_RENDER_OVERRIDE2 */
+	0x00000000, /* DB_HTILE_DATA_BASE */
 
-extern const u32 cik_default_size;
+	0xc0046900,
+	0x00000008,
+	0x00000000, /* DB_DEPTH_BOUNDS_MIN */
+	0x00000000, /* DB_DEPTH_BOUNDS_MAX */
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
+	0xc0046900,
+	0x00000100,
+	0xffffffff, /* VGT_MAX_VTX_INDX */
+	0x00000000, /* VGT_MIN_VTX_INDX */
+	0x00000000, /* VGT_INDX_OFFSET */
+	0x00000000, /* VGT_MULTI_PRIM_IB_RESET_INDX */
+
+	0xc0046900,
+	0x00000105,
+	0x00000000, /* CB_BLEND_RED */
+	0x00000000, /* CB_BLEND_GREEN */
+	0x00000000, /* CB_BLEND_BLUE */
+	0x00000000, /* CB_BLEND_ALPHA */
+
+	0xc0016900,
+	0x000001e0,
+	0x00000000, /* CB_BLEND0_CONTROL */
+
+	0xc00c6900,
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
+
+static const u32 cik_default_size = ARRAY_SIZE(cik_default_state);
 
 #endif
-- 
2.27.0

