Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE3977E81E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 20:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E050D10E39D;
	Wed, 16 Aug 2023 18:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF34010E398;
 Wed, 16 Aug 2023 18:03:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F4A362E25;
 Wed, 16 Aug 2023 18:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1956C433C8;
 Wed, 16 Aug 2023 18:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692208985;
 bh=VZCc7I2wrs8o5Tj4LQsDy02WJ+lFyAmZfvikJnnhvOg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=URUt50Lpu68AZjwzUK65AbwaSQMzaypOHt0B77/aYMGDuEvcrVRbCP1+MjGsLnBHW
 rzrOzJrT2weHVZqP8tm26Qd/4bIXcDmqiLZe2hrRijXVql6cwBrIIxUpsDXz+dsYBU
 5cJb3E4/oK2SuTx8o3zmWvchiZHqLyzyjoUBoyqpT4o7hasfl+FkU2RbrdNKyzAWHT
 BWUtyLZzYstMWrB4xb2TRrxtWrtYkZ1QmyYJ3V6IEfpn9q5NdHvLA4XjO8PCcUJjdU
 XPzFthtDC41qhifOl7rC0jhRrqL78Asq6GZcISPt9FnNQ8K1q8OoJzfpauWfxnX3CV
 EBYQGtj5L6+lg==
Date: Wed, 16 Aug 2023 12:04:06 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2][next] nouveau/svm: Replace one-element array with
 flexible-array member in struct nouveau_svm
Message-ID: <087a1c335228bd245192bbb2fb347c9af1be5750.1692208802.git.gustavoars@kernel.org>
References: <cover.1692208802.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1692208802.git.gustavoars@kernel.org>
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

One-element and zero-length arrays are deprecated. So, replace
one-element array in struct nouveau_svm with flexible-array member.

This results in no differences in binary output.

Link: https://github.com/KSPP/linux/issues/338
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 186351ecf72f..00444ad82d18 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -67,7 +67,7 @@ struct nouveau_svm {
 			struct nouveau_svmm *svmm;
 		} **fault;
 		int fault_nr;
-	} buffer[1];
+	} buffer[];
 };
 
 #define FAULT_ACCESS_READ 0
@@ -1063,7 +1063,7 @@ nouveau_svm_init(struct nouveau_drm *drm)
 	if (drm->client.device.info.family > NV_DEVICE_INFO_V0_PASCAL)
 		return;
 
-	if (!(drm->svm = svm = kzalloc(sizeof(*drm->svm), GFP_KERNEL)))
+	if (!(drm->svm = svm = kzalloc(struct_size(drm->svm, buffer, 1), GFP_KERNEL)))
 		return;
 
 	drm->svm->drm = drm;
-- 
2.34.1

