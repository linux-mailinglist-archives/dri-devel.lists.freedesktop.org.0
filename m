Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1FA29FFA1
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D546E996;
	Fri, 30 Oct 2020 08:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D83897FB;
 Fri, 30 Oct 2020 03:29:52 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id z24so4049442pgk.3;
 Thu, 29 Oct 2020 20:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=kNFigGmlnT8RRi6z0sCPMt5Zg63u/lv6a6WCx8xI9/k=;
 b=mq0/8Qy7Ve6u00MU6iGI3ZON19U0Xh/nF42bdR7N8KoIOexf6e9uuP1lJ7aPL9gxUF
 /6hU8zFSrMi6wE7MgmKYzth/P3AAHrFx3hiCLQqn74BJsqXoEznfDAxOU5bUjLpHiriW
 +xvNTLfTgQB/aH1BCeDHWPLsRnuRkZqcguv6AiS45T+8S70dPK3t9d1Z5D89aEvbA36h
 SSN0kZRpx6bb/PIB4Mg9d0IvpLH3k8tMjtCqBHy9vjRtvysTEcMkFXvrsqVhBh/S1tVI
 a9I2R3URX8Eno+U2bihtbF7TL09mAfmAwplYxtkDUuWuhZ8HRtLZLiCIVNjSul1ss+1T
 towA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=kNFigGmlnT8RRi6z0sCPMt5Zg63u/lv6a6WCx8xI9/k=;
 b=bH9RVvtRdTLI0/bTH8F8FjaOUDQSflQWomkphsvtXxv+SQlIkNsmy7iLu3VtKeGhMu
 5itmlPJsTvZPVzVJMqvmRgZH9/U4OgvDfySLiq/ah3t74SgngZ6akCGpHTEgAjcVYSvD
 tlSNPxWJFeaFdHyqCOnfOPFikidiKBZWnVh4FKT19WPW6P2AK2XQmKBGaxW9rdZA/jVP
 twf4JxnZ8xPJriaQXwQ8MVB1s6N8NQLDF18LDfF1gz0l4rdk32oS5VeH3LElcXPFoVmz
 Ulz8SwTqRJCgobQBC2nC5cpAinXRrdBFvswPsCFGb2AeqwkDcrurDgSTOjZ5Tgf3SSO/
 wnLw==
X-Gm-Message-State: AOAM532++Q4Hw0s46W1R39jyrnU/JZFXoPiYF7Nkr+08Kjv6ednU0Rwv
 ZjDkFUMRSuA2xJ6RvsBjOm8=
X-Google-Smtp-Source: ABdhPJwIVMjw39qjT1TY0hYU+IjXwoIA0G3zsE2DQwL6bJLjQU34JC8Hiwe282UUBVpaiq3XeYJhvQ==
X-Received: by 2002:a63:c053:: with SMTP id z19mr393466pgi.418.1604028592566; 
 Thu, 29 Oct 2020 20:29:52 -0700 (PDT)
Received: from my--box ([103.98.79.70])
 by smtp.gmail.com with ESMTPSA id b16sm220933pju.16.2020.10.29.20.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 20:29:52 -0700 (PDT)
Date: Fri, 30 Oct 2020 08:59:45 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: outreachy-kernel@googlegroups.com, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/gvt: use DEFINE_DEBUGFS_ATTRIBUTE with
 debugfs_create_file_unsafe()
Message-ID: <20201030032945.GA274850@my--box>
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

 drivers/gpu/drm/i915/gvt/debugfs.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
index 62e6a14ad58e..18adfa2d5f5b 100644
--- a/drivers/gpu/drm/i915/gvt/debugfs.c
+++ b/drivers/gpu/drm/i915/gvt/debugfs.c
@@ -147,9 +147,8 @@ vgpu_scan_nonprivbb_set(void *data, u64 val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(vgpu_scan_nonprivbb_fops,
-			vgpu_scan_nonprivbb_get, vgpu_scan_nonprivbb_set,
-			"0x%llx\n");
+DEFINE_DEBUGFS_ATTRIBUTE(vgpu_scan_nonprivbb_fops, vgpu_scan_nonprivbb_get,
+			 vgpu_scan_nonprivbb_set, "0x%llx\n");
 
 /**
  * intel_gvt_debugfs_add_vgpu - register debugfs entries for a vGPU
@@ -165,8 +164,8 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu)
 	debugfs_create_bool("active", 0444, vgpu->debugfs, &vgpu->active);
 	debugfs_create_file("mmio_diff", 0444, vgpu->debugfs, vgpu,
 			    &vgpu_mmio_diff_fops);
-	debugfs_create_file("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
-			    &vgpu_scan_nonprivbb_fops);
+	debugfs_create_file_unsafe("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
+				   &vgpu_scan_nonprivbb_fops);
 }
 
 /**
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
