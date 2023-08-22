Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9557F7846FC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 18:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C58610E38D;
	Tue, 22 Aug 2023 16:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03ABF10E3A5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 16:20:14 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0181187F4;
 Tue, 22 Aug 2023 18:18:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692721135;
 bh=LO6DVrF7Wy//586q71JqmvhJ6yqjCtp6tNE4HEdX3hc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CQNJQdUewY94WUFp9YPll+PZlDY1phdM4tVllfLf9tWDLtfljBMn7CgXk95lIJeMJ
 VqFB/z4vpcxTbOBRpsaIfxiBFu2iqUrU2RohOpTOegdhKeCDlTBxtnWf7drjLPMgKh
 jMK9q0I4Spa4gups2zh4fGRoadXnLpbgVtQg6SEI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 22 Aug 2023 19:19:44 +0300
Subject: [PATCH v3 11/12] drm/bridge: tc358768: Fix tc358768_ns_to_cnt()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230822-tc358768-v3-11-c82405dac0c1@ideasonboard.com>
References: <20230822-tc358768-v3-0-c82405dac0c1@ideasonboard.com>
In-Reply-To: <20230822-tc358768-v3-0-c82405dac0c1@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=956;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=LO6DVrF7Wy//586q71JqmvhJ6yqjCtp6tNE4HEdX3hc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk5OAuWjKWskwExcfKQDmgn/U8rq857fNH5jATm
 ZR/kqZaJDiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZOTgLgAKCRD6PaqMvJYe
 9ZwAEACr5jOQagaCCvcZpT8sfneYHY7YPSelKldZoR04bQCAK7S5k5aa3SpTIQ/EeTBc53dOjkq
 ewlV4E2veNj+RKf5HA8f243swDg9tdU4WBj60XglDh1JCKwEgkaWDSYzgZnKtXuH2pz9MGv5oKd
 VbBaBkEiU3f+AxL+tLLHS5fifFJIJ08ZMSjhLuo82pQYJ9BSOGQPzmDFLkW3kQUgE38rgrHh3mw
 jEAKEqSbd6c5EejvSEq7ynzJDVB0I4i6iJtiIJuXdVh7uIBwqRdtvRXrpRRHIza2Kg/LRRCwGV4
 /OB8+3sRs1HaQzT1o75L+Zro0IJlJBlkDNgJ2DZAkISO1Yfk+83vFod1nhDow5Nmvg7L+rW9fqN
 RVImT2DTJb9H297Xf9TFVrg96UWwUd9pI2OTsc0xnDo5lNYV45Nq5w6KOacgvfT9v42Zf9c9oC1
 mglS612hxEXQg1q3ES2jiwHWpPVp8EaP0qLSryjMKhaVD18dsClBh779ZCG2jNbrx6wakpfHLf4
 4DEl1eRGAFULetw0heN5UGHyiw+6J+CGbCQVtX+T6xQHNO0DFSaovXA4twlKXtHdHVHzQ8YVTEG
 u6xJOQtqgQO/cjNe8MDQQaRt0A2hMoooMU9wqyd4I3OOf2U94/WccXaKBsFzr3SriP+GMOdsiNj
 LimPFRnaGpghTFQ==
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
 Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The tc358768_ns_to_cnt() is, most likely, supposed to do a div-round-up
operation, but it misses subtracting one from the dividend.

Fix this by just using DIV_ROUND_UP().

Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 9ce8d120b50c..f41bf56b7d6b 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -630,7 +630,7 @@ static int tc358768_setup_pll(struct tc358768_priv *priv,
 
 static u32 tc358768_ns_to_cnt(u32 ns, u32 period_ps)
 {
-	return (ns * 1000 + period_ps) / period_ps;
+	return DIV_ROUND_UP(ns * 1000, period_ps);
 }
 
 static u32 tc358768_ps_to_ns(u32 ps)

-- 
2.34.1

