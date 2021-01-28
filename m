Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C54BE307728
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 14:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCBA6E976;
	Thu, 28 Jan 2021 13:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEFE6E966;
 Thu, 28 Jan 2021 13:31:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 445D5B11B;
 Thu, 28 Jan 2021 13:31:32 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, chris@chris-wilson.co.uk
Subject: [PATCH v6 4/5] drm/i915: Don't assign to struct drm_device.pdev
Date: Thu, 28 Jan 2021 14:31:26 +0100
Message-Id: <20210128133127.2311-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210128133127.2311-1-tzimmermann@suse.de>
References: <20210128133127.2311-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using struct drm_device.pdev is deprecated. Don't assign it. Users
should upcast from struct drm_device.dev.

v6:
	* also fix the assignment in selftests in this patch (Chris)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.c                  | 1 -
 drivers/gpu/drm/i915/selftests/mock_gem_device.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 700aeb923fcd..954ad590089c 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -787,7 +787,6 @@ i915_driver_create(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (IS_ERR(i915))
 		return i915;
 
-	i915->drm.pdev = pdev;
 	pci_set_drvdata(pdev, i915);
 
 	/* Device parameters start as a copy of module parameters. */
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index 0188f877cab2..2a07a008de2e 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -146,7 +146,6 @@ struct drm_i915_private *mock_gem_device(void)
 	}
 
 	pci_set_drvdata(pdev, i915);
-	i915->drm.pdev = pdev;
 
 	dev_pm_domain_set(&pdev->dev, &pm_domain);
 	pm_runtime_enable(&pdev->dev);
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
