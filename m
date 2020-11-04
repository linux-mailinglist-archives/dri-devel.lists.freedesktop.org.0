Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8962A611B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 11:04:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF656E984;
	Wed,  4 Nov 2020 10:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000D76E98E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 10:04:35 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e2so1759329wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 02:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZQmARHQAB/14geg2rLlXoojgCnyIT9+atY3SP94p9KE=;
 b=T285UHC/MIwGgypFFlylJ+5gB/y1bmxup71z1u8mYtQQ7TwDhBs87JODlLXC5bp1O1
 CYCM2tnGOkflVFfFX7QFqQoqX4eJNFkMdkNxYIPgDX46ZFz43Gf6+7+qha9eD0SDabcG
 Pgi6N1JykSXp7askqQp2Nq324WyrsV6FIv3C0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZQmARHQAB/14geg2rLlXoojgCnyIT9+atY3SP94p9KE=;
 b=DWGJMPb3niFBZahKYZltSjSsjDzFHlxiig4OQIXqX91nhJQGvyBQ0rvL522FBEDk1w
 KjrE9/6xu7fcTVKx5YAtGb8zDkz/Hi7bQh0UrbekYwsKMLaeTOtseK12D4y2wfDhFv4y
 wHARKXGit+MwqnI3TkwJ5psAXe1JX79hbQ6EeZQuce4tDhZ4s7r24G7rMqwGoNw6w81c
 NUAaKMgyYc0jy9GHWN//nHlsgGTrgaesVKkp3SxAKb+jBI0cd4gUBws4W/khCBI6LqJV
 3OPZ0IaxEqwFM0iuGlT7PBPuCkRbFuLTHFZZHe7lqCMhjq3csQwTvOj01l3T1emYM4Ho
 8GBA==
X-Gm-Message-State: AOAM530sWVGsweA2eXSjF/hypr4bw1XFZTwqfyeYww2nC8WGJ0Ax1Uu9
 9wgLd2CJmlhAWeaMPmPGK+twaL7VVX5UMCaL
X-Google-Smtp-Source: ABdhPJy1xoD3bYe6nAD3MViM4k8dOMVAexkWEDqFodqgvtCH4MwCPfpMsdefuMwewrBoV+UB1WJlwA==
X-Received: by 2002:a1c:81d7:: with SMTP id c206mr3581690wmd.140.1604484274497; 
 Wed, 04 Nov 2020 02:04:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n23sm120113wmk.24.2020.11.04.02.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 02:04:33 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/6] drm/amdgpu/virt: fix handling of the atomic flag
Date: Wed,  4 Nov 2020 11:04:22 +0100
Message-Id: <20201104100425.1922351-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201104100425.1922351-1-daniel.vetter@ffwll.ch>
References: <20201104100425.1922351-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexdeucher@gmail.com>

Use the per device drm driver feature flags rather than the
global one.  This way we can make the drm driver struct const.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index d0aea5e39531..8aff6ef50f91 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -47,11 +47,13 @@ bool amdgpu_virt_mmio_blocked(struct amdgpu_device *adev)
 
 void amdgpu_virt_init_setting(struct amdgpu_device *adev)
 {
+	struct drm_device *ddev = adev_to_drm(adev);
+
 	/* enable virtual display */
 	if (adev->mode_info.num_crtc == 0)
 		adev->mode_info.num_crtc = 1;
 	adev->enable_virtual_display = true;
-	adev_to_drm(adev)->driver->driver_features &= ~DRIVER_ATOMIC;
+	ddev->driver_features &= ~DRIVER_ATOMIC;
 	adev->cg_flags = 0;
 	adev->pg_flags = 0;
 }
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
