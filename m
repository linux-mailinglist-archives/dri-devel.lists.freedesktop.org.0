Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD7A1411B2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 20:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115156F8D8;
	Fri, 17 Jan 2020 19:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75EF6F8D4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 19:31:08 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id l14so14845276ywj.9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 11:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cE4plDgeOaA1EdeFDIGVj5csFXNHOxdShFqwh4J/5Fc=;
 b=WMXiEassOBYE9KIMY/hA/5Xm4kX4pFBtFP7Z/WC/qytrK3VWYV6QLb6qPBt85nU6pQ
 4aHo8J9IGB5Z9YW8ufzzu6RJ3j/NsQYm2ey9FWG6f1ynRtE9dbhQX3oUp7RAdSojRcyY
 f70uVgeKR/BJIzePGP8lT+0813UGeIqYy67Kj/EW49nA70AMFdwcCd4599UJrV65vr8m
 fA1b8luLcrRpZ6GvOF1x0ZswYtFRW0mPydDWrx42z2yij5f9NZvclMs2rDErAlsZj6zY
 ZusZHmQ+uzS1/Q1p/QlwBRRikMZCAwsG1auEnnd8p9+TqoTlodPrPQuhlICStQNIMtdn
 +1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cE4plDgeOaA1EdeFDIGVj5csFXNHOxdShFqwh4J/5Fc=;
 b=lzG/0GBNI9UcqruHS6XVLslqkCqGIynXUXCE8+co+WQEUkamNRzJBNnijHKSjUsRgx
 9W8hfgcqSCiZoC5I5hU8L/h3wF/7DsrsZ068bYcgxuVauju978zd52xKtfMgkFeM6h+k
 uoc3h+Kq3mO/RmSEPdZ7HM733virJpEjSZq+iRm2Occ6c7alb0QlpUYZ1NN15PeGf7Pb
 NWI4vOr3ZpmfYhQWaekTkLQTzvByRiC9LGb+aTOo2ZVfCnncwmyrPehgm4CWblD1T+MY
 cerZNvnu8pyR6Qqy5OsIQuPAgSdmpux5JVRq+7lBfCWywr5nJo/lhBCvy1YO79/yqKnf
 bMSg==
X-Gm-Message-State: APjAAAXMz2baP84HKMOFO/vRv4f1fVFZx+MK+rKQdN8+NuGm5T0g6AOL
 Dw+WWdJkJyPCsqy+HqRqJMCsyE3ytGF2Tg==
X-Google-Smtp-Source: APXvYqyckStytURl9B6tgOLARMKeyE9aLWO+1WYovvHBWnXcs94qq1uKa+LYIGFqlTUz76q5Qn6pxg==
X-Received: by 2002:a81:7a43:: with SMTP id v64mr30586336ywc.95.1579289467846; 
 Fri, 17 Jan 2020 11:31:07 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id m16sm11439344ywa.90.2020.01.17.11.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 11:31:07 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 02/12] drm/i915: Clear the repeater bit on HDCP disable
Date: Fri, 17 Jan 2020 14:30:53 -0500
Message-Id: <20200117193103.156821-3-sean@poorly.run>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200117193103.156821-1-sean@poorly.run>
References: <20200117193103.156821-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch, rodrigo.vivi@intel.com,
 Sean Paul <seanpaul@chromium.org>, stable@vger.kernel.org
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

Changes in v2:
-Added to the set
Changes in v3:
-None
  I had previously agreed that clearing the rep_ctl bits on enable would
  also be a good idea. However when I committed that idea to code, it
  didn't look right. So let's rely on enables and disables being paired
  and everything outside of that will be considered a bug
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index eaab9008feef..c4394c8e10eb 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -773,6 +773,7 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
 	struct intel_digital_port *intel_dig_port = conn_to_dig_port(connector);
 	enum port port = intel_dig_port->base.port;
 	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
+	u32 repeater_ctl;
 	int ret;
 
 	DRM_DEBUG_KMS("[%s:%d] HDCP is being disabled...\n",
@@ -787,6 +788,10 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
 		return -ETIMEDOUT;
 	}
 
+	repeater_ctl = intel_hdcp_get_repeater_ctl(dev_priv, cpu_transcoder,
+						   port);
+	I915_WRITE(HDCP_REP_CTL, I915_READ(HDCP_REP_CTL) & ~repeater_ctl);
+
 	ret = hdcp->shim->toggle_signalling(intel_dig_port, false);
 	if (ret) {
 		DRM_ERROR("Failed to disable HDCP signalling\n");
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
