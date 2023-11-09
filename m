Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 488627E6477
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 08:39:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBA910E1C8;
	Thu,  9 Nov 2023 07:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E432110E1CD
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 07:38:48 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 329FF1B44;
 Thu,  9 Nov 2023 08:38:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1699515505;
 bh=ea9sAgDoBLxTb7N3GvFQ0oKnHf7196fJPgOxmwvSZWc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hLtHiFr71+P5vgrZ+dKQf7om6zS0BgGAJQVg9fK3rq1E4HvoTsJTnmRl3qL0TBtHP
 E2nTZlx12cWoAHnfLpELkmpUtVlXSVypPbWH63rOxsesdUion/OIfwPLMndqK+IyvY
 a+tsPd2pDcVigeq7xdjQ9dLSUoaZrnM/2xZviThg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 09 Nov 2023 09:37:59 +0200
Subject: [PATCH v2 06/11] drm/tidss: Check for K2G in in dispc_softreset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-tidss-probe-v2-6-ac91b5ea35c0@ideasonboard.com>
References: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
In-Reply-To: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ea9sAgDoBLxTb7N3GvFQ0oKnHf7196fJPgOxmwvSZWc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlTIx/zx8GTBnJK+j6YOO7FS+lZfIy9XVNj7BaH
 60HV9E1MpiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUyMfwAKCRD6PaqMvJYe
 9aoGEACKfzf+D8s4b0/ya3e1Ml+zOzyDtczeaI4kg4X8rD+yP5JMDDWJijlclGiJd57H5JiFhMH
 qTJkKVMU0HnA7TtYx6DZlJai9nAH6hcn6IxPk8+LWiDlYe0DbBlT/yl2C2FufIsc+q5X1Fn6O0a
 An/+loDGcSk+8z9fiDa/AiwwUlK0UxLNguhhheHAFRdBNHiIjvtZTrjji6uqwoQu67H+vgx9OTm
 C2Y1anUYygx4spYEMezC5rpm784DvRF5FEVBqsauHu4mikOO+c2gl6fXt/4Lfm+ht1S/WT6becM
 VZoTq4IqqW2tDJqlBbn7gtXOx+NvPxFJ+ja03OI2Ta96J0xaJ2zrVxaj19HYSJOSuUMlZVSSgxR
 UB5EszdFK+e12/P1mfZc8VrqPJu+SwCwYX6wnGGHUgLNgKUmtWh0HDoI5JlicXNlbS0sooEpDaR
 qrclD2NJ+tM8dzBcNvX28VqPURvUdOCboQsmZu7e72+Eg2BdLJ+hExUYsRCMPxZzFnT/5DmH+6r
 d/zLi3aYsejHE0h2ni+Tf77eb8mAKPz4gob/rYqAICVJDLgBfK3je+exd8JhoxjnRWVUnkFVYNM
 90QelrNnZphKq6ggT6b4b+56GtC/EMuWNGfRV04ixGV3WkWLCNWf1HbP9uY7+onoIKdtPu/EH/W
 FM2bYzO6C+3GDBg==
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Francesco Dolcini <francesco@dolcini.it>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

K2G doesn't have softreset feature. Instead of having every caller of
dispc_softreset() check for K2G, move the check into dispc_softreset(),
and make dispc_softreset() return 0 in case of K2G.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 50b475b285d9..c82fd5bc9be4 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -2707,6 +2707,10 @@ static int dispc_softreset(struct dispc_device *dispc)
 	u32 val;
 	int ret;
 
+	/* K2G display controller does not support soft reset */
+	if (dispc->feat->subrev == DISPC_K2G)
+		return 0;
+
 	/* Soft reset */
 	REG_FLD_MOD(dispc, DSS_SYSCONFIG, 1, 1, 1);
 	/* Wait for reset to complete */
@@ -2829,12 +2833,9 @@ int dispc_init(struct tidss_device *tidss)
 	of_property_read_u32(dispc->dev->of_node, "max-memory-bandwidth",
 			     &dispc->memory_bandwidth_limit);
 
-	/* K2G display controller does not support soft reset */
-	if (feat->subrev != DISPC_K2G) {
-		r = dispc_softreset(dispc);
-		if (r)
-			return r;
-	}
+	r = dispc_softreset(dispc);
+	if (r)
+		return r;
 
 	tidss->dispc = dispc;
 

-- 
2.34.1

