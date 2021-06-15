Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281CD3A775E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 08:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7133189C93;
	Tue, 15 Jun 2021 06:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 by gabe.freedesktop.org (Postfix) with ESMTP id CE72389C93
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 06:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=0d+6Q
 DjQqm2k4gejTiAFSIHmhOWpq1SXRcL3sEt28mY=; b=VOs0qb0aXizVzGygAMFq0
 1hTjss1KXScgJovAWv9fKbEg/7CtliFjvWnFck3Av/9DVeJev9CbM0mXmnx4FG58
 wCTF0DJ2H8yV+kM7DmXZCg5N/WlPW1sdtXtuy5qblV3AQrravzIe2K5yDEs4LfM8
 2V56XXkO7TGXVsOMtpcz4w=
Received: from localhost.localdomain (unknown [218.17.89.111])
 by smtp8 (Coremail) with SMTP id DMCowAC3uwfuTMhgxYM7KA--.10828S2;
 Tue, 15 Jun 2021 14:47:22 +0800 (CST)
From: ChunyouTang <tangchunyou@163.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 2/2] drm/panfrost:report the full raw fault information instead
Date: Tue, 15 Jun 2021 14:46:59 +0800
Message-Id: <20210615064659.775-1-tangchunyou@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMCowAC3uwfuTMhgxYM7KA--.10828S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw15XrWrZFy3Kry3Cw17Wrg_yoWfZwc_u3
 W7ZrnxXrsIyFn0kwsayan7urySvryUZw40yw1xGr9Fk3W5A3sFg3s2vrs8Zr18Ww45ZF1D
 tanFqF1Fyry7KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5emh7UUUUU==
X-Originating-IP: [218.17.89.111]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/1tbiZRmyUV8ZPKaC3wABsf
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tangchunyou <tangchunyou@163.icubecorp.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: tangchunyou <tangchunyou@163.icubecorp.cn>

of the low 8 bits.

Signed-off-by: tangchunyou <tangchunyou@163.icubecorp.cn>
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


