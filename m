Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2778A72EBC0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 21:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B73410E108;
	Tue, 13 Jun 2023 19:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6E110E108
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 19:16:41 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-75d57fdb014so126398085a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 12:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686683799; x=1689275799;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0hYwtqaQQRHjpNuj/nxNqpY0yf71VBA+zkmwdqqUX6o=;
 b=H8EJXSHws8zm9kIewiifo1LA3ax7uRVQpfOId73dGmjryLpcj/XnYW9DP8LTmyhakA
 ib5f2VBNqsEVxM1Fz05aOdjp5eSyo9Cz7cbIkVLL9HPog9vrpW6G5qytbxCh7J+57YZ5
 liQ1xYjIRfWafCXado7xnM1nRufYj+gbr4i6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686683799; x=1689275799;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0hYwtqaQQRHjpNuj/nxNqpY0yf71VBA+zkmwdqqUX6o=;
 b=LxM1ZQq9iHPdf8dSc25EbS7u5yk2d66swF7/NUVPf5cVofoGOJnj7BQAqzNPo5Lg1A
 4ONVS6RebFqQCVAAbLgYrI+6IPzGTF0FeQw7n+mM1Mmzbhri+Oy3FsukWShdbEOOtWGD
 JGjk2WzGz+lIn0QZ4aeYxJNTv3V64enNgYmpund5o4gvt61kxIOkGTzX8ZzDE1NKLNhG
 /f6IWNkC9StHeRsaz90ldJlLxkIAnfovsbubws7UI4k82EqcdZJhZAPtxM4W4+XRuAvh
 qxz7zyMabR9ybmB8jvQUl7kGPcvcFKFenN0BMBUFcRD4fAj+fP/gj6SePrYHJMavgxle
 GZkg==
X-Gm-Message-State: AC+VfDyRzodbHZbpfC80/dtePwoQ/tj5NOIrA4EpWGNPUNf3WAyw8W+c
 CILMG+VvoSh2FqGCjOx1PAo9pA==
X-Google-Smtp-Source: ACHHUZ6TaXLZNDplHIuK7XQXb4GDbcXvctn2j9LDSd+G6nOLGGH+VZXwJFIQ4om2hgQN1DfNIez5IQ==
X-Received: by 2002:a05:6214:ccc:b0:628:2d00:5301 with SMTP id
 12-20020a0562140ccc00b006282d005301mr16562898qvx.39.1686683799523; 
 Tue, 13 Jun 2023 12:16:39 -0700 (PDT)
Received: from greenjustin3.nyc.corp.google.com
 ([2620:0:1003:314:44d0:cf9e:a63b:ca67])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a0ce3c9000000b00628563d4441sm4098330qvl.66.2023.06.13.12.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 12:16:39 -0700 (PDT)
From: Justin Green <greenjustin@chromium.org>
To: chunkuang.hu@kernel.org
Subject: [PATCH] drm/mediatek: Add valid modifier check
Date: Tue, 13 Jun 2023 15:16:17 -0400
Message-ID: <20230613191618.129331-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
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
Cc: Justin Green <greenjustin@chromium.org>, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org
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

