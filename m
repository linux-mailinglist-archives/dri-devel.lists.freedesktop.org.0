Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F943A0B95
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 06:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E9A6ECE4;
	Wed,  9 Jun 2021 04:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849CD6ECDF
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 04:37:12 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id n12so18350027pgs.13
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 21:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cgJesVcbjdz3Zul6YjwKP5n8kOkFD3vYWxtYFD7UMWk=;
 b=oh/7qT9pEAByMDr3ey7DWvsrcL3/fGvjE0mO4RH0UZht5TwPTOZTGkJQcwQLplrT5j
 SDxWCG1N1ua36+RGUnpnIneVlhLM/yFJElEiYlMZBTdeZ300MEg0St8xbpIJX8TqgZ9s
 SSWIUS/CljOMnp8cgtrx7yeFjzLKFjGsATUa+5q+y3a3B9XCe6soAdHrry95iYyqlgTs
 niNDBjv0K2Yx4EQYGjANphFLzGVYpdeLEU9aX85UjwnNpj4+4hjJWw6pBwfZtZ/VMhMd
 d8/eqRToAi+0uQcTlZigyQbeDp67/HBFRe7OyRYmDj8mJmxbbIZ/YO7jlhBdnHKd254j
 K1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cgJesVcbjdz3Zul6YjwKP5n8kOkFD3vYWxtYFD7UMWk=;
 b=jV0wVoQp2iJjCPybfWgVgk/+0PAXM5wxr80iUTZVH4nJUekEzv2cGDeOqe8uyXRSEG
 5tZ3Is6klvoyoVaxFOTPntBHgd1b6Px+UUVZd+lGkPg1Ny4iWww1yc2N4G7DhsVG5FLe
 M2cHzD4BTvODJjuXaCiIY6Nfz4mgvndj2BN6CXKxhG+D8AG6qz4P6/QQpdylWfjhYYZz
 s4vVusiW8vMWlz60vxXfJEOi13sm74m5fjs36kgDOvaeGCu2wSazmeqR8PzqeLTQ/4nu
 2mCuD/n6n7SWh1unGehiviZy5Ze0hTvZU3/GOCH/G0F+t32Oqs2FXnGFS1H1tcIp0EJa
 OHvQ==
X-Gm-Message-State: AOAM531H3Y4TuQwxDYAgGQ8ZuwHAngpQBeEsyOaA/dk2ACETuDGDFdWm
 PPk7zb71vC9a4tzASon4gK19q+kf4kHikQ==
X-Google-Smtp-Source: ABdhPJxd9SWcvknKN0/rNruYqWAGQLGwjUCE75iDDmcdRCq1+XjLF3uDIBJhTIDWn/KPmC9/HNGPkw==
X-Received: by 2002:a05:6a00:1808:b029:2f0:53eb:6645 with SMTP id
 y8-20020a056a001808b02902f053eb6645mr3513578pfa.46.1623213431708; 
 Tue, 08 Jun 2021 21:37:11 -0700 (PDT)
Received: from omlet.com (jfdmzpr06-ext.jf.intel.com. [134.134.137.75])
 by smtp.gmail.com with ESMTPSA id t5sm11991612pfe.116.2021.06.08.21.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 21:37:11 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 30/31] drm/i915: Finalize contexts in GEM_CONTEXT_CREATE on
 version 13+
Date: Tue,  8 Jun 2021 23:36:12 -0500
Message-Id: <20210609043613.102962-31-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All the proto-context stuff for context creation exists to allow older
userspace drivers to set VMs and engine sets via SET_CONTEXT_PARAM.
Drivers need to update to use CONTEXT_CREATE_EXT_* for this going
forward.  Force the issue by blocking the old mechanism on any future
hardware generations.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 33 +++++++++++++++------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index d3c9c42dcae4d..5312142daa0c0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1994,9 +1994,22 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
 			goto err_pc;
 	}
 
-	ret = proto_context_register(ext_data.fpriv, ext_data.pc, &id);
-	if (ret < 0)
-		goto err_pc;
+	if (GRAPHICS_VER(i915) > 12) {
+		struct i915_gem_context *ctx;
+
+		ctx = i915_gem_create_context(i915, ext_data.pc);
+		if (IS_ERR(ctx)) {
+			ret = PTR_ERR(ctx);
+			goto err_pc;
+		}
+
+		proto_context_close(ext_data.pc);
+		gem_context_register(ctx, ext_data.fpriv, id);
+	} else {
+		ret = proto_context_register(ext_data.fpriv, ext_data.pc, &id);
+		if (ret < 0)
+			goto err_pc;
+	}
 
 	args->ctx_id = id;
 	drm_dbg(&i915->drm, "HW context %d created\n", args->ctx_id);
@@ -2179,15 +2192,17 @@ int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
 	mutex_lock(&file_priv->proto_context_lock);
 	ctx = __context_lookup(file_priv, args->ctx_id);
 	if (!ctx) {
-		/* FIXME: We should consider disallowing SET_CONTEXT_PARAM
-		 * for most things on future platforms.  Clients should be
-		 * using CONTEXT_CREATE_EXT_PARAM instead.
-		 */
 		pc = xa_load(&file_priv->proto_context_xa, args->ctx_id);
-		if (pc)
+		if (pc) {
+			/* Contexts should be finalized inside
+			 * GEM_CONTEXT_CREATE starting with graphics
+			 * version 13.
+			 */
+			WARN_ON(GRAPHICS_VER(file_priv->dev_priv) > 12);
 			ret = set_proto_ctx_param(file_priv, pc, args);
-		else
+		} else {
 			ret = -ENOENT;
+		}
 	}
 	mutex_unlock(&file_priv->proto_context_lock);
 
-- 
2.31.1

