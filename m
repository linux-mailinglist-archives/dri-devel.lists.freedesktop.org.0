Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9D980CC82
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 15:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528F210E433;
	Mon, 11 Dec 2023 14:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF3C10E433
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 14:02:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA8AD61015;
 Mon, 11 Dec 2023 14:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574F8C433CC;
 Mon, 11 Dec 2023 14:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702303322;
 bh=dIioi2bi7bnyNeoBvC0vc3rny0pswu88W/yM/rhZOk8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JP7D639gKrpweJ0O6IM9CMNjRFCcqynqo9y/64O5OyEE74PTQCH6T39OAqgqAXvvQ
 ryPOywILXXcXjdv8vDqURmeMvSj6hAM4mjsolz3bw2DKauY3Sgazl49DVZLGKjdFcM
 /hcBrwluGEjGdpw0WkmL18OBs9nERucs9TYiJkWB3Ol6o5qgg+q5c10EL4JL6n1knT
 1IHt18Te/DkItlG0oTbDINwjNdu3rOap2bQZCms3shjtzWAOpg6Ya0FtdAT3dz2+DY
 yyT7fFdM2zrZ9XSkJxM1DTvMw0WHWmx12/XdKcySd/ATggjVKWP7U9BbvBJRaUOeou
 6pg4u9uNp1h8A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 15/16] drm/exynos: fix a potential error pointer
 dereference
Date: Mon, 11 Dec 2023 09:00:39 -0500
Message-ID: <20231211140116.391986-15-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211140116.391986-1-sashal@kernel.org>
References: <20231211140116.391986-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.203
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
Cc: Sasha Levin <sashal@kernel.org>, linux-samsung-soc@vger.kernel.org,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski@linaro.org,
 Xiang Yang <xiangyang3@huawei.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiang Yang <xiangyang3@huawei.com>

[ Upstream commit 73bf1c9ae6c054c53b8e84452c5e46f86dd28246 ]

Smatch reports the warning below:
drivers/gpu/drm/exynos/exynos_hdmi.c:1864 hdmi_bind()
error: 'crtc' dereferencing possible ERR_PTR()

The return value of exynos_drm_crtc_get_by_type maybe ERR_PTR(-ENODEV),
which can not be used directly. Fix this by checking the return value
before using it.

Signed-off-by: Xiang Yang <xiangyang3@huawei.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index dc01c188c0e09..981bffacda243 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1849,6 +1849,8 @@ static int hdmi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 
 	crtc = exynos_drm_crtc_get_by_type(drm_dev, EXYNOS_DISPLAY_TYPE_HDMI);
+	if (IS_ERR(crtc))
+		return PTR_ERR(crtc);
 	crtc->pipe_clk = &hdata->phy_clk;
 
 	ret = hdmi_create_connector(encoder);
-- 
2.42.0

