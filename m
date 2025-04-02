Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BAEA79441
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D18510E88A;
	Wed,  2 Apr 2025 17:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GTv0FZZz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774EE10E898;
 Wed,  2 Apr 2025 17:42:52 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3d6d162e516so932325ab.1; 
 Wed, 02 Apr 2025 10:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615772; x=1744220572; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PH1+tp+xqUGCykXZdLvGRvCsZKn18R+wsUvu6RBydR0=;
 b=GTv0FZZzXa/WDWB3lLRLdLs9VpTXEq6FiwR2ZO12SIPIEtDzieQ9E4rkG8mygpERqo
 MWu4e/z8QlksnV2YcZgYLRzEijkXI9phKF80/wOwFiohtpz1m6kZkYZRP0ks2wSbertW
 dUEI0hJKWK8txOaYPNDJ9kq5BdaQ0tL1KOaRQu5jx65JDJXkGwTZMRBpkhErYyR+Tu3Z
 PIejVvy/G43a+i0Q6tsQjtunK8jRcYdFjGR07Tm1K1VryTwqdt4FHcAbEFXrHO7LiNnS
 5R4urYmSgxbDmlItUqqi75Raw+BRrHpKDuIdplZKtQqsmSdBNsjcM9rUk/MNxE3DiU3X
 c/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615772; x=1744220572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PH1+tp+xqUGCykXZdLvGRvCsZKn18R+wsUvu6RBydR0=;
 b=eW+55qXkN2vAwGFCJk5o8TL7zr/L+Vecy0P0fnNlP7sSmhbyIsFLYzI1UZvR87uwAS
 gzOJxXMWQn/58536L/tAuA3L0yLEteupsfhovdliyS2JAdo8CkSVn2UzbW60/It7n6fa
 eBtWIaChKqahOQxPB3WqUHGf7NK0duxjlmfXGJhS2GzJf9UddxConl5rtKs3/yPxhiQV
 ePDpPA/sED068qZFb2y/S6PIAhchybG/FlnbiEBDLWG9jVDnKn7WWOdisW8cKkfHNc3W
 HKcQ5L7TVibZ0bRYvC5YzjdT8ifOkcj4vSRTEwVs17z7ds6Y70v0ZeZ3orAuly6X/ORs
 DGiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjyA7N2zYw5Qngn1mscEb4cB2X+hOeaIkWDhChI/hSB6XpsHPiDqU8mnU+bIeey8GQaB+kGXDm@lists.freedesktop.org,
 AJvYcCVd6+cH5L3jz+pJ4hkRQtldjfeQF/TCJ0zv14TzSlQQy2bxSLx0ccIskMA3iIMvWTMYU+1hN2Wa4+Il@lists.freedesktop.org,
 AJvYcCW4dj24yjdpCBEwgx7zZPT3okjVbnJPMBHN1WI6kwjGZaAut+6/h29CyDIyZavrAq/bhT/R4cWKH16aOh0Etw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOrcawto4mbYqCggZrAjPb6/8NriZE6wxXlZLcTikKLeeHgsRF
 RsOXsBq1XHMmhFWQZeNbQf6WdUGV3wcLgOAOSfTYF/Jfsq73eRGs
X-Gm-Gg: ASbGncsE7nRWFlKRF7zFby7FSNY+qt2Q7aXgCeUQlkS/UYEgbnTgNpP96qA4tDKvYlC
 FX2Dvnvi0fWotpY07lwS4dRb71riwCdgYkwot88OgwBEyISPHOympJbqyfUm3Kbsc00pjpWw6qr
 nBGxVvE92vKHFDAUDF5gvv/bidVbFbS8V71tsmrmFYW29YCh3/NCX4RtU+Usd2z0S8HvLVyxJaw
 BjDWu6EYIarikKXbbs23S3vT603hJ7dBxEwwlKhyfzXCEP750QV8zz36kvrgu+1FusQP1BrMjR3
 0/s0lomeAESayMcf0vjJhZFWyJaQDLplwlRvcSzntxu6JxeQ8OM76E5wgKvaA3dhe8q65+PadD+
 uWw==
X-Google-Smtp-Source: AGHT+IFF0Xv42t006bgupPe2j5bd7+HXA5fzPJlKXda74vmLnmw3u7Z/scx8WHUoSwUy3lRWMoi1WQ==
X-Received: by 2002:a05:6e02:1a24:b0:3d5:eb14:9c85 with SMTP id
 e9e14a558f8ab-3d6d54a1f71mr36768785ab.6.1743615771683; 
 Wed, 02 Apr 2025 10:42:51 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:51 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 38/54] drm-dyndbg: DRM_CLASSMAP_USE in nouveau
Date: Wed,  2 Apr 2025 11:41:40 -0600
Message-ID: <20250402174156.1246171-39-jim.cromie@gmail.com>
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
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 5664c4c71faf..bdecd27efabf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -74,17 +74,7 @@
 #include "nouveau_uvmm.h"
 #include "nouveau_sched.h"
 
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
 
 MODULE_PARM_DESC(config, "option string to pass to driver core");
 static char *nouveau_config;
-- 
2.49.0

