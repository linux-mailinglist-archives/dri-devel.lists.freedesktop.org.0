Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506CB4D1232
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 09:27:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAB210ED40;
	Tue,  8 Mar 2022 08:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B1010ED46
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 08:27:48 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id n15so6416799plh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 00:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dp9Q1CI/wcSBt8a1D9eVD10iZJY30fzYd+eyRgz+eeM=;
 b=g53c3nLqnpHoQXSXLEeSRm6OzFj7kH6kcfFSy68BieuEJcSp3fPvTyPO9ytniW2byx
 WIDZF5HCW0STCtbharxEGRhFfiKB0bNvQCKiAGXPV+vFYA7NzcTmi6uGyWlRopqetupO
 YpdjCmFNihoXv8drX3KLrgDBIdyaiSqeWeu/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dp9Q1CI/wcSBt8a1D9eVD10iZJY30fzYd+eyRgz+eeM=;
 b=KYa43yjykw5mAUG1sU8KFMlpoyA+GlH/alPSMVEHWg4oEAxbbaFZNocH3fbgLrzao3
 Bq1Xewue4dRDJSPftBkslGFMZ7R6p4mTDOlay3LrsDXkMBNReMQ3Ig9L5nOKG2iWArs1
 CzErR4CXn3gcn5kljQMxETIU8VHxOyiGP3KytxIUFx22/fulnHywrJQFs/8zQLEacJum
 B+jIbH+1i9pReDGXAkrwcvCceFXTe2Wr5C28p0ExGgbHmtbz8v0aJmMWpTKIzmG4rwpy
 HJdG4RPEF4IcxwQfgEtemxoul62M9kDVOUnc9c20E0+St2inLG+uhN9yu0u0NhvN8Lja
 /G4Q==
X-Gm-Message-State: AOAM531XdLa5E1HDeOhJuyIHJ4GLe9104eeNO5hqcRCJQAPBXNZo1s1B
 SWXh4CH3vjVb+r4PWicynxpQGQ==
X-Google-Smtp-Source: ABdhPJz6bOsUkvXd23U7WgBY/H1K56sraIOuQzVzO9jGnOGTU5pgqniuiqd1M6JK+WfWlWi99de8CA==
X-Received: by 2002:a17:902:c40a:b0:151:a792:71f2 with SMTP id
 k10-20020a170902c40a00b00151a79271f2mr16239683plk.36.1646728068032; 
 Tue, 08 Mar 2022 00:27:48 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:c770:6f0b:21a:8de4])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a17090a560100b001bf72b5af97sm2000671pjf.13.2022.03.08.00.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 00:27:47 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 5/8] drm: bridge: nxp-ptn3460: Switch to
 devm_drm_of_get_bridge
Date: Tue,  8 Mar 2022 13:57:23 +0530
Message-Id: <20220308082726.77482-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308082726.77482-1-jagan@amarulasolutions.com>
References: <20220308082726.77482-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_drm_of_get_bridge is capable of looking up the downstream
bridge and panel and trying to add a panel bridge if the panel
is found.

Replace explicit finding calls with devm_drm_of_get_bridge.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- drop panel.h
Changes for v2:
- split the patch

 drivers/gpu/drm/bridge/nxp-ptn3460.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index e941c1132598..f4cfa190d306 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -15,7 +15,6 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -263,7 +262,6 @@ static int ptn3460_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct ptn3460_bridge *ptn_bridge;
 	struct drm_bridge *panel_bridge;
-	struct drm_panel *panel;
 	int ret;
 
 	ptn_bridge = devm_kzalloc(dev, sizeof(*ptn_bridge), GFP_KERNEL);
@@ -271,11 +269,7 @@ static int ptn3460_probe(struct i2c_client *client,
 		return -ENOMEM;
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, NULL);
-	if (ret)
-		return ret;
-
-	panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
 	if (IS_ERR(panel_bridge))
 		return PTR_ERR(panel_bridge);
 
-- 
2.25.1

