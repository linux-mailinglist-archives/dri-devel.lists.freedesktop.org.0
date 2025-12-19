Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 132B1CD14D5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD6A10E023;
	Fri, 19 Dec 2025 18:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LfpqVPEE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8420210EF41
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 11:35:56 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-7b8bbf16b71so1690677b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 03:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766144156; x=1766748956; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JA5intEY20oPKSii3rLvk45WSR+ZyHeegPBmceUZplA=;
 b=LfpqVPEEyxBQS9DyY7yDpt6IqgfaAbb6/WI1U44GafphUxV+Yld9PGZ4BeUI2xWj4r
 Bs6DcbSxm4nIzl3qWELmVCspLr4OLT7aFxSlYyg6rv3XX9jbrdbT7nzedYFu6We17GHd
 KncC+wODSkAOK+TK7qGCFXjAH7/pJHPQeTKuXXKJjHgCnFsLN20PraOW0x24ylWm4vgB
 e+5F8ArY3H0b5v9tyOaVgFeYBKAlcTNdU/b9OhYvXXADnnXf3dLJbeGpWav4umsIueq8
 hypRQp9I/+XvKAv7xbVfBjFr6nD9zSXvfXYXR5ZPcYclrmMB6TSa2hglkUIW/y46gtTL
 Aiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766144156; x=1766748956;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JA5intEY20oPKSii3rLvk45WSR+ZyHeegPBmceUZplA=;
 b=ufJaWvKeBW23qGNmFNCTNLY+GDfUvuKUGJq91K4q5hmd+MscX6o/XAW4KowvMkK2KG
 bIO/TPooL5dQUZbO23nC+yfLxioAXQNBjeubkfl7rKJWnQrDGTd5TNjUW9VtBNs2b0d6
 yYUHUCBu9tnmuZDuw71lS3jkk9WNQdsr3oJRstiiWpfqs9vbGenwm+n6ATS7wswXSVL9
 vswG6b+W02nsw9xmpc6L2DsPn35r3NBpCNu964w4j4HMzFrVPMRS3ENnbttrpaR9GXuI
 jLq2R9syX0PNHK3fMLSI6+usnekSzdPschJ28n6+qhjHU0EMsdDRHqEFkOUp4CY+kjx3
 qW/w==
X-Gm-Message-State: AOJu0YxFicMcTpc9PS2OPNmbIZ/Fh6Wzois7WqFZOJ80u7q/4/eF+Yj5
 tY+fwuElXDxM2vEK7bofSxBxIXBG/gLqaQa3KglsNKNfb8SMjcCWMMNX
X-Gm-Gg: AY/fxX6+VgLnzmv+j0YnbJutgRjaFoTQf97A+c+TFbaLnsnXEwvAhagRO6eWtmFry9N
 0pT9RO0LPQmx5MR88IM4a2a1SeJbfHUPblwYiPWP1YJbI02fHkv1yzOPW8fw4/GHKX5VHxvutZJ
 gt0ZJKlCKoc1aSP4W/slSUqBCvCM1IwhhJLsJus5co7mqpIrOSFt2pVdCXBnQnPRK8Y4MMf3+HX
 f51rukFmTaqJ8T9GNx0ap9xhrgOOfU5Oiq468ruWCirK04T4oOt6ZQPdt8RiMbiuYGBbQdcLsTS
 w3/oRmppcpdOhM0/n++qWcGrknNw2gEn/WGr0QjWdDzUdQkGhmKvqX17ci0Fw3NKe4NZzJtFb7V
 mhcY3UyP8ITITilE929cwKj1Gtyh1fRsZH8UVDhGX1i/nr/kTurW13F/X64wUMCXwoxGnbyERRR
 iBEQRajFLhjALPVUmGYfrl393SqOEUegR1iqaO0lL6LZLdT8epQ+2LFrn+oFmK8Q==
X-Google-Smtp-Source: AGHT+IFtCut35HMjFifxg7L5t/Pbn005/ktmA3HlwcWvREH16NYGHRExGDLh7PckZyKPgPc9irSTjw==
X-Received: by 2002:a05:7022:2586:b0:11b:9386:a3cf with SMTP id
 a92af1059eb24-12172312215mr2945203c88.48.1766144155767; 
 Fri, 19 Dec 2025 03:35:55 -0800 (PST)
Received: from titanite-d300.amd.com ([165.204.154.57])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1217254c734sm6857661c88.13.2025.12.19.03.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 03:35:55 -0800 (PST)
From: Mukesh Ogare <mukeshogare871@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mukesh Ogare <mukeshogare871@gmail.com>
Subject: [PATCH] drm/radeon: convert VCE logging to drm_* helpers
Date: Fri, 19 Dec 2025 19:35:41 +0800
Message-ID: <20251219113541.1264030-1-mukeshogare871@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 19 Dec 2025 18:10:48 +0000
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

Replace legacy DRM_ERROR() and DRM_INFO() logging in the VCE code
with drm_err() and drm_info() helpers that take a struct drm_device.

Using drm_* logging provides proper device context in dmesg, which is
important for systems with multiple DRM devices, and aligns the radeon
driver with current DRM logging practices.

No functional change intended.

Signed-off-by: Mukesh Ogare <mukeshogare871@gmail.com>

diff --git a/Makefile b/Makefile
index 2f545ec1690f..e404e4767944 100644
--- a/Makefile
+++ b/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 VERSION = 6
-PATCHLEVEL = 18
+PATCHLEVEL = 19
 SUBLEVEL = 0
-EXTRAVERSION =
+EXTRAVERSION = -rc1
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
diff --git a/drivers/gpu/drm/radeon/radeon_vce.c b/drivers/gpu/drm/radeon/radeon_vce.c
index bdbc1bbe8a9b..a203992cb932 100644
--- a/drivers/gpu/drm/radeon/radeon_vce.c
+++ b/drivers/gpu/drm/radeon/radeon_vce.c
@@ -121,7 +121,7 @@ int radeon_vce_init(struct radeon_device *rdev)
 	if (sscanf(c, "%2u]", &rdev->vce.fb_version) != 1)
 		return -EINVAL;
 
-	DRM_INFO("Found VCE firmware/feedback version %d.%d.%d / %d!\n",
+	drm_err(&rdev->ddev, "Found VCE firmware/feedback version %d.%d.%d / %d!\n",
 		 start, mid, end, rdev->vce.fb_version);
 
 	rdev->vce.fw_version = (start << 24) | (mid << 16) | (end << 8);
@@ -325,7 +325,7 @@ void radeon_vce_free_handles(struct radeon_device *rdev, struct drm_file *filp)
 		r = radeon_vce_get_destroy_msg(rdev, TN_RING_TYPE_VCE1_INDEX,
 					       handle, NULL);
 		if (r)
-			DRM_ERROR("Error destroying VCE handle (%d)!\n", r);
+			drm_err(&rdev->ddev, "Error destroying VCE handle (%d)!\n", r);
 
 		rdev->vce.filp[i] = NULL;
 		atomic_set(&rdev->vce.handles[i], 0);
@@ -352,7 +352,7 @@ int radeon_vce_get_create_msg(struct radeon_device *rdev, int ring,
 
 	r = radeon_ib_get(rdev, ring, &ib, NULL, ib_size_dw * 4);
 	if (r) {
-		DRM_ERROR("radeon: failed to get ib (%d).\n", r);
+		drm_err(&rdev->ddev, "radeon: failed to get ib (%d).\n", r);
 		return r;
 	}
 
@@ -388,7 +388,7 @@ int radeon_vce_get_create_msg(struct radeon_device *rdev, int ring,
 
 	r = radeon_ib_schedule(rdev, &ib, NULL, false);
 	if (r)
-		DRM_ERROR("radeon: failed to schedule ib (%d).\n", r);
+		drm_err(&rdev->ddev, "radeon: failed to schedule ib (%d).\n", r);
 
 
 	if (fence)
@@ -419,7 +419,7 @@ int radeon_vce_get_destroy_msg(struct radeon_device *rdev, int ring,
 
 	r = radeon_ib_get(rdev, ring, &ib, NULL, ib_size_dw * 4);
 	if (r) {
-		DRM_ERROR("radeon: failed to get ib (%d).\n", r);
+		drm_err(&rdev->ddev, "radeon: failed to get ib (%d).\n", r);
 		return r;
 	}
 
@@ -445,7 +445,7 @@ int radeon_vce_get_destroy_msg(struct radeon_device *rdev, int ring,
 
 	r = radeon_ib_schedule(rdev, &ib, NULL, false);
 	if (r) {
-		DRM_ERROR("radeon: failed to schedule ib (%d).\n", r);
+		drm_err(&rdev->ddev, "radeon: failed to schedule ib (%d).\n", r);
 	}
 
 	if (fence)
@@ -479,7 +479,7 @@ int radeon_vce_cs_reloc(struct radeon_cs_parser *p, int lo, int hi,
 	idx = radeon_get_ib_value(p, hi);
 
 	if (idx >= relocs_chunk->length_dw) {
-		DRM_ERROR("Relocs at %d after relocations chunk end %d !\n",
+		drm_err(&p->rdev->ddev, "Relocs at %d after relocations chunk end %d !\n",
 			  idx, relocs_chunk->length_dw);
 		return -EINVAL;
 	}
@@ -493,11 +493,11 @@ int radeon_vce_cs_reloc(struct radeon_cs_parser *p, int lo, int hi,
 	p->ib.ptr[hi] = start >> 32;
 
 	if (end <= start) {
-		DRM_ERROR("invalid reloc offset %llX!\n", offset);
+		drm_err(&p->rdev->ddev, "invalid reloc offset %llX!\n", offset);
 		return -EINVAL;
 	}
 	if ((end - start) < size) {
-		DRM_ERROR("buffer to small (%d / %d)!\n",
+		drm_err(&p->rdev->ddev, "buffer to small (%d / %d)!\n",
 			(unsigned)(end - start), size);
 		return -EINVAL;
 	}
@@ -526,7 +526,7 @@ static int radeon_vce_validate_handle(struct radeon_cs_parser *p,
 	for (i = 0; i < RADEON_MAX_VCE_HANDLES; ++i) {
 		if (atomic_read(&p->rdev->vce.handles[i]) == handle) {
 			if (p->rdev->vce.filp[i] != p->filp) {
-				DRM_ERROR("VCE handle collision detected!\n");
+				drm_err(&p->rdev->ddev, "VCE handle collision detected!\n");
 				return -EINVAL;
 			}
 			return i;
@@ -543,7 +543,7 @@ static int radeon_vce_validate_handle(struct radeon_cs_parser *p,
 		}
 	}
 
-	DRM_ERROR("No more free VCE handles!\n");
+	drm_err(&p->rdev->ddev, "No more free VCE handles!\n");
 	return -EINVAL;
 }
 
@@ -566,13 +566,13 @@ int radeon_vce_cs_parse(struct radeon_cs_parser *p)
 		uint32_t cmd = radeon_get_ib_value(p, p->idx + 1);
 
 		if ((len < 8) || (len & 3)) {
-			DRM_ERROR("invalid VCE command length (%d)!\n", len);
+			drm_err(&p->rdev->ddev, "invalid VCE command length (%d)!\n", len);
 			r = -EINVAL;
 			goto out;
 		}
 
 		if (destroyed) {
-			DRM_ERROR("No other command allowed after destroy!\n");
+			drm_err(&p->rdev->ddev, "No other command allowed after destroy!\n");
 			r = -EINVAL;
 			goto out;
 		}
@@ -593,7 +593,7 @@ int radeon_vce_cs_parse(struct radeon_cs_parser *p)
 		case 0x01000001: // create
 			created = true;
 			if (!allocated) {
-				DRM_ERROR("Handle already in use!\n");
+				drm_err(&p->rdev->ddev, "Handle already in use!\n");
 				r = -EINVAL;
 				goto out;
 			}
@@ -650,13 +650,13 @@ int radeon_vce_cs_parse(struct radeon_cs_parser *p)
 			break;
 
 		default:
-			DRM_ERROR("invalid VCE command (0x%x)!\n", cmd);
+			drm_err(&p->rdev->ddev, "invalid VCE command (0x%x)!\n", cmd);
 			r = -EINVAL;
 			goto out;
 		}
 
 		if (session_idx == -1) {
-			DRM_ERROR("no session command at start of IB\n");
+			drm_err(&p->rdev->ddev, "no session command at start of IB\n");
 			r = -EINVAL;
 			goto out;
 		}
@@ -665,7 +665,7 @@ int radeon_vce_cs_parse(struct radeon_cs_parser *p)
 	}
 
 	if (allocated && !created) {
-		DRM_ERROR("New session without create command!\n");
+		drm_err(&p->rdev->ddev, "New session without create command!\n");
 		r = -ENOENT;
 	}
 
@@ -760,7 +760,7 @@ int radeon_vce_ring_test(struct radeon_device *rdev, struct radeon_ring *ring)
 
 	r = radeon_ring_lock(rdev, ring, 16);
 	if (r) {
-		DRM_ERROR("radeon: vce failed to lock ring %d (%d).\n",
+		drm_err(&rdev->ddev, "radeon: vce failed to lock ring %d (%d).\n",
 			  ring->idx, r);
 		return r;
 	}
@@ -774,10 +774,10 @@ int radeon_vce_ring_test(struct radeon_device *rdev, struct radeon_ring *ring)
 	}
 
 	if (i < rdev->usec_timeout) {
-		DRM_INFO("ring test on %d succeeded in %d usecs\n",
+		drm_info(&rdev->ddev, "ring test on %d succeeded in %d usecs\n",
 			 ring->idx, i);
 	} else {
-		DRM_ERROR("radeon: ring %d test failed\n",
+		drm_err(&rdev->ddev, "radeon: ring %d test failed\n",
 			 ring->idx);
 		r = -ETIMEDOUT;
 	}
@@ -799,25 +799,25 @@ int radeon_vce_ib_test(struct radeon_device *rdev, struct radeon_ring *ring)
 
 	r = radeon_vce_get_create_msg(rdev, ring->idx, 1, NULL);
 	if (r) {
-		DRM_ERROR("radeon: failed to get create msg (%d).\n", r);
+		drm_err(&rdev->ddev, "radeon: failed to get create msg (%d).\n", r);
 		goto error;
 	}
 
 	r = radeon_vce_get_destroy_msg(rdev, ring->idx, 1, &fence);
 	if (r) {
-		DRM_ERROR("radeon: failed to get destroy ib (%d).\n", r);
+		drm_err(&rdev->ddev, "radeon: failed to get destroy ib (%d).\n", r);
 		goto error;
 	}
 
 	r = radeon_fence_wait_timeout(fence, false, usecs_to_jiffies(
 		RADEON_USEC_IB_TEST_TIMEOUT));
 	if (r < 0) {
-		DRM_ERROR("radeon: fence wait failed (%d).\n", r);
+		drm_err(&rdev->ddev, "radeon: fence wait failed (%d).\n", r);
 	} else if (r == 0) {
-		DRM_ERROR("radeon: fence wait timed out.\n");
+		drm_err(&rdev->ddev, "radeon: fence wait timed out.\n");
 		r = -ETIMEDOUT;
 	} else {
-		DRM_INFO("ib test on ring %d succeeded\n", ring->idx);
+		drm_info(&rdev->ddev, "ib test on ring %d succeeded\n", ring->idx);
 		r = 0;
 	}
 error:
-- 
2.43.0

