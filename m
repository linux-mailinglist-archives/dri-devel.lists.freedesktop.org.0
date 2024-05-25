Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 125C68CF1FB
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 01:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CAA10E482;
	Sat, 25 May 2024 23:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="bxib8nGO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850C610E73F
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2024 23:08:19 +0000 (UTC)
X-UUID: a9743be61aeb11ef8c37dd7afa272265-20240526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=B8rLV0HeBn69eRaQfJMzJjbq3WYSpLpvqrC1Q0pSsCA=; 
 b=bxib8nGOGrFxYg5faEzXumTHLbLaFo/eYvoH+4oZ8OeNro/UQNWEC2rHfD7nqT0YAgSWOLxg9dN2ALGrK3c7q5mDQu2sbatWb3vamG7EoNihkihZelYzPn63ni/yIr+UZMDuewsQ49y1+jzj1whvu/5FymPvHjenPsKPJkhNrss=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:f4e72cdf-cbe0-46f8-ae1d-ff19ce0b4dea, IP:0,
 U
 RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:100
X-CID-META: VersionHash:82c5f88, CLOUDID:f84dcd43-4544-4d06-b2b2-d7e12813c598,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
 il,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
 S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a9743be61aeb11ef8c37dd7afa272265-20240526
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2133953594; Sun, 26 May 2024 07:08:13 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 26 May 2024 07:08:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 26 May 2024 07:08:10 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Conor Dooley <conor+dt@kernel.org>, Jason-ch Chen
 <jason-ch.chen@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-jh Lin
 <jason-jh.lin@mediatek.corp-partner.google.com>
Subject: [PATCH v6 0/8] Add CMDQ secure driver for SVP
Date: Sun, 26 May 2024 07:08:02 +0800
Message-ID: <20240525230810.24623-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.574600-8.000000
X-TMASE-MatchedRID: HhL2K2fGQMRsLX/Zy50gf4QnnAFRgjn9OlW1BAebvzBzwVmY5TMrNmSQ
 gJ6pnW8lfTfiNIO3sGjdzcJEB3Zs4SgoulOyr3u8/4ToWehCRQUZKp0SZ4P+dcUmcSma304TOGj
 73Ju1zWPhNoChA1M9WA7VVWr/VuT8LSTGw1g/Kd4SEYfcJF0pRbLiLKO9VZOiGNAPebYwJ/uYAj
 JavrGfnw/OeYZBTj6CEdcBbrgDa8DHGs1A87wEZt35+5/2RxqmiK5qg1cmsr+na6U74e0+qLZVh
 39LD7EPfRvCo8kOueMuDzNTHYi3Lf4zNVp6ir9FA9lly13c/gEraL2mh8ZVK0k7tZaD19NMo8WM
 kQWv6iXBcIE78YqRWo6HM5rqDwqtux1CiS1LpJ8yNvWrkZnUKmwBl3cPmzc+NaSmy0CtSX8vwdI
 o2/jpWg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.574600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B488D17A83804E6D2B18BFC25267F78324440A50A8DE9971BC9C55B18A0ED2162000:8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>

For the Secure Video Path (SVP) feature, inculding the memory stored
secure video content, the registers of display HW pipeline and the
HW configure operations are required to execute in the secure world.

So using a CMDQ secure driver to make all display HW registers
configuration secure DRAM access permision settings execute by GCE
secure thread in the secure world.

We are landing this feature on mt8188 and mt8195 currently.
---
TODO:
1) Squash cmdq_sec_task_exec_work() into cmdq_sec_mbox_send_data()
2) Call into TEE to query cookie instead of using shared memory in
   cmdq_sec_get_cookie()
3) Register shared memory as command buffer instead of copying normal
   command buffer to IWC shared memory
4) Use SOFTDEP to make cmdq_sec_probe later than OPTEE loaded and then
   move cmdq_sec_session_init into cmdq_sec_probe()
5) Remove timeout detection in cmdq_sec_session_send()
---

Changes in v6:
1. Rebase to linux-next
2. Change the way to add gce-events prop into dt-binding and add more
   commit message
3. Remove unused parameters in secure mailbox driver
4. Move cmdq_sec_XXX APIs from secure mailbox driver to helper to fix the
   build cycle dependency error
5. Remove finalize loop API and write_s_reg API patch
6. Add cmdq secure helper API patch

Changes in v5:
1. Sync the local changes

Changes in v4:
1. Rebase on mediatek-drm-next(278640d4d74cd) and fix the conflicts
2. This series is based on 20240307013458.23550-1-jason-jh.lin@mediatek.com

Changes in v3:
1. separate mt8188 driver porting patches to another series
2. separate adding 'mediatek,gce-events' event prop to another series
3. sepatate mailbox helper and controller driver modification to a
   single patch for adding looping thread
4. add kerneldoc for secure mailbox related definition
5. add moving reuseable definition patch before adding secure mailbox
   driver patch
6. adjust redundant logic in mtk-cmdq-sec-mailbox

Changes in v2:
1. adjust dt-binding SW event define patch before the dt-binding patch using it
2. adjust dt-binding patch for secure cmdq driver
3. remove the redundant patches or merge the patches of modification for the same API
---

Jason-JH.Lin (8):
  dt-bindings: gce: mt8195: Add CMDQ_SYNC_TOKEN_SECURE_THR_EOF event id
  dt-bindings: mailbox: Add property for CMDQ secure driver
  soc: mediatek: cmdq: Add cmdq_pkt_logic_command to support math
    operation
  mailbox: mtk-cmdq: Support GCE loop packets in interrupt handler
  mailbox: mediatek: Move reuseable definition to header for secure
    driver
  mailbox: mediatek: Add CMDQ secure mailbox driver
  mailbox: mediatek: Add secure CMDQ driver support for CMDQ driver
  soc: mediatek: mtk-cmdq: Add secure cmdq_pkt APIs

 .../mailbox/mediatek,gce-mailbox.yaml         |   8 +-
 drivers/mailbox/Makefile                      |   2 +-
 drivers/mailbox/mtk-cmdq-mailbox.c            | 113 ++-
 drivers/mailbox/mtk-cmdq-sec-mailbox.c        | 932 ++++++++++++++++++
 drivers/mailbox/mtk-cmdq-sec-tee.c            | 195 ++++
 drivers/soc/mediatek/mtk-cmdq-helper.c        | 191 ++++
 include/dt-bindings/gce/mt8195-gce.h          |   6 +
 include/linux/mailbox/mtk-cmdq-mailbox.h      |  35 +
 .../linux/mailbox/mtk-cmdq-sec-iwc-common.h   | 342 +++++++
 include/linux/mailbox/mtk-cmdq-sec-mailbox.h  | 106 ++
 include/linux/mailbox/mtk-cmdq-sec-tee.h      | 105 ++
 include/linux/soc/mediatek/mtk-cmdq.h         | 113 +++
 12 files changed, 2118 insertions(+), 30 deletions(-)
 create mode 100644 drivers/mailbox/mtk-cmdq-sec-mailbox.c
 create mode 100644 drivers/mailbox/mtk-cmdq-sec-tee.c
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-iwc-common.h
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-mailbox.h
 create mode 100644 include/linux/mailbox/mtk-cmdq-sec-tee.h

-- 
2.18.0

