Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FBE7130C1
	for <lists+dri-devel@lfdr.de>; Sat, 27 May 2023 01:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114D910E201;
	Fri, 26 May 2023 23:55:21 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9D310E0EE;
 Fri, 26 May 2023 23:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685145296; x=1716681296;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gsB4GFU82aNS83OLCrGEgiRDANTxFJCz47CcEbyV+6E=;
 b=M/qgk9fDLXtbWGbeQSeLNP4WpGORZ49MoqtBxFQ1pz4mdWScuBb6Klpf
 Cx8rG7sCwrhJ1vuMqxwSFmwuLx1e45NRNFny1YkRPrx5kRtpzw1F3/wKA
 chU4qhotSNd/F9ofs6u8AhHy1j9FNR2mIshcjZtkyWgdqsQQ65imHDmaA
 Gn6yXsd+Y+sjvzPpng78cZxXZMXeD40H1/hL/sWXJNB/HGuxNiNYpSQrW
 9txDDrq+7QaW8juGoT2cgxvaNaNAZFm7JtMuoprgJEuigPkhTD1dwz9T1
 vWD5L3yid56IbAYHjj/x5xsMTR0+mHl8PQt5o+OqzW2XqT5T/AcRt1LIi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356716168"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="356716168"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 16:54:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="829667547"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="829667547"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga004.jf.intel.com with ESMTP; 26 May 2023 16:54:55 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/3] Use FAST_REQUEST mechanism for non-blocking H2G calls
Date: Fri, 26 May 2023 16:55:35 -0700
Message-Id: <20230526235538.2230780-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The GuC interface supports a mechanism for returning errors against
non-blocking H2G calls. This is called FAST_REQUEST. Given that the
call is asynchronous, matching the returned error up is difficult.
However, getting any error at all back is better than no error.

If any such errors are reported, then extra tracking support can be
compiled in for manual debug.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


Michal Wajdeczko (3):
  drm/i915/guc: Use FAST_REQUEST for non-blocking H2G calls
  drm/i915/guc: Update log for unsolicited CTB response
  drm/i915/guc: Track all sent actions to GuC

 drivers/gpu/drm/i915/Kconfig.debug            |  1 +
 .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h | 30 +++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 79 ++++++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     | 11 +++
 4 files changed, 112 insertions(+), 9 deletions(-)

-- 
2.39.1

