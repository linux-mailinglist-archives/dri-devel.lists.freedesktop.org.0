Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C833418AE0C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 09:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273D56E9AF;
	Thu, 19 Mar 2020 08:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2736E0D8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 04:39:20 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 37so534712pgm.11
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 21:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ruMvWKaCTsbInQhs/V5bAwFT4fo/B2LhqokROVX1RJo=;
 b=tg2aN6xtBRVVIsylVN35uS278/h81kU5E3rrZb4l9rasLTWQ0gO2RA0UvpzzCntSPD
 ZPIiYQ8t6hnvWpKofzzGzll+jfkqbYURB0VtpYDjsIKqvD4B3bKHij1aLEY1qdFdWFUR
 6II5O54rz9PrCLotYrETJh1NIQT3fKEtfL/DUGC2rs/BPsqoqb+egLQnKbiBy7uwf55n
 U+kLTmtbRTdj3d3FG0Jk7dNBxxYhnOvKmqe0Oau6zQGq5nEoJVoE1nooNnvWQxELdLl8
 0bNe9Qqfe61hyW/e5KaoNY32tTxagRuyKyaKC1epbe1ve6VNNVmKXpriu+88+RagG67M
 Ixvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ruMvWKaCTsbInQhs/V5bAwFT4fo/B2LhqokROVX1RJo=;
 b=IB9WAwnE7vJw5/KuqLPZ13rABUDw93raLOhwaGiGVJlFQveuZCkkl9u1qXljR2ht99
 lKhEi0msBMjvusAL2YaHOvnX4muslRu6Ea/XUaA87dmn3xCjhyNkltM3oS91ECCXAFzI
 xQd9GOi2Kj9IRNep6hGbXYI43QE6QFskD9U84oTWLGCB4K4DE6UPA1gQCv/lrLzw5j64
 IDMLmoIMUqkFR9j65L/3envvT2ymPzdyZNCgfjvEE/7V0AnRE1PirfXnRiZx+t7SNhOE
 2fogzZEqZmtBZC5w8k+/+4ZTMBBd+OcVPTJ0QsGXNndoui4cqe31TEk6IOMUOjM5CDEv
 x+rg==
X-Gm-Message-State: ANhLgQ2/r7yGCKasZpk4CGOuRUfYojy8HgLM6B2UlHuxJ8CioZYhhOT9
 1g8/0pDfpuX2D9BKVF1seqDPdg==
X-Google-Smtp-Source: ADFU+vvT12s0aAoLNNrPFmHAx5hQiycl6q/fBkWc1OwJE6FPv7umjTrZuM7h/FPuLb8vCrLAF5uWdw==
X-Received: by 2002:a63:2a4b:: with SMTP id q72mr1309267pgq.441.1584592760401; 
 Wed, 18 Mar 2020 21:39:20 -0700 (PDT)
Received: from localhost.localdomain
 (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id 25sm571370pfn.190.2020.03.18.21.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 21:39:19 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/msm: Don't attempt to attach HDMI bridge twice
Date: Wed, 18 Mar 2020 21:37:41 -0700
Message-Id: <20200319043741.3338842-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 19 Mar 2020 08:08:58 +0000
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
Cc: linux-arm-msm@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the introduction of '3ef2f119bd3e ("drm/msm: Use
drm_attach_bridge() to attach a bridge to an encoder")' the HDMI bridge
is attached both in msm_hdmi_bridge_init() and later in
msm_hdmi_modeset_init().

The second attempt fails as the bridge is already attached to the
encoder and the whole process is aborted.

So instead make msm_hdmi_bridge_init() just initialize the hdmi_bridge
object and let msm_hdmi_modeset_init() attach it later.

Fixes: 3ef2f119bd3e ("drm/msm: Use drm_attach_bridge() to attach a bridge to an encoder")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 6e380db9287b..0e103ee1b730 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -271,31 +271,18 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 /* initialize bridge */
 struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
 {
-	struct drm_bridge *bridge = NULL;
 	struct hdmi_bridge *hdmi_bridge;
-	int ret;
+	struct drm_bridge *bridge;
 
 	hdmi_bridge = devm_kzalloc(hdmi->dev->dev,
 			sizeof(*hdmi_bridge), GFP_KERNEL);
-	if (!hdmi_bridge) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	if (!hdmi_bridge)
+		return ERR_PTR(-ENOMEM);
 
 	hdmi_bridge->hdmi = hdmi;
 
 	bridge = &hdmi_bridge->base;
 	bridge->funcs = &msm_hdmi_bridge_funcs;
 
-	ret = drm_bridge_attach(hdmi->encoder, bridge, NULL, 0);
-	if (ret)
-		goto fail;
-
 	return bridge;
-
-fail:
-	if (bridge)
-		msm_hdmi_bridge_destroy(bridge);
-
-	return ERR_PTR(ret);
 }
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
