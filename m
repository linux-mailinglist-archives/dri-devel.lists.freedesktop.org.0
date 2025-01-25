Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A91A1C190
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEB110EA81;
	Sat, 25 Jan 2025 06:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZMLvLiiU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5AD10EA71;
 Sat, 25 Jan 2025 06:47:26 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3ce7a77e5a1so8061635ab.0; 
 Fri, 24 Jan 2025 22:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787645; x=1738392445; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OqtI5matOTmKZS9P8ui2u3cYOkCmkkFj3gRElUN8iAI=;
 b=ZMLvLiiU+iw0+zfbwF3yYVbk3a45nFqcNZxEnOdZT4Xsq4HARMVulQmh4vtkemInKQ
 46Zp7KS8G4izgP3U5rX6zWxWh+F/XbOIghBZ8XAymenTsQDlXrzM0Tz6gY+U2vlJH7uh
 Lv6TRTRTe04d0cOy4r3tZlukNMigu1QBFeib3Rs0Oel70oednD1PA+1fH8AqjBr9yQ8A
 TK/I3Tk0Z7iodQaT+c4xOEvwMp79zJ7/X7J+ShxPTx6JJp6evOWkC490s6uQHlVHJDOY
 oSRA1NqK/9+N2BML2/1p+XEP80zyJgblgY0VN/qoIXevJzSSOQ9FS1yBJpzo4fRXoWlC
 BCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787645; x=1738392445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OqtI5matOTmKZS9P8ui2u3cYOkCmkkFj3gRElUN8iAI=;
 b=rRxfAx8jxUWmTVDaslcyGRaZtmcnax2fjskOkvtH87A8WN0MmGnRgPv991X5hHiO2T
 s8k65OT2vt99hhLvvg+u9d+ygntaDQUq534h3eHyIU4iYluiulqZe0LQyeXW24/fPp6c
 rEeDjJyqHNOFduKVroacgLpg1shlJqQZHBPYKQs/FzdxTPg0msrNSeNkwIbYHL+b/bLN
 AYiE1LAUocCvxVJjq4KufEmL6wbz5ojuAcG2+slovVfCZ58OxDaxG7Ib2P6hvK3Tp781
 R6r5LLvEuTpVI5YvV4OViuihYa4JfkPBdKMzPPqo+o/dkm6lt6FlslwF9RBSLOPHlPmV
 IDtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG0NK2WJP7HvOWbfboOmm9Ai+Vpf5jqhl0kAsd8EmTUyyQ2xpY+RxMqFMzP0uNJzlEWC2ODML9rKBT@lists.freedesktop.org,
 AJvYcCXZEcBFkqG+Pag2Nf4kQT2dCjzHxIroKcpcf7GJZduxiFd/VJTaGEj5XmLDdc30FXYuCJikcQ5Sx9TB@lists.freedesktop.org,
 AJvYcCXa+Q+R+t+evqBSqkJPuorPh+gJvdMZvH5AsH025LIINis65av9H0zmXuvdlhOCeZa5riguPB7a@lists.freedesktop.org,
 AJvYcCXgDPBIECVm+cz05bsKycacL2vC+K05nVJ746l3oeYe8f0xAvR2tl+VHHQQFKRT5mvbwaHXgWN3AVJbykIjhQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwckLhzpVSzweD1lYa/JVb7hf03zDJfDWoMKU6WUOCnFNXpYHTH
 c7MgJ8QLagPUYxyIOmAukQQAEZcrvc584xkF8BzVNPVf1Whdfkvh
X-Gm-Gg: ASbGncs9GyKtNH/Kq9uIrKBW2CrQi+8DubVfghU8JxmrhSnkTknac7J0+vXJnqHoNxB
 MB8U3i/9zz0MCqeAy7EEWHCBelsjVsk4e2KwQz9g9oXcdTU2/N4DAqJ9fbBlAZGMZrxaVYw0ZmW
 r3izVPo65HU/dosX2a+MqEy9ejjNNvQ5iDP+gRnftLSBFyafBeGcOxl6QKluvJv3OQeIgDqJusx
 NKFPD6qG/xknG9Rh8OqhIMf+QC1HCgdMKsBAfb7f5v7AfdO/eQHSlTUekM+XZZkCASh0k7uqF6J
 +a2Z9HRXxgRgMS5PNYFs93YSc/agESb4pYEctQ==
X-Google-Smtp-Source: AGHT+IGMtD8RFeAK5aJiKHyxksBNSACUL6L/VSDumbjMDcMZoOolvucD5p/b7rkbhCRrZuZ1NimS2g==
X-Received: by 2002:a05:6602:2d83:b0:847:22a7:2412 with SMTP id
 ca18e2360f4ac-851b623bb6cmr3299854339f.8.1737787645553; 
 Fri, 24 Jan 2025 22:47:25 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:25 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 45/63] drm-dyndbg: DRM_CLASSMAP_USE in i915 driver
Date: Fri, 24 Jan 2025 23:45:59 -0700
Message-ID: <20250125064619.8305-46-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/i915/i915_params.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index 37746dd619fd..2dc0e2c06e09 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -29,17 +29,7 @@
 #include "i915_params.h"
 #include "i915_drv.h"
 
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
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 #define i915_param_named(name, T, perm, desc) \
 	module_param_named(name, i915_modparams.name, T, perm); \
-- 
2.48.1

