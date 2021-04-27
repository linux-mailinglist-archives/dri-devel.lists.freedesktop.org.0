Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FB436C4B8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 13:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85AA6E288;
	Tue, 27 Apr 2021 11:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0D76E079;
 Tue, 27 Apr 2021 11:14:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 377AAB175;
 Tue, 27 Apr 2021 11:14:24 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 chris@chris-wilson.co.uk
Subject: [PATCH v7 0/4] drm: Move struct drm_device.pdev to legacy
Date: Tue, 27 Apr 2021 13:14:17 +0200
Message-Id: <20210427111421.2386-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
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
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V7 of the patchset fixes some bitrot in the intel driver.

The pdev field in struct drm_device points to a PCI device structure and
goes back to UMS-only days when all DRM drivers were for PCI devices.
Meanwhile we also support USB, SPI and platform devices. Each of those
uses the generic device stored in struct drm_device.dev.

To reduce duplication and remove the special case of PCI, this patchset
converts all modesetting drivers from pdev to dev and makes pdev a field
for legacy UMS drivers.

For PCI devices, the pointer in struct drm_device.dev can be upcasted to
struct pci_device; or tested for PCI with dev_is_pci(). In several places
the code can use the dev field directly.

After converting all drivers and the DRM core, the pdev fields becomes
only relevant for legacy drivers. In a later patchset, we may want to
convert these as well and remove pdev entirely.

v7:
	* fix instances of pdev that have benn added under i915/
v6:
	* also remove assignment in i915/selftests in later patch (Chris)
v5:
	* remove assignment in later patch (Chris)
v4:
	* merged several patches
	* moved core changes into separate patch
	* vmwgfx build fix
v3:
	* merged several patches
	* fix one pdev reference in nouveau (Jeremy)
	* rebases
v2:
	* move whitespace fixes into separate patches (Alex, Sam)
	* move i915 gt/ and gvt/ changes into separate patches (Joonas)

Thomas Zimmermann (4):
  drm/i915/gt: Remove reference to struct drm_device.pdev
  drm/i915: Remove reference to struct drm_device.pdev
  drm/i915: Don't assign to struct drm_device.pdev
  drm: Move struct drm_device.pdev to legacy section

 drivers/gpu/drm/i915/gt/intel_region_lmem.c      | 2 +-
 drivers/gpu/drm/i915/i915_drv.c                  | 1 -
 drivers/gpu/drm/i915/intel_runtime_pm.h          | 2 +-
 drivers/gpu/drm/i915/selftests/mock_gem_device.c | 1 -
 include/drm/drm_device.h                         | 6 +++---
 5 files changed, 5 insertions(+), 7 deletions(-)

--
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
