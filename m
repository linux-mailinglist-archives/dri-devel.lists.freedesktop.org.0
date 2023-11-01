Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BECFB7DDE43
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 10:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A9010E057;
	Wed,  1 Nov 2023 09:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451B310E674
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 09:18:39 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13D1CEBA;
 Wed,  1 Nov 2023 10:18:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1698830301;
 bh=S/kuLWe0/nj3sw3ZBJIao5fLsRqSmlViPlkeBKEBUQc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=no3GrqbzK1UujstiZXCJVuUv7Mcpud6+l24s6as4ZbU3u/oLVHB2tRotlu5k19KxN
 9+idXiFKTkvtoFWQTKaQg+q4Fg+JF2djnc7v47c1BB78L3apgD4PTQoG8h4MWF0/E8
 fq+AP+6rSrszotUKmJIbcidaz/yWwEB1nZkFgf5A=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 01 Nov 2023 11:17:42 +0200
Subject: [PATCH 05/10] drm/tidss: Return error value from from softreset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231101-tidss-probe-v1-5-45149e0f9415@ideasonboard.com>
References: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
In-Reply-To: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1510;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=S/kuLWe0/nj3sw3ZBJIao5fLsRqSmlViPlkeBKEBUQc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlQhfnWpbjq0FmByn/it3hJbiT/5wcGPbCtB5wx
 x/FViL/nd6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUIX5wAKCRD6PaqMvJYe
 9dMMEACfTV1kbW+dXwkE+Qjo8LSLkYv9SpTgPBR2Aa2pKpVsSVrR24lTlZSPr6rfbfSq6DiEsJa
 1xWCBXpIDJKRpGMC71F1eJcxEM/LFAyheLlaUDWVVZHvpoBykIFdu3IM2uOj5YEJaK+eLfTbo8j
 sFAifLjFZW+jAlPewmtsrdoJ20STrj79yQfz+ecehp77UJqn4FUu8fKfC5iIunWSep4dVUAwBAI
 /0+rDy5391vbYY2goyXY5cJxC2WlCBkpLJtsdG1r9q7+axeas8KQ0L8K3HYe6P6iXNBIn+WKqku
 qLmbiveR+PKQ5KPYw0ZsQbm2t4ezTAMWbDob4p4GdPQ81ohHXXoVLLTjSMjPrU5fhDs612gj5mW
 EBsW0cTro9V3xSrn1UaWbU3fbeVNNPvUWGgIJDwVUVvZS8a3MC7idRsBtEebC0WbyoJTNTppaj5
 d4Jv0JyJRmmTjZS4UgBRDXTypb3cVtjduQsGDXO/dMzUNWTfTgajF4kpAHxLPEVjurFEG3UfKFT
 YB3SAOsioj5XqH/iuwVRPBJNCdgANWh7mKdfwpi0M30yIfYSxGQJVkIOTzgJIc3unWGDZtKIBZI
 SrxLgRFRCty2R315gM9q5PKubhO5LKDUa9/dXPECgzXeytBXsL7X4uy5tOxGA6O2N4j4F/jtsOw
 GUNWxx5r7tmjHuw==
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

Return an error value from dispc_softreset() so that the caller can
handle the errors.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 9430625e2d62..cdbb88289082 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -2702,7 +2702,7 @@ static void dispc_init_errata(struct dispc_device *dispc)
 	}
 }
 
-static void dispc_softreset(struct dispc_device *dispc)
+static int dispc_softreset(struct dispc_device *dispc)
 {
 	u32 val;
 	int ret;
@@ -2712,8 +2712,12 @@ static void dispc_softreset(struct dispc_device *dispc)
 	/* Wait for reset to complete */
 	ret = readl_poll_timeout(dispc->base_common + DSS_SYSSTATUS,
 				 val, val & 1, 100, 5000);
-	if (ret)
-		dev_warn(dispc->dev, "failed to reset dispc\n");
+	if (ret) {
+		dev_err(dispc->dev, "failed to reset dispc\n");
+		return ret;
+	}
+
+	return 0;
 }
 
 int dispc_init(struct tidss_device *tidss)
@@ -2828,8 +2832,11 @@ int dispc_init(struct tidss_device *tidss)
 	tidss->dispc = dispc;
 
 	/* K2G display controller does not support soft reset */
-	if (feat->subrev != DISPC_K2G)
-		dispc_softreset(dispc);
+	if (feat->subrev != DISPC_K2G) {
+		r = dispc_softreset(dispc);
+		if (r)
+			return r;
+	}
 
 	return 0;
 }

-- 
2.34.1

