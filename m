Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D25E234DEC2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 04:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB016E825;
	Tue, 30 Mar 2021 02:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5936E823
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 02:54:13 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so8692390pjb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 19:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RTm+OMgZlY4S4hMjr1yPchfjYIhYww8IVvy3C+UG5OA=;
 b=T1ak2WvHBXzGIQK+L+Lq+8Ydsiyy7SAzW87e3YZAJR0P9M2cVBxpRS3kXSX/3+bAS0
 TyMOb6na5z7J4n+mnK9vwZIY4JmI8LfiedI1xE35JhEQDHzTm2Lv0g/CEOrM11JzFBPi
 J7Pzn6F79MaPYrGkaO7mXaxVycYLvdbRyGHns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RTm+OMgZlY4S4hMjr1yPchfjYIhYww8IVvy3C+UG5OA=;
 b=Ag31BF4tSieDWGC1DYb80qhIFl8uc0sfcRs8JApotYiJQ5DgZ5X4Y4CQZC5P6FUZtO
 mDdxTE6OYQqU5q9RC54mLVV1oj6nBjG7DLPhSTdo6JeWlAySTR9UKK1glFvPsRz5tKBt
 sj63NDiZGN6zoJ0UWVkLJzidv6KRY2dSmloJJvLqpsLqOdGuyMT/b7QJAyIEA0eVx1Xz
 KEnBiuYLewfqphxpjoGljzdb2BvuSlbTqarZPTi7Zx6Oxm8s7ZaenX1EsVjeUHB7n0AI
 HyAQDBpJsXlyEIBPdNPtIBVcHfKh7Uj17axsIsli/d7Eilu6ITjFXRQloXNtyKhQ5SJa
 S3RA==
X-Gm-Message-State: AOAM530Og0SbJkgIcXZfz581mRh0apwNX5XtQcOaIMP0BschMT6IUKBv
 yabT5dLQhyqmHbiR+nRjO0MONA==
X-Google-Smtp-Source: ABdhPJxPN8enXp1e4HwIU+ZMKYwa4F8Gz+UNfz2Bce7f22QcfvvT37KnbBqNKoBBqjiwxVL9mJjXCA==
X-Received: by 2002:a17:902:f54e:b029:e6:3d74:eb3 with SMTP id
 h14-20020a170902f54eb02900e63d740eb3mr31652296plf.14.1617072852935; 
 Mon, 29 Mar 2021 19:54:12 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f599:1ca7:742d:6b50])
 by smtp.gmail.com with ESMTPSA id t17sm19152706pgk.25.2021.03.29.19.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 19:54:12 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 07/14] drm/bridge: ti-sn65dsi86: Get rid of the useless
 detect() function
Date: Mon, 29 Mar 2021 19:53:38 -0700
Message-Id: <20210329195255.v2.7.I826adf4faeb7f39f560b387f6b380e639c6986c8@changeid>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210330025345.3980086-1-dianders@chromium.org>
References: <20210330025345.3980086-1-dianders@chromium.org>
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

If we just leave the detect() function as NULL then the upper layers
assume we're always connected. There's no reason for a stub.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 50a52af8e39f..a0a00dd1187c 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -306,20 +306,8 @@ static struct drm_connector_helper_funcs ti_sn_bridge_connector_helper_funcs = {
 	.mode_valid = ti_sn_bridge_connector_mode_valid,
 };
 
-static enum drm_connector_status
-ti_sn_bridge_connector_detect(struct drm_connector *connector, bool force)
-{
-	/**
-	 * TODO: Currently if drm_panel is present, then always
-	 * return the status as connected. Need to add support to detect
-	 * device state for hot pluggable scenarios.
-	 */
-	return connector_status_connected;
-}
-
 static const struct drm_connector_funcs ti_sn_bridge_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.detect = ti_sn_bridge_connector_detect,
 	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-- 
2.31.0.291.g576ba9dcdaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
