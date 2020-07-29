Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4BB232170
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 17:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7420489B68;
	Wed, 29 Jul 2020 15:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277FC89B68
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 15:22:49 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id d188so7050969pfd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 08:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=F0+ed1oJcS1Y4n7YI4eB34N09Mdy/Fk5lreV7E+LSkA=;
 b=toFRN1OzgPcKqpPEh5n1U124L/PbACHYJfGidnXR1Uk/l6WFDBrS+x7/iqx4DM8IpP
 VGIeyIgXwSqimIBpkdcawCUcYfJ/tUtNI0jgZnB2/q5GWKkNcrfoK0JQMUHIfWaxAQeN
 dGujHGcpgt5nS6wtPR8amPzTuNp30MZMdRnEddu5IA9zYPdDdvdrN62/w7hlQCJ1z2Il
 ut6AYF2fNVq+i4B1MOa+gJ2Z4zySgtbLZRGgGcMY1nnW7essEdg0dFRX6eKmcNLVusOZ
 Ae2zJ2w/AhMGBzCFR2CpgFd4kk9buhQzHJolHCczURq8S0pQjcNXZG4HZs7aIvjB3upZ
 g0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=F0+ed1oJcS1Y4n7YI4eB34N09Mdy/Fk5lreV7E+LSkA=;
 b=CTPAbfIEovRoa2A9FduXxcAITHXhxux+GBWchp07oIXcxxLVpiNYAaf2CjpkEAQ3Du
 sCOUCB40A9oLpr79kjlpKe/lLvjaLYnCfLscs2PHCXHcmQ1b1n7vkv/8Mfu8vk2OgnGd
 JgLCnzYiPaFWq+JV4uU7exNkHBo+e6U4uzMbmLAq188wvZIJiypJoYVbY0eHw6sgnlI1
 EJOaDUeVmdKjS0fNk1iJqxCw29DNr2LyIH4BUw4JMxdWYCq0yNNntai0OePYdYcx/EVa
 QGDwDYWVGm/WgUVGcWRon7DJ4ZoKEB7KKPm4eGdA9uD0w/pQJpgAfRXI1o6TNHgFW/Gm
 V8HQ==
X-Gm-Message-State: AOAM533BVgOtCZzpulXAdA82MK7bpmksOlZwXfU7LPK07mkh60Ed7+HJ
 pV/mUz3J91c7UrpkxndE3xY=
X-Google-Smtp-Source: ABdhPJyaMHwFbthy9/QrcY1w6412xzE25wYTcfRXrQy1w8hHm8w4vA5pMKgjffb1sB+e11l2mDSXIA==
X-Received: by 2002:a62:26c5:: with SMTP id m188mr370009pfm.23.1596036168675; 
 Wed, 29 Jul 2020 08:22:48 -0700 (PDT)
Received: from localhost.localdomain ([61.83.141.80])
 by smtp.gmail.com with ESMTPSA id b12sm2801172pga.87.2020.07.29.08.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 08:22:47 -0700 (PDT)
From: Sidong Yang <realwakka@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH] drm/vkms: modify sequence disable/plane/enable in commit_tail
Date: Wed, 29 Jul 2020 15:22:31 +0000
Message-Id: <20200729152231.13249-1-realwakka@gmail.com>
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
Cc: Sidong Yang <realwakka@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel-usp@googlegroups.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch modifies function call sequence in commit tail. This is for
the problem that raised when kms_cursor_crc test is tested repeatedly.
In second test, there is an bug that crtc commit doesn't start vblank events.
Because there is some error about vblank's refcount. in commit_flush() that
called from commit_plane, drm_vblank_get() is called and vblank is enabled
in normal case. But in second test, vblank isn't enable for vblank->refcount
is already increased in previous test. Increased refcount will be decreased
in drm_atomic_helper_commit_modeset_enables() after commit_plane.
Therefore, commit_plane should be called after commit_modeset_enable.

In this situation, there is a warning raised in get_vblank_timestamp().
hrtimer.node.expires and vblank->time are zero for no vblank events before.
This patch returns current time when vblank is not enabled.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>

Signed-off-by: Sidong Yang <realwakka@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 5 +++++
 drivers/gpu/drm/vkms/vkms_drv.c  | 4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index ac85e17428f8..09c012d54d58 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -86,6 +86,11 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 
+	if (!READ_ONCE(vblank->enabled)) {
+		*vblank_time = ktime_get();
+		return true;
+	}
+
 	*vblank_time = READ_ONCE(output->vblank_hrtimer.node.expires);
 
 	if (WARN_ON(*vblank_time == vblank->time))
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 1e8b2169d834..c2c83a01d4a7 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -76,10 +76,10 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
 
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 
-	drm_atomic_helper_commit_planes(dev, old_state, 0);
-
 	drm_atomic_helper_commit_modeset_enables(dev, old_state);
 
+	drm_atomic_helper_commit_planes(dev, old_state, 0);
+
 	drm_atomic_helper_fake_vblank(old_state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
