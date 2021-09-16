Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C5540D8C2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37FC6ECF9;
	Thu, 16 Sep 2021 11:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A7D6ECF1;
 Thu, 16 Sep 2021 11:30:59 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id w29so8926037wra.8;
 Thu, 16 Sep 2021 04:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Rl5G26CInNXxZLgvUoDZCTBON+72/3XJ1+tj/YrIrs=;
 b=CeVtGW5uifD8DPQYhz9g74fUvxHL7oEWIpd7GUozoOG7t1vuk7DdXc+M4vjWOXiNwI
 0XPfn9xfsjjr92ZdavAWmmNdICg4F9taBVdanwzOdL7Q69j29fxmalNTVtV7tRpM0o9B
 pBS17PFP9WIBRzIt0OcOhZXF8T0ECvGq3qZVRkayJIV4dyeATceQjptkNhhd3/JPfypi
 HWr/I8SNVOL35qZmvpAPftYlKp7XMAw7UTTAg4PFlZ4HWtIIakyL3gpHFqpGoo3S14tE
 aKqKaF7DFeMWFZm5MUhsIyE6QWc/uUddk5KFHJxtEehXFN+axM5547ku/7Vv07KJKKgT
 IIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Rl5G26CInNXxZLgvUoDZCTBON+72/3XJ1+tj/YrIrs=;
 b=JMj2MfT4Tu+2Fha9TjxptHSgOC5p9RrcuYSbQEv+IzvHAiG5ZCLc3wZaPrdnC0O9sM
 CBwlS20UjloyAzq+py2/jWH+huQgkeKRih/tzb7068pNJj5PE6GrTUIa2brf+wfbl1YQ
 WqsgViwbjI4uTZnXyLLyKJKw5hDpgkSD0c7zYf6lf/wj3t8paxew0PPwkWst26GL/bGP
 YZ1TdObL10hHpwL0q83tNZtAZFBj9tBmGHov5ijEOY231gCkkFk3ANmgmBhzTXAgC2Gl
 YOvGspNuyYf9f490bTI6n8dZ6c96UK24IEnCnBfFF2Yc9S4sBLUaa5UoWQLsMTGFvT+v
 1opA==
X-Gm-Message-State: AOAM530xoJV3ZW7+fOQZsEFkqXM4qbfepjkcZI3w1mASG/GkcS+vy/L5
 H2Nmwm1fDkH0yPepqcfwAhc=
X-Google-Smtp-Source: ABdhPJw76Q1+gK/xnyHMxR2askBULAluqYD2R0fcx3STYIH3VcbWODu5IsbrqSCKpX6TFtxL64BjoQ==
X-Received: by 2002:adf:9d4b:: with SMTP id o11mr5431338wre.29.1631791858513; 
 Thu, 16 Sep 2021 04:30:58 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:30:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 14/26] drm/i915: use the new iterator in
 i915_sw_fence_await_reservation v2
Date: Thu, 16 Sep 2021 13:30:30 +0200
Message-Id: <20210916113042.3631-15-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplifying the code a bit.

v2: use dma_resv_for_each_fence instead, according to Tvrtko the lock is
    held here anyway.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/i915_sw_fence.c | 51 +++++-----------------------
 1 file changed, 9 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index c589a681da77..86eb9ece71e0 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -572,56 +572,23 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
 				    unsigned long timeout,
 				    gfp_t gfp)
 {
-	struct dma_fence *excl;
+	struct dma_resv_iter cursor;
+	struct dma_fence *f;
 	int ret = 0, pending;
 
 	debug_fence_assert(fence);
 	might_sleep_if(gfpflags_allow_blocking(gfp));
 
-	if (write) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-
-		ret = dma_resv_get_fences(resv, &excl, &count, &shared);
-		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			if (shared[i]->ops == exclude)
-				continue;
-
-			pending = i915_sw_fence_await_dma_fence(fence,
-								shared[i],
-								timeout,
-								gfp);
-			if (pending < 0) {
-				ret = pending;
-				break;
-			}
-
-			ret |= pending;
-		}
-
-		for (i = 0; i < count; i++)
-			dma_fence_put(shared[i]);
-		kfree(shared);
-	} else {
-		excl = dma_resv_get_excl_unlocked(resv);
-	}
-
-	if (ret >= 0 && excl && excl->ops != exclude) {
-		pending = i915_sw_fence_await_dma_fence(fence,
-							excl,
-							timeout,
+	dma_resv_for_each_fence(resv, &cursor, write, f) {
+		pending = i915_sw_fence_await_dma_fence(fence, f, timeout,
 							gfp);
-		if (pending < 0)
+		if (pending < 0) {
 			ret = pending;
-		else
-			ret |= pending;
-	}
-
-	dma_fence_put(excl);
+			break;
+		}
 
+		ret |= pending;
+	}
 	return ret;
 }
 
-- 
2.25.1

