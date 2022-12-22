Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BC5653F99
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 12:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECEE10E505;
	Thu, 22 Dec 2022 11:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AA910E4F2;
 Thu, 22 Dec 2022 11:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671709747; x=1703245747;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xrva1eFk6Np1Bm1YmRwegqhZeY1WwhPNk9Drl9WzrJI=;
 b=UE2Sdfb7RyduJZnLoGxcxngQLIBvNWa1aUvZzaNx7oB/iJgazljtCVZC
 Niwzasj3Xl1B9X3YT0pu9FXODrlzsjTHL5ip52BKO9hB6WH/atFEy3iMg
 veQmlImqTVCt0a13265jEgTD5hIAhb8XM8d1c60bC2vXnkO7tjeRBk4iW
 uzC9V4lANf7tSqh6dx1JmSQnbafYs1fRKt87+ylyF+JqLgp+12O9eUDBn
 rGQSjWN0BwsbgD9REma45qP/XXtQB2l62E6YvbgaNmYyC9Mu5bo2V2YNq
 voQ3sYTFRrtyGCbCIooinFnE6K5EZGgbYbUfPyn2b/mAONFyHXekFC6dT w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="318804907"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="318804907"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 03:49:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="629504931"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="629504931"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 03:49:00 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 17/19] arch/xtensa: rename internal name __xchg to __arch_xchg
Date: Thu, 22 Dec 2022 12:46:33 +0100
Message-Id: <20221222114635.1251934-18-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222114635.1251934-1-andrzej.hajda@intel.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

__xchg will be used for non-atomic xchg macro.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 arch/xtensa/include/asm/cmpxchg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/xtensa/include/asm/cmpxchg.h b/arch/xtensa/include/asm/cmpxchg.h
index eb87810357ad88..675a11ea8de76b 100644
--- a/arch/xtensa/include/asm/cmpxchg.h
+++ b/arch/xtensa/include/asm/cmpxchg.h
@@ -170,7 +170,7 @@ static inline unsigned long xchg_u32(volatile int * m, unsigned long val)
 }
 
 #define arch_xchg(ptr,x) \
-	((__typeof__(*(ptr)))__xchg((unsigned long)(x),(ptr),sizeof(*(ptr))))
+	((__typeof__(*(ptr)))__arch_xchg((unsigned long)(x),(ptr),sizeof(*(ptr))))
 
 static inline u32 xchg_small(volatile void *ptr, u32 x, int size)
 {
@@ -203,7 +203,7 @@ static inline u32 xchg_small(volatile void *ptr, u32 x, int size)
 extern void __xchg_called_with_bad_pointer(void);
 
 static __inline__ unsigned long
-__xchg(unsigned long x, volatile void * ptr, int size)
+__arch_xchg(unsigned long x, volatile void * ptr, int size)
 {
 	switch (size) {
 	case 1:
-- 
2.34.1

