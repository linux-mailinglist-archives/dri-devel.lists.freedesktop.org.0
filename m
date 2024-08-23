Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CF995D399
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 18:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC44D10EC78;
	Fri, 23 Aug 2024 16:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 111630 seconds by postgrey-1.36 at gabe;
 Fri, 23 Aug 2024 16:35:21 UTC
Received: from ssh247.corpemail.net (ssh247.corpemail.net [210.51.61.247])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9584A10EC78
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 16:35:21 +0000 (UTC)
Received: from ssh247.corpemail.net
 by ssh247.corpemail.net ((D)) with ASMTP (SSL) id UQH00116;
 Sat, 24 Aug 2024 00:35:16 +0800
Received: from localhost.localdomain (10.94.3.154) by
 jtjnmail201610.home.langchao.com (10.100.2.10) with Microsoft SMTP Server id
 15.1.2507.39; Sat, 24 Aug 2024 00:35:15 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <neil.armstrong@linaro.org>, <yangcong5@huaqin.corp-partner.google.com>,
 <quic_jesszhan@quicinc.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <liuyanming@ieisystem.com>, <dianders@chromium.org>, Charles Han
 <hanchunchao@inspur.com>
Subject: [PATCH] drm/panel: himax-hx83102: Add NULL pointer check in
 hx83102_get_modes
Date: Sat, 24 Aug 2024 00:35:13 +0800
Message-ID: <20240823163513.4344-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.3.154]
tUid: 2024824003516f678cc21c48e66bce0d88eb08600ddb2
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

In hx83102_get_modes(), the return value of drm_mode_duplicate()
is assigned to mode, which will lead to a possible NULL pointer
dereference on failure of drm_mode_duplicate(). Even though a
small allocation failing is basically impossible, kernel policy
is still to check for NULL so add the check.

Fixes: 0ef94554dc40 ("drm/panel: himax-hx83102: Break out as separate driver")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 6e4b7e4644ce..e67555323d3b 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -565,6 +565,8 @@ static int hx83102_get_modes(struct drm_panel *panel,
 	struct drm_display_mode *mode;
 
 	mode = drm_mode_duplicate(connector->dev, m);
+	if (!mode)
+		return -EINVAL;
 
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 	drm_mode_set_name(mode);
-- 
2.31.1

