Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E92FBF0671
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 12:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B79210E3BF;
	Mon, 20 Oct 2025 10:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="o//5y2uZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 403 seconds by postgrey-1.36 at gabe;
 Mon, 20 Oct 2025 10:06:03 UTC
Received: from mx-relay90-hz2.antispameurope.com
 (mx-relay90-hz2.antispameurope.com [94.100.136.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC34610E3BF
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 10:06:03 +0000 (UTC)
ARC-Authentication-Results: i=1; mx-gate90-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6,
 headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Vy47wkPi9vz9nd/Ubb0WzYYj5086de9de6TtEsO3Zns=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1760954338;
 b=kcmPXfjv8wIpdVidk0/Kl1CjlQKOIPgrh+CbmG9Z1VT8OQ8vlx3H/B34vh9nxaUyhENQcNH9
 tn9eJmUGxV8FvWFg7d4PTEqQuo0BkIe/YD+Uil3oHi+XqwhmyQ/yzUbpTGx/0YeRQ75Zlc4Ns+p
 aXB/cfQr8gxfr9i53vSaI/h/M8zM49hEa6hLaedSEFgMJhIN4sIO18WfOOCPr4shD+7BIn32pKO
 nEJtacW11zoJQdYYH4VUQMGm+eMTF2ZRTwHVs6XN6cAcrJil32fr4pchy592GOoOO95ThyYXgOn
 ibTC7+4TjfmMH+oYZFJCv3uZA2WUsWCh/TS5vPmgXmuYw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1760954338;
 b=OY0eL3xcj1VtpgOr9FiI2Quhf6vOcxaqS+37dammMgFg0+mikmgYStNE2V54rUkV+fGEgDlz
 4HVfeLGttQWh/MMVEuXgDp2rNYSzQH6RnkVJ57XKdHEjsUWBWlGmTNNEmsxuuYFpnuuRsrfWbjT
 xJFmIIahmvwuvoW1yvfrYn4zfxVHTw4X3azaZKLBC5AXALsyrd88/PlRZCLgOg3zazxPtw5OSso
 4rhCcl/Lb7my34Bi0ZjCUjsUxhtjrYBp2Jj8Uwz8IjTSTFsuGADHZLjocleedWh6g41MdtE18WQ
 hR0V1oS+S0BsKwKVUv6Sg85RuZxUfBLSca76F/4d0V++Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by
 mx-relay90-hz2.antispameurope.com; Mon, 20 Oct 2025 11:58:57 +0200
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net
 [82.135.125.110])
 (Authenticated sender: alexander.stein@ew.tq-group.com)
 by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id
 88256CC0DD7; Mon, 20 Oct 2025 11:58:49 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Liu Ying <victor.liu@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v2 1/1] drm: lcdif: Use dev_err_probe()
Date: Mon, 20 Oct 2025 11:58:45 +0200
Message-ID: <20251020095846.116202-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: dri-devel@lists.freedesktop.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for:
 alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on
 mx-relay90-hz2.antispameurope.com with 4cqrVL377fzX01q
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1,
 IP=94.100.132.6
X-cloud-security-Digest: 303711fa30182f3b5e5363e87477579b
X-cloud-security: scantime:1.797
DKIM-Signature: a=rsa-sha256;
 bh=Vy47wkPi9vz9nd/Ubb0WzYYj5086de9de6TtEsO3Zns=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1760954337; v=1;
 b=o//5y2uZJoc/ULfv1wYBomGUeGNNHKgDaJXBZkmfHMXXVsWBLXDj9rAzFdzigDuGuyT+KhCv
 Xq47UihZEwVfEga9oL97Nnq8L2x1aA0gXr4tMWPfkZH3Sr24RfvCeABkWZBUZSIHNW0xwFvV+wy
 7f0fmarcIkHfm70aaAmhfCW7z+mG/zdmAYQomNcRRtl2n8vH5I5QxU01utMStc+DWrjO5Ucz2Be
 1fkdnsRacH0oH39xknY/B9fBiDBglYCZJSYoJsNd05RyZl6gna2AFYDrEffkwwckQLwPQppqzD4
 DcQag4gG2KzGuc3cz9k+1C/QLBybAuunX+rO72RjxHoVQ==
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

Use dev_err_probe() to add a reason for deferred probe. This can
especially happen on lcdif3 which uses hdmi_tx_phy for 'pix' clock

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Collected Liu's and Marcos' R-b

 drivers/gpu/drm/mxsfb/lcdif_drv.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index fcb2a7517377e..47da1d9336b90 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -149,15 +149,17 @@ static int lcdif_load(struct drm_device *drm)
 
 	lcdif->clk = devm_clk_get(drm->dev, "pix");
 	if (IS_ERR(lcdif->clk))
-		return PTR_ERR(lcdif->clk);
+		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk), "Failed to get pix clock\n");
 
 	lcdif->clk_axi = devm_clk_get(drm->dev, "axi");
 	if (IS_ERR(lcdif->clk_axi))
-		return PTR_ERR(lcdif->clk_axi);
+		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_axi),
+				     "Failed to get axi clock\n");
 
 	lcdif->clk_disp_axi = devm_clk_get(drm->dev, "disp_axi");
 	if (IS_ERR(lcdif->clk_disp_axi))
-		return PTR_ERR(lcdif->clk_disp_axi);
+		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_disp_axi),
+				     "Failed to get disp_axi clock\n");
 
 	platform_set_drvdata(pdev, drm);
 
-- 
2.43.0

