Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7DC6CEFFB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 18:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F82110EB9D;
	Wed, 29 Mar 2023 16:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF1110EB96;
 Wed, 29 Mar 2023 16:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680109040; x=1711645040;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LYQGKB7ioYIZ0COy0yci0B1raLxKOkGihJwp+XYqwLk=;
 b=gaJqUqsJUqdWQ5bsfFjsODPLA6NMqItZB5LGV5dh9/Py1OtbwxJTcuAP
 PTjZemEN5+j0xRpHJhP9OmreC0qkmPXkDVFHGhpvobdgmp2M6ulhsfZph
 piv17LRqGfYP2VX29KBf8NFQ87IzQtqVVJs3VaHbZrGhzSjHoLsV6lgCm
 nbPEOVOE0NlTFgeEnkmQ7TPxGeaeIkiJ/oj3xLYNCOYFzLw2UYcN/Bpee
 zrtt8HI+BCbPl3M7pAdNKbQY7pqtYfjRpsFYW7tVT/x5YKJgQD8/BHoiM
 kY7txegchpV0TNThzhETOpckpnd+VVxKsQnMDhWP0kFtJ+6iwkcLuMI9b w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="342543319"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="342543319"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 09:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="748843580"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="748843580"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 09:57:14 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/4] drm/i915: Add support for MTL GSC SW Proxy
Date: Wed, 29 Mar 2023 09:56:54 -0700
Message-Id: <20230329165658.2686549-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: suraj.kandpal@intel.com, alan.previn.teres.alexis@intel.com,
 gregkh@linuxfoundation.org, alexander.usyskin@intel.com,
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
 include/drm/i915_gsc_proxy_mei_interface.h    |  36 ++
 15 files changed, 813 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h
 create mode 100644 drivers/misc/mei/gsc_proxy/Kconfig
 create mode 100644 drivers/misc/mei/gsc_proxy/Makefile
 create mode 100644 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
 create mode 100644 include/drm/i915_gsc_proxy_mei_interface.h

-- 
2.37.3

