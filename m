Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91379C5C945
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 11:31:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB26D10EA3E;
	Fri, 14 Nov 2025 10:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FbIHn2im";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA07110EA3E;
 Fri, 14 Nov 2025 10:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763116265; x=1794652265;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4H+gkE1nhzILPkm76jIHz8K1t3KUC9ctV4oeJAaqBDA=;
 b=FbIHn2imcdq2I96gKkZ89JZUsc3XrqGlLwe5mrO2FNIVkho2dh7eCz6D
 +azU/+FyZKkoewi6aQPR2ptGFReZCrSRtNj9fIb+1gOiS9ns9QsSseN3+
 QxBtInM7zpmD6Yns+2Snx16b3RY4jH96fgkDGu1wnkzCM8xo+HAbqQy+x
 X2U/Yys2w7CDiCXTyJ3WA7jLymSt7EA0Xj4Tsa0VNT3y/BdnsXH+8dL8T
 hGrO1HZBqocRxEt0K1lQ/iDLoaJgB7R5dLhf7Y5/HamRxA//92RxAYNx/
 JvTF266/UpdsjOweeOrQ/lVVBB9DjF+RkD0W4E3NfqfbO9jutVurPm9us g==;
X-CSE-ConnectionGUID: tU7a0vYKT6Ok85cCJQngwQ==
X-CSE-MsgGUID: SOi5vD1XQFuAovZtDZAWIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76670212"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="76670212"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 02:31:04 -0800
X-CSE-ConnectionGUID: eBJRYcq2Sr6a7pU+o5mKXQ==
X-CSE-MsgGUID: OeaTK7j+SCKPYKFtdtMwLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="213155445"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.31])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 02:31:00 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-pci@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 1/1] PCI (& drm/amdgpu): BAR to be excluded depends on HW
 generation
Date: Fri, 14 Nov 2025 12:30:53 +0200
Message-Id: <20251114103053.13778-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
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

Depending on HW generation, BAR that needs to be excluded from
pci_resize_resource() is either 2 or 5.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---

This change should be be folded into the commit 73cd7ee85e78 ("PCI: Fix
restoring BARs on BAR resize rollback path") in the pci/resource branch.

Also the changelog should be changed: "(BAR 5)" -> "(BAR 2 or 5)".

---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 4e241836ae68..bf0bc38e1c47 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1736,7 +1736,9 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
 
 	pci_release_resource(adev->pdev, 0);
 
-	r = pci_resize_resource(adev->pdev, 0, rbar_size, 1 << 5);
+	r = pci_resize_resource(adev->pdev, 0, rbar_size,
+				(adev->asic_type >= CHIP_BONAIRE) ? 1 << 5
+								  : 1 << 2);
 	if (r == -ENOSPC)
 		dev_info(adev->dev,
 			 "Not enough PCI address space for a large BAR.");

base-commit: 73cd7ee85e788bc2541bfce2500e3587cf79f081
-- 
2.39.5

