Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EDF35DBA4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 11:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EC989F06;
	Tue, 13 Apr 2021 09:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2F96E2E3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 09:49:16 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id 12so8361638wmf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 02:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yPW4RMlVJqBgs+Y7G8gEXGQ1RwDF+YDhbYujBtNiMB4=;
 b=EeswGHCTt6/hIr1+hlfQJ/4oAug1M+x2sY1qTJfTHkcAMVF+6bldjGP/1cXTWPOLQf
 lwIinEHpub8bI2J9KsucdEbt+TjNaU+c3sSHaD7hUobwTtJLbq5IX+lKsFHzdAIiMQB8
 BSOxqlug3I9fTfhzXpSZazgsaCpVjK0vEzkjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yPW4RMlVJqBgs+Y7G8gEXGQ1RwDF+YDhbYujBtNiMB4=;
 b=hxzJM+IAszoLurO9eXvSYQ5mO6vacO19hZYq41cFFJIIFQ+Ahcp6ieCMTpdKY3CjSk
 9HZsNygwRD2EKpCciN1nHCxJbk4k/Vbl2N+wwlF+dQnUAZG89i7FyU6F+Jly1DBfVG8N
 EgxXURxJiBMfeEG4FaQwUMTkWA0aU44e5bnIcrz6NBoZnAhUlEDDmyDFlSGk+qDraWsT
 RD0QJqZSOzWK1HaKGQih+XI92Pbt/HzpP3TU3l3ocEos4O6SOIt3WYCOQB0gXNtBOU5I
 mzDO6cHfCQ+HORWJ/ws4nWGAjLR6dz3lVYM9evHTlKz/2oyJheigam1p297GVLjiEWi6
 Rf/A==
X-Gm-Message-State: AOAM533S44ZMZRMVDUc+ll+CTJaaYbq85mBZKx24XNEcU4htiVKKBO6S
 fhrPomoBM0WT9+a5PEhkpI/n/azhIGLTGw==
X-Google-Smtp-Source: ABdhPJw2X6yP0YOFBN7whchfsfARonndlK1L4HNUpw+LleV1vf7SPmNeSXysI8ZaKF82Yg7qIeasrQ==
X-Received: by 2002:a1c:1f8e:: with SMTP id f136mr3273162wmf.17.1618307355687; 
 Tue, 13 Apr 2021 02:49:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 64sm1956458wmz.7.2021.04.13.02.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 02:49:14 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/12] drm/msm/dpu1: Don't set allow_fb_modifiers explicitly
Date: Tue, 13 Apr 2021 11:48:57 +0200
Message-Id: <20210413094904.3736372-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
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
Cc: Rob Clark <robdclark@chromium.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Tanmay Shah <tanmay@codeaurora.org>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Qinglang Miao <miaoqinglang@huawei.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Kalyan Thota <kalyant@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since

commit 890880ddfdbe256083170866e49c87618b706ac7
Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Fri Jan 4 09:56:10 2019 +0100

    drm: Auto-set allow_fb_modifiers when given modifiers at plane init

this is done automatically as part of plane init, if drivers set the
modifier list correctly. Which is the case here.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Clark <robdclark@chromium.org>
Cc: Kalyan Thota <kalyant@codeaurora.org>
Cc: Jordan Crouse <jordan@cosmicpenguin.net>
Cc: Eric Anholt <eric@anholt.net>
Cc: Tanmay Shah <tanmay@codeaurora.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 85f2c3564c96..074fb37ed49f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1020,11 +1020,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 			dpu_kms->catalog->caps->max_mixer_width * 2;
 	dev->mode_config.max_height = 4096;
 
-	/*
-	 * Support format modifiers for compression etc.
-	 */
-	dev->mode_config.allow_fb_modifiers = true;
-
 	/*
 	 * _dpu_kms_drm_obj_init should create the DRM related objects
 	 * i.e. CRTCs, planes, encoders, connectors and so forth
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
