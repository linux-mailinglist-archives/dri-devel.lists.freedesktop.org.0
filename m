Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB233A1C8B6
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A75310E381;
	Sun, 26 Jan 2025 14:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="qxO6VbNG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 538 seconds by postgrey-1.36 at gabe;
 Fri, 24 Jan 2025 17:09:29 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AF610E9B8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 17:09:29 +0000 (UTC)
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
 by mail.ispras.ru (Postfix) with ESMTPSA id E1DB340B2269;
 Fri, 24 Jan 2025 17:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru E1DB340B2269
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1737738028;
 bh=Hhj4Iw8Xku/8T4T+5kZ+uaePDuP74yZIrW5ImoLkSiM=;
 h=From:To:Cc:Subject:Date:From;
 b=qxO6VbNG+GkHkc0XpeGe3AxKClIKOYbtSG1Ak/6abMAzYLPFojlTTG3R08lwCxf4w
 HlVpdWgRpcmAK35tk+23HLTspqeTkSXB83OSnE5y0vxm9RMXdtn/t3T7hUcZpPD3lQ
 VlVtC2PYJZ2XEpXc76g/gaK1bCjXw1obVtnNG77E=
From: Vitalii Mordan <mordan@ispras.ru>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Vitalii Mordan <mordan@ispras.ru>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@intel.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>,
 Aleksandr Mishin <amishin@t-argos.ru>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Yuti Amonkar <yamonkar@cadence.com>, Jyri Sarha <jsarha@ti.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Fedor Pchelkin <pchelkin@ispras.ru>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Vadim Mutilin <mutilin@ispras.ru>, lvc-project@linuxtesting.org
Subject: [PATCH] gpu: cdns-mhdp8546: fix call balance of mhdp->clk handling
 routines
Date: Fri, 24 Jan 2025 20:00:09 +0300
Message-Id: <20250124170009.2075175-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 26 Jan 2025 14:52:19 +0000
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

If the clock mhdp->clk was not enabled in cdns_mhdp_probe(), it should not
be disabled in any path.

Found by Linux Verification Center (linuxtesting.org) with Klever.

Fixes: fb43aa0acdfd ("drm: bridge: Add support for Cadence MHDP8546 DPI/DP bridge")
Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index d081850e3c03..3e923bcfb0bf 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2504,7 +2504,11 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 
 	mhdp->info = of_device_get_match_data(dev);
 
-	clk_prepare_enable(clk);
+	ret = clk_prepare_enable(clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable clk\n");
+		return ret;
+	}
 
 	pm_runtime_enable(dev);
 	ret = pm_runtime_resume_and_get(dev);
-- 
2.25.1

