Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB642E1261
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 03:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF646E8BC;
	Wed, 23 Dec 2020 02:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF9B6E8BC
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 02:23:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89D8B23381;
 Wed, 23 Dec 2020 02:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608690189;
 bh=d+jnG9khOxDlTsbt+UFQssINvJMTzV+aT2ypQH3ZMMo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sgJORgoiL3j0yBi7h/HGTHghhdVEKcDzFCbZ5UGz4oeDnO78hPxqBNnQaQxhHi5LO
 UUjRgZXptZYQxzcsZwTNa5CC4tW9/DYiGo/DTq/dfKuVGA5i4kdhkNnrnCx6eJDw6r
 GV0QHq+xDO51S+HkXH7RlPZqtJNUCaIxjirCg4HY6cbCHjh6H8OCV1F63jeX8/23us
 WmjgnSOtQLTuYlEXPtix1/icii2i57lsv9gKjNCFLrL4KJdLr8eOC8eGRSHp9ZXqR4
 fffgT+OFeWWf3MAatErcJozC9Kr/JEXEAA6pZQBsIAeu1F1SunDtYGbRaGvs3NVLMi
 nq8PRDf9Tn7mg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 13/66] drm: panel: simple: add missing
 platform_driver_unregister() in panel_simple_init
Date: Tue, 22 Dec 2020 21:21:59 -0500
Message-Id: <20201223022253.2793452-13-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223022253.2793452-1-sashal@kernel.org>
References: <20201223022253.2793452-1-sashal@kernel.org>
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
index 6df312ba1826b..37b018a81ee0e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2417,8 +2417,10 @@ static int __init panel_simple_init(void)
 
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
