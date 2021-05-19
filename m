Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A32E238884A
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 09:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5AE6E56D;
	Wed, 19 May 2021 07:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D38F6E21D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 07:43:32 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id y14so10798811wrm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 00:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3DkNIkydloyBNXsM4DUT+1wB5zlc/1I1RiMPxasZ1o4=;
 b=QT3TR7+gcB5ZgeHsAAYGoTlaoRivIDyZnyi7Hu12D0du6f3tXVnV1W6nqTa4oZiXcq
 DYmRc7GiJKdH/XmW9LVzEDOzXa6Qrp10N2mj+75vFcfxz+nvh8H4Q3rlAx7oEBfKVV3s
 +y2Vykne1PrBLl+PVpvylkhdtEzKy/u6tnZho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3DkNIkydloyBNXsM4DUT+1wB5zlc/1I1RiMPxasZ1o4=;
 b=P+okAPnojTmju79Hn7+j56lr3HHlRvgBhqhFKHt9BSzc3uAQQ8i5f5MSwuXHlN59Zt
 im9urlyR8QD6k+DmKoQV9CbBzO1ilcBPMqGINqFB9L/UESCLW1S/Vy98SaYQhJ+/t0Br
 Q/JE5Y+Z5cTN2pu25tJNG3pJHyrcYES1+uIMkUC6oaVc7U/0du0eXTJj6KUD4qya1Le8
 bRzjONLjFvzuEaGDb/isJYIptxotCVgsoOBwdOaiISeMMW/LwjNwuyH1wdk7eiMfXYlZ
 icNOohSMD0nJko3imscO5KBQBQkiIilg7LjAtbzuppTxW56i/luc+DyAA3+MZQ6h9xhM
 U0BQ==
X-Gm-Message-State: AOAM532073s297CtGTi0oip3FsE9I2gEUx9tR+/2OtGhduSMhTMIyzza
 4OP6F8zIl5c0jptwvYyrtqgQ87OiDCK6vA==
X-Google-Smtp-Source: ABdhPJxY/s/pbrtEVXeB0LgwX2qCPUKkV8QxADPiaZ/KyvvaHb6Ub3VbrNxEzEfshwI5F4OAYx8VSQ==
X-Received: by 2002:a5d:650b:: with SMTP id x11mr12601721wru.186.1621410210754; 
 Wed, 19 May 2021 00:43:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h13sm21189986wml.26.2021.05.19.00.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 00:43:30 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/i915/cmdparser: No-op failed batches on all platforms
Date: Wed, 19 May 2021 09:43:22 +0200
Message-Id: <20210519074323.665872-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, stable@vger.kernel.org,
 Jason Ekstrand <jason.ekstrand@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Marcin Slusarz <marcin.slusarz@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On gen9 for blt cmd parser we relied on the magic fence error
propagation which:
- doesn't work on gen7, because there's no scheduler with ringbuffers
  there yet
- fence error propagation can be weaponized to attack other things, so
  not a good design idea

Instead of magic, do the same thing on gen9 as on gen7.

Kudos to Jason for figuring this out.

Fixes: 9e31c1fe45d5 ("drm/i915: Propagate errors on awaiting already signaled fences")
Cc: <stable@vger.kernel.org> # v5.6+
Cc: Jason Ekstrand <jason.ekstrand@intel.com>
Cc: Marcin Slusarz <marcin.slusarz@intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Relates: https://gitlab.freedesktop.org/drm/intel/-/issues/3080
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/i915_cmd_parser.c | 34 +++++++++++++-------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_cmd_parser.c b/drivers/gpu/drm/i915/i915_cmd_parser.c
index 5b4b2bd46e7c..2d3336ab7ba3 100644
--- a/drivers/gpu/drm/i915/i915_cmd_parser.c
+++ b/drivers/gpu/drm/i915/i915_cmd_parser.c
@@ -1509,6 +1509,12 @@ int intel_engine_cmd_parser(struct intel_engine_cs *engine,
 		}
 	}
 
+	/* Batch unsafe to execute with privileges, cancel! */
+	if (ret) {
+		cmd = page_mask_bits(shadow->obj->mm.mapping);
+		*cmd = MI_BATCH_BUFFER_END;
+	}
+
 	if (trampoline) {
 		/*
 		 * With the trampoline, the shadow is executed twice.
@@ -1524,26 +1530,20 @@ int intel_engine_cmd_parser(struct intel_engine_cs *engine,
 		 */
 		*batch_end = MI_BATCH_BUFFER_END;
 
-		if (ret) {
-			/* Batch unsafe to execute with privileges, cancel! */
-			cmd = page_mask_bits(shadow->obj->mm.mapping);
-			*cmd = MI_BATCH_BUFFER_END;
+		/* If batch is unsafe but valid, jump to the original */
+		if (ret == -EACCES) {
+			unsigned int flags;
 
-			/* If batch is unsafe but valid, jump to the original */
-			if (ret == -EACCES) {
-				unsigned int flags;
+			flags = MI_BATCH_NON_SECURE_I965;
+			if (IS_HASWELL(engine->i915))
+				flags = MI_BATCH_NON_SECURE_HSW;
 
-				flags = MI_BATCH_NON_SECURE_I965;
-				if (IS_HASWELL(engine->i915))
-					flags = MI_BATCH_NON_SECURE_HSW;
+			GEM_BUG_ON(!IS_GEN_RANGE(engine->i915, 6, 7));
+			__gen6_emit_bb_start(batch_end,
+					     batch_addr,
+					     flags);
 
-				GEM_BUG_ON(!IS_GEN_RANGE(engine->i915, 6, 7));
-				__gen6_emit_bb_start(batch_end,
-						     batch_addr,
-						     flags);
-
-				ret = 0; /* allow execution */
-			}
+			ret = 0; /* allow execution */
 		}
 	}
 
-- 
2.31.0

