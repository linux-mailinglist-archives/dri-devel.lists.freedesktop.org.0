Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEA6B19207
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F257810E4C8;
	Sun,  3 Aug 2025 03:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QZBUBMLK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC00E10E4C2;
 Sun,  3 Aug 2025 03:59:26 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3e3ff43383fso24797895ab.0; 
 Sat, 02 Aug 2025 20:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193566; x=1754798366; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wPCuAnoyt2yaK7PHqEP4KAuT17bxG8DAm/V2Pw+3mVE=;
 b=QZBUBMLKL2s0HMbASGuPN3X/1PvXvWm7vqByNQVfB6QhvKRNQ+5NQPCbSuNizWcBtm
 zUnm8rHmYSea+ko/NGnUPgi6tSik3mtai5qrbCQ5u9ifFNoBh9bziSfiiDHXfoReoseS
 dTbngDeFZK/opNkAndecTkSHRvzmk7Z/IjbpIASq4Sl4MBjFYbTIJY5wINm556jkbqjj
 K31CP+H8Y7WuzlfLV9C1Wf1fy7FNnpNBMvE2EPftdsrXfG3F1sXkOn6ZcVjO2b1m2KPQ
 W0Daip90EudvxGvidnBFMxbeGqs8QsSVFeCLBleUGVbP59r3uj0OOQjbA+VyGVaF1H3h
 5bQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193566; x=1754798366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wPCuAnoyt2yaK7PHqEP4KAuT17bxG8DAm/V2Pw+3mVE=;
 b=QE8sGonMzRso+4xAIKu8efbAeemj6CeXVwnREbyvBr32+5EqT+1Q8NjvtWue2PUMIE
 VJbZYYoweI15KEh1LGg4ZaY3TE0hTHN+PoNcE73Ptpww+TDRlpF5FKlAVD6MoaBMVohB
 TlZC4qOZDPe8oPHawDPseF5RN62VX3lVhXrsh5FAuNAqfdr5iFFqccOiiXbo7c2ZJRDg
 YWjRmHlu1as5Y7BHyQx1rhW9/EVeQddNOHa+6UxRXZoMZEztJb8X0KftSBVbjmHu3+Ud
 tq5cT0Hsy/ja20d0Bx1RDMAOb6pnmDzAGHs1KXOrjkTSY35O3t4NTxjZvZMnKFoANCFU
 f9MA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFoTvULgBQjiJq2cO+164rfkGGkdwDzqHY1QMFost0RS6PIhvLnP3q7KcHguqzWMVT4YpmhaQs@lists.freedesktop.org,
 AJvYcCV8gggIz7OXBLjWLW+qrMmB2cDv3L8w2FbJAITzwfXsMZnzUrRmCWQeR9iOg64mi6DY7z8zfFDF8Z6A1uCUUQ==@lists.freedesktop.org,
 AJvYcCVRL1YinnR5F6SRqWaa6+SwGvXhzuC1cj1S/JavEhqJ8z4zH/h71Ukqejte8zM2AB6XQ5fkpFhtzVtG@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJOKlQenltm/gmxLcDj2JguPu8qvnwk7SxnmA9dKA5WobPLDUw
 xS+Ai6egqTvI7/rcm76UhjIcJmzA1r6cs8C3qB+kAjRYU84HL95ZkX3/
X-Gm-Gg: ASbGncuG7FOdbTh6PYKNNrRa5w4yzaEjaBUvchRg9kpNerPSEsAXRf8Bl6+Rl/mLSsP
 pIwVneMccKWmPXd8LqbvNQnC5+U+u7nn5H/buZrqtuQ9pbCLy/Fje0g5KMBd0BSuLrphk8DBn0V
 A2z1bZ0AL5AUc8e73IEK5aR0dnCeslyDhsDHg1M42BO3HsF1+LGa2/QP+GBp7Na7V0cf5ck/4Ug
 bwRHR5HBsLmf2ip54P4EVLF7UoCVRyVawhTTAH5d63w61U+9gSHNdeLwZDDvpR5eaB7uzQngKRu
 M7onKXhEx3bUJzb6/ynPku0ns0P7Tx+FsOHzGa/R+JntXK6/up4buzSRsjlRbt6/a/WwuilfWxp
 3/7+dUDCsgskzu18RiOsI7el8mugt4PpBgxCF/Mur96zmoT2KNL31FiMQxNoZGoWnwTU925xFmH
 2YVAJe7cpy6IXV
X-Google-Smtp-Source: AGHT+IGoLnVRK0ZsQUveSL4ZB3Aom5SaUMztjFiNEQTdBWyQuqxM4dmylhRHkY6dHcuDvZjPdgtOKg==
X-Received: by 2002:a05:6e02:308a:b0:3e3:fc9e:b2d4 with SMTP id
 e9e14a558f8ab-3e416176df0mr85880415ab.10.1754193566087; 
 Sat, 02 Aug 2025 20:59:26 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:25 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 35/58] drm-dyndbg: adapt DRM to invoke
 DYNAMIC_DEBUG_CLASSMAP_PARAM
Date: Sat,  2 Aug 2025 21:57:53 -0600
Message-ID: <20250803035816.603405-36-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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

Invoke DYNAMIC_DEBUG_CLASSMAP_PARAM to hook drm.debug (__drm_debug) to the
DRM_UT_* classmap, replacing the ad-hoc wiring previously doing it.

Add DRM_CLASSMAP_* adapter macros to selectively use
DYNAMIC_DEBUG_CLASSMAP_* when DRM_USE_DYNAMIC_DEBUG=y is configured.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_print.c | 8 ++------
 include/drm/drm_print.h     | 4 ++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index a3b70d104afaa..46d53fe302047 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -69,12 +69,8 @@ DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
 		    "DRM_UT_DP",
 		    "DRM_UT_DRMRES");
 
-static struct ddebug_class_param drm_debug_bitmap = {
-	.bits = &__drm_debug,
-	.flags = "p",
-	.map = &drm_debug_classes,
-};
-module_param_cb(debug, &param_ops_dyndbg_classes, &drm_debug_bitmap, 0600);
+DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
+
 #endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 03b0a2bbf91b3..769036b2942b8 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -144,9 +144,13 @@ enum drm_debug_category {
 #ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
 #define DRM_CLASSMAP_DEFINE(...)    DYNAMIC_DEBUG_CLASSMAP_DEFINE(__VA_ARGS__)
 #define DRM_CLASSMAP_USE(name)      DYNAMIC_DEBUG_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...) DYNAMIC_DEBUG_CLASSMAP_PARAM_REF(__VA_ARGS__)
+#define DRM_CLASSMAP_PARAM(...)     DYNAMIC_DEBUG_CLASSMAP_PARAM(__VA_ARGS__)
 #else
 #define DRM_CLASSMAP_DEFINE(...)
 #define DRM_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...)
+#define DRM_CLASSMAP_PARAM(...)
 #endif
 
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
-- 
2.50.1

