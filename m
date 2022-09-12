Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9AB5B5368
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 07:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235DD10E0B0;
	Mon, 12 Sep 2022 05:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B48210E091;
 Mon, 12 Sep 2022 05:29:07 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id r134so6127974iod.8;
 Sun, 11 Sep 2022 22:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=wMnPW8sQPrVL8KagTR37lorbRR14ltjvlMMWJEAyAGg=;
 b=kYdKfVRUHlEG8+qImsA7YlTFI6xkeavOLcLlAeaIDOOOft1rL8LHX2rXIYFWOUMWrW
 7xhAtwhgEZAyu6Eksym85vqzKNSVzO11Djoxh0+nGLS76/MmHS/4lN75YfTElKnDj5n6
 cGkWS9r2H+MOvAI1qDPQ6x37zKEH3KB+dHQKLDg65any2sWEqLh1Fl1KbMzlOZ5Osi2V
 fDqyOsPxLFgrxqZPDDRvALJtcqZpweGo3waYTwMty3aifd6H1runl+nhfxEK/WjTvjum
 03JUOyVCZYGKgKaxDYYmiW980Ua9wdKRpiI15/eJjGEr9NevmdQ/8vHHi3OhLpz2GOws
 0tCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wMnPW8sQPrVL8KagTR37lorbRR14ltjvlMMWJEAyAGg=;
 b=6sL6nPPSx2xUDpFiTTuCjSV882+v81TPk29UJF3FQqEyzq+D7GWW1+ItvqwyTaHm4/
 O9KAC2pBCad9Fta3emuMTFJpXxBUmKadNVkXZ0oDS+VMAYNTxPMVRwEf34PDXyHEJgrV
 ql8RqJ+wgX6KjhvEpBUDqBXwyDz/HzHOnlZmsoh3puG4I46169fNHGBCa0N1f50RwPaM
 VM9eiYPIoNlxitudZ14+3VcxcTnEqb6F7CXc3gJ7znxrlIxjM5Botdw5NcB8pwFUEb61
 C4UB7tfNtsB4BkcIxPg4w+cXYUAPCq+yGDHFDS38YEpq3inl4mpnJ/kpVSNLgLdJdIV+
 gT3g==
X-Gm-Message-State: ACgBeo1n9Js9AUnItBR8f5KWQZ+hr2QEtU0GhdR1oe+agZfYoocG4Paq
 4NG4jvxeb0NePSpjNYeWhAs=
X-Google-Smtp-Source: AA6agR7a8UvflaCOS0O/szEoMKv+7GfDEj8qn5sgo2pmielI/CNoxVV+xn7kMWI0aVvEe2oJDYnezw==
X-Received: by 2002:a02:6386:0:b0:349:d0b1:bb7 with SMTP id
 j128-20020a026386000000b00349d0b10bb7mr13293720jac.172.1662960546197; 
 Sun, 11 Sep 2022 22:29:06 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q16-20020a056e02079000b002eb75fb01dbsm3006057ils.28.2022.09.11.22.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 22:29:05 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/9] drm_print: condense enum drm_debug_category
Date: Sun, 11 Sep 2022 23:28:44 -0600
Message-Id: <20220912052852.1123868-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912052852.1123868-1-jim.cromie@gmail.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
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
2.37.3

