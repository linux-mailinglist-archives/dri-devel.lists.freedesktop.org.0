Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3843F3D15BA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 19:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBD96EC4F;
	Wed, 21 Jul 2021 17:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D296EC5B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 17:56:28 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id m3so2855708qkm.10
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 10:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i4iCyOB72WxlTn6HE/+0gEExmjPFigo8e2AbmHqGhjo=;
 b=WKT/WJWQtFWFas/T5Lqo24e+VBZ9T/eiQOyxL9dgO2l5qlyvOUqgduacA+dHmd+7P2
 Kh0nLDeYcx9EkcMj1IVgBs5yFa2r/7uSRuLr+i/4xszsI7fWFurw/fWArofPToflUDYl
 bgP3o8JVF3ZRmsI+oL1LblQDhWUlV5rFYdstH1OdrkRmogwg4Ade6AdDGkaztraI4Y2w
 x83rrlnIKh3C/FuqkveDZA6tkk9fkS0rAfOQHzRXuCoL9xIPKGCNTl1B8ZB5/bVJDNvR
 A2yBqxu8vaJIpfJ4gzV1GA3rY99H7hlpr44IRlgdKovIT92JAjSYPZxO+15KTyQlxnnP
 NyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i4iCyOB72WxlTn6HE/+0gEExmjPFigo8e2AbmHqGhjo=;
 b=tWER5LujJ7TGBaLBhLWhC/5i5J5ASpFYlyuwtYW6MxYTQ1PqDxKo8NwyBQKkG7O3hk
 oiOIb73JWW7uWmdvvQlUbLX5I1B8qzJZ85LTOE2bnZaLyvhQhPreew+tkXi8WKrc8N/U
 /JHLxLPvdOYfUk2ovTau2tHVJXgFy4kZDgD3Rg70aoKCfiO3UbD0/2wRvBG+UJT6nK4X
 cqBGrrSyl7s1weDToCVZ49s9RyKqY3V05nH3ZUcRI1GhQpWEIEQmfJnS+6ysA1E5Zn9T
 EzEy2ZQffXxAGeawT14EdbbCdhL/se46QY+EBdZ9FpH0e0SX0VuJoOze1Dx3uiu58LVD
 5rPw==
X-Gm-Message-State: AOAM531gBCYAxcbu6K3Gz3RT7VpHRXdqAULrwmf49gEYvkvKn6M/Q15u
 mAKddWJCuyJKmXbKeXsN7yj+KGXxqmQ+tg==
X-Google-Smtp-Source: ABdhPJwhrDAxoYMVgm7Qe3fcosP73WqGWu0xgInEgMwFd+sHNblt+LtXUa1w0wE3OUBJL93p1suk+g==
X-Received: by 2002:a37:670e:: with SMTP id b14mr36608807qkc.240.1626890187280; 
 Wed, 21 Jul 2021 10:56:27 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id bl41sm1054767qkb.17.2021.07.21.10.56.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Jul 2021 10:56:27 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch
Subject: [RESEND PATCH v6 13/14] drm/atomic: Use debug category printer for
 atomic state printer
Date: Wed, 21 Jul 2021 13:55:20 -0400
Message-Id: <20210721175526.22020-14-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210721175526.22020-1-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
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
Cc: Sean Paul <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

The atomic state is printed if the DRM_UT_STATE is active, but it's
printed at INFO level. This patch converts it to use the debug
category printer so:

a- it's consistent with other DRM_UT_STATE logging
b- it's properly routed through drm_trace when introduced

Signed-off-by: Sean Paul <seanpaul@chromium.org>

Changes in v6:
-Added to the set
---
 drivers/gpu/drm/drm_atomic_uapi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 7e48d40600ff..7615ded60195 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1322,7 +1322,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	struct drm_out_fence_state *fence_state;
 	int ret = 0;
 	unsigned int i, j, num_fences;
-	struct drm_printer p = drm_info_printer(dev->dev);
+	struct drm_printer p = drm_debug_category_printer(DRM_UT_STATE, "commit_state");
 
 	/* disallow for drivers not supporting atomic: */
 	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
-- 
Sean Paul, Software Engineer, Google / Chromium OS

