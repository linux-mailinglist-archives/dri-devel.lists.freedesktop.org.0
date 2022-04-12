Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983584FD1BE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 09:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AA010FEB1;
	Tue, 12 Apr 2022 07:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D0610FEB1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 07:05:11 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id w7so16667499pfu.11
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 00:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=MD2PafPOZxiALVxRANZJtJfxFryFkWiYa4P1WpagSvo=;
 b=ZoOMT2yrxzYBvfqKLstICxEU5NbOmIO81l0gvJWERON+OxWRK9IFg6/vpoIDfHAmJ6
 da4UtAu84n6WCPrn+3LyAlAG0NQpdiYQ/ZFWe0Mkr8XAUamFWjfPlLZXXOH7CNFHLSce
 HdTeQ/7o4hGeRPtNWJicF3vceIB245SwJfEbiHvo7jCiS/tdmWQctHtuWoPU2aiTWoQs
 kLfgB7c+Ov+MCQob3dYAwrmLFhxkyEIX1WBG9+aNyDcqQE0BPqgKQk7xj9t88gPlLqYY
 h4Sbw4WnxiVcPdlWg1emSanSfT8WyjqvAh701hPQqAQR+GLqZGU+hJ9oYwKMbM25KNGo
 PqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=MD2PafPOZxiALVxRANZJtJfxFryFkWiYa4P1WpagSvo=;
 b=oM23/cLrTLtkleT8Qi0Eu6orwG0AtMMVv8sEmpTU6OKsqoreUqjqgusARokpXQzn6u
 9ON3NQqTuT1euWDVPseCejeQ7doWwfTjO5ex4mc3jTej90rOS8Jd4nn5atEoc7srpDyw
 mNVfvT64ZmRoNGRoYGhpZGNazNzfcmWbWYDYTUJ7olWomuAVWtvaSvjSGuuPMWFt60ux
 emgT+6XgJ1AJfymN0r6pjaNmjhbiEkIn0vcx2XzscGKo8UxHMkuwFntDb8mBVfw3e7wY
 68PU3B5ZFELf2zoJHY99T+4WUWK4zyZE4QZoBVQZPV33EqeG9v1080Tg0OyatAd5vxeV
 p1lw==
X-Gm-Message-State: AOAM532Hlqtzu1GQQT0DVjjF3g5+aXL0bb3Xi6B98Ccok+qjsMn6jpO5
 awu5pXii//SdHpWKoo1Gak4=
X-Google-Smtp-Source: ABdhPJycADu1O3trds1gUcEXHablNZlIDVa1C9T6c102ZVWQucGUgPEoS5U0EZJPhuOsxr9sEPWpgw==
X-Received: by 2002:a65:6956:0:b0:399:1f0e:6172 with SMTP id
 w22-20020a656956000000b003991f0e6172mr29157318pgq.286.1649747110823; 
 Tue, 12 Apr 2022 00:05:10 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 g15-20020a056a000b8f00b004fa9dbf27desm38059686pfj.55.2022.04.12.00.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 00:05:10 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vc4: Fix pm_runtime_get_sync() error checking
Date: Tue, 12 Apr 2022 07:04:57 +0000
Message-Id: <20220412070458.21819-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linmq006@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the device is already in a runtime PM enabled state
pm_runtime_get_sync() will return 1, so a test for negative
value should be used to check for errors.

Fixes: 4078f5757144 ("drm/vc4: Add DSI driver")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 752f921735c6..26aa7d1fa421 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -847,7 +847,7 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 	int ret;
 
 	ret = pm_runtime_get_sync(dev);
-	if (ret) {
+	if (ret < 0) {
 		DRM_ERROR("Failed to runtime PM enable on DSI%d\n", dsi->variant->port);
 		return;
 	}
-- 
2.17.1

