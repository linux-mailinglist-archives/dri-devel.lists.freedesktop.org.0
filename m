Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A4334DEC0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 04:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E949A6E824;
	Tue, 30 Mar 2021 02:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE2F6E821
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 02:54:07 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id c17so11161138pfn.6
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 19:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OPXUOmfQRekvQeQvsP70z1DtiDzMfmRzBeh0Ag8UFxM=;
 b=OaZPcHG+xa8TmTWZTA0Hwp0y/rk+j9Ba1UMowY1egymnOB4p+aNxLcC2BSvqDs9q5q
 4alN2gzkfnk3Pm8vKeca7tvK6mDFvMGmm43+hA3Wj3N4MWwTz4FQMcOux+jyfjfXcW7v
 cVWAmDIe8H4TDNqiSVKQWU3ft/UkzrUp2AksE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OPXUOmfQRekvQeQvsP70z1DtiDzMfmRzBeh0Ag8UFxM=;
 b=dcjQKop076rZqS4MuKB275clogpjP1ElISeFfDg9fE/Ol9Kz25achKx/UrYIsp7/Zl
 4DEsKnCT+NRoeHa+Vf+1CB7HmohWf6dJPbqXmDrMTCQ2foeNWULdULS0ipWN0A71rAUX
 tJbNpbdDiDL5kxQYBKk3g/FQ/NineM0l0c2JlRKx3XxMQip0Fw9CKOc5hp2a3OqPX6dK
 DjfJBklNVfv67bikBBQVMNWrXdiimA3W+N+b6uJNJmL9SefBYDbJyJ/IgCEovVFCOY8H
 L96bznTNJXtRR+G6LHfxbP76XJxvw3MZbJSjnZsrbkc4Xh6hMLlXL0NuT2JFyv5h/3Sa
 Ppzg==
X-Gm-Message-State: AOAM533bmpOegvUOOnM1KREqefpjODAKK8hsIZwhNmQTLa+k7qL0OP0A
 Y/plzfzMeETI1G6ZETMZs9fPKw==
X-Google-Smtp-Source: ABdhPJzNB5xuvOvavd2lC2JLfMQFcwfveLVKJQBZBZzHvrCJVMqsfbDPgPl2Nyg9excKNq+Ek1sJvw==
X-Received: by 2002:a63:2265:: with SMTP id t37mr14590832pgm.452.1617072847654; 
 Mon, 29 Mar 2021 19:54:07 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f599:1ca7:742d:6b50])
 by smtp.gmail.com with ESMTPSA id t17sm19152706pgk.25.2021.03.29.19.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 19:54:07 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 04/14] drm/bridge: ti-sn65dsi86: Reorder remove()
Date: Mon, 29 Mar 2021 19:53:35 -0700
Message-Id: <20210329195255.v2.4.Ifcf1deaa372eba7eeb4f8eb516c5d15b77a657a9@changeid>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210330025345.3980086-1-dianders@chromium.org>
References: <20210330025345.3980086-1-dianders@chromium.org>
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

NOTES:
- The MIPI calls probably belong in detach() but will be moved in a
  separate patch.
- The cached EDID freeing isn't actually part of probe but needs to be
  in remove to avoid orphaning memory until better handling of the
  EDID happens.

This patch was created by code inspection and should move us closer to
a proper remove.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

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
2.31.0.291.g576ba9dcdaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
