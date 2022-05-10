Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F3752254D
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 22:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56CE10F12E;
	Tue, 10 May 2022 20:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B617E10E900
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 20:14:04 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id c14so129706pfn.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 13:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EzCqYX0EcAnW/iCkUeOk0GkKHb4Fvl7h4vQ2bns/5yY=;
 b=VzIZvP9gugPrAqVQj0bxx18Ci/S+CaP2uu85Y+I5aOI77mqgMrm5dZNZjJp8NYjIOI
 1CmHD5JR7I0ggMm1UwplHAK5Yh91KeSFU/Z4fBj0Ond/7+hB6KsN09KHMrp6hm9Pl+GK
 eF5M/vQmR1H7M19aaM1tgKgkEeHjyyi2pjuIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EzCqYX0EcAnW/iCkUeOk0GkKHb4Fvl7h4vQ2bns/5yY=;
 b=RO/EWXp7TaFBRZsHJMNKYqWb5VvHQ6GPIGnWklIm1aHuljCHpJzKCg46sMWQmmwMOt
 WENCcTJoZ6ExDHrwFsuq0Cmxg+a8i6J/0cpd0LwiDZYS5r/CKFOp4uM5OmG12rD3QybW
 7NKIhIQffiN6RcHke6LZn7oc3vN32b+ZdmOKwWan0zCSPaIEn8DHByiViHxLOxxDSnxK
 1CsXUIDyyae0TAc3buGBTEI9MT06ARxc0PjY00cIdGXQ26tIpix0B8Rbr6O2QT9XPBb3
 +OMdQ88+eAtdOjblz8I1HiBuFmL9iutbpuiy+Z/R5gK82ml2GzXGJES4aCQbI2rDN/JW
 qm2A==
X-Gm-Message-State: AOAM530V3sqI2sRRVxvmncbe3htDqQjtv7Aec5IecO5dIvC29AbVkruz
 S6Ad3HjqIK8KfhFHME4lXo609PNRwIMCq6EZPs8=
X-Google-Smtp-Source: ABdhPJyTD+9hTeZ+4Lyf3CqPIny6pCSqUrlEzkAKzzbRIGD7qEh75gbouGsB+MWgDJmc/eEA7sTYYw==
X-Received: by 2002:a63:184c:0:b0:3c5:fd55:1e9e with SMTP id
 12-20020a63184c000000b003c5fd551e9emr17872032pgy.315.1652213644106; 
 Tue, 10 May 2022 13:14:04 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6f08:624c:c762:d238])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a170902704800b0015e8d4eb247sm26605plt.145.2022.05.10.13.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 13:14:03 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/probe-helper: For DP,
 add 640x480 if all other modes are bad
Date: Tue, 10 May 2022 13:13:34 -0700
Message-Id: <20220510131309.v2.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220510131309.v2.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
References: <20220510131309.v2.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
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
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 quic_khsieh@quicinc.com, tzimmermann@suse.de, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
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
Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes in v2:
- Two underscores for __drm_helper_update_and_validate().
- Return err and use WARN_ON instead of returning a bool.

 drivers/gpu/drm/drm_probe_helper.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index ff3dd9a5da70..871b3d19a153 100644
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
@@ -582,9 +581,28 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 		WARN_ON(ret);
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
+		ret = __drm_helper_update_and_validate(connector, maxX, maxY, &ctx);
+		if (ret == -EDEADLK) {
+			drm_modeset_backoff(&ctx);
+			goto retry;
+		}
+		WARN_ON(ret);
+		drm_mode_prune_invalid(dev, &connector->modes, true);
+	}
+
+exit:
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 
-- 
2.36.0.550.gb090851708-goog

