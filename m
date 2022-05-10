Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3735224CF
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 21:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC4A10E3F5;
	Tue, 10 May 2022 19:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8774610E536
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 19:30:02 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 j10-20020a17090a94ca00b001dd2131159aso2861263pjw.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 12:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=spc3e6Lp3Smlzf38aH5fCH48i9kTiBR8/UYKG1CLueQ=;
 b=cz0Xr0eL1ajvZSsgLbzZbq39CiowXavZ6oKFanIVRSuNSdPrMxAI9a+lUYIybRRI8Z
 l9f9QgXxhrErMb0+Rw3GcIBYoSBZvvHafQIs7JEGkOMAMdASorM5GZlqQ/R8kl67yLk+
 MbgQgs1sU2wNKMz62e7ITFkvv7ogeaeVCTLPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=spc3e6Lp3Smlzf38aH5fCH48i9kTiBR8/UYKG1CLueQ=;
 b=s7lz/dO6NIawejeufLQ5+Jm2TNwQdOq+c8vT9qRoZPYCns3Ie9cODEnckkPISitC73
 p4KybEcDZ11cbcqvAyJmv0uUlsAduDLtSuAsQNQWyvpHiv6bywWVOsmlf8prMaCPxzbc
 hJzd/ogebbg8Lvpy2Ns6OHTB2QhMU0cKc6r+csLfCGUVianjr2rRaF+rTZg2fhlOIhak
 FYamlKnfQvL8DcL5pMVGmMwYYy9jhC+597V9HWUdj4iwCAN3T8lqyP1EojzfadZN3nXo
 GV777ud9ilCO1Gd0T61iVw70yrlY3PRpseaEzvQgL/o+03etjLdOK6s2EEVKwCqiUMmg
 6Crw==
X-Gm-Message-State: AOAM530BOVYFkHfGhzmOiVnkVe6E+KvhiaFoaq2hqgBp5P39NTni763h
 osiJP15NZ7yuPUO8IT+a9ST9yas5TIfb6D1QvLA=
X-Google-Smtp-Source: ABdhPJzOGtFQdD3JQK9OwWb3IO12+CBeitf6Rww1LcnbNvhYQovH5NU3lYy2huG1tVOn6wVcGz6pqg==
X-Received: by 2002:a17:90b:1001:b0:1d8:4978:c7d5 with SMTP id
 gm1-20020a17090b100100b001d84978c7d5mr1405066pjb.167.1652211001798; 
 Tue, 10 May 2022 12:30:01 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6f08:624c:c762:d238])
 by smtp.gmail.com with ESMTPSA id
 s43-20020a056a001c6b00b0050dc762819dsm10786989pfw.119.2022.05.10.12.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 12:30:01 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/4] drm/bridge: Add devm_drm_bridge_add()
Date: Tue, 10 May 2022 12:29:43 -0700
Message-Id: <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220510192944.2408515-1-dianders@chromium.org>
References: <20220510192944.2408515-1-dianders@chromium.org>
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds a devm managed version of drm_bridge_add(). Like other
"devm" function listed in drm_bridge.h, this function takes an
explicit "dev" to use for the lifetime management. A few notes:
* In general we have a "struct device" for bridges that makes a good
  candidate for where the lifetime matches exactly what we want.
* The "bridge->dev->dev" device appears to be the encoder
  device. That's not the right device to use for lifetime management.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Patch ("drm/bridge: Add devm_drm_bridge_add()") new for v3.

 drivers/gpu/drm/drm_bridge.c | 23 +++++++++++++++++++++++
 include/drm/drm_bridge.h     |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c96847fc0ebc..e275b4ca344b 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -170,6 +170,29 @@ void drm_bridge_add(struct drm_bridge *bridge)
 }
 EXPORT_SYMBOL(drm_bridge_add);
 
+static void drm_bridge_remove_void(void *bridge)
+{
+	drm_bridge_remove(bridge);
+}
+
+/**
+ * devm_drm_bridge_add - devm managed version of drm_bridge_add()
+ *
+ * @dev: device to tie the bridge lifetime to
+ * @bridge: bridge control structure
+ *
+ * This is the managed version of drm_bridge_add() which automatically
+ * calls drm_bridge_remove() when @dev is unbound.
+ *
+ * Return: 0 if no error or negative error code.
+ */
+int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge)
+{
+	drm_bridge_add(bridge);
+	return devm_add_action_or_reset(dev, drm_bridge_remove_void, bridge);
+}
+EXPORT_SYMBOL(devm_drm_bridge_add);
+
 /**
  * drm_bridge_remove - remove the given bridge from the global bridge list
  *
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index f27b4060faa2..42aec8612f37 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -796,6 +796,7 @@ drm_priv_to_bridge(struct drm_private_obj *priv)
 }
 
 void drm_bridge_add(struct drm_bridge *bridge);
+int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge);
 void drm_bridge_remove(struct drm_bridge *bridge);
 int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		      struct drm_bridge *previous,
-- 
2.36.0.550.gb090851708-goog

