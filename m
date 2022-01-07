Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38297487005
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 03:01:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEDA10ED91;
	Fri,  7 Jan 2022 02:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AED110ED91
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 02:01:38 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id k21so10357597lfu.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 18:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mbm89ogoQZqGUNZ1cj9r9KOUuoZZufgU+BA4OgVhn8g=;
 b=HrN+k7FXfHQQe4fZOWaNS+ppaD7a7gXvvZDegmpMvzQKseetFljT8hqddGMz3fFiRT
 KyPsaxbZVyXpGYswOGyEsC+HU/omhYvjVaTGJuWzy+4ZNNR3ecNCcaSB0Q855PmBFGm2
 A3WgU8g+zFdAux7e5RLGjVaoCetcFKlNgh6fVjIhvljN2Emv7lwDwpQelIfHVpQ8VrN+
 bXpj/Aj4FvBRGYJYEBHa3RARSSHlMYA7r80qxbe5Rdir2H0sPTmcDHJdpMXECYxqVBYW
 pbliLniuHG0XFBZw8upVWYwr5AsrfaZOk7iqbbr9TTMOkNk604WgAMs5scr4yhZfC4f5
 cNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mbm89ogoQZqGUNZ1cj9r9KOUuoZZufgU+BA4OgVhn8g=;
 b=HHa3NBKDjHf2ju3ODe8yT2uLWevhEcUhv2rip6LVwmcyKvMwLg+rivYzUXi2Uujg8r
 a25geMOiej6tFFdn5Nf5CNkz0ZYiPiu1WZxjgXgrHXJopE9nl31S0NTbCdCgOJUC6EqL
 mzvNZM9AfmMhXFifMUfF9SzDDXuWAsGB3JKNDf5f11uiWfTymH7cZW3lfVh2BmaQRg5j
 wt6XLrR/wJchbXKzgS/g3SCK9cbU5tfGxna8zXvp8CIqzF9mKgRNNeup5y61g6nvRRXQ
 LvOIFWJzAPw9TBgu3RakZky27/hdnzJhoQnVQM7Tp1x1Bo4wrJ4aN9BEiBLM9cfSSLXy
 YO0w==
X-Gm-Message-State: AOAM5331f5MI/QdOIZzkL1372MUFN+7XNf0MyIXHc0v1RXER7q0gckkB
 ZkCMUvUbMhtsp+B0Qu6nadrdXQ==
X-Google-Smtp-Source: ABdhPJzqGCxSeyXG4EZ555rEszU20hQ6kecmP7efeD5JbLRoJPhz/FF5Gk+/A0B/AvB+Ic5Nx4flsg==
X-Received: by 2002:a2e:878f:: with SMTP id n15mr49924515lji.347.1641520896414; 
 Thu, 06 Jan 2022 18:01:36 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w12sm382837lfe.256.2022.01.06.18.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 18:01:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [RFC PATCH 1/7] drm/msm/dp: fix panel bridge attachment
Date: Fri,  7 Jan 2022 05:01:26 +0300
Message-Id: <20220107020132.587811-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
enable and disable") the DP driver received a drm_bridge instance, which
is always attached to the encoder as a root bridge. However it conflicts
with the panel_bridge support for eDP panels. Change panel_bridge
attachment to come after dp_bridge attachment.

Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index d4d360d19eba..26ef41a4c1b6 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -169,16 +169,6 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
 
 	drm_connector_attach_encoder(connector, dp_display->encoder);
 
-	if (dp_display->panel_bridge) {
-		ret = drm_bridge_attach(dp_display->encoder,
-					dp_display->panel_bridge, NULL,
-					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-		if (ret < 0) {
-			DRM_ERROR("failed to attach panel bridge: %d\n", ret);
-			return ERR_PTR(ret);
-		}
-	}
-
 	return connector;
 }
 
@@ -246,5 +236,16 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
 		return ERR_PTR(rc);
 	}
 
+	if (dp_display->panel_bridge) {
+		rc = drm_bridge_attach(dp_display->encoder,
+					dp_display->panel_bridge, bridge,
+					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (rc < 0) {
+			DRM_ERROR("failed to attach panel bridge: %d\n", rc);
+			drm_bridge_remove(bridge);
+			return ERR_PTR(rc);
+		}
+	}
+
 	return bridge;
 }
-- 
2.34.1

