Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 981AA608424
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 06:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F2E10E6D1;
	Sat, 22 Oct 2022 04:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA65110E6C0
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Oct 2022 04:02:53 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id CDFEB320A12;
 Sat, 22 Oct 2022 05:02:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1666411372; bh=Jt6+ZyDKPnFduIdOjEuolGhFpHQwAijaE/zigCU9kZM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S+bIB7zctFEA9xp4pwj97akRcU3Lh3l+DxEEMf9J2ZOVxfShRJaW5iifB//Svq8pT
 2995fOHEJMCOubtYEZLcrKV2tAriIAVW/EkdAnutK3317G5i8rUw/SF7lB9fBaz073
 bb8H+EpSjI6Hj7Q01GmiypDkNhST1VU4tSr29KvK5bc8em5wMHdtBHhiZNa18Xn2nf
 39NQQ2cnJ0JANFztltJc9OdTOrOrsDHuChulf4nVgKFPUv8bV9BjnJf/0MYD00gHXm
 uFNsm/NIK+f+SHO8WtcWN/1qQdW5w2s0lRxYjsNGL6yBOhxzKeIJybh2K97InXolf9
 wtJvEuc0cyDag==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 16/17] drm/vmwgfx: Optimize initial sizes of cotables
Date: Sat, 22 Oct 2022 00:02:35 -0400
Message-Id: <20221022040236.616490-17-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022040236.616490-1-zack@kde.org>
References: <20221022040236.616490-1-zack@kde.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, banackm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

It's important to get the initial size of cotables right because
otherwise every app needs to start with a synchronous cotable resize.

This has an measurable impact on system wide performance but is not
relevant for long running single full screen apps for which the cotable
resizes will happen early in the lifecycle and will continue running
just fine.

To eliminate the initial cotable resizes match the initial sizes to what
the userspace expects. The actual result of the patch is simply setting
the initial size of two of the cotables to a size that will align them
to two pages instead of one.

For a piglit run, before:
name               |  total |  per frame | per sec
vmw_cotable_resize |   1405 |       0.12 |    1.58
vmw_execbuf_ioctl  | 290805 |      25.43 |  326.05

After:
name               |  total |  per frame | per sec
vmw_cotable_resize |      4 |       0.00 |    0.00
vmw_execbuf_ioctl  | 281673 |      25.10 |  274.68

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Michael Banack <banackm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
index a4c30f950d7c..0422b6b89cc1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
@@ -73,12 +73,24 @@ struct vmw_cotable_info {
 			    bool);
 };
 
+
+/*
+ * Getting the initial size right is difficult because it all depends
+ * on what the userspace is doing. The sizes will be aligned up to
+ * a PAGE_SIZE so we just want to make sure that for majority of apps
+ * the initial number of entries doesn't require an immediate resize.
+ * For all cotables except SVGACOTableDXElementLayoutEntry and
+ * SVGACOTableDXBlendStateEntry the initial number of entries fits
+ * within the PAGE_SIZE. For SVGACOTableDXElementLayoutEntry and
+ * SVGACOTableDXBlendStateEntry we want to reserve two pages,
+ * because that's what all apps will require initially.
+ */
 static const struct vmw_cotable_info co_info[] = {
 	{1, sizeof(SVGACOTableDXRTViewEntry), &vmw_view_cotable_list_destroy},
 	{1, sizeof(SVGACOTableDXDSViewEntry), &vmw_view_cotable_list_destroy},
 	{1, sizeof(SVGACOTableDXSRViewEntry), &vmw_view_cotable_list_destroy},
-	{1, sizeof(SVGACOTableDXElementLayoutEntry), NULL},
-	{1, sizeof(SVGACOTableDXBlendStateEntry), NULL},
+	{PAGE_SIZE/sizeof(SVGACOTableDXElementLayoutEntry) + 1, sizeof(SVGACOTableDXElementLayoutEntry), NULL},
+	{PAGE_SIZE/sizeof(SVGACOTableDXBlendStateEntry) + 1, sizeof(SVGACOTableDXBlendStateEntry), NULL},
 	{1, sizeof(SVGACOTableDXDepthStencilEntry), NULL},
 	{1, sizeof(SVGACOTableDXRasterizerStateEntry), NULL},
 	{1, sizeof(SVGACOTableDXSamplerEntry), NULL},
-- 
2.34.1

