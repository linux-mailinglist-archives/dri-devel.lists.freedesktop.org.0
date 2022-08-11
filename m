Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A12A590274
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 18:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8486A8B61C;
	Thu, 11 Aug 2022 16:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B287510F2E1;
 Thu, 11 Aug 2022 16:10:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A574D6141C;
 Thu, 11 Aug 2022 16:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E60C433C1;
 Thu, 11 Aug 2022 16:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660234221;
 bh=BlKBMOH6o2j7WE88oomjY+BnlOaiVoPJIpUyChZ8a3s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pX8703UfMDeRjSCn199oWi7qDwrN3OiG4psNN53sNYWiac+FetAZoNKcWdtszJWFx
 +VfUnHYCQC0nFNUODp58A44CJMl/BpfWwmPD+CZtoFrhLMOzXNvDifD7wvP5FZ0xNC
 24ssME9y4UH8AViAWEQ5NFmFN/L2ZvBz8ibKrNhKE4d30adP7c11hfz3RxBp1MooRC
 Qy+Prbpy469LSdLT+NQZwxktV7t9IYGA05+4unLJWnUQ6qA/Gu6ZpGjGTkTcy19BQZ
 ZP2vgnjzngYUDMqwdyNyvWt0zJ3yAgejFUyqjjMUh+DuBbqIZuQOUBYCaVsJkxtna1
 KzjuJhYUKJXQA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 09/14] drm/nouveau/nvkm: use list_add_tail() when
 building object tree
Date: Thu, 11 Aug 2022 12:09:37 -0400
Message-Id: <20220811160948.1542842-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811160948.1542842-1-sashal@kernel.org>
References: <20220811160948.1542842-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, kherbst@redhat.com, airlied@linux.ie,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

[ Upstream commit 61c1f340bc809a1ca1e3c8794207a91cde1a7c78 ]

Fixes resume from hibernate failing on (at least) TU102, where cursor
channel init failed due to being performed before the core channel.

Not solid idea why suspend-to-ram worked, but, presumably HW being in
an entirely clean state has something to do with it.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
index d777df5a64e6..2aa0d6fed580 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
@@ -128,7 +128,7 @@ nvkm_ioctl_new(struct nvkm_client *client,
 	if (ret == 0) {
 		ret = nvkm_object_init(object);
 		if (ret == 0) {
-			list_add(&object->head, &parent->tree);
+			list_add_tail(&object->head, &parent->tree);
 			if (nvkm_object_insert(object)) {
 				client->data = object;
 				return 0;
-- 
2.35.1

