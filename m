Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 459B01A94D5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AC66E8C1;
	Wed, 15 Apr 2020 07:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89A06E8C7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:31 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x18so13586179wrq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R55vPaWXO6FUPFWPVO+6UeOIQGlR0TvlAOtmWggeQaY=;
 b=fRkF2lADjbri5NcDKzWSfHvV/LwR3djwR46NVDvRVba4oWXb2XNDRLeGxhe20jsjRx
 Ci2IQSv9lJBXUX83yMjefI7FKVW7ix6nS+dTL4X9dPqF2YykoX+DPQoLnQbGxb2bmt1J
 Q+gwsq6WKtOlFhJ+3+HTszxKJimTKTVTkoMU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R55vPaWXO6FUPFWPVO+6UeOIQGlR0TvlAOtmWggeQaY=;
 b=WQAcsZQ5MTQ8K9TuzPD2zaBlyezjCuGuYw14ULbb6QJj/+NkCk/pB9EIgNL2fZg2K8
 VfoaJ7iKBGIklqFReM2D5OowfddXKLHkLM2vwJylfQq6XaKY/ywFvJufhk3ZO/VWwD52
 ydAHPtbsBeb/DYmdvKEaUTB4GsSm+nfpF4+pUxU1dRb/fDfPT8Y/7pcSoXIPPjFU4uCO
 rsIXfOAWDzV8sy0ZNQydJTHZm0YnC4vq8KVKRf9eQJTH3QMzaJAL/586U3V5VQcuONHS
 DLedIG2tlUlNs63A5mVRms3jA6HvWp00aucPjg6yNm206IX9cTzY2V+wYSi7jCnscVbl
 mBZg==
X-Gm-Message-State: AGi0PuafOl18i4Lr4y+cvdUUFbJLt2In0Onz8g+VqGnb6owEx2JnFQ9M
 kl+N0v9y5pJD4YalFp/wjm6m4A==
X-Google-Smtp-Source: APiQypJAac8NOtalsJPWlbUl7AP0yQ2i64lVtEucJwRN4XLzxwfLIxqCHENpKUcjDEhTzuLVhy5p1A==
X-Received: by 2002:a5d:45cf:: with SMTP id b15mr41258wrs.78.1586936490343;
 Wed, 15 Apr 2020 00:41:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:29 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 48/59] drm/arc: Drop fb/crtc check in arc_pgu_update
Date: Wed, 15 Apr 2020 09:40:23 +0200
Message-Id: <20200415074034.175360-49-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
 Alexey Brodkin <abrodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

First it's redundant, fb and crtc are only ever both set or not set.
2nd, the atomic_check code in simple display pipe helpers guarantees
that this never happens. So nice bugfix for arcpgu driver here, since
it was lacking a call to drm_atomic_helper_check_plane_state().

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu_crtc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index 5c6d7e34ca73..4655f03e37f1 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -143,9 +143,6 @@ static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
 	struct arcpgu_drm_private *arcpgu;
 	struct drm_gem_cma_object *gem;
 
-	if (!pipe->plane.state->crtc || !pipe->plane.state->fb)
-		return;
-
 	arcpgu = pipe_to_arcpgu_priv(pipe);
 	gem = drm_fb_cma_get_gem_obj(pipe->plane.state->fb, 0);
 	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->paddr);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
