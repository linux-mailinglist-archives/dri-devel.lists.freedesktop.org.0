Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F13501BE7EC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 21:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806666F3DD;
	Wed, 29 Apr 2020 19:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6D66F3AE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 19:55:29 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id n143so3350168qkn.8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 12:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SCFx8zyopIthcyEc/mlu19Rpl/tv2c7BOtxN2to9LKU=;
 b=HjaWfjWD/5dnLQn0VHW3e9Z2Gt3mgd2V9TS9U8DNoJeuC3mBRl0HSIIXBqK15MZbMK
 D74/i/ofzp5iIB1SdlQuzIJD3O6oYGpljE2LpQygFR53q5k6xINDBgL859kB24GVfG1V
 mj9KWS+JIA/dvUAvVwKQLQcoOjtLctr+HTszAB7eWoVdEVPpKiNa670rTO2DaeoqEXwE
 s0MQs3LA7iOb32aOfOYoWRGlPzr3Ll6QOiU6igif0M4aqZDvlnJlP+aZYOnsYdzgiuUu
 E8nwKs0G9MycQ+u0xfCZAz4vWP9J5thKiPxgxy/DkykgbyOF7bWdgLSvEUOJZ+Pd+5LX
 Lv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SCFx8zyopIthcyEc/mlu19Rpl/tv2c7BOtxN2to9LKU=;
 b=FvAEgm/QnFOHoXHCutNLsrEO+muKPZhxoTZCP8jne74q63C3EkAMVGdTyNjLjP6Eqv
 eLejBX5wi0U5NtUPu39LUqO9cfeMrXD14FWGMv1vnSRfX2lHjPAkW07puP7j+jyVuSyi
 MPSsx/XMm0pe4xJOJTHKZFLvbRaHnx2mWfPpi0BepCU6nQlnd2Jglep80caQs6DvbOoX
 JOjrMD+WZ/b3+HnpcQg+a2rKPQ8S29NDx8tqPxockEumMpOkAWqokeERkSwruAx5+GZd
 LixtUhXMWPAliGAU4uhAnAv/9BHDbfC9uGlH4vf3fpvSHWXutTQ3BbeLeWb3KFp2RzVt
 Vv/w==
X-Gm-Message-State: AGi0PuZQK1fl+f2/wT8qt/wS+oA0RC2RofcTyK2so5oHUr8qKbTb2X2N
 K/V0jtimx/846NPQjEVYhYUmt6MqZKk=
X-Google-Smtp-Source: APiQypKKPLHoQoH6K1VHPoXVFIYVAqR7H/DQ2Prep82+eRSGIQmXDGfMIs2/Nbx1BfJGTTvZbOp9Fg==
X-Received: by 2002:a05:620a:1306:: with SMTP id
 o6mr64552qkj.443.1588190128709; 
 Wed, 29 Apr 2020 12:55:28 -0700 (PDT)
Received: from localhost (mobile-166-170-55-34.mycingular.net. [166.170.55.34])
 by smtp.gmail.com with ESMTPSA id p10sm194806qtu.14.2020.04.29.12.55.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Apr 2020 12:55:28 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 13/16] drm/i915: Add connector to hdcp_shim->check_link()
Date: Wed, 29 Apr 2020 15:54:59 -0400
Message-Id: <20200429195502.39919-14-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429195502.39919-1-sean@poorly.run>
References: <20200429195502.39919-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org, juston.li@intel.com,
 rodrigo.vivi@intel.com
MIME-Version: 1.0
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
Link: https://patchwork.freedesktop.org/patch/msgid/20200218220242.107265-13-sean@poorly.run #v4
Link: https://patchwork.freedesktop.org/patch/msgid/20200305201236.152307-14-sean@poorly.run #v5

Changes in v4:
-Added to the set
Changes in v5:
-None
Changes in v6:
-None
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 3 ++-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c       | 3 ++-
 drivers/gpu/drm/i915/display/intel_hdcp.c          | 2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          | 5 ++---
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index f17911e25452..8365f9d08e2c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -318,7 +318,8 @@ struct intel_hdcp_shim {
 				 bool enable);
 
 	/* Ensures the link is still protected */
-	bool (*check_link)(struct intel_digital_port *intel_dig_port);
+	bool (*check_link)(struct intel_digital_port *intel_dig_port,
+			   struct intel_connector *connector);
 
 	/* Detects panel's hdcp capability. This is optional for HDMI. */
 	int (*hdcp_capable)(struct intel_digital_port *intel_dig_port,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index 52207f767f48..4e3dafbea1f9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -565,7 +565,8 @@ int intel_dp_hdcp_toggle_signalling(struct intel_digital_port *intel_dig_port,
 }
 
 static
-bool intel_dp_hdcp_check_link(struct intel_digital_port *intel_dig_port)
+bool intel_dp_hdcp_check_link(struct intel_digital_port *intel_dig_port,
+			      struct intel_connector *connector)
 {
 	struct drm_i915_private *i915 = to_i915(intel_dig_port->base.base.dev);
 	ssize_t ret;
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 041fe1f69b73..9377919251bf 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -953,7 +953,7 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
 		goto out;
 	}
 
-	if (hdcp->shim->check_link(intel_dig_port)) {
+	if (hdcp->shim->check_link(intel_dig_port, connector)) {
 		if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
 			intel_hdcp_update_value(connector,
 				DRM_MODE_CONTENT_PROTECTION_ENABLED, true);
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 9c5b40e4c0c4..52166582a199 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1546,11 +1546,10 @@ int intel_hdmi_hdcp_toggle_signalling(struct intel_digital_port *intel_dig_port,
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
