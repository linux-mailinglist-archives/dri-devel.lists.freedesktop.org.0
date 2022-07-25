Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EF157FF65
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 14:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75E9AE64C;
	Mon, 25 Jul 2022 12:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 469 seconds by postgrey-1.36 at gabe;
 Mon, 25 Jul 2022 10:53:49 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC53794CE9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 10:53:49 +0000 (UTC)
Received: from alisa-ThinkPad-T440s.. (unknown [83.149.199.65])
 by mail.ispras.ru (Postfix) with ESMTPS id D00E440D403D;
 Mon, 25 Jul 2022 10:45:56 +0000 (UTC)
From: Alisa Khabibrakhmanova <khabibrakhmanova@ispras.ru>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/via: Add new condition to via_dma_cleanup()
Date: Mon, 25 Jul 2022 13:45:55 +0300
Message-Id: <20220725104555.124044-1-khabibrakhmanova@ispras.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 25 Jul 2022 12:57:02 +0000
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
Cc: ldv-project@linuxtesting.org,
 Alisa Khabibrakhmanova <khabibrakhmanova@ispras.ru>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pointer dev_priv->mmio, which was checked for NULL at via_do_init_map(),
is passed to via_do_cleanup_map() and is dereferenced there without check.

The patch adds the condition in via_dma_cleanup() which prevents potential NULL
pointer dereference.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 22f579c621e2 ("drm: Add via unichrome support")
Signed-off-by: Alisa Khabibrakhmanova <khabibrakhmanova@ispras.ru>
---
 drivers/gpu/drm/via/via_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/via/via_dma.c b/drivers/gpu/drm/via/via_dma.c
index 177b0499abf1..56bcbbf4ed54 100644
--- a/drivers/gpu/drm/via/via_dma.c
+++ b/drivers/gpu/drm/via/via_dma.c
@@ -164,7 +164,7 @@ int via_dma_cleanup(struct drm_device *dev)
 		drm_via_private_t *dev_priv =
 		    (drm_via_private_t *) dev->dev_private;
 
-		if (dev_priv->ring.virtual_start) {
+		if (dev_priv->ring.virtual_start && dev_priv->mmio) {
 			via_cmdbuf_reset(dev_priv);
 
 			drm_legacy_ioremapfree(&dev_priv->ring.map, dev);
-- 
2.34.1

