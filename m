Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02199C1635E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:37:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C3410E63C;
	Tue, 28 Oct 2025 17:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQKv+g3L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDF510E639;
 Tue, 28 Oct 2025 17:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761673071; x=1793209071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8HzYU02dn6gqkOKj2vIFpqRrMZ6pFIdvNMAeG0Ynh8Y=;
 b=VQKv+g3LJAgO0OqFrZdRi86ZXbxcSHGByQbG059wkU5LPiOXf5tB0POQ
 aHPTEkgVsnuFEHWozqSjWV1OuvZsKftC5N2MATiKjXU5AR0YZUzZYvoKk
 ZU5QB3sm3dQIvljc4Vmfe2dXGe/24lIi+cg7AQNbjwZb2YNb2iEo+G58Y
 kxsUjddqWnAUUioh4YLpgRdSHx/ZSS/ic7HSv5lP+kXzzinsfFz9/+QUJ
 zqt4XsYJUWobVkXE48BwOTnq2xbfVk1WIdpuBvta7PRI49wSC5Z6luv+Y
 LdRst/HzE7Zv8nnUH54pJ3zXHQjGRZTivt6t2t88eU5wgl+YC/WOzoz+T Q==;
X-CSE-ConnectionGUID: iM89iywtSwyMS+3FJC9+gA==
X-CSE-MsgGUID: oeEDHcbHQ3u4+TO0gHlSNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67425319"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="67425319"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:37:50 -0700
X-CSE-ConnectionGUID: O7zkssxpThup/TW4+3yClA==
X-CSE-MsgGUID: oeHFK8iZSu+Rblv5L3kuqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="185112401"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.182])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:37:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Simon Richter <Simon.Richter@hogyros.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 8/9] drm/amdgpu: Remove driver side BAR release before resize
Date: Tue, 28 Oct 2025 19:35:50 +0200
Message-Id: <20251028173551.22578-9-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251028173551.22578-1-ilpo.jarvinen@linux.intel.com>
References: <20251028173551.22578-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

PCI core handles releasing device's resources and their rollback in
case of failure of a BAR resizing operation. Releasing resource prior
to calling pci_resize_resource() prevents PCI core from restoring the
BARs as they were.

Remove driver-side release of BARs from the amdgpu driver.

Also remove the driver initiated assignment as pci_resize_resource()
should try to assign as much as possible. If the driver side call
manages to get more required resources assigned in some scenario, such
a problem should be fixed inside pci_resize_resource() instead.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 7a899fb4de29..65474d365229 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1729,12 +1729,8 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
 	pci_write_config_word(adev->pdev, PCI_COMMAND,
 			      cmd & ~PCI_COMMAND_MEMORY);
 
-	/* Free the VRAM and doorbell BAR, we most likely need to move both. */
+	/* Tear down doorbell as resizing will release BARs */
 	amdgpu_doorbell_fini(adev);
-	if (adev->asic_type >= CHIP_BONAIRE)
-		pci_release_resource(adev->pdev, 2);
-
-	pci_release_resource(adev->pdev, 0);
 
 	r = pci_resize_resource(adev->pdev, 0, rbar_size);
 	if (r == -ENOSPC)
@@ -1743,8 +1739,6 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
 	else if (r && r != -ENOTSUPP)
 		dev_err(adev->dev, "Problem resizing BAR0 (%d).", r);
 
-	pci_assign_unassigned_bus_resources(adev->pdev->bus);
-
 	/* When the doorbell or fb BAR isn't available we have no chance of
 	 * using the device.
 	 */
-- 
2.39.5

