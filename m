Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4AA813B9D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 21:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A31210E1E3;
	Thu, 14 Dec 2023 20:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A046910E1E3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 20:38:11 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1d045097b4cso51482865ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 12:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702586290; x=1703191090;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CEbYOeExhWxrQcvIrSnW0dzfFwJIoL+EWRTjsEQRQR4=;
 b=AMeazQbdfWKWPlN8Wj2UDQoLgr59Y6PW13o7LAkbOqGufNIvxqb1i7cWQG/Q4T+un7
 tIdRewu7c8Q3NTA2sBJBjzCbCsU3ed2XPj/DU9/W+3hxUOnlHCbQ9z2C3AoHxZ4tTgJK
 jax8CWwvN/5CpGHbgy1XNAyNVpGpmMSzj5aNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702586290; x=1703191090;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CEbYOeExhWxrQcvIrSnW0dzfFwJIoL+EWRTjsEQRQR4=;
 b=bj17bOID2NSsTFcjGdq/ZfskwL0vmCozrhBrTBqnK3JxmzgV+ANTzLBewqZY2gAoM7
 yZ3ztCQpd36o2uVHrGbXt9tF4SFbARwKfgQ9jXHkNClU9YFZmDzkmZeY+YA2vS/D2Z1H
 0g2jVa+y9iovKzUplVelaefDyK2Qgq7FT+eH28vrAdP0PIB/EakfX/vJyxLj3X3DMLcp
 /s0dq7hIExU1Dj+mwyWJY+ru5z+bajpCkgC6Zd1exX0OLxhbiaBWUlsNNLfU0epi/Gvh
 +pYac0NN72vioqNBqr6Yleg9hRomLrdEBFkAlBpaWCknx7N/O2e8Vk4bHiQVBUKv7UIE
 MuKg==
X-Gm-Message-State: AOJu0YzrE6ZjCqwKOxaCwxeCTENoCr9v0o4ZUYhEhvUOmmjQKEhrg5B9
 88dnp0roVDRHUpeNJIYkql2Zs+6GVzBD2m1jGwUZDti2
X-Google-Smtp-Source: AGHT+IGcoNWWmuS7W3F8Oa3UUyu1se2mbBEQgXS9YTTmt+8tUfR2PUem9ww3SQz2i2gofIRWMOARSg==
X-Received: by 2002:a17:902:ec89:b0:1d0:c26d:e509 with SMTP id
 x9-20020a170902ec8900b001d0c26de509mr6417151plg.108.1702586290186; 
 Thu, 14 Dec 2023 12:38:10 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:9d0c:9bd0:17f6:8236])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a170902b49200b001cfc2e0a82fsm12799081plr.26.2023.12.14.12.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 12:38:09 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm/bridge: parade-ps8640: Never store more than
 msg->size bytes in AUX xfer
Date: Thu, 14 Dec 2023 12:37:51 -0800
Message-ID: <20231214123752.v3.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philip Chen <philipchen@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While testing, I happened to notice a random crash that looked like:

  Kernel panic - not syncing: stack-protector:
  Kernel stack is corrupted in: drm_dp_dpcd_probe+0x120/0x120

Analysis of drm_dp_dpcd_probe() shows that we pass in a 1-byte buffer
(allocated on the stack) to the aux->transfer() function. Presumably
if the aux->transfer() writes more than one byte to this buffer then
we're in a bad shape.

Dropping into kgdb, I noticed that "aux->transfer" pointed at
ps8640_aux_transfer().

Reading through ps8640_aux_transfer(), I can see that there are cases
where it could write more bytes to msg->buffer than were specified by
msg->size. This could happen if the hardware reported back something
bogus to us. Let's fix this so we never write more than msg->size
bytes. We'll still read all the bytes from the hardware just in case
the hardware requires it since the aux transfer data comes through an
auto-incrementing register.

NOTE: I have no actual way to reproduce this issue but it seems likely
this is what was happening in the crash I looked at.

Fixes: 13afcdd7277e ("drm/bridge: parade-ps8640: Add support for AUX channel")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Never return more than msg->size as the number of bytes we read.

Changes in v2:
- Still read all the bytes; just don't write them all to the buffer.

 drivers/gpu/drm/bridge/parade-ps8640.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 8161b1a1a4b1..d264b80d909d 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -330,11 +330,12 @@ static ssize_t ps8640_aux_transfer_msg(struct drm_dp_aux *aux,
 				return ret;
 			}
 
-			buf[i] = data;
+			if (i < msg->size)
+				buf[i] = data;
 		}
 	}
 
-	return len;
+	return min(len, msg->size);
 }
 
 static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
-- 
2.43.0.472.g3155946c3a-goog

