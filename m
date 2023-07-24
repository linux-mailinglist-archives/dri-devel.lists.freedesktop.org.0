Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E6A75F584
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 13:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E68510E02E;
	Mon, 24 Jul 2023 11:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16A710E02E;
 Mon, 24 Jul 2023 11:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690199792; x=1721735792;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OFHM8av7FnYHjD6FMy7IxExOEte9hrt7SWYvxmOSZ78=;
 b=P5d2rlSot6RHaBfSn89AqziDvrHhkNiiOv/g4lXJSGEbOpY7AzLhiimu
 UztewEhKPJT7/5U6aWjy2pMjBeGLM6LTUmPvL8ZtzRs44ZUk0D00o1Qo2
 fMQgxwHzKfETkkFLub94UJTGoNt4RjI+vXee6H1SkU6rHu5FtKM+6jC7n
 EyTCLuHvVVa68Gfswd1JL4RXC5t5OdeKYdlwEbP+xkrTCdmLufjqZJbDA
 7Bpo1Xx2R9NQdGC6conyiVu4g3aUr9/f4QcwefGY0yNqHopc3p/nL+Sxf
 Q87sFk8g6OeJkgFWDa7GhL1vKLAqVX4BVKJMGYZ3XKqe0test8/ZVbLtF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="371020642"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="371020642"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 04:56:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="725675801"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="725675801"
Received: from srichara-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.170.186])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 04:56:30 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Tidy for_each_set_bit usage with abox_regs
Date: Mon, 24 Jul 2023 12:56:24 +0100
Message-Id: <20230724115624.1485010-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Aditya Swarup <aditya.swarup@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

For_each_set_bit wants the max number of bits to walk and not the byte
storage size of the source field.

In this case there is no bug since abox_mask can mostly contain bits 0-2.

Another funny thing is that both sizeof(abox_mask), where abox_mask is
unsigned long, and BITS_PER_TYPE(DISPLAY_INFO->abox_mask)), are 8 (on
64-bit builds) so there is even less between them.

Anyway, why not make it explicit to what the constraint is.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
References: 62afef2811e4 ("drm/i915/rkl: RKL uses ABOX0 for pixel transfers")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Aditya Swarup <aditya.swarup@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 38225e5d311e..27a484892908 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -1170,7 +1170,8 @@ static void icl_mbus_init(struct drm_i915_private *dev_priv)
 	if (DISPLAY_VER(dev_priv) == 12)
 		abox_regs |= BIT(0);
 
-	for_each_set_bit(i, &abox_regs, sizeof(abox_regs))
+	for_each_set_bit(i, &abox_regs,
+			 BITS_PER_TYPE(DISPLAY_INFO(dev_priv)->abox_mask))
 		intel_de_rmw(dev_priv, MBUS_ABOX_CTL(i), mask, val);
 }
 
@@ -1623,11 +1624,13 @@ static void tgl_bw_buddy_init(struct drm_i915_private *dev_priv)
 	if (table[config].page_mask == 0) {
 		drm_dbg(&dev_priv->drm,
 			"Unknown memory configuration; disabling address buddy logic.\n");
-		for_each_set_bit(i, &abox_mask, sizeof(abox_mask))
+		for_each_set_bit(i, &abox_mask,
+				 BITS_PER_TYPE(DISPLAY_INFO(dev_priv)->abox_mask))
 			intel_de_write(dev_priv, BW_BUDDY_CTL(i),
 				       BW_BUDDY_DISABLE);
 	} else {
-		for_each_set_bit(i, &abox_mask, sizeof(abox_mask)) {
+		for_each_set_bit(i, &abox_mask,
+				 BITS_PER_TYPE(DISPLAY_INFO(dev_priv)->abox_mask)) {
 			intel_de_write(dev_priv, BW_BUDDY_PAGE_MASK(i),
 				       table[config].page_mask);
 
-- 
2.39.2

