Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB03A577B73
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47187A9D0D;
	Mon, 18 Jul 2022 06:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5F5A9C7E;
 Mon, 18 Jul 2022 06:38:42 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id l24so8516952ion.13;
 Sun, 17 Jul 2022 23:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dMWqi6VMWK3OYoAYYaoTo9m6rW+kKw0BEQ3tbFi0+WA=;
 b=NlKJ0Al3ag1Jhf0hGu4Wm6GEDW0U1Ctt/erztLWJUbl7b7LDLTqnHoH6wqsOcxzIX1
 YRdvbHGjWWcnDQngq4Okk42W4NP9m9LG0bE7hvlhdJto2ks2jY0dOsux8k6iiK2ugimu
 fg+BJ/bsqS6F7NrVGgKaxT+Karyf+C6lq3ezf/hzijUIfcsCnmPL20OJNfJn5cEqYm5s
 zWZi2A356x1RQ4MHZg3p8yVKXIwIwRmMoIDko2jQIX/HZ/HEitlxwuVu/L1UwHGpD5Uj
 wbpA1MkfNIW5fQVwsf4S7tY9bNeAyzMulRAezSPpmtmPkrPGIhURnsql9u4qmQuayE35
 nhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dMWqi6VMWK3OYoAYYaoTo9m6rW+kKw0BEQ3tbFi0+WA=;
 b=pQBYaf4glkS6mQ+L5WIOZ6chrBtgLIpLkNx2MFyIPpvnzgO868FwOwoTq8Uwslk8dm
 LZH/YSgHr7E9jlU80C/LAzY/NkONCt2Vmf+SY8bS+KMYK5WVO92XR2+h/YiUzsyB6xt8
 21vXhw2ZE6T6SGXd83Iq/ehLPCbLulqeNCI+vyfUxYrBZWlQZFSKDSTJ7Uc/qsy5U4aQ
 /XATVkJH5An+cceIZwIqv5cRR6gpxJq+zw9JxQHGbSV+1QGkbUG60grthvVsicYhWuqO
 mxWAZ7qJ/gxxNqfCjFjMBPWNUML/NCOuPh4Ou5/6THWKT5AUt2iE03ZiqdXGmk8KDCXl
 Pr7w==
X-Gm-Message-State: AJIora+9y1PGv6KEhbPw1/zXrDDLPvqRybqLFJDA+4O3Rjq+pNikLY62
 HYEeq6EulP8+8aYYROQN68E=
X-Google-Smtp-Source: AGRyM1s8PQQUfjkEGsIYa/DQ21W8eXDUCQjydh5hQU7h/oaZBUdlotSDP9kAURVOWDQPuLcVgtmOsQ==
X-Received: by 2002:a5d:950f:0:b0:672:4199:45c2 with SMTP id
 d15-20020a5d950f000000b00672419945c2mr11981349iom.161.1658126321753; 
 Sun, 17 Jul 2022 23:38:41 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:41 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 20/41] drm_print: condense enum drm_debug_category
Date: Mon, 18 Jul 2022 00:36:04 -0600
Message-Id: <20220718063641.9179-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

