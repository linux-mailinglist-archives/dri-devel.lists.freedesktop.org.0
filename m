Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBFC3CDF82
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 17:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB6789D84;
	Mon, 19 Jul 2021 15:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F01E89D84
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 15:52:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1EDF61355;
 Mon, 19 Jul 2021 15:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1626709968;
 bh=bLkTOJtbe8Helps9fOjz0NsV36Nty9glQZHdOPbH0Uc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rGXm+QmxDwNx06YAuHAX2QSyvAftseCmarIF6sApPImF3ydIdHIQq4hSNU50Lykt/
 PMmvN4cxaiLh+j7QnnfB/XPBpD3uh2czM842UPcUyXl4tljHG9pIXnfupb+1P5Knbz
 V3F/+793WsE0ERfo14Ph8cdtCx2nG8HNBrHzecLw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.10 020/243] Revert "drm/ast: Remove reference to struct
 drm_device.pdev"
Date: Mon, 19 Jul 2021 16:50:49 +0200
Message-Id: <20210719144941.585775782@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210719144940.904087935@linuxfoundation.org>
References: <20210719144940.904087935@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: kernel test robot <lkp@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Xiaotian Feng <xtfeng@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

This reverts commit fcb041ca5c7787b096aafc899e45f93583e66cbd which is
commit 0ecb51824e838372e01330752503ddf9c0430ef7 upstream.

Turns out this was incomplete, as it is missing a dependancy, so drop it
from the tree.

Link: https://lore.kernel.org/r/CAJn8CcHHKSo7GF29Z1ufXJJpMUzn6+fdvwiqe9=JvgpcfvnbHQ@mail.gmail.com
Reported-by: Xiaotian Feng <xtfeng@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
Cc: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
Cc: kernel test robot <lkp@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ast/ast_main.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -406,6 +406,7 @@ struct ast_private *ast_device_create(st
 		return ast;
 	dev = &ast->base;
 
+	dev->pdev = pdev;
 	pci_set_drvdata(pdev, dev);
 
 	ast->regs = pcim_iomap(pdev, 1, 0);
@@ -447,8 +448,8 @@ struct ast_private *ast_device_create(st
 
 	/* map reserved buffer */
 	ast->dp501_fw_buf = NULL;
-	if (dev->vram_mm->vram_size < pci_resource_len(pdev, 0)) {
-		ast->dp501_fw_buf = pci_iomap_range(pdev, 0, dev->vram_mm->vram_size, 0);
+	if (dev->vram_mm->vram_size < pci_resource_len(dev->pdev, 0)) {
+		ast->dp501_fw_buf = pci_iomap_range(dev->pdev, 0, dev->vram_mm->vram_size, 0);
 		if (!ast->dp501_fw_buf)
 			drm_info(dev, "failed to map reserved buffer!\n");
 	}


