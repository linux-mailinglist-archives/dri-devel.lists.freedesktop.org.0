Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D57813B8C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 21:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDCE10E260;
	Thu, 14 Dec 2023 20:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E34F10E260
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 20:32:31 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6d0a679fca7so2299160b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 12:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702585950; x=1703190750;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f60jMhHn2NrJuxYV7wfhO+MfVtVZGHjXqg7DUtfV+AE=;
 b=ZnB0VEJmvr1z+NwrDzpBSd4owsCpWVTMUshDDMMGZY/Kd2TdoCrQBRaPZP8FzZUfqV
 3qLpty7nGj9oJlvC8YwhqR1RS/VAXgyOuGRUYdk06bdphwnzHhQB/Fx312Y3Ib+Ewc3q
 /sgI+Gca8PklMx7n+6qQF60My6BhWVkw4B49o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702585950; x=1703190750;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f60jMhHn2NrJuxYV7wfhO+MfVtVZGHjXqg7DUtfV+AE=;
 b=ubgMHhhXdyiLLejmfNmtrWwHMxYx+7FlU79rC1Odrmru4IC549OEgSj6hjnTpsW7fi
 wJi52LJKIR+FMs53z3Ge6D+KbI+yKNnllXjol9tuBhIcIjXCVTdfGlmfnQJVqYsmrOmY
 4EpWAohwXlcsgQ2lBjXhJMfosiIv53+ur11evHObPnGTr995GdnPnaAYY596CCjsmn0q
 gb8mer30sdSuDLBrLPVd9dn4KP6ip3VkyLLGVUSO/RpvGgnOgVzliAZQwF4tIzHjhH/m
 L4eaSFhq2iPffKCHhPUl/Xy1HF+y8bWLEfbvnhFWM8XwhNc81P0mk8JEoykNXl5kT3cL
 /rJg==
X-Gm-Message-State: AOJu0YzT2mJbp+rIISv+TsYG5a29EPOAiXhv/9nvH59BFqw0v7Aq4Whl
 Cpq0JasUUcg09FgDoG+P4T6frfXBwilnj9RSwjhOkg==
X-Google-Smtp-Source: AGHT+IEGOaFAhYexjfwieKxbwPZ2Kk2OttwK4zxJvf+kkUnKqypsKNE1O7AnNxvzBqtTxzEABU/lKA==
X-Received: by 2002:a05:6a21:19c:b0:187:8bd4:e1b6 with SMTP id
 le28-20020a056a21019c00b001878bd4e1b6mr6533286pzb.31.1702585949943; 
 Thu, 14 Dec 2023 12:32:29 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:9d0c:9bd0:17f6:8236])
 by smtp.gmail.com with ESMTPSA id
 5-20020a17090a018500b0028658657e9csm14636228pjc.46.2023.12.14.12.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 12:32:29 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/bridge: parade-ps8640: Never store more than
 msg->size bytes in AUX xfer
Date: Thu, 14 Dec 2023 12:32:05 -0800
Message-ID: <20231214123205.v2.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
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

Changes in v2:
- Still read all the bytes; just don't write them all to the buffer.

 drivers/gpu/drm/bridge/parade-ps8640.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 8161b1a1a4b1..dfb97fbb5be6 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -330,7 +330,8 @@ static ssize_t ps8640_aux_transfer_msg(struct drm_dp_aux *aux,
 				return ret;
 			}
 
-			buf[i] = data;
+			if (i < msg->size)
+				buf[i] = data;
 		}
 	}
 
-- 
2.43.0.472.g3155946c3a-goog

