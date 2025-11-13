Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73BEC58B84
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA3310E8CD;
	Thu, 13 Nov 2025 16:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wm1FItS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA5510E8C4;
 Thu, 13 Nov 2025 16:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763051316; x=1794587316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B26Ec9dWbSl4Gj6CIl71kjMp8WJ8/d82w0820A3xbuw=;
 b=Wm1FItS/cIgBC+13Y8gPsA+3seWP2PBd8oMaVdk8iaUVyIPDMjFFvdqX
 4pfvYblEOydMcNWM5DFvqokp2sWVpVxy8bRFVD5UBflcvkKBkBBsBcDnO
 mfhulnulXBKZmsyzaLyaHoLAAAedWOSfSWVgy5mQ7N8GAx0u8EuFIBuZM
 9qHUyyM79wvljoMDvQ4DQxgdIibkVvulGP6mVNAvTwEX0Q8UXOJn1ys5U
 /sF+TmeUFHLBOAAAJgm9FA/dU7W/P49jeyLevmaVwnpDYa+rE+kQEd+5O
 bZJJmRZQLXltoxdm5cz0aIgB5TuM0Hm70J+2TG9RNAg4fUMrWXaiPlCua g==;
X-CSE-ConnectionGUID: uMBTSd6oSPeS5Og0eCjUAQ==
X-CSE-MsgGUID: Su2VX6BLStWg5K9HIqN3Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="69002454"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="69002454"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:28:36 -0800
X-CSE-ConnectionGUID: 061ungIyS+iTUZqUn4XgzA==
X-CSE-MsgGUID: Vz9zXO3SSmyNo9a5jYFbkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="194699545"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.164])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:28:29 -0800
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
Subject: [PATCH v2 10/11] drm/amdgpu: Remove driver side BAR release before
 resize
Date: Thu, 13 Nov 2025 18:26:27 +0200
Message-Id: <20251113162628.5946-11-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
References: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
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
index 4e241836ae68..f11a255786d7 100644
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
 
 	r = pci_resize_resource(adev->pdev, 0, rbar_size, 1 << 5);
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

