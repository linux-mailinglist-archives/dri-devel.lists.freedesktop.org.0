Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B73A6DE744
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 00:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49E310E6B2;
	Tue, 11 Apr 2023 22:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD6A10E36B;
 Tue, 11 Apr 2023 22:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681252189; x=1712788189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SV7woMv8KAxN1gJYpXb4ARxCSBFCH49G5H+46Oo6RtY=;
 b=RK17nU8uZEn8u+P4AubzUAL23wd67PqWRbDLv3hxJ1qUbIZ81x0/MXeX
 C5cO5rr5xYE45NQymKABIBe3Zp78c6v3CrbWJr0cPfPE0qsEYcUDXp/64
 iVZGZah9HD8BCpu1E1e3UjpFvuXs9C+yIsLbAdyGyTm3Y7v1024mH/mxq
 OOseii3AgbJaW+IvpkbB6SaHdlWL8mPug3KkY06p6E4bEPz5lQEhc62bR
 E0RcXc53vJrSrKe/ZFdE2ELUXk6ddyY/rNYNyHp6OBpedUZmG1RXV3wOf
 z2J3CAL1En12JiuDEBVanFunjAT9UDT0USFl2c+QCDhiAOOJbTCzj2cld w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="342506268"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="342506268"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 15:29:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="753296837"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="753296837"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga008.fm.intel.com with SMTP; 11 Apr 2023 15:29:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Apr 2023 01:29:46 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/6] drm/i915: No 10bit gamma on desktop gen3 parts
Date: Wed, 12 Apr 2023 01:29:30 +0300
Message-Id: <20230411222931.15127-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411222931.15127-1-ville.syrjala@linux.intel.com>
References: <20230411222931.15127-1-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Apparently desktop gen3 parts don't support the
10bit gamma mode at all. Stop claiming otherwise.

As is the case with pipe A on gen3 mobile parts, the
PIPECONF gamma mode bit can be set but it has no
effect on the output.

PNV seems to be the only slight exception, but generally
the desktop PNV variant looks more like a mobile part so
this is not entirely surprising.

Fixes: 67630bacae23 ("drm/i915: Add 10bit gamma mode for gen2/3")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index cddb6e197972..305c05c3f93b 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -250,13 +250,13 @@ static const struct intel_device_info i865g_info = {
 	.dma_mask_size = 32, \
 	I9XX_PIPE_OFFSETS, \
 	I9XX_CURSOR_OFFSETS, \
-	I9XX_COLORS, \
 	GEN_DEFAULT_PAGE_SIZES, \
 	GEN_DEFAULT_REGIONS
 
 static const struct intel_device_info i915g_info = {
 	GEN3_FEATURES,
 	PLATFORM(INTEL_I915G),
+	I845_COLORS,
 	.has_coherent_ggtt = false,
 	.display.cursor_needs_physical = 1,
 	.display.has_overlay = 1,
@@ -268,6 +268,7 @@ static const struct intel_device_info i915g_info = {
 static const struct intel_device_info i915gm_info = {
 	GEN3_FEATURES,
 	PLATFORM(INTEL_I915GM),
+	I9XX_COLORS,
 	.is_mobile = 1,
 	.display.cursor_needs_physical = 1,
 	.display.has_overlay = 1,
@@ -281,6 +282,7 @@ static const struct intel_device_info i915gm_info = {
 static const struct intel_device_info i945g_info = {
 	GEN3_FEATURES,
 	PLATFORM(INTEL_I945G),
+	I845_COLORS,
 	.display.has_hotplug = 1,
 	.display.cursor_needs_physical = 1,
 	.display.has_overlay = 1,
@@ -292,6 +294,7 @@ static const struct intel_device_info i945g_info = {
 static const struct intel_device_info i945gm_info = {
 	GEN3_FEATURES,
 	PLATFORM(INTEL_I945GM),
+	I9XX_COLORS,
 	.is_mobile = 1,
 	.display.has_hotplug = 1,
 	.display.cursor_needs_physical = 1,
@@ -306,6 +309,7 @@ static const struct intel_device_info i945gm_info = {
 static const struct intel_device_info g33_info = {
 	GEN3_FEATURES,
 	PLATFORM(INTEL_G33),
+	I845_COLORS,
 	.display.has_hotplug = 1,
 	.display.has_overlay = 1,
 	.dma_mask_size = 36,
@@ -314,6 +318,7 @@ static const struct intel_device_info g33_info = {
 static const struct intel_device_info pnv_g_info = {
 	GEN3_FEATURES,
 	PLATFORM(INTEL_PINEVIEW),
+	I9XX_COLORS,
 	.display.has_hotplug = 1,
 	.display.has_overlay = 1,
 	.dma_mask_size = 36,
@@ -322,6 +327,7 @@ static const struct intel_device_info pnv_g_info = {
 static const struct intel_device_info pnv_m_info = {
 	GEN3_FEATURES,
 	PLATFORM(INTEL_PINEVIEW),
+	I9XX_COLORS,
 	.is_mobile = 1,
 	.display.has_hotplug = 1,
 	.display.has_overlay = 1,
-- 
2.39.2

