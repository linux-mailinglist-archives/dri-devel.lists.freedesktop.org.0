Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 796991F2135
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 23:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325C66E99F;
	Mon,  8 Jun 2020 21:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2777C6E99F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 21:05:59 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id w3so18774930qkb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 14:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3lGoCASmqmL0XGiwgCZ6IM26DMk0q5eTR7kt4CPxXww=;
 b=BG19wTK0x5LAh+DAGVfERtOj2MwsfYjUNa05eEj3LkEcCnV2ed/Oa6lxdi42MOkN02
 wdP6DMHAneF9NWov5i5r1CFDOy7hkusEDIaJgnKFxaEHrMUv6EeZHXe2Yyx0uMuSA1Bk
 /FXUh7bKWDuHkLQOikYie/y2e9JZnP+FoSl9f0A1aXxopgbXMFSFucy1aMECnVzm1THG
 jhp55w7SJ+z3yBgMZKwcbfBD+kdKYgapYyevaSZ6fJTVr8KpQeyANibXqhHlRPVHyMci
 myxG8ISvMhiDMO/PyWGsc60TATvNaOLWm1czmQc2kXHcT230sr58ZoGGDkTDrifiwEll
 j/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3lGoCASmqmL0XGiwgCZ6IM26DMk0q5eTR7kt4CPxXww=;
 b=JetVhsqY/Asm3Ao8qsmsHwRcDjo4c1NLixtuELf23becYcXMAC7+n+ZYqO3JcGdKYs
 cQRu/QExpEUx87Ao979ao1TiNz+BqIK+etG+0mCFP++dpBYoBt9uJLgxYbZgTKXBRnXQ
 SS6NIb9w49CBGF55f9le3zTpA/Sik/qppyCFnuqFfPQqbt265Fs2VAEB+0pjsDjWIoUo
 KdETQj9ghfc7eDsQpJ3zJ04MiM98QWeSVy8fowk2Fq7oRygPWQWY3xmVQ8TamhuOXkM3
 zeLzW/rEeAzydHyF1iDSaEPQZUVTtQ+88sQtok3XCrpv5QTULjTN4zKrdM4NoPqkLIM6
 AIrQ==
X-Gm-Message-State: AOAM533WgS5ez5RXxkBsjHBS0c+CAJ76CvgfSpQEDAy2yCIbWqknjaWP
 P0wZKDZUHWUKoK27PuO+7amNVwGaSME=
X-Google-Smtp-Source: ABdhPJw8Jjk7oif/BBxPbHlXuh/tL5TFWd+obsWTrGA596OmBAk4bdIfGNk7j9+0DpB8+KziOP5gVA==
X-Received: by 2002:a05:620a:133b:: with SMTP id
 p27mr23224008qkj.444.1591650358159; 
 Mon, 08 Jun 2020 14:05:58 -0700 (PDT)
Received: from localhost (mobile-166-173-249-24.mycingular.net.
 [166.173.249.24])
 by smtp.gmail.com with ESMTPSA id a27sm8698275qtc.92.2020.06.08.14.05.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Jun 2020 14:05:57 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 06/13] drm/amd: Gate i2c transaction logs on
 drm_debug_syslog
Date: Mon,  8 Jun 2020 17:04:56 -0400
Message-Id: <20200608210505.48519-7-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608210505.48519-1-sean@poorly.run>
References: <20200608210505.48519-1-sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 Sean Paul <seanpaul@chromium.org>, amd-gfx@lists.freedesktop.org,
 tzimmermann@suse.de, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Since the logs protected by these checks specifically target syslog,
use the new drm_debug_syslog_enabled() call to avoid triggering
these prints when only trace is enabled.

Signed-off-by: Sean Paul <seanpaul@chromium.org>

Changes in v5:
-Added to the set
---
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c b/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c
index 9bffbab35041..9bc6baddd302 100644
--- a/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c
@@ -233,7 +233,7 @@ static uint32_t smu_v11_0_i2c_transmit(struct i2c_adapter *control,
 	DRM_DEBUG_DRIVER("I2C_Transmit(), address = %x, bytes = %d , data: ",
 		 (uint16_t)address, numbytes);
 
-	if (drm_debug_enabled(DRM_UT_DRIVER)) {
+	if (drm_debug_syslog_enabled(DRM_UT_DRIVER)) {
 		print_hex_dump(KERN_INFO, "data: ", DUMP_PREFIX_NONE,
 			       16, 1, data, numbytes, false);
 	}
@@ -387,7 +387,7 @@ static uint32_t smu_v11_0_i2c_receive(struct i2c_adapter *control,
 	DRM_DEBUG_DRIVER("I2C_Receive(), address = %x, bytes = %d, data :",
 		  (uint16_t)address, bytes_received);
 
-	if (drm_debug_enabled(DRM_UT_DRIVER)) {
+	if (drm_debug_syslog_enabled(DRM_UT_DRIVER)) {
 		print_hex_dump(KERN_INFO, "data: ", DUMP_PREFIX_NONE,
 			       16, 1, data, bytes_received, false);
 	}
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
