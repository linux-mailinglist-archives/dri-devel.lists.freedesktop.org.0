Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60973122001
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 01:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2E06E918;
	Tue, 17 Dec 2019 00:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76146E900;
 Tue, 17 Dec 2019 00:55:44 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df827750000>; Mon, 16 Dec 2019 16:55:17 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 16 Dec 2019 16:55:44 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 16 Dec 2019 16:55:44 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Dec
 2019 00:55:43 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 17 Dec 2019 00:55:43 +0000
Received: from jajones-aftershock.nvidia.com (Not Verified[172.20.42.105]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5df8278f0002>; Mon, 16 Dec 2019 16:55:43 -0800
From: James Jones <jajones@nvidia.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH] drm/nouveau: Fix ttm move init with multiple GPUs
Date: Mon, 16 Dec 2019 16:56:12 -0800
Message-ID: <20191217005612.2827-1-jajones@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576544117; bh=TCP4/5yEWVugcvl0hvdBwrWHIZFyBnDKpmxdTTKEHWo=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:Content-Type;
 b=ZczMC/0VBWY0YZjEWCSSY5ZYFXSPb/gUQLFd0W89yqQK0UTpG4lu0zeWYBzRHUGnJ
 ksDEu1XMLvOiWjvAv8MuzWhXAOa8wdkjFKRNtjd0O1LdOYsrZyvI++nAtBod21cT5W
 XptWoLW8x5+upGN/gmm9nPGZ1TkqXaP4YU8bOkBvQqD/h48p+LghZrmXxM0STfQrfE
 TNAGvcE3dZciRRHKjQylnX8bHTca3CNSojL9fa5KfJGw5/j7GURlMFRmmyuj2H+uEO
 mdRLOB/4G/hZPrTXgS0KzEBtiqnGdLrUkqKFgUFdDRzAlZHXlJlQpIAFw94RZ+nFfK
 c6oXKav6R0uTA==
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
Cc: nouveau@lists.freedesktop.org, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pointer used to walk the table of move ops
and pick the right one for the current GPU was
declared static, meaning its state was carried
over between invocations of the function, and also
made the function non-rentrant and thread-unsafe.
Since the table is ordered such that newer GPU
methods are listed first, the result of this was
that initializing newer GPUs after older GPUs
would result in no suitable ttm move acceleration
operations being found, and ttm would fall back
to CPU blits on the older GPUs.

This change declares the walking pointer
separately from the table and makes it non-static
to fix the logic.

Signed-off-by: James Jones <jajones@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index f8015e0318d7..1b62ccc57aef 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1162,7 +1162,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
 void
 nouveau_bo_move_init(struct nouveau_drm *drm)
 {
-	static const struct {
+	static const struct _method_table {
 		const char *name;
 		int engine;
 		s32 oclass;
@@ -1192,7 +1192,8 @@ nouveau_bo_move_init(struct nouveau_drm *drm)
 		{  "M2MF", 0, 0x0039, nv04_bo_move_m2mf, nv04_bo_move_init },
 		{},
 		{ "CRYPT", 0, 0x88b4, nv98_bo_move_exec, nv50_bo_move_init },
-	}, *mthd = _methods;
+	};
+	const struct _method_table *mthd = _methods;
 	const char *name = "CPU";
 	int ret;
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
