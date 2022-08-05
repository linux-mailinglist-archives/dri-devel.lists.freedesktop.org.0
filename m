Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9491558B1EF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCC8A174C;
	Fri,  5 Aug 2022 21:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D867012A443;
 Fri,  5 Aug 2022 21:54:45 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id l9so1989814ilq.1;
 Fri, 05 Aug 2022 14:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=1+1UJim8vhT48B81Hjf2bc/Sa3YkiMXKvAKc0hA3YOs=;
 b=CrJgpQHbDBJ7RwTZKwsK2nXYyHhQp0KotTfA/P+uE/DFkz59bW5r74wG1/yBHFM/fk
 lcds8RusyQGP77GIRAOgM2dvk6VIWnIniw1zZsRFshKADGXYoCQpm/0hO/TPURqFaPeK
 +ib27KVmxXzoxn2ixUeAZuxrc6hFjetet7Tq1/5tjEgeaTMsI0liK2hjo37AIx2SbU/9
 jwOEM5cmIGQwU+kEydBQxTnP2E27ovG3zbqjY9AtirFFHHnNPEV3ajSSBDPoNWfEuBGy
 xnO8SRMMDG9CUNKvM6SXEhBXSsqjloGSEULNWC/P+dWD2UwRk2ywIDuekd2gTdrsHipJ
 K7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=1+1UJim8vhT48B81Hjf2bc/Sa3YkiMXKvAKc0hA3YOs=;
 b=J/vzeNTak48c/VNefLwBWD1UZDGR9jz0VzTxQB90YJctDX0rM/xmhg8PHb5eyP2YKa
 X+l/H/ru3fnuI4uojEJfJA1hXVrOglHYT9LyrLHaqv9BpxirhvJgoeVupgXcZjS+e14h
 ztV9AMsj7iOYqBfcLUiuN4b8AkxoC0ky/kBn1UEnhgo61mMsVgdPpDU7J+37FY3ZHchi
 ch0P5NcFLvnz3cOau0Wsg/eAkAIOpDrG8IP/tO7rdQ+jmPHRrwrhpzwG0NQDt8UHvjwG
 Ks3cuyKFO8vFPZNOROHYnXHCl/QpRTvf6kwxQ5JOLOXqJGOlBR4TbxlcvKedF/QrcHkU
 6Dhg==
X-Gm-Message-State: ACgBeo2LyHpyEoubKSa++4AQJRrVIgVNvjUVd5GjfhgzGNh7MgJpYpfg
 /BTaDwfU5Vs9M8/WQatVbes=
X-Google-Smtp-Source: AA6agR5abo0JydvBW85i/jxSa7Y77IIU9fCsUQEULS/JdZFW7H1qpJFVh6RC7t0e+zg9wp+RncUlNw==
X-Received: by 2002:a05:6e02:17c7:b0:2de:ae1d:35a6 with SMTP id
 z7-20020a056e0217c700b002deae1d35a6mr3837745ilu.123.1659736484992; 
 Fri, 05 Aug 2022 14:54:44 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:44 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 22/33] drm_print: condense enum drm_debug_category
Date: Fri,  5 Aug 2022 15:53:44 -0600
Message-Id: <20220805215355.3509287-23-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805215355.3509287-1-jim.cromie@gmail.com>
References: <20220805215355.3509287-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org
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
2.37.1

