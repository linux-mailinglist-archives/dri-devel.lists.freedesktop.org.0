Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A67730499
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 18:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0621010E150;
	Wed, 14 Jun 2023 16:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 754 seconds by postgrey-1.36 at gabe;
 Wed, 14 Jun 2023 16:09:22 UTC
Received: from zg8tmtu5ljg5lje1ms4xmtka.icoremail.net
 (zg8tmtu5ljg5lje1ms4xmtka.icoremail.net [159.89.151.119])
 by gabe.freedesktop.org (Postfix) with ESMTP id D4B2C10E149
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 16:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fudan.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=PYg4exQBCf0Je8WHLBe48nl04iEqaJLL7nCkKkES/44=; b=E
 OED1WVHLXOIrWnRZVvga9Xm+eDehC0D2lucFjFXZJJnP0aKRjHYLA9HRqf4rOfHt
 WR2vb89ByHoFaKLohzoV+7AOzwRTdxOhlakKehkmVbEWqnKOOhJsrhreMjBJwSHE
 GfbX/zyQOEMl6d7PfJH5Sm+GEmym84KiAmKhKfKwyM=
Received: from ubuntu.localdomain (unknown [10.230.35.76])
 by app1 (Coremail) with SMTP id XAUFCgAnLu4p5olkFszsAA--.39737S2;
 Thu, 15 Jun 2023 00:09:14 +0800 (CST)
From: Chenyuan Mi <cymi20@fudan.edu.cn>
To: airlied@gmail.com
Subject: [PATCH] drm/display/dp_mst: Fix missing check for return value of
 drm_atomic_get_mst_payload_state()
Date: Wed, 14 Jun 2023 09:09:11 -0700
Message-Id: <20230614160911.121716-1-cymi20@fudan.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: XAUFCgAnLu4p5olkFszsAA--.39737S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XF47uFWrJF4DAry8Cr18AFb_yoWDuwbEgF
 1kZr1fWrZIk39rt3Wjyr4Fg34Fk3W2vF48Wwn3tayYkr9rC345Zry8WFyDKr17WF12qFWq
 g3W3Cw1fZ3Z7GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbTkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
 rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
 8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
 xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
 AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
 cIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
 v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUAkucUUUUU=
X-CM-SenderInfo: isqsiiisuqikmt6i3vldqovvfxof0/
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
Cc: Chenyuan Mi <cymi20@fudan.edu.cn>, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wayne.Lin@amd.com, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_atomic_get_mst_payload_state() function may
return NULL, which may cause null pointer deference,
and most other callsites of drm_atomic_get_mst_payload_state()
do Null check. Add Null check for return value of
drm_atomic_get_mst_payload_state().

Found by our static analysis tool.

Signed-off-by: Chenyuan Mi <cymi20@fudan.edu.cn>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 38dab76ae69e..27f4bcf409ea 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4434,6 +4434,8 @@ void drm_dp_mst_atomic_wait_for_dependencies(struct drm_atomic_state *state)
 
 			new_payload = drm_atomic_get_mst_payload_state(new_mst_state,
 								       old_payload->port);
+			if (!new_payload)
+				continue;
 			new_payload->vc_start_slot = old_payload->vc_start_slot;
 		}
 	}
-- 
2.17.1

