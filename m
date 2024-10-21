Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DC89A6B9F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 16:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8967710E533;
	Mon, 21 Oct 2024 14:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EDpDAXaJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0137010E524
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 14:08:20 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A96A01A37;
 Mon, 21 Oct 2024 16:06:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1729519594;
 bh=IUMNEAvo290khRZh9z7VJP/IFs8nq3LUEXQk5ge19vg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=EDpDAXaJKRLnbe1mHspqU8ZHw4u79YMPYDN4+ed/4NF5AppC4vdKqOOaqcqIl3hzQ
 lPXdgY5vrZK0snIxRD0TeQpKpObT7keeKroUPpoh87l5p/u56y5qTt2KBn8hp6jmZ9
 owhNhCKF5+6FtxbpZK9UqLt4bbDlKkziFRdf4L2s=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 21 Oct 2024 17:07:49 +0300
Subject: [PATCH 5/7] drm/tidss: Clear the interrupt status for interrupts
 being disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-tidss-irq-fix-v1-5-82ddaec94e4a@ideasonboard.com>
References: <20241021-tidss-irq-fix-v1-0-82ddaec94e4a@ideasonboard.com>
In-Reply-To: <20241021-tidss-irq-fix-v1-0-82ddaec94e4a@ideasonboard.com>
To: Devarsh Thakkar <devarsht@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jonathan Cormier <jcormier@criticallink.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2574;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=6GwpZAEtux7Bj7g4mSltZcfqft3v17bYy0VmOFldnf0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnFmBODQnh5GB565MHl21A3bV188NxrRKELGA+w
 iKNyiRnU1mJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZxZgTgAKCRD6PaqMvJYe
 9XDuD/9bhlDfWWlSRHjmPYpcwrqbB6WCgpk35PnSJvY5NBPD7Q8787LL9qoFne+VIQRgldrTTVi
 dvzbIPZEbv5OLIVeck5+JnR6bQSsdO+3QdiFXHAQo6JRgsIcWi/LmmQzqqhWONHgikqsJpb7YyI
 H6+s/1UwliotxpWCm5+waN3pqUvMbqQlTUm2Gc9KEDPlBwh410tW+zH9YtMTaM7GuINJZxn4iMS
 hA7a1rsZeU7n8zGH1UwyZCJ0WDniX6SitrwtyKMDaWu2HBcPXet8fLGy6chdZbqPVRdYZBx0zJN
 D5xKs20pUCU3qDHoMK2iXfJkNXCk5ttcZvg8k0LFiz/xWSdH5AkHIJWiSoSqrM7OwIvu/sY4cAJ
 +ns9J51IKBoDWkUPGtYn3X2a/GrPoW8HFsM1oOKXydbg3HaG+Ds6IHKqJt6GzaSUjYn18D22/CM
 gVtPqGqf+3i5wyEDz3IXmkNHph1etIG3o32lYFjbkDkkpywL65BEUY/nDKvsvwYkfV65FepZ12p
 V2vHf/5L/pAYKrSuMSpQQhZH/1IkdfteZO7df87bI3BHxdPi+0zoJyKdUCsKWshlklmBdnJAB00
 hjP/EwkI4IL+aP4y7Os7Xaw7Nnoko9qx+NhKGFihixwlsxeJnsb7EtO/EsbxeMae5OxdmfwbOqX
 7kfP6QvxzfjryrA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

From: Devarsh Thakkar <devarsht@ti.com>

The driver does not touch the irqstatus register when it is disabling
interrupts.  This might cause an interrupt to trigger for an interrupt
that was just disabled.

To fix the issue, clear the irqstatus registers right after disabling
the interrupts.

Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
Cc: stable@vger.kernel.org
Reported-by: Jonathan Cormier <jcormier@criticallink.com>
Closes: https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1394222/am625-issue-about-tidss-rcu_preempt-self-detected-stall-on-cpu/5424479#5424479
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
[Tomi: mostly rewrote the patch]
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 99a1138f3e69..515f82e8a0a5 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -700,7 +700,7 @@ void dispc_k2g_set_irqenable(struct dispc_device *dispc, dispc_irq_t mask)
 {
 	dispc_irq_t old_mask = dispc_k2g_read_irqenable(dispc);
 
-	/* clear the irqstatus for newly enabled irqs */
+	/* clear the irqstatus for irqs that will be enabled */
 	dispc_k2g_clear_irqstatus(dispc, (mask ^ old_mask) & mask);
 
 	dispc_k2g_vp_set_irqenable(dispc, 0, mask);
@@ -708,6 +708,9 @@ void dispc_k2g_set_irqenable(struct dispc_device *dispc, dispc_irq_t mask)
 
 	dispc_write(dispc, DISPC_IRQENABLE_SET, (1 << 0) | (1 << 7));
 
+	/* clear the irqstatus for irqs that were disabled */
+	dispc_k2g_clear_irqstatus(dispc, (mask ^ old_mask) & old_mask);
+
 	/* flush posted write */
 	dispc_k2g_read_irqenable(dispc);
 }
@@ -837,7 +840,7 @@ static void dispc_k3_set_irqenable(struct dispc_device *dispc,
 
 	old_mask = dispc_k3_read_irqenable(dispc);
 
-	/* clear the irqstatus for newly enabled irqs */
+	/* clear the irqstatus for irqs that will be enabled */
 	dispc_k3_clear_irqstatus(dispc, (old_mask ^ mask) & mask);
 
 	for (i = 0; i < dispc->feat->num_vps; ++i) {
@@ -862,6 +865,9 @@ static void dispc_k3_set_irqenable(struct dispc_device *dispc,
 	if (main_disable)
 		dispc_write(dispc, DISPC_IRQENABLE_CLR, main_disable);
 
+	/* clear the irqstatus for irqs that were disabled */
+	dispc_k3_clear_irqstatus(dispc, (old_mask ^ mask) & old_mask);
+
 	/* Flush posted writes */
 	dispc_read(dispc, DISPC_IRQENABLE_SET);
 }

-- 
2.43.0

