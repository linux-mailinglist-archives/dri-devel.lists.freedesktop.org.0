Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AF0889493
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 09:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D366B10E66A;
	Mon, 25 Mar 2024 08:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IBgodZ4F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8A610E179
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 03:35:39 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-5dbf7b74402so2100858a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Mar 2024 20:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711337738; x=1711942538; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JsOqF23nizDyVla4cEqGdF84V6TG9vf5xCFejd3HW00=;
 b=IBgodZ4FjokHSvteNNaH4aOMoK+tNMUz/jWC/1RI1RUyPyuiSvLVClLwl3M/8uz6Ql
 Sy8af3eXmu0WLPpyv4+LBc6ozDARGCQ8GEYNLzT1/VhTse1JNtjJr0c2tXjE7QfpHYP5
 MA67i/9P0Z2KalzQJOcJN1q4uy+7mgfb5uncjiCVvWNR9T+QJEzSktwuiPTmi2fyfu5J
 zNv/wevGkxABSD/EGYShOGni5bl0CQGwfLfMTkxoHyQjh9M4NJirXflxYWnvqNrDVQuk
 57PMFn+vT1Z/G/82TYU2P03sJWqm7FTBzk3ZXK83G4/elF43nuyc5nVkWQiPmx14498Z
 ghMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711337738; x=1711942538;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JsOqF23nizDyVla4cEqGdF84V6TG9vf5xCFejd3HW00=;
 b=tVvADwLt60+0LFUuDWUzg3xdJDVXoHM08t/Oy6+eVuWKOMyRYCMhOgjX4dbL0z85kF
 zYBzriEUJD5MVp75sIzz3LRzH5wtDUlLNb8pnyHIBxdvNOdkqIHRNFUVxu/lIJz90XLJ
 BIdSHv/leq/jYz6izHbxQHMieWArpvow671lRvf4xyAOCJIASPtjZ4NyXRmiYO8vmsw/
 PsR0NFY3MMG3yyfolyEQY1F1iH8YV6YG2XMhvbb4kvmDaT4fg7KipfuxhvUG5/oINVcS
 2xCnX8jkwUNnFFKU0zhM7+t9VXUbBq/0h5QNNe/Qc6JJGH/8SgpDCLxRkRtb9hbVycjV
 0c6Q==
X-Gm-Message-State: AOJu0YzY6ne/B1+v1Xqv6OWg5U2qj3bogo8rr85iJwnd+TJTxpqaFND7
 tyTiw+xl6flw8L2GubppDod88rAOP1xBn41eQPuGwVOdYAKZd2fE
X-Google-Smtp-Source: AGHT+IHKAKPuNbizbOLeilWfOH0Wq1WODiKdBvp4HX4Sqm8mUd+l6HnF45FHhvBSOfzobqhcOf1opA==
X-Received: by 2002:a17:902:9a48:b0:1dc:79e3:c8ed with SMTP id
 x8-20020a1709029a4800b001dc79e3c8edmr5420981plv.31.1711337738516; 
 Sun, 24 Mar 2024 20:35:38 -0700 (PDT)
Received: from JammyHuang-PC.aspeed.com ([118.99.208.177])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a170902da8b00b001e0c5be4e2esm366837plx.48.2024.03.24.20.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 20:35:38 -0700 (PDT)
From: Jammy Huang <orbit.huang@gmail.com>
X-Google-Original-From: Jammy Huang <jammy_huang@aspeedtech.com>
To: tzimmermann@suse.de, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jammy Huang <jammy_huang@aspeedtech.com>
Subject: [PATCH] drm/ast: Fix soft lockup
Date: Mon, 25 Mar 2024 11:35:15 +0800
Message-Id: <20240325033515.814-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 25 Mar 2024 08:02:55 +0000
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

Avoid infinite-loop in ast_dp_set_on_off().

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/gpu/drm/ast/ast_dp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index ebb6d8ebd44e..1e9259416980 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -180,6 +180,7 @@ void ast_dp_set_on_off(struct drm_device *dev, bool on)
 {
 	struct ast_device *ast = to_ast_device(dev);
 	u8 video_on_off = on;
+	u32 i = 0;
 
 	// Video On/Off
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE3, (u8) ~AST_DP_VIDEO_ENABLE, on);
@@ -192,6 +193,8 @@ void ast_dp_set_on_off(struct drm_device *dev, bool on)
 						ASTDP_MIRROR_VIDEO_ENABLE) != video_on_off) {
 			// wait 1 ms
 			mdelay(1);
+			if (++i > 200)
+				break;
 		}
 	}
 }

base-commit: b0546776ad3f332e215cebc0b063ba4351971cca
-- 
2.25.1

