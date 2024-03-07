Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA65F874AEF
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 10:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30C1113733;
	Thu,  7 Mar 2024 09:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05805113733
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 09:35:38 +0000 (UTC)
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by cantor.telenet-ops.be (Postfix) with ESMTPS id 4Tr40m3cZDz4wxbG
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 10:35:36 +0100 (CET)
Received: from ramsan.of.borg ([84.195.187.55])
 by albert.telenet-ops.be with bizsmtp
 id vlbb2B00K1C8whw06lbbx4; Thu, 07 Mar 2024 10:35:36 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1riA9q-002dLQ-BJ;
 Thu, 07 Mar 2024 10:35:35 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1riAA3-00FN5Y-Gh;
 Thu, 07 Mar 2024 10:35:35 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-m68k@lists.linux-m68k.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: pgtable: Add missing #include <asm/page.h>
Date: Thu,  7 Mar 2024 10:35:30 +0100
Message-Id: <ba359be013f379ff10f3afcea13e2f78dd9717be.1709804021.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
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

When just including <linux/pgtable.h>:

    include/asm-generic/pgtable-nop4d.h:9:18: error: unknown type name ‘pgd_t’
	9 | typedef struct { pgd_t pgd; } p4d_t;
	  |                  ^~~~~

Make <asm/pgtable.h> self-contained by including <asm/page.h>.

Reported-by: Jani Nikula <jani.nikula@intel.com>
Closes: https://lore.kernel.org/r/878r2uxwha.fsf@intel.com
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Jani: Feel free to pick this up as a dependency.
Else I will queue this in the m68k tree for v6.10.

 arch/m68k/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/include/asm/pgtable.h b/arch/m68k/include/asm/pgtable.h
index 27525c6a12fd0c7f..49fcfd7348600594 100644
--- a/arch/m68k/include/asm/pgtable.h
+++ b/arch/m68k/include/asm/pgtable.h
@@ -2,6 +2,8 @@
 #ifndef __M68K_PGTABLE_H
 #define __M68K_PGTABLE_H
 
+#include <asm/page.h>
+
 #ifdef __uClinux__
 #include <asm/pgtable_no.h>
 #else
-- 
2.34.1

