Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED4C95B9DF
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 17:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7642110EB28;
	Thu, 22 Aug 2024 15:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 893 seconds by postgrey-1.36 at gabe;
 Thu, 22 Aug 2024 09:56:03 UTC
Received: from mail-vip.corpemail.net (mail-vip.corpemail.net
 [162.243.126.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105A110E06C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 09:56:02 +0000 (UTC)
Received: from ssh248.corpemail.net
 by ssh248.corpemail.net ((D)) with ASMTP (SSL) id TJF00141;
 Thu, 22 Aug 2024 17:34:41 +0800
Received: from localhost.localdomain (10.94.14.234) by
 jtjnmail201612.home.langchao.com (10.100.2.12) with Microsoft SMTP Server id
 15.1.2507.39; Thu, 22 Aug 2024 17:34:45 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <neil.armstrong@linaro.org>, <yangcong5@huaqin.corp-partner.google.com>,
 <quic_jesszhan@quicinc.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <liuyanming@ieisystem.com>, Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] drm/panel: fix null pointer dereference in hx83102_get_modes
Date: Thu, 22 Aug 2024 17:34:42 +0800
Message-ID: <20240822093442.4262-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.14.234]
tUid: 20248221734417e5e694b74a2a687bc378a1d255a3ffa
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Mailman-Approved-At: Thu, 22 Aug 2024 15:16:40 +0000
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

In hx83102_get_modes(), the return value of drm_mode_duplicate()
is assigned to mode, which will lead to a possible NULL
pointer dereference on failure of drm_mode_duplicate(). Add a
check to avoid npd.

Fixes: 0ef94554dc40 ("drm/panel: himax-hx83102: Break out as separate driver")

Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 6e4b7e4644ce..7c2a5e9b7fb3 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -565,6 +565,10 @@ static int hx83102_get_modes(struct drm_panel *panel,
 	struct drm_display_mode *mode;
 
 	mode = drm_mode_duplicate(connector->dev, m);
+	if (!mode) {
+		dev_err(&ctx->dsi->dev, "bad mode or failed to add mode\n");
+		return -EINVAL;
+	}
 
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 	drm_mode_set_name(mode);
-- 
2.31.1

