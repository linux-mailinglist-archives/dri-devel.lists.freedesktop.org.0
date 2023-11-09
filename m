Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 723F87E6485
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 08:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DAB10E1D1;
	Thu,  9 Nov 2023 07:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E2710E1CC
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 07:38:48 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 546FA192B;
 Thu,  9 Nov 2023 08:38:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1699515505;
 bh=VZv+V3IKNcMeqSjrqpYywcyKWHFI9nt7knJQOXJX0vM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=qjxCD+ceAFZq3LYouJotO30GncXvPdnTefzEuEgBDOqHtKVVB+RZgA//m9RKzs2HY
 FOeWZfBz1kEhwD+5j3z/E49QGoId+fmqGJNWo1OY4V7Ck9VpkACnAQz2NyI6S1wOVR
 OaX/XlB6S7XUBtX1WDV5/VY+zJ3iuTE4uKB2KCns=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 09 Nov 2023 09:37:58 +0200
Subject: [PATCH v2 05/11] drm/tidss: Return error value from from softreset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-tidss-probe-v2-5-ac91b5ea35c0@ideasonboard.com>
References: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
In-Reply-To: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1539;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=VZv+V3IKNcMeqSjrqpYywcyKWHFI9nt7knJQOXJX0vM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlTIx/FF6QxSHj8qkvS1orhbruRNq/l+uSonfZ4
 /D5S5+WMyuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUyMfwAKCRD6PaqMvJYe
 9VKrEACnZABVQDSXZM2HMY8KEoDduklNACb3sB5wbNqXx6yhXF6Bfz8V0vXm/3WbnM/uj6Tf0is
 SkrFyj3F2oNfDrPUOcfRHyfKXg+4j8CDyvT4/ZEzkGeqTT6ZGGlix1sfmTaeWExckRGkaeDXmDc
 EtA1RTzyMdvaDZlf+iNff4B/tM4BhaE/QnL3zTPpmZhH0A8Vfim/ujER+PkSCQ9tYBMmL4Gz94R
 i2n0ZaJRIJsqTgKEPH8GQ7mHauo/bZfFyO2akOGfqhPi/e8mzkLSfTOEImKyuDHYNDgBhUCjsX+
 /ZuY57fGqk9F5F5WQtGGXiAS6CsD0rhCHzGdoA3rbgF0wXsFKFm/drOPiimrgUsuZxfixi6RQHP
 cNn+RqTm2R9vJCYESteB95Lv1634KsLUs5jmcMUgscfTBSXezRTfqHA8fkzmRPPdkyjpBH4qhjh
 3wEj0eHCFJbxd1vgUZNEcKZvNfYChkRJaft6PQeN1rI7yzdn4/ng4PWUfF/UIhjfCgLJd10Ac0n
 Muwt47+7rRL/ZaJVXICXQFha3/+O0DWfmlwahE8aKlhvDC0x2CFEHH3aTr7m9FjAAKuqgsi2tsT
 d1YCwr1a+Hj5cZR+/hiuLJk1MbSnx+go7uGYXIUaTqA5wiy0Xx+Y1ezj82iic7ERIAqm6I/LgVS
 2uvjhCVpj1JzUNQ==
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

Return an error value from dispc_softreset() so that the caller can
handle the errors.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index deb665d0ede8..50b475b285d9 100644
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
@@ -2826,8 +2830,11 @@ int dispc_init(struct tidss_device *tidss)
 			     &dispc->memory_bandwidth_limit);
 
 	/* K2G display controller does not support soft reset */
-	if (feat->subrev != DISPC_K2G)
-		dispc_softreset(dispc);
+	if (feat->subrev != DISPC_K2G) {
+		r = dispc_softreset(dispc);
+		if (r)
+			return r;
+	}
 
 	tidss->dispc = dispc;
 

-- 
2.34.1

