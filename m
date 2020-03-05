Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EC217AF90
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 21:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D50B6EC3C;
	Thu,  5 Mar 2020 20:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C3A6EC2B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 20:12:54 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id j71so2521690ywb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 12:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lIzeOWmULuWaxHgacPLetV6ZZP20X2PGSej8mGAxTpI=;
 b=fTV7W+iQp4eFDU4B7obyOsHmqxNsjT6WCSHfKgW79uWCHTkVpghQvUR3n/cPP0hIyi
 1zLylXW1L4yiWWHXy+MeCMQHp3+fietoP9OCa2f33VZ/ApUAlZ73nJUZDa6goA0LSUxU
 +YhccKtIM9V+ZQHuSEOq08VmZq4wqalsUzh04HWcoff348uCs6PvpL+2S0L675qeEPln
 ATrf0hA7u4N4mmp/pvgwkMyi7ufhOUMyxy2iSZa80EIG+/6NUWRHmSNMcqtnAUF3SgSg
 KiHB42h4Hi8iZKu0Ex9aXg2Fn/4OGNDlM5Eef50I6TWwRreTd6194guGxbUUuRxJt9ae
 1A/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lIzeOWmULuWaxHgacPLetV6ZZP20X2PGSej8mGAxTpI=;
 b=mdelwX4jmALk6V4AfU6FKoKwburo3W3XuTDJzP5RTif+wWRYoDpR24O3FoZB1N4mdk
 Uv+jWT3nj1jvHQAH62rnTTIPdUX8GOhJ2OqrN5JDIlbMOv1B4L3mWMIiaRrVqnKERvjY
 hTBtLmqrQtzFb62IVnnxOZgvJg3TkELfjxfoCUELWg3O1Ey7LvjspVPa8HpgZdwlGMlM
 xSVruvnOLk6jSkR2Asxbz73z8w+s7XmBhF3J0zRvx9Og9+k77qmgw78XCF0yIQprPY03
 f+/e7JTXCZw/hTeatVstmL1gFmZAf8XPsArEZp1kDvS5QfOxp3awITHP9lqAYnOt6HAC
 8C5w==
X-Gm-Message-State: ANhLgQ1EuT9E7ci/Nfb6RgI3h2X9ZURojJENrE5WBz5KKUFprw2KW1EW
 Ync02Hl0nWJtafogZxX9fGhmGBnser8=
X-Google-Smtp-Source: ADFU+vvaHn+34TXZ41W1Rv5Num/mn827438XmVwe70N72LByQe2h4ZlsUoF8Rh6Ia3LaRrg5siTNug==
X-Received: by 2002:a25:8204:: with SMTP id q4mr9262063ybk.357.1583439172982; 
 Thu, 05 Mar 2020 12:12:52 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id q63sm9488668ywg.106.2020.03.05.12.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 12:12:52 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 13/16] drm/i915: Add connector to hdcp_shim->check_link()
Date: Thu,  5 Mar 2020 15:12:33 -0500
Message-Id: <20200305201236.152307-14-sean@poorly.run>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200305201236.152307-1-sean@poorly.run>
References: <20200305201236.152307-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch, Sean Paul <seanpaul@chromium.org>,
 juston.li@intel.com, rodrigo.vivi@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Currently we derive the connector from digital port in check_link(). For
MST, this isn't sufficient since the digital port passed into the
function can have multiple connectors downstream. This patch adds
connector to the check_link() arguments so we have it when we need it.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200218220242.107265-13-sean@poorly.run # v4

Changes in v4:
-Added to the set
Changes in v5:
-None
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 3 ++-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       | 3 ++-
 drivers/gpu/drm/i915/display/intel_hdcp.c          | 2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          | 5 ++---
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 3cac51955f250..9cc43dcbb518f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -312,7 +312,8 @@ struct intel_hdcp_shim {
 				 bool enable);
 
 	/* Ensures the link is still protected */
-	bool (*check_link)(struct intel_digital_port *intel_dig_port);
+	bool (*check_link)(struct intel_digital_port *intel_dig_port,
+			   struct intel_connector *connector);
 
 	/* Detects panel's hdcp capability. This is optional for HDMI. */
 	int (*hdcp_capable)(struct intel_digital_port *intel_dig_port,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index abcb53975e0d5..549f02f622b45 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -538,7 +538,8 @@ int intel_dp_hdcp_toggle_signalling(struct intel_digital_port *intel_dig_port,
 }
 
 static
-bool intel_dp_hdcp_check_link(struct intel_digital_port *intel_dig_port)
+bool intel_dp_hdcp_check_link(struct intel_digital_port *intel_dig_port,
+			      struct intel_connector *connector)
 {
 	ssize_t ret;
 	u8 bstatus;
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index fc3ce7586084c..e0418ad202d1f 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -956,7 +956,7 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
 		goto out;
 	}
 
-	if (hdcp->shim->check_link(intel_dig_port)) {
+	if (hdcp->shim->check_link(intel_dig_port, connector)) {
 		if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
 			intel_hdcp_update_value(connector,
 				DRM_MODE_CONTENT_PROTECTION_ENABLED, true);
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 8b32c3c986bca..288525a9fdf7c 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1522,11 +1522,10 @@ int intel_hdmi_hdcp_toggle_signalling(struct intel_digital_port *intel_dig_port,
 }
 
 static
-bool intel_hdmi_hdcp_check_link(struct intel_digital_port *intel_dig_port)
+bool intel_hdmi_hdcp_check_link(struct intel_digital_port *intel_dig_port,
+				struct intel_connector *connector)
 {
 	struct drm_i915_private *i915 = to_i915(intel_dig_port->base.base.dev);
-	struct intel_connector *connector =
-		intel_dig_port->hdmi.attached_connector;
 	enum port port = intel_dig_port->base.port;
 	enum transcoder cpu_transcoder = connector->hdcp.cpu_transcoder;
 	int ret;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
