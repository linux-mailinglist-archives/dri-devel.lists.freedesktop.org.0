Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5554B41B47
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 12:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E059610E672;
	Wed,  3 Sep 2025 10:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="LJoHRHjv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5F110E672
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 10:09:55 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 583A9YU73203122;
 Wed, 3 Sep 2025 05:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1756894174;
 bh=slRkOAjbwsQJ9PNnE2zqAAP48jTqeSs0ZLjOG/bAxJU=;
 h=From:To:CC:Subject:Date;
 b=LJoHRHjv6/oJwER7btyTVw99cg1zYCh6N7ADhJC1xMJ9FAsyPe+0WNiEEtFnDBRVD
 fSTPN2NAJa4x3wEWbTEUeQmMdNDglbdTkVMwNoE2zerL18EhZa8lV5TmfKNmvcvw5e
 M10Js9UNgA2502bsWxVC8AiP9VdqYjmzhGP5QCjY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 583A9YWW3523442
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 3 Sep 2025 05:09:34 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 05:09:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 05:09:33 -0500
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 583A9TG11114995;
 Wed, 3 Sep 2025 05:09:30 -0500
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <bparrot@ti.com>, <sam@ravnborg.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <h-shenoy@ti.com>
Subject: [PATCH] drm/tidss: Update Videoport SYNC LOST IRQ bit
Date: Wed, 3 Sep 2025 15:39:29 +0530
Message-ID: <20250903100929.2598626-1-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Update VP SYNC LOST Bit as per register description for
DSS0_COMMON_VP_IRQENABLE_0 give in TRM.

Link:https://www.ti.com/lit/zip/spruil1/SPRUIL_DRA829_TDA4VM
Table 12-597. DSS0_COMMON_VP_IRQENABLE_0

Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")

Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
---
 drivers/gpu/drm/tidss/tidss_irq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_irq.h b/drivers/gpu/drm/tidss/tidss_irq.h
index dd61f645f662..0194010a7fff 100644
--- a/drivers/gpu/drm/tidss/tidss_irq.h
+++ b/drivers/gpu/drm/tidss/tidss_irq.h
@@ -53,7 +53,7 @@ static inline dispc_irq_t DSS_IRQ_PLANE_MASK(u32 plane)
 #define DSS_IRQ_VP_FRAME_DONE(ch)	DSS_IRQ_VP_BIT((ch), 0)
 #define DSS_IRQ_VP_VSYNC_EVEN(ch)	DSS_IRQ_VP_BIT((ch), 1)
 #define DSS_IRQ_VP_VSYNC_ODD(ch)	DSS_IRQ_VP_BIT((ch), 2)
-#define DSS_IRQ_VP_SYNC_LOST(ch)	DSS_IRQ_VP_BIT((ch), 3)
+#define DSS_IRQ_VP_SYNC_LOST(ch)	DSS_IRQ_VP_BIT((ch), 4)
 
 #define DSS_IRQ_PLANE_FIFO_UNDERFLOW(plane)	DSS_IRQ_PLANE_BIT((plane), 0)
 
-- 
2.34.1

