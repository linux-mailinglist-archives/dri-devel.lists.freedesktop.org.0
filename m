Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0A335DBC1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 11:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9F86E3E5;
	Tue, 13 Apr 2021 09:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E476E3D8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 09:49:46 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 o9-20020a1c41090000b029012c8dac9d47so897151wma.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 02:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gwHzUDNZVp2wEYlqxQZ6iUtDyBjLy7nUegflHoeCCQU=;
 b=WsnsVFnnw18rtpTTkaKgaUTVo2knqSbUw+1HAXzn6hDBHVVivOqZ07j9rj7Ac0AJxS
 FCLzmQNZUYVQq5BBIcab4BhBBgen4wuNGO8jKPS74ad7D7NY8EUvS5O8HE9LPFHm4wtk
 TQet8D2NJJH7Pus6SSfBbigL2zMINFLZCASZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gwHzUDNZVp2wEYlqxQZ6iUtDyBjLy7nUegflHoeCCQU=;
 b=GjJe6pV7HS26Ke6aHVzHEYCvjmyZiKMk0mEVwNNDw15e6KYCWLK57BSJK68sc4H4ED
 jpBeV39fAtH72stG0oA34fZNjzJI9h2C/KUtmljDnnMFlCiBjIQ4hv8CzTl7mc30tgkP
 jQARey8fhH4uymYUerB4XpqsGVRc+vDKtzDlZN3Mx2z+hPiafpGxmMwDAXDyCNJFzD1T
 GDPCL9sUoe3DiU3PVC0hFS2tQqxdIfjwq9+kvz/4EKhasjc0JHl2rJt9TRshbyp9ExCk
 5FDvVnB/HzGHEMQhMM0dNtFeQ4pjcjYhjW4R9IgVFVs/CL6thuxcSXDRmNfGyVwg6bQD
 56CA==
X-Gm-Message-State: AOAM532uFLYrSK4d7fMGovTIey5m4oAA5wxla4xZK1fOVBc7blf9eXnc
 eVCtXs8wD5uKqaE4Fo/OlcfcQR0Wol3cJQ==
X-Google-Smtp-Source: ABdhPJzaRamoYmdzxqDGLfQNgna+K/MAzd/DUmyyOGXLev1lzbvWBKdxyY3YqYxMb9pxt8WhhtFiOQ==
X-Received: by 2002:a1c:64c4:: with SMTP id y187mr3239021wmb.162.1618307385281; 
 Tue, 13 Apr 2021 02:49:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x15sm1945964wmi.41.2021.04.13.02.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 02:49:44 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/shmem-helper: Align to page size in dumb_create
Date: Tue, 13 Apr 2021 11:49:37 +0200
Message-Id: <20210413094937.3736541-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210413094937.3736541-1-daniel.vetter@ffwll.ch>
References: <20210413094937.3736541-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

shmem helpers seem a bit sloppy here by automatically rounding up when
actually creating the buffer, which results in under-reporting of what
we actually have. Caught by igt/vgem_basic tests.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 6d625cee7a6a..d5e6d4568f99 100644
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
