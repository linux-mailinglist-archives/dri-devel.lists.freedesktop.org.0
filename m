Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CC26CAF3F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 21:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633A910E05A;
	Mon, 27 Mar 2023 19:56:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB61910E05A;
 Mon, 27 Mar 2023 19:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679946986; x=1711482986;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JwuIcvdTis/z43bJkLOFhBhmGEqPdL/+PeyI64r4v9k=;
 b=BOGrBTt7omLCyUVwCGnwUe24/aSoACYQkAqd+1/dcpTRchXLB86MsUv2
 V5Jnx2Rijkox4RJeZkGoBm9MHNFWUH1oWFl2GzWP3HBbAdXqi6Ijc8ClD
 axNHcljkAtMAasxmDi7Sy1A2tp4kuCfAdO1zVcBCrQUE+9cqOG6YlEC6g
 jNhhmQ/TlRwEl9LaLA2pIIoHaT9iyRU5fKOFetUHzqYk4NTkZTinqrnEc
 WHUWKPw9HO7wYR5eM6r4hjKbBGziCOfbww6YfPhDElHw/l1RpLmxPCl45
 dwim0pi/62IJgxqUG4fWBlGj3/l+kbnx483OM3cm9lcEdM13j6+PduiwP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="341950287"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="341950287"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 12:56:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="1013247327"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="1013247327"
Received: from mgaucher-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.63.207])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 12:56:23 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v3 0/2] Report MMIO communication problems more clearly
Date: Mon, 27 Mar 2023 21:55:45 +0200
Message-Id: <20230327195547.356584-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

just copy pasting Matt's original cover letter. Thank you Andrzej and
Jani for looking into this series.

We're periodically facing problems in CI where all registers read back
as 0xFFFFFFFF.  In general this is what happens when the CPU is unable
to communicate with a PCI device, so the transaction autocompletes with
all F's as a placeholder.  Sometimes the device will recover on its own,
sometimes it will never come back.

We already have some attempts to detect when this happens (e.g., when
checking FPGA_DBG), but let's add a couple more checks with descriptive
error messages to identify the problem in other cases:

 - When the device is first probed, we'll do an initial check of the GT
   forcewake register.  As a masked register, the upper bits should
   always come back as 0's if device access is behaving properly, so if
   we see all F's, we can conclude that the device is already in a bad
   state.  We'll wait two seconds to see if it recovers on its own, then
   give up on the device.

 - When we encounter a 'forcewake timed out while waiting for clear'
   error, we'll do one more read of the register to see if it's because
   we're just reading back all F's.  If so, we'll print a more
   meaningful message clarifying that it isn't the forcewake itself
   that's the problem, but rather communication with the device.

Note that this only captures the failure case where accessing the device
is problematic (resulting in registers giving all F's).  There's a
separate class of problems where the device is okay, but the GT inside
the device is busted and all GT registers read back as 0's (other
registers like sgunit registers are usually still readable).  This
series does not address that class of errors.

This is just a quick change to get some better CI error messages.  Some
ideas for future enhancements:

 - Try something to reset the device if we detect a problem at driver
   load (e.g., PCI FLR, toggling the PCI power state, etc.)?

 - Use something more standard like pci_read_config_dword() instead of a
   device register read to determine when we're not communicating
   properly?  Generally the PCI config space is also giving all F's at
   this point.

 - Also handle the "device OK, GT dead" case by finding some GT
   register(s) that should never be 0 on a functioning system.  Maybe
   one of the fuse registers would work for this?

Changelog
=========
v2 -> v3
 - Restored the previous change in V1 which was wrong.
 - A little cosmetic suggested by Andrzej in patch 2.
 - Added mine and Andrzej's r-b.
v1 -> v2
 - The sanity check can use intel_wait_for_register_fw().
   (Thanks, Jani)

Matt Roper (2):
  drm/i915: Sanitycheck MMIO access early in driver load
  drm/i915: Check for unreliable MMIO during forcewake

 drivers/gpu/drm/i915/intel_uncore.c | 47 +++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

-- 
2.39.2

