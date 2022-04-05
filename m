Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2C94F4816
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 01:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0AF10EB6E;
	Tue,  5 Apr 2022 23:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E6C10EC60
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 23:45:56 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id 17so1091200lji.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 16:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aea1eCmRXc8SvtM+T5RIzo3X5fELyftyC6ru1eyNaJQ=;
 b=QNMeYGmbbeXLzOYPgSwVK5EPsBm0loeIlT/9PVLnAQSYIwBexuRGVtEtuqmfnl62ol
 U2iFKUauEhHdSPbFcevKHJVoP5d75BPcy1bgBlhguKYCU5TqlCdJykzy4Eg8qBfj+vrZ
 V+qlU5SZBBowD+Pzd9YjJn2vk1XVMXZRGRq4QwKYRXxGdMvnIF+LbUOJmXrdkxn90X+a
 //gUCMfRfZ8X8KUvWOd9x9MI/+VUEnlGqBwV2Vf27WjJ3TP78Bt2g77Rw4+C5EQhD/wn
 3GuadRjY3Jf2C+2HolvwFGp8MLuaGEmQh7y9gvQICUA9PsmRLfKT2sIjc3C1mc2U72Hn
 K3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aea1eCmRXc8SvtM+T5RIzo3X5fELyftyC6ru1eyNaJQ=;
 b=ZlvLBJSiv3DV3Ja1U+KMEyI3zkUyfekoEzfZypSHQw6lLBsDxzAP/mHavDXA11ZQ6y
 QUKLWEFtKkmZA+6GmcVdUf6cBb/vWMi2lvgQiloHZ4XGw+GIslAiiC7nBLjsDrC65KJ4
 lGcb/UJ5cCXxGxrL6VU9scP2jPcV5KnKELiXoPHjL34BEeNkuNTqVeUdB0aArErP2Agc
 aFI989PidqYKSddnidCy19//bOmeUSkt5c8EAv36Bpt9XJ8TAOmU2iYqgxhuf7wQLntH
 eXkDRhvh9BbNkz3S/85IQGhMVMkODA+wukC06z579RryuzWsyOMjntncj0LqxFjpjFoN
 wL5g==
X-Gm-Message-State: AOAM531iK0nLm2VYQ0m9BUV7Z4dn2Xi+/91fNvK1+sD96m/QQW3298mg
 I0qOEGyNMPohnpidgfTqHOIT3w==
X-Google-Smtp-Source: ABdhPJzo4h+1cA8+ptBf6oSHmeKyXyUhblQE/hDzU3ZFeZOpPffVOlZamsan2q3hL+qQPtLNbg7+FQ==
X-Received: by 2002:a05:651c:154:b0:24b:152:266e with SMTP id
 c20-20020a05651c015400b0024b0152266emr3656017ljd.185.1649202354706; 
 Tue, 05 Apr 2022 16:45:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 g11-20020ac24d8b000000b0044a3454c858sm1651897lfe.81.2022.04.05.16.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 16:45:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 3/4] drm/msm/dp: properly add and remove created bridges
Date: Wed,  6 Apr 2022 02:45:50 +0300
Message-Id: <20220405234551.359453-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
References: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
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

Add calls to drm_bridge_add()/drm_bridge_remove() for the internal DP
bridges.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 80f59cf99089..a7415f9eb80e 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -230,9 +230,13 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
 	bridge->funcs = &dp_bridge_ops;
 	bridge->encoder = encoder;
 
+	drm_bridge_add(bridge);
+
 	rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (rc) {
 		DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
+		drm_bridge_remove(bridge);
+
 		return ERR_PTR(rc);
 	}
 
@@ -242,6 +246,7 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
 					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (rc < 0) {
 			DRM_ERROR("failed to attach panel bridge: %d\n", rc);
+			drm_bridge_detach(bridge);
 			drm_bridge_remove(bridge);
 			return ERR_PTR(rc);
 		}
-- 
2.35.1

