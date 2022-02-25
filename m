Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEDD4C4CBC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 18:41:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC2C10E8B1;
	Fri, 25 Feb 2022 17:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B458410E8AA;
 Fri, 25 Feb 2022 17:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645810903; x=1677346903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XHVKZoBzLpLXZsivE9Dv04+9mCyRs8rkvEFID12NII0=;
 b=cSuDra4RjsgE8tmh0jBanvGY+xS6pDK7kJmQEe9Fb+jRGYx6OyaLcV4L
 gPF1D/J0u9jz5eDCuTL7fw5a0YJsyM1v6+3oInOPi+1OoDlo+xQqVJwuE
 ptno/6Zuk+BX/KWrYcRHgBnsiWoy8BDLCN4hciuiveRhyPbnWsbvBG1v9
 hmCFLQGQ7KVhADuHm3BW/LbpVzF7yAAE3cuIL4Prd6SiYQRi0gfQs9U/V
 tqTP+it3NAn5yq+uR62z4s6bnJXWW4RGPCrOdlllyHyB1ljtiu8xRtZMs
 3yntfSYjt1s96HZ0ZBXGHdjl9+4JMWuBKvyi0uIKvm+AbRtwPU2Y3ZbQ4 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="233168653"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="233168653"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 09:41:28 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="549349950"
Received: from pkinsell-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.234.117])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 09:41:27 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] dma-resv: Fix dma_resv_held
Date: Fri, 25 Feb 2022 17:41:18 +0000
Message-Id: <20220225174118.1320237-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220225174118.1320237-1-tvrtko.ursulin@linux.intel.com>
References: <20220225174118.1320237-1-tvrtko.ursulin@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Avoid false positives if lock state is unknown.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 include/linux/dma-resv.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index afdfdfac729f..f475814c0d7a 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -278,7 +278,8 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
 	     fence = dma_resv_iter_first(cursor); fence;	\
 	     fence = dma_resv_iter_next(cursor))
 
-#define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
+#define dma_resv_held(obj) \
+	(lockdep_is_held(&(obj)->lock.base) == LOCK_STATE_HELD)
 #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
 
 #ifdef CONFIG_DEBUG_MUTEXES
-- 
2.32.0

