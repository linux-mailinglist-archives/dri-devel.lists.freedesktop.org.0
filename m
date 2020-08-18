Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE666248FE3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 23:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839536E160;
	Tue, 18 Aug 2020 21:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF566E160
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 21:05:34 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x12so16275820qtp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hGd4aWXfsui6GlGvaQ8Y+ngFXo7KbA+/KXZJ2+0qfkQ=;
 b=Fg3syOngC0WhL1/3cVurqICo1ihaz/AY81Zwb5nvKlGCx6QeyTnJ+JyWZA8vO0+DYY
 W8n8Q2/J9wt1aK7h+k3+XToVK6jx36q+5NfgCOWfb4+ZgBmiv19FAeuiEiimUIFlvna0
 SywoXRXaYiq1saZNysIfROGG2mrfLyRIPxpRAvWgtu9huD285CdmEE2hwoMs1m1ag1Js
 ZhExWatfLrEZOBrCEq+kRvInvx5GE1vQJomYvLTONqpfge400CimF42ZUxeWfWsHtTZR
 VD2znQxmPzwUGKT3KV0AWUBDKPA5zyBf+j566dHzbRcWfMhYKBI2n2cGvjBAqHNAfLdK
 QhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hGd4aWXfsui6GlGvaQ8Y+ngFXo7KbA+/KXZJ2+0qfkQ=;
 b=LBMSdSppGfhSQv1q08uXtaOtuLCl51eSVBLPAS7W3nWbno/8peOjXKbUKHyBy3Royq
 NYmpjA4D69cMrv0oofp7aYto3QggyZDBkGVj63iyOXnpTfkoEicYHJRnht5cjz14W91j
 EHZFR4KhnbjAlHxkTFm2SUuZ6n9j+qFBj5lkHMJGiDtkTWSPm2hriqb/K8gmoiW0GyxT
 7W6noRCMxTRjmno2njVFQsWJsxLTB+nQ4rLj8g+q5tqTIFsCcmgUeXlKGFCOn9es3GBh
 MVx68SbUftjgZieEHM19YYug0uDF2FL+OyCZm+eW9inmP6/O31kJ9fGRSeGCHYJ/ed4T
 0hfQ==
X-Gm-Message-State: AOAM533F5o8YamHMO8FTbQQkU8bjAViObJ+neRzirpUqAu5LJ0HxOP8P
 Mfiq3Cz7KRAl7P3Appg6YlMI2zGtXextJw==
X-Google-Smtp-Source: ABdhPJyDNfsVTu9tBQdql8vBUU/atK304YCY37Ukac/1aFKt92ApZE6UjPUg6gw3v4wptWmbsp/cAg==
X-Received: by 2002:ac8:4f4b:: with SMTP id i11mr19238951qtw.379.1597784733310; 
 Tue, 18 Aug 2020 14:05:33 -0700 (PDT)
Received: from localhost (mobile-166-177-184-140.mycingular.net.
 [166.177.184.140])
 by smtp.gmail.com with ESMTPSA id k48sm27005393qtk.44.2020.08.18.14.05.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Aug 2020 14:05:32 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 seanpaul@chromium.org, airlied@linux.ie
Subject: [PATCH v6 09/14] drm/i915: Change infoframe debug checks to specify
 syslog
Date: Tue, 18 Aug 2020 17:05:05 -0400
Message-Id: <20200818210510.49730-10-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818210510.49730-1-sean@poorly.run>
References: <20200818210510.49730-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Since the logs protected by these checks specifically target syslog,
use the new drm_debug_syslog_enabled() call to avoid triggering
these prints when only trace is enabled.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-10-sean@poorly.run #v5

Changes in v5:
-Added to the set
Changes in v6:
-None
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 2ddabf92adde..30dcc8a2daa7 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -12908,7 +12908,7 @@ static void
 intel_dump_infoframe(struct drm_i915_private *dev_priv,
 		     const union hdmi_infoframe *frame)
 {
-	if (!drm_debug_enabled(DRM_UT_KMS))
+	if (!drm_debug_syslog_enabled(DRM_UT_KMS))
 		return;
 
 	hdmi_infoframe_log(KERN_DEBUG, dev_priv->drm.dev, frame);
@@ -13551,7 +13551,7 @@ pipe_config_infoframe_mismatch(struct drm_i915_private *dev_priv,
 			       const union hdmi_infoframe *b)
 {
 	if (fastset) {
-		if (!drm_debug_enabled(DRM_UT_KMS))
+		if (!drm_debug_syslog_enabled(DRM_UT_KMS))
 			return;
 
 		drm_dbg_kms(&dev_priv->drm,
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
