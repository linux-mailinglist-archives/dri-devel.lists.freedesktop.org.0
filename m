Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A03BBFBB82
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 13:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896A410E764;
	Wed, 22 Oct 2025 11:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3964B10E764
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 11:47:35 +0000 (UTC)
Received: from localhost.localdomain (unknown [202.112.113.212])
 by APP-01 (Coremail) with SMTP id qwCowAAHYKJJxPhosYX2Ew--.12754S2;
 Wed, 22 Oct 2025 19:47:30 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
 simona@ffwll.ch, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 Ma Ke <make24@iscas.ac.cn>, stable@vger.kernel.org
Subject: [PATCH RESEND] drm/tegra: dc: fix reference leak in tegra_dc_couple()
Date: Wed, 22 Oct 2025 19:47:20 +0800
Message-Id: <20251022114720.24937-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowAAHYKJJxPhosYX2Ew--.12754S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw15uFW5Zr1rAFy5KFW3Jrb_yoWfuFg_GF
 yUZryxW3yaqFsY9FnFvr13Zry2yFyq9FW0gr42k393Gry3XFyqg34jgFZ09ryUWa1UWFn8
 AayrXr40vF12kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbD8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
 YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwV
 W8KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
 6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
 Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
 Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
 IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU6GQhUUUUU
 =
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
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

driver_find_device() calls get_device() to increment the reference
count once a matching device is found, but there is no put_device() to
balance the reference count. To avoid reference count leakage, add
put_device() to decrease the reference count.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: a31500fe7055 ("drm/tegra: dc: Restore coupling of display controllers")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 drivers/gpu/drm/tegra/dc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 59d5c1ba145a..6c84bd69b11f 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -3148,6 +3148,7 @@ static int tegra_dc_couple(struct tegra_dc *dc)
 		dc->client.parent = &parent->client;
 
 		dev_dbg(dc->dev, "coupled to %s\n", dev_name(companion));
+		put_device(companion);
 	}
 
 	return 0;
-- 
2.17.1

