Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24F864C8F5
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 13:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1C610E3CC;
	Wed, 14 Dec 2022 12:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F43D10E3C9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 12:23:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p5QQ4-0005rW-Fq; Wed, 14 Dec 2022 12:59:28 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p5QQ1-004SUN-5R; Wed, 14 Dec 2022 12:59:25 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p5QQ0-00511y-V2; Wed, 14 Dec 2022 12:59:24 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2 0/2] drm/imx/lcdc: Implement DRM driver for imx21
Date: Wed, 14 Dec 2022 12:59:19 +0100
Message-Id: <20221214115921.1845994-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1243;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=E9rmnqIACjL1gD6hd1h/JCLXSWUFev5rGvO+Iia5AqI=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjmbqKutNhz2hpCA8uMWSiFV+KNEi5A7YyVOQwWLD3
 mbBX60qJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5m6igAKCRDB/BR4rcrsCbB4B/
 9oCNGQY5wLWXGX9nUovs667z3OpDvVlPSMXtQsflP0KhsltwK4aEKhyr3mErw0Zif3arsN+P5hioLm
 VFz6Z15BpP9Y6lAM2mt820YUYD22k8nW8CiWVBYYRvi7BT9HB5gDXnFBeMWbegMhFrqVpO8rUz+Vq6
 yy8s0w0NZVvJy9J0B6OnY6V2/529xPZ2FqW9PhAozqvBHcQkqFzeKE8Mwaq1pKegF9xbrNIMgUTzfQ
 ZQ3Qjh/tpyZdCFtUCL9mIsWT8YisqFrRNqsvdUGUR7XiShxfVjYrFXxpvDiC6x0C9oFiwqUBKKV4lx
 uOU2UNnukIcET9Svw13SzMgpG3a/Dq
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Compared to (implicit) v1[1] the device tree binding should be good
enough now to pass the dts linters.

As before, Marian Cichy is the declared author of the driver, but he
left Pengutronix, so the email address doesn't work any more.

This is based on top of v6.1 + 93266da2409b ("dt-bindings: display:
Convert fsl,imx-fb.txt to dt-schema") which is currently in next via
branch 'for-next' of
git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git .

Best regards
Uwe

[1] https://lore.kernel.org/dri-devel/20220128105849.368438-1-u.kleine-koenig@pengutronix.de

Marian Cichy (1):
  drm/imx/lcdc: Implement DRM driver for imx21

Uwe Kleine-König (1):
  dt-bindings: display: imx: Describe drm binding for fsl,imx-lcdc

 .../bindings/display/imx/fsl,imx-lcdc.yaml    |  45 +-
 drivers/gpu/drm/imx/Kconfig                   |   7 +
 drivers/gpu/drm/imx/Makefile                  |   2 +
 drivers/gpu/drm/imx/imx-lcdc.c                | 610 ++++++++++++++++++
 4 files changed, 663 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/imx/imx-lcdc.c


base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
prerequisite-patch-id: c3ef3de02516b5c159e76b40d2b4348a5ce0fe51
-- 
2.38.1

