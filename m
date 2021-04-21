Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C343662F8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 02:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0271F6E928;
	Wed, 21 Apr 2021 00:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D630C6E928
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 00:19:26 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id v13so7023136ple.9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 17:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F81+3GQzn3QgcZNo+rxxDFXnkqXmgl8p5GAog02ZRx8=;
 b=Oi5H8Hha3ytR8cWuT+7PYVercpB4oLQHHpFFg0bpO8uL3a0Qv4L13y2MlE8Ey3paB8
 gHmz4xY008rRgvKignKWhcQGGlU/OdnIty9LER+HsVQQeVoPD5Wt9EZuHgL/ynMcesq+
 ymXJGv1AHhMQ7dbVLFShuGwFOidVsXKNoZTCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F81+3GQzn3QgcZNo+rxxDFXnkqXmgl8p5GAog02ZRx8=;
 b=ICDXYlPyXirHciKvLKCb6jbGg/bp44OhIwfbfFEA1RK4UJhHZTLgMMvDjgmuNTeDGW
 BZEi0x0nv7/LYygAJt4lvjC2xKkOe8A70+6jAJvvKKLV625bioEi/NqdHAxCUf9Thq02
 48zPjFXPICaq5kPTwKWYoQc7QrdwU6yVa9gSm5hwhl4u0p+cnA2XONgTaQ06I8uMHD7b
 gY1qX1nlJ0ZYefrYW6cJZTJV3YPU/AYnJc23pNUeNt3AHCF1IjFab23EdodFcslpXrcP
 rQ0hSMbblwtLwK6wWCuTqAAJQZ3bE6Mro1QexhtyUZS6bZ+TkRzoVEtbkZ/xW1ZN2AxJ
 VCrg==
X-Gm-Message-State: AOAM531yhy/vmU9pjoQm4z1gCdpU/JI2IGUj9SYluIKKK9bniZjZt9DC
 C1jyAnD1XMAP8so8OSTkUDJk5w==
X-Google-Smtp-Source: ABdhPJwmw6bZvj4D5y/EjRC8isYDtq+5t9VnX5sB/1Ie4Dv3J11RrhTkSP/tNUCvygOb6jp8J+DaKA==
X-Received: by 2002:a17:902:7c0b:b029:eb:24a:1209 with SMTP id
 x11-20020a1709027c0bb02900eb024a1209mr30305963pll.43.1618964366529; 
 Tue, 20 Apr 2021 17:19:26 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:95d2:8c89:b629:ff49])
 by smtp.gmail.com with ESMTPSA id d20sm145494pfn.166.2021.04.20.17.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 17:19:26 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v12 3/4] drm/panfrost: devfreq: Disable devfreq when
 num_supplies > 1
Date: Wed, 21 Apr 2021 08:19:07 +0800
Message-Id: <20210421081831.v12.3.I3af068abe30c9c85cabc4486385c52e56527a509@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210421001908.813625-1-drinkcat@chromium.org>
References: <20210421001908.813625-1-drinkcat@chromium.org>
MIME-Version: 1.0
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 fshao@chromium.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 hsinyi@chromium.org, hoegsberg@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GPUs with more than a single regulator (e.g. G72 on MT8183) will
require platform-specific handling for devfreq, for 2 reasons:
 1. The opp core (drivers/opp/core.c:_generic_set_opp_regulator)
    does not support multiple regulators, so we'll need custom
    handlers.
 2. Generally, platforms with 2 regulators have platform-specific
    constraints on how the voltages should be set (e.g.
    minimum/maximum voltage difference between them), so we
    should not just create generic handlers that simply
    change the voltages without taking care of those constraints.

Disable devfreq for now on those GPUs.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---

(no changes since v9)

Changes in v9:
 - Explain why devfreq needs to be disabled for GPUs with >1
   regulators.

Changes in v8:
 - Use DRM_DEV_INFO instead of ERROR

Changes in v7:
 - Fix GPU ID in commit message

Changes in v6:
 - devfreq: New change

 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 47d27e54a34f..aca3bb9a12e4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -92,9 +92,19 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	struct thermal_cooling_device *cooling;
 	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
 
-	ret = devm_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
-					 pfdev->comp->num_supplies);
-	if (ret) {
+	if (pfdev->comp->num_supplies > 1) {
+		/*
+		 * GPUs with more than 1 supply require platform-specific handling:
+		 * continue without devfreq
+		 */
+		DRM_DEV_INFO(dev, "More than 1 supply is not supported yet\n");
+		return 0;
+	}
+
+	opp_table = dev_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
+					      pfdev->comp->num_supplies);
+	if (IS_ERR(opp_table)) {
+		ret = PTR_ERR(opp_table);
 		/* Continue if the optional regulator is missing */
 		if (ret != -ENODEV) {
 			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
-- 
2.31.1.368.gbe11c130af-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
