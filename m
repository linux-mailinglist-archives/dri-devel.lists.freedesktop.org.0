Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4E4AFA5D8
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 16:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBF310E39F;
	Sun,  6 Jul 2025 14:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PpbWlYDR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1622F10E39A
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 14:36:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8A10B6112D;
 Sun,  6 Jul 2025 14:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341F7C4CEEF;
 Sun,  6 Jul 2025 14:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751812604;
 bh=qucJBD1l7cekJwkkW3sSPDQAFelB6SpfdgNHX+7KrGs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PpbWlYDRkCuGunmFT9sTtHbxSwd/gVVaMktE59Av5bQNJlpIpRWWnBMwON8LQkbBW
 6gXenJkP+sbVWehgc9Qa4LZngn4VzayvaKyP4D/gf5ASSXZlb5Nr869RaVew8OnB/6
 kE61VerYy9vnazyRtGJxRv8MDOupgCzJ6JB3k+P2jlvgUjPkMUX7fXh4EBt5sp4/pE
 O9W0Z/s5Q9iKMr63iqMxPUUSFuSKz5F64qsgf9NdYhX1RBfEbnOplk9TaDJlRXdfRx
 zuNEX/u0VqDtrmTAtzX598+shxngHQGeh+kFXhAikczUIzAiLs53PC4Fj2CNbZC1nW
 i0MO8mX+JbXqg==
From: Mario Limonciello <superm1@kernel.org>
To: David Airlie <airlied@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
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
Subject: [PATCH v7 8/9] fbcon: Use screen info to find primary device
Date: Sun,  6 Jul 2025 09:36:12 -0500
Message-ID: <20250706143613.1972252-9-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250706143613.1972252-1-superm1@kernel.org>
References: <20250706143613.1972252-1-superm1@kernel.org>
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

On systems with non VGA GPUs fbcon can't find the primary GPU because
video_is_primary_device() only checks the VGA arbiter.

Add a screen info check to video_is_primary_device() so that callers
can get accurate data on such systems.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5:
 * Only change video-common.c
v4:
 * use helper
---
 arch/x86/video/video-common.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/x86/video/video-common.c b/arch/x86/video/video-common.c
index 81fc97a2a837a..917568e4d7fb1 100644
--- a/arch/x86/video/video-common.c
+++ b/arch/x86/video/video-common.c
@@ -9,6 +9,7 @@
 
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/screen_info.h>
 #include <linux/vgaarb.h>
 
 #include <asm/video.h>
@@ -27,6 +28,7 @@ EXPORT_SYMBOL(pgprot_framebuffer);
 
 bool video_is_primary_device(struct device *dev)
 {
+	struct screen_info *si = &screen_info;
 	struct pci_dev *pdev;
 
 	if (!dev_is_pci(dev))
@@ -34,7 +36,16 @@ bool video_is_primary_device(struct device *dev)
 
 	pdev = to_pci_dev(dev);
 
-	return (pdev == vga_default_device());
+	if (!pci_is_display(pdev))
+		return false;
+
+	if (pdev == vga_default_device())
+		return true;
+
+	if (pdev == screen_info_pci_dev(si))
+		return true;
+
+	return false;
 }
 EXPORT_SYMBOL(video_is_primary_device);
 
-- 
2.43.0

