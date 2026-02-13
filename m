Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIibDvBBj2k5OgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 16:23:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 736A71377D5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 16:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA1910E167;
	Fri, 13 Feb 2026 15:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7Kn7MMi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F7B10E167;
 Fri, 13 Feb 2026 15:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770996203; x=1802532203;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8df47b+Pe8iIVaO6Wm1IbNvFVg1481cA/0QReTKAO/c=;
 b=P7Kn7MMiVXxf13gN8FriibUHHnDEa0QDDzVGotQJmGf1aWYyqEA6TTrF
 jg7UEPA5AXRGTlBdT+GP2fjtBtGNFmwlkMZY2S7i/lsEUvwCC2VOMckTw
 UwTM8mq9QcCMYbGT1pg62/Bpqj5J+31Q6vOqSlhNXvP7bbz3swb6Kv5Vc
 jLLIriwI8T/su+ObKOIdhwcSDARB9tSzBwZzXXUILqyovhKOgjabSlF5r
 aQyiTAUn/BtqCQobtcBPR1sEBttClN/azTptbt5CHgAZ1Em9jCE57v80E
 X6IwYXn1nJ1Y0LfHsNgzmNGIjzgn+NF/gDxxIYiQtWGNeYKgcYRDM1y+1 Q==;
X-CSE-ConnectionGUID: UMNbW72ITBmisIH6DSMq5A==
X-CSE-MsgGUID: W9OeXU2DQzyIb9iJ+tFfgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72252830"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72252830"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 07:23:23 -0800
X-CSE-ConnectionGUID: Bqzg9c39Tk2xPaqSJtNe9w==
X-CSE-MsgGUID: qILqHTKVSHq4unhIz6fSlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="217482909"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 kkoning-desktop.intel.com) ([10.245.244.64])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 07:23:21 -0800
From: Koen Koning <koen.koning@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Koen Koning <koen.koning@linux.intel.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 intel-xe@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH] gpu: Fix uninitialized buddy for built-in drivers
Date: Fri, 13 Feb 2026 16:20:47 +0100
Message-ID: <20260213152047.179628-1-koen.koning@linux.intel.com>
X-Mailer: git-send-email 2.48.1
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[koen.koning@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 736A71377D5
X-Rspamd-Action: no action

Move buddy to the start of the link order, so its __init runs before any
other built-in drivers that may depend on it. Otherwise, a built-in
driver that tries to use the buddy allocator will run into a kernel NULL
pointer dereference because slab_blocks is uninitialized.

Specifically, this fixes drm/xe (as built-in) running into a kernel
panic during boot, because it uses buddy during device probe.

Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part two)")
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: intel-xe@lists.freedesktop.org
Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Signed-off-by: Koen Koning <koen.koning@linux.intel.com>
---
 drivers/gpu/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
index 5cd54d06e262..b4e5e338efa2 100644
--- a/drivers/gpu/Makefile
+++ b/drivers/gpu/Makefile
@@ -2,8 +2,9 @@
 # drm/tegra depends on host1x, so if both drivers are built-in care must be
 # taken to initialize them in the correct order. Link order is the only way
 # to ensure this currently.
+# Similarly, buddy must come first since it is used by other drivers.
+obj-$(CONFIG_GPU_BUDDY)	+= buddy.o
 obj-y			+= host1x/ drm/ vga/ tests/
 obj-$(CONFIG_IMX_IPUV3_CORE)	+= ipu-v3/
 obj-$(CONFIG_TRACE_GPU_MEM)		+= trace/
 obj-$(CONFIG_NOVA_CORE)		+= nova-core/
-obj-$(CONFIG_GPU_BUDDY)		+= buddy.o
-- 
2.48.1

