Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAC034DEBF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 04:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DD56E821;
	Tue, 30 Mar 2021 02:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7D26E821
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 02:54:09 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id h8so5388943plt.7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 19:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I36IxPptwcREtpot0iJCH+3WfYFhSmpYp5deLinpPgg=;
 b=kPzNiByEkfsePsfPtj6S5YnMKlXu7wXISif9REAqYuFnbIttV4HEzv66lzECdNerwv
 7caDpqP6eV3Ii4qxlTPIHhsdUFLm2GnOWAFy+MOBzjGH9Nz8Z0o0lMCvIAbizAOKHaOR
 PbfqnEFWer573aC3LXsoSyid2BQ7sYqn9l95U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I36IxPptwcREtpot0iJCH+3WfYFhSmpYp5deLinpPgg=;
 b=UNC1TeseIiuuWL9h90jFL7mYYFM1Xx1eGeEVYYjDPbWqF24UgpbCHx1XVfKjD93Bb8
 p4/qKBu5/84Fks9OfFY0a+coNNIfKVaD7lmMvBg+RsEao5AhKBaf4DJ5fdbSVnPBM33H
 DNIkATU7nmqrJL3ohUbCV8pX6v+PQLda3oKNebVVSTK2H9YlCPx/7W77eGKlEGna7Z6V
 VPAmnWxeEtWUEPJScWo9yhaq+mZfAB+JpT5HKonw+/T67jOl5UVX2/e/mRladNX5rD8M
 pYS32rP66k1+1E98AEUjNPtwakBPJMt6+aiuzNZQoon7AcS/wyECfdDmHd5IoicBcT15
 zeBg==
X-Gm-Message-State: AOAM531RZC1cA7hJ5jYjbkqhLsoeO0lZAabLuyChVopnGu/P8GIZGfp6
 Byo8UWIzufmDR26vW5rEDnjYGA==
X-Google-Smtp-Source: ABdhPJzao4hv+1lRc1IJmNX9LkjQKMN0rQjB/u4FznRywuq7j6sWJCoD2wfDN9s9896IQSi9E/Bnug==
X-Received: by 2002:a17:90a:c20a:: with SMTP id
 e10mr2008412pjt.221.1617072849314; 
 Mon, 29 Mar 2021 19:54:09 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f599:1ca7:742d:6b50])
 by smtp.gmail.com with ESMTPSA id t17sm19152706pgk.25.2021.03.29.19.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 19:54:09 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 05/14] drm/bridge: ti-sn65dsi86: Move MIPI detach() /
 unregister() to detach()
Date: Mon, 29 Mar 2021 19:53:36 -0700
Message-Id: <20210329195255.v2.5.I1a9275ffbde1d33ad7a3af819f5fbc0941b7ee02@changeid>
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

The register() / attach() for MIPI happen in the bridge's
attach(). That means that the inverse belongs in the bridge's
detach().

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index c006678c9921..e8e523b3a16b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -437,7 +437,15 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 
 static void ti_sn_bridge_detach(struct drm_bridge *bridge)
 {
-	drm_dp_aux_unregister(&bridge_to_ti_sn_bridge(bridge)->aux);
+	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
+
+
+	if (pdata->dsi) {
+		mipi_dsi_detach(pdata->dsi);
+		mipi_dsi_device_unregister(pdata->dsi);
+	}
+
+	drm_dp_aux_unregister(&pdata->aux);
 }
 
 static void ti_sn_bridge_disable(struct drm_bridge *bridge)
@@ -1315,11 +1323,6 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
 	if (!pdata)
 		return -EINVAL;
 
-	if (pdata->dsi) {
-		mipi_dsi_detach(pdata->dsi);
-		mipi_dsi_device_unregister(pdata->dsi);
-	}
-
 	kfree(pdata->edid);
 
 	ti_sn_debugfs_remove(pdata);
-- 
2.31.0.291.g576ba9dcdaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
