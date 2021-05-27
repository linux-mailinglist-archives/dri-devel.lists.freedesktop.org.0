Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B967D3933D4
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 18:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC1B6F44F;
	Thu, 27 May 2021 16:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4AD6F447
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:27:20 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id m124so293096pgm.13
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 09:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jWlDW8BQGVys2enmS0GzVoJMLqd9hRdYFWb1bS6tUIk=;
 b=N2Etsad6jvLzqYHLwd63KJRir2nfm078QNNoF90H7KriLpdQCaP5fFdGK9TZ2DJoF9
 bH06lqecnzEa4pCAND+9p/vrzFVJ0OucirMvfTpNSG9/GJ0Uv2LmVo7FOlbXKUP4vD+M
 zeCz4j+sdpowBCVIvUq235hT7gqmBHzNbFZK8NnMf8cW0SXHQ9RlB0n1mLe/l2dmQEok
 zraLQrTyTHA5417MXnyKyn7lYUdLq++NGcTknGkFyPWZ5SofCyn4fjYxKzJ8xwpkZ6Nw
 qamn/KeqReXbuuLo2GU/UrUdIaFGHnEZBalbn4TKNmcpQ9MQxrV+oHRUp4sn3k7/zzwU
 6QYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jWlDW8BQGVys2enmS0GzVoJMLqd9hRdYFWb1bS6tUIk=;
 b=XMdnW2oDJw2madJM2/6IsQZQE4szeKzdPc5mESfaYjfNjChwZcv3yJ3/KvsjuUHyJW
 yzWZPNEHL6WvilrKJ03n4FGjS9vtAwrB4s1+Sd8CAyGH79jsNEHow4TB89wwZZ4zES3X
 nfxZ3OHRPCtYD+qWNbiGq0P8J6s31gPq8T+SJl82EQALWsUQkEtW5FIvdAhqwA1+AV2/
 ljXR3Hb0tElW0832CRykTcW9hTtm7cVlXCu+EJsv1NgISdNpJmSqzL2RitvCq94+NgPw
 PguFlcDPEv0KY006Ln8YVW53Dz62BXkqW2OZ4H7G5wmzML+pduLAQ1PubvnH97+KaD+f
 fHOQ==
X-Gm-Message-State: AOAM530xR3lNqKKRjDpqI+EsUepqLAtDGPLY2EZk565T1iahXSFLupq1
 RAtvzIL8emBwgxkf0mde8EfIy0aXHR69cQ==
X-Google-Smtp-Source: ABdhPJzOl3zysItfThBR9Cen+KNLSEaWBvpUjCLyzGUXl097JJ4jdSyIbA7JK/vzPY3xNpsjRgqFlw==
X-Received: by 2002:a63:224d:: with SMTP id t13mr4426481pgm.283.1622132839531; 
 Thu, 27 May 2021 09:27:19 -0700 (PDT)
Received: from omlet.com ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id h9sm2298711pja.42.2021.05.27.09.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:27:19 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 17/29] drm/i915/gem: Rework error handling in default_engines
Date: Thu, 27 May 2021 11:26:38 -0500
Message-Id: <20210527162650.1182544-18-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527162650.1182544-1-jason@jlekstrand.net>
References: <20210527162650.1182544-1-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since free_engines works for partially constructed engine sets, we can
use the usual goto pattern.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 10bff488444b6..f8f3f514b4265 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -420,7 +420,7 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
 {
 	const struct intel_gt *gt = &ctx->i915->gt;
 	struct intel_engine_cs *engine;
-	struct i915_gem_engines *e;
+	struct i915_gem_engines *e, *err;
 	enum intel_engine_id id;
 
 	e = alloc_engines(I915_NUM_ENGINES);
@@ -438,18 +438,21 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
 
 		ce = intel_context_create(engine);
 		if (IS_ERR(ce)) {
-			__free_engines(e, e->num_engines + 1);
-			return ERR_CAST(ce);
+			err = ERR_CAST(ce);
+			goto free_engines;
 		}
 
 		intel_context_set_gem(ce, ctx);
 
 		e->engines[engine->legacy_idx] = ce;
-		e->num_engines = max(e->num_engines, engine->legacy_idx);
+		e->num_engines = max(e->num_engines, engine->legacy_idx + 1);
 	}
-	e->num_engines++;
 
 	return e;
+
+free_engines:
+	free_engines(e);
+	return err;
 }
 
 void i915_gem_context_release(struct kref *ref)
-- 
2.31.1

