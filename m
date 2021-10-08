Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B91A426F9A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 19:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202B86E10C;
	Fri,  8 Oct 2021 17:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6BB6E0FB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 17:31:56 +0000 (UTC)
Received: from sc9-mailhost2.vmware.com (10.113.161.72) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Fri, 8 Oct 2021 10:31:51 -0700
Received: from vmware.com (unknown [10.21.244.180])
 by sc9-mailhost2.vmware.com (Postfix) with ESMTP id A51A4204FD;
 Fri,  8 Oct 2021 10:31:55 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
CC: Zack Rusin <zackr@vmware.com>, Martin Krastev <krastevm@vmware.com>
Subject: [PATCH 5/5] drm/vmwgfx: Switch the internal BO's to ttm_bo_type_kernel
Date: Fri, 8 Oct 2021 13:31:46 -0400
Message-ID: <20211008173146.645127-6-zackr@vmware.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008173146.645127-1-zackr@vmware.com>
References: <20211008173146.645127-1-zackr@vmware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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

There's never a need to access our internal kernel bo's from
user-space. Those objects are used exclusively for internal
support to guest backed surfaces (in otable setup and mob
page tables) and there's no need to have them be of device
type, i.e. mmappable from user-space.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index fd007f1c1776..c97a3d5e90ce 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -494,7 +494,7 @@ int vmw_bo_create_kernel(struct vmw_private *dev_priv, unsigned long size,
 	drm_vma_node_reset(&bo->base.vma_node);
 
 	ret = ttm_bo_init_reserved(&dev_priv->bdev, bo, size,
-				   ttm_bo_type_device, placement, 0,
+				   ttm_bo_type_kernel, placement, 0,
 				   &ctx, NULL, NULL, NULL);
 	if (unlikely(ret))
 		goto error_account;
-- 
2.30.2

