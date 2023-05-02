Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3626F4873
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 18:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5F710E00D;
	Tue,  2 May 2023 16:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5607010E00D;
 Tue,  2 May 2023 16:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683045556; x=1714581556;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0rcgYpF2GM68m7oRNyKVxovaNtAsw04tCPIPS+wk+gs=;
 b=FV35pO/W4whZx/td4puMCX9FMyPIotfU6qgjM6oKuXRbKTh2YUvJ6Ajm
 dsQbVko6KgFlgFxcgYGTV+SqKu9MK9CTTQYkWwzb1mwuBs/HgcaMAeY0f
 e8Kkd3ntdpEsAW+ld29rV1GEc/JV8CCvRewyymRagO3uGBYThdJYquoIx
 WXJubKyK7/4TJu098TgKxP8P0nkOLJXSHNcXnGa5AmV5r2WQsxaNJdDYp
 ScS6cN34+cYgdsWRPnBmBy9/6fHfw5ZJah2qBknya1owDl4Pz+lDr7GRA
 JbhFk4Xns47gn/gc5sInGH27MUfjxeT9ovU+wt3LjKuBuZw15IZzXHjWU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="411595938"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="411595938"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 09:39:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="1026160903"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="1026160903"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 09:39:04 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/4] drm/i915: Add support for MTL GSC SW Proxy
Date: Tue,  2 May 2023 09:38:50 -0700
Message-Id: <20230502163854.317653-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
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
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On platforms where the GSC is part of GT, it needs to communicate with
CSME for some of its operations. However, there is no direct HW
communication channel, so the i915 and mei drivers must carry the
messages back and forth between the 2 units. The protocol is fully
described in the i915 patch that adds the initial support, but it
basically amounts to SW blindly moving messages back and forth until the
GSC tells us to stop.

Implementing this features requires a new mei component to handle
the mei side of things. The patches for this have already been
reviewed on the char-misc ML and we already have an ack from Greg to
merge them via the drm tree [1].

v2: small fixes, better docs, code cleanup

v3: add extra check on proxy status after the init flow is done, address
    checkpatch issues

[1] https://lore.kernel.org/lkml/20230208142358.1401618-1-tomas.winkler@intel.com/t/
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Alexander Usyskin (2):
  drm/i915/mtl: Define GSC Proxy component interface
  mei: gsc_proxy: add gsc proxy driver

Daniele Ceraolo Spurio (2):
  drm/i915/gsc: add initial support for GSC proxy
  drm/i915/gsc: add support for GSC proxy interrupt

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  22 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c     |  10 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h     |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c  | 425 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h  |  18 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c     |  76 +++-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h     |  17 +-
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |   1 +
 drivers/misc/mei/Kconfig                      |   2 +-
 drivers/misc/mei/Makefile                     |   1 +
 drivers/misc/mei/gsc_proxy/Kconfig            |  14 +
 drivers/misc/mei/gsc_proxy/Makefile           |   7 +
 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c    | 208 +++++++++
 include/drm/i915_component.h                  |   3 +-
 include/drm/i915_gsc_proxy_mei_interface.h    |  53 +++
 17 files changed, 852 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h
 create mode 100644 drivers/misc/mei/gsc_proxy/Kconfig
 create mode 100644 drivers/misc/mei/gsc_proxy/Makefile
 create mode 100644 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
 create mode 100644 include/drm/i915_gsc_proxy_mei_interface.h

-- 
2.40.0

