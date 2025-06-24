Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70CDAE70C1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 22:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1012F10E128;
	Tue, 24 Jun 2025 20:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="luHxbjY8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44D410E126
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 20:31:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E6B25A52192;
 Tue, 24 Jun 2025 20:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8336DC4CEF0;
 Tue, 24 Jun 2025 20:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750797063;
 bh=glRBi2ARDp3d+Stsv79iYRajcXAB16Ljdcta010d3iw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=luHxbjY8QkJ0Yg2QXmhfaKo9Bqs9u5neonEgfPJNBoHYZIanCGdbiyxm4ianZFl6/
 VR5mQjb0tkMQrB5tD5M5evHAFgu9dHeDmuV+21qp2tHIakCsiL+o5dKD8wh85h8Por
 pz3a+fxzlIQtl9KrwdEUL/cZy8d8W7+S/bhWJwxqgF3F+h5kEZEd0FGmCFnoqXd1sE
 T43uS0SrYZP05oQn9xOkZgR46P5M3t1OXIRNFBNlLB5oqVBIUjtwXw2GwSCfqdxY6J
 32TFBKNqAdIGp/Oktup2ZQzNpJLhFSo/Oy+rYifg6mbb5I4CeGUWnuKbCVPeLHXiAL
 Ke928R8h+5NBQ==
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
 Mario Limonciello <mario.limonciello@amd.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH v5 6/9] Fix access to video_is_primary_device() when compiled
 without CONFIG_VIDEO
Date: Tue, 24 Jun 2025 15:30:39 -0500
Message-ID: <20250624203042.1102346-7-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624203042.1102346-1-superm1@kernel.org>
References: <20250624203042.1102346-1-superm1@kernel.org>
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

When compiled without CONFIG_VIDEO the architecture specific
implementations of video_is_primary_device() include prototypes and
assume that video-common.c will be linked. Guard against this so that the
fallback inline implementation that returns false will be used when
compiled without CONFIG_VIDEO.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506221312.49Fy1aNA-lkp@intel.com/
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5:
 * add tag
v4:
 * new patch
---
 arch/parisc/include/asm/video.h | 2 +-
 arch/sparc/include/asm/video.h  | 2 ++
 arch/x86/include/asm/video.h    | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/include/asm/video.h b/arch/parisc/include/asm/video.h
index c5dff3223194a..a9d50ebd6e769 100644
--- a/arch/parisc/include/asm/video.h
+++ b/arch/parisc/include/asm/video.h
@@ -6,7 +6,7 @@
 
 struct device;
 
-#if defined(CONFIG_STI_CORE)
+#if defined(CONFIG_STI_CORE) && defined(CONFIG_VIDEO)
 bool video_is_primary_device(struct device *dev);
 #define video_is_primary_device video_is_primary_device
 #endif
diff --git a/arch/sparc/include/asm/video.h b/arch/sparc/include/asm/video.h
index a6f48f52db584..773717b6d4914 100644
--- a/arch/sparc/include/asm/video.h
+++ b/arch/sparc/include/asm/video.h
@@ -19,8 +19,10 @@ static inline pgprot_t pgprot_framebuffer(pgprot_t prot,
 #define pgprot_framebuffer pgprot_framebuffer
 #endif
 
+#ifdef CONFIG_VIDEO
 bool video_is_primary_device(struct device *dev);
 #define video_is_primary_device video_is_primary_device
+#endif
 
 static inline void fb_memcpy_fromio(void *to, const volatile void __iomem *from, size_t n)
 {
diff --git a/arch/x86/include/asm/video.h b/arch/x86/include/asm/video.h
index 0950c9535fae9..08ec328203ef8 100644
--- a/arch/x86/include/asm/video.h
+++ b/arch/x86/include/asm/video.h
@@ -13,8 +13,10 @@ pgprot_t pgprot_framebuffer(pgprot_t prot,
 			    unsigned long offset);
 #define pgprot_framebuffer pgprot_framebuffer
 
+#ifdef CONFIG_VIDEO
 bool video_is_primary_device(struct device *dev);
 #define video_is_primary_device video_is_primary_device
+#endif
 
 #include <asm-generic/video.h>
 
-- 
2.43.0

