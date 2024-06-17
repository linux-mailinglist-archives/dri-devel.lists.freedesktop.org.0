Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2678890ACB5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 13:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7963310E354;
	Mon, 17 Jun 2024 11:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="mK4K9mZQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41E810E350;
 Mon, 17 Jun 2024 11:14:18 +0000 (UTC)
Delivered-To: uwu@icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1718621951; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fG2P7fwYFpQOevPGrIWIoeshtJla9Lcbn8a2jlfGty91UM1k1HSrTK81AQGx9bAFN+sBFe7RTuo4hwrBV2FBS+yMslhSgNRP4TT+AqROY006xeqxdP3koZX1ylmpoOGiRQSgjMQ8gCmro7ac0nuzbeuiQyR6PnLy5GjAWMBBbsw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1718621951;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=PqebUlTi0iTLhNoy5+l4cYqvssMhPIoYeMJsxXTSYO0=; 
 b=a5HFpa5yywFMOrPbAX2DxynDZt366JGeZihUKmkCnRd+uwQJO63UHKxZunBoKmyzSpcuEAIMFCOHqKleMabxRGx/Bny+vE7j69Lx1T8XeMWM/njYtoO9WkiuQA8fdvP+ttrFVJ4KGx9QoFCrtbeyTctlSW0W46E6Th6BY3bgr+Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1718621951; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=PqebUlTi0iTLhNoy5+l4cYqvssMhPIoYeMJsxXTSYO0=;
 b=mK4K9mZQzFqR7/rXCzgNoZTY3g8EetbvAU7kPgMmg7cJYDYXw8ec3H0fr1oxIiU5
 vzKcRyzIMvv80AZgmALB6ar1NscLqaGgW8FBQPiW7dhl+ytTgwRDA18RTd4un5p4Zgm
 NUwfn+cQNIdlq7Ymo3Lgvxc7zmhQxoep7JMjtxyrnEe7DH3pZBfRpgzR7W8bgYXiHfo
 itg4eeMbguO7Z/Wsid5yg+5Vm69ppHZV/pnpktYZ1cvJSQGZW2vqd3NjWz9uQUYlySa
 Qo0t6/xWbXC/h4g715TLS02W5t8uqdedJdTQ387MGAf20vm3jS0p5LWILweV8mZkmkn
 9qPVk0cliw==
Received: by mx.zohomail.com with SMTPS id 1718621950320316.9838256232267;
 Mon, 17 Jun 2024 03:59:10 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 2/2] drm/radeon: repeat the same EOP packet for EOP workaround
 on CIK
Date: Mon, 17 Jun 2024 18:58:46 +0800
Message-ID: <20240617105846.1516006-3-uwu@icenowy.me>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240617105846.1516006-1-uwu@icenowy.me>
References: <20240617105846.1516006-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Ths first EOP packet with a sequence number as seq-1 seems to confuse
some PCIe hardware (e.g. Loongson 7A PCHs).

Use the real sequence number instead.

Fixes: a9c73a0e022c ("drm/radeon: workaround for CP HW bug on CIK")
Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/gpu/drm/radeon/cik.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index 8275eeba0b349..9d203054f922a 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -3543,9 +3543,7 @@ void cik_fence_gfx_ring_emit(struct radeon_device *rdev,
 	struct radeon_ring *ring = &rdev->ring[fence->ring];
 	u64 addr = rdev->fence_drv[fence->ring].gpu_addr;
 
-	/* Workaround for cache flush problems. First send a dummy EOP
-	 * event down the pipe with seq one below.
-	 */
+	/* Workaround for cache flush problems by sending the EOP event twice */
 	radeon_ring_write(ring, PACKET3(PACKET3_EVENT_WRITE_EOP, 4));
 	radeon_ring_write(ring, (EOP_TCL1_ACTION_EN |
 				 EOP_TC_ACTION_EN |
@@ -3554,10 +3552,9 @@ void cik_fence_gfx_ring_emit(struct radeon_device *rdev,
 	radeon_ring_write(ring, addr & 0xfffffffc);
 	radeon_ring_write(ring, (upper_32_bits(addr) & 0xffff) |
 				DATA_SEL(1) | INT_SEL(0));
-	radeon_ring_write(ring, fence->seq - 1);
+	radeon_ring_write(ring, fence->seq);
 	radeon_ring_write(ring, 0);
 
-	/* Then send the real EOP event down the pipe. */
 	radeon_ring_write(ring, PACKET3(PACKET3_EVENT_WRITE_EOP, 4));
 	radeon_ring_write(ring, (EOP_TCL1_ACTION_EN |
 				 EOP_TC_ACTION_EN |
-- 
2.45.1

