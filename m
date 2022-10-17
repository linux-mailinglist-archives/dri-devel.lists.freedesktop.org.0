Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CFB601818
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 21:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B15B10E734;
	Mon, 17 Oct 2022 19:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC5010EDFC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 19:55:03 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 1A2A133EFE7;
 Mon, 17 Oct 2022 20:55:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1666036502; bh=Jt6+ZyDKPnFduIdOjEuolGhFpHQwAijaE/zigCU9kZM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WmabxL0WRKtv2VMp3nwovrhiULctVnp2ylD4TFYoLT9psBT3U8zEaB8zUjZ962qzE
 ddxFte3LSDnees6RXDjVd6hGdS1kJGLlpMeFOOZndVJGBl3HAar1OUrlJahMuC+joL
 1PB6aogojD1aORCoob6v+CkerGAJVwRrukJp4qvbPpn3Q8xPxpsGwWiRqWYdPaf3dA
 HrWk/A4ZetEee7GbH/0R65dGlN6eUWyP7WLz1FhYo9wI7klaI70BK4oMJdRPRFaseq
 /zk5RM+/tgQBp1cGjqZ6IylLQkjHDoycyZYc+TeUAJd4m73XSYld8WT0nQaRR8eLKM
 5uCMd5Iyc5JLw==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 16/16] drm/vmwgfx: Optimize initial sizes of cotables
Date: Mon, 17 Oct 2022 15:54:40 -0400
Message-Id: <20221017195440.311862-17-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017195440.311862-1-zack@kde.org>
References: <20221017195440.311862-1-zack@kde.org>
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

