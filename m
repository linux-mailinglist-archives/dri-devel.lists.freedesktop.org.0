Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E379A79E1D7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 10:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C5310E47E;
	Wed, 13 Sep 2023 08:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E372E10E47D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 08:18:37 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-31f7638be6eso5756248f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 01:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694593116; x=1695197916; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p0T8G3R6507VORdtnswAiI9E09gNgvj+W/NjhPnIOgc=;
 b=DmasonVKvr/6CccdfOkG3wtSHQJz0/CVUUg3G/YbxW8+ZgyHfZSU1ZX3Ze0TpnnzmI
 gh9kQPvYwqZ/NzH1mBVQiWCoGrg7N31WEoEZkJHcQpf7UYpJ8aNgEvcFz1SX+sMA/IAj
 +Ax5/qwPexHmaKGtpE5sNuv6vu38cUoVVULwRQ3XAbWTrq5De31KLXW/jyhOPcQWMSOR
 sa8jZ9BvsU5TVZtRyFnuX3f1AlIF3GrUgWka1LxLLEZ4KmfoOPoAmWRlcqykf/qlCiXp
 yls2r4R0OhkbcpDnCg5i+ZOaB+WYcF/Uo66wzDnKpN/CsnVUfXBGHgMIolm+let5EDgN
 H/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694593116; x=1695197916;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p0T8G3R6507VORdtnswAiI9E09gNgvj+W/NjhPnIOgc=;
 b=UFWseQnMu25exeQLfl5djNh5MM7cAA4mu/RPVzPHN4mcxZ46T2lCQsnVKK1o2bLfYh
 vvkHhMqLuQUE1SCrIbenedj8Yp8C9HLLHQRuRZ7QORCOavbc9BOBDtNxf57LvZ7SCHfo
 +VmIqAVfDTsDRUe87csJKxot3TUMUb+0UTDKoyI1sT7cVz7rtRxAS545+yWnlVqOcUca
 YaV4SB4O8vz0LXI0VvWYxyBd3fvdKlaq+UWJk3WzD4lLZqr2tdYn7pAANWGpTw8a9XBP
 uPZwudjWnoPTzCyraSYKWkL24pmjmDanFIShRH7oty1fifKyV4velINgOcRUpt/gxVUc
 PLiw==
X-Gm-Message-State: AOJu0YxPG/b8Z414yewgd8EQuBtyjozSbNliC4FaL5KyAWMrJKsv9ldY
 oLbjKG8oTkjAg4scfC2m47EMxw==
X-Google-Smtp-Source: AGHT+IHeUTw7CplSMuNF9IZLmnrwVvu9RTNpnTc9kOuLVW/S+0mQbzZT1Fpm5Ke/E/yXYbLhgadW7A==
X-Received: by 2002:adf:ea85:0:b0:319:7c1f:8dae with SMTP id
 s5-20020adfea85000000b003197c1f8daemr1673532wrm.3.1694593116282; 
 Wed, 13 Sep 2023 01:18:36 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 c6-20020adfed86000000b0031de43fe9bfsm14899765wro.0.2023.09.13.01.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 01:18:36 -0700 (PDT)
Date: Wed, 13 Sep 2023 11:17:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH] drm/i915/gt: Prevent error pointer dereference
Message-ID: <455b2279-2e08-4d00-9784-be56d8ee42e3@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Fei Yang <fei.yang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the check for "if (IS_ERR(obj))" in front of the call to
i915_gem_object_set_cache_coherency() which dereferences "obj".
Otherwise it will lead to a crash.

Fixes: 43aa755eae2c ("drm/i915/mtl: Update cache coherency setting for context structure")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/i915/gt/intel_lrc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 957d0aeb0c02..c378cc7c953c 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1094,6 +1094,9 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
 					  I915_BO_ALLOC_PM_VOLATILE);
 	if (IS_ERR(obj)) {
 		obj = i915_gem_object_create_shmem(engine->i915, context_size);
+		if (IS_ERR(obj))
+			return ERR_CAST(obj);
+
 		/*
 		 * Wa_22016122933: For Media version 13.0, all Media GT shared
 		 * memory needs to be mapped as WC on CPU side and UC (PAT
@@ -1102,8 +1105,6 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
 		if (intel_gt_needs_wa_22016122933(engine->gt))
 			i915_gem_object_set_cache_coherency(obj, I915_CACHE_NONE);
 	}
-	if (IS_ERR(obj))
-		return ERR_CAST(obj);
 
 	vma = i915_vma_instance(obj, &engine->gt->ggtt->vm, NULL);
 	if (IS_ERR(vma)) {
