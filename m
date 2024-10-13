Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E846799BAB3
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2024 20:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A06810E0DC;
	Sun, 13 Oct 2024 18:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lqygUk+P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BBA10E0DC
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2024 18:11:39 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-37d43a9bc03so2119105f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2024 11:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728843098; x=1729447898; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2zAy+FUcsg1zkQlCl4ViFL7ab4bn9CrF2AFAn7y+v0g=;
 b=lqygUk+PoCS/ay4BBBgdvO6KRPUq70HmuGBVMGymAF2cjhETtQ5rawK2S1VK0eEXaD
 Vipmm5gPth8cnZq9LCO0vpE1bfkEj21hfJgdwr3dlyAK7XepbMtJ9zjFLEfuf3xYmTQa
 95AEUH9O//DIxJRdeeuD26m9yeebtDNbRFiOb6tLGY1X3NOsleY2wTt0qdHaNJDSfQT9
 fxskJj8OG8XZAe3dI67LZSbSkqPQEwuMhC6bkCPz5cqhqQ4XMjNZeHDPfbH6trUQF2O5
 SuaNpRnszaHpPqiDLjvEgalUPtrxL/+juwfY/qqF6/aiMJzfAnhXT2psY7+URu5DBrQQ
 Xo1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728843098; x=1729447898;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2zAy+FUcsg1zkQlCl4ViFL7ab4bn9CrF2AFAn7y+v0g=;
 b=lkzZUBWmus23ZbeMS6YvfipXstqCoyTf+WP02ZKAVuDcnUK7uHjyz+2/26J+ueYV3p
 HazY7uIj0lv6gmdlr5bTdVFjFOIo3W43PYzYTiju87nT3d7acCLPTXSaSjaakO+fP1AC
 NMgK5OtwMocty8umQG+sJagJOS4G0uBaMkcJE6zEfARM9hz03Y1CXHizzse+1gMXqxxb
 4CzeTAE792B5PjAy9cYedQcJoBtDMoRGFrDgs7TruocWXEyFABnK8zc8gr+qdu1NjcMh
 Sbeo0rY9xcKDs847Udd0vVr627+8O4AghsIyeMWwFZDdvPuObVxsiOw/d9JaTy6r4yqh
 XYZg==
X-Gm-Message-State: AOJu0YxPh/r+qX+82BPo7yycKeb0ewcePxaw2o489QdlMO+evb7AnT4n
 Jbo0cePbfhJzQxeyIAsOInCemF1g1zlYvPyD76sY6ukmzxgcR6ZS
X-Google-Smtp-Source: AGHT+IFPAFcveA8f3QvCLbwjqtO/rjeE4AWYqTqzBQ+pHh+j2qqAvDTEvKu58Kd9Q4R9rRI0qyef8Q==
X-Received: by 2002:adf:f3c2:0:b0:37d:3dfc:949c with SMTP id
 ffacd0b85a97d-37d5ff6cdddmr3859390f8f.41.1728843097396; 
 Sun, 13 Oct 2024 11:11:37 -0700 (PDT)
Received: from [127.0.1.1]
 (2a02-8389-41cf-e200-fffe-da2d-f221-edef.cable.dynamic.v6.surfer.at.
 [2a02:8389:41cf:e200:fffe:da2d:f221:edef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b79f9d9sm9287647f8f.77.2024.10.13.11.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 11:11:36 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sun, 13 Oct 2024 20:11:29 +0200
Subject: [PATCH] drm/bridge: tc358767: fix missing of_node_put() in
 for_each_endpoint_of_node()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241013-tc358767-of_node_put-v1-1-97431772c0ff@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFANDGcC/x3MQQqAIBBA0avErBM0LaurRIjUWLNR0YogunvS8
 i3+fyBjIswwVg8kvChT8AWirmDZrd+Q0VoMDW+U4EKyY5FtrzvNgjM+rGjieTChrORc4eBUCyW
 NCR3d/3aa3/cDjCo2v2YAAAA=
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728843095; l=1203;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=srLtoALgpH2ycJBqVY37tb2RPDzJt/d7FCNiw/5wN7g=;
 b=JMfU2cuUQPmSZDm+OGVR6jmL2LoX9ZciVXU4d4jwAJNW176LKXFdL5fSiR1Rhwp7Q3iCuQPMz
 X7Tai3xrTacDE0hGbRQI6MS61IMTa81cwphNYPRe7E9ZqgycSJ88VCP
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
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

for_each_endpoint_of_node() requires a call to of_node_put() for every
early exit. A new error path was added to the loop without observing
this requirement.

Add the missing call to of_node_put() in the error path.

Fixes: 1fb4dceeedc5 ("drm/bridge: tc358767: Add configurable default preemphasis")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 159c95b26d33..942fbaa1413a 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2405,6 +2405,7 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
 			if (tc->pre_emphasis[0] < 0 || tc->pre_emphasis[0] > 2 ||
 			    tc->pre_emphasis[1] < 0 || tc->pre_emphasis[1] > 2) {
 				dev_err(dev, "Incorrect Pre-Emphasis setting, use either 0=0dB 1=3.5dB 2=6dB\n");
+				of_node_put(node);
 				return -EINVAL;
 			}
 		}

---
base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
change-id: 20241013-tc358767-of_node_put-14a3004e9f45

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

