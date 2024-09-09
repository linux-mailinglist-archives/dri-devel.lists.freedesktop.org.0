Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E653971AA3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 15:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1662010E060;
	Mon,  9 Sep 2024 13:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nvydEuWP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A9410E060
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 13:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725887922; x=1757423922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LaS630GWSJUP5/OlzQClgenx4KF+6YVTc43cjcpFnEE=;
 b=nvydEuWPzPtP7vERkOJV/Fzjzpm429tssi/gsHmRD54obWQgs6wS5/VA
 XNnY1lTrCHUTsR3+Dm3kJllD8AWIMMSe8tlI5U+/zJpw7K65qmj+uQMB3
 By3vAfkimRPr3v/Rzl20tjWImQ70HWg1+IroGOrOxm1v4XjBpJeHaB/sr
 tIC34E0zibfypV6reclcjkV6jjjeGoCAt3TNM70uEKvSZ0EwtAov3M9nw
 n7IHllIEuoIw3ZDEry1Hk1dKHrjMalu4+Ay9dEPVjHXcxEe9G9rV7dXss
 2DeORF1G4BYxRRLgc+YdfNZBL1Irlhlf1r93C60F6xErm8Uy3OxIV9EHy A==;
X-CSE-ConnectionGUID: 3lNddIxAQ4qiw2XPw7Hrcw==
X-CSE-MsgGUID: Fkt3KgyiT1eguMbZ1SYZhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28363548"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="28363548"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 06:18:41 -0700
X-CSE-ConnectionGUID: y9IAZPafTayJLBL4nz5pOw==
X-CSE-MsgGUID: 0VC8m7WDSiqzEP0MrMRAvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="104127985"
Received: from yzhao56-desk.sh.intel.com ([10.239.159.62])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 06:18:37 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: kraxel@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org,
 Yan Zhao <yan.y.zhao@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2] drm/bochs: use devm_ioremap_wc() to map framebuffer
Date: Mon,  9 Sep 2024 21:16:43 +0800
Message-ID: <20240909131643.28915-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.43.2
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

Opt for devm_ioremap_wc() over devm_ioremap() when mapping the framebuffer.

Using devm_ioremap() results in the VA being mapped with PAT=UC-, which
considerably slows down drm_fb_memcpy(). In contrast, devm_ioremap_wc()
maps the VA with PAT set to WC, leading to better performance on platforms
where access to UC memory is much slower than WC memory.

Here's the performance data measured in a guest on the physical machine
"Sapphire Rapids XCC".
With host KVM honors guest PAT memory types, the effective memory type
for this framebuffer range is
- WC when devm_ioremap_wc() is used
- UC- when devm_ioremap() is used.

The data presented is an average from 10 execution runs.

Cycles: Avg cycles of executed bochs_primary_plane_helper_atomic_update()
        from VM boot to GDM show up
Cnt:    Avg cnt of executed bochs_primary_plane_helper_atomic_update()
        from VM boot to GDM show up
T:      Avg time of each bochs_primary_plane_helper_atomic_update().

 -------------------------------------------------
|            | devm_ioremap() | devm_ioremap_wc() |
|------------|----------------|-------------------|
|  Cycles    |    211.545M    |   0.157M          |
|------------|----------------|-------------------|
|  Cnt       |     142        |   1917            |
|------------|----------------|-------------------|
|  T         |    0.1748s     |   0.0004s         |
 -------------------------------------------------

Note:
Following the rebase to [3], the previously reported GDM failure on the
VGA device [1] can no longer be reproduced, thanks to the memory management
improvements made in [2]. Despite this, I have proceeded to submit this
patch because of the noticeable performance improvements it provides.

Reported-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Closes: https://lore.kernel.org/all/87jzfutmfc.fsf@redhat.com/#t
Cc: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
Link: https://lore.kernel.org/all/87jzfutmfc.fsf@redhat.com/#t [1]
Link: https://patchwork.freedesktop.org/series/138086 [2]
Link: https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/drm-misc-next [3]
---
v2:
- Rebased to the latest drm-misc-next branch. [2]
- Updated patch log to match the base code.

v1: https://lore.kernel.org/all/20240909051529.26776-1-yan.y.zhao@intel.com
---
 drivers/gpu/drm/tiny/bochs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 69c5f65e9853..9055b1dd66df 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -268,7 +268,7 @@ static int bochs_hw_init(struct bochs_device *bochs)
 	if (!devm_request_mem_region(&pdev->dev, addr, size, "bochs-drm"))
 		DRM_WARN("Cannot request framebuffer, boot fb still active?\n");
 
-	bochs->fb_map = devm_ioremap(&pdev->dev, addr, size);
+	bochs->fb_map = devm_ioremap_wc(&pdev->dev, addr, size);
 	if (bochs->fb_map == NULL) {
 		DRM_ERROR("Cannot map framebuffer\n");
 		return -ENOMEM;
-- 
2.43.2

