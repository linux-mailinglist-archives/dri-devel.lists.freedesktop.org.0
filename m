Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD6679086B
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 17:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623FA10E237;
	Sat,  2 Sep 2023 15:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr
 [80.12.242.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBEC10E079
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Sep 2023 15:22:29 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id cSRzqoXOCUaEwcSSBqaS0o; Sat, 02 Sep 2023 17:22:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1693668148;
 bh=CcJIylx4XWMH4i7v7yeGHjUJhvGVgKvnNJDrOuGdvbc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=bV5n2JhbrP+dnNHvPqRj7xIc7xk8nYL0d3ORcvjfuJUcm/aJAnFjARdnxFau3J1LI
 apG7Baj8mgHspXAEcJHsT707PzwGGjS7C2XJcVIG9uIWCa7IoSjRwbD0k/lTU/4ZFf
 VKE1pOGrzh8ZGS+tOxjNur0CFosUloL6Do4Z6FgL99d3FjLxTPz6nVrw083gcUkVzC
 2HWW5JKLxuzvgcrrQ5OyyKTEtXmQbA72Zh/ABhjC8OohvC1KJmqg0Tu8zHA2Kc5Fb8
 v3aZ1zed/PlcHe8T20E1GQyx7MQDSIeLjTiLTjKOQsXLck9dQ6vlvNBWLCLZkq46MS
 8/YJ2NVIZY/mA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 02 Sep 2023 17:22:28 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
 daniel@ffwll.ch, jonathanh@nvidia.com, digetx@gmail.com
Subject: [PATCH 2/6] drm/tegra: dsi: Fix missing pm_runtime_disable() in the
 error handling path of tegra_dsi_probe()
Date: Sat,  2 Sep 2023 17:22:09 +0200
Message-Id: <ee4a15c9cd4b574a55cd67c30d2411239ba2cee9.1693667005.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693667005.git.christophe.jaillet@wanadoo.fr>
References: <cover.1693667005.git.christophe.jaillet@wanadoo.fr>
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
Cc: linux-tegra@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If an error occurs after calling pm_runtime_enable(), pm_runtime_disable()
should be called as already done in the remove function.

Fixes: ef8187d75265 ("drm/tegra: dsi: Implement runtime PM")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/tegra/dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 70a77c75bfe1..0cf379e20d89 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1672,6 +1672,7 @@ static int tegra_dsi_probe(struct platform_device *pdev)
 	return 0;
 
 unregister:
+	pm_runtime_disable(&pdev->dev);
 	mipi_dsi_host_unregister(&dsi->host);
 mipi_free:
 	tegra_mipi_free(dsi->mipi);
-- 
2.34.1

