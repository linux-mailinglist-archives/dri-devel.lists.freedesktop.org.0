Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEF57DDE44
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 10:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2A810E00C;
	Wed,  1 Nov 2023 09:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EC110E00C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 09:18:40 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D612C1B3C;
 Wed,  1 Nov 2023 10:18:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1698830302;
 bh=4dopl98SADPr+tiIFKErvb5eH1nysDYoa2k3ZOY9EwM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ZWszpq8oUANaP/RXTq+8FXQitKO5TmuevctXURULcSLeo0/8ZDCk9+mOfMsbYsrXP
 Ir47j0MBSyVwibN3gBjdS5yGtYdAtlEYfrvQ0gaA0xC2lp9ws82xRyGi79k+QwXrMv
 HJ1SLaOFbF0r5bdjEt/8NUty0KxuX/9rfHWFVGAs=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 01 Nov 2023 11:17:43 +0200
Subject: [PATCH 06/10] drm/tidss: Check for K2G in in dispc_softreset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231101-tidss-probe-v1-6-45149e0f9415@ideasonboard.com>
References: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
In-Reply-To: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=4dopl98SADPr+tiIFKErvb5eH1nysDYoa2k3ZOY9EwM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlQhfnt2zJRKYOEVKle2omRjKY4to5bnItY7yFV
 UBMKQX0yUGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUIX5wAKCRD6PaqMvJYe
 9YfsD/0RXpaIgePYT1v7DAYeRrhQdYLoVaUMtVgsDAY4cJD5eEkA66MdctQi73YMwSZ5NOwdyjh
 lu+geIwMOA5veWkJoF1elBDtFM0v654tsHaYcnJFlDauFOebKT1YjIxTlEEsus1ZdA4m79gP+L6
 aH1OF0PVmMmhx98F3/COFwgKb7m8V1vplYZrZ0YNcMlji5VpzNd4g50SsE6Z2A3P2ci/i8X/smY
 x3WUxrdlbRDbXyKCoLbCYXlShIFK0ow65O6uT3jTMl4FjbY2aKkUHGHoTgOGoZ91VxWgtcztj+f
 76WWHvhG0LBIWY9vFkwEToQXqlPv8CS1cOuTUKjL6mirU7HdnJkIpx+XyHUJngnA9uh552jIM8G
 8f8nWWlMgxAteilgs7C3PCOCXu2u7B/6lHYiXZLdOAoRQufVSHx+nOuSL5MsyTCexCk1K9IVsWg
 ok6X7WI9yYtF9Z9xDK91a2FV+JgiO22/Y1rN2B3N6KkpXARyzC8NFL+JrFxnEn2fZgI4aWCDMcn
 +kZDSyVvNuwZyt9e4ABFpTbrZ2P05PXiVKtyFQfKFI+yc6gU8S8LEkrBTS9nY5fiKgZuJJs39sF
 J0RjkNOPS9ycQTTKW4mk8WuPAcv5HowYqIgv3EtuJgsKIBz+eoOjKuABSZa9LBexI6RxgLjfjMj
 peHnDQyTmxnO5nA==
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

K2G doesn't have softreset feature. Instead of having every caller of
dispc_softreset() check for K2G, move the check into dispc_softreset(),
and make dispc_softreset() return 0 in case of K2G.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index cdbb88289082..f204a0701e9f 100644
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
@@ -2831,12 +2835,9 @@ int dispc_init(struct tidss_device *tidss)
 
 	tidss->dispc = dispc;
 
-	/* K2G display controller does not support soft reset */
-	if (feat->subrev != DISPC_K2G) {
-		r = dispc_softreset(dispc);
-		if (r)
-			return r;
-	}
+	r = dispc_softreset(dispc);
+	if (r)
+		return r;
 
 	return 0;
 }

-- 
2.34.1

