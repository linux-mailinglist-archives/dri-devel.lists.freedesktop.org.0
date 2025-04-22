Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2F0A95CC9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 06:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59D410E4DB;
	Tue, 22 Apr 2025 04:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650E910E4DB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 04:09:28 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.141.245])
 by APP-05 (Coremail) with SMTP id zQCowABXjwd0FgdoOfIkCw--.63587S2;
 Tue, 22 Apr 2025 12:09:25 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: obitton@habana.ai,
	ogabbay@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Wentao Liang <vulab@iscas.ac.cn>, stable@vger.kernel.org
Subject: [PATCH RESEND] habanalabs: Add error handling for
 hl_mmu_get_hop_pte_phys_addr()
Date: Tue, 22 Apr 2025 12:09:02 +0800
Message-ID: <20250422040903.2153-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABXjwd0FgdoOfIkCw--.63587S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr4Uuw18JF4Duw15Kr47CFg_yoW8GryfpF
 n3Kr4rXFy5Jr1UZayUtr1IvF1Yv39xWFy3K3ZFka9093s8X3s7u343W3WSvw4UArWkGan7
 Zw1kAFs8CF18ZrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
 JF0_Jw1lc2xSY4AK67AK6r45MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
 4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
 67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
 x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
 z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
 UI43ZEXa7VUUpuWJUUUUU==
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRAAA2gG55bEmwAAsa
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

In _hl_mmu_v2_hr_map(), If hl_mmu_get_hop_pte_phys_addr() fail to
get physical address, the return address will be set as U64_MAX.
Hence, the return value of hl_mmu_get_hop_pte_phys_addr() must
be checked to prevent invalid address access. Add error handling
and propagate return code to caller function to fix this issue.

Fixes: 8aa1e1e60553 ("habanalabs: add gaudi2 MMU support")
Cc: stable@vger.kernel.org # v6.0+
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/accel/habanalabs/common/mmu/mmu_v2_hr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/accel/habanalabs/common/mmu/mmu_v2_hr.c b/drivers/accel/habanalabs/common/mmu/mmu_v2_hr.c
index 31507b2a431b..cdade07e22c5 100644
--- a/drivers/accel/habanalabs/common/mmu/mmu_v2_hr.c
+++ b/drivers/accel/habanalabs/common/mmu/mmu_v2_hr.c
@@ -253,6 +253,11 @@ static int _hl_mmu_v2_hr_map(struct hl_ctx *ctx,
 		hop_pte_phys_addr[i] = hl_mmu_get_hop_pte_phys_addr(ctx, mmu_prop, i,
 									hops_pgt_info[i]->phys_addr,
 									scrambled_virt_addr);
+		if (hop_pte_phys_addr[i] == U64_MAX) {
+			rc = -EINVAL;
+			goto err;
+		}
+
 		curr_pte = *(u64 *) (uintptr_t) hl_mmu_hr_pte_phys_to_virt(ctx, hops_pgt_info[i],
 							hop_pte_phys_addr[i],
 							ctx->hdev->asic_prop.pmmu.hop_table_size);
-- 
2.42.0.windows.2

