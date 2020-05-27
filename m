Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F2B1E4531
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 16:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24B289A20;
	Wed, 27 May 2020 14:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EC189A1F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 14:05:56 +0000 (UTC)
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1Mo6WJ-1jFYx33Vox-00pcRT; Wed, 27 May 2020 16:05:42 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: [PATCH 3/3] drm/i915/selftests: avoid bogus maybe-uninitialized
 warning
Date: Wed, 27 May 2020 16:05:10 +0200
Message-Id: <20200527140526.1458215-3-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200527140526.1458215-1-arnd@arndb.de>
References: <20200527140526.1458215-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Bs1kH9SiEUr82+i0D5b4IjNzyMWhRc9ReAI4hRbtaSg+wd4Y+kE
 gsHtJL0netn243C7nHQamvh/2VpFFj/mbWQZYBUlmk15Ur8+KyRpRLNWTSOpnSXrG6ACa8Y
 a50vkShJOWxV4ykm7XUMk0pidxZYJm1W5/Zw9bnILBSY8qbgoV8/N+o6gDRiA7eO91pvrsn
 zFA51RKJXl5UhRluoBa/w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+3169tARU2k=:uC5t2mXS/rarwbKpJ4p1IL
 TkcNg5L4b0eQa1dnkKmj9R/sSkzpoRvOHXS4my5yaaC5Ipgn4d1MzqW671izesykz8iby4m+5
 z1IvD+l5KijKgQE7VVqp37PdP1Z8kyBPIudjh8SOJe9IwGRQxJn23IKziQzSrbGAOabL33Rqj
 UC9ZjpLC9GhatIlmPNENyXJDcfdNAmC8jVR75LlmscyCeIQgmKczM8/5DrTdldpueq8wUOTyz
 JV72tDCgqyNcaDaert16Y0sw3l/yCWMETugA/v0l5p8yJzjYFsworrldztzOG9TwwtVECsezT
 Tyx7TQTlKGfirXDvwAFcG5DItmsJw3HVXeTdStNblLhTBLKsOQg9tXZYYJH3LMxOlzLovL0pt
 X4NQgpyhSnJRfCn4ZnC6jt0nte5GJ/7rVDPvPpyNFlqKDZ4tZ7ODiRKv7v2S3TiZ7h/9axGxz
 9/rAxDSK75RmKxgRZFX/z93DUKLmUODUq+S//87z6aF6npDlxOEM5RmRFnCv6S3uA20KZP1DG
 exucUvsLOIrOHJz/b0WA3dI4HoqagLbzF4yIpfoAwfKFe2zu1nlXPeMEVu8nmUw2wSK+Mfbne
 HKWAq152YlnhozAc2jzA2OqZk28FYLTob4ZEMpqiy2XClWwByz/Wlq/nyHi4i/k8x/3TqZJpQ
 OSkAS/+T+5Vq4WASVKIzNKWyiaw9J5BL5wPMTejvRY1jag3b1jmhTWmVMcEkiMBG6fhbr7ysx
 pzkkkkZx0UDRaWqZpEwWJKveoIG9zxc9XE8ju3hQuslsSe94To3JlK2xF+KNjaL6ne+vqnBSB
 bUYPQNyOqcNk6d8FiJRHXwa+NGAXkcy95rnATkLAbrJtAtHBPE=
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
Cc: Andi Shyti <andi.shyti@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gcc has a problem following values through IS_ERR/PTR_ERR macros,
leading to a false-positive warning in allmodconfig, with any
compiler version:

In file included from drivers/gpu/drm/i915/gt/intel_lrc.c:5892:
drivers/gpu/drm/i915/gt/selftest_lrc.c: In function 'create_gpr_client.isra.0':
drivers/gpu/drm/i915/gt/selftest_lrc.c:2902:23: error: 'rq' may be used uninitialized in this function [-Werror=maybe-uninitialized]

This one is hard to avoid without impairing readability or adding a
bugus NULL pointer.

Fixes: c92724de6db1 ("drm/i915/selftests: Try to detect rollback during batchbuffer preemption")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/i915/gt/selftest_lrc.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index 824f99c4cc7c..933c3f5adf0a 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -2908,23 +2908,25 @@ create_gpr_client(struct intel_engine_cs *engine,
 
 	vma = i915_vma_instance(global->obj, ce->vm, NULL);
 	if (IS_ERR(vma)) {
-		err = PTR_ERR(vma);
+		rq = ERR_CAST(vma);
 		goto out_ce;
 	}
 
 	err = i915_vma_pin(vma, 0, 0, PIN_USER);
-	if (err)
+	if (err) {
+		rq = ERR_PTR(err);
 		goto out_ce;
+	}
 
 	batch = create_gpr_user(engine, vma, offset);
 	if (IS_ERR(batch)) {
-		err = PTR_ERR(batch);
+		rq = ERR_CAST(batch);
 		goto out_vma;
 	}
 
 	rq = intel_context_create_request(ce);
 	if (IS_ERR(rq)) {
-		err = PTR_ERR(rq);
+		rq = ERR_CAST(rq);
 		goto out_batch;
 	}
 
@@ -2946,17 +2948,20 @@ create_gpr_client(struct intel_engine_cs *engine,
 	i915_vma_unlock(batch);
 	i915_vma_unpin(batch);
 
-	if (!err)
+	if (!err) {
 		i915_request_get(rq);
-	i915_request_add(rq);
-
+		i915_request_add(rq);
+	} else {
+		i915_request_add(rq);
+		rq = ERR_PTR(err);
+	}
 out_batch:
 	i915_vma_put(batch);
 out_vma:
 	i915_vma_unpin(vma);
 out_ce:
 	intel_context_put(ce);
-	return err ? ERR_PTR(err) : rq;
+	return rq;
 }
 
 static int preempt_user(struct intel_engine_cs *engine,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
