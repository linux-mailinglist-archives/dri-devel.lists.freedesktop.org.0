Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E474C3D15B9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 19:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CFA6EC24;
	Wed, 21 Jul 2021 17:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF796EC24
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 17:56:23 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id bm6so2906746qkb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 10:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3aPSv8mU3AbCHcMFdN+dylgnKrMQgvv2xeAE6ndQ/lg=;
 b=UEKAiKxwuGl5DOU7RytreKynZZtulprGu3JD7GVZtOo8cxtjHOX2hzYUdMNWqN1WWM
 eecbQaoYNGqioKrOviRkvfWAahOpQtBk4bE1qEFxpij9tLnt/EOUM3SEylZOxcnjxs4t
 rt5DIiaC9hVuk0fbnzH/jqAfgQ7qpePV5sjisubF8LCNKVNPjMQyX5NWrZ0sKJcIEHug
 74dyFPxJDrNR0W884yFkb1WbQsFiSk3X2S+yXZnkOdJCUMvOZUgOOQUECK2I4dGjuZQp
 WHZC9dOL0IXzKgm9/vU8w0TkhsFQX26TJ28TKCFnV373QnrUFm6EdC9qzfHxpeXPvSHg
 eN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3aPSv8mU3AbCHcMFdN+dylgnKrMQgvv2xeAE6ndQ/lg=;
 b=Ix+5Yxu+VWyX34vpZfY06vEyZYa0MP50f1x09k2sVzRUSh98C+cttccMESEzYFPBjt
 FEYkB4qY0qUCd435lfLAyYQRkr0+ppAOgCm0JrMkoyMQww23dKjwScPFbLRIalnSONij
 O9yrCkt+LJPxWOoWCsBMS0qIMIkx12MUtudTgPJbLRwIIc2azLF/7jB1/P6NpmUpHxyc
 ZFuC6vz4UdBoofG3JA5xhDpEtLCCkAz5aeGdbBMVtBx+N6+w10AiD1xK5cCzvUnSMe5R
 RwUczaHLvpE3hMhStrs/jCYCyJ5EJ9Wf5J6v4yfEVwrmMcZxe38YWnpQX3Jw+kvcAgqh
 Vl+Q==
X-Gm-Message-State: AOAM531fQUhizO6oJse6NKYQEZ9u3rfsufUEHHWEBdue7vYX0Zmag//Q
 zCrAoCb4VmAx7dQ1fpu3rJvhI9hiFcuOKA==
X-Google-Smtp-Source: ABdhPJytrLby92pWZXaux2n8Ywej7baHIvSrQti78yqoxO4kXC/jEucxQ9yxi5aOpS5mFrtrro3RzA==
X-Received: by 2002:ae9:f201:: with SMTP id m1mr35493084qkg.381.1626890182775; 
 Wed, 21 Jul 2021 10:56:22 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id f15sm7497848qtv.60.2021.07.21.10.56.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Jul 2021 10:56:22 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch
Subject: [RESEND PATCH v6 12/14] drm/i915: Use debug category printer for
 welcome message
Date: Wed, 21 Jul 2021 13:55:19 -0400
Message-Id: <20210721175526.22020-13-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210721175526.22020-1-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: intel-gfx@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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
index c43b698bf0b9..93299af1e853 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -731,7 +731,8 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
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

