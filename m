Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A00B25B7A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 08:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4658910E7EE;
	Thu, 14 Aug 2025 06:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lCQ7iZsU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4A910E7ED;
 Thu, 14 Aug 2025 06:01:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2EDE843973;
 Thu, 14 Aug 2025 06:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3EBC4CEEF;
 Thu, 14 Aug 2025 06:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755151273;
 bh=7vPHh6uzcmYyhzSxVfwn2NBujgPJ544BwypiXhxBzzU=;
 h=Date:From:To:Cc:Subject:From;
 b=lCQ7iZsU4vTCi/Qtl/lBCWUVPeGi2GVqLbuwU1FMAsX4xiLF49sU2owGOwyfUQisz
 CGjLeni5abt+oFdrKw5fS00eMpa4LrQm8T8HxG8t1/2p010Q/w7AlNoKSR8rAhluy7
 MAYOL4t7Zo8pS/6cBpkdqKo/ivgM2uBe3JUDyKy5Mu54dnC33uo7CmHU3tzfqFuZGt
 Gvsx1CsiWq602MCK7d7cnv5eYjO0miU/5cbgPbgvWkneISuiUb9FlFUJnx/LSx6Uiq
 8YKmseoc5Avp7XKAF4xLmMzCRLeYVIt0U9e7KUQ/HJwDcKq6wpVTiC9H7Mr2i53nnQ
 hERtcjQJgMMjA==
Date: Thu, 14 Aug 2025 15:01:07 +0900
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v3][next] drm/nouveau: fifo: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <aJ17oxJYcqqr3946@kspp>
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

Use the new TRAILING_OVERLAP() helper to fix the following warning:

drivers/gpu/drm/nouveau/nvif/fifo.c:29:42: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

This helper creates a union between a flexible-array member (FAM)
and a set of members that would otherwise follow it. This overlays
the trailing members onto the FAM while preserving the original
memory layout.

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v3:
 - Use the new TRAILING_OVERLAP() helper.

Changes in v2:
 - Adjust heap allocation.

 drivers/gpu/drm/nouveau/nvif/fifo.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/fifo.c b/drivers/gpu/drm/nouveau/nvif/fifo.c
index a463289962b2..b0ab80995d98 100644
--- a/drivers/gpu/drm/nouveau/nvif/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvif/fifo.c
@@ -25,13 +25,12 @@ static int
 nvif_fifo_runlists(struct nvif_device *device)
 {
 	struct nvif_object *object = &device->object;
-	struct {
-		struct nv_device_info_v1 m;
+	TRAILING_OVERLAP(struct nv_device_info_v1, m, data,
 		struct {
 			struct nv_device_info_v1_data runlists;
 			struct nv_device_info_v1_data runlist[64];
 		} v;
-	} *a;
+	) *a;
 	int ret, i;
 
 	if (device->runlist)
-- 
2.43.0

