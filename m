Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E78248A1E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 17:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCBC89FA0;
	Tue, 18 Aug 2020 15:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B549C89D86
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 15:40:12 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id s16so15421152qtn.7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 08:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=V1y/y26hIXLqcBqxIAmvI2r8/e7KUbhWoHiepKjjzsY=;
 b=CTtSj8BVmthRjPTlz54a3kb9V3ajREGDFsmnatfS2EbtmVspovTiMoaGUSBkU61Gah
 Um8hftDpsXJGa8+ZldBccE5tnTo4N/03QlGlRCDXWhkQONs0KMtZebe/k1lz5kWFZmFz
 113joeysw8MYwUzbj9jYH1KrvrwG3q2VN21P1sKfwCqExDfFNk9nbamn4uepGxuhCyVD
 L2upLRzsxr7RzsfO37G1bTre18D55rP9Q7mb8lrHLx4grglejyh6Y+0ZSSSt8jYSq5D8
 bM/d2pGPY0kDrBhyxUbR0gb27idJfgVMAAkkjcvH3EvkRavN9ZgkbenPsY0I1tw5Tpp1
 rlyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=V1y/y26hIXLqcBqxIAmvI2r8/e7KUbhWoHiepKjjzsY=;
 b=cshLk8E1MJ1DxbMge7xj/l3FiApY66E/EtkUAFKDjOcSGU/8hnSkeYFp/xJVwxM7vT
 jRcLCR9uJZ+XZSz7SKK6KCwn3nWduReIAI0GlcnebsPc2HcboGm2NdsCpnHcpYWp8o1h
 xYHmd0tOA6/EWgqLOany17QzoRYCIxypjlYa0Ag5BnXTN+ILYahSOBlHEpvtBAVtH5+P
 67iM8dTpY4ntCSbfGSESHCGBZCihQgCOWUQVvMS6959waaUG8chr/csSrAOhS7dO70fI
 p89irSkoS/ez51kjnpVDQ8R1KZqY0cAPk3UtemWuVTbFoN+5aTzHfqTZMxAhTmQewk8Z
 8a5Q==
X-Gm-Message-State: AOAM530AJi+2XLmU8/ykWQEUp8cPW54+cEQvpIFVV1FUEO6qO+mJnzZn
 vy+D7clmzrhNg9RF5jcrVf3IE0c8MsBhcA==
X-Google-Smtp-Source: ABdhPJzMzlqNzi5bur019T3mhgAV+5kriA7b8im3904rCJYapWvaW0WVmQ+kWekqdPnTEptV7cnQIg==
X-Received: by 2002:ac8:6d2f:: with SMTP id r15mr18724217qtu.281.1597765211670; 
 Tue, 18 Aug 2020 08:40:11 -0700 (PDT)
Received: from localhost (mobile-166-170-57-144.mycingular.net.
 [166.170.57.144])
 by smtp.gmail.com with ESMTPSA id s4sm23364270qtn.34.2020.08.18.08.40.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Aug 2020 08:40:11 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 juston.li@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 anshuman.gupta@intel.com
Subject: [PATCH v8 08/17] drm/i915: Clean up intel_hdcp_disable
Date: Tue, 18 Aug 2020 11:38:56 -0400
Message-Id: <20200818153910.27894-9-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818153910.27894-1-sean@poorly.run>
References: <20200818153910.27894-1-sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 Sean Paul <seanpaul@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Add an out label and un-indent hdcp disable in preparation for
hdcp_mutex. No functional changes

Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200429195502.39919-9-sean@poorly.run #v6
Link: https://patchwork.freedesktop.org/patch/msgid/20200623155907.22961-9-sean@poorly.run #v7

Changes in v7:
-Split into separate patch (Ramalingam)
Changes in v8:
-None
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index fe9377a6e4d5..4de87012659b 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -2112,16 +2112,17 @@ int intel_hdcp_disable(struct intel_connector *connector)
 
 	mutex_lock(&hdcp->mutex);
 
-	if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
-		intel_hdcp_update_value(connector,
-					DRM_MODE_CONTENT_PROTECTION_UNDESIRED,
-					false);
-		if (hdcp->hdcp2_encrypted)
-			ret = _intel_hdcp2_disable(connector);
-		else if (hdcp->hdcp_encrypted)
-			ret = _intel_hdcp_disable(connector);
-	}
+	if (hdcp->value == DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
+		goto out;
 
+	intel_hdcp_update_value(connector,
+				DRM_MODE_CONTENT_PROTECTION_UNDESIRED, false);
+	if (hdcp->hdcp2_encrypted)
+		ret = _intel_hdcp2_disable(connector);
+	else if (hdcp->hdcp_encrypted)
+		ret = _intel_hdcp_disable(connector);
+
+out:
 	mutex_unlock(&hdcp->mutex);
 	cancel_delayed_work_sync(&hdcp->check_work);
 	return ret;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
