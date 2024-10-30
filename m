Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EC49B5BFE
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 07:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A1E10E217;
	Wed, 30 Oct 2024 06:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IPqnASwg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C939E10E217
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 06:49:08 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id
 98e67ed59e1d1-2e2eba31d3aso4494634a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 23:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730270948; x=1730875748; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g1QvxUmXWeKxvEL2k5Sf0XB0155cpa70LB5E4HbGTTc=;
 b=IPqnASwgDmaKBr/kMqQyABSRXz+p0VrJ7tRqbj6u9IMVmwwLXKEdvA+aXK44fROoeE
 X96CeXwQ7AETsQRe9Q/sqfHioY8sCe698RPYJ3L/glkxOWGK0a1HbLx2pCanrMkTwrew
 Az5E4wIFs8H50WIW/repG33AvtoJ1moIiyVLDGw1Xjim26gqf0k3gFDO9XYYc1S1GHr5
 ms73w/+1uve4oKgQ9ban6NwI6iX1eOOQQ+T3MhEBh2SiYqAv3Dv+CmMmY/Xhitay1zEr
 aEQz90McsxpHshiSL+UEN51FFKVOUFoLYtx53DI4corLRIUhKjZhdtY9HbeB8rb+8yg6
 j/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730270948; x=1730875748;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g1QvxUmXWeKxvEL2k5Sf0XB0155cpa70LB5E4HbGTTc=;
 b=wkOdhe86IxR+VYvr62R+jhC0wpwLDVGk+3gfcYxJxS3qqlmXx+PwiOBVg9Kt/I9bEw
 uNh2QdYxqlwPE88E2FDGnnel+MdtdgMBHYOPNVn/xdqMVj7RP96cSrpIdJFVV9qKu76+
 tJp9hmLpHPgUn5GEHG+6q1tCDlXgQwmWGRvy3MA5OXvuoD875MqtXvPG+n6LtlbS0vWW
 toQ2Z3rbU3Jup+FpVwT1tHerce94ZuEZqQ+tFJe8ZtrFhSNkYuW0jIb74Mw/hThr2IVH
 oiHV3m+myfKMVQfBCWXhRTbkBbl1tbEDR3clDTz0s4AwqpnAYG7qpQ+p1OREzqDlwuxZ
 jeFg==
X-Gm-Message-State: AOJu0YxFAqPpq9Qv0DRTwBoRJj/zTrrlJ7j/JyAFmvQ4dZ2tleVxCwGl
 qOkKsxIIOxIVLCDknvJYrlpmLS8VCWKQ3zTFGYf4Dm4IbMuZSmYN
X-Google-Smtp-Source: AGHT+IGeeX6tlLELS4LC5m1oeR6KbY5EW00IpuH+lUL9rB6Sj2dEw30McrgidrmkIVOU+SIh7wpGSA==
X-Received: by 2002:a17:90a:9312:b0:2e2:a8e0:85fa with SMTP id
 98e67ed59e1d1-2e8f1057e59mr15767410a91.8.1730270948108; 
 Tue, 29 Oct 2024 23:49:08 -0700 (PDT)
Received: from tom-QiTianM540-A739.. ([106.39.42.118])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e92fa63967sm860530a91.32.2024.10.29.23.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 23:49:07 -0700 (PDT)
From: Qiu-ji Chen <chenqiuji666@gmail.com>
To: mripard@kernel.org, dave.stevenson@raspberrypi.com,
 kernel-list@raspberrypi.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com, Qiu-ji Chen <chenqiuji666@gmail.com>,
 stable@vger.kernel.org
Subject: [PATCH v2] drm/vc4: Fix atomicity violation in vc4_crtc_send_vblank()
Date: Wed, 30 Oct 2024 14:48:52 +0800
Message-Id: <20241030064852.6154-1-chenqiuji666@gmail.com>
X-Mailer: git-send-email 2.34.1
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

An atomicity violation occurs when the vc4_crtc_send_vblank function 
executes simultaneously with modifications to crtc->state->event. Consider 
a scenario where crtc->state->event is non-null, allowing it to pass the 
validity check. However, at the same time, crtc->state->event might be set 
to null. In this case, the validity check in vc4_crtc_send_vblank might act
on the old crtc->state->event (before locking), allowing invalid values to 
pass the validity check, which could lead to a null pointer dereference.

In the drm_device structure, it is mentioned: "@event_lock: Protects
@vblank_event_list and event delivery in general." I believe that the
validity check and the subsequent null assignment operation are part
of the event delivery process, and all of these should be protected by
the event_lock. If there is no lock protection before the validity
check, it is possible for a null crtc->state->event to be passed into
the drm_crtc_send_vblank_event() function, leading to a null pointer
dereference error.

We have observed its callers and found that they are from the
drm_crtc_helper_funcs driver interface. We believe that functions
within driver interfaces can be concurrent, potentially causing a data
race on crtc->state->event.

To address this issue, it is recommended to include the validity check of
crtc->state and crtc->state->event within the locking section of the
function. This modification ensures that the values of crtc->state->event
and crtc->state do not change during the validation process, maintaining
their valid conditions.

This possible bug is found by an experimental static analysis tool
developed by our team. This tool analyzes the locking APIs
to extract function pairs that can be concurrently executed, and then
analyzes the instructions in the paired functions to identify possible
concurrency bugs including data races and atomicity violations.

Fixes: 68e4a69aec4d ("drm/vc4: crtc: Create vblank reporting function")
Cc: stable@vger.kernel.org
Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
---
V2: 
The description of the patch has been modified to make it clearer.
Thanks to Simona Vetter for suggesting this improvement.
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 8b5a7e5eb146..98885f519827 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -575,10 +575,12 @@ void vc4_crtc_send_vblank(struct drm_crtc *crtc)
 	struct drm_device *dev = crtc->dev;
 	unsigned long flags;
 
-	if (!crtc->state || !crtc->state->event)
+	spin_lock_irqsave(&dev->event_lock, flags);
+	if (!crtc->state || !crtc->state->event) {
+		spin_unlock_irqrestore(&dev->event_lock, flags);
 		return;
+	}
 
-	spin_lock_irqsave(&dev->event_lock, flags);
 	drm_crtc_send_vblank_event(crtc, crtc->state->event);
 	crtc->state->event = NULL;
 	spin_unlock_irqrestore(&dev->event_lock, flags);
-- 
2.34.1

