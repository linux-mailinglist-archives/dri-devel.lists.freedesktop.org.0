Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E56B5968092
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 09:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F40510E20F;
	Mon,  2 Sep 2024 07:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bvq28MGQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAF910E20D;
 Mon,  2 Sep 2024 07:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725262108; x=1756798108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+wO5HqrbLFYT+X9rzVWpbEm/Nyw/BPAJBa5eyV2vJLQ=;
 b=Bvq28MGQNIC2noiJMfd38VoZNYZEu3DU/sjDtAvCsszcttGtE61eMzY3
 yrd7gyLC9G5Oh8XuVHqco1v0W2+57sDT7RY9NsBOvdQUP/TOnZz0yh7bO
 dzHGILDX3pfty48NxMxdekBjucAa8cxGd2w5caatj/e72rq7UmZRjagSH
 lYm3EvexvXcr4dm+JyFSAU/A0s8u1JVKc2W5A6DtwyIW7p5+eAtiwyCnJ
 HhJ2IllW7vWhlJ+dEszAkMjt50qFNQ4V0LGEk5ZxvdhVuobS5R0lBI749
 uq4ahnB2wzQvC5TARr3aVxki81ccVqs/cGgUfw2XeoYfaq4AgyTMz6n5i w==;
X-CSE-ConnectionGUID: 9TKb0PtSQ3Sj9Bog4wf8Wg==
X-CSE-MsgGUID: v0jHiqW1TeKxJgkGkmj34Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23990659"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="23990659"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 00:28:27 -0700
X-CSE-ConnectionGUID: DwCcCb5OQbq7w1pH2smtTA==
X-CSE-MsgGUID: sggyGL2pSySF2gmVVPawFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="68922603"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by fmviesa005.fm.intel.com with ESMTP; 02 Sep 2024 00:28:22 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, bellekallu.rajkiran@intel.com,
 saikishore.konda@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 2/3] drm/xe: Use device wedged event
Date: Mon,  2 Sep 2024 13:18:58 +0530
Message-Id: <20240902074859.2992849-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240902074859.2992849-1-raag.jadav@intel.com>
References: <20240902074859.2992849-1-raag.jadav@intel.com>
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

From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

This was previously attempted as xe specific reset uevent but dropped
in commit 77a0d4d1cea2 ("drm/xe/uapi: Remove reset uevent for now")
as part of refactoring.

Now that we have device wedged event supported by DRM core, make use
of it. With this in place userspace will be notified of wedged device,
on the basis of which, userspace may take respective action to recover
the device.

$ udevadm monitor --property --kernel
monitor will print the received events for:
KERNEL - the kernel uevent

KERNEL[307.420340] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)
ACTION=change
DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0
SUBSYSTEM=drm
WEDGED=1
DEVNAME=/dev/dri/card0
DEVTYPE=drm_minor
SEQNUM=5106
MAJOR=226
MINOR=0

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Co-developed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1a0d7fdd094b..82b1583ada30 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -959,11 +959,12 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
  * xe_device_declare_wedged - Declare device wedged
  * @xe: xe device instance
  *
- * This is a final state that can only be cleared with a mudule
+ * This is a final state that can only be cleared with a module
  * re-probe (unbind + bind).
  * In this state every IOCTL will be blocked so the GT cannot be used.
  * In general it will be called upon any critical error such as gt reset
- * failure or guc loading failure.
+ * failure or guc loading failure. Userspace will be notified of this state
+ * by a DRM uevent.
  * If xe.wedged module parameter is set to 2, this function will be called
  * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
  * snapshot capture. In this mode, GT reset won't be attempted so the state of
@@ -993,6 +994,9 @@ void xe_device_declare_wedged(struct xe_device *xe)
 			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
 			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
 			dev_name(xe->drm.dev));
+
+		/* Notify userspace of wedged device */
+		drm_dev_wedged(&xe->drm);
 	}
 
 	for_each_gt(gt, xe, id)
-- 
2.34.1

