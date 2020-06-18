Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBD71FDBC8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 03:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD80F6E219;
	Thu, 18 Jun 2020 01:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AE56E219;
 Thu, 18 Jun 2020 01:14:51 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0EDD821D7B;
 Thu, 18 Jun 2020 01:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442891;
 bh=mIJ1TUXp7dszAtRrMyJYmXKkKV2repG8ZIcsS6zctIo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DTWvIGZS2MrSC/X735ehRXNLIFjta010kH1iqXTcfcAa+a1r8PrJAHl67pd6KKcit
 ei2LC2C/0TcGnR7ZroLmOJh5QlZVzTE72K3wbtFQ3CxbusFsxRXAz9Ro5dGjR28V7m
 rT+MVcTWdQXzFd8QKrfgKRyVE55duCm4cU/+H1fY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 314/388] drm/nouveau/disp/gm200-: fix
 NV_PDISP_SOR_HDMI2_CTRL(n) selection
Date: Wed, 17 Jun 2020 21:06:51 -0400
Message-Id: <20200618010805.600873-314-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
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

[ Upstream commit a1ef8bad506e4ffa0c57ac5f8cb99ab5cbc3b1fc ]

This is a SOR register, and not indexed by the bound head.

Fixes display not coming up on high-bandwidth HDMI displays under a
number of configurations.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigm200.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigm200.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigm200.c
index 9b16a08eb4d9..bf6d41fb0c9f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigm200.c
@@ -27,10 +27,10 @@ void
 gm200_hdmi_scdc(struct nvkm_ior *ior, int head, u8 scdc)
 {
 	struct nvkm_device *device = ior->disp->engine.subdev.device;
-	const u32 hoff = head * 0x800;
+	const u32 soff = nv50_ior_base(ior);
 	const u32 ctrl = scdc & 0x3;
 
-	nvkm_mask(device, 0x61c5bc + hoff, 0x00000003, ctrl);
+	nvkm_mask(device, 0x61c5bc + soff, 0x00000003, ctrl);
 
 	ior->tmds.high_speed = !!(scdc & 0x2);
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
