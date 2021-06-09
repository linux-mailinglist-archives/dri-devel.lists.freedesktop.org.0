Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 632B83A1C36
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037F76EAD6;
	Wed,  9 Jun 2021 17:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016146EAD2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 17:44:52 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 mp5-20020a17090b1905b029016dd057935fso1872028pjb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 10:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YSo/j9HqtpIHYFdcP7ZSJPSo1Y8C+B62x+1YonoGl98=;
 b=SpOb/QOX21aWReuslfK8AwHh7f7jg08F9FvTtkLCNmy9Phcij/d+cx8Qq6lkCb9Dta
 t5KarMk7VjPwjcRr8ei8sz0C5fLXX2MRXO32oPGyQJmKU8IDzHbk2MpedTbiB10Chgl0
 7idGIO779EhhS/86UNccbTC8E/iCjsQsWth9l4ATNnlUQ7G51GP27lm0YwgiVb/V1RZN
 MlZ3DVfsyR80QgPnl+kToQo9h8Ifp8EIsu2RwGd2NmdUVQ0BAr2lo6K9uXINu6VdKBqk
 GzQf4KIvSgs84VitC2L4ZP4S+DblOhkHzvR3NjABWsnfW2afgTOELSNgt0jj9nWWbrXS
 iUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YSo/j9HqtpIHYFdcP7ZSJPSo1Y8C+B62x+1YonoGl98=;
 b=svsMmVzdGn9rKThY3ep3oit0vflZf24+/UL/pHDfQxFE8NdjvmBv81HiM55PBGeDKm
 9fit9HJBxH3iqOB+6jWVSPW/PLmkBOGGI/7aCmrAYtoHNnRQjxKhQSd9HIIw6wFUH9hj
 A8sBpd7H0CBiCoCNrxK1lsjr/SyqvZJnTScycLsg1Xzut/GS/oV+aKxgVpIcIbkzpTVG
 Zo6TdCDNL+IBa1vUjiXoljsWzypgAj3IwfosBGRGD98U0ehRh9dzFd0k4JKyXFgA3ZKl
 5bijGJOnnuNboB4ml4VPH8hJrtDtB/FlPVQdprskVxWYHhGK2E8hoDUJYM6Rgocrmgm+
 rFmQ==
X-Gm-Message-State: AOAM530EDB6zzMje9bkf4dlMi+znP5adV0qhyB0parWQ2FXCMQnqZlmK
 beYuxgvoKO6yQKxqQjrFl2R9/vCeHajF1A==
X-Google-Smtp-Source: ABdhPJxqGs2a5g0TpGyolh3OVmV5qlK8rCVAALkXuJ2Kcto7nHiyBmtvUeamqg3zA4+nbJ2JxRd8ow==
X-Received: by 2002:a17:902:a5c9:b029:f7:9f7e:aa2f with SMTP id
 t9-20020a170902a5c9b02900f79f7eaa2fmr865991plq.54.1623260692340; 
 Wed, 09 Jun 2021 10:44:52 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id b10sm208619pfi.122.2021.06.09.10.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:44:52 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 17/31] drm/i915/gem: Rework error handling in default_engines
Date: Wed,  9 Jun 2021 12:44:04 -0500
Message-Id: <20210609174418.249585-18-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609174418.249585-1-jason@jlekstrand.net>
References: <20210609174418.249585-1-jason@jlekstrand.net>
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
index f44faad296249..93579fa0324d1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -407,7 +407,7 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
 {
 	const struct intel_gt *gt = &ctx->i915->gt;
 	struct intel_engine_cs *engine;
-	struct i915_gem_engines *e;
+	struct i915_gem_engines *e, *err;
 	enum intel_engine_id id;
 
 	e = alloc_engines(I915_NUM_ENGINES);
@@ -425,18 +425,21 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx)
 
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

