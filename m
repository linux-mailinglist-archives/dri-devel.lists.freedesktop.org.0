Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 916445174F5
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C169710F15C;
	Mon,  2 May 2022 16:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC1910F14B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 16:51:35 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-deb9295679so14812437fac.6
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 09:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K90a1QhJHpsQXxatRkh1e5e68HIkTPZWj4pLHJQIQOA=;
 b=FQdtOKJDpPgUqFOC6SLrbP7LwibhmUyCwt5JMP8J7hd8YFMu7yfmlKGGywt9yD2AzZ
 4bNOCHHiB4eybvTS1NLlgDgqEqzaXe1WLrpi6/yEbiUSZF2iTfhDUcdd1aTSBJeMO0s+
 RNrSMxkgJ+cDk16I0j3q/QuMvq9FTTHLpjVDaOXW87Soxx1WNnA4G05KHPsHX0Bt1RQA
 Che3UYlwJtgGsO1iyGUIuklvTidR98D2Ml6CHj7wHGh1HQDEJRNLfW0dOlqfrKO3it+q
 zq7mWXF6EKGzBH3tI8Ob+j4wTCs0Uu1e3d+TRSRlrso0O0Uq58gkXqcVYskUpugAfKiT
 Z9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K90a1QhJHpsQXxatRkh1e5e68HIkTPZWj4pLHJQIQOA=;
 b=ovb+l4zwjW46onr0CMwygwisG/cvD7tuZdVAbkNU3gDU1xvHD5IFgkCl5843uSTc/q
 Crdcq5c5uTmv8nKzVQwApN25pguC92fMfTb58aYPIPkbfsXp4BaZuz40mNIqk+QNdt3N
 OHaeJZrcq4vn+JgcukcFKqsasQwQ4B2zUF+Vs12/q9uOYpno8oc5Vooc8SROdWdB9x8r
 eU+B9b+8MoYWjM1Lvhy1astWLc8llf03uegaZp6VOFWEc0c7Caq5xSZYFkKjttsY52rw
 A0LBQYouFABoM8hkCFA19uC44Tz0iVFc6T8G4rn5XeKcndD/2je2xI5WhoJoQ6Q+AfqV
 UhcQ==
X-Gm-Message-State: AOAM532/wsof/ptph9bkLxoTbAD8of5wb4FWD5hdqMUaishorS+7I2Ei
 qN/e0WchJArU2ZyZ+12IhEFEVQ==
X-Google-Smtp-Source: ABdhPJzCOneZu4AMnooib+bg8ZJwce3fsqFCE7WWhYymkLStPsKv55OzdAyCgnQNFba6Oycz1dDM2g==
X-Received: by 2002:a05:6870:70a8:b0:e6:30d9:c7f6 with SMTP id
 v40-20020a05687070a800b000e630d9c7f6mr2821oae.179.1651510294594; 
 Mon, 02 May 2022 09:51:34 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 h11-20020a4add8b000000b0035eb4e5a6ccsm4029422oov.34.2022.05.02.09.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 09:51:34 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [PATCH v4 3/5] drm/bridge_connector: implement oob_hotplug_event
Date: Mon,  2 May 2022 09:53:14 -0700
Message-Id: <20220502165316.4167199-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502165316.4167199-1-bjorn.andersson@linaro.org>
References: <20220502165316.4167199-1-bjorn.andersson@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Implement the oob_hotplug_event() callback. Translate it to the HPD
notification sent to the HPD bridge in the chain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- New patch

 drivers/gpu/drm/drm_bridge_connector.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 0f6f3f653f65..6a0a6b14360a 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -123,6 +123,17 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
 	drm_kms_helper_hotplug_event(dev);
 }
 
+static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
+						   enum drm_connector_status status)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *hpd = bridge_connector->bridge_hpd;
+
+	if (hpd)
+		drm_bridge_hpd_notify(hpd, status);
+}
+
 /**
  * drm_bridge_connector_enable_hpd - Enable hot-plug detection for the connector
  * @connector: The DRM bridge connector
@@ -233,6 +244,7 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.debugfs_init = drm_bridge_connector_debugfs_init,
+	.oob_hotplug_event = drm_bridge_connector_oob_hotplug_event,
 };
 
 /* -----------------------------------------------------------------------------
-- 
2.35.1

