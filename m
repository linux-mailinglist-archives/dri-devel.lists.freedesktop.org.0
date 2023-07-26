Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFA5763FF8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 21:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573E810E4BA;
	Wed, 26 Jul 2023 19:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B4610E4B9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 19:53:30 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-767b6d6bb87so14112185a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 12:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690401209; x=1691006009;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zKHidkh8ZdWvxzD0mo3s1bjGGnjJRCgOsDmvC2VyjkA=;
 b=HKNcliHHaStZU7lXLGoUoI0NXRX5/kXgIfzxpyS8dJzfhn3Kczh5+aW9zG5dQQCqYU
 FkgueEj+2sSFQRTUFIIhitqa++n8ITJsFarRpSzaFqxKq6SdPP9dbnqVPjsw52HRitjh
 pfoj6z8VGNoRphf6x9zQ0ulQGI4vzndRT0j/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690401209; x=1691006009;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zKHidkh8ZdWvxzD0mo3s1bjGGnjJRCgOsDmvC2VyjkA=;
 b=YyHbOdE2VQ0cQBgPBMGIk4nw43ifrguk9bBfw2xC+o+1wCD8kStAEL4c46njdiNWzE
 QHhBl0xDHY/isVzHHiGpYt4qNTZg8fNVpLIUYYqrfjOPJ85Kta2sAEn9TqVY286yKWQ9
 XrvsFH/sFTmJWmPFOpoVIQF8aGYNNz0OjAyBi4A0uerW3i0HYeSRyek2hE0QCZi8WarV
 VkGrfdW5CfxmIYs257WtPa5BTsJa+b1kCm36IuT/80xzF/92aS/b78NXiXsvWbgytwIl
 hUMEJ+SEdE1FQ0QfzPzL++nJY/RKXJWl3JIKDzfXD42qrnpi8jDq/PzLQ8onwPovOjvy
 hBOQ==
X-Gm-Message-State: ABy/qLaAVp/564O9LcFBAWsl2WnjuvRszXp7zhPJtuy2oEu6g4D0jbTg
 JM81JdLiRrl02Vd39l8aHoukoA==
X-Google-Smtp-Source: APBJJlGoGy6HUnXCkuS5WXnhtOwWyhLYYQssZObAOiKcA3WK5jHtODnzGfK2alDLktwPF4vcQmrmRQ==
X-Received: by 2002:a05:620a:45a5:b0:766:68cd:d9dc with SMTP id
 bp37-20020a05620a45a500b0076668cdd9dcmr3069449qkb.19.1690401209375; 
 Wed, 26 Jul 2023 12:53:29 -0700 (PDT)
Received: from greenjustin3.nyc.corp.google.com
 ([2620:0:1003:314:f6f2:a0c:f40e:3570])
 by smtp.gmail.com with ESMTPSA id
 o9-20020ae9f509000000b00767db6f47bbsm4570689qkg.73.2023.07.26.12.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 12:53:28 -0700 (PDT)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/mediatek: Add valid modifier check
Date: Wed, 26 Jul 2023 15:52:32 -0400
Message-ID: <20230726195232.1369289-1-greenjustin@chromium.org>
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
 fshao@chromium.org, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 wenst@chromium.org, angelogioacchino.delregno@collabora.com
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
Tested-by: Fei Shao <fshao@chromium.org>
---
v2:
 * Replace zero check with comparison to DRM_FORMAT_MOD_LINEAR.

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index cd5b18ef7951..2719a1e3163a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -51,6 +51,13 @@ mtk_drm_mode_fb_create(struct drm_device *dev,
 	if (info->num_planes != 1)
 		return ERR_PTR(-EINVAL);
 
+	if (cmd->modifier[0] != DRM_FORMAT_MOD_LINEAR &&
+	    cmd->modifier[0] != DRM_FORMAT_MOD_ARM_AFBC(
+					AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
+					AFBC_FORMAT_MOD_SPLIT |
+					AFBC_FORMAT_MOD_SPARSE))
+		return ERR_PTR(-EINVAL);
+
 	return drm_gem_fb_create(dev, file, cmd);
 }
 
-- 
2.41.0.487.g6d72f3e995-goog

