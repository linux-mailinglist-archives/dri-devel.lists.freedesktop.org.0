Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 714CF4B41CD
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 07:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371AF10E4F8;
	Mon, 14 Feb 2022 06:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675E210E4F8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 06:12:28 +0000 (UTC)
X-UUID: 9a7bd2dcf0dd41049c8f537e789aee7f-20220214
X-UUID: 9a7bd2dcf0dd41049c8f537e789aee7f-20220214
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1806270151; Mon, 14 Feb 2022 14:12:24 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 14 Feb 2022 14:12:23 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Feb 2022 14:12:22 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 14:12:20 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 23/23] ALSA: hda/realtek: Make use of the helper
 component_compare_dev_name
Date: Mon, 14 Feb 2022 14:08:19 +0800
Message-ID: <20220214060819.7334-24-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220214060819.7334-1-yong.wu@mediatek.com>
References: <20220214060819.7334-1-yong.wu@mediatek.com>
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
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Werner Sembach <wse@tuxedocomputers.com>, linux-kernel@vger.kernel.org,
 Cameron Berkenpas <cam@neo-zeon.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Joerg
 Roedel <joro@8bytes.org>, Takashi Iwai <tiwai@suse.com>,
 iommu@lists.linux-foundation.org, Hui
 Wang <hui.wang@canonical.com>, James Wang <james.qian.wang@arm.com>,
 Yong Wu <yong.wu@mediatek.com>, Sami Loone <sami@loone.fi>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav
 Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Kailang
 Yang <kailang@realtek.com>, srv_heupstream@mediatek.com, Stephen
 Boyd <sboyd@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the common compare helper from component.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Jeremy Szu <jeremy.szu@canonical.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>
Cc: Hui Wang <hui.wang@canonical.com>
Cc: Cameron Berkenpas <cam@neo-zeon.de>
Cc: Kailang Yang <kailang@realtek.com>
Cc: Lucas Tanure <tanureal@opensource.cirrus.com>
Cc: Sami Loone <sami@loone.fi>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 sound/pci/hda/patch_realtek.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 668274e52674..9da004d99cdb 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6530,11 +6530,6 @@ static void alc287_fixup_legion_15imhg05_speakers(struct hda_codec *codec,
 	}
 }
 
-static int comp_match_dev_name(struct device *dev, void *data)
-{
-	return strcmp(dev_name(dev), data) == 0;
-}
-
 static int find_comp_by_dev_name(struct alc_spec *spec, const char *name)
 {
 	int i;
@@ -6595,7 +6590,7 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
 					      "%s-%s:00-cs35l41-hda.%d", bus, hid, i);
 			if (!name)
 				return;
-			component_match_add(dev, &spec->match, comp_match_dev_name, name);
+			component_match_add(dev, &spec->match, component_compare_dev_name, name);
 		}
 		ret = component_master_add_with_match(dev, &comp_master_ops, spec->match);
 		if (ret)
@@ -6644,9 +6639,9 @@ static void alc287_fixup_legion_16achg6_speakers(struct hda_codec *cdc, const st
 
 	switch (action) {
 	case HDA_FIXUP_ACT_PRE_PROBE:
-		component_match_add(dev, &spec->match, comp_match_dev_name,
+		component_match_add(dev, &spec->match, component_compare_dev_name,
 				    "i2c-CLSA0100:00-cs35l41-hda.0");
-		component_match_add(dev, &spec->match, comp_match_dev_name,
+		component_match_add(dev, &spec->match, component_compare_dev_name,
 				    "i2c-CLSA0100:00-cs35l41-hda.1");
 		ret = component_master_add_with_match(dev, &comp_master_ops, spec->match);
 		if (ret)
-- 
2.18.0

