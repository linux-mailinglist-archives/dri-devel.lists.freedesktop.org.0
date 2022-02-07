Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF724ACC9E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 00:32:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5602E10E1A3;
	Mon,  7 Feb 2022 23:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0E110E4A5;
 Mon,  7 Feb 2022 23:32:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A9AE760E9D;
 Mon,  7 Feb 2022 23:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39CC0C004E1;
 Mon,  7 Feb 2022 23:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644276725;
 bh=Sip9F5Bfsba1zq25dZliHosPf+iJHY5BZ3ZAUNyiX9Q=;
 h=Date:From:To:Cc:Subject:From;
 b=Z10xrt4P2z6n/9x0o45n9hD44NEp74dqY2HFtNOkYHbDOZOBHzW3NM+X/d37mv1JW
 fRjbOnc3wDHiiE4Zr4YSykieNOuTFOEp3HVY6jZPNpVtd6kTIU7Sqpp9zzHNsnRj6E
 CXcbXcl1vAgcR0lmVoak0wAWhi2tv/dGkk46nimauCfCoAMuNJ51ZhdhrO4E0xVTwA
 dotKn5nQTpYAq10NCOZQIUHWMq2TMA+1jxDstrR0d0Q8tkjNqQWzjzAXy4caKkqill
 nZPNRBlLYoOKE4uUp8Btdwf2+zHjpK1cT8MkwCJzNFYPASeiAfvobxJEm1cXs8XZV5
 oYTFfvpydxkRg==
Date: Mon, 7 Feb 2022 17:39:23 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH][next] nouveau/svm: Use struct_size() helper in
 nouveau_pfns_map()
Message-ID: <20220207233923.GA524723@embeddedor>
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
Cc: nouveau@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make use of the struct_size() helper instead of an open-coded version,
in order to avoid any potential type mistakes or integer overflows that,
in the worse scenario, could lead to heap overflows.

Link: https://github.com/KSPP/linux/issues/160
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 266809e511e2..46a5a1016e37 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -925,8 +925,8 @@ nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
 
 	mutex_lock(&svmm->mutex);
 
-	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args, sizeof(*args) +
-				npages * sizeof(args->p.phys[0]), NULL);
+	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args,
+				struct_size(args, p.phys, npages), NULL);
 
 	mutex_unlock(&svmm->mutex);
 }
-- 
2.27.0

