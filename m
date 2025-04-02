Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5BDA79459
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF22410E8B1;
	Wed,  2 Apr 2025 17:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l9APGdRQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995FD10E8A2;
 Wed,  2 Apr 2025 17:42:56 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3d45503af24so751885ab.2; 
 Wed, 02 Apr 2025 10:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615776; x=1744220576; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hj7/OLtj1fDw6OZs5+/lD0ex0mbib1oiHMYEMqtQMQs=;
 b=l9APGdRQXouBHUpaMeTOufZ5w928nEVFU4/uMst68vq0yeiN1ElwsqyZg1yKGJi+T+
 GCUjHG0k0eON6hOe/43jjW6RumVjCLB2HZcrxcqdE9husTszoW4v3NlRT3qpiJ2U2RzN
 lAA0KErbLMS4jrf4AM+/F4F8DdRENMEkivzqrvQQF96o94mE4emSSlz6JZgarV8nbYyj
 2clIfaFVUsCPxcrhDb7Rjs5FRd3uviTcDQRLmPmSmLTfx4R4/hUQSs1CYh8qdQGqzA5p
 /ez41bSPo+p7LrZWcN+xF07bZGsjTGYnq42XLMKd58o71muOfID5FyNyTunct1ZeirPc
 eZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615776; x=1744220576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hj7/OLtj1fDw6OZs5+/lD0ex0mbib1oiHMYEMqtQMQs=;
 b=Jer4Tq+90+ntAh8mwaqa8RFds4WjBAC2JtWN6nFfyXKaWXtmcNfsNgQZeq91G77wX8
 usA/iduz4oVo6UOYGtsCaQzZVHSUYA1Ki+k8a274CpK8Sx7wtG45jSHr9EbS/1fN7jq5
 2347skhHuBBlQzTcB0EpKfyd/o4T+PL/2WSc8f2H+vACNE7yl/tiJ3c2BQdlmSXWSxpw
 vJUD6fuh/jqSA4tr7V7nFd/YXVCNTvcNnh82s3E2a6csOVPL4xfNS6dTaANb//bA3NhK
 6s6YLLyJA4gCIzdq5hoROBgIPq0FtDW/BWb5P5fI9AQsKxrReD0A/GrlaXSGWe/C56na
 7w9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNIl53L7Xs42b1UTd5+pVVTyySjLW9JBbN0F7WemD1ZyCXpcZwujqIOV5R0tyeYo04Cuy9NkNiMpH1@lists.freedesktop.org,
 AJvYcCXJUTTy76Cv6VcU1mf8pYtvpxTDEYDLU3RVXSUURd1wA8ZzUFnHQb6gNyvAEy4WNgoolg5lpqtzPZ8XdgESAg==@lists.freedesktop.org,
 AJvYcCXyNHp5tIU9sDo+c2OD7oicCn7lR6dYJlftwlAm9QdpxzP1inYetAYZXkMFzr79OIyyN+1xRElK@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxa7r7OA6Et/Ny+MM79FgUjYb8tgxHTPbe3ToDiWMDRK2nyn4Ga
 PDinh5AG/kqnSBQUB8zfqwIgWyuwz0AwiDntDXD3mDPzAuMgPtLPYiQnEGGw
X-Gm-Gg: ASbGnctJ10yttrmRTZnDzrOU92a7aKOMO4wn7ZWZI7pAgC8ytScELnfIC7+sVfVegGG
 72GDw8/D6C1AO72jlawWb7r7R6hpU2Xr91SfrVtEd9wF885XnwI4Q2dfEBnFlU4joMnDs1xLYNW
 uF2L+Zy31p8JOpgq3awP/qEZybNfN9ozJKmRElDh5ZwtjfkUgMIG1YGQTbFHLkD0wbv2gJu1pbN
 ANe+1IyYniqwnxjqqofOfiIZzpN6xYULDbeFtxnWQE5+3eRWk6zh70OIb2gwdYqe/umIbzc5KAe
 7FDkIERUa3LoHyHaq4NMotp7fuuFX+D22FMzUzLaARfvDGS+w5pbS++DVHTkoH65rLZejQmZg1z
 xXA==
X-Google-Smtp-Source: AGHT+IHkTdxrnWHVM3s8kzejMvdVLgstsz/xh978QvWvn7zXHfoIkU/4gG/Iemvf+jXbraofO9mW5w==
X-Received: by 2002:a05:6e02:2703:b0:3d3:d28e:eae9 with SMTP id
 e9e14a558f8ab-3d6ca5d16efmr104731125ab.7.1743615765249; 
 Wed, 02 Apr 2025 10:42:45 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:44 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 31/54] drm-dyndbg: adapt drm core to use dyndbg classmaps-v2
Date: Wed,  2 Apr 2025 11:41:33 -0600
Message-ID: <20250402174156.1246171-32-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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

dyndbg's CLASSMAP-v1 api was broken; DECLARE_DYNDBG_CLASSMAP tried to
do too much.  Its replaced by DRM_CLASSMAP_DEFINE, which creates &
EXPORTs a classmap (in DRM core), and DRM_CLASSMAP_USE which refers to
the classmap defined elsewhere.

The drivers still use DECLARE_DYNDBG_CLASSMAP for now, so they still
redundantly re-declare the classmap, but we can convert the drivers
later to DYNDBG_CLASSMAP_USE

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
this ignores a checkpatch
 WARNING: Argument 'name' is not used in function-like macro
 #70: FILE: include/drm/drm_print.h:148:
 +#define DRM_CLASSMAP_USE(name)

the macro is empty, and correct. only 1 arg is expected.
---
 drivers/gpu/drm/drm_print.c | 25 +++++++++++++------------
 include/drm/drm_print.h     |  8 ++++++++
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 79517bd4418f..a3b70d104afa 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -55,18 +55,19 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
 #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
 module_param_named(debug, __drm_debug, ulong, 0600);
 #else
-/* classnames must match vals of enum drm_debug_category */
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+/* classnames must match value-symbols of enum drm_debug_category */
+DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
+		    DRM_UT_CORE,
+		    "DRM_UT_CORE",
+		    "DRM_UT_DRIVER",
+		    "DRM_UT_KMS",
+		    "DRM_UT_PRIME",
+		    "DRM_UT_ATOMIC",
+		    "DRM_UT_VBL",
+		    "DRM_UT_STATE",
+		    "DRM_UT_LEASE",
+		    "DRM_UT_DP",
+		    "DRM_UT_DRMRES");
 
 static struct ddebug_class_param drm_debug_bitmap = {
 	.bits = &__drm_debug,
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 9732f514566d..e86ebb716b4c 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -141,6 +141,14 @@ enum drm_debug_category {
 	DRM_UT_DRMRES
 };
 
+#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
+#define DRM_CLASSMAP_DEFINE(...)    DYNAMIC_DEBUG_CLASSMAP_DEFINE(__VA_ARGS__)
+#define DRM_CLASSMAP_USE(name)      DYNAMIC_DEBUG_CLASSMAP_USE(name)
+#else
+#define DRM_CLASSMAP_DEFINE(...)
+#define DRM_CLASSMAP_USE(name)
+#endif
+
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
 {
 	return unlikely(__drm_debug & BIT(category));
-- 
2.49.0

