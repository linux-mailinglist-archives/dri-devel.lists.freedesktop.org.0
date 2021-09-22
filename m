Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9D2414463
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 11:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875C86EB19;
	Wed, 22 Sep 2021 09:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C1E6EB19;
 Wed, 22 Sep 2021 09:01:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="210630395"
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="210630395"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 02:01:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="436166242"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga003.jf.intel.com with ESMTP; 22 Sep 2021 02:01:17 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org, tiwai@suse.de
Cc: alsa-devel@alsa-project.org, jani.nikula@intel.com,
 Imre Deak <imre.deak@intel.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 "Rafael J . Wysocki" <rafael@kernel.org>, kai.vehmanen@linux.intel.com,
 intel-gfx@lists.freedesktop.org, Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH v2] component: do not leave master devres group open after bind
Date: Wed, 22 Sep 2021 11:54:32 +0300
Message-Id: <20210922085432.2776886-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.32.0
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

In current code, the devres group for aggregate master is left open
after call to component_master_add_*(). This leads to problems when the
master does further managed allocations on its own. When any
participating driver calls component_del(), this leads to immediate
release of resources.

This came up when investigating a page fault occurring with i915 DRM
driver unbind with 5.15-rc1 kernel. The following sequence occurs:

 i915_pci_remove()
   -> intel_display_driver_unregister()
     -> i915_audio_component_cleanup()
       -> component_del()
         -> component.c:take_down_master()
           -> hdac_component_master_unbind() [via master->ops->unbind()]
           -> devres_release_group(master->parent, NULL)

With older kernels this has not caused issues, but with audio driver
moving to use managed interfaces for more of its allocations, this no
longer works. Devres log shows following to occur:

component_master_add_with_match()
[  126.886032] snd_hda_intel 0000:00:1f.3: DEVRES ADD 00000000323ccdc5 devm_component_match_release (24 bytes)
[  126.886045] snd_hda_intel 0000:00:1f.3: DEVRES ADD 00000000865cdb29 grp< (0 bytes)
[  126.886049] snd_hda_intel 0000:00:1f.3: DEVRES ADD 000000001b480725 grp< (0 bytes)

audio driver completes its PCI probe()
[  126.892238] snd_hda_intel 0000:00:1f.3: DEVRES ADD 000000001b480725 pcim_iomap_release (48 bytes)

component_del() called() at DRM/i915 unbind()
[  137.579422] i915 0000:00:02.0: DEVRES REL 00000000ef44c293 grp< (0 bytes)
[  137.579445] snd_hda_intel 0000:00:1f.3: DEVRES REL 00000000865cdb29 grp< (0 bytes)
[  137.579458] snd_hda_intel 0000:00:1f.3: DEVRES REL 000000001b480725 pcim_iomap_release (48 bytes)

So the "devres_release_group(master->parent, NULL)" ends up freeing the
pcim_iomap allocation. Upon next runtime resume, the audio driver will
cause a page fault as the iomap alloc was released without the driver
knowing about it.

Fix this issue by using the "struct master" pointer as identifier for
the devres group, and by closing the devres group after
the master->ops->bind() call is done. This allows devres allocations
done by the driver acting as master to be isolated from the binding state
of the aggregate driver. This modifies the logic originally introduced in
commit 9e1ccb4a7700 ("drivers/base: fix devres handling for master device")

BugLink: https://gitlab.freedesktop.org/drm/intel/-/issues/4136
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Acked-by: Imre Deak <imre.deak@intel.com>
Acked-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/base/component.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

V2 changes:
 - after review form Imre and Russell, removing RFC tag
 - rebased on top of 5.15-rc2 (V1 was on drm-tip)
 - CI test results for V1 show that this patch fixes multiple
   failures in i915 unbind and module reload tests:
   https://patchwork.freedesktop.org/series/94889/

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 5e79299f6c3f..870485cbbb87 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -246,7 +246,7 @@ static int try_to_bring_up_master(struct master *master,
 		return 0;
 	}
 
-	if (!devres_open_group(master->parent, NULL, GFP_KERNEL))
+	if (!devres_open_group(master->parent, master, GFP_KERNEL))
 		return -ENOMEM;
 
 	/* Found all components */
@@ -258,6 +258,7 @@ static int try_to_bring_up_master(struct master *master,
 		return ret;
 	}
 
+	devres_close_group(master->parent, NULL);
 	master->bound = true;
 	return 1;
 }
@@ -282,7 +283,7 @@ static void take_down_master(struct master *master)
 {
 	if (master->bound) {
 		master->ops->unbind(master->parent);
-		devres_release_group(master->parent, NULL);
+		devres_release_group(master->parent, master);
 		master->bound = false;
 	}
 }

base-commit: e4e737bb5c170df6135a127739a9e6148ee3da82
-- 
2.32.0

