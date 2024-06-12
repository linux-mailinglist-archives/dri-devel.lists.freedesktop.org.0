Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6A0905E6B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 00:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDAE10E933;
	Wed, 12 Jun 2024 22:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZBVFP8xZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C4D10E931
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 22:24:57 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1f717b3f2d8so10880495ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 15:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718231095; x=1718835895;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=moW+vuchPBzwhuLa9D90CyqT2Qzy5nveIbqumh1IepQ=;
 b=ZBVFP8xZZ8bHnyRl4zP5ISh8MHTyv6qmVG16b/1dsqLLS6Sd4n8gx311h945zMYt+z
 y7DPTgTVAAjfOGo9LzsoW8U0NYp0a3agzq9s3vKUjt5mIA9QrWr8POzFcQnPzBHQM84V
 U6j+joS4dOSSSOzI3bIf88pWYfo+E/t9vMNBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718231095; x=1718835895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=moW+vuchPBzwhuLa9D90CyqT2Qzy5nveIbqumh1IepQ=;
 b=BXyWL/1Ay8tXKP/kv5ayCaecClDidKWSq59EU2fg1k8jzE4M7ZujUOChgfX6s8LxzP
 12Fp9L4JgDmi35GRtKt1j5OLqEPBOc3isnInmHkf4MwhHWz3jK+aNs1SgcwFcTmW+fB1
 waIPhTLcpk0I2dU4tyL06XmG1/yKzqT8p9hINOmijIUNZN31TYW7eJ4xv+L3P8Qm9f58
 XIffMvaEwKFx+YKAHMya/Kdme3didevianJHcC346AIloe+uMWI7cRucIsBOZ6JwJiER
 nWbTa0vU5HPYlBNSsxKCT+wGVuDgQ/mBmO0Xv6TPaQt21YpuwGpmni+v0AJWVZo1yxPL
 PG2w==
X-Gm-Message-State: AOJu0YwgSZZN+gS49XyJ6m6xbf4Sd3XnCcbCVpPCagIVAtFxUA/ghzw/
 jBMsqdcugyrGcBLHmOVtbUvrTg6OFRQ+562PTaSRuLfVOmvJ2Ohfmj9pHpZOX3JZN4k0jQvMYBM
 =
X-Google-Smtp-Source: AGHT+IHBAtSsNRsCiipiSSmdPtxdIvkO4DzXuXDcDLjyV0KBNSghL6hedDrLySr08oXr7dCUGUp9XA==
X-Received: by 2002:a17:902:fc46:b0:1f2:fee2:82ed with SMTP id
 d9443c01a7336-1f84e425a39mr11905935ad.30.1718231095482; 
 Wed, 12 Jun 2024 15:24:55 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:2816:6a42:9074:18cc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6f30acda9sm87914105ad.198.2024.06.12.15.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 15:24:54 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Orson Zhai <orsonzhai@gmail.com>, Rob Herring <robh@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Steven Price <steven.price@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] drm/sprd: Call drm_atomic_helper_shutdown() at remove
 time
Date: Wed, 12 Jun 2024 15:23:45 -0700
Message-ID: <20240612152336.v2.5.I7a2dd349cb52bae53280d0a49e22cc27b923274b@changeid>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240612222435.3188234-1-dianders@chromium.org>
References: <20240612222435.3188234-1-dianders@chromium.org>
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

Based on grepping through the source code, this driver appears to be
missing a call to drm_atomic_helper_shutdown() at remove time. Let's
add it.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS driver remove comes straight out of the kernel doc "driver
instance overview" in drm_drv.c.

While at it, let's also fix it so that if the driver's bind fails or
if a driver gets unbound that the drvdata gets set to NULL. This will
make sure we can't get confused during a later shutdown().

Suggested-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

While making this patch, I noticed that the bind() function of this
driver is using "devm". That's probably a bug. As per kernel docs [1]
"the lifetime of the aggregate driver does not align with any of the
underlying struct device instances. Therefore devm cannot be used and
all resources acquired or allocated in this callback must be
explicitly released in the unbind callback". Fixing that is outside
the scope of this commit.

[1] https://docs.kernel.org/driver-api/component.html

(no changes since v1)

 drivers/gpu/drm/sprd/sprd_drm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
index a74cd0caf645..d4453430dd1f 100644
--- a/drivers/gpu/drm/sprd/sprd_drm.c
+++ b/drivers/gpu/drm/sprd/sprd_drm.c
@@ -114,6 +114,7 @@ static int sprd_drm_bind(struct device *dev)
 	drm_kms_helper_poll_fini(drm);
 err_unbind_all:
 	component_unbind_all(drm->dev, drm);
+	platform_set_drvdata(pdev, NULL);
 	return ret;
 }
 
@@ -122,10 +123,11 @@ static void sprd_drm_unbind(struct device *dev)
 	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
-
 	drm_kms_helper_poll_fini(drm);
+	drm_atomic_helper_shutdown(drm);
 
 	component_unbind_all(drm->dev, drm);
+	dev_set_drvdata(dev, NULL);
 }
 
 static const struct component_master_ops drm_component_ops = {
-- 
2.45.2.505.gda0bf45e8d-goog

