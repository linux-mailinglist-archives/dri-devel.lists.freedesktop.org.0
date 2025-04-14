Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74260A8783C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 08:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D6310E300;
	Mon, 14 Apr 2025 06:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4719E10E300
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 06:53:15 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.141.245])
 by APP-05 (Coremail) with SMTP id zQCowABHhQ3WsPxnNSvmCA--.18873S2;
 Mon, 14 Apr 2025 14:53:12 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: obitton@habana.ai,
	ogabbay@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Wentao Liang <vulab@iscas.ac.cn>, stable@vger.kernel.org
Subject: [PATCH RESEND] habanalabs: Add error handling for
 hl_mmu_get_hop_pte_phys_addr()
Date: Mon, 14 Apr 2025 14:52:42 +0800
Message-ID: <20250414065242.2150-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABHhQ3WsPxnNSvmCA--.18873S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr4Uuw18JF4Duw15Kr47CFg_yoW8GryfpF
 n3Kr4rXFy5Jr1UZayUtr1IvF1Yv39xWFy3K3ZFka9093s8X3s7u343W3WSvw4UArWkGan7
 Zw1kAFs8CF18ZrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
 AVWUtwCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
 1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
 14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
 IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
 87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
 IFyTuYvjfUb9N3UUUUU
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwoMA2f8nOlFygAAsj
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

