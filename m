Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6DA248FE6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 23:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB8E6E17F;
	Tue, 18 Aug 2020 21:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FC56E160
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 21:05:40 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id d14so19669398qke.13
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QjFDNFT8J4hCdfQ/qctieZPGMH8zAiIH2OxQX1b7gbE=;
 b=MTij03kdn6A5Fsd3JykXHo9wNSsfiqNiifc+1IfgC88aL65788c3f2GgGiMQG+Eiiu
 OTGEm7I9C2qJViUMt/UULF5rb3UCWOyBokRDDZWQsYwniEsQc24jX+S/lL3iyZHZOhor
 O25Sx0WbtK9UPMAnUfyzYYbdKEHV7Hm2oZmtPFiD0UqLyj3YVEZSD0Iybyy7GSpWGha/
 +jSE7/ILEBD6FSH+eQqZk42ogIqyz492onMxP2+nWClK1nxdi/yxNt7F8RloSU41vUOJ
 I7AKzRvfqLvdyZKx2ZBHK+5xEAVRO5l+y6H85BU0Y9UFt5QVu8ls4O/XUpI/jCWP8e6t
 YLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QjFDNFT8J4hCdfQ/qctieZPGMH8zAiIH2OxQX1b7gbE=;
 b=Vm7wQwCtq/zbgkM8sqDaL+97YkTDjYXLGrj30I+dFAXBXUWvoz92LVPAuF/BRhcSzv
 iczTR5HMzAa11cRlnJH1lk4W6VkdYp+b4WwEQFXU6M+G0xZzjHSSS8JNCu+HIJ7F3U9y
 pJkMjJfj8wmQQlJ4vEYsLhv2GbFzBpV4VWK83hoJVJ2I8JPCrgaYCZGd89OEzgGszZC+
 KdhMgQyLVPNzJAv604fzOkNUVLMa4h6zEjer4dIK6KtoSEJfAiZ5CGXXdiQZiiPiCnI1
 f9Mv752Ou8R1s8iKEO83M1ym/9M5Z7zj/jrfxQFVTLYKM6gC+k9IdZsRGS7NB6m17HAd
 slXw==
X-Gm-Message-State: AOAM532KiyBwRlPeaJc4VTTJzxa2o/dvaemYH1OsMZACz1I0RFZwg4dO
 Hkw+XI6EZ0fV7k7ogyEqQzJGg4mC7JYDmQ==
X-Google-Smtp-Source: ABdhPJzKMXvgx0XyPwX3VoTBfYaw8muEILrg/Io1+tiMnn6bYQVfIzRYesjIuinFMeyiiRKQkYypnA==
X-Received: by 2002:ae9:e8ca:: with SMTP id a193mr18933254qkg.6.1597784738227; 
 Tue, 18 Aug 2020 14:05:38 -0700 (PDT)
Received: from localhost (mobile-166-177-184-140.mycingular.net.
 [166.177.184.140])
 by smtp.gmail.com with ESMTPSA id n33sm24445866qtd.43.2020.08.18.14.05.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Aug 2020 14:05:37 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 seanpaul@chromium.org, airlied@linux.ie
Subject: [PATCH v6 12/14] drm/i915: Use debug category printer for welcome
 message
Date: Tue, 18 Aug 2020 17:05:08 -0400
Message-Id: <20200818210510.49730-13-sean@poorly.run>
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

The welcome printer is meant to be gated on DRM_UT_DRIVER, so use the
debug category printer to avoid dumping the message in the wrong
place.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-13-sean@poorly.run #v5

Changes in v5:
-Added to the set
Changes in v6:
-None
---
 drivers/gpu/drm/i915/i915_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 00292a849c34..0206be123b28 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -872,7 +872,8 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 static void i915_welcome_messages(struct drm_i915_private *dev_priv)
 {
 	if (drm_debug_enabled(DRM_UT_DRIVER)) {
-		struct drm_printer p = drm_debug_printer("i915 device info:");
+		struct drm_printer p = drm_debug_category_printer(DRM_UT_DRIVER,
+						"i915 device info:");
 
 		drm_printf(&p, "pciid=0x%04x rev=0x%02x platform=%s (subplatform=0x%x) gen=%i\n",
 			   INTEL_DEVID(dev_priv),
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
