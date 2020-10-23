Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EAD296EAE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F4A6E55C;
	Fri, 23 Oct 2020 12:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B966E52C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 12:22:39 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t9so1553384wrq.11
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 05:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=guHCCErCMqoPbxQI9pil+wt2PYB+uT5fZSBV+IuYGoA=;
 b=jh07aP9HtA5zZ0rExIH5k72dtvWHENezPdTQy80zBiovspyuKBwX2akrt3+ul2MhgD
 p3We86q8j0ZN3fG9crJVf/Ymn9R3OAAuOHvwblHsFW3q0W3MsbMLNoXk8ahEmLW035nC
 SfW0gQODnSL2VTXhH4JUVWVTsdeo3h7bI483M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=guHCCErCMqoPbxQI9pil+wt2PYB+uT5fZSBV+IuYGoA=;
 b=Dtc16WbLBkP0tryrYB7CG00MQxJj85d644Sbu4B0xyQ72cDeShga1SfF6DETB+nBi+
 sr8Yh+AfYCda+1LUvgWs5iFuttZdv248pDO4ZqpaZhtQqViCgKUsd71XcvqpHYJS4wQh
 tsJ4Rh93vSYDBYcQDDF+syK96z0BAYhR9QTClkl/DAgGdT01iwURB5IJ9u7To7E5cFgg
 fFrTBrc2YOOnmxpH2w6UXvTorz1MKFfIbcRtQB4rtxS0rE3AM2YYRoM31DTNEPkBwSpX
 TfRObvcLgcYqPiTPLycJ1+xHHyR/A+N5sZfeN7JvhcgVuaBvqLBCqbIjLFn0xWzoLFl8
 vjXw==
X-Gm-Message-State: AOAM532YO8v5KoM4m4V9jzsScIxXOLOS7xU8QtvkMoiTkxQ706DuzG5P
 yNXcl5LXa4F28KKfGNQuTamTOsCRx82glVKp
X-Google-Smtp-Source: ABdhPJzOJi5Bq7RQ+JzlmtBQ4eZOuXPDONkpCj/pAIS1V21cUj3BCeaDSlH9SpbP7OmlqeL4ulNYqg==
X-Received: by 2002:a5d:6cae:: with SMTP id a14mr2451820wra.187.1603455742060; 
 Fri, 23 Oct 2020 05:22:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:22:21 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/65] drm/vc4: Drop legacy_cursor_update override
Date: Fri, 23 Oct 2020 14:21:12 +0200
Message-Id: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
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
