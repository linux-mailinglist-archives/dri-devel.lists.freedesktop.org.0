Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47072537C02
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D7410E8CD;
	Mon, 30 May 2022 13:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (unknown [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205E010E327
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 13:29:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3D191B80DB0;
 Mon, 30 May 2022 13:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3657C36AEA;
 Mon, 30 May 2022 13:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653917295;
 bh=2aro4hsaizbmehGAHGgs444aSUzly18lMFz3EQEQqnA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TJvbwf6ZhSFVpeipBBkBmFGdl1oDAdYJ3nJCKnXPNb1g0jDMTde7+m/aE8QURIKBg
 bg0UN2IFgttjZS3bTMHHi9QE7R8WSy3xcRz8Pn79EQjUVV5wkB3IVz3+lnnazN9AqN
 ezshLbGdKnYnVZkH7MkQ2V1kusvW8fgeFteepK3Qr8nzMkuzbSfysSe5tBo+qwmtzS
 c0K4arulhA+KCWrGpqxCMidF4pV6gUeaLe2huzXLS5clADuIseWZBu6njDeEYbN/p8
 6W7F/BZ1mwVmt3fTP2KxqeKu+YYdqy76aY6YZB+RGJB3ttnME6X380zL2SpdxV5Tza
 zd/sROxlr4apw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 087/159] drm/tegra: gem: Do not try to
 dereference ERR_PTR()
Date: Mon, 30 May 2022 09:23:12 -0400
Message-Id: <20220530132425.1929512-87-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530132425.1929512-1-sashal@kernel.org>
References: <20220530132425.1929512-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, kernel test robot <lkp@intel.com>,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

[ Upstream commit cb7e1abc2c73633e1eefa168ab2dad6e838899c9 ]

When mapping the DMA-BUF attachment fails, map->sgt will be an ERR_PTR-
encoded error code and the cleanup code would try to free that memory,
which obviously would fail.

Zero out that pointer after extracting the error code when this happens
so that kfree() can do the right thing.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/tegra/gem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 0063403ab5e1..7c7dd84e6db8 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -88,6 +88,7 @@ static struct host1x_bo_mapping *tegra_bo_pin(struct device *dev, struct host1x_
 		if (IS_ERR(map->sgt)) {
 			dma_buf_detach(buf, map->attach);
 			err = PTR_ERR(map->sgt);
+			map->sgt = NULL;
 			goto free;
 		}
 
-- 
2.35.1

