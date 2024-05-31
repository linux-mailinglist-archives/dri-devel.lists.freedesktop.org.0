Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E598D5BCB
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 09:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 492D210E040;
	Fri, 31 May 2024 07:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SHY82Che";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B7210E040
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 07:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717141676; x=1748677676;
 h=from:to:cc:subject:date:message-id;
 bh=Tu16eDOVCigfYW8Pz4VFPcNphxmr5sYpfmyZz/1SfQs=;
 b=SHY82Che2tqjU++MtTJLlC49JYKqpjIoij2p/YbE3LFB/iIxjJl7eXQb
 zo19oeJlsWUNESPY2AeI41coLbXhHPRRJjAO2LODdNAn/rT53mkHaYb3+
 z/AHnnPxxXGhnr+VwSdmZ84NVpMtLcxixu4Ix0eEjWEDDGgPKX+kueU0C
 sjE9yyiG2OuzSn4yaDAz1r+AEvz98PijwLgbYUN2ZQXUOaFdSI9UBYb7V
 8/gtq68XeFyGsiVKoWNiPN6cirNnI9TnuWeZgs0yUyTXHqpmjy8LZL5MZ
 hzIrbbavcdSFUkMiujGfA4N7LwH2vg01UDJRqOi2OzDAZUiazzIcHQO/j Q==;
X-CSE-ConnectionGUID: Jy1cutRqR6C1jdSbN74e2w==
X-CSE-MsgGUID: eOXV5aFASHqmy2WZ7eF+QQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13520037"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="13520037"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 00:47:55 -0700
X-CSE-ConnectionGUID: CzEIJVuXTHuCo7DPY+hBFA==
X-CSE-MsgGUID: vTWwWsuWRqiBcImIGrihwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="73567522"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 00:47:53 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tony.luck@intel.com, qiuxu.zhuo@intel.com, yudong.wang@intel.com
Subject: [PATCH 1/1] drm/fb-helper: Don't schedule_work() to flush frame
 buffer during panic()
Date: Fri, 31 May 2024 15:45:21 +0800
Message-Id: <20240531074521.30406-1-qiuxu.zhuo@intel.com>
X-Mailer: git-send-email 2.17.1
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

Sometimes the system [1] hangs on x86 I/O machine checks. However, the
expected behavior is to reboot the system, as the machine check handler
ultimately triggers a panic(), initiating a reboot in the last step.

The root cause is that sometimes the panic() is blocked when
drm_fb_helper_damage() invoking schedule_work() to flush the frame buffer.
This occurs during the process of flushing all messages to the frame
buffer driver as shown in the following call trace:

  Machine check occurs [2]:
    panic()
      console_flush_on_panic()
        console_flush_all()
          console_emit_next_record()
            con->write()
              vt_console_print()
                hide_cursor()
                  vc->vc_sw->con_cursor()
                    fbcon_cursor()
                      ops->cursor()
                        bit_cursor()
                          soft_cursor()
                            info->fbops->fb_imageblit()
                              drm_fbdev_generic_defio_imageblit()
                                drm_fb_helper_damage_area()
                                  drm_fb_helper_damage()
                                    schedule_work() // <--- blocked here
    ...
    emergency_restart()  // wasn't invoked, so no reboot.

During panic(), except the panic CPU, all the other CPUs are stopped.
In schedule_work(), the panic CPU requires the lock of worker_pool to
queue the work on that pool, while the lock may have been token by some
other stopped CPU. So schedule_work() is blocked.

Additionally, during a panic(), since there is no opportunity to execute
any scheduled work, it's safe to fix this issue by skipping schedule_work()
on 'oops_in_progress' in drm_fb_helper_damage().

[1] Enable the kernel option CONFIG_FRAMEBUFFER_CONSOLE,
    CONFIG_DRM_FBDEV_EMULATION, and boot with the 'console=tty0'
    kernel command line parameter.

[2] Set 'panic_timeout' to a non-zero value before calling panic().

Reported-by: Yudong Wang <yudong.wang@intel.com>
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d612133e2cf7..6d7b6f038821 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -628,6 +628,9 @@ static void drm_fb_helper_add_damage_clip(struct drm_fb_helper *helper, u32 x, u
 static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
 				 u32 width, u32 height)
 {
+	if (oops_in_progress)
+		return;
+
 	drm_fb_helper_add_damage_clip(helper, x, y, width, height);
 
 	schedule_work(&helper->damage_work);
-- 
2.17.1

