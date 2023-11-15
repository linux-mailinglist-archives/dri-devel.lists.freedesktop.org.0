Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBA07EC0CE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 11:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C28A10E53C;
	Wed, 15 Nov 2023 10:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FAA10E53C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 10:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700044549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Xp9UARNaNPlyIdSssZLj0kaySqIS1RLPGJplNZMoPJI=;
 b=MLm5aAEkWI6hjNGSkNpxIoCgRUl9vASmV8DsyjgM/m5He5Kyxh4F9Q+hYYazOUajzy2sKY
 ScXWp17L6faNIW9w7bcpaDs85f4oX0sZpaag+rmxAh+p8kbaUA5klABzpvkXDlwtFj3NgE
 p25/jPO+hiUWMict+M6YGqoGJTU6yeE=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-jkxe53L8OkSbyUrGeiBwog-1; Wed, 15 Nov 2023 05:35:48 -0500
X-MC-Unique: jkxe53L8OkSbyUrGeiBwog-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-5a828bdcfbaso94257907b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 02:35:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700044548; x=1700649348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xp9UARNaNPlyIdSssZLj0kaySqIS1RLPGJplNZMoPJI=;
 b=Z6ngDzWegjQu6KhQ/2Fs3ch3HE9o1YvLjnsbYqUzRDQGHIdiwvmvXNIukrgnclD7jI
 jtuh1OLv9v8HNJAXodq0ed8fvv3y0Xk2NxMT+o+Z7ZW+3Pwrurilyu3/WVPUTz6hHsU1
 hDL5LXYoqM0aEI1JMf0Ef/J4elUmvCUSBrAXWaMcpWjkbBcMQiv4W5toXCbU0yHp9Y1E
 qYlgFU+K5cToPy7WQRF997iF3+x3GywEHj2DWhBh2z+SUD84wJ3i/DiVSF9kdI405C36
 b7cNufR55I6NcUkTkFfa28DoDwOFkxXfiSyTk8kZqcJd9vVrjPVLP5YQ77ssggc2UFyY
 5cZw==
X-Gm-Message-State: AOJu0Yw4LkbvqFKDl+VTOF/TpS5/zmrO7OnpVkdTaSyVZJUzty3/v+EI
 Xe8aEj5CN5NLeUY6HMTgX8HY/MkWjFidu8Ybeq11r93SzI0hZ8ttz/3fCS6ExyppDYb3MSe5FZE
 E1QbNoTmTA2AB2vK8R3gTCEomw08=
X-Received: by 2002:a0d:cb8b:0:b0:5a7:ab55:b9af with SMTP id
 n133-20020a0dcb8b000000b005a7ab55b9afmr12166716ywd.35.1700044548007; 
 Wed, 15 Nov 2023 02:35:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1kcYhFvm+awVN8EG3QhLKaWIkC0dBHxZ6wSdcnkopOF0pSjVhSr9LCAUmzhdoryV7+qfkyg==
X-Received: by 2002:a0d:cb8b:0:b0:5a7:ab55:b9af with SMTP id
 n133-20020a0dcb8b000000b005a7ab55b9afmr12166708ywd.35.1700044547785; 
 Wed, 15 Nov 2023 02:35:47 -0800 (PST)
Received: from klayman.redhat.com (net-2-34-24-178.cust.vodafonedsl.it.
 [2.34.24.178]) by smtp.gmail.com with ESMTPSA id
 s20-20020a05621412d400b00647386a3234sm433267qvv.85.2023.11.15.02.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 02:35:47 -0800 (PST)
From: Marco Pagani <marpagan@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/test: rearrange test entries in Kconfig and Makefile
Date: Wed, 15 Nov 2023 11:35:36 +0100
Message-ID: <20231115103537.220760-1-marpagan@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Marco Pagani <marpagan@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rearrange entries in Kconfig and Makefile alphabetically to make room
for additional KUnit test suites.

Signed-off-by: Marco Pagani <marpagan@redhat.com>
---
 drivers/gpu/drm/Kconfig        | 10 +++++-----
 drivers/gpu/drm/tests/Makefile |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 3eee8636f847..cdbc56e07649 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -75,15 +75,15 @@ config DRM_KUNIT_TEST_HELPERS
 config DRM_KUNIT_TEST
 	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
 	depends on DRM && KUNIT
-	select PRIME_NUMBERS
+	select DRM_BUDDY
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
-	select DRM_LIB_RANDOM
-	select DRM_KMS_HELPER
-	select DRM_BUDDY
+	select DRM_EXEC
 	select DRM_EXPORT_FOR_TESTS if m
+	select DRM_KMS_HELPER
 	select DRM_KUNIT_TEST_HELPERS
-	select DRM_EXEC
+	select DRM_LIB_RANDOM
+	select PRIME_NUMBERS
 	default KUNIT_ALL_TESTS
 	help
 	  This builds unit tests for DRM. This option is not useful for
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index ba7baa622675..2645af241ff0 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_connector_test.o \
 	drm_damage_helper_test.o \
 	drm_dp_mst_helper_test.o \
+	drm_exec_test.o \
 	drm_format_helper_test.o \
 	drm_format_test.o \
 	drm_framebuffer_test.o \
@@ -17,7 +18,6 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_modes_test.o \
 	drm_plane_helper_test.o \
 	drm_probe_helper_test.o \
-	drm_rect_test.o	\
-	drm_exec_test.o
+	drm_rect_test.o
 
 CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)

base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
-- 
2.41.0

