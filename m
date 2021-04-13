Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A5E35DBB7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 11:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BDC6E32F;
	Tue, 13 Apr 2021 09:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A096E364
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 09:49:21 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id r7so3776450wrm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 02:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RphiA/VGkxJpy+mzsz7ElRrDbay++4IiWnsjaQ6KUhU=;
 b=CQFUCK69d4uUzPRiNlz8+sTbF9AYcdh9v36SA73CXTKBLhiTf3tLJU1wAe+JFdCYTn
 NMDkXoGpRd1G1st4QPfhEr1Kec3QATiimxyaqi2M34OUpjhzvQI5BimMuuJl+C/p9poY
 GSQPPGzxtvIah5oc6ccAD98MeQqn543Nf3Okg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RphiA/VGkxJpy+mzsz7ElRrDbay++4IiWnsjaQ6KUhU=;
 b=DTcZBQrhbwL21AAYaUR7LwiPi8m7jE4iDQKLEIGGUD7OSnQfTJeg1wEw3Tbamp+EX1
 GqqJ0jMm+/3spL1/ym2SL5Cj9mT0lEJ4HiY1ILkQyXYvwCZ45fxcNrABcjIXSS2KksjG
 dJ4ZNYXm0TEX5WXj3Wc5z2I3WC3iVbZxtTrafxBlsPPsle0pCHKlV3lshUjWgnKvgUa6
 f5mN2BqKfWFA7pPpYUvMcmTCfozHIeTfzXwz7JQqlxBpJc7zlrfESlb+H7B4EDDs6yYr
 PXoBvPs2AF1E7rfem6MDsFfKvLkKH0J3GZlwHMsRYCvR/oWoLq7+ve5QvCsfzjDFJF8R
 QEjw==
X-Gm-Message-State: AOAM530bzr1OFNSjoeTCXTXyk2Ou+/R/GY7tfC4P8sn6tso8gUArXK0q
 Y9OlUFeuHpoB83t/RMcTum35HqR+XYFHCw==
X-Google-Smtp-Source: ABdhPJyO5SI9CUDQP3JiMJYTnRrSJhQaOshEHwfla2HISVh1lugxxrxOaa4ZrLFK2fD60ExT+wqqkg==
X-Received: by 2002:a5d:658c:: with SMTP id q12mr35541276wru.30.1618307360347; 
 Tue, 13 Apr 2021 02:49:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 64sm1956458wmz.7.2021.04.13.02.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 02:49:19 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 11/12] drm/vc4: Don't set allow_fb_modifiers explicitly
Date: Tue, 13 Apr 2021 11:49:02 +0200
Message-Id: <20210413094904.3736372-11-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
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
Cc: Eric Anholt <eric@anholt.net>
Cc: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index bb5529a7a9c2..f29ac64a5aa5 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -899,7 +899,6 @@ int vc4_kms_load(struct drm_device *dev)
 	dev->mode_config.helper_private = &vc4_mode_config_helpers;
 	dev->mode_config.preferred_depth = 24;
 	dev->mode_config.async_page_flip = true;
-	dev->mode_config.allow_fb_modifiers = true;
 
 	ret = vc4_ctm_obj_init(vc4);
 	if (ret)
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
