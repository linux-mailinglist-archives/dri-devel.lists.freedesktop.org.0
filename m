Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA7D1F7B4B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 18:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882546EA00;
	Fri, 12 Jun 2020 16:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CB96E9F7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 16:01:11 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x13so10267765wrv.4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 09:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AcTqDgb/C4AgxenNvTv2x+6WfFDTaZMg7V/QTE3Cav8=;
 b=WPxQjfk608TiZ44KRgZF3BbidOGMD0ZfyldhzsVLvGs/fKSEWoVqvNfsxRmqgpsUhk
 jDGNL/NUM3CG08BV6kjuYSPFjGWtZe2KZsPHFpftgiMrXAopZK6dY75FKqO6M5iyudNj
 SDpriH8+y/EaXHO3GldSPJWTARyQyB5Awc0IU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AcTqDgb/C4AgxenNvTv2x+6WfFDTaZMg7V/QTE3Cav8=;
 b=j7mQDg4NCg94njDuzRj7VB3MffpGXw0Qwg7ISjQYTk4DTGlrl4lIDfIS5/SRgotc1k
 Up6NFXpwjFa0JRns1vSPyTAHozbRxYIp++58WMfy/24c6SgJy65ryUPYMeSRjX86EEYz
 1DBWCMxJC3HQe4Gmd01ifWJu34Qm8aBkWATpcqgkN1IM+wjEOnoC1WV3r8CW+jm1hlJT
 rVToZxcc/fnbMWPjt+FO5GXNiG/EEsyxvKIvEjJCYOiGXfjvC7tWmja+zvDkp/gfliw+
 L9dQzqMLBzdiDp/K9MtmfNRO9dzsnybrSaE/86deqM1TNmJXcNCkmsscichLxeTGNXoV
 /odg==
X-Gm-Message-State: AOAM530EApG7d+MvUi2dcBa+jz6aVgRrKhOs5Xh1WiwpdtKuAZtfDafS
 8BbD1N94X8Sl9v1p7ojB5QVANiV4tos=
X-Google-Smtp-Source: ABdhPJzetAcWKSLLliseVARP4EOFUw8CVTLZfx/mWeNNhOf0ik5yOwSwWkRhfZBi7Ru0m/j7maAs/A==
X-Received: by 2002:adf:ecce:: with SMTP id s14mr15919225wro.154.1591977669820; 
 Fri, 12 Jun 2020 09:01:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j5sm10801566wrq.39.2020.06.12.09.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 09:01:08 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 6/8] drm/vmwgfx: Use __drm_atomic_helper_crtc_reset
Date: Fri, 12 Jun 2020 18:00:54 +0200
Message-Id: <20200612160056.2082681-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
References: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
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
Cc: Roland Scheidegger <sroland@vmware.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now also comes with the added benefit of doing a drm_crtc_vblank_off(),
which means vblank state isn't ill-defined and fail-y at driver load
before the first modeset on each crtc.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 3c97654b5a43..e91dfc65a93f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -629,8 +629,7 @@ void vmw_du_crtc_reset(struct drm_crtc *crtc)
 		return;
 	}
 
-	crtc->state = &vcs->base;
-	crtc->state->crtc = crtc;
+	__drm_atomic_helper_crtc_reset(crtc, &state->base);
 }
 
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
