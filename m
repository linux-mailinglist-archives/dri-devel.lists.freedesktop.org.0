Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2321783C06D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 12:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C1D10F8B1;
	Thu, 25 Jan 2024 11:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886F310F8AC
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 11:11:37 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1rSxZg-0000EJ-9m; Thu, 25 Jan 2024 12:07:12 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 0/3] drm/etnaviv: Disable SH_EU clock gating on the
 i.MX8MP NPU
Date: Thu, 25 Jan 2024 12:07:05 +0100
Message-Id: <20240125-etnaviv-npu-v2-0-ba23c9a32be1@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANlAsmUC/23MMQ6DMAyF4asgz02VuJCiTtyjYrDAgJcEJSGiQ
 ty9KXPH/0nvOyByEI7wqg4InCWKdyXwVsGwkJtZyVgaUGOtDdaKk6MsWbl1Uxafk21b80AcoDz
 WwJPsl/buSy8Skw+fC8/mt/53slFaUUM02Zp4sE23spu3FLyT/T4y9Od5fgEdARq+qwAAAA==
To: Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-f0463
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vendor kernel sets a previously unknown clock gating bit in the
VIVS_PM_MODULE_CONTROLS register to disable SH_EU clock gating.

Import new headers from rnndb for the definition and set the bit
for the VIPNano-Si+ NPU on i.MX8MP and other affected cores.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes in v2:
- Add patch to turn etnaviv_is_model_rev() into a function.
- Use model numbers instead of made up GCxxxx model names.
- Also disable SH_EU clock gating on other models/revisions listed in the
  vendor kernel.
- Link to v1: https://lore.kernel.org/r/20240124-etnaviv-npu-v1-0-a5aaf64aec65@pengutronix.de

---
Philipp Zabel (3):
      drm/etnaviv: Update hardware headers from rnndb
      drm/etnaviv: Turn etnaviv_is_model_rev() into a function
      drm/etnaviv: Disable SH_EU clock gating on VIPNano-Si+

 drivers/gpu/drm/etnaviv/cmdstream.xml.h |  52 ++++++++++++++--
 drivers/gpu/drm/etnaviv/common.xml.h    |  12 ++--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c   |  72 +++++++++++++----------
 drivers/gpu/drm/etnaviv/state.xml.h     | 101 +++++++++++++++++++++++++++-----
 drivers/gpu/drm/etnaviv/state_blt.xml.h |  20 +++----
 drivers/gpu/drm/etnaviv/state_hi.xml.h  |  28 +++++----
 6 files changed, 210 insertions(+), 75 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240124-etnaviv-npu-627f6881322c

Best regards,
-- 
Philipp Zabel <p.zabel@pengutronix.de>

