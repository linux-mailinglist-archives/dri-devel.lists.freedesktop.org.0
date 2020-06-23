Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21164205687
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 17:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9546E9D9;
	Tue, 23 Jun 2020 15:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275A66E9D1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 15:59:19 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id h23so8649288qtr.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 08:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hPXrMMByCWFAX4dr17N0gwG7cbpIr/xu4CnGBcMvPTM=;
 b=Fgg+4sE2s/DGUQkVwT/mKk6mYL71L7M/7zgdKJhLgu7nvVnkgVtTdaWz5+ASY7f1x9
 607Eru5F150hws5CKGIea3E7JRbJn4yRSJGVj2JEE/IYMWIfhl1dgCPHKydDxCQrxaTL
 nICXXMV1LlL1BePG+y+6naw0q1xXzjsTwGtHFfJFfQ/BatQJKztT4aN+bLk+uhLJUoVG
 c+trHzoKJJvmfq34qRILDd5iQ3koHUnGMf/5GYP8kh7svIcdySs6tMG21haWvFblb3z2
 HsaaafvaVkLO41DnA6Lyw7X11O1VpP3sIeV2Akivd8tVom3xkbNut0wVGF0WhQoRxSej
 OwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hPXrMMByCWFAX4dr17N0gwG7cbpIr/xu4CnGBcMvPTM=;
 b=uJJOnIXnZeahXMFmwn3KjKuGyFA3xvO/gKJfWWUwh9vDRYggL/mMNzEKxpa8QD1jbK
 m3qPiSEjMdxPn8iH5pS7ZEzSRBT8eiUJtKfNHlpnxU/xB7VT9OZCGQYLwr44zd5BxAye
 3H5/hCM8Pkpghiv3DQwy/Cm2dn3NxOMs57Ep4dNCzPeheGwxjqzRm5Xzyts1ne4sgg4f
 hiBe1EWVXDHl7C8Mu5DoEay5EWfRCf5DjK3eadfgFElmK2r3yl5ao9R1ClXK7Vbe35G+
 jLUwfEMLeO9N90uoWw1iuifTLzFUg1tIbE0A8cZ5ArINeIhq/eEtilgIFa+VWqPTPNnB
 t0Ew==
X-Gm-Message-State: AOAM532taF72EroTIboK9BSHktYTHBcDH1CuHqbf+wVhemDJEZmImn+Q
 jCMhGXV/IROrX9j/53aB19fMmMdbUno=
X-Google-Smtp-Source: ABdhPJwDzGXD4Tj1ITeOHNjbd9Q27WHo/tk3fXxGDgHKrDKa4BnYt7SYh3CT/GmucosBLRNiwhz5RA==
X-Received: by 2002:ac8:348f:: with SMTP id w15mr11961571qtb.79.1592927958145; 
 Tue, 23 Jun 2020 08:59:18 -0700 (PDT)
Received: from localhost ([166.137.96.174])
 by smtp.gmail.com with ESMTPSA id u128sm915383qkc.84.2020.06.23.08.59.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Jun 2020 08:59:17 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 02/17] drm/i915: Clear the repeater bit on HDCP disable
Date: Tue, 23 Jun 2020 11:58:52 -0400
Message-Id: <20200623155907.22961-3-sean@poorly.run>
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>, daniel.vetter@ffwll.ch,
 Sean Paul <seanpaul@chromium.org>, juston.li@intel.com, rodrigo.vivi@intel.com,
 stable@vger.kernel.org
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
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index f26fee3b4624..9f530b2f3606 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -795,6 +795,7 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	enum port port = intel_dig_port->base.port;
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
 	ret = hdcp->shim->toggle_signalling(intel_dig_port, false);
 	if (ret) {
 		drm_err(&dev_priv->drm, "Failed to disable HDCP signalling\n");
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
