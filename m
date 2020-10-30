Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D8729FFA0
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325BF6E998;
	Fri, 30 Oct 2020 08:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B156E948;
 Fri, 30 Oct 2020 03:22:52 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id o3so4005434pgr.11;
 Thu, 29 Oct 2020 20:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=qBvjZd1NQE+Opu2oXBohKdYFGkxmEuNNU11hjYVYnCQ=;
 b=Mj33b48h76F1dSMxppcMSK6G6p3jotJKxzTrYojGUxfEpvhTrFPdTY+HPZoV2gq4oJ
 h+0vUFVO+e7BWDVQgOVC+R2T284CGbNoAAo+6ZYFsnOjZml55tKAFQ78cH3A15oJEZVG
 mrujRZtGJyCFgMx3FPZyX51iESlyui7nGtxqcddwonAsLZgt8dav4aFYBqgk71eEFUzL
 n2dOdvx+xZU5afm/QgSBfDbLIW7cbGz77YROOkiUFUc9acef+jknLNCe4n+Fc/2MIj3L
 iq760Cb4WVXRxzHf61KnVYP4HVfscx/HGeX/hkGimxhD2UZcbmv6WlkH5dxV34/JJVP3
 LIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=qBvjZd1NQE+Opu2oXBohKdYFGkxmEuNNU11hjYVYnCQ=;
 b=NpUkf2HbMlSWGf9FnWyJOqwU75nzFIYx32oXhG5OZcHwS+bcTe2EDrhvJzuwPZMemC
 t3rstPTT/Gx2Hig+YOiL5xD0HVMrDpzbh2cmMHvEhhFrLhOgqmbrecEKJpiWMc13rPX0
 uH1fJo/t9RKa8h7feXa1OqBSJU+TftgJv9PWvsUX+kolxgqGLUwOETESdluU1wJ8MgYI
 lAReabIGi+yEQ6I7u3iGeamN0QBe0wjcVgy1GgyOmu4WNKkSLf9GNXY96+s83Qhg03QQ
 /Wctm+dcamAS9yMKeYwKN7FJ5ATp6v+N/ePq+LiKFyvXE9n3SxIFVrm//8qU2KHq236B
 D/Zg==
X-Gm-Message-State: AOAM531bgwYQfyqgr6Wz6Af/LF8we8f7YnpMDdyrFaB62oIfrYTneXZm
 jOAEhOCpOXl+CUX0G+VAgiA=
X-Google-Smtp-Source: ABdhPJyrvqLEAX4zvr4eTeY6PHbOJQStYG9uu59XSfJnfnWLOEyPgXFp1yJk3y8FgbIJaX3YgghUYw==
X-Received: by 2002:a63:ec57:: with SMTP id r23mr374312pgj.257.1604028172484; 
 Thu, 29 Oct 2020 20:22:52 -0700 (PDT)
Received: from my--box ([103.98.79.70])
 by smtp.gmail.com with ESMTPSA id 92sm1313206pjv.32.2020.10.29.20.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 20:22:51 -0700 (PDT)
Date: Fri, 30 Oct 2020 08:52:45 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: outreachy-kernel@googlegroups.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: use DEFINE_DEBUGFS_ATTRIBUTE with
 debugfs_create_file_unsafe()
Message-ID: <20201030032245.GA274478@my--box>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: melissa.srw@gmail.com, daniel.vetter@ffwll.ch, mh12gx2825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using DEFINE_DEBUGFS_ATTRIBUTE macro with debugfs_create_file_unsafe()
function in place of the debugfs_create_file() function will make the
file operation struct "reset" aware of the file's lifetime. Additional
details here: https://lists.archive.carbon60.com/linux/kernel/2369498

Issue reported by Coccinelle script:
scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
Please Note: This is a Outreachy project task patch.

 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 2d125b8b15ee..f076b1ba7319 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1551,29 +1551,29 @@ static int amdgpu_debugfs_sclk_set(void *data, u64 val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(fops_ib_preempt, NULL,
-			amdgpu_debugfs_ib_preempt, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(fops_ib_preempt, NULL,
+			 amdgpu_debugfs_ib_preempt, "%llu\n");
 
-DEFINE_SIMPLE_ATTRIBUTE(fops_sclk_set, NULL,
-			amdgpu_debugfs_sclk_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(fops_sclk_set, NULL,
+			 amdgpu_debugfs_sclk_set, "%llu\n");
 
 int amdgpu_debugfs_init(struct amdgpu_device *adev)
 {
 	int r, i;
 
 	adev->debugfs_preempt =
-		debugfs_create_file("amdgpu_preempt_ib", 0600,
-				    adev_to_drm(adev)->primary->debugfs_root, adev,
-				    &fops_ib_preempt);
+		debugfs_create_file_unsafe("amdgpu_preempt_ib", 0600,
+					   adev_to_drm(adev)->primary->debugfs_root, adev,
+					   &fops_ib_preempt);
 	if (!(adev->debugfs_preempt)) {
 		DRM_ERROR("unable to create amdgpu_preempt_ib debugsfs file\n");
 		return -EIO;
 	}
 
 	adev->smu.debugfs_sclk =
-		debugfs_create_file("amdgpu_force_sclk", 0200,
-				    adev_to_drm(adev)->primary->debugfs_root, adev,
-				    &fops_sclk_set);
+		debugfs_create_file_unsafe("amdgpu_force_sclk", 0200,
+					   adev_to_drm(adev)->primary->debugfs_root, adev,
+					   &fops_sclk_set);
 	if (!(adev->smu.debugfs_sclk)) {
 		DRM_ERROR("unable to create amdgpu_set_sclk debugsfs file\n");
 		return -EIO;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
