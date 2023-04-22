Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ECD6EB724
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 05:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341BF10E1D0;
	Sat, 22 Apr 2023 03:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFEF10E13A;
 Sat, 22 Apr 2023 03:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682134876; x=1713670876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u1V3I4g4/RL1jC5wGiMlp8qaVQkq8ixVzQwoyYdlIlk=;
 b=hHUPLHYdS8cKd7EpV3UxqNOikvhm9xUGyiWQJPzy5MVikGIdSgqVtAm0
 ShoBjuVhs7wZrtnzUEMLHGTBnsf218FoE8TYItUUodS8h2vV4GUcq7M00
 6P2AfERxXVRckW5zVURRsHjWIQjZBsrLZdfIHNItTdYjVlL8+FC2VyyBk
 InM0t1dDnpir80Ez3vEo0PKH5q1UYF7F/8W5H+OnOBRgRlrL2lJPdArW0
 C8mGLT6KBEmtR0+BtWPHDVy4Lc78vbtu+B4LYd4RwQQBbcT2P0b3xWYgL
 rDyKMAdDx5BKf98xDSJY22XIkRp7kBrI6CZMTss3L7yz3iQ/M6jUIYu3K g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="344874142"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="344874142"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 20:41:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="781805201"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="781805201"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 20:41:15 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/i915: Add support for MTL GSC SW Proxy
Date: Fri, 21 Apr 2023 20:40:57 -0700
Message-Id: <20230422034101.3922290-1-daniele.ceraolospurio@intel.com>
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
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c  | 424 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h  |  18 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c     |  66 ++-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h     |  17 +-
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |   1 +
 drivers/misc/mei/Kconfig                      |   2 +-
 drivers/misc/mei/Makefile                     |   1 +
 drivers/misc/mei/gsc_proxy/Kconfig            |  14 +
 drivers/misc/mei/gsc_proxy/Makefile           |   7 +
 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c    | 208 +++++++++
 include/drm/i915_component.h                  |   3 +-
 include/drm/i915_gsc_proxy_mei_interface.h    |  53 +++
 15 files changed, 830 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h
 create mode 100644 drivers/misc/mei/gsc_proxy/Kconfig
 create mode 100644 drivers/misc/mei/gsc_proxy/Makefile
 create mode 100644 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
 create mode 100644 include/drm/i915_gsc_proxy_mei_interface.h

-- 
2.40.0

