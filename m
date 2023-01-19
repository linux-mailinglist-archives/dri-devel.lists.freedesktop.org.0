Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D1A674001
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 18:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A1910E97C;
	Thu, 19 Jan 2023 17:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A0410E08A;
 Thu, 19 Jan 2023 17:33:21 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 m3-20020a17090a414300b00229ef93c5b0so1765272pjg.2; 
 Thu, 19 Jan 2023 09:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LPLlNSnzLIud/SdIjCx832sULylUvnbc8QUJ7Ss0K9I=;
 b=k1cvGWKFMNGBv17/1p6v1IzvK0wT7IqiQaY0qVkC9tFtXwvnQeVPQI2Ave2sLVk2e0
 MfuORfn+YssgcdOkxHddBrrGWaafBL5IURnRtFlvY+e5+W4Og+ghhiUHLxN4jjdybZKd
 FTeoilFVWhfnfVDBFSUBRG0PTbJLHyco19q4i/XPJ48+lVMv3yAtRMr/YaPoKBbjGOhr
 5r5sfXajaygIY7QmIfKP9AM0yOgw+qMvcpeb6kxlZbXJ7cxkoupDp3VMRiLePsuT87AT
 IVokInBr9wvB6h6eApokTwZZ5nH2Br01Jrkn5i6jgjOiJE0U4l0EnAWYj1t5TRUonDU0
 l/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LPLlNSnzLIud/SdIjCx832sULylUvnbc8QUJ7Ss0K9I=;
 b=vaVmr8tBI+gO73UExU7TXzSPBzQnR9S9FiAShiL5FoGfPziZXI4YGv+cMzE4qJ/dwL
 MSoVGTdOVZp1QfzJg/Si04IGMnaykvrT14fozOy4Nq9vFSu/g1GkEO3iElSZuU2NGRF5
 Oc/EnnER30ilKXrbXCJzqSmymaSuH/0olnC0WmS0rIuwwR02CxLWwhA2ofA0HGe7Jwt/
 ZujElM7rPOmloGTlXm1Nst4+elaib3rOCgzFdez3iT7ztvwlioo4f9MIJ+bG3s4ohS7Z
 tWcikCmHrVNu2pfVUjHagcGt81E8EyEOJdekQcG6HZLI5c7zvx6h5Wc3ZYzldjinmWu3
 ki+Q==
X-Gm-Message-State: AFqh2krr9++9FebBpy6GMG/O71xKps2ow5VMBcY6rTQeS5j0g9kWOdyy
 LUQ4AuvuhAMZjnuffuZI5KmMHJwH1H0=
X-Google-Smtp-Source: AMrXdXv2qS952OsbhGL/YPtOfwGxEviqVp97NLihSuTFSqNi0Ri2Pdr4RxBMsphukL35cOs0qRhcEA==
X-Received: by 2002:a05:6a20:d045:b0:ac:3f3f:9fbd with SMTP id
 hv5-20020a056a20d04500b000ac3f3f9fbdmr13438174pzb.48.1674149600323; 
 Thu, 19 Jan 2023 09:33:20 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 k36-20020a635a64000000b0048988ed9e4bsm20523336pgm.19.2023.01.19.09.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 09:33:19 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Avoid potential vm use-after-free
Date: Thu, 19 Jan 2023 09:32:58 -0800
Message-Id: <20230119173321.2825472-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, katrinzhou <katrinzhou@tencent.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Adding the vm to the vm_xa table makes it visible to userspace, which
could try to race with us to close the vm.  So we need to take our extra
reference before putting it in the table.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Note, you could list commit e1a7ab4fca0c ("drm/i915: Remove the vm open
count") as the "fixed" commit, but really the issue seems to go back
much further (with the fix needing some backporting in the process).

 drivers/gpu/drm/i915/gem/i915_gem_context.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 6250de9b9196..e4b78ab4773b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1861,11 +1861,19 @@ static int get_ppgtt(struct drm_i915_file_private *file_priv,
 	vm = ctx->vm;
 	GEM_BUG_ON(!vm);
 
+	/*
+	 * Get a reference for the allocated handle.  Once the handle is
+	 * visible in the vm_xa table, userspace could try to close it
+	 * from under our feet, so we need to hold the extra reference
+	 * first.
+	 */
+	i915_vm_get(vm);
+
 	err = xa_alloc(&file_priv->vm_xa, &id, vm, xa_limit_32b, GFP_KERNEL);
-	if (err)
+	if (err) {
+		i915_vm_put(vm);
 		return err;
-
-	i915_vm_get(vm);
+	}
 
 	GEM_BUG_ON(id == 0); /* reserved for invalid/unassigned ppgtt */
 	args->value = id;
-- 
2.38.1

