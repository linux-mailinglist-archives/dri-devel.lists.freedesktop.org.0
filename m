Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC4B3A0B9B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 06:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25646ECE5;
	Wed,  9 Jun 2021 04:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68D16ECDF
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 04:37:13 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id 27so18403509pgy.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 21:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=osCfXXim8bGw8YxDUvxiYpmnVDClWEqWfl2vwOfCLLw=;
 b=ApdeMvXh3v+pyU4mlET3RiYfMmgYZzGhGc88+pNMZ7UCOTd6R4WtmmpOf4C+dfaESX
 OsCtAq/9cvYIy3qXg4UxJGpXAfSXWbMayNshkyiKJ4QNJC3sBVPxNh40AQ6PUBo2aJ3u
 8O+wIhhprNuqUJVBLLKitZYv5bxTOAlRF5CCmcWLNDVIL34vEoIH6T0A8hTDBLxaTwKH
 6yYopmiqTnDYXhdObxsjWsGoS40XZtG2+3pqSnHznYSFsLEhta7db2mLOvc19xv8BHfp
 Fq6dxjt6E2jk5OKfoUqc9d4uWivTBY2c3elY6LnIEdJmKCMcwThQQrp3FUbblqlIdfLc
 IB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=osCfXXim8bGw8YxDUvxiYpmnVDClWEqWfl2vwOfCLLw=;
 b=YGv3OW3TYwCS6/fnAXkmOG8NAbLJrNFruWkJVhhDO0adUr2cf3E4ZvnTVg7b4MmAlG
 lHCxtBz/j8CFe+XdeKcg+4ZM6dR7CzC4DFl3+6Ufk7TjRJ1HiDRqu8KCLCofW2SSlIBU
 6VNuK3PMVmsypNnuGnl+68+YwIcSbO1QcP+eELNSFRzHtTtO1VXsd3tWwD+A79yKXVnC
 6rDDUDq8nVGbpVH1BYI+qpssW2qCnE/wDalvGKTMtZri2WtpciXwFHcuiybWsXimWtXl
 x9PBXWf2zHAo8S3UdobGV5Zo1Q+WHRuEpDNSUxo1P7mMA1pgdMBU1GjDddf2R3mEtSOn
 lkSw==
X-Gm-Message-State: AOAM531lRKZXK9Xd8b2Tuy+aJUIimhGQfsU6Ohr3nQKo1kjdOVA49NYC
 WExf12WLJlHj8yQzqEMQI4bK1LroPQ/BaA==
X-Google-Smtp-Source: ABdhPJyDwGJ1zLOeA6b8T0T3onDTS9pFkCfN5B++oY3mXGaW9N9IEHxEn9A3MOHBfQ9aL46EDQofQQ==
X-Received: by 2002:a63:d818:: with SMTP id b24mr1866661pgh.386.1623213433242; 
 Tue, 08 Jun 2021 21:37:13 -0700 (PDT)
Received: from omlet.com (jfdmzpr06-ext.jf.intel.com. [134.134.137.75])
 by smtp.gmail.com with ESMTPSA id t5sm11991612pfe.116.2021.06.08.21.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 21:37:12 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 31/31] drm/i915: Drop some RCU usage around context VMs
Date: Tue,  8 Jun 2021 23:36:13 -0500
Message-Id: <20210609043613.102962-32-jason@jlekstrand.net>
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

This instance now only happens during context creation so there's no way
we can race with a context close/destroy.  We don't need to bother with
the RCU and can access the pointer directly.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 5312142daa0c0..ffdfed536ce9a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -787,15 +787,12 @@ static int intel_context_set_gem(struct intel_context *ce,
 
 	ce->ring_size = SZ_16K;
 
-	if (rcu_access_pointer(ctx->vm)) {
-		struct i915_address_space *vm;
-
-		rcu_read_lock();
-		vm = context_get_vm_rcu(ctx); /* hmm */
-		rcu_read_unlock();
-
+	if (ctx->vm) {
+		/* This only happens during context creation so no need to
+		 * bother with any RCU nonsense.
+		 */
 		i915_vm_put(ce->vm);
-		ce->vm = vm;
+		ce->vm = i915_vm_get(ctx->vm);
 	}
 
 	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
-- 
2.31.1

