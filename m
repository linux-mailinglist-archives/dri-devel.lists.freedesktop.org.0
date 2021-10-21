Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 276A0436BF1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 22:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CF36E497;
	Thu, 21 Oct 2021 20:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7C86E497
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 20:20:56 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id s19so674236wra.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 13:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H3OxDgQ3SPNSwUlXawNQL491W4uV6Gbe6RUFFqLVjig=;
 b=N5/tObVR+UcKVWN7oM/qe2jWj1ugHaWtc+KVJMsldu3wA4NU5MHe2BxhpFMg0uvkk5
 AAx6Cfy/FieJzdP0b18zsWpWM5Utt39SnIEUgQ2WHlUk3t7cMSpkstZ8z6onfxtVsiGc
 kzUQ9CrnxlFGUy7fAQS1fJSDKqWF75SCK7Ey8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H3OxDgQ3SPNSwUlXawNQL491W4uV6Gbe6RUFFqLVjig=;
 b=h1R/3l04jzyhhmoh35bvuyAoxLlN28LIuxzpq/RG1uz93/sw+w2njas7lYqz58b1y9
 94RVFJpmgVebPnRmFQd5Cs1GUfBfEkbMLowyvmi7UTJPD+FqltzqO7ks+QoLTeKNkxXc
 cX8QDT4dhnKfYFmhoHBPwOG+H3VB5wUxI4Sm1ejv+8LfniuYbSjWG/OYxlMitRuCGl2w
 QpDLHLkIVuHNjXUEI9f+XeoSBv1UHeS9/CaN35jiT+Vw7W0GAx8Zbw0wV7j/St2GWS1O
 tqGAy9YBpgTJc4g1u/STfKjUW6fmo78pPXBvzikCwO6XAUSE61Znh3vGbcTgQ/27ycbf
 ujNg==
X-Gm-Message-State: AOAM532Ti/whXbAgz1E8fCNggSWXVnOIpMKS14o0McPAdiUoyJv487Fz
 +7iOjoe6KVwbFcMZwEH1T/17oXMAuybkBw==
X-Google-Smtp-Source: ABdhPJy66pBg4zAKr8KklTKoymNvpPPDgMecGVBcjV4LBgwaI3Y14JK79xMJHgKuHmH4Vo1XbbabpQ==
X-Received: by 2002:adf:9b8a:: with SMTP id d10mr9598012wrc.151.1634847654587; 
 Thu, 21 Oct 2021 13:20:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d24sm5648764wmb.35.2021.10.21.13.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 13:20:53 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/i915/selftests: Properly reset mock object propers for
 each test
Date: Thu, 21 Oct 2021 22:20:48 +0200
Message-Id: <20211021202048.2638668-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I forgot to do this properly in

commit 6f11f37459d8f9f74ff1c299c0bedd50b458057a
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri Jul 23 10:34:55 2021 +0200

    drm/plane: remove drm_helper_get_plane_damage_clips

intel-gfx CI didn't spot this because we run each selftest in each own
invocations, which means reloading i915.ko. But if you just run all
the selftests in one go at boot-up, then it falls apart and eventually
we cross over the hardcoded limited of how many properties can be
attached to a single object.

Fix this by resetting the property count. Nothing else to clean up
since it's all static storage anyway.

Reported-and-tested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Fixes: 6f11f37459d8 ("drm/plane: remove drm_helper_get_plane_damage_clips")
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/selftests/test-drm_damage_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/selftests/test-drm_damage_helper.c b/drivers/gpu/drm/selftests/test-drm_damage_helper.c
index 1c19a5d3eefb..8d8d8e214c28 100644
--- a/drivers/gpu/drm/selftests/test-drm_damage_helper.c
+++ b/drivers/gpu/drm/selftests/test-drm_damage_helper.c
@@ -30,6 +30,7 @@ static void mock_setup(struct drm_plane_state *state)
 	mock_device.driver = &mock_driver;
 	mock_device.mode_config.prop_fb_damage_clips = &mock_prop;
 	mock_plane.dev = &mock_device;
+	mock_obj_props.count = 0;
 	mock_plane.base.properties = &mock_obj_props;
 	mock_prop.base.id = 1; /* 0 is an invalid id */
 	mock_prop.dev = &mock_device;
-- 
2.33.0

