Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 160E22865B9
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 19:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634916E997;
	Wed,  7 Oct 2020 17:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C7D6E977
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 17:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=muKo33B5pE07VydQS36WvuhHYxMAAUPaO8Pgeyvfy1Y=; b=mMaO+bHPpQoDuNI73ywGPN0wTU
 fuvqxiv+uYOtIr+yjtKtUUEVsWEFaP2CN8lB+y3PSZ8kLzczRR0CfefcqvC6P6r9NWRKj2E1F5Lte
 jzUcBsS2ilgfpQnT+AGtDcoCmdrsG+5c+tKW5ZC1Vk8PYVd5c/BfWnR5LhzClCi+xggUWc5JD2o7B
 Vh5BFlZfpPnu8c1ufkaOGQM/+KJYAtLUyFdCC8gOXTpMuv9SkOBO2a12soaKDhrpj3Llka3kFAvrz
 QmjstQMBbX6RJrNDSt4TbjqLiMoLVHC1jBbWznHszF7Jp4Qb0FelzOvzxqmYzAJaSjBMA8WywqS7o
 U85N55fg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1kQD41-0006P9-2m; Wed, 07 Oct 2020 20:17:17 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v3 17/20] drm/tegra: Set resv fields when importing/exporting
 GEMs
Date: Wed,  7 Oct 2020 20:12:35 +0300
Message-Id: <20201007171238.1795964-18-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007171238.1795964-1-mperttunen@nvidia.com>
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
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
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
