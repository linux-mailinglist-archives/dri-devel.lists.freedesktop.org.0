Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE8492634E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 16:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180D110E8D4;
	Wed,  3 Jul 2024 14:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FMAgBfBp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2706910E8D0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 14:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720016697; x=1751552697;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=xKrfYygHL66zKF5LftEfg0yfig95SkJROtYBUbot13Q=;
 b=FMAgBfBpXcymwt1BOvHUrUDChWk1UF0ll7LrQit9Z1xIxHLuehlf6zJg
 ThQW1tE/t1v5qu780ythx/V2pYd064hvEiLtceQxmI5GMvdOl4ccX1/Tr
 /CLL9o8f4GEPA0Uiowh4eGiGiuspqQBc9qxStsw9SfaVQI5Mbbu9BcOW0
 kpwDKpnD2cwblPiuQLRkDRH7JdNPgC8mHG51qh113xZHeSmbEcGPv3WEf
 gae0Tq4aQWUMx3UkB5Ol9lx9epC3VwVxNkOCauO8Ws/seecIqxk/T4IAG
 6umP0nbMbFpjMTfUq+s4jJJlXktN8xbyn8fsFjWO15mg8Os0DHGFHs5TG Q==;
X-CSE-ConnectionGUID: dDC5WJ9nTiiSf6kGmkrjJw==
X-CSE-MsgGUID: MHHiWn4vSUybcfCJUKdOAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17367851"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="17367851"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 07:24:56 -0700
X-CSE-ConnectionGUID: NEGC8JXJTridh2yRepppNg==
X-CSE-MsgGUID: oPY5YWC5R6Gx8x3n1n5j0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="46195186"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 07:24:54 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tony.luck@intel.com, qiuxu.zhuo@intel.com, yudong.wang@intel.com
Subject: [PATCH v2 1/1] drm/fb-helper: Don't schedule_work() to flush frame
 buffer during panic()
Date: Wed,  3 Jul 2024 22:17:37 +0800
Message-Id: <20240703141737.75378-1-qiuxu.zhuo@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cbe57a4a-de59-42d1-882f-f66cbd09ecf2@suse.de>
References: <cbe57a4a-de59-42d1-882f-f66cbd09ecf2@suse.de>
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reported-by: Yudong Wang <yudong.wang@intel.com>
Tested-by: Yudong Wang <yudong.wang@intel.com>
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
v1 -> v2:
  - No function changes.

  - Add 'Acked-by' from Thomas Zimmermann.
    [ Thanks Thomas Zimmermann for reviewing this patch. ]

  - Add 'Tested-by' from Yudong Wang.

  - Add comments to drm_fb_helper_damage() about the early return on oops_in_progress.

 drivers/gpu/drm/drm_fb_helper.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d612133e2cf7..6ad75034c966 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -628,6 +628,17 @@ static void drm_fb_helper_add_damage_clip(struct drm_fb_helper *helper, u32 x, u
 static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
 				 u32 width, u32 height)
 {
+	/*
+	 * This function may be invoked by panic() to flush the frame
+	 * buffer, where all CPUs except the panic CPU are stopped.
+	 * During the following schedule_work(), the panic CPU needs
+	 * the worker_pool lock, which might be held by a stopped CPU,
+	 * causing schedule_work() and panic() to block. Return early on
+	 * oops_in_progress to prevent this blocking.
+	 */
+	if (oops_in_progress)
+		return;
+
 	drm_fb_helper_add_damage_clip(helper, x, y, width, height);
 
 	schedule_work(&helper->damage_work);
-- 
2.17.1

