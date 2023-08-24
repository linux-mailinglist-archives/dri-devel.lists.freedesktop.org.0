Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 682D0786897
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 09:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6035110E4AC;
	Thu, 24 Aug 2023 07:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF82F10E496
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 07:38:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6080662349;
 Thu, 24 Aug 2023 07:38:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4046C433C7;
 Thu, 24 Aug 2023 07:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692862685;
 bh=Dk8iyOyFggoB4EAzE/YjAU2+gPq8/lElJKWAaFnOoqA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vFMzcDocYu5qJE0nqzVZdFuYHkgjWFhcb+ESDiqEszUjE9SMw3zgXQukSHH1cxzzD
 R7fOHxw628wRKYtkeWd4BpUiY+hOMkJjFgm4pXVW9Odzu8qLYXPOmByNyGVvRIDy1s
 5JCNl8iVNNE2gKRU5wFOI5Zy60P05USK3PMSWYAPgs6xNvi2FtuCJHmMe3dhpwIV5x
 GbnayJBlAWUHp8AOfJXapQJwWtCZbG8sNT9goXD2FZ3Np1FpknuDs/BWi6DoaE9+qx
 3sjSKiYBYrqJz/NBRIYkvNeHXdo9A6niRzQfJIjzA7XmK4nNKHbDlMGwMSXQECZK/J
 E0NwxFh8smr0A==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 14/20] drm/imx/ipuv3/imx-ldb: Increase buffer size to ensure
 all possible values can be stored
Date: Thu, 24 Aug 2023 08:36:59 +0100
Message-ID: <20230824073710.2677348-15-lee@kernel.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824073710.2677348-1-lee@kernel.org>
References: <20230824073710.2677348-1-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When converting from int to string, we must allow for up to 10-chars (2147483647).

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/imx/ipuv3/imx-ldb.c: In function ‘imx_ldb_probe’:
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c:659:39: warning: ‘_sel’ directive writing 4 bytes into a region of size between 3 and 13 [-Wformat-overflow=]
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c:659:17: note: ‘sprintf’ output between 8 and 18 bytes into a destination of size 16

Signed-off-by: Lee Jones <lee@kernel.org>
---
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index c45fc8f4744d0..0404781dcd176 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -654,7 +654,7 @@ static int imx_ldb_probe(struct platform_device *pdev)
 	 * Map them all to di0_sel...di3_sel.
 	 */
 	for (i = 0; i < 4; i++) {
-		char clkname[16];
+		char clkname[18];
 
 		sprintf(clkname, "di%d_sel", i);
 		imx_ldb->clk_sel[i] = devm_clk_get(imx_ldb->dev, clkname);
-- 
2.42.0.rc1.204.g551eb34607-goog

