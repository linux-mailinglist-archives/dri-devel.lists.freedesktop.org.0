Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A72AA79440
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F93B10E8A1;
	Wed,  2 Apr 2025 17:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ktv2pRs2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1B610E896;
 Wed,  2 Apr 2025 17:42:50 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3d5eb0ec2bdso423565ab.2; 
 Wed, 02 Apr 2025 10:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615770; x=1744220570; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l+xh63ngQpysf5TdioxYR9h/6SGMYGM5RCAWumi1pq0=;
 b=ktv2pRs2rB/ALk/dKy6makiuOYR3agTwm9tuhdP8Vse+8yWTdv4yaKH8adYSF0Mg0+
 +PSfV1odixJiVI5Ac1GoKjqMVKNHHvWZYuF0Ib/MZOvDzWsOpnoDH7sZsdEDju6lgfTb
 oxBNChgHsFEhO+aot5pzuRcT4iYuYDZQ7CsBHymo+yB3pRxXguQrQXspD2F3xEuiAHts
 DNKDB/GRat3zLWaSoAAadcc20QNSx6eqV09RdhkAJ1STmwIoy/VW16PiWXPYzQ0A1mAg
 RBkveVVIaICGsKgRn3PC/OLvIxkLbx90WuNZOxa5qxklAKfeCFnjtqXvmraFflmchp3n
 ii1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615770; x=1744220570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l+xh63ngQpysf5TdioxYR9h/6SGMYGM5RCAWumi1pq0=;
 b=rqrproJxEAaSU4dgiSSVISeca3iTTYN+QBWZ6V5XAP2zejboa0S4j2EvukPCk9aF32
 3FB2Uyxf0a3RjKS+Xreumg61WqnIFBDij27ZARkHnynBbxODxvFQ0T8PECXjRCIr8JXc
 rwhR1bG2rPrsx/OEhekeYPIH4TxrVUc10DsPNUVZFMHf5y9U87whVsrfMzjiQB0PNWlm
 IFLsDQm7iCxjSip2WX3XQvrSGA3tAnKY+0jE7LQOWJWrpD4UoaiRUDq97p3pxe3Hdtsb
 0R4056+b5jX6++DM3TEvEOHnHZuSAlDCwK6WlC5D7fHo6gGslRa/QhrGiJHLIzhK+TKp
 EeMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVie0ScqzzkrVgmAspIn9MWKA+XWI3uXQ4k2cWeEfk0Y+iNswhtfHEWPAEKikLIc4GB7MPD1YVDk7KtTz/KKw==@lists.freedesktop.org,
 AJvYcCVltHXIkeMq2F7K3bpmvgLr0zGdDAO5QgIzagjE5gtSQAuhRSkg7s98J4E4i0MrT0p9rTMQDNSVNUso@lists.freedesktop.org,
 AJvYcCXLdeJH5WGAFkvHzvonxctcD9PU4a7xdIhAhDsqjh4gwAjnXnQ9CWSySFNNcU9JIadTEAjS8hfP@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnbG7Be2ahODMK42ZUmFoXg80HWA8WvwXmFIcrGO3QKPfxaPdz
 Oug6KweCUmepk12gamAAjFncxNWQkndui273Npb2sdb06krx1dcz
X-Gm-Gg: ASbGncv2HWSpfE1IhIdOxv68leQNrM+Q2OSJf0q7EWOixGVWuHot5vxF0L+EqISrM1m
 BvPG5e19wXBEhKrOYa0DM17PfrnESnBhI2tmYd2A5kqUvUElWHpWBK3MEtpFUVPgkzg36xqhGZS
 Cr4/63v5QsL/zXViPRxWvRqIDtAVIOheIl3w+ZC0cyCmrihB4jIz/8DtZpOhqvpaPdUQtzfh0AL
 yvkPzhrqGOoknVhCdGXaRmyyawheP2bf5PPmlQYq6Dr+Zp/r0tYCZVrWp8KDRZIVtqlGSwQEViv
 NkF4qbCk02jsaEzmoeWlV/D12QlzfEooTP/MSKQy8hunmx7XPCn6DcW95R2OUl5Bq1ScxVDzATy
 M6w==
X-Google-Smtp-Source: AGHT+IHfVFrzVXMnd2YBb1/YfvvBl5qCe+8rGWdMzMU5nSjNPKKxFlNTX09jmDed7K6kxVwAkyqtVg==
X-Received: by 2002:a05:6e02:184e:b0:3d3:dcb8:1bf1 with SMTP id
 e9e14a558f8ab-3d5e08eb179mr230026675ab.3.1743615769662; 
 Wed, 02 Apr 2025 10:42:49 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:49 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 36/54] drm-dyndbg: DRM_CLASSMAP_USE in drm_crtc_helper
Date: Wed,  2 Apr 2025 11:41:38 -0600
Message-ID: <20250402174156.1246171-37-jim.cromie@gmail.com>
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

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
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
2.49.0

