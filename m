Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A7E117F5C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 06:05:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375CA6E80B;
	Tue, 10 Dec 2019 05:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id BAC3F6E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 05:05:32 +0000 (UTC)
X-UUID: d27c65d71fce4663865810f00bb512fa-20191210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Ely1YZpvhNjk+dbvsntQPD0NZpTuLQm46xCTloZtkzc=; 
 b=j0tv+qYBPFqlSoT1oPOlJa55agEFNxbAkZHJlgeR2yawZ5yDImSaMzm/s95EpJjclPkRIV9jn6zKY/ssetF9n9i47Sfl+QXbEymlpZa6s5rqdOivYjgA8OEVe+KzjhesyUWErF5iQ7aGwTMXNS117Gc3JS2Ej199xXXxOf66Plo=;
X-UUID: d27c65d71fce4663865810f00bb512fa-20191210
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1233116922; Tue, 10 Dec 2019 13:05:29 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 13:05:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 10 Dec 2019 13:05:21 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v5 0/7] drm/mediatek: fix cursor issue and apply CMDQ in MTK
 DRM
Date: Tue, 10 Dec 2019 13:05:19 +0800
Message-ID: <20191210050526.4437-1-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
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
Cc: drinkcat@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, tfiga@chromium.org,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The CMDQ (Command Queue) in MT8183 is used to help update all
relevant display controller registers with critical time limation.
This patch add cmdq interface in ddp_comp interface, let all
ddp_comp interface can support cpu/cmdq function at the same time.

These patches also can fixup cursor moving is not smooth
when heavy load in webgl.

This patch depends on ptach:
add drm support for MT8183
(https://patchwork.kernel.org/cover/11121519/)
support gce on mt8183 platform
(https://patchwork.kernel.org/cover/11255147/)
drm/mediatek: Check return value of mtk_drm_ddp_comp_for_plane
(https://lore.kernel.org/patchwork/patch/1154517/)

Changes since v4:
 - rebase to Linux 5.5-rc1
 - add fixes tag

Changes since v3:
 - remove redundant code and variable

Changes since v2:
 - move some changes to another patch
 - disable layer in atomic_disable()

Changes since v1:
 - remove redundant code
 - merge the duplicate code
 - use async instead of cursor

Changes since v0:
 - remove redundant code
 - remove patch
   "drm/mediatek: fix atomic_state reference counting"
   After remove this patch, the issue we met before is gone.
   So I do not add any extra code to do something.

Bibby Hsieh (7):
  drm/mediatek: use DRM core's atomic commit helper
  drm/mediatek: handle events when enabling/disabling crtc
  drm/mediatek: update cursors by using async atomic update
  drm/mediatek: disable all the planes in atomic_disable
  drm/mediatek: remove unused external function
  drm/mediatek: support CMDQ interface in ddp component
  drm/mediatek: apply CMDQ control flow

 drivers/gpu/drm/mediatek/mtk_disp_color.c   |   7 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  67 ++++----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |  43 ++---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 165 ++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 131 ++++++++++++----
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  47 +++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  86 +---------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   7 -
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    |  47 ++++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.h    |   2 +
 11 files changed, 380 insertions(+), 224 deletions(-)

-- 
2.18.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
