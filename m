Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 469743FA489
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 10:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F5189310;
	Sat, 28 Aug 2021 08:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id 808E289310
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 08:53:08 +0000 (UTC)
Received: from BC-Mail-Ex12.internal.baidu.com (unknown [172.31.51.52])
 by Forcepoint Email with ESMTPS id 78F2BEBBA8250723B3DC;
 Sat, 28 Aug 2021 16:53:07 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex12.internal.baidu.com (172.31.51.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Sat, 28 Aug 2021 16:53:07 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.62.20) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Sat, 28 Aug 2021 16:53:06 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <jyri.sarha@iki.fi>, <tomba@kernel.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] drm/tidss: Make use of the helper macro SET_RUNTIME_PM_OPS()
Date: Sat, 28 Aug 2021 16:52:52 +0800
Message-ID: <20210828085252.1724-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.32.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.31.62.20]
X-ClientProxiedBy: BC-Mail-Ex17.internal.baidu.com (172.31.51.11) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the helper macro SET_RUNTIME_PM_OPS() instead of the verbose
operators ".runtime_suspend/.runtime_resume", because the
SET_RUNTIME_PM_OPS() is a nice helper macro that could be brought
in to make code a little clearer, a little more concise.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index d620f35688da..57605b80b526 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -91,9 +91,8 @@ static int __maybe_unused tidss_resume(struct device *dev)
 #ifdef CONFIG_PM
 
 static const struct dev_pm_ops tidss_pm_ops = {
-	.runtime_suspend = tidss_pm_runtime_suspend,
-	.runtime_resume = tidss_pm_runtime_resume,
 	SET_SYSTEM_SLEEP_PM_OPS(tidss_suspend, tidss_resume)
+	SET_RUNTIME_PM_OPS(tidss_pm_runtime_suspend, tidss_pm_runtime_resume, NULL)
 };
 
 #endif /* CONFIG_PM */
-- 
2.25.1

