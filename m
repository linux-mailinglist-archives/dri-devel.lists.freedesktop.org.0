Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2953A43E9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 16:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DA06E03D;
	Fri, 11 Jun 2021 14:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38AC6E03D;
 Fri, 11 Jun 2021 14:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4XHeMHYpflYk86WCecrWDHGMAHWxZI12QAqDiuwkn4M=; b=YwSohPcEeU2K8H1ymGyMvFyfWA
 VH0lqsZ6If2skIjMScrj7tFztpVZK6fpWQ0+e9y0kk0kcf6KYfDDvPlfJJs6FrFyKRVKpBDfSh/EK
 3/wydZDluKn02g3wQyt8kQeimCyWNLJsUikJyZjET4JVlWKOgAjcryhGappxIjE0WfEak5G6oan5m
 8658ENap2C3MVzsYtWBDTIrm4J7ukrkkkKwRgL0IMbA9aj/Ng9zhBoom6+49vz7R3ifGH/lvCEHzY
 YcymNrBva/PnSfFlYQftIygFMIJbq0+xHCiD5SZkfXKmXweui2Ukwahfw+SXukoNFpnmJr+JZc3hr
 yyQWoX8Q==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1lrhzf-0006vt-RK; Fri, 11 Jun 2021 17:18:43 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: bskeggs@redhat.com
Subject: [PATCH] drm/nouveau/gk20a: fix NULL dereference on allocation failure
Date: Fri, 11 Jun 2021 17:18:05 +0300
Message-Id: <20210611141805.4084202-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If memory allocation fails, `node->base.imem` does not get populated,
causing a NULL pointer dereference on instobj destruction. Fix this
by dereferencing it only if the allocation was successful.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
index 648ecf5a8fbc..66d60d8bec60 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
@@ -296,12 +296,12 @@ gk20a_instobj_dtor_dma(struct nvkm_memory *memory)
 {
 	struct gk20a_instobj_dma *node = gk20a_instobj_dma(memory);
 	struct gk20a_instmem *imem = node->base.imem;
-	struct device *dev = imem->base.subdev.device->dev;
 
 	if (unlikely(!node->base.vaddr))
 		goto out;
 
-	dma_free_attrs(dev, (u64)node->base.mn->length << PAGE_SHIFT,
+	dma_free_attrs(imem->base.subdev.device->dev,
+		       (u64)node->base.mn->length << PAGE_SHIFT,
 		       node->base.vaddr, node->handle, imem->attrs);
 
 out:
-- 
2.30.1

