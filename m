Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6B057329D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 11:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8B098A90;
	Wed, 13 Jul 2022 09:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D806898A7D;
 Wed, 13 Jul 2022 09:30:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 42043B81D51;
 Wed, 13 Jul 2022 09:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFFDCC3411E;
 Wed, 13 Jul 2022 09:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657704621;
 bh=8B8ALfcdC8EwjTlOgjtqiOwcizUYe+bdB6pww0lUJSw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qiuOt/04hD+49hrrU8PsBpLBHnWDBB8euq2/LV+O1tPFgamgy3XhpewKG7QjLzh7q
 5g4fJT6rG+llX1qDOZ2xGnZXVA6wFmlYFs1/ISmx4Ha+5W8vc4AZHSwy2C/nYmoDTw
 kl3mmXGzu4RIlx4yfcwjt2uWKnBHUP+kC3AWhEqQmMs4YTP96We4/VId6Wmysf8T3D
 /z5PCKLLaeXA8wPLyLVBOcAvEkU/WvrPAnp+qMKvbJgYQsYOQKy7dE/5z/IFPVRexW
 Q1DNXK9nALdUZuRuxHDN3cTpNVdm31Kg+OAfrypieflPE8kmeiuOfhtk1O1ezN3WBg
 UO3H7jIBONAeA==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBYhH-0050LL-JV;
 Wed, 13 Jul 2022 10:30:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 04/21] drm/i915/gt: Only invalidate TLBs exposed to user
 manipulation
Date: Wed, 13 Jul 2022 10:30:01 +0100
Message-Id: <d145f957593b3a20fe27bb0ec061be7b3ecbd320.1657703926.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657703926.git.mchehab@kernel.org>
References: <cover.1657703926.git.mchehab@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Fei Yang <fei.yang@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris.p.wilson@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>, stable@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

Don't flush TLBs when the buffer is only used in the GGTT under full
control of the kernel, as there's no risk of concurrent access
and stale access from prefetch.

We only need to invalidate the TLB if they are accessible by the user.
That helps to reduce the performance regression introduced by TLB
invalidate logic.

Cc: stable@vger.kernel.org
Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")
Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH 00/21] at: https://lore.kernel.org/all/cover.1657703926.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/i915_vma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index ef3b04c7e153..646f419b2035 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -538,7 +538,8 @@ int i915_vma_bind(struct i915_vma *vma,
 				   bind_flags);
 	}
 
-	set_bit(I915_BO_WAS_BOUND_BIT, &vma->obj->flags);
+	if (bind_flags & I915_VMA_LOCAL_BIND)
+		set_bit(I915_BO_WAS_BOUND_BIT, &vma->obj->flags);
 
 	atomic_or(bind_flags, &vma->flags);
 	return 0;
-- 
2.36.1

