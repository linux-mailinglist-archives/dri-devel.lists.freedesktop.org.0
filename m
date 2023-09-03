Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EA1790E3D
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 23:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA45110E216;
	Sun,  3 Sep 2023 21:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B098B10E08A
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 21:29:42 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b974031aeaso13339851fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 14:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693776580; x=1694381380; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LTYtN9ceXzi2tGhWn5q5e7ybJcm3lf5yDMeSzJkSqgc=;
 b=goGAOObai+OgxPmKJRqqt5XpovvY1yzM4zxyCOZWdhqtCQ/rHRWbE8VE9bZu5J/s20
 fnafHBBUFCp4UFA4IqBLZgWBRNYGhSjX+w+hRV4Je0bf8yna98IDpzN4VuZ8oTn19TdL
 8BjY44jzbKbk00ocxTBWAjr2RLDCYR/Uvk9GGpMuAxCMuQHINehOpwslPXw0Rk2eQNqA
 0qxwh3UE0HDg5hF8AQ4DLmZHhwG1LbkhSE05SQ8/1fAS4XBmeLCYxkcHa0OMhlRvCdyT
 xwwqJbSVoEAxlLRZ4GBo2SIqA1T88QHWWfXRPR0v1yFe9UtLTxzJ8R2d9fJJcHouglOU
 L3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693776580; x=1694381380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LTYtN9ceXzi2tGhWn5q5e7ybJcm3lf5yDMeSzJkSqgc=;
 b=D5EWQlC7nADw4l8zSYrinJaFmozYcQoIgBtpcBvpAcBCHP8Ni0Pec0/gnG3Z51syHh
 Q55++wdI4EfjkMNiv0GaiWZHbHtTtHLLk0RkFdAJvjqBkAU2J03o/AFW5HVAEIOux+DP
 B5ol6JrwlhHHTvrTzniSANlE/ZnA+lUhMtog3CBwFDbmlimoJwbFKFJ1nx6B3iJL4PKC
 WCQEmS2PH8NTC1XlkyHecKjqgfDZsaaUS81lVSpPxDlCk5GQdgLccgWyR1PWXRYeRrgP
 R5UkDNZEXlzHFLhHqzRtQpG5JgeNR/oTvWX73OE2gpIvzrVvu71Q0Tx/RDp475g2kiAD
 JtWw==
X-Gm-Message-State: AOJu0Yw17Ls/tINC1rJtvszuTrTkDvMfjapcKXTUys1Z5bpNxF+/Oi4L
 rDfwmvRyspI24vUshhIMdaIJPw==
X-Google-Smtp-Source: AGHT+IHhuu1XpaE+PO25+uVWIsSs6HgoMj+d3EKB5ectySV1k+e2KdlfTqc8aDVm4kOQSBo9dpyfxQ==
X-Received: by 2002:ac2:58ca:0:b0:4f4:d071:be48 with SMTP id
 u10-20020ac258ca000000b004f4d071be48mr4760118lfo.14.1693776580258; 
 Sun, 03 Sep 2023 14:29:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 eq11-20020a056512488b00b004ff8d9ed368sm1412352lfb.258.2023.09.03.14.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 14:29:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v7 2/3] drm/bridge_connector: stop filtering events in
 drm_bridge_connector_hpd_cb()
Date: Mon,  4 Sep 2023 00:29:36 +0300
Message-Id: <20230903212937.2876815-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903212937.2876815-1-dmitry.baryshkov@linaro.org>
References: <20230903212937.2876815-1-dmitry.baryshkov@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, intel-gfx@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-arm-msm@vger.kernel.org,
 Janne Grunau <j@jannau.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In some cases the bridge drivers would like to receive hotplug events
even in the case new status is equal to the old status. In the DP case
this is used to deliver "attention" messages to the DP host. Stop
filtering the events in the drm_bridge_connector_hpd_cb() and let
drivers decide whether they would like to receive the event or not.

Reviewed-By: Janne Grunau <j@jannau.net>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 1da93d5a1f61..10b52224db37 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -113,16 +113,11 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
 	struct drm_bridge_connector *drm_bridge_connector = cb_data;
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
-	enum drm_connector_status old_status;
 
 	mutex_lock(&dev->mode_config.mutex);
-	old_status = connector->status;
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	if (old_status == status)
-		return;
-
 	drm_bridge_connector_hpd_notify(connector, status);
 
 	drm_kms_helper_connector_hotplug_event(connector);
-- 
2.39.2

