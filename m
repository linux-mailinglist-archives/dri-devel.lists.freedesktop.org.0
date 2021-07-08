Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1E23BF656
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 09:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B006E882;
	Thu,  8 Jul 2021 07:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id 78B886E882
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 07:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=cMheW
 nPV+Ne7z6zmDmh2HBf+TFVmVgbZ0iWS3s4DJ54=; b=G00cRHc8xFyvio61+davz
 HFu5kh+y/CbB66KLliCOwoWKJm068Gw4d6109U50Ph0M6rAmaSLaPOw9NHE0gDNs
 JUDxfz3HQzb7WGpx9NjJc4gs2fd2f68E+Kym38hf3CtQTUBXuNYh9AAwnQTnLpLE
 +nkIDDL3hpELrmq95NCIGA=
Received: from localhost.localdomain (unknown [218.17.89.111])
 by smtp11 (Coremail) with SMTP id D8CowAAXH697quZgw2xcAA--.51S2;
 Thu, 08 Jul 2021 15:34:29 +0800 (CST)
From: ChunyouTang <tangchunyou@163.com>
To: steven.price@arm.com
Subject: [PATCH v3] drm/panfrost:fix the exception name always "UNKNOWN"
Date: Thu,  8 Jul 2021 15:34:06 +0800
Message-Id: <20210708073407.2015-1-tangchunyou@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: D8CowAAXH697quZgw2xcAA--.51S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw15Cr48Cw4rJr18JF4ktFb_yoWkZrg_ur
 17ur9xXrsIyrn0kws2y3Z7uryFvryUXw48Aw1fGryDCa45C3s0gwn2vrs8Zr48Wa15CFn8
 tanFvF1Fkry7KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5oc_3UUUUU==
X-Originating-IP: [218.17.89.111]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/1tbiZQXJUV8ZPobPkQAAsY
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 ChunyouTang <tangchunyou@icubecorp.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChunyouTang <tangchunyou@icubecorp.cn>

The exception_code in register is only 8 bits,So if
fault_status in panfrost_gpu_irq_handler() don't
(& 0xFF),it can't get correct exception reason.

and it's better to show all of the register value
to custom,so it's better fault_status don't (& 0xFF).

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

