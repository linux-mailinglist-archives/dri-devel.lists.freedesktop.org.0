Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD54A41CCBE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 21:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868AA6E216;
	Wed, 29 Sep 2021 19:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5FC6E20A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 19:40:58 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id o15so2180395qvq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 12:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uygLVQeQ0o4/XQscKBshgBLNwrWUdtQfvhLaK3mF1Xw=;
 b=RPMXil1/MY1q0e14CFpeUcnWodx2GVTWgPci6RPiPeq1HFAfRwOnbnmmGwEHYs+oo+
 BMa+bbOIUOlNWZgsVklNBrgtYQlE00vflN9GgbSKqykN5MRcu2BWvdvJV5BDz4F16PZl
 ewc4wE7VByQOuxLX/+XNrxTDgu/ZlQuU34HLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uygLVQeQ0o4/XQscKBshgBLNwrWUdtQfvhLaK3mF1Xw=;
 b=ujywZ5Pyzum5X1rCO/A01Xz++NNA0ePFwapO8Io1jBtmPfQ3RLHKqnXCGCHmJdrsaI
 qFfWFXWmUdN0H7I5Wup5TLrAESRUHloRYJCCbb3EXvf0LI4qVP5OHa4g5TwWvkPlkpt5
 EwKdY+WMJG9LZYiG7IudnmD5t6Hzkbuwd/BvnBLO3cqOJD7UJY4cNTk+vaLPqQJiEFcz
 +S5RcBXb0e4pejNC8ld10hgRJBO13jlkUscciQ826hjSDjLwCMXZbvRjGiK04QoIN2R0
 XcXLRYJ29d8oZ+IcJ34K1DlYelWljZbT9xnA4oAHdo+1zuV3SBxoO4x0M/6pBy73Cul0
 t1rQ==
X-Gm-Message-State: AOAM532Ww45IWidDBiZFOUoqbNvTkYSkKoKeBNxz2Ogrb4EzD6EK2oIy
 ncaV9OeC/Nl3M3f4QG/UMl5DAvqY+uuAqQ==
X-Google-Smtp-Source: ABdhPJx9FxFUi8+5WLUsq9ELR8HA5URHUmYQjIw5BV8E/BxURQ/k4/q2kA7VoUODagoC+37YBIaTtA==
X-Received: by 2002:a05:6214:13e9:: with SMTP id
 ch9mr176270qvb.45.1632944457993; 
 Wed, 29 Sep 2021 12:40:57 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:15c:6c:200:db75:cbbd:56c0:9891])
 by smtp.gmail.com with ESMTPSA id c4sm395064qkf.122.2021.09.29.12.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 12:40:57 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: seanpaul@chromium.org, Rodrigo.Siqueira@amd.com, anson.jacob@amd.com,
 Mark Yacoub <markyacoub@google.com>, Mark Yacoub <markyacoub@chromium.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] amd/amdgpu_dm: Verify Gamma and Degamma LUT sizes using
 DRM Core check
Date: Wed, 29 Sep 2021 15:39:26 -0400
Message-Id: <20210929194012.3433306-2-markyacoub@chromium.org>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
In-Reply-To: <20210929194012.3433306-1-markyacoub@chromium.org>
References: <20210929194012.3433306-1-markyacoub@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

[Why]
drm_atomic_helper_check_crtc now verifies both legacy and non-legacy LUT
sizes. There is no need to check it within amdgpu_dm_atomic_check.

[How]
Remove the local call to verify LUT sizes and use DRM Core function
instead.

Tested on ChromeOS Zork.

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 07adac1a8c42b..96a1d006b777e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10683,6 +10683,10 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 		}
 	}
 #endif
+	ret = drm_atomic_helper_check_crtc(state);
+	if (ret)
+		return ret;
+
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
 
@@ -10692,10 +10696,6 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 			dm_old_crtc_state->dsc_force_changed == false)
 			continue;
 
-		ret = amdgpu_dm_verify_lut_sizes(new_crtc_state);
-		if (ret)
-			goto fail;
-
 		if (!new_crtc_state->enable)
 			continue;
 
-- 
2.33.0.685.g46640cef36-goog

