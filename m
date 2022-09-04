Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF1F5AC754
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8A010E309;
	Sun,  4 Sep 2022 21:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8742310E184;
 Sun,  4 Sep 2022 21:42:31 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id h78so5628307iof.13;
 Sun, 04 Sep 2022 14:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=4JXdBl/0qOwV/A52QqNijcawUGjQl7evE5vQaPe8I/Q=;
 b=Q6wDNH7ni+pezhZQtqZpJ97lJZANkr1r1w8Q0HIYBSFAhwljRqOGh9Iv19Gf64+llB
 frZm5l9a2D6+RrKMDxtJrGMvuFtfct+nV7wpbjJBApGvgbR/UCdA+edFFEWQV3yW5xZt
 Abl341qIlvY+ti5hONgL6a+0BiJXwAUlG16pl8y98ByU4SwhFvt6k2mPawMY8CGIW+5o
 XyF4e1Ssr9Pgjhu7rCIp5wA50OjjlhqxJNYWrilP5bH59brlOnduXsjVgJiJlrcuk94w
 aC5b1ZZDeZyRlOAFIdmJz1af5ykZ0tqCvavdXbRILxmEHXgITfMxjOp5/9nTnIUykGr1
 jaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4JXdBl/0qOwV/A52QqNijcawUGjQl7evE5vQaPe8I/Q=;
 b=7+gf0kl1xJaddSc95nfdoiTyR2GmNwBUnUKBtFT/HBWKLe90lwlXLq1qrsqR1Al5Ym
 VBG+eEuFwpWDmsjvTXAnp23vg6c133EvjpgaHi/vi//55TrDBz0rgW/OrVLNhC99MQO3
 1+t7RkVNHyZdOqn/75+gYzGDB2yV4NVxySA1ZN2c0++GR8qCfYPnTVDMrLO4JoOnLyzH
 Ysi8n2DQA8/gyCQSIWnRlGEvJYeZaCuFVBH8+oRZvOZMw3EetbMaa8Z6imqbiKXG0oV6
 67VIfXf88cQk6717aeUYdfNYS5mqUEntL86n4TOVFUVTmjdOHZiLPA553MD1E0OEyfNd
 BgbQ==
X-Gm-Message-State: ACgBeo3oGQebLplhmUKPx0pwUtAhO6+crPX0nWHnDUc/wH0FxMIeYV1q
 B57woIS4YFy4x8RuuSNRtm4=
X-Google-Smtp-Source: AA6agR4RtFxm49IqbK2hc+ajeSg5bxr0q7Z7xZNKzxnPnzjA/QHoeK8+UuSlF8s2NBv4jPh+uCHATQ==
X-Received: by 2002:a02:9a16:0:b0:350:636f:af9a with SMTP id
 b22-20020a029a16000000b00350636faf9amr4392137jal.191.1662327751171; 
 Sun, 04 Sep 2022 14:42:31 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:30 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 22/57] drm_print: condense enum drm_debug_category
Date: Sun,  4 Sep 2022 15:40:59 -0600
Message-Id: <20220904214134.408619-23-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
2.37.2

