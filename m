Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EB23BCE16
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E83B6E3FC;
	Tue,  6 Jul 2021 11:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71DBB6E3FC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 11:23:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99CDA61E0D;
 Tue,  6 Jul 2021 11:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570582;
 bh=vRhNXClf9Vk824eWZ0E1A24JGfsQynC8Y7DYt02HcVI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T4qSspVczqEpaGKhsrNyQ+Mc/2WmQCDyjQM3kfrx2MP2z5KJ2mg+jl7BCSp/90YmS
 j2wZJsT7hgjAqXtxEDncZoaxcLKGaG59VEvTHJjMc3742iPczohx4adgmUUt5DViFC
 7JfF/H7QX8K0XMVVtrmH9vJbUQu2O8LGTJwyeQa9JCQqlZy18EOtfcHFpBzJ5uVVr9
 FRBPo6nonC9gyBIS0fX3STAmApiwbmPG6QOB3RIw/yUhpJSfHAnGjuV7ERfWTHpTbb
 9iLiQaR9My5SUJvqU5hy5cE7/jyiny3+n8uowzlGz5MnFhaJjgdh7qa96EBkyS8jJh
 zIp9Li/lr4KAQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 045/137] drm: bridge: cdns-mhdp8546: Fix PM
 reference leak in
Date: Tue,  6 Jul 2021 07:20:31 -0400
Message-Id: <20210706112203.2062605-45-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Yu Kuai <yukuai3@huawei.com>,
 dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 Hulk Robot <hulkci@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yu Kuai <yukuai3@huawei.com>

[ Upstream commit f674555ee5444c8987dfea0922f1cf6bf0c12847 ]

pm_runtime_get_sync will increment pm usage counter even it failed.
Forgetting to putting operation will result in reference leak here.
Fix it by replacing it with pm_runtime_resume_and_get to keep usage
counter balanced.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210531135622.3348252-1-yukuai3@huawei.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index d0c65610ebb5..f56ff97c9899 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2369,9 +2369,9 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 	clk_prepare_enable(clk);
 
 	pm_runtime_enable(dev);
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
-		dev_err(dev, "pm_runtime_get_sync failed\n");
+		dev_err(dev, "pm_runtime_resume_and_get failed\n");
 		pm_runtime_disable(dev);
 		goto clk_disable;
 	}
-- 
2.30.2

