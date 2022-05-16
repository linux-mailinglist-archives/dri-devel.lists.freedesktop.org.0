Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F45529449
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084F610F054;
	Mon, 16 May 2022 22:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4C810EE55;
 Mon, 16 May 2022 22:57:22 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id m6so17635914iob.4;
 Mon, 16 May 2022 15:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NVvP6ii8T54t9tBCAwTvz1dz4MZixkOISs4Qo1GSsZ8=;
 b=KaaEEVL/0Fno1HcfyHEf4z/GuhJ9D5azg/OjAEcSM6DLHTTuis6Xccyy1ycBgsKvpc
 yABcTngNZ6IB03n9FcCx+x5tr0OGamuH26VwGNrMjTbOMMi3HONtobw/Fogsnt465ByI
 FqVV8k8b/C02uYoFKxmplXXpTfBsJRhKRWbwMypPmFFywgnvDLRfylUFScGzQrVHxrQQ
 quJrCJ+HWHexPzKsRTX4u7w9PgYJi+eoJzechmdTsbGzUZEhZ3M67srd2/FZnTHT4wAL
 5GKOiLS5DBwinLdgp5CUnslbZp4lzqFBT2wT+LC84PQkn2+HOK4+oLgm9CfIPrV9vv7K
 DzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NVvP6ii8T54t9tBCAwTvz1dz4MZixkOISs4Qo1GSsZ8=;
 b=2lq59r48ksiUyJ2advAFElH5C4zjjPSx3JbP7kNaHYSG1UyBMSl7RUZ+zpHbmhHc8D
 WyufyK+6FySxAz0rMsdayqofZHEQ5HNHkPqbmHnONZQPQUPhpa23rnykRcF3xSpzqHQV
 bX8LUKlgjapBkcBPPQqJfFq8kB1nM1aftJsvU3t1qVbeKVm1GD2I+arLngZcfTvejcnZ
 xm3Jimpn1mja0KBTfR/bFRFz1Et8w4Ch0yyfTRyoRlBkufGGZAqV3OIH7WbjLJu6rjkU
 rVzo48FtsNEp/E1dkAAUjABOXKtIQH/ySy8SSKUmzXx4VPcqhy9fbpvKVbl1inX5XAZv
 PzvQ==
X-Gm-Message-State: AOAM532lg6CJ+Rn83t6KtEO3vQeYjoRLpL+kOsboujg0QeBVsTgS4jOj
 zeVjspnl63hXf+vbuAvK0ujiq1fVL24=
X-Google-Smtp-Source: ABdhPJz8lyov+C1KJqzppIklQpEs/1gCdUKmcwNab/OloZ1fJ1162ay06ESiwgFyboGG2TdJ0eSyzw==
X-Received: by 2002:a5d:9f42:0:b0:654:9a2b:cab1 with SMTP id
 u2-20020a5d9f42000000b006549a2bcab1mr9039211iot.89.1652741841822; 
 Mon, 16 May 2022 15:57:21 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:57:21 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 17/27] drm_print: condense enum drm_debug_category
Date: Mon, 16 May 2022 16:56:30 -0600
Message-Id: <20220516225640.3102269-18-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516225640.3102269-1-jim.cromie@gmail.com>
References: <20220516225640.3102269-1-jim.cromie@gmail.com>
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
Cc: maz@kernel.org, quic_saipraka@quicinc.com, catalin.marinas@arm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 rostedt@goodmis.org, mingo@redhat.com, mathieu.desnoyers@efficios.com,
 quic_psodagud@quicinc.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
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
index 0597137bac75..a157485bf573 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -284,49 +284,49 @@ enum drm_debug_category {
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
2.35.3

