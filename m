Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8332CA7943F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0755610E898;
	Wed,  2 Apr 2025 17:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MaJ+LL8j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5816010E8A2;
 Wed,  2 Apr 2025 17:42:51 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3d45875d440so607745ab.0; 
 Wed, 02 Apr 2025 10:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615770; x=1744220570; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NiOyM3S4jOaHGGlz5AF/FsMWLYpHRqSO4fLf+H68uvk=;
 b=MaJ+LL8jBCHz7zYR3K7/bFUwCQg8MkPr9RHEfPWCz8nnZAUur3Khy3O7EG6mOhlLdh
 1QK79/nEPF41GJ9/u8tTbX1nKsqcvaIfLd/qSzPCUV/fwHQksDO5Q38h+ztiv0tkcnkg
 RS0Dkf+ajjayH9mvmZPM5B8t5X+OVEAejWtjzV9cBkgCeH4Nd+pb7/QiqggbCYq2cJbq
 B21OtP5QF3LEdrcMRKQwuDzYb0q10hM/k0ARtSK3mdKEA8ApvjmgKHiUsXEv9+2OTOjY
 slMBBzA9RvcFY4PCYLroT96AwLk7uZQRkQ/EPJa2sN7ne2AV/QpCvBpnafkk1vaRqEPd
 0jhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615770; x=1744220570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NiOyM3S4jOaHGGlz5AF/FsMWLYpHRqSO4fLf+H68uvk=;
 b=F0TQYfpxypvyRlKHL7GzvcGTW0qtX6jJKUXKuuQVOvwQHOz2KiH4/XkpDRgREvejqn
 oxnrWrJHGnM8Sc/jhVxA2q3Xf5Zzl5LqIPEJY+jVbz8FZG/48Putzoe0cWX1Cw//AhuN
 NMDxiR+kiGmPz5u30sJCmn7FrCCLjpaB801CXaLLFWTx9xI2zs7Cm+30OSOFDovDtCel
 Lx7/828Emu/QZX5BiBRwddyVS5nJOgoMf1GPTeWDLmg7mK/APlKqxamZOdh24cCT8qpG
 tAH50y8eUqu3Ky0t/UIN0oKe0tWf3sWwZD6/eTLcI60y2l8HQ4xKzFugPXKS4IgBxP88
 36Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1FiFPQrv3qh+Sgt5eHdcBbDRA9eIu6Yoo+/SKl+Ci3VIulA2HEAVh0OAtI6t2ySShk57gJOuMZVPf@lists.freedesktop.org,
 AJvYcCW4JnCTTheXAlR1JNjJBGadrdHubK5nEoMQDR8ySw6XZ6br3zeF0EWRynA21pG0ksbrn6xyepQhCDg5bCibGw==@lists.freedesktop.org,
 AJvYcCXqXPJmNfudjHiSp25CyUyTY8II1w3VPV0YsKPE0Dt8+WbbkSQaQuzi6+pc0ivBTdhb28L41UEB@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOQkQaiVC9mfpbJPPh6W0EzoqaAs0WKVN+7W1fMTCjRwuiKhVS
 MotQ+BNLzw1fI/+LWNOQpOVzZZ6lDwEgdJccbF0IUEiKU7vw9JJ4
X-Gm-Gg: ASbGncs3qF3LsZr3NmRe5gFKU1QyOjpZ8cfHPvEa64SvNKDH5K7/rX7hwmMtCBg+yuB
 V/xKONiaaipAFXPqTDUGyWu8rKEx0VP4NkxMfYsYVeTkraiWL6kPOte1WvLaD4T2JK35Uuwfvfk
 y6Cr60mzQszqb3xTgkOkA+JZUFqQCN+PZga5fdCm5TCTazKlQF4ky99RdlUM0coJNVSlqyIILaq
 N51dhzy6g2Jc4Ut2wPLzVUENYCnLN9vY2iHqu7deg3cDzQSJPlA08sXCdbuoizLnH0V7qq1B+iy
 Fg3yNAgX59WVezKE6j3ovuGRkuLDpTAmIT2qu86H8efA1i9qkd0hhYSt8fmYpZXnwMIAmEcHnOx
 WsQ==
X-Google-Smtp-Source: AGHT+IEmCAdxBmK0dq3RonyKvIJjIp5sHVor6eltDwW67xuLu5GGG8D2N9ixjYNq41QL7O0NfYR3PA==
X-Received: by 2002:a05:6e02:4401:20b0:3d6:cb9b:cbd6 with SMTP id
 e9e14a558f8ab-3d6cb9bcef2mr55037985ab.13.1743615770553; 
 Wed, 02 Apr 2025 10:42:50 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:50 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 37/54] drm-dyndbg: DRM_CLASSMAP_USE in drm_dp_helper
Date: Wed,  2 Apr 2025 11:41:39 -0600
Message-ID: <20250402174156.1246171-38-jim.cromie@gmail.com>
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
 drivers/gpu/drm/display/drm_dp_helper.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 61c7c2c588c6..68ba17eb2541 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -43,17 +43,7 @@
 
 #include "drm_dp_helper_internal.h"
 
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
 
 struct dp_aux_backlight {
 	struct backlight_device *base;
-- 
2.49.0

