Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D47D52E11CB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 03:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83E26E88A;
	Wed, 23 Dec 2020 02:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F05D6E889
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 02:17:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E19223380;
 Wed, 23 Dec 2020 02:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689854;
 bh=G5zqusR92rRhDGaUSQvE5Qeq+1DwyScqSVbE98ULT+4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rpd1nE33h2B2FZWkqawlfHTOsVUiwDWcBpQqgZ2ygtPAKCPlY7fkPvR7eAoiKPA1c
 wlxD1q/8tIiV/wOH+qQKwg1Zjeunhc08VJlP+myVrs6x3mSf2cNBDJKlUUkFEYTXDQ
 Xmfzy16CX440ad3ewj/EcAP/bXYWfvrmS1lCEYgMAH1Tp4/48IdVy741/IAPG40s8o
 BuXJQRkFoWBCQXjjCVobUqKlgmR85Bj6kN+Xch87LgTHCS4OOa0PhrslotklZKMHGj
 BeFDaDNGCGz5aCcuQrN4QnuRzRBv363BPwpm/h+jstiVgnbaEQ6QC5cq5/FX6njrzJ
 aG9wwOhRDKwuA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 052/217] drm: panel: simple: add missing
 platform_driver_unregister() in panel_simple_init
Date: Tue, 22 Dec 2020 21:13:41 -0500
Message-Id: <20201223021626.2790791-52-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021626.2790791-1-sashal@kernel.org>
References: <20201223021626.2790791-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Qinglang Miao <miaoqinglang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Qinglang Miao <miaoqinglang@huawei.com>

[ Upstream commit f2e66f212a9de04afc2caa5ec79057c0ac75c728 ]

Add the missing platform_driver_unregister() before return
from panel_simple_init in the error handling case when failed
to register panel_simple_dsi_driver with CONFIG_DRM_MIPI_DSI
enabled.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20201031011856.137307-1-miaoqinglang@huawei.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 2be358fb46f7d..2966ac13c5382 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4644,8 +4644,10 @@ static int __init panel_simple_init(void)
 
 	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI)) {
 		err = mipi_dsi_driver_register(&panel_simple_dsi_driver);
-		if (err < 0)
+		if (err < 0) {
+			platform_driver_unregister(&panel_simple_platform_driver);
 			return err;
+		}
 	}
 
 	return 0;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
