Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DE9653F98
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 12:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338B610E503;
	Thu, 22 Dec 2022 11:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBCD10E501;
 Thu, 22 Dec 2022 11:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671709717; x=1703245717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XiqeX8OeZdoKUwrXM421vQgERq+9V4kGiGuMnC/Jf7o=;
 b=nqWG5QnFL5OQGFYBvWW0sTdS2KeWDm9be9l3a9unZXEVrGGSM7TV5vLA
 bRhKqXUWaib63O2/ly8KB+rQy608WYLfA8y4JOSlXuVUyWJ+BNt2CoBOB
 k9WJGhto4OVbBLIqS4Vm8OGW1kXbSN9xTQVZszuvdNww5wNJBbhCrnEeM
 WHGs2SuZ0obRcoPuhB/sxCbtYhH3i5qVeWC2cugdG+b7tD8q8rNxf29Qa
 ZVBw48F+NyZISNeaEOm3v/Cv+k32akMxSwihEjMmmGaLNWIUfGSY/8KGR
 lzJ06GmM9iXdo9J5VD/EdRF8cSSdf957ID60ghlgF8ZdS/+hnNS5Jk8nd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="318804781"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="318804781"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 03:48:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="629504799"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; d="scan'208";a="629504799"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 03:48:30 -0800
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
Subject: [PATCH 12/19] arch/powerpc: correct logged function names in xchg
 helpers
Date: Thu, 22 Dec 2022 12:46:28 +0100
Message-Id: <20221222114635.1251934-13-andrzej.hajda@intel.com>
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
 arch/powerpc/include/asm/cmpxchg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/cmpxchg.h b/arch/powerpc/include/asm/cmpxchg.h
index 05f246c0e36eb3..b5624c9fe09bf7 100644
--- a/arch/powerpc/include/asm/cmpxchg.h
+++ b/arch/powerpc/include/asm/cmpxchg.h
@@ -163,7 +163,7 @@ __xchg_local(void *ptr, unsigned long x, unsigned int size)
 		return __xchg_u64_local(ptr, x);
 #endif
 	}
-	BUILD_BUG_ON_MSG(1, "Unsupported size for __xchg");
+	BUILD_BUG_ON_MSG(1, "Unsupported size for __xchg_local");
 	return x;
 }
 
@@ -182,7 +182,7 @@ __xchg_relaxed(void *ptr, unsigned long x, unsigned int size)
 		return __xchg_u64_relaxed(ptr, x);
 #endif
 	}
-	BUILD_BUG_ON_MSG(1, "Unsupported size for __xchg_local");
+	BUILD_BUG_ON_MSG(1, "Unsupported size for __xchg_relaxed");
 	return x;
 }
 #define arch_xchg_local(ptr,x)						     \
-- 
2.34.1

