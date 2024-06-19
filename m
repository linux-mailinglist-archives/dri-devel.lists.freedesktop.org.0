Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F13590E383
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 08:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7306010E8CD;
	Wed, 19 Jun 2024 06:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="M81PsjXq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8814C10E8FB
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 06:34:47 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1718778894; bh=yVIz9ixUV8yNzzj5u0E3tyrmSA6nt1p/MJB5rrHIEOA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M81PsjXqqwh1IM+TailoLyqtoGDjX8+DyTrmFk+LBcnZaCzq6V+kWHB74zH0PRF74
 vzT54D3A6PjTWohor4uPd6J8ONwhiNBc3jLMSwLA+Zpe5/r6821KHkPuz88HzLxydM
 Tcts5N1cOamLU6uAO0PNFhypeggiEnlmzFeZYQeBBJTRPHmkJrR39lQyGwcCFfCvxV
 CCphi4N2Zkst5I3FODjUS0+aiu/DLaj5EnyoO8Z7E2SsN6JkWaiJkCmrZ+QzdjNIzh
 nN/k4m40eCjWX3zEeHTk2iBN/aNgmt6SMFCd+Lfppejx/pNAR0Td7SQHFtZReKMjak
 zRIi98WRuUHLA==
Received: from obitton-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by obitton-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 45J6YQB91377354; Wed, 19 Jun 2024 09:34:33 +0300
From: Ofir Bitton <obitton@habana.ai>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Didi Freiman <dfreiman@habana.ai>
Subject: [PATCH 9/9] accel/habanalabs: gradual sleep in polling memory macro
Date: Wed, 19 Jun 2024 09:34:25 +0300
Message-Id: <20240619063425.1377327-9-obitton@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240619063425.1377327-1-obitton@habana.ai>
References: <20240619063425.1377327-1-obitton@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Didi Freiman <dfreiman@habana.ai>

It’s better to avoid long sleeps right from the beginning of the polling
since the data may be available much sooner than the sleep period.
Because polling host memory is inexpensive, this change gradually
increases the sleep time up to the user-requested period.

Signed-off-by: Didi Freiman <dfreiman@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
---
 drivers/accel/habanalabs/common/habanalabs.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index a06e5a966f45..6f27ce4fa01b 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -2729,11 +2729,16 @@ void hl_wreg(struct hl_device *hdev, u32 reg, u32 val);
  * updated directly by the device. If false, the host memory being polled will
  * be updated by host CPU. Required so host knows whether or not the memory
  * might need to be byte-swapped before returning value to caller.
+ *
+ * On the first 4 polling iterations the macro goes to sleep for short period of
+ * time that gradually increases and reaches sleep_us on the fifth iteration.
  */
 #define hl_poll_timeout_memory(hdev, addr, val, cond, sleep_us, timeout_us, \
 				mem_written_by_device) \
 ({ \
+	u64 __sleep_step_us; \
 	ktime_t __timeout; \
+	u8 __step = 8; \
 	\
 	__timeout = ktime_add_us(ktime_get(), timeout_us); \
 	might_sleep_if(sleep_us); \
@@ -2751,8 +2756,10 @@ void hl_wreg(struct hl_device *hdev, u32 reg, u32 val);
 				(val) = le32_to_cpu(*(__le32 *) &(val)); \
 			break; \
 		} \
-		if (sleep_us) \
-			usleep_range((sleep_us >> 2) + 1, sleep_us); \
+		__sleep_step_us = sleep_us >> __step; \
+		if (__sleep_step_us) \
+			usleep_range((__sleep_step_us >> 2) + 1, __sleep_step_us); \
+		__step >>= 1; \
 	} \
 	(cond) ? 0 : -ETIMEDOUT; \
 })
-- 
2.34.1

