Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D13B554D7E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C7D1133BA;
	Wed, 22 Jun 2022 14:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E0D1133BA
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:36:33 +0000 (UTC)
Received: from sobremesa.fritz.box (82-69-11-11.dsl.in-addr.zen.co.uk
 [82.69.11.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D691F66016E2;
 Wed, 22 Jun 2022 15:36:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655908591;
 bh=nCCmQMPIHq06OpcXxNR1RiUPjmyOaPuD15KAnQr5LNE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MefR7xdpLvvlmKYgqO1+w8yfrz8yk7QCGxRpyzIDcNloS6gLmR/Szl6fD+xWlJahA
 1uJFh3ZgMCWl39mZEpK2mN1neKFHvonaSKDct+mKeDDBm5G426o3vN8CETKq8OJytJ
 qbfWREzhSB79/tcExuMCTqC2cxYEHIkE1GJAcztsZKQNdikl6du8A7EcII4mDcXhrp
 nat/p3eIgmg8OF8GpQddBJu/TEd9CXDs0X0U6iRny+ieEU74a2fQtvKuzeZsdwQ5ku
 0wjTizpg1jr+dwn6LOLbkTEsvUBwQo8lbHANl7JzONPX+V/V7B/EegtpTfOtWL7fwc
 5WsxSsSZPNy5Q==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/2] drm/panfrost: Add specific register offset macros for
 JS and MMU AS
Date: Wed, 22 Jun 2022 15:36:15 +0100
Message-Id: <20220622143616.1265405-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143616.1265405-1-adrian.larumbe@collabora.com>
References: <20220622143616.1265405-1-adrian.larumbe@collabora.com>
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
Cc: adrian.larumbe@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Each Panfrost job has its own job slot and MMU address space set of
registers, which are selected with a job-specific index.

Turn the shift and stride used for selection of the right register set base
into a define rather than using magic numbers.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_regs.h | 39 +++++++++++++-----------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index accb4fa3adb8..1ddc6c4c5e1c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -225,24 +225,26 @@
 #define JOB_INT_MASK_ERR(j)		BIT((j) + 16)
 #define JOB_INT_MASK_DONE(j)		BIT(j)
 
+#define JS_SLOT_STRIDE			0x80
+
 #define JS_BASE				0x1800
-#define JS_HEAD_LO(n)			(JS_BASE + ((n) * 0x80) + 0x00)
-#define JS_HEAD_HI(n)			(JS_BASE + ((n) * 0x80) + 0x04)
-#define JS_TAIL_LO(n)			(JS_BASE + ((n) * 0x80) + 0x08)
-#define JS_TAIL_HI(n)			(JS_BASE + ((n) * 0x80) + 0x0c)
-#define JS_AFFINITY_LO(n)		(JS_BASE + ((n) * 0x80) + 0x10)
-#define JS_AFFINITY_HI(n)		(JS_BASE + ((n) * 0x80) + 0x14)
-#define JS_CONFIG(n)			(JS_BASE + ((n) * 0x80) + 0x18)
-#define JS_XAFFINITY(n)			(JS_BASE + ((n) * 0x80) + 0x1c)
-#define JS_COMMAND(n)			(JS_BASE + ((n) * 0x80) + 0x20)
-#define JS_STATUS(n)			(JS_BASE + ((n) * 0x80) + 0x24)
-#define JS_HEAD_NEXT_LO(n)		(JS_BASE + ((n) * 0x80) + 0x40)
-#define JS_HEAD_NEXT_HI(n)		(JS_BASE + ((n) * 0x80) + 0x44)
-#define JS_AFFINITY_NEXT_LO(n)		(JS_BASE + ((n) * 0x80) + 0x50)
-#define JS_AFFINITY_NEXT_HI(n)		(JS_BASE + ((n) * 0x80) + 0x54)
-#define JS_CONFIG_NEXT(n)		(JS_BASE + ((n) * 0x80) + 0x58)
-#define JS_COMMAND_NEXT(n)		(JS_BASE + ((n) * 0x80) + 0x60)
-#define JS_FLUSH_ID_NEXT(n)		(JS_BASE + ((n) * 0x80) + 0x70)
+#define JS_HEAD_LO(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x00)
+#define JS_HEAD_HI(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x04)
+#define JS_TAIL_LO(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x08)
+#define JS_TAIL_HI(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x0c)
+#define JS_AFFINITY_LO(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x10)
+#define JS_AFFINITY_HI(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x14)
+#define JS_CONFIG(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x18)
+#define JS_XAFFINITY(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x1c)
+#define JS_COMMAND(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x20)
+#define JS_STATUS(n)			(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x24)
+#define JS_HEAD_NEXT_LO(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x40)
+#define JS_HEAD_NEXT_HI(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x44)
+#define JS_AFFINITY_NEXT_LO(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x50)
+#define JS_AFFINITY_NEXT_HI(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x54)
+#define JS_CONFIG_NEXT(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x58)
+#define JS_COMMAND_NEXT(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x60)
+#define JS_FLUSH_ID_NEXT(n)		(JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x70)
 
 /* Possible values of JS_CONFIG and JS_CONFIG_NEXT registers */
 #define JS_CONFIG_START_FLUSH_CLEAN		BIT(8)
@@ -281,7 +283,8 @@
 #define AS_COMMAND_FLUSH_MEM		0x05	/* Wait for memory accesses to complete, flush all the L1s cache then
 						   flush all L2 caches then issue a flush region command to all MMUs */
 
-#define MMU_AS(as)			(0x2400 + ((as) << 6))
+#define MMU_AS_SHIFT			0x06
+#define MMU_AS(as)			(0x2400 + ((as) << MMU_AS_SHIFT))
 
 #define AS_TRANSTAB_LO(as)		(MMU_AS(as) + 0x00) /* (RW) Translation Table Base Address for address space n, low word */
 #define AS_TRANSTAB_HI(as)		(MMU_AS(as) + 0x04) /* (RW) Translation Table Base Address for address space n, high word */
-- 
2.36.1

