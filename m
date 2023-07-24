Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4B875FEA3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 19:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601C810E34D;
	Mon, 24 Jul 2023 17:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6DD10E351
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 17:58:57 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-635f48814b4so22533496d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 10:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690221536; x=1690826336;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0hYwtqaQQRHjpNuj/nxNqpY0yf71VBA+zkmwdqqUX6o=;
 b=ZtiCkMRToTcWl3ln5tiZtERmjzvDya7wHzLnSkoFDVyOs8Iu2FfhXqtkpLVlDQsG1c
 7VF1k+kAe65ce5JgsfIlRYOjQUQjlapvbByklyqAWqjWcjqzHXaBt5rNYyqK539QsGEF
 21SUSrd7bM63A0VF8FeOLncawE+xjXhcrXn10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690221536; x=1690826336;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0hYwtqaQQRHjpNuj/nxNqpY0yf71VBA+zkmwdqqUX6o=;
 b=hlmS+LpLBjRXnuGsMrYpZa34A0wtWlvViws/A3t5YZNpxId50yiz1zpdgRnIeWwoPh
 63A9bcJSEOIhIV4ZU00nIpNMgP+ICMwneqyiQHDTLiiSU4/0pzubxNoDF70dsJgORII/
 FoqLm/Dzs2/ugBs+mytgU0aaMPH3Cvyfn+Io3BZzkkzg6eRin2nciVVAhjc9ZdqD9d/K
 hMLdmdNHaNRZjALZBOKQtfMUJbIbcmM9cbk6NbwA3hPQzh28c23zCnFYGHety3VYzJut
 Rhs4d8uFi1AVehKOY+hoPKc4AId2cVdL79GKCbECylI+YQC2GDZtQeJGDk+4j0RJBG3h
 NFbQ==
X-Gm-Message-State: ABy/qLYOdnGamXqU1eskIUK2bHKLZaEoSgh9KOjHGXb5tyh52MWp9MsB
 fLPZ42G+2RDYBXyHRE033IUZIQ==
X-Google-Smtp-Source: APBJJlHFz3fuAHrBbwCgtd5velI3s9gljIPxkDNwXxnGrhqzW2SHoTFUWWWQsodZ2VKRbVzpojYVQw==
X-Received: by 2002:ad4:5cc8:0:b0:625:aa49:19f1 with SMTP id
 iu8-20020ad45cc8000000b00625aa4919f1mr637809qvb.62.1690221536262; 
 Mon, 24 Jul 2023 10:58:56 -0700 (PDT)
Received: from greenjustin3.nyc.corp.google.com
 ([2620:0:1003:314:610a:ddc2:a6ec:9fe7])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a0cf40e000000b0063cf8ae182esm1470939qvl.60.2023.07.24.10.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 10:58:56 -0700 (PDT)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND] drm/mediatek: Add valid modifier check
Date: Mon, 24 Jul 2023 13:58:39 -0400
Message-ID: <20230724175839.675911-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
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
Cc: chunkuang.hu@kernel.org, Justin Green <greenjustin@chromium.org>,
 jason-jh.lin@mediatek.com, justin.yeh@mediatek.com, wenst@chromium.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a check to mtk_drm_mode_fb_create() that rejects any modifier that
is not the AFBC mode supported by MT8195's display overlays.

Tested by booting ChromeOS and verifying the UI works, and by running
the ChromeOS kms_addfb_basic binary, which has a test called
"addfb25-bad-modifier" that attempts to create a framebuffer with the
modifier DRM_FORMAT_MOD_INVALID and verifies the ADDFB2 ioctl returns
EINVAL.

Signed-off-by: Justin Green <greenjustin@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index cd5b18ef7951..2096e8a794ad 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -51,6 +51,13 @@ mtk_drm_mode_fb_create(struct drm_device *dev,
 	if (info->num_planes != 1)
 		return ERR_PTR(-EINVAL);
 
+	if (cmd->modifier[0] &&
+	    cmd->modifier[0] != DRM_FORMAT_MOD_ARM_AFBC(
+					AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
+					AFBC_FORMAT_MOD_SPLIT |
+					AFBC_FORMAT_MOD_SPARSE))
+		return ERR_PTR(-EINVAL);
+
 	return drm_gem_fb_create(dev, file, cmd);
 }
 
-- 
2.41.0.162.gfafddb0af9-goog

