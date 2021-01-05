Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F13472EA151
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 01:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD056E041;
	Tue,  5 Jan 2021 00:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BF96E041
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 00:11:45 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id g15so20130767pgu.9
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jan 2021 16:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OIB6bT25HUqJVnTMzY287Rsm2RovoewYK6tMaHbCshA=;
 b=gc4pGuHXHF8BYV9xB2luMT/mFtJhijVhaJHksLzP4ALZI4HEIjhIVSJfe/byXS8kZk
 IDmoGY1YlDdO744rrChNfBZVA9AO+k0ZArjBEAPyA2/J5PbVhaxh0gIUAuvnE8uDadpg
 th9TfxhxM4rE5Ts7j12KEt0CacR1ihte7rGnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OIB6bT25HUqJVnTMzY287Rsm2RovoewYK6tMaHbCshA=;
 b=CqCTBMpTKkXL69T39Ng3lo5aC98L94nXw0GoE0hLr097FsPJfBHpfQ3TJIiYe+eN9y
 ExkedBZcn4Bc5xDX5LZe+89THT4NSZIJWoFHIcK7btnZCC7PMOpK9gw2/iTJV8rPXOgj
 IZsgZjcCTOSkPKs13QNCK11yvtvD5rq08xy6HaunL2OyUyvlKwdGnnrw9jVI+Y9/rDRJ
 /WhaRaCvm5BOznp3eJNZDhL/D6O9Cf9bkWPWCeXO9kMp8pqbltPmqSpN/3a5TLOpSVvO
 Y1cDTGK4LhqfLx0l52sfz7oDs0OdikEWKCUWDNgHNEgj3gc+N+5TJLEBGKxchZO2uUne
 DuhQ==
X-Gm-Message-State: AOAM532qfHDqkPY8f7fgdMpA8emL7NUxKNe4vgOKqEMB3mVx4x7Qjuxp
 3HG8ANwQ1AouYKo2ZjBjuzu54Q==
X-Google-Smtp-Source: ABdhPJygn8Trt4FhsEdC6+CrgPKLQYPFisrwJtf18NFu2Rgv3PBFRPJheJ+dCwDpD/J/+cTTNCiS4w==
X-Received: by 2002:a63:af50:: with SMTP id s16mr74141717pgo.448.1609805505588; 
 Mon, 04 Jan 2021 16:11:45 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id bf3sm465620pjb.45.2021.01.04.16.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 16:11:45 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v6 3/4] drm/panfrost: devfreq: Disable devfreq when
 num_supplies > 1
Date: Tue,  5 Jan 2021 08:11:18 +0800
Message-Id: <20210105081111.v6.3.I3af068abe30c9c85cabc4486385c52e56527a509@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210105001119.2129559-1-drinkcat@chromium.org>
References: <20210105001119.2129559-1-drinkcat@chromium.org>
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
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 hsinyi@chromium.org, hoegsberg@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GPUs with more than a single regulator (e.g. G-57 on MT8183) will
require platform-specific handling, disable devfreq for now.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---

Changes in v6:
 - New change

 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index f44d28fad085..1f49043aae73 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -92,6 +92,15 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	struct thermal_cooling_device *cooling;
 	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
 
+	if (pfdev->comp->num_supplies > 1) {
+		/*
+		 * GPUs with more than 1 supply require platform-specific handling:
+		 * continue without devfreq
+		 */
+		DRM_DEV_ERROR(dev, "More than 1 supply is not supported yet\n");
+		return 0;
+	}
+
 	opp_table = dev_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
 					      pfdev->comp->num_supplies);
 	if (IS_ERR(opp_table)) {
-- 
2.29.2.729.g45daf8777d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
