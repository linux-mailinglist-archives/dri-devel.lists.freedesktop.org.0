Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 059E7C35FD9
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 15:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B95C10E776;
	Wed,  5 Nov 2025 14:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF80D10E771;
 Wed,  5 Nov 2025 14:12:34 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 9D2C53F072;
 Wed,  5 Nov 2025 15:12:31 +0100 (CET)
From: Simon Richter <Simon.Richter@hogyros.de>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Simon Richter <Simon.Richter@hogyros.de>,
	stable@vger.kernel.org
Subject: [PATCH] drm/xe: allow request_irq on GSC interrupt
Date: Wed,  5 Nov 2025 23:12:04 +0900
Message-ID: <20251105141220.2674-1-Simon.Richter@hogyros.de>
X-Mailer: git-send-email 2.47.3
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

The default flags for freshly allocated interrupts are platform dependent,
and apparently powerpc and arm set IRQ_NOREQUEST by default, and resets it
once setup is complete.

Most do this in the IRQ domain's "map" function. The xe driver does not
define a domain, so clear the NOREQUEST and NOAUTOEN flags as part of the
initialization. Also set NOPROBE -- it is doubtful this will ever be
relevant, but it seems correct for what is effectively a softirq.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6468
Fixes: 87a4c85d3a3ed579c86fd2612715ccb94c4001ff
Cc: <stable@vger.kernel.org> # v6.7+
Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
---
 drivers/gpu/drm/xe/xe_heci_gsc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index 2b3d49dd394c..b0e38bd2e6f8 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -40,6 +40,7 @@ static int heci_gsc_irq_init(int irq)
 	irq_set_chip_and_handler_name(irq, &heci_gsc_irq_chip,
 				      handle_simple_irq, "heci_gsc_irq_handler");
 
+	irq_modify_status(irq, IRQ_NOREQUEST | IRQ_NOAUTOEN, IRQ_NOPROBE);
 	return irq_set_chip_data(irq, NULL);
 }
 
-- 
2.47.3

