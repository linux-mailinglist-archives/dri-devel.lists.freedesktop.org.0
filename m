Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2AD353114
	for <lists+dri-devel@lfdr.de>; Sat,  3 Apr 2021 00:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE186F3A6;
	Fri,  2 Apr 2021 22:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2954F6F3A5
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 22:29:39 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id v8so3050189plz.10
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Apr 2021 15:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MtWyTu8A+Bll3XZyYofmr3PZnBtQf0rbeehEFhIdO78=;
 b=Ltxl2XhjD/ANgUYImu7Hfd2BJK5hAeBDH7r6rm/XM1PchLg6jFes8pOy+fpJ+d1xNF
 mEi8EfXMnmaNGrqNPKLakjwlMXMrTeRPfxTjq/AkQhjFd8nhYHYHlNIdRaFnYkXxtc+y
 wHQML8n9Eclh+k1XvOVHhvXRVVTKehp8QiIIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MtWyTu8A+Bll3XZyYofmr3PZnBtQf0rbeehEFhIdO78=;
 b=U4sXhIRXwgwPw0NZvGFO2pfEbVTYqWnFLf+cS3G22PSuOnCcd9wNHgKusfNtsKRcbw
 ptSguheXzsnuxO1ggKar/7HEcAiHx3C4DByIWK5bY8UehZgy60zg97ZEl0GIyPsNyX3+
 zLNVFC3/KQkKO2b3D8LJB5DIKsekqNlccbdNVuHPUiIMR+OmZ9exPlQMaRrALf8edjmi
 p5v2FfRg14QqLeaCarTvAh08jUgHZklfUTEiXmHGMJ9hHu1z8YbfcFa5L2fzKwcacVQI
 70ZInwtOY500RcVzqru7uniRo7rZ3VgWhqu8vH87Rs3mvq5cBNODzX7IBsfdQU6d6lBe
 G/LA==
X-Gm-Message-State: AOAM530c1g1Gkkwrp9nEI91w4kTYbHgoiYu5xsDrgCKViJRC47z+UO3P
 sr2J5Y4C6c8PA0THYGgh0PP59A==
X-Google-Smtp-Source: ABdhPJxUVyK0tKS8MW57jWx2k1rvcrhHVw/btAMD+OvmUvahUSin882TSOsaAzGaGWOl39sdORxuew==
X-Received: by 2002:a17:902:c94c:b029:e6:cd16:24ec with SMTP id
 i12-20020a170902c94cb02900e6cd1624ecmr14488649pla.27.1617402578767; 
 Fri, 02 Apr 2021 15:29:38 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6c58:fab2:c5e2:f2d7])
 by smtp.gmail.com with ESMTPSA id t16sm9233094pfc.204.2021.04.02.15.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 15:29:38 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 11/12] drm/bridge: ti-sn65dsi86: Print an error if we
 fallback to panel modes
Date: Fri,  2 Apr 2021 15:28:45 -0700
Message-Id: <20210402152701.v3.11.Ib4183a04e8698f60b67558f363fddbbaf33dd445@changeid>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
In-Reply-To: <20210402222846.2461042-1-dianders@chromium.org>
References: <20210402222846.2461042-1-dianders@chromium.org>
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we can properly read the EDID for modes there should be no
reason to fallback to the fixed modes that our downstream panel driver
provides us. Let's make that clear by:
- Putting an error message in the logs if we fall back.
- Putting a comment in saying what's going on.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index fb50f9f95b0f..3b61898cf9cb 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -303,6 +303,13 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 			return num;
 	}
 
+	/*
+	 * Ideally this should never happen and we could remove the fallback
+	 * but let's preserve old behavior.
+	 */
+	DRM_DEV_ERROR(pdata->dev,
+		      "Failed to read EDID; falling back to panel modes");
+
 exit:
 	return drm_panel_get_modes(pdata->panel, connector);
 }
-- 
2.31.0.208.g409f899ff0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
