Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C373874172
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 21:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C063A11352D;
	Wed,  6 Mar 2024 20:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="e5he3mew";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E236811352D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 20:37:11 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-5a14dfa68eeso60811eaf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 12:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709757431; x=1710362231;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=awa1dQXZmpY5VwV6yZnL1TS+1i6+6YFAvsCFb4B//5A=;
 b=e5he3mewvo+zA+7iq73jCxHtEdQk2HncMNRoEipmy2e8yr/hhtnPd2xs8s3/Mk86oV
 sTOmS000fdmeLjBl3L/noHo4ZZlW3iwAXMMT5lNUcOWsXZ/+VxkpK/VsukQEXXQuqyQb
 RH9LywxqXepoZFwb51fufCNp8iiIjO+AU618Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709757431; x=1710362231;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=awa1dQXZmpY5VwV6yZnL1TS+1i6+6YFAvsCFb4B//5A=;
 b=El/UxWAxXgGaXQTzEuAiTOEquarMOoQiPzM9EyOJPrrm99PUEBYou+B2sbSGQElZbf
 N2gEdOstsHyL4KmC0NfeWiD51NF5kBTqw9K/aaFKOH1hxjiVyWgiSy65cLLukgjgWytc
 k3uRjuGS5DNgN/XSl0ttM7oloUFy0lnfZim39Ud2+cdY/gH86Ifa8WUbw9HrdNTfRjQI
 la+CuGssmO3sbjZZQRuNj+bSM2iFuYIEyEyiNaAO0YcOtcIm2nbWzScoXuwIM+jAROAH
 tUVP1VHsIZHxuAhoWIpkAjjMFcYMVEnCrxZ4eBzPb9CyiS71yLwspupjSnwAY9MMR6Qg
 RhOg==
X-Gm-Message-State: AOJu0YzzXh8NS1rBG0zUwmfxxJlxQTA4zoRk2C7N+m7koFfK+bHctiuJ
 7sScq7SjvjdZdo2koTwDtDxCYV9N6etrsFIFN6yqaAs6LxKRhqTTzepAAMdmY/5kP9AYbmsAVeY
 =
X-Google-Smtp-Source: AGHT+IHN/Wg36ruErxYWj1YUE8/W5ZbCAiEK4i9KqiK0BiH5Rh+ZCVJOegwQRIXPbUka2mryiijX0A==
X-Received: by 2002:a05:6358:649d:b0:17c:1b81:136f with SMTP id
 g29-20020a056358649d00b0017c1b81136fmr7025517rwh.32.1709757430926; 
 Wed, 06 Mar 2024 12:37:10 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com
 ([2620:0:1003:314:259f:7f7f:41a:9afb])
 by smtp.gmail.com with ESMTPSA id
 ay12-20020a05620a178c00b007884435812csm337535qkb.54.2024.03.06.12.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 12:37:10 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, chunkuang.hu@kernel.org,
 fshao@chromium.org, angelogioacchino.delregno@collabora.com,
 Justin Green <greenjustin@chromium.org>
Subject: [PATCH] drm/mediatek: Add 0 size check to mtk_drm_gem_obj
Date: Wed,  6 Mar 2024 15:37:02 -0500
Message-ID: <20240306203702.3924719-1-greenjustin@chromium.org>
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

Signed-off-by: Justin green <greenjustin@chromium.org>
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

