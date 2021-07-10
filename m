Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C493C3349
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 08:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0EF6EAE3;
	Sat, 10 Jul 2021 06:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFF26EAE3
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 06:45:19 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id
 p42-20020a056a000a2ab02902f33d81f23fso5687251pfh.9
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 23:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=9CMx4bIcdXWpRX9qOXiz6bFTgQH2pecsmU1gY1OoGwk=;
 b=hb7tV/VnMR0zjITwjQo9kcBwJbMt5Xl4lPxJMBHWl+wXBD04ICzAZUfbTjBughG6ND
 cFWB0fGyo7hVciVd70kfkWVrVzBg9ISCUvwCFufzl8YJCJZHhEMLddxgCRnGgMUbbuA5
 tP0h2rpj6iv9/g9ujZUEilyHtep2i9qkXIQvhUo5JMDN6wOoi4Lw/CW9AVky1ujx5LRi
 2zTp+WXvoVbMn+3hAdAAQaEgJQ61qk5A2gEJYwcqcbIJUhGh+7klHPKdghy8pCywhQvG
 bvv+A5bO7VufxD+sOryC7BQeFY1kC9mtpoTjXICTr4Xg2eo9u9k2DaiV7ACTXxWl0CBB
 CXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=9CMx4bIcdXWpRX9qOXiz6bFTgQH2pecsmU1gY1OoGwk=;
 b=IEkist2w/t9kItzaH26we3QCPoU2PZyDauCQooFhrqfHyFa0OY/yy241k1k71MQUzF
 2cvlSXUI4W3yeOU3zzprwXdfSGL5Pttyl+zwEK7dsi680PEWafUSiytj/PidpBDivaU2
 dNesRjwwVdH20Xby9M1kvk2wIzflHmQ4s1QQt3/53kn9Hlj4SMYS0YNbMAaa+07nt/+R
 IjOpQDLakWOqvvKeOGI0iQFDAht8JVw0HfaKwzv9JOPUzkfWQ5pdfW/RAH7wAsocN1gp
 8sLcqtT1GWcwJbNI0x4+fEe46qgB0s0niPOiKdVBhAK+en+/QBa/kuW2E8M5txC4tx/U
 EyBg==
X-Gm-Message-State: AOAM533pHZGrS4fAWT0+UKGkI+Y5sH59nmK+pcRrfL0ijK/R+1LT98SM
 r2TWu4+ZXOTTMIcS/lkRuZh6qlSIkOosZ8oqJwo=
X-Google-Smtp-Source: ABdhPJwuWRRzdqbJqHwcxv8Nn5JDV30GafdKLv2JCFLlKFuEUJC6nTof1vswMR5ky+KhimYrkbRgjqbTf5svF5v+s3I=
X-Received: from willmcvicker.c.googlers.com
 ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a17:903:3091:b029:12a:ed47:93c3 with
 SMTP id u17-20020a1709033091b029012aed4793c3mr1859770plc.34.1625899519125;
 Fri, 09 Jul 2021 23:45:19 -0700 (PDT)
Date: Sat, 10 Jul 2021 06:45:11 +0000
Message-Id: <20210710064511.1288232-1-willmcvicker@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH] drm/mipi: set fwnode when a mipi_dsi_device registers itself
From: Will McVicker <willmcvicker@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Saravana Kannan <saravanak@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is needed for fw_devlink to work properly with MIPI DSI devices.
Without setting the device's fwnode, the sync state framework isn't able
to properly track device links between the MIPI DSI device and its
suppliers which may result in its supplier probing before the mipi
device.

Suggested-by: Saravana Kannan <saravanak@google.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 5dd475e82995..469d56cf2a50 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -222,6 +222,7 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *host,
 	}
 
 	dsi->dev.of_node = info->node;
+	dsi->dev.fwnode = of_fwnode_handle(info->node);
 	dsi->channel = info->channel;
 	strlcpy(dsi->name, info->type, sizeof(dsi->name));
 
-- 
2.32.0.93.g670b81a890-goog

