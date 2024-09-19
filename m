Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E876597CA3D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 15:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9400A10E705;
	Thu, 19 Sep 2024 13:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jv7u3G74";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FBD10E700;
 Thu, 19 Sep 2024 13:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726753290; x=1758289290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pwQ4AzhoPayIC5MyR7VCqQrmy9EILF63t57iNA+4Gog=;
 b=Jv7u3G74NYmA/WSVyq8CNYU92757PLAPFT8q8dl9piS6YP7iKjjAOClA
 m9X063uvgYAVOXqz6R3RTzSQ6B5TnvCbclWhPycIZbzaFynyGZj3WcO8e
 cueawAxaye72YovepSUiZ9rr7Y8MK6JYI7IDg+oa2EHgIvcHUT9LEIcg8
 Kiri1mxe9Sp4xMQuURUFl4ryctoINW2Bj++/8TfpUV9sqKq7rQDsVdF8z
 o4CJxOWRYy4g6vgH/uOyaJcLpBmZkZwjLEI21KxQj0iRF0/MpytHtkhGx
 2P0R9wktmYiz9ct6Qm+aiT5HQQYnCCmHYOsGyaqRzrsXpfpJHr4NWBCyD A==;
X-CSE-ConnectionGUID: n56HAqz8RfyhIPLV9NVnuA==
X-CSE-MsgGUID: e6JSRmHiTEeo3xT9ewzBeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29505350"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="29505350"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 06:41:30 -0700
X-CSE-ConnectionGUID: H4hf5ItAQ5qN6U8w6+iKsw==
X-CSE-MsgGUID: E8Q03HvnRMekEPlb0VQUUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="74912643"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa004.jf.intel.com with ESMTP; 19 Sep 2024 06:41:28 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv3 2/6] drm/xe: Add histogram support to Xe builds
Date: Thu, 19 Sep 2024 19:01:36 +0530
Message-Id: <20240919133140.1372663-3-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240919133140.1372663-1-arun.r.murthy@intel.com>
References: <20240919133140.1372663-1-arun.r.murthy@intel.com>
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

Histogram added as part of i915/display driver. Adding the same for xe
as well.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index edfd812e0f41..2a5e3ed5ea17 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -239,6 +239,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_hdcp.o \
 	i915-display/intel_hdcp_gsc_message.o \
 	i915-display/intel_hdmi.o \
+	i915-display/intel_histogram.o \
 	i915-display/intel_hotplug.o \
 	i915-display/intel_hotplug_irq.o \
 	i915-display/intel_hti.o \
-- 
2.25.1

