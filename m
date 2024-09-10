Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8F8972CE1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 11:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BB510E708;
	Tue, 10 Sep 2024 09:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="P1XL5RzP";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="Mnl0h/sz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 307 seconds by postgrey-1.36 at gabe;
 Tue, 10 Sep 2024 09:06:47 UTC
Received: from a7-46.smtp-out.eu-west-1.amazonses.com
 (a7-46.smtp-out.eu-west-1.amazonses.com [54.240.7.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5542E10E708
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 09:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725958898;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
 bh=DaEnJgdMzkO5FdaJohFPaDZH5R8sp5QKWsb+He1nwEM=;
 b=P1XL5RzPKJt9mvsIwobKjKMlgdDAnBI2zXVbfTGP1EkaoixYAsmUSsv3/ArGAxFg
 YzrAe98nka2EKbN7zDydYHa4MgAI9aIVMzkQwAELvTW9hPIY43+fvb7ezJ99oaJfmcf
 Tpp9V1fgFdsSpbr8Kq+QXixfjQ5BEh+qe9d50dv6Kyy7nlE4m9ovUQObVY/fHgc4doC
 ay24lJH9Dl5TngZuh23ASfWvr/QpQQnl/LcQJUc6tXgaoOtRFzaES7kAarltShRpyv/
 BITbaVQtjZs4X81Gc1P1tR6Kc3YrnU6k4gQYwBq0KkA/5vnrC6ODcQSkU7oUoNpAoSm
 ynBiLn/B6w==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725958898;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
 bh=DaEnJgdMzkO5FdaJohFPaDZH5R8sp5QKWsb+He1nwEM=;
 b=Mnl0h/sz7tTEG3WD+QE7jIY9zsgzJZ0B6dfWqSzmbCSjUdPc3U2KdtolsxX+fUlL
 Bh5jdQa1vwVZmkMuQmT1AvmUK5pIKE/boczac4t2soM809gSP3yyKhnKL0D47SloNOT
 q//vkGUvab8JetcGCQzL8fr3qLOR565Uu+mY0ZVw=
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, shawn.sung@mediatek.com, 
 yu-chang.lee@mediatek.com, ck.hu@mediatek.com, 
 jitao.shi@mediatek.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, wenst@chromium.org, 
 kernel@collabora.com, sui.jingfeng@linux.dev, michael@walle.cc, 
 sjoerd@collabora.com
Subject: [PATCH v9 0/3] drm/mediatek: Add support for OF graphs
Date: Tue, 10 Sep 2024 09:01:38 +0000
Message-ID: <01020191db2ac439-4e2dc95a-6323-4f0f-b9fc-c482948018a8-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.10-54.240.7.46
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

Changes in v9:
 - Rebased on next-20240910
 - Removed redundant assignment and changed a print to dev_err()
 - Dropped if branch to switch conversion as requested; this will
   be sent as a separate commit out of this series.

Changes in v8:
 - Rebased on next-20240617
 - Changed to allow probing a VDO with no available display outputs

Changes in v7:
 - Fix typo in patch 3/3

Changes in v6:
 - Added EPROBE_DEFER check to fix dsi/dpi false positive DT fallback case
 - Dropped refcount of ep_out in mtk_drm_of_get_ddp_ep_cid()
 - Fixed double refcount drop during path building
 - Removed failure upon finding a DT-disabled path as requested
 - Tested again on MT8195, MT8395 boards

Changes in v5:
 - Fixed commit [2/3], changed allOf -> anyOf to get the
   intended allowance in the binding

Changes in v4:
 - Fixed a typo that caused pure OF graphs pipelines multiple
   concurrent outputs to not get correctly parsed (port->id); 
 - Added OVL_ADAPTOR support for OF graph specified pipelines;
 - Now tested with fully OF Graph specified pipelines on MT8195
   Chromebooks and MT8395 boards;
 - Rebased on next-20240516

Changes in v3:
 - Rebased on next-20240502 because of renames in mediatek-drm

Changes in v2:
 - Fixed wrong `required` block indentation in commit [2/3]


The display IPs in MediaTek SoCs are *VERY* flexible and those support
being interconnected with different instances of DDP IPs (for example,
merge0 or merge1) and/or with different DDP IPs (for example, rdma can
be connected with either color, dpi, dsi, merge, etc), forming a full
Display Data Path that ends with an actual display.

This series was born because of an issue that I've found while enabling
support for MT8195/MT8395 boards with DSI output as main display: the
current mtk_drm_route variations would not work as currently, the driver
hardcodes a display path for Chromebooks, which have a DisplayPort panel
with DSC support, instead of a DSI panel without DSC support.

There are other reasons for which I wrote this series, and I find that
hardcoding those paths - when a HW path is clearly board-specific - is
highly suboptimal. Also, let's not forget about keeping this driver from
becoming a huge list of paths for each combination of SoC->board->disp
and... this and that.

For more information, please look at the commit description for each of
the commits included in this series.

This series is essential to enable support for the MT8195/MT8395 EVK,
Kontron i1200, Radxa NIO-12L and, mainly, for non-Chromebook boards
and Chromebooks to co-exist without conflicts.

Besides, this is also a valid option for MT8188 Chromebooks which might
have different DSI-or-eDP displays depending on the model (as far as I
can see from the mtk_drm_route attempt for this SoC that is already
present in this driver).

This series was tested on MT8195 Cherry Tomato and on MT8395 Radxa
NIO-12L with both hardcoded paths, OF graph support and partially
hardcoded paths, and pure OF graph support including pipelines that
require OVL_ADAPTOR support.

AngeloGioacchino Del Regno (3):
  dt-bindings: display: mediatek: Add OF graph support for board path
  dt-bindings: arm: mediatek: mmsys: Add OF graph support for board path
  drm/mediatek: Implement OF graphs support for display paths

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |  28 ++
 .../arm/mediatek/mediatek,mmsys.yaml.orig     | 140 ++++++++++
 .../display/mediatek/mediatek,aal.yaml        |  40 +++
 .../display/mediatek/mediatek,aal.yaml.orig   |  93 +++++++
 .../display/mediatek/mediatek,ccorr.yaml      |  21 ++
 .../display/mediatek/mediatek,ccorr.yaml.orig |  88 ++++++
 .../display/mediatek/mediatek,color.yaml      |  22 ++
 .../display/mediatek/mediatek,color.yaml.orig |  96 +++++++
 .../display/mediatek/mediatek,dither.yaml     |  22 ++
 .../mediatek/mediatek,dither.yaml.orig        |  87 ++++++
 .../display/mediatek/mediatek,dpi.yaml        |  25 +-
 .../display/mediatek/mediatek,dpi.yaml.orig   | 122 +++++++++
 .../display/mediatek/mediatek,dsc.yaml        |  24 ++
 .../display/mediatek/mediatek,dsi.yaml        |  27 +-
 .../display/mediatek/mediatek,dsi.yaml.orig   | 126 +++++++++
 .../display/mediatek/mediatek,ethdr.yaml      |  22 ++
 .../display/mediatek/mediatek,gamma.yaml      |  19 ++
 .../display/mediatek/mediatek,gamma.yaml.orig |  96 +++++++
 .../display/mediatek/mediatek,merge.yaml      |  23 ++
 .../display/mediatek/mediatek,merge.yaml.orig | 110 ++++++++
 .../display/mediatek/mediatek,od.yaml         |  22 ++
 .../display/mediatek/mediatek,ovl-2l.yaml     |  22 ++
 .../mediatek/mediatek,ovl-2l.yaml.orig        |  78 ++++++
 .../display/mediatek/mediatek,ovl.yaml        |  22 ++
 .../display/mediatek/mediatek,ovl.yaml.orig   | 109 ++++++++
 .../display/mediatek/mediatek,postmask.yaml   |  21 ++
 .../display/mediatek/mediatek,rdma.yaml       |  22 ++
 .../display/mediatek/mediatek,rdma.yaml.orig  | 122 +++++++++
 .../display/mediatek/mediatek,ufoe.yaml       |  21 ++
 .../display/mediatek/mediatek,wdma.yaml.orig  |  76 ++++++
 .../bindings/gpu/arm,mali-bifrost.yaml.orig   | 250 +++++++++++++++++
 .../bindings/leds/leds-mt6323.txt.orig        |  60 +++++
 .../bindings/ufs/mediatek,ufs.yaml.orig       |  71 +++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   1 +
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  40 ++-
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  21 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 253 +++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c            |  14 +-
 39 files changed, 2433 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml.orig
 create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6323.txt.orig
 create mode 100644 Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml.orig

-- 
2.46.0

