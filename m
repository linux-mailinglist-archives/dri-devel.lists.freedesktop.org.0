Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A15AD9B480C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 12:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E9D10E625;
	Tue, 29 Oct 2024 11:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="DNJe13Eh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E179D10E625
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 11:13:15 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2e2cc469c62so3797436a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 04:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730200395; x=1730805195;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0505nJjQERl8lxM/9PvfVg4f+qO1mzi84QJZy2KWoxQ=;
 b=DNJe13EhsVmHcNuLLeO7+kPOc1q5EhpfRTBrXXAFgHPv7vHxjmwQcT8SKEgp7IM6q8
 mPS7x3cr5YoJJ8rGA3fn76QD2qtmyYuYwbRntIzjvVn7LdfzGs91Aw8CyZ070sjR6CfO
 aPBmQ61a4A0F4LZ9Vg9lHtvAHS2VeeKoJaMSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730200395; x=1730805195;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0505nJjQERl8lxM/9PvfVg4f+qO1mzi84QJZy2KWoxQ=;
 b=ecKs4k3GSRbyeCHHZoS3ez5i8iUtIP3OKqzD5P1MQ9j2omO4RAlNFvJNVYOoJDeDGB
 lRzIZOEdO4AIECjSiRqOdUqkmolGhcCnDP48fn43u9Z9RZiiRTjK5lPH/659XWAr1NV0
 z34KeHnxHQy9dx5JpYjt639HFUc60tUIi3gh9M5P+m3/6mvjOBczfo/Jn1R1616jVMUx
 aArEXLBFnBfRzCVard+jlB7wF8GyFZa81SbjlwZDlTjG9gxug8HdgnzsCyt8zr7oKk4d
 m43UKSrnEcLXl76QM9zLYBmivUE4x5KxLfCj9BBA8KCxzr2d1Xsk0IkIpsk3Y21GWvxC
 Glgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUwfQ8XEEKYqgz6WnwiokPB5x3jYGJlYcFe6oMdhLq2yte/uVHGwTOAx1djhsN2JjAriBXSphnfMM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzl5bHNQaa5Yac0uWtfMRLSQF1Lt01T1JZyzFZW5CzeiksBrXvu
 cvRlcEp/NbLELXp+Xiebs/aVBXS1cp92K0x879mwDNySer5VFcURaIiAmsNTvQ==
X-Google-Smtp-Source: AGHT+IGrd9l1GlM2L8PMQ11t9vsR3WqEyNxK+9h4vC9b0I7xJAWHJVP8EBwRriK40RxJRSAsNNrEQQ==
X-Received: by 2002:a17:90a:68ce:b0:2e2:a8dd:9bb5 with SMTP id
 98e67ed59e1d1-2e8f105e834mr12056484a91.12.1730200395327; 
 Tue, 29 Oct 2024 04:13:15 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:1fef:f494:7cba:476])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e8e3572e69sm9280776a91.16.2024.10.29.04.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 04:13:14 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH] drm/mediatek: Drop dependency on ARM
Date: Tue, 29 Oct 2024 19:13:07 +0800
Message-ID: <20241029111309.737263-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The recent attempt to make the MediaTek DRM driver build for non-ARM
compile tests made the driver unbuildable for arm64 platforms. Since
this is used on both ARM and arm64 platforms, just drop the dependency
on ARM.

Fixes: d2db0b8fd70b ("drm/mediatek: Allow build with COMPILE_TEST=y")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
It looks like the culprit commit was merged through the drm-misc tree.
So please merge this on top ASAP.

 drivers/gpu/drm/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 2e0e7c4079b6..f496e6cfdfe0 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -2,7 +2,7 @@
 config DRM_MEDIATEK
 	tristate "DRM Support for Mediatek SoCs"
 	depends on DRM
-	depends on (ARCH_MEDIATEK && ARM) || COMPILE_TEST
+	depends on ARCH_MEDIATEK || COMPILE_TEST
 	depends on COMMON_CLK
 	depends on HAVE_ARM_SMCCC || COMPILE_TEST
 	depends on OF
-- 
2.47.0.163.g1226f6d8fa-goog

