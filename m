Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA1FA20DF0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 17:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400E010E6BC;
	Tue, 28 Jan 2025 16:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xa1rzXbk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BF910E6CC;
 Tue, 28 Jan 2025 16:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738080373; x=1769616373;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=zYckDRMYUzNNn6RA3DMfSapl67kI2dH8feccUcIxy3g=;
 b=Xa1rzXbk39Pk5sSbOzDMv+35LLZupObNNnvx7FbxdKpeD0zXGeybuWOm
 HZSt5HCZC8TAmtn+NKlbqN6axenvyR4aPwP0PSeOEIiXkKRYvzE+Zis9I
 RY2OIH4t5GZAeWRB6SLGtx3TE0NCsYJM6GkiwrepQMX5hdWl0XhvWTkB1
 IElsY/HwqheqwMdUrmwN1uaA53tgZC2JnRvmxicZVG+mjbMzYcLmXPNka
 IW6RIOHqnWFGEKVaKIbmb+Tsr6y+ndLWvWi6FhsiyZR6M9By5sq1FrG4x
 7/7gZi/D2tmliY8sqBKEjLVWhX3D9pY4OEtbZwZFUlYTMMLwhRqL1bl4V A==;
X-CSE-ConnectionGUID: RBPTNNgCRjqVqwBJS8BruQ==
X-CSE-MsgGUID: nx4rl+w9QPWfqgC6DChuPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38745037"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="38745037"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 08:06:12 -0800
X-CSE-ConnectionGUID: haFJSwxKTbW9JX3SWqQpCg==
X-CSE-MsgGUID: Uy2+qByWRb2NJYRTJg1ipQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145976959"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 28 Jan 2025 08:06:10 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 28 Jan 2025 21:21:13 +0530
Subject: [PATCH v8 07/14] drm/xe: Add histogram support to Xe builds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-dpst-v8-7-871b94d777f8@intel.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
In-Reply-To: <20250128-dpst-v8-0-871b94d777f8@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, dmitry.baryshkov@linaro.org, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/xe/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 80ab87cfeecbcf9f64183e938a8b15efe71459ed..7ee23d31a1a3584852708c4e17ad179a47e5b6b9 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -248,6 +248,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_hdcp.o \
 	i915-display/intel_hdcp_gsc_message.o \
 	i915-display/intel_hdmi.o \
+	i915-display/intel_histogram.o \
 	i915-display/intel_hotplug.o \
 	i915-display/intel_hotplug_irq.o \
 	i915-display/intel_hti.o \

-- 
2.25.1

