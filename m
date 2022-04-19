Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D131507389
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E621C10F11A;
	Tue, 19 Apr 2022 16:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6537310F11B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:44:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC19861879;
 Tue, 19 Apr 2022 16:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6062FC385A5;
 Tue, 19 Apr 2022 16:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386683;
 bh=XdueS6o3x8Genbrjo7SphR5bJ8o+YLBkmS/22/Y/tzI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YXQtUJB7B4bM52daStJxTBrA8/zErvRHpHn2okco8xXiPRjGGTcMxZ34F9ihe2zZF
 1BoMvocNKdvX/A7Mn4lmcao9QbvEfofhr0515a2QLJ4e/1ti5g/eDZCmDNi5sdZR/I
 9XNG+Otrayi6yRijGpRrnLzixoTgFiEZlFFL/2ise5K7ONOzh9kv641LscK+chNQJ7
 Q9EFuzcxnFtDUtDisGrueMKhbPDgR4AstoPr4QwJ7WiTnp9E3XeIFc84uL5FnW7uoT
 5DjaGzrz2kHiXzQHJSz/k+R25fFOoMSH+WeElYMHF7zCHXx8w3wvu8Yx03jMnZvboF
 gxYGbk6+OLuAg==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 45/48] ARM: PXA: fix multi-cpu build of xsc3
Date: Tue, 19 Apr 2022 18:38:07 +0200
Message-Id: <20220419163810.2118169-46-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 Tomas Cech <sleep_walker@suse.com>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

On a kernel that includes both ARMv4 and XScale support,
the copypage function fails to build with invalid
instructions.

Since these are only called on an actual XScale processor,
annotate the assembly with the correct .arch directive.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mm/copypage-xsc3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mm/copypage-xsc3.c b/arch/arm/mm/copypage-xsc3.c
index 6f0909dda2f9..c86e79677ff9 100644
--- a/arch/arm/mm/copypage-xsc3.c
+++ b/arch/arm/mm/copypage-xsc3.c
@@ -29,6 +29,7 @@ static void xsc3_mc_copy_user_page(void *kto, const void *kfrom)
 	int tmp;
 
 	asm volatile ("\
+.arch xscale					\n\
 	pld	[%1, #0]			\n\
 	pld	[%1, #32]			\n\
 1:	pld	[%1, #64]			\n\
@@ -80,6 +81,7 @@ void xsc3_mc_clear_user_highpage(struct page *page, unsigned long vaddr)
 {
 	void *ptr, *kaddr = kmap_atomic(page);
 	asm volatile ("\
+.arch xscale					\n\
 	mov	r1, %2				\n\
 	mov	r2, #0				\n\
 	mov	r3, #0				\n\
-- 
2.29.2

