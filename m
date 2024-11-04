Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEAA9BBDCB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 20:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C15510E06C;
	Mon,  4 Nov 2024 19:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="d2TFOJ1B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9194210E06C;
 Mon,  4 Nov 2024 19:10:46 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4IMVM6004434;
 Mon, 4 Nov 2024 19:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=corp-2023-11-20; bh=4ZZRS8dHCjLH4dXy/hPA0VAA1ekeT
 9riEc6CLiyfZrU=; b=d2TFOJ1B0J47+aoYEBQYYGFfDHArARYLoutE9RXCHBgik
 hJw9RH3bLFeYBRR8fx86HMUWvuIecGJmmU2Py48bngEIHm5w38h++PInZFr+bhS8
 WFGCDvp7Q/1DVH0CErjpd0fQC4nVM+7fUTOv9D5TrA1T2zL+Kt5fnV1ssPKeiBPB
 6ZefiK8H9uYqhUM+VZPv1IQTvVgSCKtuNHV/KU8q/CVjJFLLcnkVf+Lrk6qD4UOl
 J+dE1t2s6C4BjvdDY/mw0I5vRj6u1clyJHp7S5pzMZ3AQ8hewXaILl7VWEdsDgSg
 W+NAAVArFI25WDUIaDrhqI04Src7Errn3JGXJP5NQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nanyundg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Nov 2024 19:10:26 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 4A4Hu8Ma036171; Mon, 4 Nov 2024 19:10:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 42nahcf29j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Nov 2024 19:10:24 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A4JAOGu013414;
 Mon, 4 Nov 2024 19:10:24 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 42nahcf28e-1; Mon, 04 Nov 2024 19:10:24 +0000
From: Sherry Yang <sherry.yang@oracle.com>
To: stable@vger.kernel.org, sashal@kernel.org, gregkh@linuxfoundation.org
Cc: sherry.yang@oracle.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 airlied@linux.ie, daniel@ffwll.ch, tvrtko.ursulin@intel.com,
 robdclark@chromium.org, chentao@kylinos.cn, chris@chris-wilson.co.uk,
 mika.kuoppala@linux.intel.com, jason@jlekstrand.net,
 aravind.iddamsetty@intel.com, umesh.nerlige.ramappa@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 5.15.y] drm/i915: Fix potential context UAFs
Date: Mon,  4 Nov 2024 11:10:21 -0800
Message-ID: <20241104191021.3334875-1-sherry.yang@oracle.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_17,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411040157
X-Proofpoint-ORIG-GUID: bYvtKvEXdYGJo-raSa0RreUwVVwTSiDS
X-Proofpoint-GUID: bYvtKvEXdYGJo-raSa0RreUwVVwTSiDS
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

From: Rob Clark <robdclark@chromium.org>

commit afce71ff6daa9c0f852df0727fe32c6fb107f0fa upstream.

gem_context_register() makes the context visible to userspace, and which
point a separate thread can trigger the I915_GEM_CONTEXT_DESTROY ioctl.
So we need to ensure that nothing uses the ctx ptr after this.  And we
need to ensure that adding the ctx to the xarray is the *last* thing
that gem_context_register() does with the ctx pointer.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Fixes: eb4dedae920a ("drm/i915/gem: Delay tracking the GEM context until it is registered")
Fixes: a4c1cdd34e2c ("drm/i915/gem: Delay context creation (v3)")
Fixes: 49bd54b390c2 ("drm/i915: Track all user contexts per client")
Cc: <stable@vger.kernel.org> # v5.10+
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
[tursulin: Stable and fixes tags add/tidy.]
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230103234948.1218393-1-robdclark@gmail.com
(cherry picked from commit bed4b455cf5374e68879be56971c1da563bcd90c)
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
[Sherry: bp to fix CVE-2023-52913, ignore context conflicts due to
missing commit 49bd54b390c2 "drm/i915: Track all user contexts per
client")]
Signed-off-by: Sherry Yang <sherry.yang@oracle.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 24 +++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 0eb4a0739fa2..0a7c4548b77f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1436,6 +1436,10 @@ void i915_gem_init__contexts(struct drm_i915_private *i915)
 	init_contexts(&i915->gem.contexts);
 }
 
+/*
+ * Note that this implicitly consumes the ctx reference, by placing
+ * the ctx in the context_xa.
+ */
 static void gem_context_register(struct i915_gem_context *ctx,
 				 struct drm_i915_file_private *fpriv,
 				 u32 id)
@@ -1449,13 +1453,13 @@ static void gem_context_register(struct i915_gem_context *ctx,
 	snprintf(ctx->name, sizeof(ctx->name), "%s[%d]",
 		 current->comm, pid_nr(ctx->pid));
 
-	/* And finally expose ourselves to userspace via the idr */
-	old = xa_store(&fpriv->context_xa, id, ctx, GFP_KERNEL);
-	WARN_ON(old);
-
 	spin_lock(&i915->gem.contexts.lock);
 	list_add_tail(&ctx->link, &i915->gem.contexts.list);
 	spin_unlock(&i915->gem.contexts.lock);
+
+	/* And finally expose ourselves to userspace via the idr */
+	old = xa_store(&fpriv->context_xa, id, ctx, GFP_KERNEL);
+	WARN_ON(old);
 }
 
 int i915_gem_context_open(struct drm_i915_private *i915,
@@ -1932,14 +1936,22 @@ finalize_create_context_locked(struct drm_i915_file_private *file_priv,
 	if (IS_ERR(ctx))
 		return ctx;
 
+	/*
+	 * One for the xarray and one for the caller.  We need to grab
+	 * the reference *prior* to making the ctx visble to userspace
+	 * in gem_context_register(), as at any point after that
+	 * userspace can try to race us with another thread destroying
+	 * the context under our feet.
+	 */
+	i915_gem_context_get(ctx);
+
 	gem_context_register(ctx, file_priv, id);
 
 	old = xa_erase(&file_priv->proto_context_xa, id);
 	GEM_BUG_ON(old != pc);
 	proto_context_close(pc);
 
-	/* One for the xarray and one for the caller */
-	return i915_gem_context_get(ctx);
+	return ctx;
 }
 
 struct i915_gem_context *
-- 
2.46.0

