Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EE6AB0BC2
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 09:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF8710E9C5;
	Fri,  9 May 2025 07:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nppct.ru header.i=@nppct.ru header.b="dxQdsDpT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2A210E1B0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 21:06:38 +0000 (UTC)
Received: from mail.nppct.ru (localhost [127.0.0.1])
 by mail.nppct.ru (Postfix) with ESMTP id 677481C0E8D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 00:06:29 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
 reason="pass (just generated,
 assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
 content-transfer-encoding:content-type:content-type:mime-version
 :x-mailer:message-id:date:date:subject:subject:to:from:from; s=
 dkim; t=1746651986; x=1747515987; bh=dbNPdGsmVrlahME3bAUZHjqgAKA
 kN35JiXmCUn9IdHE=; b=dxQdsDpTE+eNnNQeV8kmEwT3CCcS8rmd7PKfccBgUlP
 RPlXqAhWNOPgVVeQC2qUCY0Z7hf6Y+/0v34cek4lOREIriOGH3+O7p8WEfYWWu3y
 d08r0JXHSmudxbRlspV8vDg20QFi9D/uOwY94xSGW+IhsGDyZixtKAzzG0nBH6Hs
 =
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
 by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Ur0qBOcHxNAG for <dri-devel@lists.freedesktop.org>;
 Thu,  8 May 2025 00:06:26 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
 by mail.nppct.ru (Postfix) with ESMTPSA id F1DB61C012F;
 Thu,  8 May 2025 00:06:25 +0300 (MSK)
From: Alexey Nepomnyashih <sdl@nppct.ru>
To: Lyude Paul <lyude@redhat.com>
Cc: Alexey Nepomnyashih <sdl@nppct.ru>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: [PATCH] drm/nouveau/kms: fix overflow in block size calculation in
 nouveau_check_bl_size()
Date: Wed,  7 May 2025 21:05:47 +0000
Message-ID: <20250507210550.141861-1-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 09 May 2025 07:33:29 +0000
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

Prevent potential overflow in nouveau_check_bl_size() when calculating
bl_size. Although bl_size is a 64-bit value, the intermediate
multiplication of 32-bit operands (bw, bh, tile_mode, and gob_size) may
overflow before being assigned. gob_size is 256 or 512, and tile_mode is
validated to be ≤ 31, but bw and bh can still be large enough to trigger
overflow. Cast bw to uint64_t to ensure proper 64-bit arithmetic.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 4f5746c863db ("drm/nouveau/kms: Check framebuffer size against bo")
Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index add006fc8d81..0363711ee0ee 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -239,7 +239,7 @@ nouveau_check_bl_size(struct nouveau_drm *drm, struct nouveau_bo *nvbo,
 	bh = nouveau_get_height_in_blocks(h, gobs_in_block, drm->client.device.info.family);
 	gob_size = nouveau_get_gob_size(drm->client.device.info.family);
 
-	bl_size = bw * bh * gobs_in_block * gob_size;
+	bl_size = (uint64_t)bw * bh * gobs_in_block * gob_size;
 
 	DRM_DEBUG_KMS("offset=%u stride=%u h=%u gobs_in_block=%u bw=%u bh=%u gob_size=%u bl_size=%llu size=%zu\n",
 		      offset, stride, h, gobs_in_block, bw, bh, gob_size,
-- 
2.43.0

