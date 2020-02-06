Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 235D8155C6B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 18:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25AFE6EAEF;
	Fri,  7 Feb 2020 17:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43AF6E288
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 19:30:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s10so1276621wmh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 11:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=WVXxvdnecOHHPSMEpYhU98LOQNanSGQy7dqix/yCj14=;
 b=rld0aMEN8ENxF6NsO4UBquyzfTqkVnCfO4ttYXcOnQTIiZ2T5BaetOtb+iUxm/digi
 GwXCxFCbf5j7C0+xHtVjg/+qN5LphmxCz9rsPcbNeGphW/jgXiPcz7/K3138J67nxkND
 EIuIdsyJlk+291aRA0ZRZ/5N9If1Qn61r1QrWBc3V4pDnKy8msHD7ha2d/bAk+c4bfho
 hXyIwWkkpmAKSbwU4S4ijV78TN4d5cq0w4L39UqKbj974eX5quRRnA9eRK0H0TNqIBj1
 N2Zusf3OCJYB9fL/YJ7cLFTCgkHzuRC70YInw8O98N6xfPJ+D+NAJ8adRhFlQi2RexSC
 rx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WVXxvdnecOHHPSMEpYhU98LOQNanSGQy7dqix/yCj14=;
 b=VdGApUBxlcUR1RZXGAKPiONpyBO4HlQfix5txvFp7dzWGeBF5koxpyTaCClXOz4J1q
 DBEv/NL1uvNbldO9Cqua4O7eW0zBQTRAXx/F4b2LOwQns8Bjx+0wsMNhfUVVJy6UkVF9
 gzO55+Cnhbgb5/hwigjdHZVrCgqGt0KQSuw52pXaPJuC35FQNOiK388dP9eQvtvYrdcA
 Zl1xMXBiyccnKQDAymFqkzcm0GQcxQJlS/ZFhJq1S+wzFZEvAvDR2lU7YNAkBrdSdv8n
 s3vS2wbudMdOc+05ixVueP5C53UMpOANo5uo94dsr6UXXa5tlrg01BdOa4/HRdjNTed4
 CJvQ==
X-Gm-Message-State: APjAAAXAqM//M4PxFcTyK0GNoD3WIKxjEk3FYZHKx8yd5+EEOq/3aQLU
 MIwvr4fMVJmfIW0cTx2lz6c=
X-Google-Smtp-Source: APXvYqyUtf3IIJnos/BEz0mLtu3pt+RIDgoWIXskDhqxOOYrmnTSVr7eGt0o8sCfa5DWMJh0NB1Jvg==
X-Received: by 2002:a5d:484f:: with SMTP id n15mr3249087wrs.365.1581017442402; 
 Thu, 06 Feb 2020 11:30:42 -0800 (PST)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id b128sm537014wmb.25.2020.02.06.11.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 11:30:41 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: c-r4k: Invalidate BMIPS5000 ZSCM prefetch lines
Date: Thu,  6 Feb 2020 14:30:37 -0500
Message-Id: <20200206193037.32041-1-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 07 Feb 2020 17:01:42 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Paul Burton <paulburton@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, James Hogan <jhogan@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zephyr secondary cache is 256KB, 128B lines. 32B sectors. A secondary cache
line can contain two instruction cache lines (64B), or four data cache
lines (32B). Hardware prefetch Cache detects stream access, and prefetches
ahead of processor access. Add support to inavalidate BMIPS5000 cpu zephyr
secondary cache module (ZSCM) on DMA from device so that data returned is
coherent during DMA read operations.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 arch/mips/mm/c-r4k.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 5f3d0103b95d..2d8892ba68ab 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -901,6 +901,35 @@ static void r4k_dma_cache_wback_inv(unsigned long addr, unsigned long size)
 	__sync();
 }
 
+static void prefetch_cache_inv(unsigned long addr, unsigned long size)
+{
+	unsigned int linesz = cpu_scache_line_size();
+	unsigned long addr0 = addr, addr1;
+	int cpu_type = current_cpu_type();
+
+	if (cpu_type == CPU_BMIPS5000) {
+		/* invalidate zephyr secondary cache module prefetch lines */
+		addr0 &= ~(linesz - 1);
+		addr1 = (addr0 + size - 1) & ~(linesz - 1);
+
+		protected_writeback_scache_line(addr0);
+		if (likely(addr1 != addr0))
+			protected_writeback_scache_line(addr1);
+		else
+			return;
+
+		addr0 += linesz;
+		if (likely(addr1 != addr0))
+			protected_writeback_scache_line(addr0);
+		else
+			return;
+
+		addr1 -= linesz;
+		if (likely(addr1 > addr0))
+			protected_writeback_scache_line(addr0);
+	}
+}
+
 static void r4k_dma_cache_inv(unsigned long addr, unsigned long size)
 {
 	/* Catch bad driver code */
@@ -908,6 +937,7 @@ static void r4k_dma_cache_inv(unsigned long addr, unsigned long size)
 		return;
 
 	preempt_disable();
+	prefetch_cache_inv(addr, size);
 	if (cpu_has_inclusive_pcaches) {
 		if (size >= scache_size) {
 			if (current_cpu_type() != CPU_LOONGSON64)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
