Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F769D8D95
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 21:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0125D10E16B;
	Mon, 25 Nov 2024 20:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mEN9TISR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B9110E16B;
 Mon, 25 Nov 2024 20:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732567958; x=1764103958;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zu8/0gE/+Cn/Nuym/gRVqpRIV7xxnKHleuWWWtjv7SM=;
 b=mEN9TISRqrOf11Wb60RYe2CxD0ag9Ovt6TPCg3VlvQfHpRElf4AkHbdv
 fBeerN9o1Vc1ZlyJqG+K9s51pWbjpcwSeJtTr9Bq4U8et7DtIOY5mX592
 jst+loO8IvGBkjEm2vPNXi3H67yLHseb55uduAAbY2i5sVIKJ1yCnMxF1
 UAbADJI2V7nCMkjfiAqoK7rpnS4AANTh8+qE0YKT6e6u9pNG0Hf6ezRfQ
 6Pktt1Ab5H9bsWSJffdIRvtxvVhapXTYrH4W8hBmjSJQ+RPGZFnorySmj
 nDlvERb/xfjp18F9SAaXGO6uz+TJC6HkslNyqFLi/zeNa0jbcfShzG0Ao Q==;
X-CSE-ConnectionGUID: 4FVUa/NVRdeZAcXjatMA3Q==
X-CSE-MsgGUID: 3z3jmUqQRm+NB5uGPcLXoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="43765843"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="43765843"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 12:52:37 -0800
X-CSE-ConnectionGUID: xwEHAGSNTLOBI2sqv0mQKg==
X-CSE-MsgGUID: fMRjBAENQqW6xV6+heHEEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="91721036"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 12:52:36 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH] drm/dp_mst: Fix MST sideband message body length check
Date: Mon, 25 Nov 2024 22:53:14 +0200
Message-ID: <20241125205314.1725887-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
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

Fix the MST sideband message body length check, which must be at least 1
byte accounting for the message body CRC (aka message data CRC) at the
end of the message.

This fixes a case where an MST branch device returns a header with a
correct header CRC (indicating a correctly received body length), with
the body length being incorrectly set to 0. This will later lead to a
memory corruption in drm_dp_sideband_append_payload() and the following
errors in dmesg:

   UBSAN: array-index-out-of-bounds in drivers/gpu/drm/display/drm_dp_mst_topology.c:786:25
   index -1 is out of range for type 'u8 [48]'
   Call Trace:
    drm_dp_sideband_append_payload+0x33d/0x350 [drm_display_helper]
    drm_dp_get_one_sb_msg+0x3ce/0x5f0 [drm_display_helper]
    drm_dp_mst_hpd_irq_handle_event+0xc8/0x1580 [drm_display_helper]

   memcpy: detected field-spanning write (size 18446744073709551615) of single field "&msg->msg[msg->curlen]" at drivers/gpu/drm/display/drm_dp_mst_topology.c:791 (size 256)
   Call Trace:
    drm_dp_sideband_append_payload+0x324/0x350 [drm_display_helper]
    drm_dp_get_one_sb_msg+0x3ce/0x5f0 [drm_display_helper]
    drm_dp_mst_hpd_irq_handle_event+0xc8/0x1580 [drm_display_helper]

Cc: <stable@vger.kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index ac90118b9e7a8..e6ee180815b20 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -320,6 +320,9 @@ static bool drm_dp_decode_sideband_msg_hdr(const struct drm_dp_mst_topology_mgr
 	hdr->broadcast = (buf[idx] >> 7) & 0x1;
 	hdr->path_msg = (buf[idx] >> 6) & 0x1;
 	hdr->msg_len = buf[idx] & 0x3f;
+	if (hdr->msg_len < 1)		/* min space for body CRC */
+		return false;
+
 	idx++;
 	hdr->somt = (buf[idx] >> 7) & 0x1;
 	hdr->eomt = (buf[idx] >> 6) & 0x1;
-- 
2.44.2

