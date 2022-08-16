Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBE2596A3C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 09:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F03010FE36;
	Wed, 17 Aug 2022 07:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44F1A5A97;
 Tue, 16 Aug 2022 12:39:00 +0000 (UTC)
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
 t=1660653538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=JLCOqrmDxlScPWlMM0m9RZxSSqsKrmtABPqJmneo9vE=;
 b=lPvfMm6cXnmUBjJ+mYGDCPWs8YhvsFE1jDJeZQszcdhtyBjJkdfWhb2x/VmHT0nQ4nF9Kl
 g7/0lqEmD2bJmvP5gcTXIp8L2cnjw2c4HYs3MQbo4hgMDv1dRmnOHjilgsZJ0zI4F9XxKO
 lAzoq3CSGXd7EA6mS2cU+kimz1gfdXk=
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH] i915-pmu: Add extra check engine
Date: Tue, 16 Aug 2022 15:38:57 +0300
Message-Id: <20220816123858.42489-1-arefev@swemel.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 17 Aug 2022 07:17:49 +0000
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
Cc: ldv-project@linuxtesting.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Return value of a function 'intel_engine_lookup_user' is dereferenced at i915_pmu.c:708
without checking for null, but it is usually checked for this function

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
 drivers/gpu/drm/i915/i915_pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 69c0fa20eba1..33db49ffac3d 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -704,8 +704,10 @@ static void i915_pmu_disable(struct perf_event *event)
 		 * Decrement the reference count and clear the enabled
 		 * bitmask when the last listener on an event goes away.
 		 */
-		if (--engine->pmu.enable_count[sample] == 0)
-			engine->pmu.enable &= ~BIT(sample);
+		if (engine != NULL) {
+		        if (--engine->pmu.enable_count[sample] == 0)
+			        engine->pmu.enable &= ~BIT(sample);
+		}
 	}
 
 	GEM_BUG_ON(bit >= ARRAY_SIZE(pmu->enable_count));
-- 
2.25.1

