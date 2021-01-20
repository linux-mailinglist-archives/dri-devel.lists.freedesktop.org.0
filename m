Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809542FC676
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 02:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5590B6E116;
	Wed, 20 Jan 2021 01:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6531989EEB;
 Wed, 20 Jan 2021 01:26:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7EE572312B;
 Wed, 20 Jan 2021 01:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611106010;
 bh=Xz+i1Z3mOF9fKx3oJXp8w7X6GXSJakG1pmdkXz0IVGg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QfUW5MlqvlD7h7N7tmN09XZfV7ktvdI8JQP3ljbzOgtO1FszBqCI5zi3I2N1wt5XK
 eyM4F1CJypmWuYknmtLzjEZm22sv2vsb7uEmrerKEwK9Lnw7SXOXKFGkRJdwAJNWn7
 9QOMshPPiALwXceuS8V5yfisFS8QxlT6lXzzWT6F00HCTJQrIcitOz31HZRUnAikYc
 d4z8OgoZAJ3NPsjApBiGQXbR9+la3NDowpzCvV9UPiTqr6khkyqti3CRCzQOnRtAA2
 bhCL4Vy75JRH1kGOZ62l5Z14/EHUxbZ4mhbAOLGvbRjJ6C1/sthPC8tcT/IFq65U3V
 7Blij4NKv/AXQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 36/45] drm/nouveau/bios: fix issue shadowing
 expansion ROMs
Date: Tue, 19 Jan 2021 20:25:53 -0500
Message-Id: <20210120012602.769683-36-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012602.769683-1-sashal@kernel.org>
References: <20210120012602.769683-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

[ Upstream commit 402a89660e9dc880710b12773076a336c9dab3d7 ]

This issue has generally been covered up by the presence of additional
expansion ROMs after the ones we're interested in, with header fetches
of subsequent images loading enough of the ROM to hide the issue.

Noticed on GA102, which lacks a type 0x70 image compared to TU102,.

[  906.364197] nouveau 0000:09:00.0: bios: 00000000: type 00, 65024 bytes
[  906.381205] nouveau 0000:09:00.0: bios: 0000fe00: type 03, 91648 bytes
[  906.405213] nouveau 0000:09:00.0: bios: 00026400: type e0, 22016 bytes
[  906.410984] nouveau 0000:09:00.0: bios: 0002ba00: type e0, 366080 bytes

vs

[   22.961901] nouveau 0000:09:00.0: bios: 00000000: type 00, 60416 bytes
[   22.984174] nouveau 0000:09:00.0: bios: 0000ec00: type 03, 71168 bytes
[   23.010446] nouveau 0000:09:00.0: bios: 00020200: type e0, 48128 bytes
[   23.028220] nouveau 0000:09:00.0: bios: 0002be00: type e0, 140800 bytes
[   23.080196] nouveau 0000:09:00.0: bios: 0004e400: type 70, 7168 bytes

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
index 7deb81b6dbac6..4b571cc6bc70f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
@@ -75,7 +75,7 @@ shadow_image(struct nvkm_bios *bios, int idx, u32 offset, struct shadow *mthd)
 	nvkm_debug(subdev, "%08x: type %02x, %d bytes\n",
 		   image.base, image.type, image.size);
 
-	if (!shadow_fetch(bios, mthd, image.size)) {
+	if (!shadow_fetch(bios, mthd, image.base + image.size)) {
 		nvkm_debug(subdev, "%08x: fetch failed\n", image.base);
 		return 0;
 	}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
