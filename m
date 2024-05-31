Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 348758D6A5C
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 22:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A8C10E287;
	Fri, 31 May 2024 20:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nAU7D3v3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761B410E2A1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 20:07:35 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2e724bc46c4so26249061fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 13:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717186053; x=1717790853; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=d6C2WBjw85TMMZ9GIIugc3NhLWza5ZaClpp5YdwIj3Y=;
 b=nAU7D3v33W/2+r08836meo/guK6QsKWwBmDFoW1BkixHmvLhoxWdhPd4ktILzToDAB
 GzDjEoSSUM/4K5OZtm4xIHc+Hi9K6jszWmH5urcsiQFe1JOorWv1W/A0DlbRUzfi3Kfd
 625Rj5USUm2aSdwS2d6f0IhK7jfQs7a2gapg58nXeWxnH9xvZc/oTaU8TR0QZoiYdY8j
 6VJvK6uFaFH+kP49odCzZZZpeOAMc9FHeb4klUhMTWrw6XMvcnsec5j4wqCcuA0RZJpg
 S3wSg95PyKXXlhPEXfO+wDCBjw+yypB06HndhR1/SU8KwTqtplusFbGSWUskQoHv+rIJ
 oQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717186053; x=1717790853;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d6C2WBjw85TMMZ9GIIugc3NhLWza5ZaClpp5YdwIj3Y=;
 b=fbzm0EeMJeP/+HjaA/2Fw2VYC++g8bvfeniZuGzUv4yx8E+TrrEuvoYaHHKohs+vSI
 RtRyI9GQdzY4u3vRdRbwUXr/8q1UexcJqbIBRL0XlbIABu1G44ep0tjMegDGPTm9sYA4
 yWN/DJFyp4NFnYY2XucKF4fVJfN3Cnm0euHtgRs/NAyjRkoBl6Hesil8PsdFxZpGAiBu
 2jylf5Q6tHJJ8nU0ZxMUCQcs7WZdTgtiWEWksjlRbG9VEuYDgtqqAwykQcpZsKpOOQ5L
 RK5acPeDmFSgtWnWxn6Phd+15cPkzkN33/JjHXzRo+L90owPc5nRU9YeaqMgE0cEHDM4
 Uhbw==
X-Gm-Message-State: AOJu0Yz/B+dQ2kJ/LTanVa9nsgT2nFHWeM0zX+GMs53TFX8PkEyABpGo
 0FrKHMKxlbzIfGH+q4SGy286NjFpGiQ+Q7+RZWsc4/B/fMO2UL4f1pN4nkqOZ7w=
X-Google-Smtp-Source: AGHT+IFEbGsurUQqegm0dR4iZcKkdLohi5tdSQtO24nzPhBAHnIn6wJq6gBZuF0+VUHo38IC2u3gKA==
X-Received: by 2002:a2e:3517:0:b0:2e5:61f8:db58 with SMTP id
 38308e7fff4ca-2ea950fd531mr19016881fa.11.1717186053514; 
 Fri, 31 May 2024 13:07:33 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea91cf0b83sm4022111fa.116.2024.05.31.13.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 13:07:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 23:07:27 +0300
Subject: [PATCH v4 4/9] drm/msm/hdmi: switch to atomic bridge callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-bridge-hdmi-connector-v4-4-5110f7943622@linaro.org>
References: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
In-Reply-To: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2170;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ATNJtCzOXDVp1OKwxiEV9jk7WYH4jasM/bHZPYZfo4g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmWi4AMWQQW3Gm/ic5snixj31M57cTzkXCz1Z9e
 9X5rwFblCyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlouAAAKCRCLPIo+Aiko
 1UGXB/9frTF1MzeSGRB/G97BiMJwkvfUeL8Hu4DM85QkmNl6gMMTDOIMaet+aTodn+4H5ZvFBNq
 7kZOfWDezgACnMCRWH+/QPv9IgQFgUk6tcYIwn++ETDnnpJJgACy/JBpINpWOfd3W+qtfiNOTDI
 g/vbKMoWEUqZg3u4O/0MUm/6fOyTUcseXHp1GZqI038siGvihfCZzHWDGJnZxZGDZ/W1+bNwyEL
 gqqMwm38yyd82GDE6mmD73qkXc5wJiFkcOBNBVcqiaXa9kYs3I/JLL1lQOHTj7C34jIPBBREVQZ
 1msY9c4lFy/x6Gxd09VDiBe4TDFWPIQUGyIhmXyOgzezAdkN
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change MSM HDMI bridge to use atomic_* callbacks in preparation to
enablign the HDMI connector support.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 4a5b5112227f..d839c71091dc 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -126,7 +126,8 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
 }
 
-static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -152,7 +153,8 @@ static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
 		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
 }
 
-static void msm_hdmi_bridge_post_disable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -299,8 +301,11 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
-	.pre_enable = msm_hdmi_bridge_pre_enable,
-	.post_disable = msm_hdmi_bridge_post_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
+	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
 	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,

-- 
2.39.2

