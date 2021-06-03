Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B6439A3EE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 17:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935EE6F498;
	Thu,  3 Jun 2021 15:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306746F494
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 15:03:36 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id k25so4217778eja.9
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 08:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c2sMhn9FFyBCT6ijxYFstqFFhQ5iAR+T1N0Su8AmZKc=;
 b=b5YGKhW67xjkGqardlMLX0byeC1Hyh6KG+XBWd6aJg4q/02YB5hABUkP6RtJgcy9SW
 fTH71xqlrt5vu9rZqDoRbWmVf8ZlJQ5MxzdttpG2TBLLZVmIsyBV9Qzl9bh4rLJWEGE+
 USX+9Msqg+5S7cGjRlEtRnqlWMbVAGZkG+8MI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c2sMhn9FFyBCT6ijxYFstqFFhQ5iAR+T1N0Su8AmZKc=;
 b=e4uV0zudCzE7t2IkTdS0YtocwLuOV50CSJ2ioQqy35vXO0Ca2ym+y8hUjV11Rp6dSq
 50dpLVvNiEamn05GLlAPmNU2mUKbfyyGNtTbczoriWi5UBn0KWlBXjQcNnCAv8LDFUxi
 GhnpqzkBgB7wfz5V0gjw3RT9p4GAHvON1E3Dmvs9Rm0926AQsJ00+b2WXGJ2OvYZNZU1
 8BiUxObpX33MfFlJ1cE6NKVuoiuVrFI6NZkgmooAfcsvoy8jbNiMisQYXjdwkO/ZogYI
 vXjmYUXMnwwXJ+aVU1Ip0pfLqLYtn3TePwu5YrLdIDN/FWQe8Qzz5W4wPFgEuR6RXStc
 gp4g==
X-Gm-Message-State: AOAM531LlBgt3pcAwBM85mOnzXjN3Cv07Yrg+dcJ5E3am+K+uRpf9WxA
 Cyb2O+PystNFvjID81VdW25rdw==
X-Google-Smtp-Source: ABdhPJx3yZPNIGc9E+54yTxqnviDJ/6ql0UunR/RnTxUjYfQu8JPACwbGAyELgPfSP1+xUfW4uPwDQ==
X-Received: by 2002:a17:906:e104:: with SMTP id
 gj4mr42874ejb.350.1622732614813; 
 Thu, 03 Jun 2021 08:03:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id hz10sm1621791ejc.40.2021.06.03.08.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:03:34 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v2 3/4] drm/shmem-helper: Align to page size in dumb_create
Date: Thu,  3 Jun 2021 17:03:25 +0200
Message-Id: <20210603150326.1326658-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210603150326.1326658-1-daniel.vetter@ffwll.ch>
References: <20210603150326.1326658-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

shmem helpers seem a bit sloppy here by automatically rounding up when
actually creating the buffer, which results in under-reporting of what
we actually have. Caught by igt/vgem_basic tests.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 32f1d7601ec6..2985744b4300 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -506,13 +506,13 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 
 	if (!args->pitch || !args->size) {
 		args->pitch = min_pitch;
-		args->size = args->pitch * args->height;
+		args->size = PAGE_ALIGN(args->pitch * args->height);
 	} else {
 		/* ensure sane minimum values */
 		if (args->pitch < min_pitch)
 			args->pitch = min_pitch;
 		if (args->size < args->pitch * args->height)
-			args->size = args->pitch * args->height;
+			args->size = PAGE_ALIGN(args->pitch * args->height);
 	}
 
 	shmem = drm_gem_shmem_create_with_handle(file, dev, args->size, &args->handle);
-- 
2.31.0

