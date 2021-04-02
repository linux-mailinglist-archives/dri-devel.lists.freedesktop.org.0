Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5169635310C
	for <lists+dri-devel@lfdr.de>; Sat,  3 Apr 2021 00:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BAB6F39B;
	Fri,  2 Apr 2021 22:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8B46F395
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 22:29:31 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id y32so1136760pga.11
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Apr 2021 15:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LWCZqEnQt7O4dKOp3uwcwxtiQFjYMPyEMkDo43bfXr8=;
 b=YHdp6YkAZFHy7ph7L0Y8wFiPRja6fUyOKBIrreFiGUeAQaOdtiOE3kD19znNKVphAm
 QEOc3L9wZlp/cuaGQfUJQCvwElQN+lGbhPWW4Z6S7UKxwunn024GJL4Agcz4MJWbmarp
 zXXww/rb77+KKMosD1Q9oM7hNimK2+vAzaG9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LWCZqEnQt7O4dKOp3uwcwxtiQFjYMPyEMkDo43bfXr8=;
 b=IlfRSeJIOLaOTijGHIYGTXIIFzhizkpt1MpO16P+h6vTvJSy6anNu4Nev3nCcfQMMi
 WaDE/bsPll9yTBjmhgS8WkH8aWxr9qcGvnxlVm/GAFjtgCrsLB1SYBbgHDh7Pteh5CJX
 eHN4lIqmWF5yhuQJN5UV0TODD9WtlkZtmySaiHQSvnR+oAFMkh/NyCIEiB6ZZ6toIbpz
 rags04RduF3/M9gioh8LOq7ZrCO+qWOraLK9kmF3JqaflL+pbYEmK124bdyD6kQgpnda
 9a7Dr9vp1qo40MKE3a21txBLF0A583g2BaCvcWjokU6EUfzMW0HhYBSZ1+5CgatDRMH8
 LwFw==
X-Gm-Message-State: AOAM530D6JoSxov0Vz78nEAXNzSy+eguZtH9g9v6O+Q52J6XI9RR/BWD
 ovrli5r79Z3qA6QqTBPfjT10PQ==
X-Google-Smtp-Source: ABdhPJwtwqI2tvZw0BgazX6ZmDH5UDrOdbnhYE1ACnzRHDuaa4PqC6+vmRWdeDEmIu3Kc2t4/6c2Yw==
X-Received: by 2002:a62:1ad0:0:b029:1f2:c7b3:3039 with SMTP id
 a199-20020a621ad00000b02901f2c7b33039mr14390664pfa.30.1617402570970; 
 Fri, 02 Apr 2021 15:29:30 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6c58:fab2:c5e2:f2d7])
 by smtp.gmail.com with ESMTPSA id t16sm9233094pfc.204.2021.04.02.15.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 15:29:30 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 04/12] drm/bridge: ti-sn65dsi86: Reorder remove()
Date: Fri,  2 Apr 2021 15:28:38 -0700
Message-Id: <20210402152701.v3.4.Ifcf1deaa372eba7eeb4f8eb516c5d15b77a657a9@changeid>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
In-Reply-To: <20210402222846.2461042-1-dianders@chromium.org>
References: <20210402222846.2461042-1-dianders@chromium.org>
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's make the remove() function strictly the reverse of the probe()
function so it's easier to reason about.

This patch was created by code inspection and should move us closer to
a proper remove.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
---

Changes in v3:
- Removed "NOTES" from commit message.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 76f43af6735d..c006678c9921 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1315,20 +1315,21 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
 	if (!pdata)
 		return -EINVAL;
 
-	kfree(pdata->edid);
-	ti_sn_debugfs_remove(pdata);
-
-	of_node_put(pdata->host_node);
-
-	pm_runtime_disable(pdata->dev);
-
 	if (pdata->dsi) {
 		mipi_dsi_detach(pdata->dsi);
 		mipi_dsi_device_unregister(pdata->dsi);
 	}
 
+	kfree(pdata->edid);
+
+	ti_sn_debugfs_remove(pdata);
+
 	drm_bridge_remove(&pdata->bridge);
 
+	pm_runtime_disable(pdata->dev);
+
+	of_node_put(pdata->host_node);
+
 	return 0;
 }
 
-- 
2.31.0.208.g409f899ff0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
