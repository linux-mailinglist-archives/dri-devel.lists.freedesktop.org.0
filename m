Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4999E341644
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 08:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5731B6E2D8;
	Fri, 19 Mar 2021 07:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40656E2D8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 07:06:27 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id va9so7957976ejb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 00:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=awbkTFj7QLP6bW2rMHzN+bTcHkE9ABdCa+aqiLawiHY=;
 b=LKwNoBOYkMlvY1TPGUbSz89JSimEmpAtOpTtOQVRPAfOGDJIUyrhXmSFqBjy4sDSGH
 fo4t0BJiKCUO74klnmwuW+ynOyJI69AyuSQx/vxXxDa9SL/rec3X4dv2ZhrcVHNsuoP7
 ETMPAYYji4vxjFw7NqiA9Rpc4280xCNSxL/I5Tr/0oa/8yQq5oM/LrR72hcbLQgeb/Ag
 wlZlzHGP72d6nINStD0mrSNZPaDFLfKfYlLWC5H5D3mUwmr3D9BT3LtLobsCKwunV8N6
 TBI4s4LZqxqgwCoqWAb6juG+lic8qAa0Lb62f8rBqr38ncIMw7gDpMlIp4f+xIpU3szx
 Pi8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=awbkTFj7QLP6bW2rMHzN+bTcHkE9ABdCa+aqiLawiHY=;
 b=cYEuZls80KqvH9BevrwBRM7MKLIbevHXmb6GKjDgF6dbc3A77w3GiWR8+nmcog+aKG
 4KMNFu6hG1ffd91NAAaGEAOQbGaBJroiXuBcFrTP2dhFmiX4+6Mt4Tos6AfLFkantWBY
 2c92BuCRJdAZm+iIdFOTxnnVLGNO1cBpCi3Z6FpJhnoy9XWKgcfjK/fT5bu2PiXSsXci
 iauDjeymrNNMJGEMy869can78M9bSuzEFJ5p4aq5EjrdS2MVhmTivk2cK8tF24BaN4j6
 U6yr7GnE2Thu20R2nKJB5mWXnuJZCe2flH/uuhO4Rdba5h4WyhPvn8VCVf5I+F6BZuh2
 w57A==
X-Gm-Message-State: AOAM531bxM0Ued827RDrjLZNZdew8MXk07u7ZGJq814X7nxumDLM5rX4
 /dz8y/TAnmoNyqYLOiKhVSc=
X-Google-Smtp-Source: ABdhPJzx1K8fVJT+02rkH4k2Hp6IPaMA7iKJMXrcVE/JSgLmXOwokj2EnLSLsTClog+LwYkltBSOHQ==
X-Received: by 2002:a17:906:3952:: with SMTP id
 g18mr2737443eje.104.1616137586487; 
 Fri, 19 Mar 2021 00:06:26 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id v8sm3508489edc.30.2021.03.19.00.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 00:06:25 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/tegra: dc: Restore coupling of display controllers
Date: Fri, 19 Mar 2021 08:06:37 +0100
Message-Id: <20210319070637.675964-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Coupling of display controllers used to rely on runtime PM to take the
companion controller out of reset. Commit fd67e9c6ed5a ("drm/tegra: Do
not implement runtime PM") accidentally broke this when runtime PM was
removed.

Restore this functionality by reusing the hierarchical host1x client
suspend/resume infrastructure that's similar to runtime PM and which
perfectly fits this use-case.

Fixes: fd67e9c6ed5a ("drm/tegra: Do not implement runtime PM")
Reported-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 795b4e457ab6..2585ba70b706 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2519,22 +2519,18 @@ static int tegra_dc_couple(struct tegra_dc *dc)
 	 * POWER_CONTROL registers during CRTC enabling.
 	 */
 	if (dc->soc->coupled_pm && dc->pipe == 1) {
-		u32 flags = DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_CONSUMER;
-		struct device_link *link;
-		struct device *partner;
+		struct device *companion;
+		struct tegra_dc *parent;
 
-		partner = driver_find_device(dc->dev->driver, NULL, NULL,
-					     tegra_dc_match_by_pipe);
-		if (!partner)
+		companion = driver_find_device(dc->dev->driver, NULL, (const void *)0,
+					       tegra_dc_match_by_pipe);
+		if (!companion)
 			return -EPROBE_DEFER;
 
-		link = device_link_add(dc->dev, partner, flags);
-		if (!link) {
-			dev_err(dc->dev, "failed to link controllers\n");
-			return -EINVAL;
-		}
+		parent = dev_get_drvdata(companion);
+		dc->client.parent = &parent->client;
 
-		dev_dbg(dc->dev, "coupled to %s\n", dev_name(partner));
+		dev_dbg(dc->dev, "coupled to %s\n", dev_name(companion));
 	}
 
 	return 0;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
