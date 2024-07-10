Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A54292CE3C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 11:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9D610E1C6;
	Wed, 10 Jul 2024 09:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="WdXPFVCq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7628210E1C5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 09:33:23 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52ea84b6131so633595e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 02:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720604001; x=1721208801; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GTHGZWFFIG2y8znG1jvML///poV3IrhnVzz1kC5uonU=;
 b=WdXPFVCqk0MBGZfFuQgbbGPpvT9XLTScyN36HYaulfhA7QgD1vcCeTOk3FoJvxXg/w
 AMidYNVyXoMNx2TnO+9JUKUxwvjFkWBRw2FeiViyxG9KZpLV7+6v+Cj4ZDl8RIRjPhfG
 yPiRHRlMh9/RsKGlsU+PlKavGUVwkgGf6AW5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720604001; x=1721208801;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GTHGZWFFIG2y8znG1jvML///poV3IrhnVzz1kC5uonU=;
 b=iekMDS6GUI1An1svi2dzoj711xDLWok1a9uSuJVLjDEnHoHbmSOsR5gdbCoWNMliLq
 AZgYXszPjSSOmcn7FkQ/Hz+a/w77q0RgFUccha7dk5Xgq/cN6Xcme3Za2xa5um40pfEY
 SnA9oSJ5PHinsWZXw0waCuauh1WImrIg17mWw9uZtJUseDbaAtYGG7P0r+1a19mP9N7H
 pZ+9oDknDAyJx304cXP+wBDLu1/BkqLSKMDIUdkYZv2fb9UygMwvEVCaj0X2r+wvtSju
 oQg5VIkOQeQTC5emVcBhs45LCg0sXbfWByIGgORaUlXLX4PXcNNgJK8Ok27xwiMhjquf
 X8dA==
X-Gm-Message-State: AOJu0YxFgKImFZE/LbLXj/zVR4WL9xWYvavQIHxMG0OA4/1VppXHDr0m
 Y6LfgCoVcziyqZXgYOwByBHgPgqDOu8v/DSryaGXMxMFCMKjmVpYpDeASYm2R42Sj0OaoeKfFO4
 be78=
X-Google-Smtp-Source: AGHT+IE53obXe9iAhMtu+VAErcsSEkowso2ZAWhhq6KbgW5hVFggamUEZCMm4iphO7D+n2JaklYQbA==
X-Received: by 2002:a05:6512:10d2:b0:52e:9b18:9a7f with SMTP id
 2adb3069b0e04-52eb9993c36mr3246261e87.2.1720604001546; 
 Wed, 10 Jul 2024 02:33:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f6f5a27sm73448935e9.23.2024.07.10.02.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 02:33:20 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/2] drm: Add might_fault to drm_modeset_lock priming
Date: Wed, 10 Jul 2024 11:31:16 +0200
Message-ID: <20240710093120.732208-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.45.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We already teach lockdep that dma_resv nests within drm_modeset_lock,
but there's a lot more: All drm kms ioctl rely on being able to
put/get_user while holding modeset locks, so we really need a
might_fault in there too to complete the picture. Add it.

Motivated by a syzbot report that blew up on bcachefs doing an
unconditional console_lock way deep in the locking hierarchy, and
lockdep only noticing the depency loop in a drm ioctl instead of much
earlier. This annotation will make sure such issues have a much harder
time escaping.

References: https://lore.kernel.org/dri-devel/00000000000073db8b061cd43496@google.com/
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/gpu/drm/drm_mode_config.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 568972258222..37d2e0a4ef4b 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -456,6 +456,8 @@ int drmm_mode_config_init(struct drm_device *dev)
 		if (ret == -EDEADLK)
 			ret = drm_modeset_backoff(&modeset_ctx);
 
+		might_fault();
+
 		ww_acquire_init(&resv_ctx, &reservation_ww_class);
 		ret = dma_resv_lock(&resv, &resv_ctx);
 		if (ret == -EDEADLK)
-- 
2.45.2

