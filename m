Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2426DA5C6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 00:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C1710ED59;
	Thu,  6 Apr 2023 22:26:48 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FFE10EA51;
 Thu,  6 Apr 2023 22:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680820003; x=1712356003;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=srxFWQf7u23zMipmJ2f1gQGAmt+BR9Uxv6PgNuAwM2M=;
 b=VO7tR0jTZmtw6YzHql08Drw0D7yzyjsmAjV4hR3uc3WdBxFIrlHE4Dpo
 7YdkV5VYZSt617AMt/7VQDKPHX21B9X6dNzFCFz/Hl+jNla2FHyAF7UxD
 N0+86XXtWtH8VbKCPFsleNR0Jp6/uWMIEhvlz7PCeQo3E+SGWHVOFNsV5
 CRmHux2Jq0YnW9AkreH0SzVMsww7nbxPDZyeq6A6PC65nI3FIgDdKBZuQ
 arpuIsc0XJ2GEpK2jFu4uI7gz65iL8S6J1Q8jWNTnrYgFZNQNRqaYFflQ
 uOFHqUAgrWyssZS0YsGfOov+XXR3vexZ4TzJ6gPW6ttp36VUlrhWsNTH2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="341604978"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="341604978"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 15:26:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="776635887"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="776635887"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Apr 2023 15:26:42 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/5] Improvements to GuC error capture list processing
Date: Thu,  6 Apr 2023 15:26:12 -0700
Message-Id: <20230406222617.790484-1-John.C.Harrison@Intel.com>
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

The GuC error capture list creation was including Gen8 registers on Xe
platforms. While fixing that, it was noticed that there were other
issues. The platform naming was wrong, the naming of lists was
misleading, the steered register code was duplicated and steered
registers were not included on all supported platforms.

NB: The changes are being sent as multiple patches to make code review
simpler. However, before merging it may be better to squash into a
single patch, especially if it going to be sent with a 'fixes' tag.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (5):
  drm/i915/guc: Don't capture Gen8 regs on Xe devices
  drm/i915/guc: Capture list clean up - 1
  drm/i915/guc: Capture list clean up - 2
  drm/i915/guc: Capture list clean up - 3
  drm/i915/guc: Capture list clean up - 4

 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 199 +++++++-----------
 1 file changed, 73 insertions(+), 126 deletions(-)

-- 
2.39.1

