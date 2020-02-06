Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD87153FF5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C53D6FA11;
	Thu,  6 Feb 2020 08:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9326E48C;
 Thu,  6 Feb 2020 08:00:40 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t3so5913491wru.7;
 Thu, 06 Feb 2020 00:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XtslodQDEgXVqwkRyzhRJwkNpBKdcN9adctiuwwsFK8=;
 b=L2eh/AIBOBoKs36wZcHz11fiAzDq43Pw5ipKiDecgQk0nUl4LJXxiJgW5Th9GcN8Q/
 Fwcv7yWWB4izr5HU6W8vJUxyq2v7Xj3m18/0FOyFe4WrqdfWt8dUTV89zVEbNqvfuhrQ
 E/XftoPiQIoPbwAnxtxs5rMoriBakauNmguh++s7rzxpXXwyCVfgZshsET0r13cEyYSQ
 EOGm1MRdILvq9vTNbRIYPNukonPHKmnDUTGi93SdDze7E7vrWj2hj6lBPayvRf47N9Rz
 9Zm3b7jagJvKZ2h5bI+HwhOqIx7pHEo4HULiOgd0dAF2kkXT94gt11ZKpAZWdezeQ7os
 wEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XtslodQDEgXVqwkRyzhRJwkNpBKdcN9adctiuwwsFK8=;
 b=M70/qm5TXE5jFJgXGuigyr87l3Fgz613csbZv31FFwezSG1JQUilFjjG4MtC/B3iM+
 NlKeV4hvPU59KWTKaXaViMCcK+s2ubxSRTABHeAidlWMH8O40RqE5qtbycN1CBIlmPhj
 B/QOCqvmP0/rCMFxmOiUJ+FP/cyBLf77Z7YwVMUa3u52Vs7FPhca5bPpoVtAywqddkNd
 IWfi8eyaQcjyghPPXOQ3FJaXfWFgJ78EccWyFKwBIHCIt/tkR3PN5b6QcqHvHDzvrtCF
 VOqrQrIduk9q9SiKmWYj96DRCWCChUGObh6QauI/8kVAIs37ndqPy6tYoA9J/X1q16so
 SWYg==
X-Gm-Message-State: APjAAAUwVMaB8VHmyZZAD6XxqW3FZ733k9tYj812Cf5q35HcqxXMvAlg
 djWe8VwXOSTWb8fCR7POC0A=
X-Google-Smtp-Source: APXvYqwDE7CXTSG41Mvy/SDmIG5GoVxXXbsRfzAgT7Ei4QFwQqUh8jZSYyR6y3F/XUt/gspchMN/LQ==
X-Received: by 2002:adf:ea0f:: with SMTP id q15mr2360719wrm.356.1580976039303; 
 Thu, 06 Feb 2020 00:00:39 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id u8sm2635132wmm.15.2020.02.06.00.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 00:00:38 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 04/12] drm/i915/color: conversion to drm_device based
 logging macros.
Date: Thu,  6 Feb 2020 11:00:05 +0300
Message-Id: <20200206080014.13759-5-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200206080014.13759-1-wambui.karugax@gmail.com>
References: <20200206080014.13759-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initial conversion of the straightforward printk based logging macros to
the struct drm_device based logging macros in
i915/display/intel_color.c.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 2087a1852486..d44bd8287801 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -1192,7 +1192,8 @@ static int check_luts(const struct intel_crtc_state *crtc_state)
 
 	/* C8 relies on its palette being stored in the legacy LUT */
 	if (crtc_state->c8_planes) {
-		DRM_DEBUG_KMS("C8 pixelformat requires the legacy LUT\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "C8 pixelformat requires the legacy LUT\n");
 		return -EINVAL;
 	}
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
