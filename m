Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 832E63D15AD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 19:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944CD6EB70;
	Wed, 21 Jul 2021 17:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598E56EB74
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 17:55:59 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id j7so2458648qtj.6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 10:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j8lKVNX9q4Fo4fg0uvmmZGsmdf0+oqb3sZHxk/xw0uk=;
 b=Ff+jBl+uPoZFMSuLK+1AOCIUmwgotdH+8p83S+ozpaHMGmKL7LZQtjhyeAK13iIDoW
 P1JS+ndquq/AdsAQIopdOTmPgCqgfbL80sdb2H3GxZ2I70ZaxBvctBJ2VVAkNUBNxIbe
 aRNwNODXMoT42e8N7KnhxgqXJWXNmzFybwwGskRbQHEk0AuHmqB8D4iJgwaIFTout55w
 ZoPk21LzceQab73g8zs3D0+JgxCMLOJEENn+ImVz9XZdigfpJyqqN7x8usozlvU/2PMs
 OtCk/mB5k7RqcZBnszhBtACmYehtWTTUeKuhqE5Ac+D1JGXMc/Bffnaf7LZ2KVVA8kJw
 2t4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j8lKVNX9q4Fo4fg0uvmmZGsmdf0+oqb3sZHxk/xw0uk=;
 b=CmA5oejIUtBINZxCojTTR7ZR1iFhOrxTAtMD/zDth2F/FaSXY4CA575tOdckA8v0IK
 ZjO44Ol9WDfDG+FcEb6wBDyfaMUHfdzQSxTAHIuxxZisVJ/73aO7r4ISi3sl8qlp2Oww
 Q7Pt8Tk/7n+lbiqGw6mmaurSWZdTd+xMy2J+4ADPA0CWUAM2TxP+kJwAmpvqbrO2FVjS
 592wzvcZu6Fi0A6/CQafaMmQoCpv/PYUAY5RaeysqjNTDxYvIBFEElQWCU+BwoYmZmCS
 Eixn38KGzUcp9WgR8+s71c4HnoS96csbmEfPHACYfLIPBk7TIh9PWmQKuFSw8P5j/1hS
 zKMQ==
X-Gm-Message-State: AOAM533zwn7r3z0zAjjFbvJaVGjoLGqCT3UciJNN8rcsxJ3X6kHLmlmE
 q/qDB448MoU7RFa5QBdVbs6tuUw/defPqg==
X-Google-Smtp-Source: ABdhPJzWWeUCNVLICcb1swh5GDA1HtVcMPEi7ynJIbXYHmkRp/9V9gt066XUcWRC6Gj1eXwZMIST/g==
X-Received: by 2002:ac8:5a12:: with SMTP id n18mr20684605qta.3.1626890158383; 
 Wed, 21 Jul 2021 10:55:58 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id d16sm9183548qtj.69.2021.07.21.10.55.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Jul 2021 10:55:58 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch
Subject: [RESEND PATCH v6 06/14] drm/amd: Gate i2c transaction logs on
 drm_debug_syslog
Date: Wed, 21 Jul 2021 13:55:13 -0400
Message-Id: <20210721175526.22020-7-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210721175526.22020-1-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Since the logs protected by these checks specifically target syslog,
use the new drm_debug_syslog_enabled() call to avoid triggering
these prints when only trace is enabled.

Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-7-sean@poorly.run #v5

Changes in v5:
-Added to the set
Changes in v6:
-None
---
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c b/drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c
index 5c7d769aee3f..d9ceab332060 100644
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
@@ -389,7 +389,7 @@ static uint32_t smu_v11_0_i2c_receive(struct i2c_adapter *control,
 	DRM_DEBUG_DRIVER("I2C_Receive(), address = %x, bytes = %d, data :",
 		  (uint16_t)address, bytes_received);
 
-	if (drm_debug_enabled(DRM_UT_DRIVER)) {
+	if (drm_debug_syslog_enabled(DRM_UT_DRIVER)) {
 		print_hex_dump(KERN_INFO, "data: ", DUMP_PREFIX_NONE,
 			       16, 1, data, bytes_received, false);
 	}
-- 
Sean Paul, Software Engineer, Google / Chromium OS

