Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E032DDFA8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC2489B0D;
	Fri, 18 Dec 2020 08:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CAD896E7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 14:09:48 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id q16so28752098edv.10
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 06:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8d/TrR8rvr+bpGWFgQdRm4zLwdG7yWhGu84jcm2/M6g=;
 b=p/AItOzqqm4kqQMm0GgotlTXHPU2f50aB8mZ0r4vvT3PH9dE5ERqKtHkP/dZMwW9du
 Zoa5eVKoGJZKWD0W1XaeP6WI8mREKXn1pMkNa27jeqW/i4Lu4NjEqfIfOzxiemq4QQdu
 qP8xtB9RUiSRoHVTjlyi4M+xT3WoXb4By9kXGuDQ0W4ECrdVEs6/hKsZjCFoS241HeXx
 a8ZJdjfAszQV/EHrNP1cQD/NIkJYAAk/O2LeVUsBSa5/cZYfrQ5Zn2BICEIOABNuFiBl
 6wQrGsdq2KdQNdcLOk1tAMeQmKPjFz4MM/jqxQ4KV72gXNpQndfe0YwCDRgsBIQVvM+m
 vd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8d/TrR8rvr+bpGWFgQdRm4zLwdG7yWhGu84jcm2/M6g=;
 b=jT7fw/59hLfT7znWMoCOOPv2ov8O74dQw0eRlQJ/fJia9rDPvkXYiKTk2Wm7/62u7c
 1QqEwdqwTy3BTkt65rLOLR9U9pPi/QootFReaB5Cl+DrEOr0s+/UG6/jMBta71ag9C2U
 GZsU8u4/DM6vaRQkBvCkqTK4S5hnATMBjm+g5nT8WK6iG1tDLl/7uMunkGDMKIfb5XNa
 sce9OTiQiw1aOeMWvsa4clamL4AxzaVljV4sRUR5oPeiDNo/kLaJAT9jw/iKgJXE2w+5
 yOmERzBcCSXknbEYho7notduQOXCSTCTZIaWZznPqXUgQ8IkdxxNoD49LRQoN3tiPquh
 X1zg==
X-Gm-Message-State: AOAM532xkeLI3SixlMI41V4xlt0KUZqDTa0xwby5iRkcdz44fNF7ciiY
 Wv+YSflzrVmz/j4jzQhhRJWYTg==
X-Google-Smtp-Source: ABdhPJwo9weeh2cNDezfXpAADFtKDt9giKVLlbwvcvNBuXhKuNyS7tXZpR72+bUa807SRZwtdHYDnw==
X-Received: by 2002:a05:6402:104e:: with SMTP id
 e14mr25376272edu.316.1608214186984; 
 Thu, 17 Dec 2020 06:09:46 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:f0ff:2796:69b1:324])
 by smtp.gmail.com with ESMTPSA id
 pk19sm3864078ejb.32.2020.12.17.06.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:09:46 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: a.hajda@samsung.com, narmstrong@baylibre.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Peter Collingbourne <pcc@google.com>
Subject: [PATCH v2] drm/bridge: lt9611: Fix handling of 4k panels
Date: Thu, 17 Dec 2020 15:09:33 +0100
Message-Id: <20201217140933.1133969-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: Anibal Limon <anibal.limon@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

4k requires two dsi pipes, so don't report MODE_OK when only a
single pipe is configured. But rather report MODE_PANEL to
signal that requirements of the panel are not being met.

Reported-by: Peter Collingbourne <pcc@google.com>
Suggested-by: Peter Collingbourne <pcc@google.com>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Tested-by: John Stultz <john.stultz@linaro.org>
Tested-by: Anibal Limon <anibal.limon@linaro.org>
Acked-By: Vinod Koul <vkoul@kernel.org>
Tested-by: Peter Collingbourne <pcc@google.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index d734d9402c35..e8eb8deb444b 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -867,8 +867,14 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 						     const struct drm_display_mode *mode)
 {
 	struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 
-	return lt9611_mode ? MODE_OK : MODE_BAD;
+	if (!lt9611_mode)
+		return MODE_BAD;
+	else if (lt9611_mode->intfs > 1 && !lt9611->dsi1)
+		return MODE_PANEL;
+	else
+		return MODE_OK;
 }
 
 static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
