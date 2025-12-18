Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8859ECCD924
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 21:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A69410E054;
	Thu, 18 Dec 2025 20:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h0kKjdwA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78F710E054;
 Thu, 18 Dec 2025 20:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766091123; x=1797627123;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2XZdUtKR6MvONlRmAqwV3O6fAvfiIt4dTsRHLf3lBEs=;
 b=h0kKjdwAWxMIcCcOp4DM3Ea/0MK20eOb/0VFSnhKoXLrHeuatZ8/jhIh
 5tCxL7/aXkBmdFt/AA7vEwoboGPRPRhyDIovbE6TFb2/ZQI6Tn1CeHOR9
 6vomkkVba8E44jum0XpI7l7OMtbZLOaSsBoUa26Y+16usUGiJQsL6NRYe
 Bp/+H4M5A4BdcjCE0vnPFSxmZSoCIWSM5PAHEHK6NjC6txGKUS7+Y5K09
 Dqv8puyYdntiZq3f/pmuc5E1HchTlONaW6R0sPmyPcDHHrjPCnZ3QMN6O
 6t3aQVbMe49GTeqIKmtGMMi9bba97IsSShKY3k5LapbyYuDU6eUHYjaYI A==;
X-CSE-ConnectionGUID: /zAiixsXTbqNWqWzPmulIg==
X-CSE-MsgGUID: ipYZi4OaRiSKBh2OZhHtSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71904921"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="71904921"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 12:52:02 -0800
X-CSE-ConnectionGUID: oovG9KqhSQmpE0t3DfRTAQ==
X-CSE-MsgGUID: Xyis932jQZyEx5a3EmntDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="197834403"
Received: from mrbroom-desk1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 12:51:59 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
Subject: [PATCH] vfio/xe: Add default handler for .get_region_info_caps
Date: Thu, 18 Dec 2025 21:51:06 +0100
Message-ID: <20251218205106.4578-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

New requirement for the vfio drivers was added by the commit
f97859503859 ("vfio: Require drivers to implement get_region_info")
followed by commit 1b0ecb5baf4a ("vfio/pci: Convert all PCI drivers
to get_region_info_caps") that was missed by the new vfio/xe driver.

Add handler for .get_region_info_caps to avoid -EINVAL errors.

Fixes: 2e38c50ae492 ("vfio/xe: Add device specific vfio_pci driver variant for Intel graphics")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Alex Williamson <alex@shazbot.org>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: kvm@vger.kernel.org
---
 drivers/vfio/pci/xe/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/vfio/pci/xe/main.c b/drivers/vfio/pci/xe/main.c
index 0156b53c678b..719ab4660085 100644
--- a/drivers/vfio/pci/xe/main.c
+++ b/drivers/vfio/pci/xe/main.c
@@ -504,6 +504,7 @@ static const struct vfio_device_ops xe_vfio_pci_ops = {
 	.open_device = xe_vfio_pci_open_device,
 	.close_device = xe_vfio_pci_close_device,
 	.ioctl = vfio_pci_core_ioctl,
+	.get_region_info_caps = vfio_pci_ioctl_get_region_info,
 	.device_feature = vfio_pci_core_ioctl_feature,
 	.read = vfio_pci_core_read,
 	.write = vfio_pci_core_write,
-- 
2.47.1

