Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6999521F444
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 16:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A246E986;
	Tue, 14 Jul 2020 14:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F51A6E97F;
 Tue, 14 Jul 2020 14:39:32 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4B162222C8;
 Tue, 14 Jul 2020 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594737572;
 bh=Nq5QR3iG8Cr3ox2BQ3/zYb67ZQcxz9425Pv2U2LcgGI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ayRFSJYWOYI443MUQXOBaMibukoWV7MpHTtw3+QI/gbipVehVv2TLgi5gM8w9kYbl
 NbNDzSlzA18C8f1QE3MTqhT8AzOB//k61583/fRL3FJdVoDCkJMrOukRo+ycqVpN3v
 bLHsqiTfRhf9SJqHZDWxmq+n+OI2JLMS8CwhkbiI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 14/18] drm/nouveau/i2c/g94-: increase
 NV_PMGR_DP_AUXCTL_TRANSACTREQ timeout
Date: Tue, 14 Jul 2020 10:39:10 -0400
Message-Id: <20200714143914.4035489-14-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714143914.4035489-1-sashal@kernel.org>
References: <20200714143914.4035489-1-sashal@kernel.org>
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

[ Upstream commit 0156e76d388310a490aeb0f2fbb5b284ded3aecc ]

Tegra TRM says worst-case reply time is 1216us, and this should fix some
spurious timeouts that have been popping up.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c   | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
index c8ab1b5741a3e..db7769cb33eba 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
@@ -118,10 +118,10 @@ g94_i2c_aux_xfer(struct nvkm_i2c_aux *obj, bool retry,
 		if (retries)
 			udelay(400);
 
-		/* transaction request, wait up to 1ms for it to complete */
+		/* transaction request, wait up to 2ms for it to complete */
 		nvkm_wr32(device, 0x00e4e4 + base, 0x00010000 | ctrl);
 
-		timeout = 1000;
+		timeout = 2000;
 		do {
 			ctrl = nvkm_rd32(device, 0x00e4e4 + base);
 			udelay(1);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
index 7ef60895f43a7..edb6148cbca04 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
@@ -118,10 +118,10 @@ gm200_i2c_aux_xfer(struct nvkm_i2c_aux *obj, bool retry,
 		if (retries)
 			udelay(400);
 
-		/* transaction request, wait up to 1ms for it to complete */
+		/* transaction request, wait up to 2ms for it to complete */
 		nvkm_wr32(device, 0x00d954 + base, 0x00010000 | ctrl);
 
-		timeout = 1000;
+		timeout = 2000;
 		do {
 			ctrl = nvkm_rd32(device, 0x00d954 + base);
 			udelay(1);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
