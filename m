Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA76875B50
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 00:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA8110F60A;
	Thu,  7 Mar 2024 23:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XLQQ/f8n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6578110F609
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 23:57:10 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-51341a5aafbso1644645e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 15:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709855828; x=1710460628; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oSCLgDYohNznRCwnS8tfo5EB4gMkp+kuVZWS1xIx1Q0=;
 b=XLQQ/f8nxY813H1KAOwbTi+TVDMFN9vO6vBtr9i0bEOqg7yN2dKwaInlwCg7OLKT+1
 4PY5uecm4Q7D/E2Ivlyh4yqtY+JLM5Jy6fM4TuluyyXkionkfsyZQEggKM7JVfF4z4CU
 0Js76PRN40nIO9TiA+NG9b1rn10Cq48epwBJLrXMhGGhWBLFKnxIETwRMeKVKp5AAn4D
 9kSWhAr16kY51tecvXnRzfKikkMNp9+yx7S7sc6tctNmVbhg7G2MZag6IoFOlc1s9XS9
 wVbK/MPus8G3kP9Xf1RDdxWHqh371enj5xUj0AEOIyTQMrDO1bJAMIiPykp9dMC1hChr
 /NfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709855828; x=1710460628;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oSCLgDYohNznRCwnS8tfo5EB4gMkp+kuVZWS1xIx1Q0=;
 b=oqtT7pgSyKTH2KhkcdStXNrhflRhqXbk4abJnMyKmR64rCdMcqAKyi0ZUimJmUljIe
 e9spckQOAhOgejQwB7439EZMp2e0CaXMdfnReCp739H+LtZnlFHMgzRySY2AFmFt+Win
 dTwo1FGx0r5dHF08B8A0a0YzX5i2FblO4B8Odt4V08JAoaeuKnYE4faeMzjVMUAriSVA
 Zi4ZdqKa39ThBZ78cY8K4G2WozFXPTx4j+Ho5J2l72dDkfdMTgKkDI8LRqA7tAN8gUQd
 ykNYKT1rLOXUaO8RcuuV4RcUruUhHrWezce1fCZXls9reWocJZcB9r/NzP+vTOoC3V0m
 ue5A==
X-Gm-Message-State: AOJu0YxUsGYvHljldecbY/gBiltF85hNufZtC01s4He0NXlAr5TdDwCH
 ofyAKP+txgK9hi357m8WzmyQjk46c4iF0ER7mk4tAG1C83Xo2vfF50+P/Gr7prc=
X-Google-Smtp-Source: AGHT+IEx8ik/HnzE5BA3s5swGV9Uvxj+BG3KC6Xb175mtXkrd/DFHNiOAucs1EnWSDmhAsJ/EiGyZw==
X-Received: by 2002:a05:6512:4892:b0:513:5c68:9891 with SMTP id
 eq18-20020a056512489200b005135c689891mr2272468lfb.44.1709855828422; 
 Thu, 07 Mar 2024 15:57:08 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 c25-20020ac25f79000000b005133277eb29sm2796475lfc.270.2024.03.07.15.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 15:57:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 08 Mar 2024 01:57:04 +0200
Subject: [PATCH RFC 5/6] drm/msm/hdmi: switch to atomic bridge callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240308-bridge-hdmi-connector-v1-5-90b693550260@linaro.org>
References: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
In-Reply-To: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
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
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2124;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BLTMrmfRiYz+a4tS74ezbT2hZO40I+AiAHfNW/m4HPQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl6lROL7TvShNhOkfkCagc8FA+VRYozrsB3Q7UA
 zETQDg5gr6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZepUTgAKCRCLPIo+Aiko
 1fQ2B/0ZYDxsY+2fnjYDrke5sXxwtAYhbmqca/jy6/PZd9RLE6EoGmw3UjQ9+BkB/3DLashehFZ
 A4QKe+48Hk9UC7q75UmY+fdFTK6F11Eq39JoHum+VnA3YhBDT1mUzcrCGWIdsMjbJ8nLIVcfqil
 y1VzRByOEZt8L86tJGG5ppOv6t+WYsckKA4MxZyxTF7SndcMQDhg576pSae+f7N1pyG1PueyVbr
 P2/+Grv0/xoB9mpaw9Je3rsMWWCZt32xe3Nr9e7dSnD7Un/uYJC8WdKxnX8cBBZTqjexmmTbCWH
 /yuLJCdw7GPswznIkLI11B7SVfk/5qBFhqIZQU9dfudhZEHF
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

