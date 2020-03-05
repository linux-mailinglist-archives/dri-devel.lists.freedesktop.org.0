Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D040817AF76
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 21:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7E96EC17;
	Thu,  5 Mar 2020 20:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE8D6EC10
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 20:12:41 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id t192so6879680ywe.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 12:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EZBU9lNaaKWJIFCfIMlE6F5L+6SWhe44fgINKq+20lU=;
 b=PEU0cdtDAyE63dYwom18/q/fwtmGA9ETIJ0oP8JikqO9fn1wFGq74y6UUN58H/nVtb
 +z8CSAKdzsHVseCf4FvYGM7ckS1uvD/cdFpwoMHNOPJUGwh2q3K0tzShWItzUFkIo2KE
 Rhrw3hyxcugo7e27s7UEuZ3qSWi9OG5lXM5DPZBk5TmOTAQyA0mIYIOD/h56QU92R+hI
 +CyVLwDFusstTR1f5JLbWRr3GHmcYfXBnO9S3In0SiN0uiwhaG1GLCejBk51d/CAMukN
 CjpSpv/z7ezTVXHlBL2UPZLPvohvmXpySIGXa5d/+ax5JGe3rQ4wzwOlHE7nNWY6f6Mx
 j8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EZBU9lNaaKWJIFCfIMlE6F5L+6SWhe44fgINKq+20lU=;
 b=h7RPg/h2wsoGGx7+D5lUWjD5nujYAKXHS9PynK2V4m+oBr2Xtio2OcfBy+vxWO5ETJ
 00721nVNp4afdr4gKHurRh3MUg/3LXOPO0EyXfFnqpgkfCJvK8rTsEsixSiXhksw398J
 pqH9xdwv68R+14G5XcnpZEIEYSPwNWlQDUIahN+fGGQvrCDkOZAPOZCM3zOyRn615FQM
 1cEZqbCVRUNPXo9khtGK6F6PHoZHAaXVsDyLemEtqsmtc4O3dGoix1PJk1wMfR+3tEeM
 kEQde3bYWNJ5dDoXLEJogA1hD8hAZau/C/9kseIIEbcmgeslwROsWts4niJInltyIbDL
 CeAQ==
X-Gm-Message-State: ANhLgQ340A30iTws57BGJYHk48nwOBxzzgz84fL6xp4siYkogo6BchN/
 KarJqLN5oABW2hcvaBzzR9zzFrRfhO4=
X-Google-Smtp-Source: ADFU+vumRJx+hQFYjxZ5VbMX5PZgjLdnEl4dRwuIP5dFlmQnaoFwapOGtkGMpZsvloq4uuvkKcdS4A==
X-Received: by 2002:a0d:d757:: with SMTP id z84mr84657ywd.273.1583439160155;
 Thu, 05 Mar 2020 12:12:40 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id j142sm8314972ywg.87.2020.03.05.12.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 12:12:39 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 02/16] drm/i915: Clear the repeater bit on HDCP disable
Date: Thu,  5 Mar 2020 15:12:22 -0500
Message-Id: <20200305201236.152307-3-sean@poorly.run>
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
 juston.li@intel.com, rodrigo.vivi@intel.com, stable@vger.kernel.org
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
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index defa8654e7ac5..553f5ff617a15 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -797,6 +797,7 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	enum port port = intel_dig_port->base.port;
 	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
+	u32 repeater_ctl;
 	int ret;
 
 	drm_dbg_kms(&dev_priv->drm, "[%s:%d] HDCP is being disabled...\n",
@@ -812,6 +813,11 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
 		return -ETIMEDOUT;
 	}
 
+	repeater_ctl = intel_hdcp_get_repeater_ctl(dev_priv, cpu_transcoder,
+						   port);
+	intel_de_write(dev_priv, HDCP_REP_CTL,
+		       intel_de_read(dev_priv, HDCP_REP_CTL) & ~repeater_ctl);
+
 	ret = hdcp->shim->toggle_signalling(intel_dig_port, false);
 	if (ret) {
 		drm_err(&dev_priv->drm, "Failed to disable HDCP signalling\n");
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
