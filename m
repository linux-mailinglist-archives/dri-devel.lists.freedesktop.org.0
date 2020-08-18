Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A98248FDD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 23:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F6056E169;
	Tue, 18 Aug 2020 21:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6366E159
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 21:05:22 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id g26so19707841qka.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pgIQz+io6y85AU6XwSiQ95BElGtl4jKiBH0m3yWVK7I=;
 b=YUMGNan5nPR2DLvOcTa71WpfThiudTPT7p8sa3VSdOP0BLSl84VI5yluoPOxtDMq3u
 cnhiBtr20lNp/K9NYU7MbZIJhXWZYFoKv0zmydTkcStkHqazxSfJ4xgM9T6k0qT0E0qq
 dZI0q9AIZZP7DrkIwWqHeWnx1vluPGuP+SMkFfk0PXcZ0vVZgRWdttFyDgSwAnVw+yO/
 Cy9algY987q7wxfgX8FaWgqY/gNMz9lG7UuAknS5Wzg3QmFcuN2UfhpV+RkRq1a81Jhc
 glHQZLaVAhy4ol5bIrnrjJGo1S1HKWKbJUU+GlRH3+BNMAz+KN+SoX97d1fmK+MckOEI
 93Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pgIQz+io6y85AU6XwSiQ95BElGtl4jKiBH0m3yWVK7I=;
 b=Sifp6q/gVXoifm5402fxUAM8XbY9nG8YFtBMqn6rRXhJ9DouVyyCOdbGDSqR2a6T4n
 Ffl+RHwCLeZ9qzJ6M17b9Bd7vI7+WgKSOj3JGZbWtuZiBKFs7d2TfC3b8rnhhNZAkuhq
 7TmYu5XPEhM9qKsMWu2ALP/McmuA5vemsXc/aP0L2RHxnPF4SR55GgBYUaNvWZKVpboq
 ZIkwweyKFh9PgdU2UUn3JMQ1RGYM+juf2IvvOcxuni/Fg6J/VqJsRYMFUzbqlUBlVf5d
 8d8SYpfFztqgLTsR7U7kNdWckD/mjrTPQBZCAhE0V9HVmBL2M+wQKhkxf9DprJGKWUCn
 Z+Qg==
X-Gm-Message-State: AOAM531IG/V97mc73jVQH3BfQA6s6I//zafqVo9pYxetfmppt9g6Aw89
 Sy91J0HNk32h4CcuK+uV0DYd60B3E/40Ng==
X-Google-Smtp-Source: ABdhPJy/7dhSn3hxg5B6eAKjUIbx9BWGbYr8DysGpOnNZe+w8wxHTCIfMRdEjULAU3104YiKqX0upw==
X-Received: by 2002:a05:620a:1436:: with SMTP id
 k22mr18395717qkj.308.1597784721670; 
 Tue, 18 Aug 2020 14:05:21 -0700 (PDT)
Received: from localhost (mobile-166-177-184-140.mycingular.net.
 [166.177.184.140])
 by smtp.gmail.com with ESMTPSA id d20sm21473937qkk.84.2020.08.18.14.05.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Aug 2020 14:05:21 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 seanpaul@chromium.org, airlied@linux.ie
Subject: [PATCH v6 03/14] drm/i915/utils: Replace dev_printk with drm helpers
Date: Tue, 18 Aug 2020 17:04:59 -0400
Message-Id: <20200818210510.49730-4-sean@poorly.run>
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

Use drm logging helpers to add support for the upcoming tracefs
implementation.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-4-sean@poorly.run #v5

Changes in v5:
-Added to the set
Changes in v6:
-None
---
 drivers/gpu/drm/i915/i915_utils.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_utils.c b/drivers/gpu/drm/i915/i915_utils.c
index 4c305d838016..f16a75b165a3 100644
--- a/drivers/gpu/drm/i915/i915_utils.c
+++ b/drivers/gpu/drm/i915/i915_utils.c
@@ -30,10 +30,9 @@ __i915_printk(struct drm_i915_private *dev_priv, const char *level,
 	vaf.va = &args;
 
 	if (is_error)
-		dev_printk(level, kdev, "%pV", &vaf);
+		drm_dev_printk(kdev, level, "%pV", &vaf);
 	else
-		dev_printk(level, kdev, "[" DRM_NAME ":%ps] %pV",
-			   __builtin_return_address(0), &vaf);
+		drm_err(&dev_priv->drm, "%pV", &vaf);
 
 	va_end(args);
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
