Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6B0A7A8C8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 19:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17B410E2D5;
	Thu,  3 Apr 2025 17:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dPoLcU6S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E9A10E2BE;
 Thu,  3 Apr 2025 17:41:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 69D88A450A2;
 Thu,  3 Apr 2025 17:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED42C4CEE7;
 Thu,  3 Apr 2025 17:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743702083;
 bh=8lR9ylBsfo7PBLZHWh9qmMylsgZ+XsmxjxGaNWbQYxA=;
 h=Date:From:To:Cc:Subject:From;
 b=dPoLcU6SLa7ZgTJZaHaiRDW64dPYRH3R0/kUgslJwP6Oc8Zk4UilUUJ+wx4HPhgf9
 PC+5aY3fNv3g0VpN+shYeyJMpiajZZ9sQ6nHWfFRDICVfbvbozCbJklIdl3GnJ/ZIK
 SZg7VIarvzNTFY7QwvkgrbUmcKhqG/uKyKWh3eDD15JnnIRBGDC24gcPTPpieWO0H8
 kcHvzqm9K4M2vSSmwdthaiiWzgKgJBBrfJtdU88EiN1ljDnX3iTgMgaFJdckCJ8y90
 YoNkIDTPGC9a1uk13aXXd0386xbs0TBu/Yw0XNJ/21lWmDmQco7jptuqkA8IhCPArs
 nCKRo+DLE/qUA==
Date: Thu, 3 Apr 2025 11:41:21 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH][next] drm/nouveau: fifo: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <Z-7IQcWNePAMQEM0@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
a flexible structure where the size of the flexible-array member
is known at compile-time, and refactor the rest of the code,
accordingly.

So, with these changes, fix the following warning:

drivers/gpu/drm/nouveau/nvif/fifo.c:29:42: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/nouveau/nvif/fifo.c | 32 ++++++++++++-----------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/fifo.c b/drivers/gpu/drm/nouveau/nvif/fifo.c
index a463289962b2..f8772340fec4 100644
--- a/drivers/gpu/drm/nouveau/nvif/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvif/fifo.c
@@ -25,33 +25,28 @@ static int
 nvif_fifo_runlists(struct nvif_device *device)
 {
 	struct nvif_object *object = &device->object;
-	struct {
-		struct nv_device_info_v1 m;
-		struct {
-			struct nv_device_info_v1_data runlists;
-			struct nv_device_info_v1_data runlist[64];
-		} v;
-	} *a;
+	DEFINE_RAW_FLEX(struct nv_device_info_v1, a, data, 65);
+	struct nv_device_info_v1_data *runlists = &a->data[0];
+	struct nv_device_info_v1_data *runlist = &a->data[1];
+	const u8 rl_cnt = (__struct_size(a) - sizeof(*a)) / sizeof(*a->data) - 1;
 	int ret, i;
 
 	if (device->runlist)
 		return 0;
 
-	if (!(a = kmalloc(sizeof(*a), GFP_KERNEL)))
-		return -ENOMEM;
-	a->m.version = 1;
-	a->m.count = sizeof(a->v) / sizeof(a->v.runlists);
-	a->v.runlists.mthd = NV_DEVICE_HOST_RUNLISTS;
-	for (i = 0; i < ARRAY_SIZE(a->v.runlist); i++) {
-		a->v.runlist[i].mthd = NV_DEVICE_HOST_RUNLIST_ENGINES;
-		a->v.runlist[i].data = i;
+	a->version = 1;
+	a->count = (__struct_size(a) - sizeof(*a)) / sizeof(*a->data);
+	runlists->mthd = NV_DEVICE_HOST_RUNLISTS;
+	for (i = 0; i < rl_cnt; i++) {
+		runlist[i].mthd = NV_DEVICE_HOST_RUNLIST_ENGINES;
+		runlist[i].data = i;
 	}
 
 	ret = nvif_object_mthd(object, NV_DEVICE_V0_INFO, a, sizeof(*a));
 	if (ret)
 		goto done;
 
-	device->runlists = fls64(a->v.runlists.data);
+	device->runlists = fls64(runlists->data);
 	device->runlist = kcalloc(device->runlists, sizeof(*device->runlist),
 				  GFP_KERNEL);
 	if (!device->runlist) {
@@ -60,12 +55,11 @@ nvif_fifo_runlists(struct nvif_device *device)
 	}
 
 	for (i = 0; i < device->runlists; i++) {
-		if (a->v.runlist[i].mthd != NV_DEVICE_INFO_INVALID)
-			device->runlist[i].engines = a->v.runlist[i].data;
+		if (runlist[i].mthd != NV_DEVICE_INFO_INVALID)
+			device->runlist[i].engines = runlist[i].data;
 	}
 
 done:
-	kfree(a);
 	return ret;
 }
 
-- 
2.43.0

