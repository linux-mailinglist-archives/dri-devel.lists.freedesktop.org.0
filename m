Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE3A28C917
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 09:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F216E897;
	Tue, 13 Oct 2020 07:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5414D6E2C0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 11:57:10 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.124])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id D2857482BD2;
 Mon, 12 Oct 2020 19:57:05 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpu/drm/mediatek: fix unused parameter warning
Date: Mon, 12 Oct 2020 04:56:59 -0700
Message-Id: <20201012115700.8925-1-bernard@vivo.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZSkpLTE5JTElCTUMaVkpNS0lOS0hDSU1KSk1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MzI6NRw4HD8eQjk3IxccFQ1M
 Tj4aC1FVSlVKTUtJTktIQ0lNTk9OVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU9ZV1kIAVlBSEtMTDcG
X-HM-Tid: 0a751cabda8693bakuwsd2857482bd2
X-Mailman-Approved-At: Tue, 13 Oct 2020 07:16:53 +0000
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Functions mtk_drm_crtc_atomic_flush & mtk_drm_crtc_atomic_enable
& mtk_drm_crtc_atomic_disable don`t use the second parameter.
So we may get warning like : warning: unused parameter '***'
[-Wunused-parameter].
This change is to fix the compile warning with -Wunused-parameter.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 4d29568be3f5..6e55ec0e80bb 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -542,7 +542,7 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 }
 
 static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
-					struct drm_crtc_state *old_state)
+					struct drm_crtc_state __attribute__((unused)) *old_state)
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
@@ -575,7 +575,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 }
 
 static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,
-				      struct drm_crtc_state *old_crtc_state)
+				      struct drm_crtc_state __attribute__((unused)) *old_crtc_state)
 {
 	struct mtk_crtc_state *state = to_mtk_crtc_state(crtc->state);
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
@@ -592,7 +592,7 @@ static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,
 }
 
 static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
-				      struct drm_crtc_state *old_crtc_state)
+				      struct drm_crtc_state __attribute__((unused)) *old_crtc_state)
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	int i;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
