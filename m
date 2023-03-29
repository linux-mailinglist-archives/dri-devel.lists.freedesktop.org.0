Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E82E6CD726
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 12:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C86010EA50;
	Wed, 29 Mar 2023 10:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77F410EA50;
 Wed, 29 Mar 2023 10:00:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.101.196.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 9D3493F326; 
 Wed, 29 Mar 2023 10:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1680084032;
 bh=X736Xo2cMDDW60Y3vTbzigd2Xc6Dr2xSpP9bWqw8uGc=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=BofD7a6Vm5hTCXvD6Qwb7kJmA/nDRL7QMu2lsS9dynDzisMxrRiO/8CeNWiUhUkoE
 rJB19HbYNUdJxfYNmQKyUq4geowyOwQNQQPICNEX65CFUHDPSNHtdT71U5pHFjlBRf
 aOqXnJzD2CN/RS7Vy145g5BIL9Wj/yErU00fopXZ/QsHOaDXoROHJmjGZQGLsOJn1L
 HZtYQVctKfWrnslEL+jFO5sh0nnnX5eRrA6YBzvnJ/wRdsPLh5HVMKsmYwC5wr35+Z
 UXD+LP4o4mGVK7n0yA7ML5ChhCclQVzzBUz/uAnM8Wo3bmNSjHCFoMbC+gFUadGTW+
 Ea17loXeZ68Dw==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com
Subject: [PATCH 1/2] drm/amdgpu: Reset GPU on S0ix when device supports BOCO
Date: Wed, 29 Mar 2023 17:59:29 +0800
Message-Id: <20230329095933.1203559-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Jingyu Wang <jingyuwang_vip@163.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Guchun Chen <guchun.chen@amd.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 amd-gfx@lists.freedesktop.org, Jiansong Chen <Jiansong.Chen@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Tim Huang <tim.huang@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Evan Quan <evan.quan@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 linux-kernel@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the power is lost due to ACPI power resources being turned off, the
driver should reset the GPU so it can work anew.

First, _PR3 support of the hierarchy needs to be found correctly. Since
the GPU on some discrete GFX cards is behind a PCIe switch, checking the
_PR3 on downstream port alone is not enough, as the _PR3 can associate
to the root port above the PCIe switch.

Once the _PR3 is found and BOCO support is correctly marked, use that
information to inform the GPU should be reset. This solves an issue that
system freeze on a Intel ADL desktop that uses S0ix for sleep and D3cold
is supported for the GFX slot.

Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2458
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c   |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  7 ++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 12 +++++-------
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 60b1857f469e..407456ac0e84 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -987,6 +987,9 @@ bool amdgpu_acpi_should_gpu_reset(struct amdgpu_device *adev)
 	if (amdgpu_sriov_vf(adev))
 		return false;
 
+	if (amdgpu_device_supports_boco(adev_to_drm(adev)))
+		return true;
+
 #if IS_ENABLED(CONFIG_SUSPEND)
 	return pm_suspend_target_state != PM_SUSPEND_TO_IDLE;
 #else
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index f5658359ff5c..d56b7a2bafa6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2181,7 +2181,12 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
 
 	if (!(adev->flags & AMD_IS_APU)) {
 		parent = pci_upstream_bridge(adev->pdev);
-		adev->has_pr3 = parent ? pci_pr3_present(parent) : false;
+		do {
+			if (pci_pr3_present(parent)) {
+				adev->has_pr3 = true;
+				break;
+			}
+		} while ((parent = pci_upstream_bridge(parent)));
 	}
 
 	amdgpu_amdkfd_device_probe(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index ba5def374368..5d81fcac4b0a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2415,10 +2415,11 @@ static int amdgpu_pmops_suspend(struct device *dev)
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(drm_dev);
 
-	if (amdgpu_acpi_is_s0ix_active(adev))
-		adev->in_s0ix = true;
-	else if (amdgpu_acpi_is_s3_active(adev))
+	if (amdgpu_acpi_is_s3_active(adev) ||
+	    amdgpu_device_supports_boco(drm_dev))
 		adev->in_s3 = true;
+	else if (amdgpu_acpi_is_s0ix_active(adev))
+		adev->in_s0ix = true;
 	if (!adev->in_s0ix && !adev->in_s3)
 		return 0;
 	return amdgpu_device_suspend(drm_dev, true);
@@ -2449,10 +2450,7 @@ static int amdgpu_pmops_resume(struct device *dev)
 		adev->no_hw_access = true;
 
 	r = amdgpu_device_resume(drm_dev, true);
-	if (amdgpu_acpi_is_s0ix_active(adev))
-		adev->in_s0ix = false;
-	else
-		adev->in_s3 = false;
+	adev->in_s0ix = adev->in_s3 = false;
 	return r;
 }
 
-- 
2.34.1

