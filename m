Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B70D24D2988
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 08:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B547810E186;
	Wed,  9 Mar 2022 07:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CBE10E3BD
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 07:36:49 +0000 (UTC)
X-UUID: 8de101daec9e45ccba04a40837a65186-20220309
X-UUID: 8de101daec9e45ccba04a40837a65186-20220309
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1750477417; Wed, 09 Mar 2022 15:36:40 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 9 Mar 2022 15:36:39 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 9 Mar 2022 15:36:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Mar 2022 15:36:39 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <daniel@ffwll.ch>, <airlied@linux.ie>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>,
 <matthias.bgg@gmail.com>, <robert.foss@linaro.org>,
 <andrzej.hajda@intel.com>, <narmstrong@baylibre.com>
Subject: [RESEND V11 0/3] force hsa hbp hfp packets multiple of lanenum to
 avoid screen shift
Date: Wed, 9 Mar 2022 15:36:34 +0800
Message-ID: <20220309073637.3591-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: jitao.shi@mediatek.com, xinlei.lee@mediatek.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 xji@analogixsemi.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Resend v11:
 - Resend this series for reviewing.
 - Rebase to 5.17-rc7.

Changes since v10:
 - Rebase to 5.17-rc3.
 - Add more maintainers.

Changes since v9:
 - Change description of "MIPI_DSI_HS_PKT_END_ALIGNED".
 - Use mode_flags directly instead of another variable on patch [2/3].
 - Add explanation of implementation in mtk_dsi.c on commit message of [2/3].

Changes since v8:
 - Use mode_flags to control this limitation instead of "hs_packet_end_aligned".
 - Add new bit definition "MIPI_DSI_HS_PKT_END_ALIGNED" for mode_flags.

Changes since v7:
 - Rebase to kernel 5.16
 - Add tags of reviewed-by and acked-by.
 - Add detailed commit message for flag "hs_packet_end_aligned" in DSI common driver.

Changes since v6:
 - Add "bool hs_packet_end_aligned" in "struct mipi_dsi_device" to control the dsi aligned.
 - Config the "hs_packet_end_aligned" in ANX7725 .attach().

Changes since v5:
 - Search the anx7625 compatible as flag to control dsi output aligned.

Changes since v4:
 - Move "dt-bindings: drm/bridge: anx7625: add force_dsi_end_without_null" before
   "drm/mediatek: force hsa hbp hfp packets multiple of lanenum to avoid".
 - Retitle "dt-bindings: drm/bridge: anx7625: add force_dsi_end_without_null".

Rex-BC Chen (3):
  drm/dsi: transfer DSI HS packets ending at the same time
  drm/mediatek: implement the DSI HS packets aligned
  drm/bridge: anx7625: config hs packets end aligned to avoid screen
    shift

 drivers/gpu/drm/bridge/analogix/anx7625.c |  3 ++-
 drivers/gpu/drm/mediatek/mtk_dsi.c        | 12 ++++++++++++
 include/drm/drm_mipi_dsi.h                |  2 ++
 3 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.18.0

