Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE68689CA54
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA39D1128B3;
	Mon,  8 Apr 2024 17:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bNYKtuXI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9C31128A5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595904; x=1744131904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VAgdfXWwcB+swlxwYDi94m/VxBv6WCwjUX4pW/LsdUc=;
 b=bNYKtuXIAx3QUw3xwyAS72VW8AVg4c9saBKdyaJXHUi5drmfnGdNlay4
 k859KXEGTDtaNadkfSuK+r4dDpTiVOrB1/QUSgjXOdvibhcRJVgnR/WWR
 MADVkz8BPmktSrDKJUxnRvxJng7FR0w4V6xpNdU098xmch47uoXx/N9+5
 EcqW4sqvFoB51OtPXWCqLk23jsEgN+aKVCJRYw9OfBI3/7NvwOGEbdcNo
 Oyk2pKA8kNWuuONvUAV5/hLJhiNgpoBOreaSCHurW+CGAhiV4pMy694XA
 28hh7Yfgwsbc8GT1YN/8gd3JItkDYKOHq3IFPB1xLBITcSKj/5Dc8mmxs A==;
X-CSE-ConnectionGUID: 4szQ0zOZTRG0YEbHd9lJxA==
X-CSE-MsgGUID: OkM2xQCdR62FzrD72IMi9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7793417"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7793417"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792334"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792334"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:05:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 20:04:59 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
Subject: [PATCH 10/21] drm/hisilicon/kirin: Fix MASK(32) on 32bit architectures
Date: Mon,  8 Apr 2024 20:04:15 +0300
Message-ID: <20240408170426.9285-11-ville.syrjala@linux.intel.com>
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

BIT(32) is illegal when sizeof(long)==4. Use BIT_ULL(32)
instead.

Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Yongqin Liu <yongqin.liu@linaro.org>
Cc: John Stultz <jstultz@google.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h b/drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h
index be9e789c2d04..36f923cc7594 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_ade_reg.h
@@ -10,7 +10,7 @@
 /*
  * ADE Registers
  */
-#define MASK(x)				(BIT(x) - 1)
+#define MASK(x)				(BIT_ULL(x) - 1)
 
 #define ADE_CTRL			0x0004
 #define FRM_END_START_OFST		0
-- 
2.43.2

