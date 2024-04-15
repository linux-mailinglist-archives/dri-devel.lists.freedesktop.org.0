Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6228A53A4
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 16:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09106112605;
	Mon, 15 Apr 2024 14:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LB1g7H6D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3A811260E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 14:29:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1088460E09;
 Mon, 15 Apr 2024 14:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560A1C113CC;
 Mon, 15 Apr 2024 14:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1713191383;
 bh=pZRLvPp4IcUnaNponfMJhHIoY6n4giFqelSQITcj/gk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LB1g7H6D4rFgDhISYE5tacfOP6zEcBSkzepOIOOGV31xugoflfQj30gUbx1DrkekT
 7vQh9bBbx/b1IY/hL6xI2Uo4rjZlaHNgroj8K0j2VSjA3fEXGmbAj1/D5Ls0oRFyQ9
 9hQTVlCJtfWdvohiq8GoQy/ESNfpOmGf+dI5CaCA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Zack Rusin <zack.rusin@broadcom.com>, Ye Li <ye.li@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 dri-devel@lists.freedesktop.org,
 Martin Krastev <martin.krastev@broadcom.com>
Subject: [PATCH 6.8 123/172] drm/vmwgfx: Enable DMA mappings with SEV
Date: Mon, 15 Apr 2024 16:20:22 +0200
Message-ID: <20240415142004.126450114@linuxfoundation.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240415141959.976094777@linuxfoundation.org>
References: <20240415141959.976094777@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

6.8-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Zack Rusin <zack.rusin@broadcom.com>

commit 4c08f01934ab67d1d283d5cbaa52b923abcfe4cd upstream.

Enable DMA mappings in vmwgfx after TTM has been fixed in commit
3bf3710e3718 ("drm/ttm: Add a generic TTM memcpy move for page-based iomem")

This enables full guest-backed memory support and in particular allows
usage of screen targets as the presentation mechanism.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Reported-by: Ye Li <ye.li@broadcom.com>
Tested-by: Ye Li <ye.li@broadcom.com>
Fixes: 3b0d6458c705 ("drm/vmwgfx: Refuse DMA operation when SEV encryption is active")
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.6+
Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240408022802.358641-1-zack.rusin@broadcom.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -666,11 +666,12 @@ static int vmw_dma_select_mode(struct vm
 		[vmw_dma_map_populate] = "Caching DMA mappings.",
 		[vmw_dma_map_bind] = "Giving up DMA mappings early."};
 
-	/* TTM currently doesn't fully support SEV encryption. */
-	if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
-		return -EINVAL;
-
-	if (vmw_force_coherent)
+	/*
+	 * When running with SEV we always want dma mappings, because
+	 * otherwise ttm tt pool pages will bounce through swiotlb running
+	 * out of available space.
+	 */
+	if (vmw_force_coherent || cc_platform_has(CC_ATTR_MEM_ENCRYPT))
 		dev_priv->map_mode = vmw_dma_alloc_coherent;
 	else if (vmw_restrict_iommu)
 		dev_priv->map_mode = vmw_dma_map_bind;


