Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B21660B71
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 02:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3998610E2E0;
	Sat,  7 Jan 2023 01:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B0610E2E0
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 01:23:55 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id g16so3488905plq.12
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 17:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mePU1ZAhSqo8qTV2sJWgAIGRWTZTuG5GYl0yO3MCKB4=;
 b=ORZnF9sbfKyWHytaUFPFsZGI7BSTg4M86QZcVlCqdAZbjZp7JQXb4WEWzUjS8C30u4
 VaGo9gRMDcaYwofVZlwp5RmXD0B/i9+aoHyJfYZ6zNok7RDhn8WtyBqNfAhy3WexA6FE
 oUbbMZcyraLMbrTbAf9ex4fX4I6dAu8TWyEYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mePU1ZAhSqo8qTV2sJWgAIGRWTZTuG5GYl0yO3MCKB4=;
 b=Ro6xl00BWISmqjYw4dgQr7vcXJaA1DYfZvlyc2jK/RgeLZzy+YosIyq6sKIKcrrVOZ
 OqWu4ifFx3lBO77W+NokkxvehaFwFPRa4GO+utBq+4hxOuJr6zDYtHbfwNWHT7Wtv9w+
 O0nzEH7ng0YxUMG/stJZsXefd557QKwzDoFYzL5qSfDmZV/9Bxxo03DXqs3gZ+hEwB9Q
 89OVhTEx0f/8MMxdwgOS99Yf11pSD+4FoXyZkFLf5nNKQxQQT6MdkoTZKdNiHrPlDmzF
 cYJwyJkgGyaEcPxJwDRUY2pN1JearX3PntJwDnWQJAZT3Nh8T8s3ijiM1W0rRAemUaAp
 kBKg==
X-Gm-Message-State: AFqh2krT0Ov2zcPtjMcqRN+CluJjn9XsGFjkvWsGde5hFZMbaO5/fmG4
 RKPZkw1retLfFKSQIiNoaC1O+g==
X-Google-Smtp-Source: AMrXdXvVILC1sku5q0Ao6IUCbaJtDoD3exxH985nTWiQEplQABh9TP8ue13rxf2FJyS7lDBveGM2MQ==
X-Received: by 2002:a05:6a20:4f88:b0:ac:5a0c:32ad with SMTP id
 gh8-20020a056a204f8800b000ac5a0c32admr55348750pzb.53.1673054634879; 
 Fri, 06 Jan 2023 17:23:54 -0800 (PST)
Received: from localhost ([2620:15c:9d:2:bc4e:2cc9:68b3:15dc])
 by smtp.gmail.com with UTF8SMTPSA id
 q3-20020a17090311c300b0018c990ce7fesm1492103plh.239.2023.01.06.17.23.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 17:23:54 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>
Subject: [PATCH v2 1/2] drm/atomic: Allow vblank-enabled + self-refresh
 "disable"
Date: Fri,  6 Jan 2023 17:23:22 -0800
Message-Id: <20230106172310.v2.1.I3904f697863649eb1be540ecca147a66e42bfad7@changeid>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
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
Cc: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The self-refresh helper framework overloads "disable" to sometimes mean
"go into self-refresh mode," and this mode activates automatically
(e.g., after some period of unchanging display output). In such cases,
the display pipe is still considered "on", and user-space is not aware
that we went into self-refresh mode. Thus, users may expect that
vblank-related features (such as DRM_IOCTL_WAIT_VBLANK) still work
properly.

However, we trigger the WARN_ONCE() here if a CRTC driver tries to leave
vblank enabled.

Add a different expectation: that CRTCs *should* leave vblank enabled
when going into self-refresh.

This patch is preparation for another patch -- "drm/rockchip: vop: Leave
vblank enabled in self-refresh" -- which resolves conflicts between the
above self-refresh behavior and the API tests in IGT's kms_vblank test
module.

v2:
 * add 'ret != 0' warning case for self-refresh
 * describe failing test case and relation to drm/rockchip patch better

Cc: <stable@vger.kernel.org> # dependency for "drm/rockchip: vop: Leave
                             # vblank enabled in self-refresh"
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d579fd8f7cb8..a22485e3e924 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1209,7 +1209,16 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 			continue;
 
 		ret = drm_crtc_vblank_get(crtc);
-		WARN_ONCE(ret != -EINVAL, "driver forgot to call drm_crtc_vblank_off()\n");
+		/*
+		 * Self-refresh is not a true "disable"; ensure vblank remains
+		 * enabled.
+		 */
+		if (new_crtc_state->self_refresh_active)
+			WARN_ONCE(ret != 0,
+				  "driver disabled vblank in self-refresh\n");
+		else
+			WARN_ONCE(ret != -EINVAL,
+				  "driver forgot to call drm_crtc_vblank_off()\n");
 		if (ret == 0)
 			drm_crtc_vblank_put(crtc);
 	}
-- 
2.39.0.314.g84b9a713c41-goog

