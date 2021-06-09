Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F7D3A0B7B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 06:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B796ECC7;
	Wed,  9 Jun 2021 04:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7FB6ECC6
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 04:36:49 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id b12so5908751plg.11
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 21:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dpxtFIqDbxqJVbzdPgkkrg22JFrhY0zByfQKm8vIUlU=;
 b=y/58+uxttPvHFmBCcN9u4NEG1EGzwC+zwq00Ywp7SKslnZT6EtRNBYDtgZaXfm0H7k
 +bqrBR4nYITGn3sFYNkBZ6ecTmcnLbBQcFiplEpIMWPs5RLdKsW2GvzZLyPp9bY1cgua
 f4xRhcZMpmd88n1rZ/4e/OQfTEKc/ywKw/MNS2mhYdnGDsTFZKirTzcJb307GLxM5g23
 3HJgP2sJ8Otm9zA8zRi4pAe9EEkR2n8fZVG0TBTD9EIOxwlxE6lxxHHdVGjH7QZjotn2
 kqKfo1OmeImHOUVNNNxnmgy5E1zgkXTMGpLpvoR5L4HSsOHnFBysoUGcwc4PYQoh7wHQ
 FJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dpxtFIqDbxqJVbzdPgkkrg22JFrhY0zByfQKm8vIUlU=;
 b=PZTsVYZApL2E4zAEOhn24CMUHe5g4FCrqpN/FzDOu+lesKd733GxyDTYpZEEPMHERt
 6NutPKEYydAihs+k//SqLcJfXFgh2dO+XgPkcxl7eqzS8iITO4PRWxMsiQO1UTUdhKQ+
 J2fOCVbSMU7r1fiP7b8fWZTUQQxpIdPPKuFaZ45sByaqIsBzcKVsViQZIpT9OPH4TKBe
 re1igBonsPAe7hDnoAuOE2USp0wN/33OuGbwz6scLSwgTH7LtVx3iIC2engqS+s/xl5S
 afMVlsfFlYOwh8eJW3uJ4DxbBJkrw0wYrnQmIdBOIG9K1ntg0gBbJFwgWrccESPYvnWq
 dttw==
X-Gm-Message-State: AOAM5312Vj5QmSofOVJZfk3wbkG8AOJe7NccCwb3DdF/rh+znCBXYVy+
 s48L23DdtV/27DChdTazXSJfhz//t1Rxxw==
X-Google-Smtp-Source: ABdhPJxtbTgo9ZJxo4ZlvqCSiLQUGc3ISgiYDHUOQtrkFz55L/y9DbfY7kDPbpwzHvrZwXMnFcjMnA==
X-Received: by 2002:a17:90a:db41:: with SMTP id
 u1mr30547007pjx.15.1623213409267; 
 Tue, 08 Jun 2021 21:36:49 -0700 (PDT)
Received: from omlet.com (jfdmzpr06-ext.jf.intel.com. [134.134.137.75])
 by smtp.gmail.com with ESMTPSA id t5sm11991612pfe.116.2021.06.08.21.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 21:36:48 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 17/31] drm/i915/gem: Rework error handling in default_engines
Date: Tue,  8 Jun 2021 23:35:59 -0500
Message-Id: <20210609043613.102962-18-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609043613.102962-1-jason@jlekstrand.net>
References: <20210609043613.102962-1-jason@jlekstrand.net>
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
index b5d8c1ff5d7b3..4b1a874225c0c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -406,7 +406,7 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
 {
 	const struct intel_gt *gt = &ctx->i915->gt;
 	struct intel_engine_cs *engine;
-	struct i915_gem_engines *e;
+	struct i915_gem_engines *e, *err;
 	enum intel_engine_id id;
 
 	e = alloc_engines(I915_NUM_ENGINES);
@@ -424,18 +424,21 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
 
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

