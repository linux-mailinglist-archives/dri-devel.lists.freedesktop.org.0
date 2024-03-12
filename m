Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC17B87910A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 10:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AB510F38A;
	Tue, 12 Mar 2024 09:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IJpeHrz3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C127610F33E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 09:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710236162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=UpQt4rFmaG+pnh1jxHreV7eEP/lKtwbHt1vwmJNiSUE=;
 b=IJpeHrz3685ZxQa3Onp5g/s8yCc6rm07IYBxcv1ASZ3LFkGKK3xi/mzyBSlRH9AJNDo7cK
 WkAW7VPr5tIWgzG/yv8o8uOcfAcFO09vePI73Sigw1cS16Z7SGVDRq6rNYY4Pu1YNqG0tD
 s5WxqIyoCvhIEan97eT2S7lrdArmfpU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-663-ULZCs2HVMSCMs3spfJNIXQ-1; Tue,
 12 Mar 2024 05:35:58 -0400
X-MC-Unique: ULZCs2HVMSCMs3spfJNIXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E612F3801F52;
 Tue, 12 Mar 2024 09:35:57 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 084A12022EDB;
 Tue, 12 Mar 2024 09:35:55 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, tzimmermann@suse.de,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH] vmwgfx: Create debugfs ttm_resource_manager entry only if
 needed
Date: Tue, 12 Mar 2024 10:35:12 +0100
Message-ID: <20240312093551.196609-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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

The driver creates /sys/kernel/debug/dri/0/mob_ttm even when the
corresponding ttm_resource_manager is not allocated.
This leads to a crash when trying to read from this file.

Add a check to create mob_ttm, system_mob_ttm, and gmr_ttm debug file
only when the corresponding ttm_resource_manager is allocated.

crash> bt
PID: 3133409  TASK: ffff8fe4834a5000  CPU: 3    COMMAND: "grep"
 #0 [ffffb954506b3b20] machine_kexec at ffffffffb2a6bec3
 #1 [ffffb954506b3b78] __crash_kexec at ffffffffb2bb598a
 #2 [ffffb954506b3c38] crash_kexec at ffffffffb2bb68c1
 #3 [ffffb954506b3c50] oops_end at ffffffffb2a2a9b1
 #4 [ffffb954506b3c70] no_context at ffffffffb2a7e913
 #5 [ffffb954506b3cc8] __bad_area_nosemaphore at ffffffffb2a7ec8c
 #6 [ffffb954506b3d10] do_page_fault at ffffffffb2a7f887
 #7 [ffffb954506b3d40] page_fault at ffffffffb360116e
    [exception RIP: ttm_resource_manager_debug+0x11]
    RIP: ffffffffc04afd11  RSP: ffffb954506b3df0  RFLAGS: 00010246
    RAX: ffff8fe41a6d1200  RBX: 0000000000000000  RCX: 0000000000000940
    RDX: 0000000000000000  RSI: ffffffffc04b4338  RDI: 0000000000000000
    RBP: ffffb954506b3e08   R8: ffff8fee3ffad000   R9: 0000000000000000
    R10: ffff8fe41a76a000  R11: 0000000000000001  R12: 00000000ffffffff
    R13: 0000000000000001  R14: ffff8fe5bb6f3900  R15: ffff8fe41a6d1200
    ORIG_RAX: ffffffffffffffff  CS: 0010  SS: 0018
 #8 [ffffb954506b3e00] ttm_resource_manager_show at ffffffffc04afde7 [ttm]
 #9 [ffffb954506b3e30] seq_read at ffffffffb2d8f9f3
    RIP: 00007f4c4eda8985  RSP: 00007ffdbba9e9f8  RFLAGS: 00000246
    RAX: ffffffffffffffda  RBX: 000000000037e000  RCX: 00007f4c4eda8985
    RDX: 000000000037e000  RSI: 00007f4c41573000  RDI: 0000000000000003
    RBP: 000000000037e000   R8: 0000000000000000   R9: 000000000037fe30
    R10: 0000000000000000  R11: 0000000000000246  R12: 00007f4c41573000
    R13: 0000000000000003  R14: 00007f4c41572010  R15: 0000000000000003
    ORIG_RAX: 0000000000000000  CS: 0033  SS: 002b

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Fixes: af4a25bbe5e7 ("drm/vmwgfx: Add debugfs entries for various ttm resource managers")
Cc: <stable@vger.kernel.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index d3e308fdfd5b..c7d90f96d16a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1444,12 +1444,15 @@ static void vmw_debugfs_resource_managers_init(struct vmw_private *vmw)
 					    root, "system_ttm");
 	ttm_resource_manager_create_debugfs(ttm_manager_type(&vmw->bdev, TTM_PL_VRAM),
 					    root, "vram_ttm");
-	ttm_resource_manager_create_debugfs(ttm_manager_type(&vmw->bdev, VMW_PL_GMR),
-					    root, "gmr_ttm");
-	ttm_resource_manager_create_debugfs(ttm_manager_type(&vmw->bdev, VMW_PL_MOB),
-					    root, "mob_ttm");
-	ttm_resource_manager_create_debugfs(ttm_manager_type(&vmw->bdev, VMW_PL_SYSTEM),
-					    root, "system_mob_ttm");
+	if (vmw->has_gmr)
+		ttm_resource_manager_create_debugfs(ttm_manager_type(&vmw->bdev, VMW_PL_GMR),
+						    root, "gmr_ttm");
+	if (vmw->has_mob) {
+		ttm_resource_manager_create_debugfs(ttm_manager_type(&vmw->bdev, VMW_PL_MOB),
+						    root, "mob_ttm");
+		ttm_resource_manager_create_debugfs(ttm_manager_type(&vmw->bdev, VMW_PL_SYSTEM),
+						    root, "system_mob_ttm");
+	}
 }
 
 static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,

base-commit: b33651a5c98dbd5a919219d8c129d0674ef74299
-- 
2.44.0

