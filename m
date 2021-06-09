Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EFD3A0CC9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 08:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918666E039;
	Wed,  9 Jun 2021 06:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 910 seconds by postgrey-1.36 at gabe;
 Wed, 09 Jun 2021 06:55:05 UTC
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 by gabe.freedesktop.org (Postfix) with ESMTP id ABB1A6E039
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 06:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=mfXDD
 30mZIKAgidz42wFNQIPzrbm0VZQE69hwJp3nEU=; b=dMQioE975TwvBssOQ7LA1
 jvF2TUp0+qSzC+t0OOXu0wHUxjHmz5oQE8B6Nk3TQuYPbsNmIp1k1Qr8sQu3qlCu
 nYCeaZilkV7GFT/cd413QpT4m1UtBDeKI5SGi1vJxoaGtzXCmPMGJQkMAeCkzzQg
 XlWzTgBg8iIa3kLhEUkpoc=
Received: from localhost.localdomain (unknown [218.17.89.111])
 by smtp10 (Coremail) with SMTP id DsCowABXoWUGYsBgw6ASNw--.18641S2;
 Wed, 09 Jun 2021 14:39:25 +0800 (CST)
From: ChunyouTang <tangchunyou@163.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] modified: gpu/drm/panfrost/panfrost_gpu.c
Date: Wed,  9 Jun 2021 14:38:50 +0800
Message-Id: <20210609063850.2060-1-tangchunyou@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsCowABXoWUGYsBgw6ASNw--.18641S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrykCFWkXw13Aw15XFWDArb_yoWDZrg_u3
 W7ur9rXrZIkFn0kwsayan7uryS9ryUZw40vw1xGryvk3Z8Ar9rK3s2vrs8Zr18Ww4UAFnF
 yanFqF1Fyry7tjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnZYFJUUUUU==
X-Originating-IP: [218.17.89.111]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/xtbBRQesUVPAMVKOAwAAsC
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
Cc: tangchunyou@icubecorp.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tangchunyou <tangchunyou@163.icubecorp.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: tangchunyou <tangchunyou@163.icubecorp.cn>

The GPU exception fault status register(0x3C),the low 8 bit is the
EXCEPTION_TYPE.We can see the description at P3-78 in spec.

Signed-off-by: tangchunyou <tangchunyou@163.icubecorp.cn>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 2aae636f1cf5..1fffb6a0b24f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -33,7 +33,7 @@ static irqreturn_t panfrost_gpu_irq_handler(int irq, void *data)
 		address |= gpu_read(pfdev, GPU_FAULT_ADDRESS_LO);
 
 		dev_warn(pfdev->dev, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
-			 fault_status & 0xFF, panfrost_exception_name(pfdev, fault_status),
+			 fault_status & 0xFF, panfrost_exception_name(pfdev, fault_status & 0xFF),
 			 address);
 
 		if (state & GPU_IRQ_MULTIPLE_FAULT)
-- 
2.25.1

