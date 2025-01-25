Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CEDA1C195
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7F510EA8C;
	Sat, 25 Jan 2025 06:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XpMabPHE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AED510EA71;
 Sat, 25 Jan 2025 06:47:27 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-844e9b8b0b9so206432539f.0; 
 Fri, 24 Jan 2025 22:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787647; x=1738392447; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fLfoUWhaMiEqDFRkLf7kMowFy2bNs5vWxblm6ukXD0o=;
 b=XpMabPHE7ItQFPi5zlL+M4iS3GCLBVmbdIc+PXq9IARtOswZFJdD1rrAOusfpJLSHM
 mrhKAQAA+WIzSTPMZ/GE+aeDNdenuuFjAR5ddqiDa1lhKPKxu/5NS+w5s7oCr3PC8o7L
 1vTf2nK2/fYKJUzYCdaRdXSFSTrL4qRviFeFA8Ubj45468IPPhfmQnLzdgERD242LCgJ
 HMa8RwMO8cLxvGL9+CWctNZP+T9KoiZwhjS45arDTXeiCBdP6w8oQe7BPPx5OgSUAwdK
 UMEM+PyGWDjOIq4EGIp+gTDfz1xrh37UjyhPhDTjfSbTb11BYvs8hJjcmZB4sv001MI9
 e8yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787647; x=1738392447;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fLfoUWhaMiEqDFRkLf7kMowFy2bNs5vWxblm6ukXD0o=;
 b=nM+H2OCNPQffvPdeWomnqzW3JP70pWlvw56zYOF62FYfkK+8ssCMrIvKeOLC5NNUoC
 9uU7WF85NGaDp0jbP6EjrogUOjl7JsDt75FAY7P129pDkqv4+bWAqeB8lBV9Z+dq7XT/
 fYCUefeACtowpKxRQuUAn9y/YWYiRsvnFljIIdPVbuJ0cK20AzGUDin5ZPij7+fty/lQ
 upXglGxoDRjiaKMfAlXtXR30ebg+y9VOGg9jR9QELuE6gv0qM7pmJpDxQsh0CeUGaAyK
 1yFp8i/pnwX8KaOmT70HC5egLfpxqdGKYFyY4MSL4WfWYIJYq3cHRMZ1z8MCiLT8wMcS
 sVEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+CsB2hz4dJ7LvAypqJ494nr0rTm3L3ouTFoXn9H2LRI87QBp7Cy1ErSExf5RnkseZ2bIM35hNyO6Lkl7PZg==@lists.freedesktop.org,
 AJvYcCVSWahA32gocmbpsFYrZT/QG+8k7WQTq5era7mJb1OZnopkq8xWs0ZxU2xzgOUS1G+BBkqUJ0RY@lists.freedesktop.org,
 AJvYcCVZDATwkHcn/Baf2vsBU/3rUvNk6A1xBoSunCCUlyOBqY2A31DwqKxz1VG317IGPf8tRI0nW8AGWz1y@lists.freedesktop.org,
 AJvYcCVbFuviROw0okjDILGU9kjpzzXzFhl2ZScv6tcxyplycelt8lHxw131pO0fOGXLB564sS6LLj5t7FBT@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwX9HR8xssvfmWbMX/+0BNGx69B7DrD9oIqnpZd1z7Quo61VulT
 VBRK0MrWVM7QchBLwcDtKiKzNYEKo2vcVL1gcYmQ1gP/d4DwCV/F
X-Gm-Gg: ASbGncuh8EwYaevuu0owWv0deNklGxqEfTaExI2Ey1IGIpky4uwGx/aFVQ6s/5cP6mY
 2yhJ65MG0pQlfb9IvoRhoG3DSaoghU3QNJXW7inlY6u1Qh+ELMTR4GbgcMCm707eXR6XvGwet2o
 vhQth6o0/4vuMC2fkuMn5wXiE+s3zxx+6dBortybFQ1jWV/LvSBivFE3vHhq9t8DrVr3KlhY2lm
 dHn6BXGLFe9+hjyQD0+WhEW2ZBO94LY1Ggfom1DKzKqmMOPC910PhmEYbMLQBXlfph9oZY3mfmj
 SlUOX1UTR3cI9WTJBHjyjRu2dD3aOCkZHAMv0w==
X-Google-Smtp-Source: AGHT+IEdJ8HqnmoOBBNAqF1bYkKrvE24cFN/Ts8+1XxohrKoBZ7Yps/ZVEmmHpXktmEoZ+ldlGFBXA==
X-Received: by 2002:a05:6602:4a0b:b0:84f:44de:9c99 with SMTP id
 ca18e2360f4ac-851b61f9123mr3214701539f.5.1737787646929; 
 Fri, 24 Jan 2025 22:47:26 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:26 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 46/63] drm-dyndbg: DRM_CLASSMAP_USE in drm_crtc_helper
Date: Fri, 24 Jan 2025 23:46:00 -0700
Message-ID: <20250125064619.8305-47-jim.cromie@gmail.com>
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
 drivers/gpu/drm/drm_crtc_helper.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 0955f1c385dd..1d08d759f238 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -50,17 +50,7 @@
 
 #include "drm_crtc_helper_internal.h"
 
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
 
 /**
  * DOC: overview
-- 
2.48.1

