Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C49119D80
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 23:39:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF786E9AE;
	Tue, 10 Dec 2019 22:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C846E9AE;
 Tue, 10 Dec 2019 22:38:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 14:31:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; d="scan'208";a="238326484"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.54.75.49])
 by fmsmga004.fm.intel.com with ESMTP; 10 Dec 2019 14:31:29 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] DRM and i915 fixes to handle hotplug/unplug for 8K tiled
 displays
Date: Tue, 10 Dec 2019 14:32:33 -0800
Message-Id: <20191210223238.12022-1-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
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
Cc: Manasi Navare <manasi.d.navare@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With these patches now DRM and i915 gracefully handles hotplugging and unplugging
of either the master or slave connectors in case of tiled displays.

These patches ensure proper handling of just 1 tile connected and also fixes
the teardown (disable sequence)

Case1: Boot with single port connected
drm/ fbcon fallsback to the next lower non tiled mode
Case2: Now hotplug second port
Here if fbcon has been already resized to lower mode we cannot change
the fbcon size and it still displays lower non tiled mode
Case3: With both ports connected
Here it displays the full 8K tiled mode
Case4: Unplug master/slave:
It does a full modeset and displays next lower mode
Case5: Hotplug second port back in:
It now does a full modeset again to display full 8K


Manasi Navare (5):
  drm: Handle connector tile support only for modes that match tile size
  drm/fbdev: Fallback to non tiled mode if all tiles not present
  drm/i915/dp: Make sure all tiled connectors get added to the state
    with full modeset
  drm/i915/dp: Make port sync mode assignments only if all tiles present
  drm/i915/dp: Disable Port sync mode correctly on teardown

 drivers/gpu/drm/drm_client_modeset.c         |  72 ++++++++++++
 drivers/gpu/drm/drm_fb_helper.c              |   4 +-
 drivers/gpu/drm/i915/display/intel_display.c | 109 ++++++++++++++++++-
 3 files changed, 181 insertions(+), 4 deletions(-)

-- 
2.19.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
