Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7808357C053
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 00:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0EBB112FA8;
	Wed, 20 Jul 2022 22:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3E289815
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 22:55:34 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id o18so17763371pgu.9
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZSlwSpM/RFiBLpdzeATmea7o0OG6kZ7GYHU5wp1rngY=;
 b=gB4GPXG4iY+V2+bioCq4/os5vYlp3ZjPzZK8+UYaGDJI75zmFqrY8MXRZoUO52IoF4
 2l5c/FH66IiCAXvRB4/Z61r4FW1TrTdETWgIkD9QgRl6FFAmIY1wSpJRFDp9xXFZINmr
 dvuDCobmfEJvMqoz7pUTETNu3Hz4LccHuaIL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZSlwSpM/RFiBLpdzeATmea7o0OG6kZ7GYHU5wp1rngY=;
 b=f9UmUtQUgYPYFd1Ab3A7fM1gnAnpTGtuwXvlyv5RhUY7/sUGi8LJjCG75Dm3STUdRH
 su/K2oFKY4J59U4Kr9cnGIRU/F2WSuBjJ+RPjFiACDX61+g4yHcxQTOODjtsYRKrRbyS
 kH4DyLa9med4Eikm/6VnJC5ImGdHWh0gOoj4UWWLcLBPfBI3P+jK8jvOXskntf9aW93s
 kIcKau+grvzI0TuQprWpzs39IE0CKvMVlW8dhjUPGfC3+g7YMB8fXo2M5Dj81VQn+qBd
 allNVVmL+gOfaOjjkOLGHEpRtZwihLZHUOfcSCYIBipHAJ8Oizs/+H0gFj4xubZJvaal
 evAw==
X-Gm-Message-State: AJIora8kgkeOGYs7NQpruC7Gs96TohbKu47Ebxoyz3SLfOvuPL1Nk5Zf
 doHoZ/Immifo3WKn11gBP20KIvNWBkp5+X2g
X-Google-Smtp-Source: AGRyM1sXQSL9d0r50j0Fqiq/8+L8y7tx1Be20r1+RbJnQehSYo8iJQXgj/fXzMF2++YnAsLP5XpV2A==
X-Received: by 2002:a05:6a00:e85:b0:52b:5db8:f3df with SMTP id
 bo5-20020a056a000e8500b0052b5db8f3dfmr22842365pfb.14.1658357733349; 
 Wed, 20 Jul 2022 15:55:33 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:fdb4:f565:8767:5019])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a170903229100b0016bef6f6903sm94624plh.72.2022.07.20.15.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 15:55:32 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 1/2] drm/panel-edp: Allow overriding the eDP EDID
Date: Wed, 20 Jul 2022 15:55:00 -0700
Message-Id: <20220720155445.RFC.1.I2999ac2d08643f0c2f3fe916cca86f8c832c8142@changeid>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, bjorn.andersson@linaro.org,
 thierry.reding@gmail.com, Sean Paul <seanpaul@chromium.org>,
 dmitry.baryshkov@linaro.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I found that writing to `/sys/kernel/debug/dri/*/eDP*/edid_override`
wasn't working for me. I could see the new EDID take effect in
`/sys/class/drm/card*-eDP*/edid` but userspace wasn't seeing it..

The problem was that panel-edp was caching the EDID that it read and
using that over and over again.

Let's change panel-edp to look at the EDID that's stored in the
connector. This is still a cache, which is important since this
function is called multiple times and readin the EDID is slow, but
this property is automatically updated by drm_get_edid() (which reads
the EDID) and also updated when writing the edid_override in debugfs.

Fixes: 63358e24ee79 ("drm/panel: panel-simple: Cache the EDID as long as we retain power")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-edp.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 3626469c4cc2..12241c1e32f7 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -226,8 +226,6 @@ struct panel_edp {
 
 	const struct edp_panel_entry *detected_panel;
 
-	struct edid *edid;
-
 	struct drm_display_mode override_mode;
 
 	enum drm_panel_orientation orientation;
@@ -580,11 +578,19 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 	if (p->ddc) {
 		pm_runtime_get_sync(panel->dev);
 
-		if (!p->edid)
-			p->edid = drm_get_edid(connector, p->ddc);
+		if (!connector->edid_blob_ptr) {
+			/*
+			 * We read the EDID and then immediately free it,
+			 * relying on the side effect of drm_get_edid() to store
+			 * a copy in connector->edid_blob_ptr. We always use
+			 * the copy cached in the connector since that allows
+			 * the edid_override to work.
+			 */
+			kfree(drm_get_edid(connector, p->ddc));
+		}
 
-		if (p->edid)
-			num += drm_add_edid_modes(connector, p->edid);
+		if (connector->edid_blob_ptr)
+			num += drm_add_edid_modes(connector, connector->edid_blob_ptr->data);
 
 		pm_runtime_mark_last_busy(panel->dev);
 		pm_runtime_put_autosuspend(panel->dev);
@@ -926,9 +932,6 @@ static int panel_edp_remove(struct device *dev)
 	if (panel->ddc && (!panel->aux || panel->ddc != &panel->aux->ddc))
 		put_device(&panel->ddc->dev);
 
-	kfree(panel->edid);
-	panel->edid = NULL;
-
 	return 0;
 }
 
-- 
2.37.0.170.g444d1eabd0-goog

