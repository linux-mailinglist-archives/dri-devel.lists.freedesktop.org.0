Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34354956A8E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 14:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D5F10E254;
	Mon, 19 Aug 2024 12:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1180 seconds by postgrey-1.36 at gabe;
 Mon, 19 Aug 2024 12:13:07 UTC
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F1010E254
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 12:13:07 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WnWCH6yt6zfbZt;
 Mon, 19 Aug 2024 19:51:23 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 93A12180101;
 Mon, 19 Aug 2024 19:53:23 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 19 Aug
 2024 19:53:23 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <neil.armstrong@linaro.org>, <quic_jesszhan@quicinc.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 6/8] drm/panel: khadas-ts050: Make ts050_panel_data and
 ts050v2_panel_data static
Date: Mon, 19 Aug 2024 20:00:43 +0800
Message-ID: <20240819120043.3884933-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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

The sparse tool complains as follows:

drivers/gpu/drm/panel/panel-khadas-ts050.c:620:32: warning:
	symbol 'ts050_panel_data' was not declared. Should it be static?

drivers/gpu/drm/panel/panel-khadas-ts050.c:625:32: warning:
	symbol 'ts050v2_panel_data' was not declared. Should it be static?

These symbols are not used outside panel-khadas-ts050.c, so marks them static.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/panel/panel-khadas-ts050.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
index 14932cb3defc..0e5e8e57bd1e 100644
--- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
+++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
@@ -617,12 +617,12 @@ static const struct khadas_ts050_panel_cmd ts050_init_code[] = {
 	{0xd4, {0x04}, 0x01}, /* RGBMIPICTRL: VSYNC front porch = 4 */
 };
 
-struct khadas_ts050_panel_data ts050_panel_data = {
+static struct khadas_ts050_panel_data ts050_panel_data = {
 	.init_code = (struct khadas_ts050_panel_cmd *)ts050_init_code,
 	.len = ARRAY_SIZE(ts050_init_code)
 };
 
-struct khadas_ts050_panel_data ts050v2_panel_data = {
+static struct khadas_ts050_panel_data ts050v2_panel_data = {
 	.init_code = (struct khadas_ts050_panel_cmd *)ts050v2_init_code,
 	.len = ARRAY_SIZE(ts050v2_init_code)
 };
-- 
2.34.1

