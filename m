Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCEE5851C9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 16:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA46510EDCD;
	Fri, 29 Jul 2022 14:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454DE10EDCD
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 14:46:19 +0000 (UTC)
Received: from sobremesa.fritz.box (unknown
 [IPv6:2a02:8010:65b5:0:bbb0:f8ec:7bc9:dbe4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C4FE86601B6F;
 Fri, 29 Jul 2022 15:46:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1659105977;
 bh=7dYXBTLFt1bkQVJYFJJsYXgVwOex0tytTWUZW19xrno=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nr2anNOPDgMlMr+0XIiuLtZGQn/7ml3FbjajPsALsb08IcQdauHXEMVKQ2SC7ixrk
 92kwCDRCqQMfqxJdF3332gk3UetspmiSrUMVJpVdPmhvA6rRP0FDy/pAuLlJnSCJrw
 cYUZovVFzmq2aLdBYgEzGbM/DpMyMWqYp5LuRDOS+9lWbs+LvAK0hCdpMvW8uMWNS4
 DRder6fLfzMVd+8wKaU6cr4y31tmw0PBxpryMZoaLZ+cVgSfqQX5m6DQnHf9R4Rpzc
 Q/Ue+MxDi11S8jV0P+sFrxZ9j6nXj+FgJK9QkHICrm37RuhCdJAQbvPnPpDCmEsOwd
 p+Tz7K3ObA8lQ==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v6 1/2] drm/panfrost: Add specific register offset macros for
 JS and MMU AS
Date: Fri, 29 Jul 2022 15:46:09 +0100
Message-Id: <20220729144610.2105223-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220729144610.2105223-1-adrian.larumbe@collabora.com>
References: <20220729144610.2105223-1-adrian.larumbe@collabora.com>
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
 drivers/gpu/drm/panfrost/panfrost_regs.h | 42 ++++++++++++++----------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index accb4fa3adb8..919f44ac853d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -226,23 +226,25 @@
 #define JOB_INT_MASK_DONE(j)		BIT(j)
 
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
+#define JS_SLOT_STRIDE			0x80
+
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
@@ -281,7 +283,9 @@
 #define AS_COMMAND_FLUSH_MEM		0x05	/* Wait for memory accesses to complete, flush all the L1s cache then
 						   flush all L2 caches then issue a flush region command to all MMUs */
 
-#define MMU_AS(as)			(0x2400 + ((as) << 6))
+#define MMU_BASE			0x2400
+#define MMU_AS_SHIFT			0x06
+#define MMU_AS(as)			(MMU_BASE + ((as) << MMU_AS_SHIFT))
 
 #define AS_TRANSTAB_LO(as)		(MMU_AS(as) + 0x00) /* (RW) Translation Table Base Address for address space n, low word */
 #define AS_TRANSTAB_HI(as)		(MMU_AS(as) + 0x04) /* (RW) Translation Table Base Address for address space n, high word */
@@ -300,6 +304,8 @@
 #define AS_FAULTEXTRA_LO(as)		(MMU_AS(as) + 0x38) /* (RO) Secondary fault address for address space n, low word */
 #define AS_FAULTEXTRA_HI(as)		(MMU_AS(as) + 0x3C) /* (RO) Secondary fault address for address space n, high word */
 
+#define MMU_AS_STRIDE			(1 << MMU_AS_SHIFT)
+
 /*
  * Begin LPAE MMU TRANSTAB register values
  */
-- 
2.37.0

