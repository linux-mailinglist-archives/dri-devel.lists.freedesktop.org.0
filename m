Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B109653F5F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 12:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8AC10E4FC;
	Thu, 22 Dec 2022 11:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FC810E4F7;
 Thu, 22 Dec 2022 11:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671709705; x=1703245705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TghWz/7dE4JZXKAzYoxxWMMVMnrM6ngZWB0OqEIPnYA=;
 b=DuS2QF5sxVpKkjNlWCyR7OIq0b8qko3KfIbfPwiuuIQ1cv0fViHHa19K
 UeZzEUtmgo7VRpZwdLwQUqmc73s8N8tmPvQbEooY6rXfZsx0n9rovmXL2
 nW3PiygcASjytf4LBEeVngKmb/I2c5cRAxrpzVDdcmgiEsfsVWUzEGQyS
 GcqhW8cq+5rfaaxV0DVCgXiS41E4y8nW/1sep2KPhQSMESioFxjWeq6nd
 B6bt4IxLNp7yxswBJ0zMt0PjI0wRFWuEzbBHPBM5Nnuqn20tHr5SevsmK
 xYfSQ53PXnaUouhFmEvaqt/kib9i2UB6E2mZLOge3kDpz2kic2Y7TueV1 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="318804731"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="318804731"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 03:48:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="629504752"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="629504752"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 03:48:18 -0800
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
Subject: [PATCH 10/19] arch/openrisc: rename internal name __xchg to
 __arch_xchg
Date: Thu, 22 Dec 2022 12:46:26 +0100
Message-Id: <20221222114635.1251934-11-andrzej.hajda@intel.com>
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
 arch/openrisc/include/asm/cmpxchg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/openrisc/include/asm/cmpxchg.h b/arch/openrisc/include/asm/cmpxchg.h
index 79fd16162ccb6d..5725e22e10683b 100644
--- a/arch/openrisc/include/asm/cmpxchg.h
+++ b/arch/openrisc/include/asm/cmpxchg.h
@@ -147,7 +147,7 @@ static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
 extern unsigned long __xchg_called_with_bad_pointer(void)
 	__compiletime_error("Bad argument size for xchg");
 
-static inline unsigned long __xchg(volatile void *ptr, unsigned long with,
+static inline unsigned long __arch_xchg(volatile void *ptr, unsigned long with,
 		int size)
 {
 	switch (size) {
@@ -163,7 +163,7 @@ static inline unsigned long __xchg(volatile void *ptr, unsigned long with,
 
 #define arch_xchg(ptr, with) 						\
 	({								\
-		(__typeof__(*(ptr))) __xchg((ptr),			\
+		(__typeof__(*(ptr))) __arch_xchg((ptr),			\
 					    (unsigned long)(with),	\
 					    sizeof(*(ptr)));		\
 	})
-- 
2.34.1

