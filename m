Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA3764F0A7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 18:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8518110E60F;
	Fri, 16 Dec 2022 17:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F2A10E60E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 17:50:28 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p6Eqk-0003G6-4q; Fri, 16 Dec 2022 18:50:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p6Eqi-004yLq-AW; Fri, 16 Dec 2022 18:50:21 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p6Eqi-005bHo-34; Fri, 16 Dec 2022 18:50:20 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v3 0/2] drm/imx/lcdc: Implement DRM driver for imx21
Date: Fri, 16 Dec 2022 18:50:04 +0100
Message-Id: <20221216175006.456831-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1752;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=qFDZkbi/eO3Ag8wSfI9b76d0JCwl5+2gcMtrEKvSG7k=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjnK/CQRPFtzr2eLZHKgwKu3TCQhySHx+F7INtifb9
 30te94aJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5yvwgAKCRDB/BR4rcrsCSg/B/
 wI11lkSGAp7KjHn9jccUAvrXQkhWUKryjwkJGJX/KW8tqfAW9ux0tHUqOzRLicwU1xTVTW/r6WBluq
 7ItcrUmAOe8ILgeyELfQXjXznpzG0Y/d+M9obPd4tMxXJ9u9O4MORYGokJdz+h1u35qdRSqMCsqoh4
 es0lMWg8uVakoYQdTEjbY5Lnmy7a9c+YVo09d4U69Ob2ZQxuRRszDPirU0JomuoVkvT3yB3taWCEt8
 XoysoXdZYWLSfmcWAvX2JgQJBeM663SagpnGv4Mnn4Nm5Tr/c7WFRzopchN7wEfAsg72rgLecs/B1j
 qWPud16rzmKJVPuqxs+ow4XXacSIvx
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Changes since v2:

 - added allOf as Krzysztof requested
 - reworked driver based on Philipp's comments
   (improved error handling, different selects, moved driver to a subdirectory,
   header sorting, drm_err instead of DRM_ERROR, inlined
   imx_lcdc_check_mode_change, make use of dev_err_probe())
 
Krzysztof also pointed out that we're now having two compatibles for a
single hardware. Admittedly this is unusual, but this is the chance that
the (bad) compatible identifier imx21-fb gets deprecated. The hardware
is called LCDC and only the linux (framebuffer) driver is called imxfb.

The two prerequisite commits on top of v6.1 are:

 - 93266da2409b ("dt-bindings: display: Convert fsl,imx-fb.txt to
   dt-schema") which is currently in next via branch 'for-next' of
   git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git .

 - "drm/imx: move IPUv3 driver into separate subdirectory"
   from https://lore.kernel.org/r/20221125112519.3849636-1-l.stach@pengutronix.de

Best regards
Uwe

Marian Cichy (1):
  drm/imx/lcdc: Implement DRM driver for imx21

Uwe Kleine-König (1):
  dt-bindings: display: imx: Describe drm binding for fsl,imx-lcdc

 .../bindings/display/imx/fsl,imx-lcdc.yaml    |  46 +-
 drivers/gpu/drm/imx/Kconfig                   |   1 +
 drivers/gpu/drm/imx/Makefile                  |   1 +
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c           | 587 ++++++++++++++++++
 4 files changed, 634 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/imx/lcdc/imx-lcdc.c


base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
prerequisite-patch-id: 386dd075d3384181945f8333e887bd00be3b23aa
prerequisite-patch-id: c3ef3de02516b5c159e76b40d2b4348a5ce0fe51
-- 
2.38.1

