Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 392C620569B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 17:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAA76E9E3;
	Tue, 23 Jun 2020 15:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA776E9E3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 15:59:31 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id dm12so681062qvb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 08:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=po396SUur7Ag9gV2dtCVz40SdlSEgGYjFmEg0HhFQpE=;
 b=cNcp9ivQznIVbPdxd+N0kAQoXXLz7UQMHOW9Zd1C/zCrvuSRyP+T3t+hicCfUHZH4L
 bLyoYIcrZv/lXi5618uydTJMzGmJZWb+WGOg4W8WqtvoFbgN+Ub8Vs+plgQHHRslUwJf
 foxxwfaW+Ojj4FRbj1n0PpEhTslDfe5niDUQfGFE0niUeBigBwQgX+DeEjpcmv+SuVbk
 3cthOLVYn9JFR1qf7ipZtchkjoMFZrULynqlyfGghbPi18w61HIkW6n998876RhtHwsy
 8aRcq/2jf9jQJsDERBm05KtrArtKBzpvIAf80B9fci8E+9b8RwbKtAhKKo2GvGJRppPd
 TlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=po396SUur7Ag9gV2dtCVz40SdlSEgGYjFmEg0HhFQpE=;
 b=IkLND5GvKEL1ErWs0rra8F4SrJRAzaUzsUDh3l8ScDaPs9zUhT+GCF+e1fL7b7uWj4
 oe+YeeZM61zSQQC/JJYIKQF10EGpoAYPTCMOby20WlkCJ1hHrhpbsySJtr1Dq4CQjGQ7
 6TC0lL7caARFZdX6m9Zip85JYoK7Yz5bhilPkzd1S1bXaJ74+L98qHvqMDSNmXE8WuNC
 EubVEdZnjiiF+R8xinkYn5iZeXaFkX2+OlXEsSAlrvitYlgLyJuL9+yCm3Pk2j9AjnVa
 dglQDUM+TapbT8kVnXg7Z+Cvt6usT9dx2Xov3t4IRpi1B5tFCS6IyQFrUQFRLTHWurSS
 C35w==
X-Gm-Message-State: AOAM5330UIdId/GfyVX2QL0kbrARdAFmYUmYtCEkXSZ98VZ3N45/s+sa
 WZLv5nXfquHXpfduie6JnnsnI9wCnj4=
X-Google-Smtp-Source: ABdhPJyZfdD0KasXmPQN/jSX0wIJPxYUCaU1k7ycvnkh+UHvAoAvGGTGMTXim9mihyusNMniGV/DyQ==
X-Received: by 2002:a05:6214:10e1:: with SMTP id
 q1mr25693333qvt.78.1592927970138; 
 Tue, 23 Jun 2020 08:59:30 -0700 (PDT)
Received: from localhost ([166.137.96.174])
 by smtp.gmail.com with ESMTPSA id r185sm894065qkb.39.2020.06.23.08.59.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Jun 2020 08:59:29 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 08/17] drm/i915: Clean up intel_hdcp_disable
Date: Tue, 23 Jun 2020 11:58:58 -0400
Message-Id: <20200623155907.22961-9-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623155907.22961-1-sean@poorly.run>
References: <20200623155907.22961-1-sean@poorly.run>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Add an out label and un-indent hdcp disable in preparation for
hdcp_mutex. No functional changes

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200429195502.39919-9-sean@poorly.run #v6

Changes in v7:
-Split into separate patch (Ramalingam)
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 62cab3aea745..16bf0fbe5f17 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -2113,16 +2113,17 @@ int intel_hdcp_disable(struct intel_connector *connector)
 
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
