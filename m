Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7690C7EC8BA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 17:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B646110E158;
	Wed, 15 Nov 2023 16:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C1510E114
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 16:39:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E5C876154F;
 Wed, 15 Nov 2023 16:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B26EC433C9;
 Wed, 15 Nov 2023 16:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700066366;
 bh=O/lr4P1EsL7YBuHracXPErJjSaguLam5N+lR2mNBaRQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HloXa8yfi2b8+zalpwQqL7zMe2cDWjk3K16Qu3i1dSW5lnc3nTXjYE+Jeco7gTwPF
 QFdW9p28kq86x5Kf/alAeyE4tW5CzZ5g0XJ4+eDT0wP9whbbzvfw7P6S3oeMpTNOSR
 qnVmmB+ZhRgR7quZL+8hkHs3XAx7EWRmv4cuiuvZfQbhi00Ksw2966oNpDIbGSJT/C
 ndxjkOJZNv0CG0ai5a+kuDri42Gv0KvbyrVmFup51ZvPkKW3dBn17zaViLe4e4X05P
 wvpsBQf3MUThIlbMtFVLIoa6JhkLd/U87bdhY7hvNcvoSiwQnOSSCC6RSV6S7tjzeg
 lFCtprQEDNgww==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] accel/habanalabs: remove 'get temperature' debug print
Date: Wed, 15 Nov 2023 18:39:08 +0200
Message-Id: <20231115163912.1243175-6-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115163912.1243175-1-ogabbay@kernel.org>
References: <20231115163912.1243175-1-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ofir Bitton <obitton@habana.ai>

The print was added long back for a specific debug and can
now be removed.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/hwmon.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/accel/habanalabs/common/hwmon.c b/drivers/accel/habanalabs/common/hwmon.c
index 8598056216e7..1ee2ee07e9ed 100644
--- a/drivers/accel/habanalabs/common/hwmon.c
+++ b/drivers/accel/habanalabs/common/hwmon.c
@@ -578,10 +578,6 @@ int hl_get_temperature(struct hl_device *hdev,
 				CPUCP_PKT_CTL_OPCODE_SHIFT);
 	pkt.sensor_index = __cpu_to_le16(sensor_index);
 	pkt.type = __cpu_to_le16(attr);
-
-	dev_dbg(hdev->dev, "get temp, ctl 0x%x, sensor %d, type %d\n",
-		pkt.ctl, pkt.sensor_index, pkt.type);
-
 	rc = hdev->asic_funcs->send_cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
 						0, &result);
 
-- 
2.34.1

