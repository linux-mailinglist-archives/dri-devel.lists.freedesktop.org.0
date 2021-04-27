Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D750136C197
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 11:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09166E92D;
	Tue, 27 Apr 2021 09:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5486E92A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 09:20:28 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 26-20020a05600c22dab029013efd7879b8so4762721wmg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 02:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ReR+qIwa27lRq+WXnj64eqAh7xIIkZ1ocFvCO3rmgbA=;
 b=JL+d9Be+1fsOLPsXOKUrRxgZxa39qLYpQ0YrL1WSRQH8EeOSU9TuY5SCxkhZ8bTnvg
 kADgMit5Tjswacswy/wlSRX+5XV/KC1tpCJx/GM65VHOTIr/90IX9etPOTBp18znldlC
 cVpPMLJJsEIYJJxXX9Tvk62NITCamUFMsPFZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ReR+qIwa27lRq+WXnj64eqAh7xIIkZ1ocFvCO3rmgbA=;
 b=f01/vrc49cSyh0BrYdHM9mtzDtfxFmzcWJnkAFWHFFFNt3aEg1qMJ1dkZ74EZSHRcR
 5nublPYqkBWyXEEr+mnHKCWQGWIB8JYFDnrN9w6tV7RJDXd20Tv1cDIxwagCLv9cTWj0
 jDgmwpnKEd2Jj5hyjos/NLHaxcC1Tw2QTdRDZi1XslBoVo+MBVgmIFgdrwAe8ieFDjIE
 UAfxeeksiczKjmNe/DCiI4BXkMDdUZO3LOGls1P+5nZJGhyjqKGKU8o4YmTMrtLfn75K
 Lggrb+DA5YhOdEvnJa8sDaBqdlPURpIidmnijWBcAtoiH7t9Oo7PoxxJfUI05kML9jzA
 9AFw==
X-Gm-Message-State: AOAM531Se/kZkrXZ4x/pbD909iKa/RpN/lA6m7TdHl6MNro8Wl4o4Sr2
 MwaMzGcyukm4/nY4MumCeVyxJCMzcUQxZw==
X-Google-Smtp-Source: ABdhPJxY1xvtgR31iORQGe6Y6cpHVeXgo9kkirI7wziiPBd6Q7J0bcoSuMCknwVDmZApxntHIbq0lA==
X-Received: by 2002:a1c:228a:: with SMTP id i132mr7321975wmi.10.1619515227165; 
 Tue, 27 Apr 2021 02:20:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r24sm1939816wmh.8.2021.04.27.02.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:20:26 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/8] drm/msm/dpu1: Don't set allow_fb_modifiers explicitly
Date: Tue, 27 Apr 2021 11:20:14 +0200
Message-Id: <20210427092018.832258-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210427092018.832258-1-daniel.vetter@ffwll.ch>
References: <20210427092018.832258-1-daniel.vetter@ffwll.ch>
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

v2: Rebase.

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
index 88e9cc38c13b..93bc3575bf53 100644
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
 	dev->max_vblank_count = 0xffffffff;
 	/* Disable vblank irqs aggressively for power-saving */
 	dev->vblank_disable_immediate = true;
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
