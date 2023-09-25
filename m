Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 728367AE687
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 09:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D0910E366;
	Tue, 26 Sep 2023 07:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0831B10E220
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 09:23:12 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5043120ffbcso8537036e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 02:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695633790; x=1696238590;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IDyabU/ctSGF4K3dTAmchO6EjvdapGJuzpqjXfhEki0=;
 b=ClxtP1PwxPYlcmiXfH5XNb17L0ERriQWk8RYNT3SGP1e4Pfy0KA/hMIkFuqbykERLx
 qKv5IKHz5n3gWPa2c+6etqEJAi9C76xKnDpadxkPMUvjBdBSRqiQxdN7eC9KJzWQhxc7
 xiDhwZ2JcpUiVucTgZFSrVEKplNn8Ag5nvIiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695633790; x=1696238590;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IDyabU/ctSGF4K3dTAmchO6EjvdapGJuzpqjXfhEki0=;
 b=cj81yzaqPWPeiKICb0dUCtSPwTVy6B5kuEldshlPd39hFaucAZ6dQGMFHSw/m1Eeww
 WvtOP+VfY4Yy32Se0uJjo462kVanyR/7k3Pdu9pV2eePYAUU+PbJJ9cWLL188tT41xr7
 m+/TssrmWf1GclMXYaGQ/tQqVn+Ho/XoX6TJJU+sGy2wdZu0Uh2/hgiZLwr4ITZ05Zvq
 boCPG520TQHiiHjgrl/Sz3IErN+p0hNAlOrXYdxjSfXbFJLan/rEWPYGmNI8jgKIwLn+
 nn8t4V6dlT90HWDtKnzluBOVX3auVzfCbTWa3ICvmQdpnxIT3WvTjq6hL+tFi5jw6b4g
 Z3Wg==
X-Gm-Message-State: AOJu0YyPkxsbJr9VDjSEq2hIrVUMv0RZ+WtrdCHzJCJtxAt7Q3pR7q7e
 0iADNAWhjWyPDx/BhnfIrr+onCKv02rBeCh3BvoCh3so
X-Google-Smtp-Source: AGHT+IFdJhgh0QBpQXEzpkLS8WILLnuoY/8uaH456FPwyO42nXmJ7Ufixv3ar0REWsyD1mqtS+FBRg==
X-Received: by 2002:a05:6512:b0a:b0:4fb:9fa7:dcda with SMTP id
 w10-20020a0565120b0a00b004fb9fa7dcdamr6155313lfu.26.1695633789773; 
 Mon, 25 Sep 2023 02:23:09 -0700 (PDT)
Received: from elfwind.c.googlers.com.com
 (49.240.189.35.bc.googleusercontent.com. [35.189.240.49])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a05600c320500b003fc0505be19sm6494837wmp.37.2023.09.25.02.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 02:23:09 -0700 (PDT)
From: Hubert Mazur <hmazur@chromium.org>
To: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/mediatek: Check GEM buffer size
Date: Mon, 25 Sep 2023 09:22:49 +0000
Message-ID: <20230925092249.2228743-1-hmazur@chromium.org>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Sep 2023 07:15:08 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, upstream@semihalf.com,
 Hubert Mazur <hmazur@chromium.org>, Daniel Kurtz <djkurtz@chromium.org>,
 Michal Krawczyk <mikrawczyk@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The buffer size is derived from parameters supplied by the userspace.
Having the size equal 0 causes allocation failure leading to kernel
panic.

Fix this by checking if size equals 0.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")

Signed-off-by: Hubert Mazur <hmazur@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 9f364df52478..3b985b99d5c6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -62,6 +62,11 @@ struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev,
 	struct drm_gem_object *obj;
 	int ret;
 
+	if (size == 0) {
+		DRM_ERROR("Invalid allocation size: %zu", size);
+		return ERR_PTR(-EINVAL);
+	}
+
 	mtk_gem = mtk_drm_gem_init(dev, size);
 	if (IS_ERR(mtk_gem))
 		return ERR_CAST(mtk_gem);
-- 
2.42.0.515.g380fc7ccd1-goog

