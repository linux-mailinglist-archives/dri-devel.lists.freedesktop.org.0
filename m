Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 330158755B7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 19:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1096210EAF2;
	Thu,  7 Mar 2024 18:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="EwS29efl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9601910E78E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 18:01:02 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7882dd2b1c9so95152785a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 10:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709834461; x=1710439261;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jRG/YqmHFlWDrNbOjxutM1RemaGj2evaTF8++ZPF8MQ=;
 b=EwS29efl1H84wujgrk/+35oOQj/7h6XXZ2p1h3QR932YODeJFGJZ5q/5IAESmeWW83
 a3bCTmRhenaAeQOasnmzuscdTn4a1e9MQFu6GPlODAN4T4lEuVmx1QrQ0ImjflO8aG4H
 mzqEtr4NF5cCmmdaawXwKdIQaYOwwVmIgT2hQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709834461; x=1710439261;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jRG/YqmHFlWDrNbOjxutM1RemaGj2evaTF8++ZPF8MQ=;
 b=hOXeBe/d1cvPRaTSMWnT/HGq9Pr30JXyjo01O+7S4Y8GU9oX5n537rCqLeZdOUcg5K
 ZT1cNYTzp/rJ5luaG6VkBAKDHfVxBUSZacnD3MuPBKpwTrKjbZqM0din91da+AG42duJ
 kyYDL8t69Wmi2txC+TiiAdR3hAysUEicw3gtsi03gTwz3HSS1cSKPxr6R1WTTY8LSDni
 vxyj5lpB97OJbUThADUTvuT6s6swI1NMXDbhAsQoh9djHqxDqozOjDGtk40tsv9/Eddg
 qTZ32KU6pi2vR8ascAZy6VFvNpcJlz2psbVdrQKgzWy8EHWKY+9UL04EOvyPYoG584C8
 E67A==
X-Gm-Message-State: AOJu0YxDWp3Je+5U9mHYLiH5KLtkeQ7+MeqABI1ksj/UTCsf2KbeVL/l
 S/aaiRSlz5EB7+faybPC5vBVmmOE3yMIZSfW0DnTpIZhaJRv0Vm2HXg8XYWnrg==
X-Google-Smtp-Source: AGHT+IGW3tqY7OGYR19Ma9Zb70i2KwijogurTQ2heISkKZ5PCaoaaPJpEkpxUwrfWzzei7FKIaPnpw==
X-Received: by 2002:a05:620a:1377:b0:788:1679:3378 with SMTP id
 d23-20020a05620a137700b0078816793378mr2768489qkl.15.1709834461151; 
 Thu, 07 Mar 2024 10:01:01 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com
 ([2620:0:1003:314:b1b:3408:6f14:8be5])
 by smtp.gmail.com with ESMTPSA id
 25-20020a05620a04d900b007882528475dsm4880997qks.49.2024.03.07.10.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 10:01:00 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, chunkuang.hu@kernel.org,
 fshao@chromium.org, angelogioacchino.delregno@collabora.com,
 Justin Green <greenjustin@chromium.org>
Subject: [PATCH RESEND] drm/mediatek: Add 0 size check to mtk_drm_gem_obj
Date: Thu,  7 Mar 2024 13:00:51 -0500
Message-ID: <20240307180051.4104425-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
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

Add a check to mtk_drm_gem_init if we attempt to allocate a GEM object
of 0 bytes. Currently, no such check exists and the kernel will panic if
a userspace application attempts to allocate a 0x0 GBM buffer.

Tested by attempting to allocate a 0x0 GBM buffer on an MT8188 and
verifying that we now return EINVAL.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Signed-off-by: Justin green <greenjustin@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 4f2e3feabc0f..ee49367b6138 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -38,6 +38,9 @@ static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
 
 	size = round_up(size, PAGE_SIZE);
 
+        if (size == 0)
+		return ERR_PTR(-EINVAL);
+
 	mtk_gem_obj = kzalloc(sizeof(*mtk_gem_obj), GFP_KERNEL);
 	if (!mtk_gem_obj)
 		return ERR_PTR(-ENOMEM);
-- 
2.44.0.278.ge034bb2e1d-goog

