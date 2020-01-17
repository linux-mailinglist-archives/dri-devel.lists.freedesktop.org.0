Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9691411B5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 20:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5BB86F8D7;
	Fri, 17 Jan 2020 19:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9D56F8D7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 19:31:07 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id w9so6086730ybs.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 11:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xPTHjBNu4VtrBqVG645UC3saugAIeeYvWqQHdj1RQv8=;
 b=WRgjs5pj49zUBNIMSyXl9tVuSN+7o7BgdpC354+E4WQJ4t0c57InPhpTyGs+b328QZ
 Vg3jjzAf8GF+ofEYo98E2EIsEvyPvSWuI5YoaqR5beXC/RTRXLV6igIYxCSl62hul/z5
 6u+w2DtPKhGpxmCAm9U5V3WLQNkL9A9qHNhDGEIWs8O1wwRM7+/OdMZC3I+B/zZXY1oW
 8BdvohDH2uYzNlEdb0GVHKb/kpeGPrL7GMrqkFuOVU14VlYWx7ZJVWdGWLEJGFPDLXtR
 x4bTx6ayuZK0SBw6xjYAsN4WCHoOyuo8VhO7b9tGloc/Zjo78kFW4MyRjENWeWn1gSLa
 BGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xPTHjBNu4VtrBqVG645UC3saugAIeeYvWqQHdj1RQv8=;
 b=PQhEtWnR1r5zCHPbcUbTzTtyp8r1k2ncPtSUL3GG4zbYHCT1uZ7jo/cQAi7Rr8o4ny
 61Z4IE5r+meGm2Uw5XDH/wd3a3unBxSuXAjo8yEDc8t4iHmH+y4sT7O+HYnTx7DcsGah
 N8wVSo4wQb/HwikIkVr4z/+QhCyQFzKUmbCDiqeEBf1puGWJVZNxzfcyWBktzVx/lrRA
 HAGMM+o/9KJXmH6E+h34LAAaO7j3tS4w1NA5Opl0naDmqCvjSiGbwYaLHeqwl8y1S0i+
 aubuWHn8gNdxOQAZhZZjBvSrLHu4Ut59F1b9faOdPUnVHf0LfvoCtxyHXlqRrF+ahpao
 4QoQ==
X-Gm-Message-State: APjAAAVY9fQm67xAYYfWq/n8l70zKdGhIhzRSpcjlLCdVpTxSKi9grTP
 fzIVK2ZcAGdKCA01RNRwzXPz0XhgxMicRQ==
X-Google-Smtp-Source: APXvYqzRVcaz7/l6y+QVAuOboyL2N4672gbqDsMbqJqbM3Q9ACDCJQK4eEiJt8ttUqC0oI1W1+3omw==
X-Received: by 2002:a25:a444:: with SMTP id f62mr26316922ybi.235.1579289466659; 
 Fri, 17 Jan 2020 11:31:06 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id h193sm11418485ywc.88.2020.01.17.11.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 11:31:06 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 01/12] drm/i915: Fix sha_text population code
Date: Fri, 17 Jan 2020 14:30:52 -0500
Message-Id: <20200117193103.156821-2-sean@poorly.run>
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

This patch fixes a few bugs:

1- We weren't taking into account sha_leftovers when adding multiple
   ksvs to sha_text. As such, we were or'ing the end of ksv[j - 1] with
   the beginning of ksv[j]

2- In the sha_leftovers == 2 and sha_leftovers == 3 case, bstatus was
   being placed on the wrong half of sha_text, overlapping the leftover
   ksv value

3- In the sha_leftovers == 2 case, we need to manually terminate the
   byte stream with 0x80 since the hardware doesn't have enough room to
   add it after writing M0

The upside is that all of the HDCP supported HDMI repeaters I could
find on Amazon just strip HDCP anyways, so it turns out to be _really_
hard to hit any of these cases without an MST hub, which is not (yet)
supported. Oh, and the sha_leftovers == 1 case works perfectly!

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
Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-2-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20191212190230.188505-2-sean@poorly.run #v2

Changes in v2:
-None
Changes in v3:
-None
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 25 +++++++++++++++++------
 include/drm/drm_hdcp.h                    |  3 +++
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 0fdbd39f6641..eaab9008feef 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -335,8 +335,10 @@ int intel_hdcp_validate_v_prime(struct intel_connector *connector,
 
 		/* Fill up the empty slots in sha_text and write it out */
 		sha_empty = sizeof(sha_text) - sha_leftovers;
-		for (j = 0; j < sha_empty; j++)
-			sha_text |= ksv[j] << ((sizeof(sha_text) - j - 1) * 8);
+		for (j = 0; j < sha_empty; j++) {
+			u8 off = ((sizeof(sha_text) - j - 1 - sha_leftovers) * 8);
+			sha_text |= ksv[j] << off;
+		}
 
 		ret = intel_write_sha_text(dev_priv, sha_text);
 		if (ret < 0)
@@ -426,7 +428,7 @@ int intel_hdcp_validate_v_prime(struct intel_connector *connector,
 	} else if (sha_leftovers == 2) {
 		/* Write 32 bits of text */
 		I915_WRITE(HDCP_REP_CTL, rep_ctl | HDCP_SHA1_TEXT_32);
-		sha_text |= bstatus[0] << 24 | bstatus[1] << 16;
+		sha_text |= bstatus[0] << 8 | bstatus[1];
 		ret = intel_write_sha_text(dev_priv, sha_text);
 		if (ret < 0)
 			return ret;
@@ -440,16 +442,27 @@ int intel_hdcp_validate_v_prime(struct intel_connector *connector,
 				return ret;
 			sha_idx += sizeof(sha_text);
 		}
+
+		/*
+		 * Terminate the SHA-1 stream by hand. For the other leftover
+		 * cases this is appended by the hardware.
+		 */
+		I915_WRITE(HDCP_REP_CTL, rep_ctl | HDCP_SHA1_TEXT_32);
+		sha_text = DRM_HDCP_SHA1_TERMINATOR << 24;
+		ret = intel_write_sha_text(dev_priv, sha_text);
+		if (ret < 0)
+			return ret;
+		sha_idx += sizeof(sha_text);
 	} else if (sha_leftovers == 3) {
-		/* Write 32 bits of text */
+		/* Write 32 bits of text (filled from LSB) */
 		I915_WRITE(HDCP_REP_CTL, rep_ctl | HDCP_SHA1_TEXT_32);
-		sha_text |= bstatus[0] << 24;
+		sha_text |= bstatus[0];
 		ret = intel_write_sha_text(dev_priv, sha_text);
 		if (ret < 0)
 			return ret;
 		sha_idx += sizeof(sha_text);
 
-		/* Write 8 bits of text, 24 bits of M0 */
+		/* Write 8 bits of text (filled from LSB), 24 bits of M0 */
 		I915_WRITE(HDCP_REP_CTL, rep_ctl | HDCP_SHA1_TEXT_8);
 		ret = intel_write_sha_text(dev_priv, bstatus[1]);
 		if (ret < 0)
diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
index 06a11202a097..20498c822204 100644
--- a/include/drm/drm_hdcp.h
+++ b/include/drm/drm_hdcp.h
@@ -29,6 +29,9 @@
 /* Slave address for the HDCP registers in the receiver */
 #define DRM_HDCP_DDC_ADDR			0x3A
 
+/* Value to use at the end of the SHA-1 bytestream used for repeaters */
+#define DRM_HDCP_SHA1_TERMINATOR		0x80
+
 /* HDCP register offsets for HDMI/DVI devices */
 #define DRM_HDCP_DDC_BKSV			0x00
 #define DRM_HDCP_DDC_RI_PRIME			0x08
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
