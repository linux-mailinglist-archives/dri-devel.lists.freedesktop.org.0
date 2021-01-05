Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1442EA674
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 09:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC8C6E087;
	Tue,  5 Jan 2021 08:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9AD89F5F;
 Tue,  5 Jan 2021 07:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=15VgomEyshS/XXryYa
 QwqIxLrVBEvq7TJjmDFxBZ2yU=; b=J8J0zIykqFObQbB2k5OBqQOuKRkj0RVYxU
 vKnj8d+IuTficlDlbVcqF9zooJycwgUvBa/eRCo+Q6KFbC0BbMshp+ehulVofCvZ
 bJvNiQc3XdFgou9ive4oIUbiEk+cQHhQl8AmajXO5v3kwXiLO79mfUhAttD/rFGh
 AOQ1joNmE=
Received: from localhost.localdomain (unknown [36.112.86.14])
 by smtp7 (Coremail) with SMTP id DsmowACXmmoTFvRfq4zUMw--.32724S2;
 Tue, 05 Jan 2021 15:32:37 +0800 (CST)
From: Defang Bo <bodefang@126.com>
To: airlied@linux.ie, daniel@ffwll.ch, christian.koenig@amd.com,
 alexander.deucher@amd.com
Subject: [PATCH v2] drm/amdgpu:fix IH overflow on Cz
Date: Tue,  5 Jan 2021 15:32:21 +0800
Message-Id: <1609831941-2277695-1-git-send-email-bodefang@126.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: DsmowACXmmoTFvRfq4zUMw--.32724S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr15Cw4xXF4UZF48Zw18Xwb_yoW5JFyxpa
 1Sg3s09r10yr1IyryfZ3Z7uFn8Aw4vgrWfCrsrAw12gF4jya4kWry5tayFqryUtFWSkF47
 Kryaq3y5W34qvrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRF1vhUUUUU=
X-Originating-IP: [36.112.86.14]
X-CM-SenderInfo: pergvwxdqjqiyswou0bp/1tbikhUR11pECIqqZgAAsR
X-Mailman-Approved-At: Tue, 05 Jan 2021 08:21:09 +0000
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
Cc: amd-gfx@lists.freedesktop.org, Defang Bo <bodefang@126.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Similar to commit <b82175750131>("drm/amdgpu: fix IH overflow on Vega10 v2").
When an ring buffer overflow happens the appropriate bit is set in the WPTR
register which is also written back to memory. But clearing the bit in the
WPTR doesn't trigger another memory writeback.

So what can happen is that we end up processing the buffer overflow over and
over again because the bit is never cleared. Resulting in a random system
lockup because of an infinite loop in an interrupt handler.

Signed-off-by: Defang Bo <bodefang@126.com>
---
Changes since v1:
- Modify the code and correct the wrong fix. 
---
---
 drivers/gpu/drm/amd/amdgpu/cz_ih.c | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
index 1dca0cabc326..45dd47f45fa2 100644
--- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
@@ -190,22 +190,32 @@ static u32 cz_ih_get_wptr(struct amdgpu_device *adev,
 			  struct amdgpu_ih_ring *ih)
 {
 	u32 wptr, tmp;
-
+
 	wptr = le32_to_cpu(*ih->wptr_cpu);
 
-	if (REG_GET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW)) {
-		wptr = REG_SET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW, 0);
-		/* When a ring buffer overflow happen start parsing interrupt
-		 * from the last not overwritten vector (wptr + 16). Hopefully
-		 * this should allow us to catchup.
-		 */
-		dev_warn(adev->dev, "IH ring buffer overflow (0x%08X, 0x%08X, 0x%08X)\n",
-			wptr, ih->rptr, (wptr + 16) & ih->ptr_mask);
-		ih->rptr = (wptr + 16) & ih->ptr_mask;
-		tmp = RREG32(mmIH_RB_CNTL);
-		tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 1);
-		WREG32(mmIH_RB_CNTL, tmp);
-	}
+	if (!REG_GET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW))
+		goto out;
+
+	wptr = RREG32(mmIH_RB_CNTL);
+
+	if (!REG_GET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW))
+		goto out;
+
+	wptr = REG_SET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW, 0);
+
+	/* When a ring buffer overflow happen start parsing interrupt
+	 * from the last not overwritten vector (wptr + 16). Hopefully
+	 * this should allow us to catchup.
+	 */
+	dev_warn(adev->dev, "IH ring buffer overflow (0x%08X, 0x%08X, 0x%08X)\n",
+		wptr, ih->rptr, (wptr + 16) & ih->ptr_mask);
+	ih->rptr = (wptr + 16) & ih->ptr_mask;
+	tmp = RREG32(mmIH_RB_CNTL);
+	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, WPTR_OVERFLOW_CLEAR, 1);
+	WREG32(mmIH_RB_CNTL, tmp);
+
+
+out:
 	return (wptr & ih->ptr_mask);
 }
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
