Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9279785F3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 18:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D86E10ED42;
	Fri, 13 Sep 2024 16:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q8q05ZpY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A167610ECD8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 09:11:02 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id
 d9443c01a7336-20551e2f1f8so7433225ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 02:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726218662; x=1726823462; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hj2GddeQps/FE1fWEl/3u7sXcPoqY/f7cIdf4hfzm/8=;
 b=Q8q05ZpYyfj5IAhL2SnpUCinGg3J0dUm8r3Wl5Ge+kDU5/qvYGzpINODii94MZKC70
 HcT9VhTV+Zc/PgcknHdrifo2NBpUoMFhw3AeQXNFp1Omlw6MIKV5pj5CAW2XZjit6hzf
 0GnNW8NnwfphBg3E5Ky41KZiFr8TvO4ZY1jcyHHJfD8L43Y0HOX4Y6kj9Wtk4jWlukZ5
 23xjIeteL3xvbkyl6ybQr9puojT/a9uqiMQCzxR0hsHtj8IRn9CrDCdzEcPtzdxiccqB
 vupZC6i55gDnOuRxHgsIJOYj1uA5Nq1RFAhskpeQL+JS4r5hZWNr1DbFUJx/ZeBY1a6G
 Oy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726218662; x=1726823462;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hj2GddeQps/FE1fWEl/3u7sXcPoqY/f7cIdf4hfzm/8=;
 b=grn1o/evdlevgBs4jxGKr3JBI2xygHdaz95G3lut/iG/oEC3ZE1CxjRY+SUv8m1qFZ
 nPryNEOrnVn9Yz5JhmC1YfWPvbAKfyIlHgEl2UuMUV4aJK6l6uJLR2tVwgoxYHLQtybR
 h3s3WXDbSFWaUF7PyMxKKLAZve6kryOWTW/uPuSDIl78ubG1bzuz4wljGnKJsWudNc0t
 kRlFonZYpIOn3KbyLjPw23vyTb3mS89cPd9dlQBVdn7arI2WG0tUsW7SIDucpK1itjIu
 ceR2XEU1RrBw/emoEbbCDNmycvMiluAQqa8kHQTKJaRc1x/KqNaUHTvtTPN6Xp5+GxEL
 7YlQ==
X-Gm-Message-State: AOJu0YyFjkwDu1sc0//MGZw8ukWwvHPC1v1gvRBBNp9KJSiGweeF0sBO
 wTr4vC7sXvH/9PY6I5FC38zLavUWvd7pXQGUuJmq9M/uGoMbyTdL
X-Google-Smtp-Source: AGHT+IHqr6Ea/+/C5VS1ndd+a6oK2hZU9vmvQDeDsKAJlBu82gDjVw6gDtp76gUirTBv0x8t4OfxJg==
X-Received: by 2002:a17:902:f60d:b0:205:76d0:563b with SMTP id
 d9443c01a7336-20781947b5fmr31093955ad.0.1726218661777; 
 Fri, 13 Sep 2024 02:11:01 -0700 (PDT)
Received: from tom-QiTianM540-A739.. ([106.39.42.164])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-207810a4d62sm8606085ad.8.2024.09.13.02.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 02:11:01 -0700 (PDT)
From: Qiu-ji Chen <chenqiuji666@gmail.com>
To: mripard@kernel.org, dave.stevenson@raspberrypi.com,
 kernel-list@raspberrypi.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com, Qiu-ji Chen <chenqiuji666@gmail.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/vc4: Fix atomicity violation in vc4_crtc_send_vblank()
Date: Fri, 13 Sep 2024 17:10:53 +0800
Message-Id: <20240913091053.14220-1-chenqiuji666@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 13 Sep 2024 16:40:09 +0000
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

Atomicity violation occurs when the vc4_crtc_send_vblank function is
executed simultaneously with modifications to crtc->state or
crtc->state->event. Consider a scenario where both crtc->state and
crtc->state->event are non-null. They can pass the validity check, but at
the same time, crtc->state or crtc->state->event could be set to null. In
this case, the validity check in vc4_crtc_send_vblank might act on the old
crtc->state and crtc->state->event (before locking), allowing invalid
values to pass the validity check, leading to null pointer dereference.

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

