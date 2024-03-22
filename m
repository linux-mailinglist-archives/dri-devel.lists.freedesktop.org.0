Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FA7887507
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 23:57:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F97D11288B;
	Fri, 22 Mar 2024 22:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QDU3kWrU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2527A11288B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 22:57:03 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-513d717269fso3267813e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 15:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711148221; x=1711753021; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kbFUU4iMew5gCyNhy6Z/kEtYbNuf40upf3sZEP5LUHU=;
 b=QDU3kWrU8j7YYwJzkY8h2yfow1shDBxuMNlSK6qboJd0gtk6ExZ3NvqXd4f0ZaJMb3
 0+ImQ/xht6gMEcivO522UZLHwwRr/5tU4XmbfCzKvBI3thSXLnY7ABfI6MLQWQbiTj+1
 Mn9cScODGMiBQF8RD9y5G1nNUw5gSt4KGVdlwng6Yf7ccWEIohWcd9HgMD+TqhW/Pzep
 copYbiYXLYbCOXd5X2FC8IBAl1xbk5KnMTzWPDcP60TJmmipwpS9htPEuLUW/5StX7+q
 QHGnXlh10WKQd1q+lXuaU6+RZLa6YQf02n67Jtw/Tzk74sp27VhTZm5OiuSiOnDMCavb
 cwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711148221; x=1711753021;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kbFUU4iMew5gCyNhy6Z/kEtYbNuf40upf3sZEP5LUHU=;
 b=anhN5RkCtzb7lmbSiMLfyRueAJyQr0pqQbSdSyMxcKFyZaxmknJr6ZM49rJ707yCHk
 L1GVC6vdBlq4MbAl9XYboYKd82lpVYvdOEw6gJrHUsYqHdjSkbDarYmh4aONMoMTJDOp
 grTD756q7RNYcd+nuFl9MdWiEuWxHUos8+Th3BpNI9F+x+3WnYtSGvNb3HQOse2UPoeP
 BXZG9XbXKRPVsJWB/ZRZLIXJfsn6YoJ3lDdPQ2SvwrWZq+IgLzYTm58WG3mGpkyzcL8h
 aC5HUatsmBNexLOPOpy8Um0LRuWuA7aTidxKJEImwmIuM00rekHjqZ/0KgieiECbF4oO
 HuDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9j3unnUXfVLh/GiXVIgPtU2/e+IRV+xGJ4hizb74kgse3sUIOmS7zIjbGmaJkaOCn+ByAx4R8GZnBHzPf1s5aCB6FTwsLR7jgfKnpaV8M
X-Gm-Message-State: AOJu0YyUqFEVMYvYyXKHSHEALAvAxvJ9SrxHUWXl1d1EQY3Xl7KmA4f0
 tuakWDdhFRyfi3eLLEg1QCvKGbJBZr+l0vcyNgUvDUE1CYAtW27Nxv1pbDcPGdrsxadyNj8lswI
 I
X-Google-Smtp-Source: AGHT+IFV3Dk3L9+5fI6dai9KtVtUDBcirSVfNV8cDlZQLNLc8vM1FFyfP/fXq3yyga1XutJahgGGMg==
X-Received: by 2002:a19:5f51:0:b0:513:b8c0:faa8 with SMTP id
 a17-20020a195f51000000b00513b8c0faa8mr473145lfj.65.1711148221019; 
 Fri, 22 Mar 2024 15:57:01 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 e7-20020a196907000000b005158982f42csm78530lfc.16.2024.03.22.15.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 15:57:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 23 Mar 2024 00:56:55 +0200
Subject: [PATCH v4 03/16] drm/msm/dsi: drop mmss_cc.xml.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240323-fd-xml-shipped-v4-3-cca5e8457b9e@linaro.org>
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
In-Reply-To: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7249;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gqKp1S6/zn30s6BNuSQoNE5FrMLSKTVvFXbaJQz/Q24=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl/gy27kwyMn34fqUVWe6InJLCq+UVNjRK/Cl9T
 En984yYgPSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZf4MtgAKCRCLPIo+Aiko
 1aRXB/wItueHG5ocCfJ6dpoN2iPfZBTFWuPyDwSaaDPBOedYZ/oEDpljwzB4SRBDsXCbk3WWOva
 cEo5juekEb3x2XlcIM/pr11DllLCOpibdPlJeTw8Q0v+TSeN+PMd3HD/4WOAnlupdjhwZ1RSK7Z
 Xbsmy0+B8yWCo5KFJvebkdEf6XIMgu2xj4GVn+AorsCVJijTPbB+mgTMafDxFM4BZkpEdh3EWP8
 CIjTRahqmgVUgX9ld/1/8S8p+WinjCnb6rhvQM0ZHuxf9sHMMLHC7nk6Sbhfk9I0jQI9EFYZSmv
 YPNkfkyiIs3J4SS/QPCm59OV++GV5bb3YfXM18n9kYVL9M9G
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The mmss_cc.xml.h file describes bits of the MMSS clock controller on
APQ8064 / MSM8960 platforms. They are not used by the driver and do not
belong to the DRM MSM driver. Drop the file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h | 131 ----------------------------------
 1 file changed, 131 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/mmss_cc.xml.h b/drivers/gpu/drm/msm/dsi/mmss_cc.xml.h
deleted file mode 100644
index 7062f7164216..000000000000
--- a/drivers/gpu/drm/msm/dsi/mmss_cc.xml.h
+++ /dev/null
@@ -1,131 +0,0 @@
-#ifndef MMSS_CC_XML
-#define MMSS_CC_XML
-
-/* Autogenerated file, DO NOT EDIT manually!
-
-This file was generated by the rules-ng-ng headergen tool in this git repository:
-http://github.com/freedreno/envytools/
-git clone https://github.com/freedreno/envytools.git
-
-The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/msm.xml                   (    944 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml   (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp4.xml              (  20912 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp_common.xml        (   2849 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp5.xml              (  37461 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi.xml               (  18746 bytes, from 2022-04-28 17:29:36)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_v2.xml        (   3236 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_7nm.xml       (  11007 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/sfpb.xml              (    602 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/mmss_cc.xml           (   1686 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/qfprom.xml           (    600 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/hdmi.xml             (  42350 bytes, from 2022-09-20 17:45:56)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/edp/edp.xml               (  10416 bytes, from 2022-03-08 17:40:42)
-
-Copyright (C) 2013-2022 by the following authors:
-- Rob Clark <robdclark@gmail.com> (robclark)
-- Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
-
-Permission is hereby granted, free of charge, to any person obtaining
-a copy of this software and associated documentation files (the
-"Software"), to deal in the Software without restriction, including
-without limitation the rights to use, copy, modify, merge, publish,
-distribute, sublicense, and/or sell copies of the Software, and to
-permit persons to whom the Software is furnished to do so, subject to
-the following conditions:
-
-The above copyright notice and this permission notice (including the
-next paragraph) shall be included in all copies or substantial
-portions of the Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-IN NO EVENT SHALL THE COPYRIGHT OWNER(S) AND/OR ITS SUPPLIERS BE
-LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
-WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-*/
-
-
-enum mmss_cc_clk {
-	CLK = 0,
-	PCLK = 1,
-};
-
-#define REG_MMSS_CC_AHB						0x00000008
-
-static inline uint32_t __offset_CLK(enum mmss_cc_clk idx)
-{
-	switch (idx) {
-		case CLK: return 0x0000004c;
-		case PCLK: return 0x00000130;
-		default: return INVALID_IDX(idx);
-	}
-}
-static inline uint32_t REG_MMSS_CC_CLK(enum mmss_cc_clk i0) { return 0x00000000 + __offset_CLK(i0); }
-
-static inline uint32_t REG_MMSS_CC_CLK_CC(enum mmss_cc_clk i0) { return 0x00000000 + __offset_CLK(i0); }
-#define MMSS_CC_CLK_CC_CLK_EN					0x00000001
-#define MMSS_CC_CLK_CC_ROOT_EN					0x00000004
-#define MMSS_CC_CLK_CC_MND_EN					0x00000020
-#define MMSS_CC_CLK_CC_MND_MODE__MASK				0x000000c0
-#define MMSS_CC_CLK_CC_MND_MODE__SHIFT				6
-static inline uint32_t MMSS_CC_CLK_CC_MND_MODE(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_CC_MND_MODE__SHIFT) & MMSS_CC_CLK_CC_MND_MODE__MASK;
-}
-#define MMSS_CC_CLK_CC_PMXO_SEL__MASK				0x00000300
-#define MMSS_CC_CLK_CC_PMXO_SEL__SHIFT				8
-static inline uint32_t MMSS_CC_CLK_CC_PMXO_SEL(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_CC_PMXO_SEL__SHIFT) & MMSS_CC_CLK_CC_PMXO_SEL__MASK;
-}
-
-static inline uint32_t REG_MMSS_CC_CLK_MD(enum mmss_cc_clk i0) { return 0x00000004 + __offset_CLK(i0); }
-#define MMSS_CC_CLK_MD_D__MASK					0x000000ff
-#define MMSS_CC_CLK_MD_D__SHIFT					0
-static inline uint32_t MMSS_CC_CLK_MD_D(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_MD_D__SHIFT) & MMSS_CC_CLK_MD_D__MASK;
-}
-#define MMSS_CC_CLK_MD_M__MASK					0x0000ff00
-#define MMSS_CC_CLK_MD_M__SHIFT					8
-static inline uint32_t MMSS_CC_CLK_MD_M(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_MD_M__SHIFT) & MMSS_CC_CLK_MD_M__MASK;
-}
-
-static inline uint32_t REG_MMSS_CC_CLK_NS(enum mmss_cc_clk i0) { return 0x00000008 + __offset_CLK(i0); }
-#define MMSS_CC_CLK_NS_SRC__MASK				0x0000000f
-#define MMSS_CC_CLK_NS_SRC__SHIFT				0
-static inline uint32_t MMSS_CC_CLK_NS_SRC(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_NS_SRC__SHIFT) & MMSS_CC_CLK_NS_SRC__MASK;
-}
-#define MMSS_CC_CLK_NS_PRE_DIV_FUNC__MASK			0x00fff000
-#define MMSS_CC_CLK_NS_PRE_DIV_FUNC__SHIFT			12
-static inline uint32_t MMSS_CC_CLK_NS_PRE_DIV_FUNC(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_NS_PRE_DIV_FUNC__SHIFT) & MMSS_CC_CLK_NS_PRE_DIV_FUNC__MASK;
-}
-#define MMSS_CC_CLK_NS_VAL__MASK				0xff000000
-#define MMSS_CC_CLK_NS_VAL__SHIFT				24
-static inline uint32_t MMSS_CC_CLK_NS_VAL(uint32_t val)
-{
-	return ((val) << MMSS_CC_CLK_NS_VAL__SHIFT) & MMSS_CC_CLK_NS_VAL__MASK;
-}
-
-#define REG_MMSS_CC_DSI2_PIXEL_CC				0x00000094
-
-#define REG_MMSS_CC_DSI2_PIXEL_NS				0x000000e4
-
-#define REG_MMSS_CC_DSI2_PIXEL_CC2				0x00000264
-
-
-#endif /* MMSS_CC_XML */

-- 
2.39.2

