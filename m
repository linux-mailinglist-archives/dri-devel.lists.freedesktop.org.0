Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8629AE1143
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 04:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DDA10EA9A;
	Fri, 20 Jun 2025 02:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="naIyrRPL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A62010EA95
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 02:50:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1072F44E79;
 Fri, 20 Jun 2025 02:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD48C4CEF1;
 Fri, 20 Jun 2025 02:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750387817;
 bh=klJlszl08GEvhj7kAFdQZmJniKnIexv1qYhrTfixYqU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=naIyrRPLeY2lvdbu5xv1/dFUU8Zqa7AM0VH0zT/DdWK8tthyBzVRvimPKtfoyYjsf
 SQl6Sr9yMGCeMz7yRvwr4BUHETBWncZVp/I7i40NUYUB+7SMi3irgX3KG/6f6FHCek
 bpupS2Y9yn4SwsMVlOc1EBsU4yHxrMLEER3DMaGs2giiJt9gjbPZhgY/YNukW6xadH
 ALg/fHc0XA9/HFgwygPKLOI6vJmbkR1YZVlRx77+d4asemrgs0nGcO1yGaI/z6TxEP
 CSQFdVsyA0aLxTcy+dmiEiwLAxlnI4GdRWA8z5rSS3Ath1qWVEoHYebH87S4gjQ+SN
 9K4SCJePtMdSA==
From: Mario Limonciello <superm1@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 iommu@lists.linux.dev (open list:INTEL IOMMU (VT-d)),
 linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
 kvm@vger.kernel.org (open list:VFIO DRIVER),
 linux-sound@vger.kernel.org (open list:SOUND),
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v3 7/7] fbcon: Make a symlink to the device selected as primary
Date: Thu, 19 Jun 2025 21:49:43 -0500
Message-ID: <20250620024943.3415685-8-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620024943.3415685-1-superm1@kernel.org>
References: <20250620024943.3415685-1-superm1@kernel.org>
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

From: Mario Limonciello <mario.limonciello@amd.com>

Knowing which device is the primary device can be useful for userspace
to make decisions on which device to start a display server.

Create a link to that device called 'primary_device'.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/video/fbdev/core/fbcon.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 2df48037688d1..46f21570723e5 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2934,7 +2934,7 @@ static void fbcon_select_primary(struct fb_info *info)
 {
 	if (!map_override && primary_device == -1 &&
 	    video_is_primary_device(info->device)) {
-		int i;
+		int i, r;
 
 		printk(KERN_INFO "fbcon: %s (fb%i) is primary device\n",
 		       info->fix.id, info->node);
@@ -2949,6 +2949,10 @@ static void fbcon_select_primary(struct fb_info *info)
 			       first_fb_vc + 1, last_fb_vc + 1);
 			info_idx = primary_device;
 		}
+		r = sysfs_create_link(&fbcon_device->kobj, &info->device->kobj,
+				      "primary_device");
+		if (r)
+			pr_err("fbcon: Failed to link to primary device: %d\n", r);
 	}
 
 }
@@ -3376,6 +3380,10 @@ void __init fb_console_init(void)
 
 void __exit fb_console_exit(void)
 {
+#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
+	if (primary_device != -1)
+		sysfs_remove_link(&fbcon_device->kobj, "primary_device");
+#endif
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
 	console_lock();
 	if (deferred_takeover)
-- 
2.43.0

