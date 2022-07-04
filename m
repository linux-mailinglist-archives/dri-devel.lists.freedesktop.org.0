Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F24E566936
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25ECA10E1E2;
	Tue,  5 Jul 2022 11:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3039E10E00B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 02:52:42 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id l12so2049383plk.13
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jul 2022 19:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lZVf3tUH/gMJbN3bSxzTMFNpOOUqgp+lgLlS3ACMryU=;
 b=A9/a5QZGd8dM7D5cLyfh/RBwOulvMmGuSV6TAXSKjvR5bCDNwQuEepesBQuDW8SDwb
 8CbBKhm7ZqDHMF/VqcEw6sCl2R5uOHdgdq8J8huUnKXR2Gs7b6d5I2YnpTw3o/UvbebG
 xWHjOMyxZyLntbG6DpnJOSsK1yEUGRQAe05b+a0NhjyFnaKK3NXm4cEtGLHLzzF2gNyu
 Y98Y/bCP0H6WNWa5hy11K955DDOQEjY8ymspAHFdP95b6y2CMHymzfsd5I/JUcZWYoiw
 Jxw1BQb+f2NRxwbu55/yLX9+xuNgJrhVyfQOtQ2RkyYWPx8iNen9ApIGFHz+2/SovUlT
 SbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lZVf3tUH/gMJbN3bSxzTMFNpOOUqgp+lgLlS3ACMryU=;
 b=ECZLxx5SlkuVK2gqhge/rLuRSKfBDOXadi8CmE5TdbL0YZxWnO532UOJbmHzY9GoMG
 cHJu7OJohDA9uM20bWDyGxS4OqrAPbTCRZmHjEHeqq76mfkIf+X7fhfoQOl5mry6fwxV
 fzBcDBrqQG0QaPaGaZeHqapV+oD7OGY4kn6O2/Pz9FYNuqlBqH59Iotjo15Dd2EUzE4c
 9ndERoInC/Ith2I4m2NpbFwegeTRVF8Zj6TbBJsHBOo/M1gekFp1eV0wzkOjL+NAd5+D
 SPzgd6HDuHl9Qddav+vpBWcozfY/R24zPMhuW9CZlyeIHiW/qSaoCKHXahVa6pDI7zP8
 dmnQ==
X-Gm-Message-State: AJIora/hcG50i+b5G2MdoNnvhvz8cJ2SNbTpFGM0kZB8jcaQoeFxavGe
 89aXiQeTHTtEZ4wlwXwWJA2EHqdvG7Y5WPeT
X-Google-Smtp-Source: AGRyM1vO/Njs9T0QhxWnmdp88EO+UHnV3xJPjx2zr3gtlS9l2dz9a1jSMTXQ3cQL+jJU+j1HJ2aYvg==
X-Received: by 2002:a17:90b:1bc5:b0:1ee:9563:2fca with SMTP id
 oa5-20020a17090b1bc500b001ee95632fcamr31487156pjb.87.1656903161569; 
 Sun, 03 Jul 2022 19:52:41 -0700 (PDT)
Received: from taki-u2.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a634e4b000000b004118fd18476sm8730813pgl.60.2022.07.03.19.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 19:52:41 -0700 (PDT)
From: Takanari Hayama <taki@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm: rcar-du: Add DRM blend mode support
Date: Mon,  4 Jul 2022 11:52:31 +0900
Message-Id: <20220704025231.3911138-4-taki@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704025231.3911138-1-taki@igel.co.jp>
References: <20220704025231.3911138-1-taki@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Jul 2022 07:31:09 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham+renesas@ideasonboard.com,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R-Car DU supports different blend modes via VSP1. Add DRM blend mode
supports to make it configurable.

As drm_plane_create_blend_mode_property() creates the blend mode
property with the default value of DRM_MODE_BLEND_PREMULTI, it changes
the default blending behavior on R-Car DU. The rcar-du's blend mode was
same as DRM_MODE_BLEND_COVERAGE, i.e., pixel color values have not been
pre-multitplied.

Signed-off-by: Takanari Hayama <taki@igel.co.jp>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 8eb9b2b097ae..283327046aa5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -170,6 +170,18 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 	format = rcar_du_format_info(state->format->fourcc);
 	cfg.pixelformat = format->v4l2;
 
+	switch (state->state.pixel_blend_mode) {
+	case DRM_MODE_BLEND_PREMULTI:
+		cfg.blend_mode = VSP1_DU_BLEND_MODE_PREMULTI;
+		break;
+	case DRM_MODE_BLEND_COVERAGE:
+		cfg.blend_mode = VSP1_DU_BLEND_MODE_COVERAGE;
+		break;
+	case DRM_MODE_BLEND_PIXEL_NONE:
+		cfg.blend_mode = VSP1_DU_BLEND_MODE_PIXEL_NONE;
+		break;
+	}
+
 	vsp1_du_atomic_update(plane->vsp->vsp, crtc->vsp_pipe,
 			      plane->index, &cfg);
 }
@@ -444,6 +456,11 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 						       num_planes - 1);
 		}
 
+		drm_plane_create_blend_mode_property(&plane->plane,
+					BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					BIT(DRM_MODE_BLEND_PREMULTI) |
+					BIT(DRM_MODE_BLEND_COVERAGE));
+
 		vsp->num_planes++;
 	}
 
-- 
2.25.1

