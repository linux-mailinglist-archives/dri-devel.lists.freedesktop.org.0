Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 300073A29EA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 13:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2696E1DE;
	Thu, 10 Jun 2021 11:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6A96E1DE
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 11:11:02 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id l2so1823925wrw.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 04:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ky5Kpe2t4rqcmS1P6ETrRh0lq4Wv9QSSmNhBLDEJIys=;
 b=D6jPESI+fdTnPeqy4l6ZRgQBqKADAKLBQpp45BfUI7bivF6mI+Jz8jnOt0NoHBBqqT
 KKSmmmT6RZ0yT4c7OV89MUrxDLUjf5WMn9ksyFYVBifJGqrtUOwipO4u0scKAWMrx+/g
 qeDV8ZNsd488aUVL8nFKZhImEfE+QDQMdHAy6WlmPBPHmx5kvuMnnRBCvJlA+r8c9hM4
 +UEJObkmxPiw4e6R0bJ91xJnBCR3BDq5hwk6M8CyzSmqouFvkiDzPf6hGmTUYqe4hZlL
 0xIvw70ivrNwj7SGd2MIkWcObHxqgh9nf9l9GnN8pI6qLjq/4WfQZjsppHwSgWB0QCOE
 JT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ky5Kpe2t4rqcmS1P6ETrRh0lq4Wv9QSSmNhBLDEJIys=;
 b=If/qSlXSqvxVy2zK0uBRla737aURaAb7/SVbmvkbFiA9rVrCh3MzQN8dOCwYYlay26
 zqTxjcM74aEKQvNKpkuGckB6NLqKXot63AB1HWMY6omDnwx4AHlDSGM7mwBK7zKL7E91
 chAjueMi1TuJpWbsldUbxaQ/Q7EedHqNIrUT2PqqP7sDxG7JSLgbTTiNNT8X8apH+0+H
 5vYcC1qDBkFoGAL/IEFYMkQ50GGZPnOrT3NXIui69PdleXyr4dq/YOfb3dsflvDq84zu
 eFQiNYQeTjSc7t7XSpidQKGI8QVzB4ILbhvSXnOBQlNFqoQ23ALP5BEcQFEQWMDXvgVm
 IcWg==
X-Gm-Message-State: AOAM533zC9u7yR/n2QDgqn1nXtPFuwUltLL6jf1FImNT7XRy7yHd/HXK
 kwmJ+DRFMQV5y7yKCy/idPkP+haSEMQ=
X-Google-Smtp-Source: ABdhPJzZgxMbUZE+KBsfi93X3f0Ey2WaV6IOUJbwff2+73t/W8pR0UyMRd/xKmFc9Z2ufpsupc98iw==
X-Received: by 2002:a05:6000:184a:: with SMTP id
 c10mr4697238wri.232.1623323460251; 
 Thu, 10 Jun 2021 04:11:00 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id i2sm2533106wmo.40.2021.06.10.04.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 04:10:59 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/arm: malidp: Use fourcc_mod_is_vendor() helper
Date: Thu, 10 Jun 2021 13:12:35 +0200
Message-Id: <20210610111236.3814211-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610111236.3814211-1-thierry.reding@gmail.com>
References: <20210610111236.3814211-1-thierry.reding@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Rather than open-coding the vendor extraction operation, use the newly
introduced helper macro.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/arm/malidp_planes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 8c2ab3d653b7..0562bdaac00c 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -165,7 +165,7 @@ bool malidp_format_mod_supported(struct drm_device *drm,
 		return !malidp_hw_format_is_afbc_only(format);
 	}
 
-	if ((modifier >> 56) != DRM_FORMAT_MOD_VENDOR_ARM) {
+	if (!fourcc_mod_is_vendor(modifier, ARM)) {
 		DRM_ERROR("Unknown modifier (not Arm)\n");
 		return false;
 	}
-- 
2.31.1

