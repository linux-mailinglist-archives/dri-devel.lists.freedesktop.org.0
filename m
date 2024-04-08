Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBF189CA4D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EC81128A0;
	Mon,  8 Apr 2024 17:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JAOR0d8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34507112876
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595896; x=1744131896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TaYLEYhEVr2q/TPhG+Z5oGuaBRkrRlk3EKUJnJEvuaU=;
 b=JAOR0d8PXdm6/K/WbOWqPRJILmyNqcnHSMwIGG74w7siRGXh4bChUP3j
 2wiisM3TOYCy+2s1QzjY50XxREB18lMTjBHKf+1OFuu/7llABON0fsG+r
 5olsKax8VwcKuRSvXDN2RjANXEZerJ94g4XJm/eXQJEvjNh38TnvzG14r
 sYFrGFsXMLd+D7ll+b0mNGKHC1yRYg6FC+nfju6EBK3Sq3gtRqJOfQS6e
 +LhtOdNvybl1Uh+/MTTrsUvs3q85vDd80VL+xRPF2uv7nzT+l3/Hr/+L6
 /j9O5hscffa+ebHiAsgttQcvx/XnqMxxh6Crh26DiaHmAroRzrr8oWcUt w==;
X-CSE-ConnectionGUID: nDRnQa+ARMeRrbfB5/lYxw==
X-CSE-MsgGUID: uAXuvfCKTx2a6atUwdMdtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7793387"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7793387"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792332"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792332"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:04:51 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 20:04:51 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
Subject: [PATCH 08/21] drm/hisilicon/kirin: Include linux/io.h for
 readl()/writel()
Date: Mon,  8 Apr 2024 20:04:13 +0300
Message-ID: <20240408170426.9285-9-ville.syrjala@linux.intel.com>
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

Include linux/io.h for readl()/writel().

When built on x86_64 w/ COMPILE_TEST=y:
../drivers/gpu/drm/hisilicon/kirin/dw_dsi_reg.h:93:16: error: implicit declaration of function ‘readl’ [-Werror=implicit-function-declaration]
   93 |         orig = readl(addr);
      |                ^~~~~
../drivers/gpu/drm/hisilicon/kirin/dw_dsi_reg.h:96:9: error: implicit declaration of function ‘writel’ [-Werror=implicit-function-declaration]
   96 |         writel(tmp, addr);
      |         ^~~~~~

Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Yongqin Liu <yongqin.liu@linaro.org>
Cc: John Stultz <jstultz@google.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/hisilicon/kirin/dw_dsi_reg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_dsi_reg.h b/drivers/gpu/drm/hisilicon/kirin/dw_dsi_reg.h
index d79fc031e53d..a87d1135856f 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_dsi_reg.h
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_dsi_reg.h
@@ -7,6 +7,8 @@
 #ifndef __DW_DSI_REG_H__
 #define __DW_DSI_REG_H__
 
+#include <linux/io.h>
+
 #define MASK(x)				(BIT(x) - 1)
 
 /*
-- 
2.43.2

