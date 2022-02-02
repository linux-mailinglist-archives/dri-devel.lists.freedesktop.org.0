Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7844A756D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 17:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F88A10E305;
	Wed,  2 Feb 2022 16:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6571010E305
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 16:06:11 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id s6so13194001plg.12
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 08:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H1kno40kXqd5oHnIK3ylT4ecdPILvrVqPlIbaZeuMIA=;
 b=eCNIwVf1UszjQp3t8C03ncVpIjOPernL3qKHVwkQsOmZHmZ5zYbbw4HGs6R6qk+yNR
 2+M6RnlBh2+Y9CpyHWGAB0+/VD+JS3y0Fv5iCfPNRglL02xg61DMAbTDG/3AMXAwo+Pg
 bBpCJKzHuH/425GXGj4MSFv8xlc9QVlOj4bIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H1kno40kXqd5oHnIK3ylT4ecdPILvrVqPlIbaZeuMIA=;
 b=YjN9lkYdJTWe3I4Mb9AgzN/TkAD7yE7teRXE3gECkQ0oGqIKeWWFHUOPm2hu+eQ8Xe
 SKZrMvUD8p+uaQbZ649B47f5KH34SJtnuSEAICAGYvLcUwUqo2ef6TH6T4smrNUdSAMt
 UtQyp3zHl0VNcqcgq/qBqFOGo6Y/YX1bAngwdZa0SibHQ9H4yz+m+1M3iOFiekRI2rJf
 rZ4xeGIiQKzY1/03/BThooNz2LG4LiJzL/76wUUDgvrYkpecgHBus3dXc4VTOSb1ASzw
 bmVnKpk+5MtP1VaQzGUX5V7MOx0XLU2tphgg3agwJ9J8LTMu6Xp9txeJVzbtFHQlz6zN
 o1xw==
X-Gm-Message-State: AOAM532GnQXU080jBV6vh0vYJivAZWaFHZjbg5wjbhsdyfoj/WfpZg4g
 u4cpj+Wbsc7ZBGKi77Vvtwpy9w==
X-Google-Smtp-Source: ABdhPJzUD24F/TZr17nwIVcYrxd8vfKzfmfXbAlOcbW8sRVyKwgtR4FkwC/X7OzrDzLeJS8OW/QmfA==
X-Received: by 2002:a17:90b:380f:: with SMTP id
 mq15mr8912309pjb.66.1643817970945; 
 Wed, 02 Feb 2022 08:06:10 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:7ce0:466c:be86:774])
 by smtp.gmail.com with ESMTPSA id g5sm14722397pgc.51.2022.02.02.08.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 08:06:10 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH RESEND v5 2/4] drm/bridge: anx7625: Convert to use devm_kzalloc
Date: Thu,  3 Feb 2022 00:06:00 +0800
Message-Id: <20220202160602.440792-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202160602.440792-1-hsinyi@chromium.org>
References: <20220202160602.440792-1-hsinyi@chromium.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_kzalloc instead of kzalloc and drop kfree(). Let the memory
handled by driver detach.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Xin Ji <xji@analogixsemi.com>
---
v2->v3: remove kfree() in anx7625_i2c_remove().
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 17b23940549a42..b7e3373994b480 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2515,7 +2515,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	platform = kzalloc(sizeof(*platform), GFP_KERNEL);
+	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
 	if (!platform) {
 		DRM_DEV_ERROR(dev, "fail to allocate driver data\n");
 		return -ENOMEM;
@@ -2527,7 +2527,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
 			DRM_DEV_ERROR(dev, "fail to parse DT : %d\n", ret);
-		goto free_platform;
+		return ret;
 	}
 
 	platform->client = client;
@@ -2552,7 +2552,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	if (!platform->hdcp_workqueue) {
 		dev_err(dev, "fail to create work queue\n");
 		ret = -ENOMEM;
-		goto free_platform;
+		return ret;
 	}
 
 	platform->pdata.intp_irq = client->irq;
@@ -2637,9 +2637,6 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	if (platform->hdcp_workqueue)
 		destroy_workqueue(platform->hdcp_workqueue);
 
-free_platform:
-	kfree(platform);
-
 	return ret;
 }
 
@@ -2666,7 +2663,6 @@ static int anx7625_i2c_remove(struct i2c_client *client)
 	if (platform->pdata.audio_en)
 		anx7625_unregister_audio(platform);
 
-	kfree(platform);
 	return 0;
 }
 
-- 
2.35.0.rc2.247.g8bbb082509-goog

