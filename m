Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5A76C2281
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 21:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5094710E651;
	Mon, 20 Mar 2023 20:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048B610E651;
 Mon, 20 Mar 2023 20:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679343840; x=1710879840;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kor6FUe7yW9Jgnnva/IOrozgEZjepmC3kYrsWZKom8w=;
 b=NJyd+xI8E2eb9KRNxv53WdadWHKG6ls3BI1mpx+/Uw2ZmP6oN+PAopWN
 SCM5aCsmkysAQJM8moqdQb0wvEXgXi90A26sJloPmkkzOvQfbBe36Swik
 UHFFekofgCtAB+4tHydKisZr981oYGIaeQtFS+O++rDzs8HoAvyr6Zgbv
 qeVkIsTOYExWO/9MZCqAcaXB4Rd+nBu0Az3BXtUNr4lRDTBeMJaqLY4dU
 Z2keU3IDTso2dCDSBAxRgpS1eNUEn728CYlM13pJ/j3HoDiVhuhEcWDMj
 lGQIV+A/9EB646avdo1dF+LITS43niTm466tCM7c9S0IgQ6Hjt09B53WE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="403642658"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="403642658"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 13:23:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="824629084"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="824629084"
Received: from ivolodix-mobl.ccr.corp.intel.com (HELO intel.com)
 ([10.252.62.92])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 13:23:56 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 0/2] Report MMIO communication problems more clearly
Date: Mon, 20 Mar 2023 21:23:24 +0100
Message-Id: <20230320202326.296498-1-andi.shyti@linux.intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

just copy pasting Matt's original cover letter:

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

Matt Roper (2):
  drm/i915: Sanitycheck MMIO access early in driver load
  drm/i915: Check for unreliable MMIO during forcewake

 drivers/gpu/drm/i915/intel_uncore.c | 46 +++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 3 deletions(-)

-- 
2.39.2

