Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAC2BB0B15
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 16:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5335A10E237;
	Wed,  1 Oct 2025 14:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZluyBdbW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4D610E098;
 Wed,  1 Oct 2025 14:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759328628; x=1790864628;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/EcpuRkT2Y0X0XRx1wNXTkifWhNqltm3EYNBGuz+fUA=;
 b=ZluyBdbWoy4TjSPKLlmB7omq5FsyIEqQ02yXWmaOzjnO4/u1sXC9Uqn/
 pNM38VM4k+edjN15dDN6dUEZEbqxx/zarBcKO4Hdi+MLFrLxcWHfoJb9v
 pUHZu0REBA3FHhg8ml6ruiSvoU9fXeuqj/GZzpCESuZyinZQWfx/mEX0S
 h3gHlF1dif9FcrApiTLap8lC4AgO9C0wxUEGdTxMa+HSnIuclvHBfdLlj
 QqOFHa3qtkxXtcKnXeAaWCiBH+l1tJQjklmkz/yKc51z1kT/ljmDOqlmg
 NLJqPdJjcvbZxdhiRqBstDyzapGSMZlfO3B7K9EijaV9ShomB1kTFxku5 w==;
X-CSE-ConnectionGUID: bBbdCpaxTDaFcaLAUcdrUw==
X-CSE-MsgGUID: P9zEQQ6bTL+uaRPSmmR8DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="84223847"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="84223847"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 07:23:47 -0700
X-CSE-ConnectionGUID: JYxgi8tFSX6nm4X1Gc0fyQ==
X-CSE-MsgGUID: XcVxpCDpRiOQeMhnUqZ5Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="177928556"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.116])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 07:23:45 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>
Subject: [PATCH v2] drm/i915/gvt: Propagate
 vfio_set_irqs_validate_and_prepare() error
Date: Wed,  1 Oct 2025 16:23:36 +0200
Message-ID: <20251001142336.82089-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.2
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

Return the actual error code from vfio_set_irqs_validate_and_prepare()
instead of always collapsing to -EINVAL. While the helper
currently returns -EINVAL in most cases, passing through the real
error code is more future-proof.

While at it, drop the stray 'intel:' prefix from the error
message.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Zhenyu Wang <zhenyuw.linux@gmail.com>
Link: https://lore.kernel.org/r/20250926000252.3681360-1-andi.shyti@kernel.org
---
Hi,

I'm resending the patch because the first version had some
dependencies that CI didn't build yet.

In the meantime I'm updating the tag section. Thanks Zhenyu for
your review.

Andi

v1-v2: Add Zhenyu's r-b

 drivers/gpu/drm/i915/gvt/kvmgt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 183128b84630..c43b47687838 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1369,8 +1369,8 @@ static long intel_vgpu_ioctl(struct vfio_device *vfio_dev, unsigned int cmd,
 			ret = vfio_set_irqs_validate_and_prepare(&hdr, max,
 						VFIO_PCI_NUM_IRQS, &data_size);
 			if (ret) {
-				gvt_vgpu_err("intel:vfio_set_irqs_validate_and_prepare failed\n");
-				return -EINVAL;
+				gvt_vgpu_err("vfio_set_irqs_validate_and_prepare failed\n");
+				return ret;
 			}
 
 			data = memdup_user((void __user *)(arg + minsz),
-- 
2.47.2

