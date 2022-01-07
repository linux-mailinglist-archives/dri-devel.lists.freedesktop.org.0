Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E45487431
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 09:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061D411AC95;
	Fri,  7 Jan 2022 08:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D646011AC95
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 08:36:38 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so11301880pjj.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 00:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=0usgNPuxO2Xbite7dIWl/eUqLBFFjy4eURRS5eQlexE=;
 b=db7Z0ELzm+ApbLFsM9kaoTKg5fw9dbZ6VA0Cr13+Zl2LzqmSGdSDtLVH3KTB09Ekyt
 vrM918SYbXswzfnRiP5IYevCGXXj8avAtt+q3iS7l5RkQENFvOasfI7JrKDDq+52i2lA
 4/PRS5KtpQhEPAzQXVlK52YmyDsiLxO/efb28hj+KW2B2QSeeLPQRq5hqwtspAwXBa6n
 ffEvYvumpV4JDPyMZYpcmSjlXIvQ2WE4GBdQ8N/f1266lHwBiuFcbj1Jzg5Ls7Nb0ziz
 lBQER0SA3Y8NYj/gpmtbHgZwwWnsPtsTBEddeX0KqPgbMxdq4qQ2NjmriVUNhx66YbTr
 zDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0usgNPuxO2Xbite7dIWl/eUqLBFFjy4eURRS5eQlexE=;
 b=doLXrChOXqMPUru0KIYZVw+4K5Dib/qcaOrDPqE2pwCgLsjJwuOQ9Fu7OBu67zUHzf
 TBwVZvVUR29uuEgJaDvrFQoFJjPT3XCDqSTKwrIG20woixsuis9DrMtO863yLbkW2ORj
 IC3V4lKJIOQxzO6pF/lEDlStbKOJEfCNbOHlvZ3HJl8M6LbPgT6imOw74NbJ5zWrBHP8
 27FpMEYBRgGO+dREv2kAmjOiB5qOpD677gtMkpb/kc7bF9/dMDZEARokMAaAYfpj5t/r
 YGk7GT49wVmq4enRm8MEpg1C81Ew7lN5zRjWX6jzyZpSww/q78mqQQTnjT4gSJQ/1MaG
 ssbA==
X-Gm-Message-State: AOAM532vclgqHUZRSXuEzfH3obyjcK7F8Grw4H17oCNhRtvXtZh31EGW
 g7lkwIXHc5ZNPO3nI0OewkY=
X-Google-Smtp-Source: ABdhPJwFX+BUrAd7opzOCSQBmNe+AAAzzMRjvfY3Q5YfyjPq15ioRx70dDlJsKdD6o6knFYNsznE3g==
X-Received: by 2002:a17:90b:1986:: with SMTP id
 mv6mr14795706pjb.37.1641544598539; 
 Fri, 07 Jan 2022 00:36:38 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id l1sm3909919pgn.35.2022.01.07.00.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 00:36:38 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Subject: [PATCH] drm/sun4i: dw-hdmi: Fix missing put_device() call in
 sun8i_hdmi_phy_get
Date: Fri,  7 Jan 2022 08:36:32 +0000
Message-Id: <20220107083633.20843-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Ondrej Jirman <megous@megous.com>, linmq006@gmail.com,
 Saravana Kannan <saravanak@google.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The reference taken by 'of_find_device_by_node()' must be released when
not needed anymore.
Add the corresponding 'put_device()' in the error handling path.

Fixes: 9bf3797796f5 ("drm/sun4i: dw-hdmi: Make HDMI PHY into a platform device")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index b64d93da651d..5e2b0175df36 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -658,8 +658,10 @@ int sun8i_hdmi_phy_get(struct sun8i_dw_hdmi *hdmi, struct device_node *node)
 		return -EPROBE_DEFER;
 
 	phy = platform_get_drvdata(pdev);
-	if (!phy)
+	if (!phy) {
+		put_device(&pdev->dev);
 		return -EPROBE_DEFER;
+	}
 
 	hdmi->phy = phy;
 
-- 
2.17.1

