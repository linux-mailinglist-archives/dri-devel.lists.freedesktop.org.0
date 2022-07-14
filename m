Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD90574CEC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 14:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95F31127A6;
	Thu, 14 Jul 2022 12:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99376112953;
 Thu, 14 Jul 2022 12:06:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3FCAD61DE7;
 Thu, 14 Jul 2022 12:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05F2C36AEB;
 Thu, 14 Jul 2022 12:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657800390;
 bh=Jh3Kqp3PsRoCdV/mDv7WITLyqYY/AxdJ08g/jrYtT8s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OIgjqA3dm1ZNcOs4sigMBewggrVchZpVTA5rNuae+XM7YrjOQHNW9/uymVQfTZDu9
 Xxi0CncfiWX3qzNg0VM5v0h4yf6r/fp0ZbaKiHiocTVTEU4AKBTXHyDwKXA421eSs6
 PFQ/48Ul/D/UNepuw+Yx03bwVqEsN0vHzE9ihZzdTRjMxUBvOsfx01M+SYgiB0sk6k
 pf/vJ6rMebk8cNf53NU2TFIU0VWQnPNWU6YojkyrNyDhGXnX4Xzep3yXrY3qPwcVvF
 ChOV3jdrTXnDovNmFCdrCyOLJ34wyvUwN6SaPSzogeSgmqYwa2zqftFBvbow6Ak34a
 SOyTtnfKEslWg==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBxbv-0059se-RS;
 Thu, 14 Jul 2022 13:06:27 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 04/21] drm/i915/gt: Only invalidate TLBs exposed to user
 manipulation
Date: Thu, 14 Jul 2022 13:06:09 +0100
Message-Id: <c0ab69f803cfe439f9218d0c0a930eae563dee83.1657800199.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657800199.git.mchehab@kernel.org>
References: <cover.1657800199.git.mchehab@kernel.org>
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

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/21] at: https://lore.kernel.org/all/cover.1657800199.git.mchehab@kernel.org/

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

