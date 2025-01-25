Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D289A1C18D
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A8F10EA80;
	Sat, 25 Jan 2025 06:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="USq6Ra2V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2C610EA76;
 Sat, 25 Jan 2025 06:47:25 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-844de072603so202540839f.0; 
 Fri, 24 Jan 2025 22:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787644; x=1738392444; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p0te6VyEocxzJeuDOCxt40TuU8GT7eXMxXNwkYWCJTE=;
 b=USq6Ra2VmqFjbOBc+1H6HYLlxHzWLBsALDVDT7klSvkifioqbp43C7xFyDJvrMMT+T
 +YeZO71Qge+tLETLMVeqmsdBELkWHF4hQZr9ipRbtBPUrFzbZRhZ7JBdmxp8GsDFMK8N
 pxykN5ijSg/4sPA11jnNv4wxGq1OJpD2h5o1ZJ21vVRhOAa0Kz6jvAFQQBlD7aH5rH0Z
 CjHhkPBSHS+mYyNbw6A+oZx6ATG7PLiKyjlV06NfFQ9KmImwFpsT7WGz2yYtmWK9WmtK
 PTNZJhHI8niLfnGAT78I0VqrG/CE0BRjIkNKQyK80aN3vJus9g/NAUOvhiuJqew5Ha3B
 tNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787644; x=1738392444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p0te6VyEocxzJeuDOCxt40TuU8GT7eXMxXNwkYWCJTE=;
 b=LogjYFnJbuPojkOd8QgxA25FmwwC3i5lV4jRtdV5uAppi4BNnmTmm+bf2Hoi0tUgxy
 vApzBF6IDQh2RNg95brgV57LQXR9+NabQc1wpkH6od5GN6kRJKItuo2Isee9Ny7+Srpz
 ggc8jsUZuKnyZwHa1gFGbYPOdkB/ZTeCHGmwKanQ1f6cdQlluh7S5tqUOjCbU9tNYubQ
 mRIk2PjmYOadtR7wvUzcwNTISMnqbPU80DlMWNnMbvtp3TXxZhPt9CYnPWXU1jC9TH91
 MocN1W4H1TVoT2y2Mmw5rwlGAETmfMSS/VJWaGJDekekvAy7+6HkcIDhyO7q+0y4fLqh
 6cnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMqzWSsupStTF/C0o+QOV6JNNKZwq+IKoiUnwDeVhQM0fNrBX6NQpd4gdiKjwUf6rX7cprw2WcLAZ0@lists.freedesktop.org,
 AJvYcCWo6RpLqEuEx7D94aALnb85t5eXFYS//N237kGJqrqmkDg7M9pQ9hjERxcU+BlwuK4q3xoQy0s8J1TN@lists.freedesktop.org,
 AJvYcCWvl80ILOq4Xyf7fAdUIZ8P1AEa18f3DZ1Nvh2bVsBdb6ho7SJaus3oA2urDNjRQw/k2zzqv8MzThRlwswWgg==@lists.freedesktop.org,
 AJvYcCXSx8R2BTJwO5/QmQZeM2b+Oau69weepmL4l/snnxE5vPRDElUe4tVY+zEqKqydmRNlrjNrgZuz@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyme4/9WB0lG2iSn7Piecy/OyO4dumOt4laUNG/NYBV+Pbcsuah
 KC8TVnFMFexdgEs385g1+n9vJtNEoqiRkQn6YGSGSbEYdhaIQkLg
X-Gm-Gg: ASbGncvh2nrWdAAnst/iQHm74Vtw2oxSzQAhXEc9vJIk55Vlyj7e5Yd1qy3v2hVRTAV
 8FTykdvPYWxznLZzCCjyKz38lsbCy+u5mhe3VLEhVRq98XnRNdJpZCahCipsdH3TsENd9lzxc2r
 GHdJS0d7RhYmUKpuUgkJh00J5ShsoJgV5L1iIM4r0IfN+3N9gV6d87jXrOqXYo6n6CoJVEBHtsZ
 zEU3D8hhm2CunCvoXYfdB3yvgoiNDEq8UXZO20OwgXQerpPus3voXpZU1W3HhN4ajUwegvNTN5A
 UJbwd6tCaYeENX6HWJJRaQ/3Xm2Db/X5QLSQ/w==
X-Google-Smtp-Source: AGHT+IGCmjf2GomlIQcJQ2AcpeuD/T2jw/K/OqyuAgfExaAaQ7nIOHSuZwo9+1fzmZ8pVKiyG+cedw==
X-Received: by 2002:a05:6602:2d91:b0:835:4cb5:4fa7 with SMTP id
 ca18e2360f4ac-851b62b1c79mr3161252939f.12.1737787644534; 
 Fri, 24 Jan 2025 22:47:24 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:24 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 44/63] drm-dyndbg: DRM_CLASSMAP_USE in amdgpu driver
Date: Fri, 24 Jan 2025 23:45:58 -0700
Message-ID: <20250125064619.8305-45-jim.cromie@gmail.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 38686203bea6..fab98e8418b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -232,17 +232,7 @@ int amdgpu_wbrf = -1;
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
2.48.1

