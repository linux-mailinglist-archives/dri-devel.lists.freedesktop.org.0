Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 090E1394B91
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 12:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0611F6E84F;
	Sat, 29 May 2021 10:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61656F5C0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 13:06:18 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id ci15so1875809ejc.10
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 06:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MW0JHxZuI2Zb8ESdRdSCjrHhcXSDEM8LLD+9HCmxueM=;
 b=NXyErXuuCFvYRyHv6PKtelWFJwX0pCLLtkw1Ax6t9V++bMU/W+XsKExHHRhBYUm+VB
 MF3SzFEmpTW6qfvLm6hyYCD5o0f/a/NyevjTVrFtlbLUvSx2cAyZwU0XPUqltZQF8wfY
 IyUyDgPj34Jh/YbThZpknN8bYfFMf3sLRKdmfOmNIhcUW48zXbDZKT1hiKTdR96dZDpU
 83DlAnMQGDHfviEAFYTp24vy4UAdCFz5mncNgutp3rOnkrzCzDxEhiSQg7vjws9y9zBb
 /071FQz5gbcD4LDAUN7+6Ydf33ZpG/OE6mCIB76x3o4vLh6bYWvFcQmkhFvBX3zFdFDJ
 IvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MW0JHxZuI2Zb8ESdRdSCjrHhcXSDEM8LLD+9HCmxueM=;
 b=oNGvmv3BaUtqknt3jQdS87/cyzPYfHhTwyHlDZBdd7mRXJD/I3Y/UaNerSnQfpwwUf
 ED8VcqRLKNKFCNdUbw/cmluGzNzFca0dtqCK5zHQMA8zqGP4BNE68RWx+VnKaUjJDTlo
 Xn9+IPBz0uEDxeweJ4eqKImMXlxAcSp3vPYNLpJOjdkfa0xWhg+bz8FmLP7hsCYzSgFB
 Ay9cG/qQTVP6ANQWMYOPoMNIvwk5YIuIiFaR1kmg8/7XrNggGA0iuAotCFKke8Srlvej
 zVuol10MtEgz0hZVkGQjF0DV1RjlIOKY94ClpsKd7NrPRJbpFV8ncc8C5miMxoFszuOV
 CREQ==
X-Gm-Message-State: AOAM533ToM9bxUK/lsTRb4UD4H3PS8e7V837XOB535SRCgbxB/9dsm3o
 +YHcZeHGGuYjEmQv2QSYDQ==
X-Google-Smtp-Source: ABdhPJz+OvGcA2tPJTL3NpUU85LDUV0aYC2bpveQ4Mp2vRSX+6IkJuQMfvbFfJzASrEuYymoVJNqvA==
X-Received: by 2002:a17:906:7c52:: with SMTP id
 g18mr1882298ejp.420.1622207177464; 
 Fri, 28 May 2021 06:06:17 -0700 (PDT)
Received: from localhost.localdomain (ip4d17b4b8.dynamic.kabel-deutschland.de.
 [77.23.180.184])
 by smtp.googlemail.com with ESMTPSA id u21sm2322778ejg.50.2021.05.28.06.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 06:06:17 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v3 4/5] drm: rockchip: add alpha support for RK3036, RK3066,
 RK3126 and RK3188
Date: Fri, 28 May 2021 15:05:53 +0200
Message-Id: <20210528130554.72191-5-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528130554.72191-1-knaerzche@gmail.com>
References: <20210528130554.72191-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 29 May 2021 10:14:11 +0000
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
Cc: David Airlie <airlied@linux.ie>, Alex Bee <knaerzche@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With
commit 2aae8ed1f390 ("drm/rockchip: Add per-pixel alpha support for the PX30 VOP")
alpha support was introduced for PX30's VOP.
RK3036, RK3066, RK3126 and RK3188 VOPs support alpha blending in the
same manner.
With the exception of RK3066 all of them support pre-multiplied alpha.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---

 Changes in v2:
 - rephrase commit message

 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index b7c51933729f..4d18b42f522b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -104,6 +104,9 @@ static const struct vop_win_phy rk3036_win0_data = {
 	.uv_mst = VOP_REG(RK3036_WIN0_CBR_MST, 0xffffffff, 0),
 	.yrgb_vir = VOP_REG(RK3036_WIN0_VIR, 0xffff, 0),
 	.uv_vir = VOP_REG(RK3036_WIN0_VIR, 0x1fff, 16),
+	.alpha_mode = VOP_REG(RK3036_DSP_CTRL0, 0x1, 18),
+	.alpha_en = VOP_REG(RK3036_ALPHA_CTRL, 0x1, 0),
+	.alpha_pre_mul = VOP_REG(RK3036_DSP_CTRL0, 0x1, 29),
 };
 
 static const struct vop_win_phy rk3036_win1_data = {
@@ -119,6 +122,9 @@ static const struct vop_win_phy rk3036_win1_data = {
 	.dsp_st = VOP_REG(RK3036_WIN1_DSP_ST, 0x1fff1fff, 0),
 	.yrgb_mst = VOP_REG(RK3036_WIN1_MST, 0xffffffff, 0),
 	.yrgb_vir = VOP_REG(RK3036_WIN1_VIR, 0xffff, 0),
+	.alpha_mode = VOP_REG(RK3036_DSP_CTRL0, 0x1, 19),
+	.alpha_en = VOP_REG(RK3036_ALPHA_CTRL, 0x1, 1),
+	.alpha_pre_mul = VOP_REG(RK3036_DSP_CTRL0, 0x1, 29),
 };
 
 static const struct vop_win_data rk3036_vop_win_data[] = {
@@ -185,6 +191,9 @@ static const struct vop_win_phy rk3126_win1_data = {
 	.dsp_st = VOP_REG(RK3126_WIN1_DSP_ST, 0x1fff1fff, 0),
 	.yrgb_mst = VOP_REG(RK3126_WIN1_MST, 0xffffffff, 0),
 	.yrgb_vir = VOP_REG(RK3036_WIN1_VIR, 0xffff, 0),
+	.alpha_mode = VOP_REG(RK3036_DSP_CTRL0, 0x1, 19),
+	.alpha_en = VOP_REG(RK3036_ALPHA_CTRL, 0x1, 1),
+	.alpha_pre_mul = VOP_REG(RK3036_DSP_CTRL0, 0x1, 29),
 };
 
 static const struct vop_win_data rk3126_vop_win_data[] = {
@@ -364,6 +373,8 @@ static const struct vop_win_phy rk3066_win0_data = {
 	.uv_mst = VOP_REG(RK3066_WIN0_CBR_MST0, 0xffffffff, 0),
 	.yrgb_vir = VOP_REG(RK3066_WIN0_VIR, 0xffff, 0),
 	.uv_vir = VOP_REG(RK3066_WIN0_VIR, 0x1fff, 16),
+	.alpha_mode = VOP_REG(RK3066_DSP_CTRL0, 0x1, 21),
+	.alpha_en = VOP_REG(RK3066_BLEND_CTRL, 0x1, 0),
 };
 
 static const struct vop_win_phy rk3066_win1_data = {
@@ -380,6 +391,8 @@ static const struct vop_win_phy rk3066_win1_data = {
 	.uv_mst = VOP_REG(RK3066_WIN1_CBR_MST, 0xffffffff, 0),
 	.yrgb_vir = VOP_REG(RK3066_WIN1_VIR, 0xffff, 0),
 	.uv_vir = VOP_REG(RK3066_WIN1_VIR, 0x1fff, 16),
+	.alpha_mode = VOP_REG(RK3066_DSP_CTRL0, 0x1, 22),
+	.alpha_en = VOP_REG(RK3066_BLEND_CTRL, 0x1, 1),
 };
 
 static const struct vop_win_phy rk3066_win2_data = {
@@ -393,6 +406,8 @@ static const struct vop_win_phy rk3066_win2_data = {
 	.dsp_st = VOP_REG(RK3066_WIN2_DSP_ST, 0x1fff1fff, 0),
 	.yrgb_mst = VOP_REG(RK3066_WIN2_MST, 0xffffffff, 0),
 	.yrgb_vir = VOP_REG(RK3066_WIN2_VIR, 0xffff, 0),
+	.alpha_mode = VOP_REG(RK3066_DSP_CTRL0, 0x1, 23),
+	.alpha_en = VOP_REG(RK3066_BLEND_CTRL, 0x1, 2),
 };
 
 static const struct vop_modeset rk3066_modeset = {
@@ -478,6 +493,9 @@ static const struct vop_win_phy rk3188_win0_data = {
 	.yrgb_mst = VOP_REG(RK3188_WIN0_YRGB_MST0, 0xffffffff, 0),
 	.uv_mst = VOP_REG(RK3188_WIN0_CBR_MST0, 0xffffffff, 0),
 	.yrgb_vir = VOP_REG(RK3188_WIN_VIR, 0x1fff, 0),
+	.alpha_mode = VOP_REG(RK3188_DSP_CTRL0, 0x1, 18),
+	.alpha_en = VOP_REG(RK3188_ALPHA_CTRL, 0x1, 0),
+	.alpha_pre_mul = VOP_REG(RK3188_DSP_CTRL0, 0x1, 29),
 };
 
 static const struct vop_win_phy rk3188_win1_data = {
@@ -492,6 +510,9 @@ static const struct vop_win_phy rk3188_win1_data = {
 	.dsp_st = VOP_REG(RK3188_WIN1_DSP_ST, 0x0fff0fff, 0),
 	.yrgb_mst = VOP_REG(RK3188_WIN1_MST, 0xffffffff, 0),
 	.yrgb_vir = VOP_REG(RK3188_WIN_VIR, 0x1fff, 16),
+	.alpha_mode = VOP_REG(RK3188_DSP_CTRL0, 0x1, 19),
+	.alpha_en = VOP_REG(RK3188_ALPHA_CTRL, 0x1, 1),
+	.alpha_pre_mul = VOP_REG(RK3188_DSP_CTRL0, 0x1, 29),
 };
 
 static const struct vop_modeset rk3188_modeset = {
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.h b/drivers/gpu/drm/rockchip/rockchip_vop_reg.h
index 6e9fa5815d4d..0b3cd65ba5c1 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.h
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.h
@@ -955,6 +955,7 @@
 #define RK3188_DSP_CTRL0		0x04
 #define RK3188_DSP_CTRL1		0x08
 #define RK3188_INT_STATUS		0x10
+#define RK3188_ALPHA_CTRL		0x14
 #define RK3188_WIN0_YRGB_MST0		0x20
 #define RK3188_WIN0_CBR_MST0		0x24
 #define RK3188_WIN0_YRGB_MST1		0x28
-- 
2.27.0

