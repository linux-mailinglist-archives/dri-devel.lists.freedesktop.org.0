Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E3D296F85
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8626F64E;
	Fri, 23 Oct 2020 12:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDF56F875
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 12:39:33 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t9so1618051wrq.11
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 05:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PGEKwn6M9eko3KN/fzTkRc1z8KxmYtWMP0qrwYX/alg=;
 b=cIiVlFPMyq3bo3bTzWHFm2wxUwLPGAJ95lFXtpkG7HuLE3NSES2nceiPcSSwB4dbqH
 oHT7dPIuKZvj9Pg2nFIuj7Pdtzya4KT+OWfnglmKFZnYD3aO6tDZSDWk6QJo7XjWBcI1
 i80ahkHRr4QJjp7N8fSM377apfJdawTkeK7js=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PGEKwn6M9eko3KN/fzTkRc1z8KxmYtWMP0qrwYX/alg=;
 b=p8EA/Y+Cn3dk3Mq6BrjE0j8zhmNseyAezRnTGROXo+mtVNs16eN5DWQFWV6779WKtq
 VB170xWFTbaH0vLlTeapDCJUnhJVoYjoxmh9BdcgC0xpNyt2GEZc76VWCdWCBm88cxEO
 Ws6bSMGG/XOdsjimc4V28woosU3X+VMLSqwyXcFLvjpzZLKg4Gl+5f+oRdMedSmtrbOB
 ZOzKbZl4hEUBbNBBcPDwXwb8fLYMOIMMn77mL7GHJONSVK7LfeOhUENWEhGmPPL0WWYr
 +ckrsYZ2nYn+2HRAkG/srha1P1XjCY2PUNhud5lXDSIL50QmO2DpP7R3Q5uIB4bUktk2
 n/lA==
X-Gm-Message-State: AOAM533C0FifZWGPAQd6ZQgClmYsDr8hJNX5WM8E3xsht8A+PE9j8crp
 5AvvqBMYrIAHLw6RmPuy66fp3w2seABPZwwm
X-Google-Smtp-Source: ABdhPJz/PhUu+t/aX5G/Cmsm+zg+bBHfzem38LjjBD1fJ5nh4ZQ24gZbtRqGyRFbvbs6SiAd7xq1wg==
X-Received: by 2002:adf:f101:: with SMTP id r1mr2584805wro.392.1603456771835; 
 Fri, 23 Oct 2020 05:39:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 133sm3286462wmb.2.2020.10.23.05.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:39:31 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/vc4: Drop legacy_cursor_update override
Date: Fri, 23 Oct 2020 14:39:24 +0200
Message-Id: <20201023123925.2374863-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023123925.2374863-1-daniel.vetter@ffwll.ch>
References: <20201023123925.2374863-1-daniel.vetter@ffwll.ch>
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

With the removal of helper support it doesn't do anything anymore.
Also, we already have async plane update code in vc4.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Eric Anholt <eric@anholt.net>
Cc: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 149825ff5df8..bf0da77ab2e6 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -353,12 +353,6 @@ static int vc4_atomic_commit(struct drm_device *dev,
 		return 0;
 	}
 
-	/* We know for sure we don't want an async update here. Set
-	 * state->legacy_cursor_update to false to prevent
-	 * drm_atomic_helper_setup_commit() from auto-completing
-	 * commit->flip_done.
-	 */
-	state->legacy_cursor_update = false;
 	ret = drm_atomic_helper_setup_commit(state, nonblock);
 	if (ret)
 		return ret;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
