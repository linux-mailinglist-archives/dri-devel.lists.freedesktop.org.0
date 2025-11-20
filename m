Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E167C739CC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 12:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F1A10E73C;
	Thu, 20 Nov 2025 11:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qx2jndeU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C4110E739;
 Thu, 20 Nov 2025 11:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763636684; x=1795172684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x0BJhxyGfR1XqEF23p9JtlRqYIN+PgNt9iKj9D425XA=;
 b=Qx2jndeU4CcPI0iwNHCvXDgRLaqHnxLHSUu93iRUPFwOjFL+q0+o+Ixd
 ZDs0UrBho1F+DM58EKMeVVKPOgN486m5O/+Nt5uyAK3TXPYH6Ce7GIKgb
 CFx0vRh26CR5clZ/DZMew03+iJxp7xiUsbvtuimvFEWnQLsnqcWcZ+pej
 r0GaP3FYugM+NpHv1wfEbvnHmDAf+1C24lPaAQSbrc0rysEFcMNtVdQF9
 D7+oN+amu9EMk5k7yGb+oAPv5XzIoiLn16MI1Kh1I/QSazuJDCOaa2pZ3
 N1KH1fbKD4rvp8Wlw6pAlh8DuPa9oeo4IGtjq69ux0aEXpD7OAWubpxnN A==;
X-CSE-ConnectionGUID: F9zDA4Z0RgS/mdOe1WiHMQ==
X-CSE-MsgGUID: ta7pYP1oQIusbYZM5QpqCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="68308035"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="68308035"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 03:04:43 -0800
X-CSE-ConnectionGUID: 5H/ovCg6RZaTR+4534E+pw==
X-CSE-MsgGUID: U9eLlPA7SiyXBK4n683UDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="228643730"
Received: from agladkov-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.244.142])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 03:04:40 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Waiman Long <longman@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [RFC PATCH 2/2] dma-buf/dma-resv: Improve the dma-resv lockdep checks
Date: Thu, 20 Nov 2025 12:03:41 +0100
Message-ID: <20251120110341.2425-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251120110341.2425-1-thomas.hellstrom@linux.intel.com>
References: <20251120110341.2425-1-thomas.hellstrom@linux.intel.com>
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

Ensure that dma_resv_held() and dma_resv_assert_held() operate
on individual reservation objects within a WW transaction rather
than on the reservation WW class.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/linux/dma-resv.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index c5ab6fd9ebe8..001de3880fde 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -308,8 +308,11 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
 	     fence = dma_resv_iter_first(cursor); fence;	\
 	     fence = dma_resv_iter_next(cursor))
 
-#define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
-#define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
+#define dma_resv_held(obj) (lockdep_is_held(&(obj)->lock.base) && ww_mutex_held(&(obj)->lock))
+#define dma_resv_assert_held(obj) do {			\
+		lockdep_assert_held(&(obj)->lock.base); \
+		ww_mutex_assert_held(&(obj)->lock);	\
+	} while (0)
 
 #ifdef CONFIG_DEBUG_MUTEXES
 void dma_resv_reset_max_fences(struct dma_resv *obj);
-- 
2.51.1

