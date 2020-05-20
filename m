Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DCB1DBE43
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 21:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DBC89C98;
	Wed, 20 May 2020 19:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5CC89C86
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 19:47:51 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id p4so1940775qvr.10
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 12:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=mpTmYaLtBWGjoVuR6nTgbHoI9VJvsp2OI4i6YxeEkIo=;
 b=JitvZelNIV6pPj+Udr6dZrQVDcev5EE8tiHE0UHm3bWligE4vUE8gG9/GpYLRzx9tH
 7TlTpintRL8/5CKxjzIOP4T6m45ygoSclPYirPp8xSC3WTi5Fj9IX9QBS4Jm3zhFUE1A
 UJognTMgYpsUv3Q9pskY7QfoCOXSWDF+QeQTmleyb+b/6mvwAG3DFQ/ogFxt5YLuVP9A
 0JxKrc2QNXjHkypH79cXF6cWtcNoGuwDjHPcY2ZtOfkNt6QQyTaMZiVMJAnCYoedWE1g
 H0u6iFxQ5E44ZbfJn8LLISvvmwTIcZImNIM1YUBfA4WRTjyaZU3hrnBL/uCRf2ByGJHU
 0DZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mpTmYaLtBWGjoVuR6nTgbHoI9VJvsp2OI4i6YxeEkIo=;
 b=fN85/U5EFumyfb/Rj4cyXWfUy6Q2eoWRN5Ucpd2IAiOBQEIrgzgT5TmI+yuftkButA
 1ZIhFLPQxVSVloT9AnUi3pabQ073WC1koWAr/vRxHVr8gkMpLYwpnL74uiyB9sxsygaM
 tllzVcggIJsvNIEdVL9cw2/h0Ufnaz43okkR22PY+9YiTP10XrfFj+FZhXmsuViN/j7K
 KP/u7oybsV3slhFWGBueWxYqnbtiQzH8cB+zxanWSh1i4+amraYirhnCSpvehs7NWRHN
 Z6+kqsmfZIu5GyyIxDPB46OZ0weDL1pz2vkatq+Zm/GSGFawqztvDljXn9bK2QpWijwc
 Kwgw==
X-Gm-Message-State: AOAM532UAg4KmkRe4KdsCib3VQ9uJXzjPi2pW5Wd5F2U+vA3lzvONXnL
 T3QXEV10yQv4jeymv9dkh7Wi6lYgqfc=
X-Google-Smtp-Source: ABdhPJwlSDmgwzKN0IIexj/FaHyA5YRcxC74WJ5M7iv1fwTJ0nriHlS+KCg+OkUL0/5UBIcADdSF/g==
X-Received: by 2002:ad4:4b26:: with SMTP id s6mr6627217qvw.146.1590004070868; 
 Wed, 20 May 2020 12:47:50 -0700 (PDT)
Received: from localhost (mobile-166-177-187-115.mycingular.net.
 [166.177.187.115])
 by smtp.gmail.com with ESMTPSA id g3sm3063163qtu.90.2020.05.20.12.47.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 20 May 2020 12:47:50 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/hdcp: Avoid duplicate HDCP enables
Date: Wed, 20 May 2020 15:47:44 -0400
Message-Id: <20200520194744.48936-1-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
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
Cc: seanpaul@chromium.org, rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

If userspace sets the CP property to DESIRED while it's already ENABLED,
the driver will try to re-enable HDCP. On some displays, this will
result in R0' mismatches. I'm guessing this is because the display is
still sending back Ri instead of re-authenticating.

At any rate, we can fix this inefficiency easily enough by just nooping
the DESIRED property set if HDCP is already ENABLED.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---

I suspect this is the actual root cause I was chasing with
"drm/i915/hdcp: Add additional R0' wait". I was able to reproduce the
R0` messages by marking HDCP desired while it was already enabled. This
_should_ work, but it seems like some displays handle it more graciously
than others.


 drivers/gpu/drm/i915/display/intel_hdcp.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 2cbc4619b4ce..f770fe0c5595 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -2156,12 +2156,16 @@ void intel_hdcp_atomic_check(struct drm_connector *connector,
 	}
 
 	/*
-	 * Nothing to do if the state didn't change, or HDCP was activated since
-	 * the last commit. And also no change in hdcp content type.
+	 * Nothing to do if content type is unchanged and one of:
+	 *  - state didn't change
+	 *  - HDCP was activated since the last commit
+	 *  - attempting to set to desired while already enabled
 	 */
 	if (old_cp == new_cp ||
 	    (old_cp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
-	     new_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED)) {
+	     new_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED) ||
+	    (old_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
+	     new_cp == DRM_MODE_CONTENT_PROTECTION_DESIRED)) {
 		if (old_state->hdcp_content_type ==
 				new_state->hdcp_content_type)
 			return;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
