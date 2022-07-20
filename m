Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EFB57BA23
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE018F24F;
	Wed, 20 Jul 2022 15:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F8C8F2CC;
 Wed, 20 Jul 2022 15:33:19 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id n138so13301453iod.4;
 Wed, 20 Jul 2022 08:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dMWqi6VMWK3OYoAYYaoTo9m6rW+kKw0BEQ3tbFi0+WA=;
 b=lnWdjme1YkRiNo3bVnr8kkI0ig6vUTf+spyUFQNrppJuHbWoTF5ssz56vhBoPahj4U
 z4IfnYCKn4P45IvqEeFV1boatsgWAQZdL1jKWkPxCnTuu7nr+mmN1N5XVyiEheQ8H7xq
 ThQ+2VinhgBSYe4L6XyaDkoxaGqkKAGXXuSKFXHNWNZGgAg7q57SHD/z9E6GZLTmqkO6
 /v1o6r42E+wd/M89uHke1nM5rul/noRcYh8DKmg/RS+QkEzDYtJ9wJ8uislB/HuYAJmo
 INDDX2D9zY7w0WNun7MPqP7fYcEc8PqsuB5ZKQyedaU9MmBpOPq/oKCLjNDMluFmRXFL
 7GRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dMWqi6VMWK3OYoAYYaoTo9m6rW+kKw0BEQ3tbFi0+WA=;
 b=Hsx3kbEe1GbTEorXJJLV7dM0bLeqPGvQEptDXvYNHqKVWjjG/V1ONtSCDDw36T0Jy4
 76KetBtWRxHoVy+OYJTp7+4U48r5ZsIiMPLnyQ5cwhXK91nd72tJnuzldu9K0mA+YTof
 l5o7yjBlouKkYsyqpHBvmz8gHMJuv/1/Et0fSX2/ESJFj52W1K5gLNczJ8okNWf+ztp7
 Ofxe21lMxD8ApqXYQVu49iwQii2KZeNvvTglQMUEmoaI4A/JmaSYCqw1zUBSDItuIDd4
 4oeenV81aeROneUjggPCEXtcVmPbez6UI5ji/gZa70420kXfBbIRTswy4+LEy8M3fJ1X
 IHDA==
X-Gm-Message-State: AJIora9VDoc+9pSmdkrPHwv0gcH8f08WjgXBdAA5TdgdqZSJwPllip4B
 +UDFM8PUMebszPSeQQkMKZJULuKOyE0b4A==
X-Google-Smtp-Source: AGRyM1s5eyEemFFnMY+HLHeBP5nJZ7Sgo54nMLWQL2IwyrGDYADLyFzl8TlvgaNrItlaUDMmHuzjhQ==
X-Received: by 2002:a02:3f55:0:b0:33f:891e:46b8 with SMTP id
 c21-20020a023f55000000b0033f891e46b8mr19472115jaf.121.1658331199273; 
 Wed, 20 Jul 2022 08:33:19 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:18 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 20/41] drm_print: condense enum drm_debug_category
Date: Wed, 20 Jul 2022 09:32:12 -0600
Message-Id: <20220720153233.144129-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
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

enum drm_debug_category has 10 categories, but is initialized with
bitmasks which require 10 bits of underlying storage.  By using
natural enumeration, and moving the BIT(cat) into drm_debug_enabled(),
the enum fits in 4 bits, allowing the category to be represented
directly in pr_debug callsites, via the ddebug.class_id field.

While this slightly pessimizes the bit-test in drm_debug_enabled(),
using dyndbg with JUMP_LABEL will avoid the function entirely.

NOTE: this change forecloses the possibility of doing:

  drm_dbg(DRM_UT_CORE|DRM_UT_KMS, "weird 2-cat experiment")

but thats already strongly implied by the use of the enum itself; its
not a normal enum if it can be 2 values simultaneously.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 22fabdeed297..b3b470440e46 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -279,49 +279,49 @@ enum drm_debug_category {
 	 * @DRM_UT_CORE: Used in the generic drm code: drm_ioctl.c, drm_mm.c,
 	 * drm_memory.c, ...
 	 */
-	DRM_UT_CORE		= 0x01,
+	DRM_UT_CORE,
 	/**
 	 * @DRM_UT_DRIVER: Used in the vendor specific part of the driver: i915,
 	 * radeon, ... macro.
 	 */
-	DRM_UT_DRIVER		= 0x02,
+	DRM_UT_DRIVER,
 	/**
 	 * @DRM_UT_KMS: Used in the modesetting code.
 	 */
-	DRM_UT_KMS		= 0x04,
+	DRM_UT_KMS,
 	/**
 	 * @DRM_UT_PRIME: Used in the prime code.
 	 */
-	DRM_UT_PRIME		= 0x08,
+	DRM_UT_PRIME,
 	/**
 	 * @DRM_UT_ATOMIC: Used in the atomic code.
 	 */
-	DRM_UT_ATOMIC		= 0x10,
+	DRM_UT_ATOMIC,
 	/**
 	 * @DRM_UT_VBL: Used for verbose debug message in the vblank code.
 	 */
-	DRM_UT_VBL		= 0x20,
+	DRM_UT_VBL,
 	/**
 	 * @DRM_UT_STATE: Used for verbose atomic state debugging.
 	 */
-	DRM_UT_STATE		= 0x40,
+	DRM_UT_STATE,
 	/**
 	 * @DRM_UT_LEASE: Used in the lease code.
 	 */
-	DRM_UT_LEASE		= 0x80,
+	DRM_UT_LEASE,
 	/**
 	 * @DRM_UT_DP: Used in the DP code.
 	 */
-	DRM_UT_DP		= 0x100,
+	DRM_UT_DP,
 	/**
 	 * @DRM_UT_DRMRES: Used in the drm managed resources code.
 	 */
-	DRM_UT_DRMRES		= 0x200,
+	DRM_UT_DRMRES
 };
 
 static inline bool drm_debug_enabled(enum drm_debug_category category)
 {
-	return unlikely(__drm_debug & category);
+	return unlikely(__drm_debug & BIT(category));
 }
 
 /*
-- 
2.36.1

