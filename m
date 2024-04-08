Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DFF89CA53
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EF81128AE;
	Mon,  8 Apr 2024 17:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QmhiOURh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035941128A4
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595911; x=1744131911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WHFfK4xSL/HSVXyVm19sFH2KcEs1u7xoCyKZ+IYsjVI=;
 b=QmhiOURhmUmvBFm437mFeceWLdHJz1kgmnyOZWaa0wu1u8U0abzjuwOF
 OPCvuYMKKZxzNQuCRbW+EcY9o9FvHPSihpNvL7tksTikvGUtpXA/IXOYu
 0g1UzOKZGi1+WE45Tp0U6BYumOLj6YRITaZewV/7VSFMvCoONX0nbvDEW
 iVu3nDwqUZ4tX1m2FB8p8+bRGmAuvGnHTNMrl4WHUdXtZYJOSBeyCV5R0
 ONfoV7wY60rFB3g6//cYUnkD3ui4X3eCvJIpvV0KIJ6kgFLi+/862Mfnf
 SYSdwj87wB9R1QnL+Z8DVyMxnXLwrJ/rqISRJzeCPDtbAnGrjwUVai6QD Q==;
X-CSE-ConnectionGUID: CSq4TxwsSiK9S55EtjncqA==
X-CSE-MsgGUID: wzRUCfbFRFuQ07xEhSggdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7793438"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7793438"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792336"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792336"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:05:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 20:05:07 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 12/21] drm/tilcdc: Allow build without __iowmb()
Date: Mon,  8 Apr 2024 20:04:17 +0300
Message-ID: <20240408170426.9285-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

__iowmb() isn't available on most architectures. Make
its use optional so that the driver can be built on
other architectures with COMPILE_TEST=y.

Cc: Jyri Sarha <jyri.sarha@iki.fi>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_regs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_regs.h b/drivers/gpu/drm/tilcdc/tilcdc_regs.h
index f90e2dc3457c..44e4ada30fba 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_regs.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_regs.h
@@ -125,7 +125,9 @@ static inline void tilcdc_write64(struct drm_device *dev, u32 reg, u64 data)
 #if defined(iowrite64) && !defined(iowrite64_is_nonatomic)
 	iowrite64(data, addr);
 #else
+#ifdef __iowmb
 	__iowmb();
+#endif
 	/* This compiles to strd (=64-bit write) on ARM7 */
 	*(volatile u64 __force *)addr = __cpu_to_le64(data);
 #endif
-- 
2.43.2

