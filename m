Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5583A248A0F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 17:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBF289DA3;
	Tue, 18 Aug 2020 15:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0930189DA3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 15:39:36 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id 77so18627744qkm.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 08:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=d1D5o/i++O2dx3r2jrsCjyH48f0K/OvhWUAjvxwi7TA=;
 b=fJExf3k/eUOryvMwUDNci2WzXlvZY1vgpRFMmadp0eQxHC5ayVluggEEZRAcgZ2L8d
 MQMVpVo2o3341cs9QtA8xN7YV1IvfKksh/jMzoKAoTpr7qU7r1Nieqsa3RDCzGTKj85j
 xFRSkPfDZAznDZ9OqEkC6VblHnyfSFvq6hxDkpJnfflbEZdy0/NFf+h353QJB8iKm9Vg
 yr5Uf/u1FNbwl98BV9hp3lRAQLB41agh3WEcUkp5p4Eur3q/WLXYjSwY3Yw0hRwJVE9f
 ImnP3KM3C3ubNNsP+BGf+383MHN7Pvc0gjZ0AnWf6Cq8MTOY1dE9hMkiO6Eor3gCAGKe
 igIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=d1D5o/i++O2dx3r2jrsCjyH48f0K/OvhWUAjvxwi7TA=;
 b=mnmmFmPKVD1iOIMgBHA9J81T7SFdH/F9FdL7N/4jKb4hedPUjJAay4F4t7/cPjX24a
 ATF6UXgayS7kfw19aAzuCspfcUjOBUUuckJDgQycT4rgig/J6SYh6F/tNJxRpZytmW2Z
 kwVqsknLYp+JOyb1AEaUvkEae0VwOA3xMNuTvSA1JcCKc3UXFgRsvEjQvSa0krMQ9isn
 hKFoq4LLWwgOK70+p7xykPRrGPAul7O8WsZF2TDBNMnTjr7nOnru8c1yy/1aK/3UkIM5
 Pf1Yoft6GG7QC+mP7d8PdxsiUWC3pZFSbCOKlewFCx2jwlUcePeHfKkWRgueGOyJhViJ
 DecA==
X-Gm-Message-State: AOAM532L+kribEgKtChI4NBFqwj3V5eMoEIN7HF/vQStWW+PWY9peLIV
 zIYBoxudKKONKvJRKq3O2gQBcYjuxKMh0A==
X-Google-Smtp-Source: ABdhPJwQ47iPDVkmbwQrOI2scwtQvNd3mCOXPsjUxsngNOuNliDEgljntmpvaIsz/h/ynurJrJH5gg==
X-Received: by 2002:a05:620a:16c8:: with SMTP id
 a8mr17926022qkn.81.1597765175049; 
 Tue, 18 Aug 2020 08:39:35 -0700 (PDT)
Received: from localhost (mobile-166-170-57-144.mycingular.net.
 [166.170.57.144])
 by smtp.gmail.com with ESMTPSA id d26sm24891349qtc.51.2020.08.18.08.39.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Aug 2020 08:39:34 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 juston.li@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 anshuman.gupta@intel.com
Subject: [PATCH v8 02/17] drm/i915: Clear the repeater bit on HDCP disable
Date: Tue, 18 Aug 2020 11:38:50 -0400
Message-Id: <20200818153910.27894-3-sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, stable@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Sean Paul <seanpaul@chromium.org>,
 daniel.vetter@ffwll.ch, Ramalingam C <ramalingm.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

On HDCP disable, clear the repeater bit. This ensures if we connect a
non-repeater sink after a repeater, the bit is in the state we expect.

Fixes: ee5e5e7a5e0f (drm/i915: Add HDCP framework + base implementation)
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Ramalingam C <ramalingam.c@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.17+
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20191212190230.188505-3-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20200117193103.156821-3-sean@poorly.run #v3
Link: https://patchwork.freedesktop.org/patch/msgid/20200218220242.107265-3-sean@poorly.run #v4
Link: https://patchwork.freedesktop.org/patch/msgid/20200305201236.152307-3-sean@poorly.run #v5
Link: https://patchwork.freedesktop.org/patch/msgid/20200429195502.39919-3-sean@poorly.run #v6
Link: https://patchwork.freedesktop.org/patch/msgid/20200623155907.22961-3-sean@poorly.run #v7

Changes in v2:
-Added to the set
Changes in v3:
-None
  I had previously agreed that clearing the rep_ctl bits on enable would
  also be a good idea. However when I committed that idea to code, it
  didn't look right. So let's rely on enables and disables being paired
  and everything outside of that will be considered a bug
Changes in v4:
-s/I915_(READ|WRITE)/intel_de_(read|write)/
Changes in v5:
-None
Changes in v6:
-None
Changes in v7:
-None
Changes in v8:
-None
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 6189b7583277..1a0d49af2a08 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -795,6 +795,7 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	enum port port = dig_port->base.port;
 	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
+	u32 repeater_ctl;
 	int ret;
 
 	drm_dbg_kms(&dev_priv->drm, "[%s:%d] HDCP is being disabled...\n",
@@ -810,6 +811,11 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
 		return -ETIMEDOUT;
 	}
 
+	repeater_ctl = intel_hdcp_get_repeater_ctl(dev_priv, cpu_transcoder,
+						   port);
+	intel_de_write(dev_priv, HDCP_REP_CTL,
+		       intel_de_read(dev_priv, HDCP_REP_CTL) & ~repeater_ctl);
+
 	ret = hdcp->shim->toggle_signalling(dig_port, false);
 	if (ret) {
 		drm_err(&dev_priv->drm, "Failed to disable HDCP signalling\n");
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
