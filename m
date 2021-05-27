Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C8039308E
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 16:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19656E908;
	Thu, 27 May 2021 14:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1E36E908
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 14:13:48 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id m18so65987wrv.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 07:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pnUIa0sFyDkR/8t0TailNKYrmyNBbS9VS6vHPr+XJFM=;
 b=MI7QJEfekx+QOGzsIRRMyARl32XRuIdsycWLVXL35+vdS0IOKThdyvOYPOcyh3h6CS
 V6wts5tPvyS04l/g09jcS30fVsupQtgT8iyJXgm0vA1WPEJxC07wSsQ4FW+8J23U2E+o
 hOkYC03h9qs7Hfbc4GLR8qyjgq34V/N1I4GlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pnUIa0sFyDkR/8t0TailNKYrmyNBbS9VS6vHPr+XJFM=;
 b=UWLFxMOKVw3SjRpESG0irTEWgtdamHYvCaRXaDNy6SsbGwg7iDtRTnN8ahGemWwvXz
 GsarkTmGYaeG4UrxWp6kBnE8A6kdpHzs85LD7nayOP7DUrEMHiRDm6NybLF82tAEEbiK
 DQE5l+EchQloMzbX42kQcgYLRp5PUHY5wEHZvyi9c64AiCDLb8zZQWZteUcTTbjVEXKI
 LsJ21ccP0O4+8tbQcy2ZM9hI6qNiAZhPGY07gFIDrpE6kOL7fhsiCrlPedK7hSQwJZTV
 gjQaxMuboN00R5F0sbdWwoCWxJ7mC5x0y3WL4coSDF5MCCHZD4DbHf7o1RDD33k2VgBH
 wavA==
X-Gm-Message-State: AOAM531A/rV/IUBfHmJ50ea2FW9Jd5VK9EmZQ5B9ysR4V50/GVbYwnfa
 2b4UFvXeaiXiOOzcWsofbu3wIw==
X-Google-Smtp-Source: ABdhPJwr8pdYAXi2FwDiQGlig3DAKuKdotHAwHRhdVdm/7T5zqMiQbXrxQQ/VdnSdhmO+dMcNSy+FA==
X-Received: by 2002:a05:6000:1368:: with SMTP id
 q8mr3673941wrz.342.1622124826789; 
 Thu, 27 May 2021 07:13:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x10sm3381136wrt.65.2021.05.27.07.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 07:13:46 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/shmem-helper: Align to page size in dumb_create
Date: Thu, 27 May 2021 16:13:37 +0200
Message-Id: <20210527141337.3857901-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210527141337.3857901-1-daniel.vetter@ffwll.ch>
References: <20210527141337.3857901-1-daniel.vetter@ffwll.ch>
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
index 11edd54f0580..296ab1b7c07f 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -505,13 +505,13 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 
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

