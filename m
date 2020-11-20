Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2629F2BA900
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 12:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585826E8B4;
	Fri, 20 Nov 2020 11:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9559B6E8B8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 11:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O3hj3BCdAYlTpve5LZhOzRjCcep0BRuZm2roFfTmKTY=; b=nH1K/Evrb1toP5acgZVA5CGzs9
 k07sK0Y706oJwS/SDJ+V14hdIkVLb2Xgngxm7zeIFmTDZ9EocDl8y2iH+O6yINIg+Sr1sOQ+R2Tp3
 mXJG/UTovXolOKlqEG+F3FKd5sVFe5aO1EucaoUcu8RuPgj1Kd1m/cV98D8Cp6MRTZPDjgQ/OjZET
 kDGwbPaprObag1ryR1YAVCgksRrTPCpFT7+SFuAao3PjXlpuBBq4bN+cc9LASRBgkRlkNixoW3u0V
 WIrxQXMSfKlOFXb8lDFO+i2rd+MwIAPZi8jNSkXdIuZrBJPJoVO2ThdkFY/1AihvyODx29T9Q+iXE
 tRZcthaA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kg4Yr-0003lG-Q4; Fri, 20 Nov 2020 13:26:41 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v4 17/21] drm/tegra: Set resv fields when importing/exporting
 GEMs
Date: Fri, 20 Nov 2020 13:25:56 +0200
Message-Id: <20201120112600.935082-18-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120112600.935082-1-mperttunen@nvidia.com>
References: <20201120112600.935082-1-mperttunen@nvidia.com>
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To allow sharing of implicit fences when exporting/importing dma_buf
objects, set the 'resv' fields when importing or exporting GEM
objects.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 723df142a981..4a8acd4724bd 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -423,6 +423,7 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
 	}
 
 	bo->gem.import_attach = attach;
+	bo->gem.resv = buf->resv;
 
 	return bo;
 
@@ -675,6 +676,7 @@ struct dma_buf *tegra_gem_prime_export(struct drm_gem_object *gem,
 	exp_info.size = gem->size;
 	exp_info.flags = flags;
 	exp_info.priv = gem;
+	exp_info.resv = gem->resv;
 
 	return drm_gem_dmabuf_export(gem->dev, &exp_info);
 }
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
