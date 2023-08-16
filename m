Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 635B577E823
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 20:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D18010E39A;
	Wed, 16 Aug 2023 18:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A63310E39A;
 Wed, 16 Aug 2023 18:04:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0F38662DFC;
 Wed, 16 Aug 2023 18:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63FB9C433C8;
 Wed, 16 Aug 2023 18:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692209045;
 bh=VIZplUQWDEfLgSE4zA0pe93EPJ0XYGhoZfQF7z/VLtM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SjvIipi7hME4kMUUM9gbC7AP8Oud5NAyZstGoIaGq46r1E725MsBb8ZJe17xQUcVg
 8iZ8mgVgf2CHcT2E5o5DG0HitZiK1rdtbqHjfBpT+N/NBnj668l4vXaqc/udxBHWwt
 XvfkN3mArqgwbtwNVzX08QayJjDbaal2EpRJhFBLJJf+NPHprpfMkFxm9R4SZV8V81
 zGZ6TKPlyIp+MkEaxT8VTOQU3b7pUxsluRp87BPVTo+m9/x3ulrUucAZfB9aHMmrRg
 vIHupO4thIkfzft0S1KShhglVzK1F7MqhJotjQM7N4E8sVNKi6TEMYYt2j6Gda4nvb
 w4HRE/I1vIpXw==
Date: Wed, 16 Aug 2023 12:05:06 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2][next] nouveau/svm: Split assignment from if conditional
Message-ID: <6b900e80b5587187c68efc788f5b042ca747d374.1692208802.git.gustavoars@kernel.org>
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

Fix checkpatch.pl ERROR: do not use assignment in if condition.

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 00444ad82d18..cc03e0c22ff3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -1063,7 +1063,8 @@ nouveau_svm_init(struct nouveau_drm *drm)
 	if (drm->client.device.info.family > NV_DEVICE_INFO_V0_PASCAL)
 		return;
 
-	if (!(drm->svm = svm = kzalloc(struct_size(drm->svm, buffer, 1), GFP_KERNEL)))
+	drm->svm = svm = kzalloc(struct_size(drm->svm, buffer, 1), GFP_KERNEL);
+	if (!drm->svm)
 		return;
 
 	drm->svm->drm = drm;
-- 
2.34.1

