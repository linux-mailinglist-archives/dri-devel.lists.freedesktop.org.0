Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6679D510766
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 20:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F9410E24E;
	Tue, 26 Apr 2022 18:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2719B10E24E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 18:47:13 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id b15so18779607pfm.5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 11:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ghn6c18H+YaA6ijLmc+sCKaPR5+i6PR27cmfb4hGb6k=;
 b=oJk6Lr2b2CsnDsmJDhvEfNhpVgCJYJDz9OKmDdOnUG0RWkUIVFR90AdiUHFEtqGF74
 3wuuqJtSUuNICYWUR7YJ6HJlGrZ+GvW3nOCacMX4Xv5jPxoeTZl4b9andf9cF5n23ZOE
 MrkUUD7mwToqaneOIuM/tOvvBYjZ0pJjL5ecM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ghn6c18H+YaA6ijLmc+sCKaPR5+i6PR27cmfb4hGb6k=;
 b=cHRPDSkTUnRl8QV4JUvsMVwOMPj8bzz/Fs33JsntO9NasFcrk3BntqxJqdOxA+BbEN
 qXtT4G5jYtrSKxrnUGtw5SMy2g1rPjyeMzW6cT0sM43kAdl8WEh/m3YMRB6JS7y/eFgO
 voqai/f34ne3EtSv81cjYYkpHt8xgoJKhzH06zNgw67vhuOKf0HdLcmH8OJYxhongrqA
 lLAOjhtzwZlwEdgGVrqLWEMl5KaeaPHctlQV7OkKltYmgx7k2aON2SmI9nLMqd4uMpjb
 Pjgk50kUWHwNh2HVE4+8K3E4bnzAgEESMxBCOLQYUKKflT9LIlIPXu+tX2QXPDB0ENNX
 m3yw==
X-Gm-Message-State: AOAM530OLihbQTJpLB+mq+1EmXKNWJaSVdr91x8nRVUHEY9jdvSp4Gw4
 F8AYWrpwkBlthfJmmLaO2lElB0U95YaQJ3TYDH9KKg==
X-Google-Smtp-Source: ABdhPJygRrs4Wb7MDL6awvCOxJPZ9BJ00EKhUgHfN+2pY5BZBRj0N8Zv/hgq5JQF+xd54Tlhlhj5ZQ==
X-Received: by 2002:aa7:8256:0:b0:4e0:78ad:eb81 with SMTP id
 e22-20020aa78256000000b004e078adeb81mr25918102pfn.30.1650998832541; 
 Tue, 26 Apr 2022 11:47:12 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:8e92:9f42:eda6:c0ee])
 by smtp.gmail.com with ESMTPSA id
 p185-20020a62d0c2000000b0050d1f7c515esm12584396pfg.219.2022.04.26.11.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:47:12 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/probe-helper: For DP,
 add 640x480 if all other modes are bad
Date: Tue, 26 Apr 2022 11:46:51 -0700
Message-Id: <20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220426114627.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
References: <20220426114627.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
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
Cc: quic_sbillaka@quicinc.com, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 quic_khsieh@quicinc.com, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As per Displayport spec section 5.2.1.2 ("Video Timing Format") says
that all detachable sinks shall support 640x480 @60Hz as a fail safe
mode.

A DP compliance test expected us to utilize the above fact when all
modes it presented to the DP source were not achievable. It presented
only modes that would be achievable with more lanes and/or higher
speeds than we had available and expected that when we couldn't do
that then we'd fall back to 640x480 even though it didn't advertise
this size.

In order to pass the compliance test (and also support any users who
might fall into a similar situation with their display), we need to
add 640x480 into the list of modes. However, we don't want to add
640x480 all the time. Despite the fact that the DP spec says all sinks
_shall support_ 640x480, they're not guaranteed to support it
_well_. Continuing to read the spec you can see that the display is
not required to really treat 640x480 equal to all the other modes. It
doesn't need to scale or anything--just display the pixels somehow for
failsafe purposes. It should also be noted that it's not hard to find
a display hooked up via DisplayPort that _doesn't_ support 640x480 at
all. The HP ZR30w screen I'm sitting in front of has a native DP port
and doesn't work at 640x480. I also plugged in a tiny 800x480 HDMI
display via a DP to HDMI adapter and that screen definitely doesn't
support 640x480.

As a compromise solution, let's only add the 640x480 mode if:
* We're on DP.
* All other modes have been pruned.

This acknowledges that 640x480 might not be the best mode to use but,
since sinks are _supposed_ to support it, we will at least fall back
to it if there's nothing else.

Note that we _don't_ add higher resolution modes like 1024x768 in this
case. We only add those modes for a failed EDID read where we have no
idea what's going on. In the case where we've pruned all modes then
instead we only want 640x480 which is the only defined "Fail Safe"
resolution.

This patch originated in response to Kuogee Hsieh's patch [1].

[1] https://lore.kernel.org/r/1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/drm_probe_helper.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 819225629010..90cd46cbfec1 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -476,7 +476,6 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 	const struct drm_connector_helper_funcs *connector_funcs =
 		connector->helper_private;
 	int count = 0, ret;
-	bool verbose_prune = true;
 	enum drm_connector_status old_status;
 	struct drm_modeset_acquire_ctx ctx;
 
@@ -556,8 +555,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] disconnected\n",
 			connector->base.id, connector->name);
 		drm_connector_update_edid_property(connector, NULL);
-		verbose_prune = false;
-		goto prune;
+		drm_mode_prune_invalid(dev, &connector->modes, false);
+		goto exit;
 	}
 
 	count = (*connector_funcs->get_modes)(connector);
@@ -580,9 +579,26 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 		}
 	}
 
-prune:
-	drm_mode_prune_invalid(dev, &connector->modes, verbose_prune);
+	drm_mode_prune_invalid(dev, &connector->modes, true);
 
+	/*
+	 * Displayport spec section 5.2.1.2 ("Video Timing Format") says that
+	 * all detachable sinks shall support 640x480 @60Hz as a fail safe
+	 * mode. If all modes were pruned, perhaps because they need more
+	 * lanes or a higher pixel clock than available, at least try to add
+	 * in 640x480.
+	 */
+	if (list_empty(&connector->modes) &&
+	    connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
+		count = drm_add_modes_noedid(connector, 640, 480);
+		if (_drm_helper_update_and_validate(connector, maxX, maxY, &ctx)) {
+			drm_modeset_backoff(&ctx);
+			goto retry;
+		}
+		drm_mode_prune_invalid(dev, &connector->modes, true);
+	}
+
+exit:
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog

