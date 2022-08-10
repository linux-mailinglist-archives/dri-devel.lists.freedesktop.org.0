Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7359458E8E9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 10:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D0CF26E2;
	Wed, 10 Aug 2022 08:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC95EF2603
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 08:37:28 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id p8so13604106plq.13
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 01:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=DlRTchSrzeAqXD0wdz67azlV3bDFmBslifJgwlEGxrM=;
 b=XiblQ0IjpoXyM6X8nG1Bqtjxl+4Rp39neB/BGQgF1rb/xUqeUS7R9Ojxxnp0hwZiam
 gWgc+4uN29aGkxpDLV906WmjMuTxi7boS0vwrB0q60mrq4JeEgmMSorVgA8xfwapewp/
 stAcBju6WaL03CGT/F9P/DzwBPk/wGamp4rKdwMeXasvjZ7lEFvfGvDitdQBnlPr+xuA
 j2LUvTQLykL167pOfsDBf6T8QOYtQb11SaIMh6aaFu3Ebx+4OBwETfjQi6xP4DxZMzG7
 ftoFdA9c6HYJhg+vztVE/xfuquZwv3ksxOM3RHN1UpDaqYLxJV0Vuc+Y/FKtSASetcxn
 IIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=DlRTchSrzeAqXD0wdz67azlV3bDFmBslifJgwlEGxrM=;
 b=CYRNgJXnFhZKw+vhVVSq2cqQnG3jmJnvGcYOTOxvKzNHRWdLcuiv5ajWOjJT8KpUEq
 jxYELyDHp/d1W+5UXuOc8M272toCLs3Bg4YMCuWJDhr1U3k7x52P4aPmkCAe18sZK7cZ
 lzWJs9xw+ikk8oo4U1bQZmYEMwG37+nvf8UYkHxB43ay4SJ5SzOfo9elqwVbfdnu/i8/
 y0lcB3ayyl+HSEBRVVpmet5K7tBik3EzYR3l8LyxO2WJFIGy25P73wOnK9aHspzkcqjo
 pp+jz2H2EZZ2hLvhsT12Ee8mdgDtwaZENG7HDKaZir12rdk2DntQbvM2L6cv4slNtfBK
 c69A==
X-Gm-Message-State: ACgBeo2gSYbOv2h0C6cdZNoxTq01nIRw95jhezuyjmFEOaTAb3D1AwHz
 bwe5ajZiG3Iyme53lVro+WcarHTmmkRzVQ==
X-Google-Smtp-Source: AA6agR5u/K6sPizHHrobatXs/nWTKWNULiDkMsbUmVu44yCeLzjkRs56eKuLL6inCGwILPvj05VDaQ==
X-Received: by 2002:a17:90b:38cc:b0:1f7:2835:d45e with SMTP id
 nn12-20020a17090b38cc00b001f72835d45emr2494905pjb.177.1660120648422; 
 Wed, 10 Aug 2022 01:37:28 -0700 (PDT)
Received: from taki-u2.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 f1-20020aa79681000000b0052d63fb109asm1323607pfk.20.2022.08.10.01.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 01:37:28 -0700 (PDT)
From: Takanari Hayama <taki@igel.co.jp>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/3] drm: rcar-du: Add DRM_MODE_BLEND_PIXEL_NONE support
Date: Wed, 10 Aug 2022 17:37:11 +0900
Message-Id: <20220810083711.219642-4-taki@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220810083711.219642-1-taki@igel.co.jp>
References: <20220810083711.219642-1-taki@igel.co.jp>
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
Cc: Takanari Hayama <taki@igel.co.jp>, airlied@linux.ie,
 kieran.bingham+renesas@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 mchehab@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM_MODE_BLEND_PIXEL_NONE ignores an alpha channel.

Rcar-du driver supports only 3 formats with an alpha channel
(DRM_FORMAT_ARGB1555, DRM_FORMAT_ARGB8888 and DRM_FORMAT_ARGB4444). We
simply override the format passed to VSP1 for blending with the pixel
format without alpha channel.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Takanari Hayama <taki@igel.co.jp>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index b9580fcfec7a..7cce2d414ced 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -151,6 +151,7 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 		.alpha = state->state.alpha >> 8,
 		.zpos = state->state.zpos,
 	};
+	u32 fourcc = state->format->fourcc;
 	unsigned int i;
 
 	cfg.src.left = state->state.src.x1 >> 16;
@@ -169,7 +170,23 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 
 	cfg.premult = (state->state.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI);
 
-	format = rcar_du_format_info(state->format->fourcc);
+	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
+		switch (fourcc) {
+		case DRM_FORMAT_ARGB1555:
+			fourcc = DRM_FORMAT_XRGB1555;
+			break;
+
+		case DRM_FORMAT_ARGB4444:
+			fourcc = DRM_FORMAT_XRGB4444;
+			break;
+
+		case DRM_FORMAT_ARGB8888:
+			fourcc = DRM_FORMAT_XRGB8888;
+			break;
+		}
+	}
+
+	format = rcar_du_format_info(fourcc);
 	cfg.pixelformat = format->v4l2;
 
 	vsp1_du_atomic_update(plane->vsp->vsp, crtc->vsp_pipe,
@@ -447,6 +464,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		}
 
 		drm_plane_create_blend_mode_property(&plane->plane,
+					BIT(DRM_MODE_BLEND_PIXEL_NONE) |
 					BIT(DRM_MODE_BLEND_PREMULTI) |
 					BIT(DRM_MODE_BLEND_COVERAGE));
 
-- 
2.25.1

