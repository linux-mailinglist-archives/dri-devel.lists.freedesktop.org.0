Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F2A956954
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 13:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396D310E243;
	Mon, 19 Aug 2024 11:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F6J79/iT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2150B10E241;
 Mon, 19 Aug 2024 11:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724067110; x=1755603110;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E55Q8rkoxkKXqmmuaayCij8jSVWsSlcpnpstiMukGPs=;
 b=F6J79/iTj8uDEy7QiqK0BZs1x3H+kfIXrQYmQRB+v/vlkcbCM9O3uDu+
 IaEZ68UaC4kxYi50YPUUazrW+Ht6y9JqfBmTTKZzGWj+F9osU13M7bgPP
 Z0f1VG31MFN3aa663fZ7SNJgajpIIxQ1o8Veny/Cy3orRneeCdEcZNl/b
 x1siFFTNuLOdKd/i2ad998pYH8qjr36HPUbO+4FlpKfKtE3O0RGHRBx0X
 +ux/1ZeTW5/89Ugec40P55CC2sOFc8PGEiCfRPksbiJm7PmymdBg16+AF
 txXECyxA9qPad+UcLCOqkYzDY+8OOnDSr5yh3telmn9MmhMiVwH6N4bA0 g==;
X-CSE-ConnectionGUID: pm9+AC0ARmun/lzD4qDEQg==
X-CSE-MsgGUID: 6ijsvIa6SBCfpNz609wYPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="26174690"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="26174690"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 04:31:50 -0700
X-CSE-ConnectionGUID: Wy+5iHvvQxu0qVRAgdzI6g==
X-CSE-MsgGUID: TURgVM1NRye/CSdwx4Ot1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="65303851"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.73])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 04:31:48 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH] drm/i915/gt: Continue creating engine sysfs files even after
 a failure
Date: Mon, 19 Aug 2024 13:31:40 +0200
Message-ID: <20240819113140.325235-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

The i915 driver generates sysfs entries for each engine of the
GPU in /sys/class/drm/cardX/engines/.

The process is straightforward: we loop over the UABI engines and
for each one, we:

 - Create the object.
 - Create basic files.
 - If the engine supports timeslicing, create timeslice duration files.
 - If the engine supports preemption, create preemption-related files.
 - Create default value files.

Currently, if any of these steps fail, the process stops, and no
further sysfs files are created.

However, it's not necessary to stop the process on failure.
Instead, we can continue creating the remaining sysfs files for
the other engines. Even if some files fail to be created, the
list of engines can still be retrieved by querying i915.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
Hi,

It might make sense to create an "inv-<engine_name>" if something
goes wrong, so that the user is aware that the engine exists, but
the sysfs file is not present.

One further improvement would be to provide more information
about thei failure reason the dev_warn() message.

Andi

 drivers/gpu/drm/i915/gt/sysfs_engines.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
index 021f51d9b456..aab2759067d2 100644
--- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
+++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
@@ -530,9 +530,8 @@ void intel_engines_add_sysfs(struct drm_i915_private *i915)
 err_object:
 			kobject_put(kobj);
 err_engine:
-			dev_err(kdev, "Failed to add sysfs engine '%s'\n",
-				engine->name);
-			break;
+			dev_warn(kdev, "Failed to add sysfs engine '%s'\n",
+				 engine->name);
 		}
 	}
 }
-- 
2.45.2

