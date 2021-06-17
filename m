Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF7A3AABCC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 08:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79EBE6E02F;
	Thu, 17 Jun 2021 06:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 by gabe.freedesktop.org (Postfix) with ESMTP id 085376E02F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 06:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=vRur2
 nDprkxMjBDQqNeuKBKmkk6v6EeIS58FPxN+wF0=; b=YtoQxZ8eqfWSpO/R0fCRI
 w1A4+oPeL4md4NkYTD2w2avbl6XFCogEvFDdXZQ1vLokaVv+iAcE7RicWtbLKT/Y
 MrF84Njcb/BelVzT5qfhSLjuCDx1+4klFQHqiZly7JBHlmxi2Zmf47/o4XiqUCRn
 EC7xcIYA842/mFqUnUSe9o=
Received: from localhost.localdomain (unknown [218.17.89.111])
 by smtp13 (Coremail) with SMTP id EcCowAB3XnbV6cpgBMM38A--.48080S2;
 Thu, 17 Jun 2021 14:21:30 +0800 (CST)
From: ChunyouTang <tangchunyou@163.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2] drm/panfrost:report the full raw fault information instead
Date: Thu, 17 Jun 2021 14:20:54 +0800
Message-Id: <20210617062054.1864-1-tangchunyou@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EcCowAB3XnbV6cpgBMM38A--.48080S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrWrWFW7CF1fJr4xXFyUGFg_yoWfZrc_uw
 17ZrnxXrsIyrn0kwsayan7urySvryUZw40yw1xG347C3W5C34ag3s2vrs8Zr1UWa15AF1D
 ta12qF1Yyry7KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5PWrJUUUUU==
X-Originating-IP: [218.17.89.111]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/xtbBRRu0UVPAMgJUJAAAso
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
Cc: ChunyouTang <tangchunyou@icubecorp.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChunyouTang <tangchunyou@icubecorp.cn>

of the low 8 bits.

Signed-off-by: ChunyouTang <tangchunyou@icubecorp.cn>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 1fffb6a0b24f..d2d287bbf4e7 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -33,7 +33,7 @@ static irqreturn_t panfrost_gpu_irq_handler(int irq, void *data)
 		address |= gpu_read(pfdev, GPU_FAULT_ADDRESS_LO);
 
 		dev_warn(pfdev->dev, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
-			 fault_status & 0xFF, panfrost_exception_name(pfdev, fault_status & 0xFF),
+			 fault_status, panfrost_exception_name(pfdev, fault_status & 0xFF),
 			 address);
 
 		if (state & GPU_IRQ_MULTIPLE_FAULT)
-- 
2.25.1


