Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864BBA7943C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2AC10E89C;
	Wed,  2 Apr 2025 17:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fo2rpbZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A092D10E897;
 Wed,  2 Apr 2025 17:42:48 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-3ce87d31480so493245ab.2; 
 Wed, 02 Apr 2025 10:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615768; x=1744220568; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w02wgtcHHGYOO+gmdOwu7/FsZrX0ILEdqRJTa3eES9s=;
 b=Fo2rpbZDNXn4KZFQL9NehPY/0LIARyCodDKU0l3ScGYZqtptg8xsnA2mzaOx3qj95b
 +fP4gXt0jCMCYiA5nrvKvyXsr+tmSF/W/ZXFdlwAYm0BuMZQgYMkcH9TMMxAItsdHyQ1
 Nfurxrn5sjGmsSRsEXUH20s3YdoItlz3tkfrk3I/LgLmkDl/Tu9GftkB5CbhhrafDbJf
 EF6TcGGfRLGSrsBWsr5zx5XMDXF6OZT9DJQC+n3+c5UEyFZjJJlIe8Cmf+5cUi5Olp1z
 u8LCAoZ6WAgIMzm/gYIG+IkDCD4wFOLif/tkPTgBbqkH6HwnCeNeqXBHI7wtq9mGUGPA
 /aoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615768; x=1744220568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w02wgtcHHGYOO+gmdOwu7/FsZrX0ILEdqRJTa3eES9s=;
 b=BVRngVsJMCNpMJVzmfRwZCvE+Hov1jcVAv+qxIhCTfL4RA9BP1QzVa27HOSSm2qQNR
 XQ8J0JFvoa3dVBjTbGz0svtUsXn0c2WAKFlvVl2X71hYIAMxqGcqZqyf3t71oTmZglIn
 ZaD5flQaaYi7UuXECCWtECbOKkKZdbb49U6Bq4C0/B9oc4lmdoOHeptWgjPR6q5LHgaM
 dgevq1xjruqj4a7aIXqosuQDD1aU8tg0MYOAFgqu0oEIa7Zbwx946HiMwLnJ4jEl9O74
 h9zw1BUJiied0wzLqLq8wEywB2D7N8jQs80h+OQxt7jRIgAO5+iE/v+yf2uFU0GtlZY3
 dRMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7NkCXgbQ6HOKE6XR0qbnb0a2ejfkQqxdCQbz+ZFE652x3tESv6tGj+7p+Vg5MVQr5Tjmtib1S@lists.freedesktop.org,
 AJvYcCVMku0gctxpbzUUsJFE6KTvMHwl4Me9gGILMyRSpAmO+KmMOp0J0HHcYTT3QcyXsFL9bvh/4rD4PB+0@lists.freedesktop.org,
 AJvYcCXXH4arJYkmV3ESqRHqidmiZsYu1SA8q+UEKGcTCT2N4tA8Lcr2fc78NIBGU1qX3kplVNLmjlgK7B9wk5EjtQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzst0vPgcRNsFbqxspsjRzg8M1VdiLNt6V2jaApGDE+bU3pewfd
 Ci5/Zkbs+J1BZPryWQmgSEC3UqP5mM2sDefoBIYPGiRj5FB5Bgig
X-Gm-Gg: ASbGncu5tO256DClmqjn3dlemlvrbJsCc0KEJsTH+tcXryQDmXSrCJapbZEnRTzUHtv
 xOMaknMah2/Z629JRncy/OD+weIYtkpHLHdx5P3f8KB+TPCWyEtRMB+9sq2FrlOx+ZmSi03e4u1
 ozFgY6002etobxDMU19llHi/diBQ3ECqRcu/SxWnUrcSVDPprGMwsxlkJYDeqLLXlGvBr9Z5cmi
 Z4yeGQMuMJ2zLg8fPFBYlUttLTDQvyw1j4vDF5VPy2kq2PIc6+1QE0I2sZHwjovAjPabBK3QZua
 YHOjRrsQYu4muTpuyI2d7DcvyqyP7h+o+jYiNG+zAoxAHhDraqzQqVjubm0+DS4ndUGzfSTwF2t
 mnA==
X-Google-Smtp-Source: AGHT+IF1HLIFdbvBCtWhlGzPwTstv1cbLvUICq16go06Bgug7/wjFdTjKb45EA502/WLzrR1pH3YCg==
X-Received: by 2002:a05:6e02:3c82:b0:3cf:c7d3:e4b with SMTP id
 e9e14a558f8ab-3d5e0a09a11mr204521865ab.21.1743615767925; 
 Wed, 02 Apr 2025 10:42:47 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:47 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 34/54] drm-dyndbg: DRM_CLASSMAP_USE in amdgpu driver
Date: Wed,  2 Apr 2025 11:41:36 -0600
Message-ID: <20250402174156.1246171-35-jim.cromie@gmail.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index c0ddbe7d6f0b..e1367f66c4d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -234,17 +234,7 @@ int amdgpu_wbrf = -1;
 int amdgpu_damage_clips = -1; /* auto */
 int amdgpu_umsch_mm_fwlog;
 
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
 
 struct amdgpu_mgpu_info mgpu_info = {
 	.mutex = __MUTEX_INITIALIZER(mgpu_info.mutex),
-- 
2.49.0

