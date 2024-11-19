Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4BA9D2425
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 11:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBEB410E624;
	Tue, 19 Nov 2024 10:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dOZWW6SK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DCB10E61D;
 Tue, 19 Nov 2024 10:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732013704; x=1763549704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qim44bhfEGeu7lxNe5mva5J8SPeY19zU/HcooOnW4uo=;
 b=dOZWW6SKgeyVLvQpjobCDc0faGqvjvk3PdqG0Td0igtAJwJORXCiE4HA
 ewMxTiZ4ArW5gwCiD1WxBJ3CyZDTr2Yly+z4V140n8++MbiKpyfs9QKNu
 jPzbDTuFo4vNzW8K5xcB2UOdUDkXtrL4H1iyCoTF4nh20W7KmLfJ3Bcvw
 R9itvg/SG5G3976hIItKetwI2epaiXvO7lLmwE/Lx6ZQRkhmud57V+/Ip
 QMLJ7ExC6uHnoTfugg+xCewkcJpA/WFmVHTsNpgqr3ell65c5PsXAWnmj
 opRtXxg44hzIjnXBJS5LePSIqy+7qbxVO1rguDRL1nT9caBXBmLjwJ3nf g==;
X-CSE-ConnectionGUID: 53K4fFmeR76W4tJuBYQC2A==
X-CSE-MsgGUID: TUGFAGyGT2iLHEdEF2EFfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="43075353"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="43075353"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 02:55:03 -0800
X-CSE-ConnectionGUID: vmNndl28Q12oKseNkYWogQ==
X-CSE-MsgGUID: 5HJMqHhtQOeBaTPIvAezaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89937432"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa009.fm.intel.com with ESMTP; 19 Nov 2024 02:55:02 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 3/8] drm/xe: Add histogram support to Xe builds
Date: Tue, 19 Nov 2024 16:15:16 +0530
Message-Id: <20241119104521.575377-4-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241119104521.575377-1-arun.r.murthy@intel.com>
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
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

