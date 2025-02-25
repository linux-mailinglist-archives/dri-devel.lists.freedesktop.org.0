Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E5CA44698
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7490510E1E8;
	Tue, 25 Feb 2025 16:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MA6MMRDX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D025A10E1EA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:44:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 64991612A6;
 Tue, 25 Feb 2025 16:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173F6C4CEE8;
 Tue, 25 Feb 2025 16:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740501887;
 bh=umjlhfwoNuI5CMD+RXjw4fLXJjEg7D7r1hkXotSNbkc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MA6MMRDXJf60FK4j/aDYVV1S55LNYVR3sbzY7LqBlyhkusm3n2iQLV/00Qt8rYsw+
 ivHvE5uQfUJr6mbKVXNDQHEjAxqn97j/htT+98MJF9BLikRiPWw5Rx4KeW7ntbPRkY
 6sM6RnS0vLcHcRdIaA0ivhhvanQ1wHa9j/1G4gYlmd2BN7XpabxgX79Im3Ht8t9PoA
 V7Yeh3SXvs2nU/2z7KG/SwS+O1CDrrssV2wtBrNeWH1v2yJPl7cVDHSpeQnTtfrRQl
 malN7x9n65EHQfH+gWdJRunhE3NdgN6EfURBaF6ha8KskkdVMpwuVt4fOmBgFT+pH4
 P6Qfi03dRhHDg==
From: Arnd Bergmann <arnd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: kernel test robot <lkp@intel.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dummycon: fix default rows/cols
Date: Tue, 25 Feb 2025 17:44:22 +0100
Message-Id: <20250225164436.56654-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250225164436.56654-1-arnd@kernel.org>
References: <20250225164436.56654-1-arnd@kernel.org>
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

From: Arnd Bergmann <arnd@arndb.de>

dummycon fails to build on ARM/footbridge when the VGA console is
disabled, since I got the dependencies slightly wrong in a previous
patch:

drivers/video/console/dummycon.c: In function 'dummycon_init':
drivers/video/console/dummycon.c:27:25: error: 'CONFIG_DUMMY_CONSOLE_COLUMNS' undeclared (first use in this function); did you mean 'CONFIG_DUMMY_CONSOLE'?
   27 | #define DUMMY_COLUMNS   CONFIG_DUMMY_CONSOLE_COLUMNS
drivers/video/console/dummycon.c:28:25: error: 'CONFIG_DUMMY_CONSOLE_ROWS' undeclared (first use in this function); did you mean 'CONFIG_DUMMY_CONSOLE'?
   28 | #define DUMMY_ROWS      CONFIG_DUMMY_CONSOLE_ROWS

This only showed up after many thousand randconfig builds on Arm, and
doesn't matter in practice, but should still be fixed. Address it by
using the default row/columns on footbridge after all in that corner
case.

Fixes: 4293b0925149 ("dummycon: limit Arm console size hack to footbridge")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409151512.LML1slol-lkp@intel.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/console/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index 1c4263c164ce..ea4863919eb9 100644
--- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -51,7 +51,7 @@ config DUMMY_CONSOLE
 
 config DUMMY_CONSOLE_COLUMNS
 	int "Initial number of console screen columns"
-	depends on DUMMY_CONSOLE && !ARCH_FOOTBRIDGE
+	depends on DUMMY_CONSOLE && !(ARCH_FOOTBRIDGE && VGA_CONSOLE)
 	default 160 if PARISC
 	default 80
 	help
@@ -61,7 +61,7 @@ config DUMMY_CONSOLE_COLUMNS
 
 config DUMMY_CONSOLE_ROWS
 	int "Initial number of console screen rows"
-	depends on DUMMY_CONSOLE && !ARCH_FOOTBRIDGE
+	depends on DUMMY_CONSOLE && !(ARCH_FOOTBRIDGE && VGA_CONSOLE)
 	default 64 if PARISC
 	default 30 if ARM
 	default 25
-- 
2.39.5

