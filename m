Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8FE3C166F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 17:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6996E90A;
	Thu,  8 Jul 2021 15:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27096E90B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 15:48:59 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 w8-20020a0568304108b02904b3da3d49e5so2257420ott.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 08:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ppcc9ihY2QifRm56sxn37StyuzY3MSbV/JUFM1N5wzc=;
 b=F7qJtxgaLpXGEzvXiEdBOdig1u20ZJbA3uuqIzDeaomR34yX6+tcSMmGIEdWVIn8Vg
 A0PjusBiznGfQskav9xvqLahF6Dod+LqrQdKrKscBzJC5gYn9B+NsicAMnS/E3onCIkd
 fhKcGBQVk65s+uNeTA12ecfb8Ycw4psdxZBr7PY3LQMZFMogH8urOTLET/Bc+24CkkiB
 Dvou15OHnWAbG21EwJRmO19VHifyolfUsToPO6DHnOrjvGifYtxAFQPtCpnTbvsBLBbA
 DajQyyhEPKrmHJUO4aJPRLCxZzlurfkTCnQWabalO1r5KlDwmr+LCdnHxxyGRZ4Hppd+
 3ALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ppcc9ihY2QifRm56sxn37StyuzY3MSbV/JUFM1N5wzc=;
 b=fp+2EggV4BI23vSeZBNYQlOD/PA3n7MyU6FLF0gydUK6HG2iDS4cKBquJHOXftzXZJ
 Bb1xDn3y76HkzpVZoFAtaPWCrTfnpsS1Wgf1XfJ4lXltc5qPCCKmJ49cUe3JySigz/eQ
 MoQ4b0IJqLkXDUVcS6e4Azy0yq+/n9zH6ywiNSuyWamAftjZ1ZWmOjx5e15V7wu1PtQ/
 96X7cFL/r3KIKTwbJKchMY9oRYmreweNLOMGYG10rIY3NIwIKd5UiO9GrOXGK2FeTK+0
 K+dR++kTqZpXXmgSaI484Cp9jxzhtiAL4G3nsTMzfv7KyY8FH3CR3FjSUQBmFh/31G/d
 Uauw==
X-Gm-Message-State: AOAM530/JQMA73goRzr0CLyVQepRVKEEvmYz7WdqYi0FzLQ6OTeETpzy
 UCKJ7adjL1zkoQUrXSpFb8TPfg==
X-Google-Smtp-Source: ABdhPJz5HPybtQ6VuilUz8M3ideaEBssHNxItk564t8uvEjvzzxHWvtgswcj+Q1BO1IkECKaGFhrhA==
X-Received: by 2002:a9d:4d0e:: with SMTP id n14mr23927064otf.218.1625759339196; 
 Thu, 08 Jul 2021 08:48:59 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id d20sm548356otq.62.2021.07.08.08.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:48:58 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 17/30] drm/i915/gem: Rework error handling in default_engines
Date: Thu,  8 Jul 2021 10:48:22 -0500
Message-Id: <20210708154835.528166-18-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708154835.528166-1-jason@jlekstrand.net>
References: <20210708154835.528166-1-jason@jlekstrand.net>
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
index 741624da8db78..5b75f98274b9e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -366,7 +366,7 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
 {
 	const struct intel_gt *gt = &ctx->i915->gt;
 	struct intel_engine_cs *engine;
-	struct i915_gem_engines *e;
+	struct i915_gem_engines *e, *err;
 	enum intel_engine_id id;
 
 	e = alloc_engines(I915_NUM_ENGINES);
@@ -384,18 +384,21 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
 
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

