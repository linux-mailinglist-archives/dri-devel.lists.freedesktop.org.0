Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6DC3718B5
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 17:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577376E903;
	Mon,  3 May 2021 15:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B0F6E8FA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 15:58:24 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 cl24-20020a17090af698b0290157efd14899so2203247pjb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 08:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zKSYg55UZ+wy9eQuy1FcVlRRqWf3FmEj2RvA7fBG2wk=;
 b=B/I++ksGOxZ+pVoUft3kSitCfrOqKh7t2jDsfBUVIUlS6HQHV5O3cn0KlBUdbU8Zh1
 eQPTiqkyHNzZJ8ESrRHGeKwXM1clJDwQcXO2PJ2teLKC/xMkyz98NKQj0rufTJhMDLKU
 DhK+ifPEylN+lATerEnwpaYZXitcrPROf1GRO24oDs2xbRjTUHsIfiwmMjzodqCnPPWr
 PJPFF6AAXI92RI9yL6pPUJPSbwWbTBtQj2m83OEWl6FsHpwqkHZs2nDz6pPoOEuQB/Jt
 Nyb6/iEPjTFeJ3mdOy5pAUsQVDCfdMvwxLVh32uz/CsUMIAhx50TqqVymGn74J7zzIJ3
 pvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zKSYg55UZ+wy9eQuy1FcVlRRqWf3FmEj2RvA7fBG2wk=;
 b=XuJv+Y4e88O/6nkZU9GGi3WdN99ivH6Ks/ZpIgaqXECEoJUQPX9Rp1MoUdJKUzsDHA
 SvTmnUwGHUvoP/xEaYC0dHWKgrOoqazyoxh4hAnWhbCLa4qq/1qF2Dp00ZIWYArYsaCR
 Z0hGNpYKV5UKIBVlBBnbmAydoVSna86wde4p4kTz+ru9b6gbOa85AkbFTtapsAauqvIx
 fnYBvjX1VwazvhrsKifP3qwGAgqJsFwqQ5Bqm0NtUIMW/BW0T7JL58yWJ2TwTFuWHti7
 VOI3gmKebb52ci5L8QAAK+ASF/x4mY5KVhOXhRvrrIzcCj8rBcPs9FEYHa+0MehMGDWc
 hwJg==
X-Gm-Message-State: AOAM5332AoUx/glqIQgLqPaJEIbONBKgklVkJEgCpz5t88+temqyUNPJ
 Np95ziyGvgBCUlpvXHUTAghdwA==
X-Google-Smtp-Source: ABdhPJygc86Pw0f6R4ccZB6z4qhmnD0oPAdfngL9DBe3qqmYWdFwWirSGOkwccmAko0w4PABCxhpKg==
X-Received: by 2002:a17:90a:1150:: with SMTP id
 d16mr21865824pje.47.1620057504100; 
 Mon, 03 May 2021 08:58:24 -0700 (PDT)
Received: from omlet.com (jfdmzpr05-ext.jf.intel.com. [134.134.139.74])
 by smtp.gmail.com with ESMTPSA id gf21sm9783296pjb.20.2021.05.03.08.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 08:58:23 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 17/27] drm/i915/gem: Rework error handling in default_engines
Date: Mon,  3 May 2021 10:57:38 -0500
Message-Id: <20210503155748.1961781-18-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503155748.1961781-1-jason@jlekstrand.net>
References: <20210503155748.1961781-1-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since free_engines works for partially constructed engine sets, we can
use the usual goto pattern.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 10bd1b6dd1774..ce729e640bbf7 100644
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
