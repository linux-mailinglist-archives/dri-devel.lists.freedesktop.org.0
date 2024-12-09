Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7AA9E9BCB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 17:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9A810E4E0;
	Mon,  9 Dec 2024 16:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnPG7jpk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96F110E4DF;
 Mon,  9 Dec 2024 16:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733762098; x=1765298098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qim44bhfEGeu7lxNe5mva5J8SPeY19zU/HcooOnW4uo=;
 b=BnPG7jpkyFI6JYgktYrQQDSHh2kljcwWqbaasxx7+wIGCQKAsP43QACI
 mEvtHBx9bH4esjyGjlRCmw9Y66d27WtOGbKb5v3VG5oEMYODXOGOuYqiu
 4jYVewgH0xryjxrPPnWHHr48jQg3ympoMdWasYwQ2p7MoFky+Z693THkH
 IbcslNviHVPh7LWBG6095HE2AR9MGM02zrzr5APgf7vtTgmlgofIE62RY
 PZPR4+JTrawOh96VTQ3aMmDBQGcYgMDOLp8/wYiqDwBXt0JRPGCxo9k8C
 a3nq45v0iSVK95/RIkuN8C8Fm5Iqo5t0mzffYav5AgWId2iRp1pISdCbh Q==;
X-CSE-ConnectionGUID: 1MmmZzXRQj6wDw40cYhliA==
X-CSE-MsgGUID: vwl2VEvfTjuOO/aKcXb06Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="56551650"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="56551650"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 08:34:58 -0800
X-CSE-ConnectionGUID: CmtKpgngTDqKGbVrRMKnrw==
X-CSE-MsgGUID: iK+uOWLORnaU0mVaV4FwQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="118371724"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 09 Dec 2024 08:34:56 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 05/10] drm/xe: Add histogram support to Xe builds
Date: Mon,  9 Dec 2024 21:54:59 +0530
Message-Id: <20241209162504.2146697-6-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241209162504.2146697-1-arun.r.murthy@intel.com>
References: <20241209162504.2146697-1-arun.r.murthy@intel.com>
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
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a93e6fcc0ad9..d383b0d35d8e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -245,6 +245,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_hdcp.o \
 	i915-display/intel_hdcp_gsc_message.o \
 	i915-display/intel_hdmi.o \
+	i915-display/intel_histogram.o \
 	i915-display/intel_hotplug.o \
 	i915-display/intel_hotplug_irq.o \
 	i915-display/intel_hti.o \
-- 
2.25.1

