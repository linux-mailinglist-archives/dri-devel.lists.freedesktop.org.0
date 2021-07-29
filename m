Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C92203DA7D6
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 17:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0986EDDE;
	Thu, 29 Jul 2021 15:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97E06EDDC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 15:49:21 +0000 (UTC)
X-UUID: 03041523c2b04a3ca94d4cd6945fd339-20210729
X-UUID: 03041523c2b04a3ca94d4cd6945fd339-20210729
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 242821299; Thu, 29 Jul 2021 23:49:15 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 23:49:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 29 Jul 2021 23:49:13 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Enric Balletbo Serra
 <eballetbo@gmail.com>
Subject: [PATCH v2 3/5] dt-bindings: mediatek: display: add MERGE additional
 description
Date: Thu, 29 Jul 2021 23:49:10 +0800
Message-ID: <20210729154912.20051-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210729154912.20051-1-jason-jh.lin@mediatek.com>
References: <20210729154912.20051-1-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Jitao shi <jitao.shi@mediatek.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>, jason-jh.lin@mediatek.com,
 singo.chang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1. clock drivers of MERGE
   The MERGE controller may have 2 clock inputs.
   The second clock of MERGE is async clock which is controlling
   the async buffer between MERGE and other display function blocks.

2. MERGE fifo settings enable
   The setting of merge fifo is mainly provided for the display
   latency buffer. To ensure that the back-end panel display data
   will not be underrun, a little more data is needed in the fifo.
   According to the merge fifo settings, when the water level is
   detected to be insufficient, it will trigger RDMA sending
   ultra and preulra command to SMI to speed up the data rate.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../bindings/display/mediatek/mediatek,disp.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
index f01ecf7fcbde..f16ee592735d 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.yaml
@@ -227,6 +227,9 @@ properties:
     description: clock drivers
       See Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
       For most function blocks this is just a single clock input.
+      The MERGE controller may have 2 clock inputs. The second clock of MERGE is async clock,
+      which is controlling the synchronous process between MERGE and other display function
+      blocks cross clock domain.
       Only the DSI and DPI controller nodes have multiple clock inputs. These are documented
       in mediatek,dsi.txt and mediatek,dpi.yaml, respectively.
       An exception is that the mt8183 mutex is always free running with no clocks property.
@@ -260,6 +263,15 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [8*1024, 5*1024, 2*1024]
 
+  mediatek,merge-fifo-en:
+    description: MERGE fifo settings enable
+      The setting of merge fifo is mainly provided for the display latency buffer.
+      To ensure that the back-end panel display data will not be underrun,
+      a little more data is needed in the fifo. According to the merge fifo settings,
+      when the water level is detected to be insufficient, it will trigger RDMA sending
+      ultra and preulra command to SMI to speed up the data rate.
+    type: boolean
+
   power-domains:
     description: A phandle and PM domain specifier as defined by bindings of
       the power controller specified by phandle. See
-- 
2.18.0

