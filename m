Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF722F2A3B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949786E139;
	Tue, 12 Jan 2021 08:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325A26E139
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:44:17 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id w5so1515929wrm.11
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l0FvI6Zc3i/AkOaoNdZvlp67AOr1t9eMusTwgsuGu/s=;
 b=ErURo8WrBQ6Jd/XhzJQgZnTsO/LvJ2lvDdv8KAmiMGcrNxU5hTUiQuaBWMS5eDOmta
 WFjztDzRQ4MvUSkHnj1HD4fvS6mA8vJz0KQH0zAlUidpxuClQn0cl35csXOiluUQ71Jm
 FZfmuLqWp7DWs4u/SxWPm9EieF97UvKXQLMLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l0FvI6Zc3i/AkOaoNdZvlp67AOr1t9eMusTwgsuGu/s=;
 b=qgTlbTQKc8nI7m+94HooXKQIg9fV4DI2qFP+aebuj7JqzfL28qhc9zh1BLOqhb3VIY
 oGUrP5Sq7dJQDyb/SadhV6xmwAU8wzvtLwfLbFgajMz35uXcyc639gcoSZ5as6gpxD2v
 EUUrJa4+I8462P9b37ovp257I1mwW2hYkF8uGevU1Mn7sfxMDEX+uAODgPb0RUWE1C9+
 EI7UvUZkoht5RYt9qmfwKNJ00mA7I/gZi3r7rTf7r61TEhdEm6fZA4J1twYLlt9xT0Rh
 z27U/5TVx1in7dVQ2F5yy+SDnxO5kNoChE6WfOTvwCImVCaHgV/P8GcRAPacgU3OsoZc
 v2tA==
X-Gm-Message-State: AOAM53013x1+BSr+lfjj3xdzb+gRyRuObC5R/jJsC0Hcc7lJ905KuyTv
 z9MEFD38HcXebdrwww5bqTA0IDXP4m3CTvx+
X-Google-Smtp-Source: ABdhPJzvGtC6nCJwXWDIKL9FXZarUCTxbJ6LB9Ncf+qC+ehIF/cWZhzNliQ9LFL1lp+gq6luUNTV7g==
X-Received: by 2002:a5d:5913:: with SMTP id v19mr3055022wrd.207.1610441055647; 
 Tue, 12 Jan 2021 00:44:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j15sm3707017wrr.85.2021.01.12.00.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:44:15 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/15] drm/arc: Drop crtc check in arc_pgu_update
Date: Tue, 12 Jan 2021 09:43:53 +0100
Message-Id: <20210112084358.2771527-10-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
References: <20210112084358.2771527-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, tiantao6@hisilicon.com,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
