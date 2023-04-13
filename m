Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A71F96E12CB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 18:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AAA10EBA3;
	Thu, 13 Apr 2023 16:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1170010EB92;
 Thu, 13 Apr 2023 16:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681404585; x=1712940585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SV7woMv8KAxN1gJYpXb4ARxCSBFCH49G5H+46Oo6RtY=;
 b=XGlgyiun61vhS7dFe2pCUSp8rEwbnEVmHTA4C+ckENNJA94r09elduV3
 adzRIQR59dRY65hce5A8EjYjovts9bx8Ttl56CN1MdyfOnFzAi1rJ9xO1
 4vwEy2dSCUCUAEND5q7qD9BkUpqW7qofIncEHtJLWS337wwJ7taL8bsqk
 JvbSMJR6S/u6MW59g7EeotM2kHfjVGAZowf6FXhTySSnrhNJI/Y4p9y5I
 34myYivctvT1KQDaAElsycQzxJErz+WvA8UXLeM5Y/cIPeEiINTTXOYef
 HO6ktHSCF2xUP1oopJHFJaQzyCrdtwL/glAwkx3/OK2knQijna/QQh2tN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="342991139"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="342991139"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 09:49:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="692037982"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="692037982"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 13 Apr 2023 09:49:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 13 Apr 2023 19:49:34 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 6/7] drm/i915: No 10bit gamma on desktop gen3 parts
Date: Thu, 13 Apr 2023 19:49:15 +0300
Message-Id: <20230413164916.4221-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413164916.4221-1-ville.syrjala@linux.intel.com>
References: <20230413164916.4221-1-ville.syrjala@linux.intel.com>
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

