Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E3F91D4FF
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 02:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF11710E26B;
	Mon,  1 Jul 2024 00:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B8SjXY3L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CCE10E26B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 00:14:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1C865610D5;
 Mon,  1 Jul 2024 00:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63952C32786;
 Mon,  1 Jul 2024 00:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719792884;
 bh=M61yBx5cxGcVNquIAfQM/2mtYbrQDh++NFKojAQrq60=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B8SjXY3LzErIVf9+y6VCa5Osy1SFrJFHMVxNWqZVBXFbfFWRort4xxWwYL9CxFHOD
 ozU5gmCqdl3xrHtT7RL77FvqOkjXYxdIVO8tDTe8/jZtFlYz7q/yX87i60kYktsvVp
 9kXd/F6PPV+b87NdsDOK7bYpj9FpJ0y/LBwP3bWwkSYrqlyloa/lemyB+pbuQm5c1z
 51sZn/2PyIVcaJzfVkPJ2FwVPL21KTnfv3vbKPn4RDdjfOdIe+ZS2BVYj4sk15Cggw
 n2El+ymM2X5y0ACgyge25il71ZSNonkO9Z4d58b32V22TUFSDoNe98hef9xH18r2Z8
 E9PA13Ox/2Ufg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexey Makhalov <alexey.makhalov@broadcom.com>,
 kernel test robot <lkp@intel.com>, Borislav Petkov <bp@alien8.de>,
 Sasha Levin <sashal@kernel.org>, zack.rusin@broadcom.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.15 3/5] drm/vmwgfx: Fix missing HYPERVISOR_GUEST
 dependency
Date: Sun, 30 Jun 2024 20:14:31 -0400
Message-ID: <20240701001438.2921324-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240701001438.2921324-1-sashal@kernel.org>
References: <20240701001438.2921324-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.161
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

From: Alexey Makhalov <alexey.makhalov@broadcom.com>

[ Upstream commit 8c4d6945fe5bd04ff847c3c788abd34ca354ecee ]

VMWARE_HYPERCALL alternative will not work as intended without VMware guest code
initialization.

  [ bp: note that this doesn't reproduce with newer gccs so it must be
    something gcc-9-specific. ]

Closes: https://lore.kernel.org/oe-kbuild-all/202406152104.FxakP1MB-lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://lore.kernel.org/r/20240616012511.198243-1-alexey.makhalov@broadcom.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vmwgfx/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/Kconfig b/drivers/gpu/drm/vmwgfx/Kconfig
index c9ce47c448e03..5b9a9fba85421 100644
--- a/drivers/gpu/drm/vmwgfx/Kconfig
+++ b/drivers/gpu/drm/vmwgfx/Kconfig
@@ -2,7 +2,7 @@
 config DRM_VMWGFX
 	tristate "DRM driver for VMware Virtual GPU"
 	depends on DRM && PCI && MMU
-	depends on X86 || ARM64
+	depends on (X86 && HYPERVISOR_GUEST) || ARM64
 	select DRM_TTM
 	select MAPPING_DIRTY_HELPERS
 	# Only needed for the transitional use of drm_crtc_init - can be removed
-- 
2.43.0

