Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B77F25DC0E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 16:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A3C6EC26;
	Fri,  4 Sep 2020 14:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B546EC19
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 14:40:12 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j2so6990292wrx.7
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 07:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=64XFBTpUz/+kegXv8JrCHRJD2MKSn8Wfz3YnsHGyo4c=;
 b=SHrI5PteHHk+OQ04euG4wDkT+NJ2wr/tY0ZI+HWYVsHcPA56/weXRIZ7Whlt7Yh4OF
 1yv/Tt2MpaNE60nA+Yr25ol8WHvVVnKLm6VDQFWxZdEnSakTDY5GXiNPBlJfapEwp7Xw
 tMxYKMf+EVP1wmpdxQvxb+lPPQWg6xm65nIWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=64XFBTpUz/+kegXv8JrCHRJD2MKSn8Wfz3YnsHGyo4c=;
 b=kdzgvWW3hdp7jfAINCJA1OEC1L1ftgJtyLAAJGEBs4eHUj7lkxBg8sJ8cJdme5gt4U
 +eCKlKhUAAfizlNrCaXDCCwOu+KLQBDMU4fjZhWie9S4TFUY6vG/x6xTcxPnExxsYT1r
 tiJjA95LFGC7s3DgKld9n/oFn4tibwVGgbkzB8jE4qkQ1gI0/dUINxFD+4BepsjkbWOo
 emOOmgY8SHshPntGe44gsnQWtvNsbA4jVkfgdwXCwQgViRIyMzLeKsHBizkQtx2twlnj
 MVrKurnhSPzY/nm9nEyuZKr12iOF/S/CDZuhGPcZNlnKyvyuhKrTzRHi1lXAzCwqp/kC
 GjtQ==
X-Gm-Message-State: AOAM531j09Pj3Jji/miGW+ckrTe6gEcOoAS3kKQDy9KEdTEUZpbK87hp
 hLEgzmgM2t11162yi1endslanNaAzjCqcL7j
X-Google-Smtp-Source: ABdhPJwLjIlfjbdw5SBpzKtKR85U1vkmexzqifNRH1wlPreKUPygC/BY6mszJQHJW3yYqofuWPaKkw==
X-Received: by 2002:adf:ed09:: with SMTP id a9mr7741915wro.407.1599230410818; 
 Fri, 04 Sep 2020 07:40:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z15sm11597949wrv.94.2020.09.04.07.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 07:40:10 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 19/24] drm/arc: Drop crtc check in arc_pgu_update
Date: Fri,  4 Sep 2020 16:39:36 +0200
Message-Id: <20200904143941.110665-20-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
References: <20200904143941.110665-1-daniel.vetter@ffwll.ch>
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
 Alexey Brodkin <abrodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's redundant, drm core guarantees that state->fb is set iff
state->crtc is set.

v2: I had a misconception about simple helpers here and thought they
filter this out. They don't. Issue reported by Eugeniy.

Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index ef7dca789868..30fbb3052bc7 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -134,7 +134,7 @@ static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
 	struct arcpgu_drm_private *arcpgu;
 	struct drm_gem_cma_object *gem;
 
-	if (!pipe->plane.state->crtc || !pipe->plane.state->fb)
+	if (!pipe->plane.state->fb)
 		return;
 
 	arcpgu = pipe_to_arcpgu_priv(pipe);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
