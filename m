Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E28B911D6A4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 20:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90676E11F;
	Thu, 12 Dec 2019 19:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44236E10B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 19:02:37 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id i3so876481ybe.12
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 11:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h0egt0JF3BBaO6WdEMgj9OmFassmcCaVwLOw/Q8+8Ig=;
 b=SHJUYkdQXFIy7lhSOlGEt4N5lRi54RBmiuC1/wvPLbJPQdGP4+0qs0kcR03YfyUDsV
 kvnNq6grLvRnzgt1X0VhyaF2celBuey0NkyLNxLW/7k2uYpp7HMiyvNgfyYnCev/VBwa
 trV6aCHWZhzQVVQXMmG/Ig+nQLmfjtnnlnJ0IU+a90Bfgv2eNcsh1w55Bp5JGFH+Chjr
 L4I2vM8/zrgZ5pqpNZGVy4OGuFvGRPEbN4HoCQc4yT/JbQ8+z9VVnnDQl8LrgpnWwELF
 pZX2tWycjVoOJnafgIyjS3kVHB+esUoA+m7jNBSK1IX5QJSA4l/IgVD+fSdOicdJf87u
 7fXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h0egt0JF3BBaO6WdEMgj9OmFassmcCaVwLOw/Q8+8Ig=;
 b=ZakasSVNUHrHmovO5QIiKvz8fiYc5TefWy8y2BbIoNLPixxuwVpJTdQ5/IwCFB9LKb
 i/Ema58vFVCxGltEmNa7P1Cv9yrI0+CcrZ4bbiDXeH52eHvj+Sol+hQ7hN+DB1nIHjue
 /1R7pBOgzTjAjZ2pZhtfwLHqbglu6pO+A6R3FtkTNlm9urdD+5v6ONjI0caIjvEbwDDf
 zX/AOO9DcG41FQi14zrr5UiOHaxByLGf/x8reqOcCR2w9+x77cj8Wmt2Ga9qHeHU9tpI
 wivNFLTacSus2YuAkvTSDRqHT6K5x1FlP5NTLMztsVxGYDH26Ct6Kan9R5IPn0LEFfco
 4hhw==
X-Gm-Message-State: APjAAAXOow69uHaUmSrj7ixifSlFIz6ffEfQzEYKJ2PqgYhwPEk5NQCk
 LWItkqKQqiBHCI89uLWXWlhOJX/qI2kbvw==
X-Google-Smtp-Source: APXvYqxTLrnFF6DesdMGBQCsHLYXvOIO4H7H7tXnoUlpTgcZRRHBNuvB3iFuGq/JTG5n86eh2+8xgg==
X-Received: by 2002:a25:6385:: with SMTP id x127mr5367068ybb.468.1576177356773; 
 Thu, 12 Dec 2019 11:02:36 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id k23sm538820ywk.17.2019.12.12.11.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 11:02:36 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 02/12] drm/i915: Clear the repeater bit on HDCP disable
Date: Thu, 12 Dec 2019 14:02:20 -0500
Message-Id: <20191212190230.188505-3-sean@poorly.run>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191212190230.188505-1-sean@poorly.run>
References: <20191212190230.188505-1-sean@poorly.run>
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

Fixes: ee5e5e7a5e0f ("drm/i915: Add HDCP framework + base implementation")
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Ramalingam C <ramalingam.c@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.17+
Signed-off-by: Sean Paul <seanpaul@chromium.org>

Changes in v2:
-Added to the set
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
