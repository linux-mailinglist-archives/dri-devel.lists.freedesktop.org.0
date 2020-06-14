Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 954EE1F8F99
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8936E0C6;
	Mon, 15 Jun 2020 07:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6ED189B4D
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 06:59:26 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id i1so12433860ils.11
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 23:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=auNQFE3Ts/lVKnLWQnQdPedtvSl90z04f6oWD1caeAc=;
 b=fr93qj4cO5q9jan80fW8xtu+/eibTNkcbWX449Tp/akm4f6PjZ8mDsVrgyjU/Empj9
 942OISwA9bSU8EkzzJKKUspnzShkwbC3ctM6GNXC/vFp4d2IzrHolJnTRhAu9WY2U05n
 46Jv9dB+ChM2nehsNXfLwJVmCtIzhdYw4BxQzSQu6tLvL98HMtl473sY4NqSYhMRk/vR
 33/SsYcnpaEO+62gJXefyW3is8G1hvievGgWQbFfmVweFVzPgEfNF5jcMtbHXCvLTgQY
 m8wQ9mxxeXAT5kpmSAeWFMG5+DkIeSjcsXmx1v5GRCcNneem1mZ2P21CEHhSnOaCbJuJ
 dcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=auNQFE3Ts/lVKnLWQnQdPedtvSl90z04f6oWD1caeAc=;
 b=cytiH8RGxEdwsqRFK6lhNAoc8BGIypjh7IrLEYHp1l1I6HA/2zTbJ6b+P3AA+cTDzF
 G08dD+uE12qb4z39+shECpkXjMK95xIiRZN2c6qD0FayzAp3rh1vaP4fLfZdqfA0vOg8
 Jml8MRzjj0A6PKlU3HBqQK6XNFTX4U/Ej1JnzyJWFA6zDtcnDH3OBwc7Z+xpKCcfUNct
 TBdxMT3i6mOCK6YCn4eWTP3bA2NPwjuTWb8fchxttskg+jCM9+DHxu5DFZaDeGJSORvY
 ovwubEvThcOxGKMcS2Jz693KuryeO9sbdB8R5sJmcEiiKlYJjljOPjFX45q4tXHlzQz/
 tjWg==
X-Gm-Message-State: AOAM532AIa5M+EeOUSNRWAmcOJCIGibgATjD9NhXpygouOqmqmLo3fXD
 pXv1Xrbes1n0rLLQkLYjFAc=
X-Google-Smtp-Source: ABdhPJweiJFF+5LqULDJLR2TwZW0TiEJ6Awp1CZ6WxSBn7w2pKBXDZWYH9RovwOg6lM/3x/4Qtkltw==
X-Received: by 2002:a92:cec3:: with SMTP id z3mr19504546ilq.183.1592117966166; 
 Sat, 13 Jun 2020 23:59:26 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
 by smtp.googlemail.com with ESMTPSA id b29sm5843375ioc.32.2020.06.13.23.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 23:59:25 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vc4: fix ref count leak in vc4_vec_encoder_enable
Date: Sun, 14 Jun 2020 01:59:18 -0500
Message-Id: <20200614065918.18738-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: Navid Emamdoost <navid.emamdoost@gmail.com>, emamd001@umn.edu, kjlu@umn.edu,
 wu000273@umn.edu, smccaman@umn.edu
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

in vc4_vec_encoder_enable, the call to pm_runtime_get_sync increments
the counter even in case of failure, leading to incorrect
ref count. In case of failure, decrement the ref count before returning.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index bd5b8eb58b18..706fdc7758f9 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -406,7 +406,7 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder)
 	ret = pm_runtime_get_sync(&vec->pdev->dev);
 	if (ret < 0) {
 		DRM_ERROR("Failed to retain power domain: %d\n", ret);
-		return;
+		goto out;
 	}
 
 	/*
@@ -419,13 +419,13 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder)
 	ret = clk_set_rate(vec->clock, 108000000);
 	if (ret) {
 		DRM_ERROR("Failed to set clock rate: %d\n", ret);
-		return;
+		goto out;
 	}
 
 	ret = clk_prepare_enable(vec->clock);
 	if (ret) {
 		DRM_ERROR("Failed to turn on core clock: %d\n", ret);
-		return;
+		goto out;
 	}
 
 	/* Reset the different blocks */
@@ -464,6 +464,8 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder)
 	VEC_WRITE(VEC_DAC_MISC,
 		  VEC_DAC_MISC_VID_ACT | VEC_DAC_MISC_DAC_RST_N);
 	VEC_WRITE(VEC_CFG, VEC_CFG_VEC_EN);
+out:
+	pm_runtime_put(&vec->pdev->dev);
 }
 
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
