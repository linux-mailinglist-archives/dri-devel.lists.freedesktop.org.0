Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 305A4A6AAC1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 17:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C985A10E669;
	Thu, 20 Mar 2025 16:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a2GD44Yj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FCC10E65F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 16:00:41 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F923187B;
 Thu, 20 Mar 2025 16:58:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742486337;
 bh=PM3qn/s33KHnLl3YvY8GLYvLdFsywv9G587wE6W8Bwk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=a2GD44YjfgYan56h/9MmD7/HfbWCIT+rsU0mi4dXgLdgncWmONx1Fqr/aE+gOca/1
 Sx3RaQfs+Us/MPZo3Gb57tNaFJ82EywRdwJCzW6hxRlIcUkDzdj7sObkgYaUaWq+99
 BpRB0AkUMpsFnQJDoak80OGloewv+Eyfkhmn2ABg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 20 Mar 2025 18:00:04 +0200
Subject: [PATCH 09/18] drm/bridge: cdns-dsi: Fix REG_WAKEUP_TIME value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-cdns-dsi-impro-v1-9-725277c5f43b@ideasonboard.com>
References: <20250320-cdns-dsi-impro-v1-0-725277c5f43b@ideasonboard.com>
In-Reply-To: <20250320-cdns-dsi-impro-v1-0-725277c5f43b@ideasonboard.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=PM3qn/s33KHnLl3YvY8GLYvLdFsywv9G587wE6W8Bwk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn3DuZloA+exiVEum1Q6IiqSYRfYHq0oMCRsYYe
 0Ewlqz9wMSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ9w7mQAKCRD6PaqMvJYe
 9aG3EACZaRefFebSDtsTRi5sPJx//iUij0iLw0822RCYY/BLgg2ClMcNAcgZN/d8e7ezSqsXqcM
 iptPCOsHKggzQGtZ9ZnRZeng3Ie+rmb/BsqpKBiOuwWtsOGJfrt6GWoE93nm8ZkPqyyKSCdDqIk
 jTHniVzGMwrKEd2gTkox26qG1MECgmpeO8XFhSXft4B2BGu+/ZQrP7aC9cFZ/0RhAhxn6wVstFY
 BDDGGIDKIMd6tdIBD5z1xG1LzbeCuSprHUNMdKhQ2TCTXFG7lB83uLO493ZIrVNryYwgEqk3Fj/
 x2pFS2vFeVCf1aHMcGWb56QsTiWMEWC+5OsrL8E3kIxS5WO71VTk68Hc7NuIDBqWv4z6OQxx598
 TSOSDvwrQ6rGD8M2W0XDi8W4SVcKAIJK9V+hSDJjrpRLtishgFS0GLui5DDhaJEDXCqua04zJv2
 2I1tD58/5OrRydynC+7jdAAB1BD5OocNpBNGFcKtEBqsNWfovxNRA6dFSAVS218C3NiFVNk5SEY
 58Wxd/rGARUmVTnHCTFNWK+MDf9FXGzBnX6yS23JNyJCgtkcK7qfyN8+85zwH0+7R3yJlGP+5D9
 PoMI9auXgGutPJymhWGUsHxI+tT+/0ufJqKkfkZAyOA5q5viCH2k1ZIUFUORtmnlWuMfzg50/Ps
 jawDxvJJpfUYppw==
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

The driver tries to calculate the value for REG_WAKEUP_TIME. However,
the calculation itself is not correct, and to add on it, the resulting
value is almost always larger than the field's size, so the actual
result is more or less random.

According to the docs, figuring out the value for REG_WAKEUP_TIME
requires HW characterization and there's no way to have a generic
algorithm to come up with the value. That doesn't help at all...

However, we know that the value must be smaller than the line time, and,
at least in my understanding, the proper value for it is quite small.
Testing shows that setting it to 1/10 of the line time seems to work
well. All video modes from my HDMI monitor work with this algorithm.

Hopefully we'll get more information on how to calculate the value, and
we can then update this.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 0aaa1d06b21c..62811631341b 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -882,7 +882,13 @@ static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	tx_byte_period = DIV_ROUND_DOWN_ULL((u64)NSEC_PER_SEC * 8,
 					    phy_cfg->hs_clk_rate);
-	reg_wakeup = (phy_cfg->hs_prepare + phy_cfg->hs_zero) / tx_byte_period;
+
+	/*
+	 * Estimated time [in clock cycles] to perform LP->HS on D-PHY.
+	 * It is not clear how to calculate this, so for now,
+	 * set it to 1/10 of the total number of clocks in a line.
+	 */
+	reg_wakeup = dsi_cfg.htotal / nlanes / 10;
 	writel(REG_WAKEUP_TIME(reg_wakeup) | REG_LINE_DURATION(tmp),
 	       dsi->regs + VID_DPHY_TIME);
 

-- 
2.43.0

