Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983D43CBFF2
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 02:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84DF6E953;
	Sat, 17 Jul 2021 00:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78BF6E953
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 00:03:52 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 z39-20020a25ada70000b029056092741626so14660542ybi.19
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 17:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=RDUgVelj+CPe4t6KMZ4n5EMZaDtjmTsbCz6doNCZT/Y=;
 b=mPUoPVF+UTyT3Xl5NHYNtSv/jypRlVxeOpMlkbcT24Zgqmwt/mtY8uJWvmoDPasjGd
 CW1nKH2M2c45U6oB5xKM4ycZTubjmL+c0EUYs4yKoqDRId8jq7EMAaIIzK4TVvbhC/rs
 EEazyyXLFmoUZUbHy9s64iwrCDniZW29p/ynuq9sMCH8kmXZ+VbiwDQZtFsh9aB4HAKu
 zfYt/l7dCFIVoeVE7DgrNY9C0qWB24ULvTR7IuvgVSTDRDn9UzjbU4V6FL/TGXhEYE48
 ZS8G/oTDvabtrBrK4ei+jRt4WVeh3IF8wWgBAJhaTUrftWep+uwNMvITgW1I3vUxyt7T
 nckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=RDUgVelj+CPe4t6KMZ4n5EMZaDtjmTsbCz6doNCZT/Y=;
 b=jJEv1UZ9n0G6NNAsNKWKNRYMVrX3xRvDRLaWUJ1HyIqdHN2HWg+Bt3PC0YpLnI3Orb
 cMo8pJoee82Z3XyXMi2vig5HlBwjiGCjwKZDlVxpWeAzzHUCL6pJtmNUzSJEpYYfHgQe
 qZacQIcJQfuLdJVmsaWFpL+hUCa3Kn89GcNJ6cSq8PKUJo8IKpKITWtfbtKIoLAunhFR
 3wNAVzy0aXKN/A9J6W4kQreO5OYzzx1/azcBwqyWn+GCird8z20Q3V9P016f4cbs6j4c
 5SSlTlKXkMziJmtjBc3T1HmMUMGLKgVJ6HCxBc1mA0k5OmDEdrlQrtS3RqKo+wcA/lUj
 GdaQ==
X-Gm-Message-State: AOAM530M3JgocLCI6fovkHTHloUdLVTHJ2i+5JQHvEswpPc07URm0Huj
 knQXafbhkz8RoHUlnBxPC6yfLKcZNhrF6Sf2qCY=
X-Google-Smtp-Source: ABdhPJwSrg4qElhxKhNcrm6xV1ytMGy0zO80SmC4fYKzdGyzuW2mJn9UxS+CxIPPFfgIwa6nvBIRVIKrIB5dHLYaDqo=
X-Received: from willmcvicker.c.googlers.com
 ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a25:8b0d:: with SMTP id
 i13mr16613822ybl.398.1626480231660; Fri, 16 Jul 2021 17:03:51 -0700 (PDT)
Date: Sat, 17 Jul 2021 00:03:45 +0000
Message-Id: <20210717000345.2345429-1-willmcvicker@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.402.g57bb445576-goog
Subject: [PATCH] drm/mipi: set fwnode when a mipi_dsi_device is registered
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

This allows the fw_devlink feature to work across mipi_dsi bus devices too.
This feature avoids unnecessary probe deferrals of mipi_dsi devices, defers
consumers of mipi_dsi devices till the mipi_dsi devices probe, and allows
mipi_dsi drivers to implement sync_state() callbacks.

Suggested-by: Saravana Kannan <saravanak@google.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
Reviewed-by: Saravana Kannan <saravanak@google.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 1 +
 1 file changed, 1 insertion(+)

v2:
 Thanks Saravana for the comments! I updated the commit message and added your
 reviewed-by.

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
2.32.0.402.g57bb445576-goog

