Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCE53E097A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 22:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225396E463;
	Wed,  4 Aug 2021 20:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58786E463;
 Wed,  4 Aug 2021 20:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=f9gSgEz86yFFQ7CEO9gWv946kye+BSxNr15YYmTIIXs=; b=f0EXkLpLotyGgBVVyg/MPMzSlF
 LikWAmrnOndI5J5MFM5sTgNa2lbW5/Ss/CBg+cDayuEShzqnOVS9XwYspfWfRdcas5pn4WgYFYLD1
 kaKaCzE5di9CjUHC5WDLjzEyjnil2p+ynAD4YEDuyfNJDcvgE1/qGmXQAOoF4aC4MR5FVskoHASlp
 7jQiMD+LhqqHgoFQmB9Xgw/l0yJqNbOWEu1HYUr7mwt3JNxfxHJ601QnhSXyoAtjfYDqX6HT8VpDX
 lJE+fku0pDff+4p5pqsjV3meVjN6Tr0hLbpjevBvWpNKhMM+w9TvDL8rG0OJhyAQiITf1xVDGTcvM
 HhGoo6sQ==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBNi1-007QAy-Pu; Wed, 04 Aug 2021 20:41:50 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH -next] drm/i915: fix i915_globals_exit() section mismatch error
Date: Wed,  4 Aug 2021 13:41:47 -0700
Message-Id: <20210804204147.2070-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix modpost Section mismatch error in i915_globals_exit().
Since both an __init function and an __exit function can call
i915_globals_exit(), any function that i915_globals_exit() calls
should not be marked as __init or __exit. I.e., it needs to be
available for either of them.

WARNING: modpost: vmlinux.o(.text+0x8b796a): Section mismatch in reference from the function i915_globals_exit() to the function .exit.text:__i915_globals_flush()
The function i915_globals_exit() references a function in an exit section.
Often the function __i915_globals_flush() has valid usage outside the exit section
and the fix is to remove the __exit annotation of __i915_globals_flush.

ERROR: modpost: Section mismatches detected.
Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.

Fixes: 1354d830cb8f ("drm/i915: Call i915_globals_exit() if pci_register_device() fails")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/i915/i915_globals.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linext-2021-0804.orig/drivers/gpu/drm/i915/i915_globals.c
+++ linext-2021-0804/drivers/gpu/drm/i915/i915_globals.c
@@ -138,7 +138,7 @@ void i915_globals_unpark(void)
 	atomic_inc(&active);
 }
 
-static void __exit __i915_globals_flush(void)
+static void  __i915_globals_flush(void)
 {
 	atomic_inc(&active); /* skip shrinking */
 
