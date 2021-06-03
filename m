Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF4C39A5F9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 18:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0466F4E1;
	Thu,  3 Jun 2021 16:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7576F4CF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 16:41:23 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id f2so6491348wri.11
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 09:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pnUIa0sFyDkR/8t0TailNKYrmyNBbS9VS6vHPr+XJFM=;
 b=Aa7AZGtw63BnkaMzv6wcrRiI+/ZHWYm+GBIdIGkUYQ0xUnIlkN9wjTywEz4cVTRhqV
 Jadm7zaJVtCW7YAUHtMJeZIjVyzVO0zs7KxB/cDeBF9QvU79ks1AjFFcBLaA7hOS+6wu
 7LijeKsrhygvieIIb6URYzDI+TbdMychlzrAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pnUIa0sFyDkR/8t0TailNKYrmyNBbS9VS6vHPr+XJFM=;
 b=q/Ic75Ksi5Ku/6PSGFL/ZLC40WGP/5uuQUH8deDjGtfcO3MXfNC/qcPTLdSUhhMxJd
 MwE1iDiKfjZcJdOmrgmIxTn0UL9YFMUVstURg0KaHUwCodDdTrFiBxI8hJ88lqgf2MHY
 5u9TzMbkTN9TQ2c9yokxqad4wmsv+ZcwXnIURi+n5hBqOGe5ZlyaWCjbfPYKSdv8iNfY
 gV2c093PVxGoC61rCXfaARhwrFmI57zjksbWhVWl8ZKONFqv+tuy4OheOe6pWvLW1oMG
 ptY4P72t4PlFn++ly2J3ATlMWFS5JKPwJ3lCanNzJPVTIKPmqpbAcOvglmnP9SWsRwHi
 wsFQ==
X-Gm-Message-State: AOAM532PaSiBWzfVs82ea3m4eEMpYSVQHnUehjF7Yi5kpLUjMvFLlyvE
 AuGAsUdHTZOLtFgk0/RnYjZF+w==
X-Google-Smtp-Source: ABdhPJx2EW93bSROSlwL/SPbtZuKGb5rUHHCkWPYvtz96a8qSRqJB48oEvTXkZHA8oMhCV/36GSEuQ==
X-Received: by 2002:adf:ea4c:: with SMTP id j12mr856222wrn.64.1622738481941;
 Thu, 03 Jun 2021 09:41:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s28sm4992683wra.54.2021.06.03.09.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 09:41:21 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v3 3/4] drm/shmem-helper: Align to page size in dumb_create
Date: Thu,  3 Jun 2021 18:41:12 +0200
Message-Id: <20210603164113.1433476-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210603164113.1433476-1-daniel.vetter@ffwll.ch>
References: <20210603164113.1433476-1-daniel.vetter@ffwll.ch>
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

