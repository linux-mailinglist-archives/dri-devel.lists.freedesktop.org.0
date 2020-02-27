Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 254FA1723A9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 17:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94AF6E93B;
	Thu, 27 Feb 2020 16:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663596E93B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 16:40:50 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.lab.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1j7Lum-0001sI-8Y; Thu, 27 Feb 2020 17:21:32 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1j7Luk-0007hI-22; Thu, 27 Feb 2020 17:21:30 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 shawnguo@kernel.org, stefan@agner.ch, rmk+kernel@armlinux.org.uk
Subject: [PATCH 00/17] DRM: imx spring-cleaning
Date: Thu, 27 Feb 2020 17:21:08 +0100
Message-Id: <20200227162125.10450-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
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
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

the purpose of this patch series is to address bug reported here
[1]. There where two approaches [2,3] to fix this but non of them get
mainline. The issue is caused by the fact that we are using devres
allocation for the driver (pd,ldb,hdmi,tve) state struct which holds
also the 'struct drm_encoder/connector'. 

We need to move the driver state containers containing the drm members
out of the devres memory management into the drm memory management
framework to fix the bug [1]. Therefore we need to split the single
driver state struct into two: one for the drm_connector device and one
for the drm_encoder device.

The series removes some legacy code paths too and removes the useless
imx_drm_encoder_destroy() API.

Pls don't be surprised about the edid memory leak fix patches. I went
this way because those patche can be applied independently of the last
patch which did the conversion from the devres alloc to the non-devres
alloc.

I did the following tests for each component:
 - probe successful
 - correct failure handling during probe
 - bind / unbind (module load/unload)

I also kept a few lines longer than 80char to improve readability.

Other tester are welcome =)

Regards,
  Marco

[1] https://www.spinics.net/lists/dri-devel/msg189388.html
[2] https://lkml.org/lkml/2018/10/16/1148
[3] https://lkml.org/lkml/2019/4/2/612

Marco Felsch (17):
  drm/imx: drop useless best_encoder callback
  drm/imx: parallel-display: fix edid memory leak
  drm/imx: parallel-display: move panel/bridge detection to fail early
  drm/imx: parallel-display: detach panel within drm_encoder destroy
  drm/imx: parallel-display: split encoder and decoder states
  imx/drm: parallel-display: split attach function
  drm/imx: tve: add regulator_disable devm_action
  drm/imx: tve: split global state container
  drm/imx: imx-ldb: remove useless enum
  drm/imx: imx-ldb: fix edid memory leak
  drm/imx: imx-ldb: release ldb-channel resources within encoder destroy
  drm/imx: remove imx_drm_encoder_destroy helper
  drm/imx: imx-ldb: split imx_ldb devres allocation context
  drm/imx: imx-ldb: add ldb_is_dual helper
  drm/imx: imx-ldb: split encoder and decoder states
  drm/imx: imx-ldb: refactor imx_ldb_bind
  drm/imx: fix drm_mode_config_cleanup race condition

 drivers/gpu/drm/imx/dw_hdmi-imx.c      |  28 +-
 drivers/gpu/drm/imx/imx-drm-core.c     |   9 +-
 drivers/gpu/drm/imx/imx-drm.h          |   1 -
 drivers/gpu/drm/imx/imx-ldb.c          | 514 ++++++++++++++-----------
 drivers/gpu/drm/imx/imx-tve.c          | 173 ++++++---
 drivers/gpu/drm/imx/ipuv3-crtc.c       |  28 +-
 drivers/gpu/drm/imx/parallel-display.c | 142 ++++---
 7 files changed, 523 insertions(+), 372 deletions(-)

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
