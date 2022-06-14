Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8D654B8E9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 20:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C741610F595;
	Tue, 14 Jun 2022 18:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885A810FC9A;
 Tue, 14 Jun 2022 18:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655232146; x=1686768146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d9BrXaQdih6hNr6yEHkTJeQhLqRwUaHrERctslSo+mI=;
 b=LsRBDUA7FUowldAHKsBb1gUObBgfXDItfRIopg5BiJowpESPGjlWTkxY
 lEPy/qLlBJgbtDxdM2ihmmfKlS0/8z9i6AUkMz2gUrOT39vt8xqA2IKb6
 IA1kfkKqDRI1Ns1Nj52l43+Uch4a/JMz5BvYCt9dnS532AZs79bWrzedl
 2ffVHx5B5k6YiKYlKqhaqk7Zrw/NkmUQvxuIS9XGHyMAtG9Ko7KAqZjrK
 X5YlA7LMeuFdCkYdFCE17a0EebhOS+jD2hM5XML2ohRzmkrzWBZCXyORP
 FDP/hDbgKxi/DKpaP/4b25QBLB1vCduwYnbzW6RaMkc50vhP1Jqc1E3ls w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="279426483"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="279426483"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 11:42:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="588627311"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 11:42:23 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/i915: Do not use reserved requests for virtual engines
Date: Wed, 15 Jun 2022 00:13:48 +0530
Message-Id: <20220614184348.23746-4-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220614184348.23746-1-ramalingam.c@intel.com>
References: <20220614184348.23746-1-ramalingam.c@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Do not use reserved requests for virtual engines as this is only
needed for kernel contexts.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/i915_request.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index c71905d8e154..f0392b053bca 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -135,6 +135,8 @@ static void i915_fence_release(struct dma_fence *fence)
 
 	/*
 	 * Keep one request on each engine for reserved use under mempressure
+	 * do not use with virtual engines as this really is only needed for
+	 * kernel contexts.
 	 *
 	 * We do not hold a reference to the engine here and so have to be
 	 * very careful in what rq->engine we poke. The virtual engine is
@@ -164,7 +166,8 @@ static void i915_fence_release(struct dma_fence *fence)
 	 * know that if the rq->execution_mask is a single bit, rq->engine
 	 * can be a physical engine with the exact corresponding mask.
 	 */
-	if (is_power_of_2(rq->execution_mask) &&
+	if (!intel_engine_is_virtual(rq->engine) &&
+	    is_power_of_2(rq->execution_mask) &&
 	    !cmpxchg(&rq->engine->request_pool, NULL, rq))
 		return;
 
-- 
2.20.1

