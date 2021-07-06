Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 318083BCDF6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FCB6E3E5;
	Tue,  6 Jul 2021 11:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434786E3E5
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 11:22:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F20561CCB;
 Tue,  6 Jul 2021 11:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570547;
 bh=UTqXKaW6JbYoJqpVG9EU8rB4wX9Lk/dAbhbGsvYNTr0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OJgCyJvE+BfGl3gwmEHluFs7t4IRt5djLdQMeiLDWLWr5RD3LpNeatBkJze9D2qxH
 irhSHAl8q7GHeZKOUUXkK3q4RchjcA4UXCvP3JvhKY/h+G1t+ecoCF0EVykSaUDhv8
 0lgJHh+JS5NKK+eB8K4W9+icCUIxgbZ4sB5CnPWjy3OcW5xYke5RNcrKmXA06lHeMV
 hJGUKpUbju0nG4Gtu5s4f5pJnM/MHWTFdErOirZp1/9YFOwu9+psWt1wtAeSuQjHmE
 EZOArg9M4MHs2At2r+36xMkV/BT6QuK6xYYfZVyvnsV13MhLLeSUs2wi+7v6zXzr22
 Gzk4G5yddQ3kg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 017/137] drm/mediatek: Fix PM reference leak in
 mtk_crtc_ddp_hw_init()
Date: Tue,  6 Jul 2021 07:20:03 -0400
Message-Id: <20210706112203.2062605-17-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706112203.2062605-1-sashal@kernel.org>
References: <20210706112203.2062605-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 dri-devel@lists.freedesktop.org, Hulk Robot <hulkci@huawei.com>,
 linux-mediatek@lists.infradead.org, Wang Li <wangli74@huawei.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wang Li <wangli74@huawei.com>

[ Upstream commit 69777e6ca396f0a7e1baff40fcad4a9d3d445b7a ]

pm_runtime_get_sync will increment pm usage counter even it failed.
Forgetting to putting operation will result in reference leak here.
Fix it by replacing it with pm_runtime_resume_and_get to keep usage
counter balanced.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Li <wangli74@huawei.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index ac038572164d..dfd5ed15a7f4 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -274,7 +274,7 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
 		drm_connector_list_iter_end(&conn_iter);
 	}
 
-	ret = pm_runtime_get_sync(crtc->dev->dev);
+	ret = pm_runtime_resume_and_get(crtc->dev->dev);
 	if (ret < 0) {
 		DRM_ERROR("Failed to enable power domain: %d\n", ret);
 		return ret;
-- 
2.30.2

