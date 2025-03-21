Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A43CA6B667
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 09:55:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA4A10E711;
	Fri, 21 Mar 2025 08:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Q2q+HaQb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2CCCF10E700
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 08:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=mZPiX
 quyeyecb4DW24Tg2cMooYApUCDgOih/gW3Z9R0=; b=Q2q+HaQb6m1V6zhg2GZ3x
 ApDdI20drvLGz5KHCSSpKrOwxl25P8rhpcPPnxSEP/op78ftR8pqOIIsIeYaj6Pa
 fha7H2gzaIpVnuxuJNLhshBzJl818rFe7wmtfPvHhXGmgMagRItzF/HgZ0QW0AgX
 yCXdpnqxIc6RaaN7ERPnRY=
Received: from ProDesk.. (unknown [])
 by gzsmtp3 (Coremail) with SMTP id PigvCgC3lmIbKd1nvVJ9AQ--.2326S2;
 Fri, 21 Mar 2025 16:53:51 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: lumag@kernel.org
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
 p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
 rfoss@kernel.org, chunkuang.hu@kernel.org,
 cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 0/1] Pass down connector to drm bridge detect hook
Date: Fri, 21 Mar 2025 16:53:37 +0800
Message-ID: <20250321085345.136380-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgC3lmIbKd1nvVJ9AQ--.2326S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAw48KrWfKF1UWr4UXr15twb_yoW5WF1rpF
 W2gry3Ary8ZFWakayxAF18CF98A3Z7JFWFkrW2ywna93WruF1UArsxAayYqFyDWF17Jr1a
 ywnrGrWxGF1xAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jvuWdUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBcXXmfdIWPYKgAAsE
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

From: Andy Yan <andy.yan@rock-chips.com>


In some application scenarios, we hope to get the corresponding
connector when the bridge's detect hook is invoked.

For example, we may want to call drm_dp_read_sink_count_cap(which needs
a drm_connector) at the dp deteck hook, intel_dp and nouveau_dp do this
at it's connector's detetc_ctx/detect hook.

But for a bridge driver, it's detect hook is initiated by the connector,
there is no connector passed down.

In most cases, we can get the connector by drm_atomic_get_connector_for_encoder
if the encoder attached to the bridge is enabled, however there will
still be some scenarios where the detect hook of the bridge is called
but the corresponding encoder has not been enabled yet. For instance,
this occurs when the device is hot plug in for the first time.

Since the call to bridge's detect is initiated by the connector, passing
down the corresponding connector directly will make things simpler.

Before preparing this patch, we have had some discussions on the details
here[0].

[0]https://patchwork.freedesktop.org/patch/640712/?series=143573&rev=5


Andy Yan (1):
  drm/bridge: Pass down connector to drm bridge detect hook

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c          |  3 ++-
 drivers/gpu/drm/bridge/analogix/anx7625.c             |  2 +-
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c   |  3 ++-
 drivers/gpu/drm/bridge/chrontel-ch7033.c              |  2 +-
 drivers/gpu/drm/bridge/display-connector.c            | 11 ++++++++---
 drivers/gpu/drm/bridge/ite-it6263.c                   |  3 ++-
 drivers/gpu/drm/bridge/ite-it6505.c                   |  2 +-
 drivers/gpu/drm/bridge/ite-it66121.c                  |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c              |  6 +++---
 drivers/gpu/drm/bridge/lontium-lt9611.c               |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c            |  3 ++-
 .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c  |  3 ++-
 drivers/gpu/drm/bridge/sii902x.c                      |  3 ++-
 drivers/gpu/drm/bridge/simple-bridge.c                |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c          |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c             |  3 ++-
 drivers/gpu/drm/bridge/tc358767.c                     |  5 +++--
 drivers/gpu/drm/bridge/ti-sn65dsi86.c                 |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c                    |  2 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c                 |  8 +++++++-
 drivers/gpu/drm/display/drm_bridge_connector.c        |  2 +-
 drivers/gpu/drm/drm_bridge.c                          |  5 +++--
 drivers/gpu/drm/mediatek/mtk_dp.c                     |  3 ++-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                   |  3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.c                       |  3 ++-
 drivers/gpu/drm/msm/hdmi/hdmi.h                       |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c                |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c                   |  4 ++--
 drivers/gpu/drm/xlnx/zynqmp_dp.c                      |  3 ++-
 include/drm/drm_bridge.h                              |  6 ++++--
 30 files changed, 67 insertions(+), 38 deletions(-)

-- 
2.43.0

