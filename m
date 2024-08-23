Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B800095C850
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 10:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C7F810E083;
	Fri, 23 Aug 2024 08:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vip.corpemail.net (mail-vip.corpemail.net
 [162.243.126.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB6210E083
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 08:43:33 +0000 (UTC)
Received: from unicom146.biz-email.net
 by unicom146.biz-email.net ((D)) with ASMTP (SSL) id UII00158;
 Fri, 23 Aug 2024 16:36:58 +0800
Received: from localhost.localdomain (10.94.15.114) by
 jtjnmail201606.home.langchao.com (10.100.2.6) with Microsoft SMTP Server id
 15.1.2507.39; Fri, 23 Aug 2024 16:36:59 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <neil.armstrong@linaro.org>, <yangcong5@huaqin.corp-partner.google.com>,
 <quic_jesszhan@quicinc.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <liuyanming@ieisystem.com>, Charles Han <hanchunchao@inspur.com>
Subject: [PATCH v2 1/1] drm/panel: fix null pointer dereference in
 hx83102_get_modes
Date: Fri, 23 Aug 2024 16:36:57 +0800
Message-ID: <20240823083657.7100-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.15.114]
tUid: 20248231636584b1a172ea4605ee91cd932edc96aea4b
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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

In hx83102_get_modes(), the return value of drm_mode_duplicate() is
assigned to mode, which will lead to a possible NULL pointer
dereference on failure of drm_mode_duplicate(). Add a check to avoid
npd.

Fixes: 0ef94554dc40 ("drm/panel: himax-hx83102: Break out as  separate driver")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 7c2a5e9b7fb3..e61ed7d02729 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -566,7 +566,6 @@ static int hx83102_get_modes(struct drm_panel *panel,
 
 	mode = drm_mode_duplicate(connector->dev, m);
 	if (!mode) {
-		dev_err(&ctx->dsi->dev, "bad mode or failed to add mode\n");
 		return -EINVAL;
 	}
 
-- 
2.31.1

