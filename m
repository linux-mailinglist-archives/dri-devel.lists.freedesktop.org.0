Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB34689C1B1
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 15:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB2210E154;
	Mon,  8 Apr 2024 13:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=t-argos.ru header.i=@t-argos.ru header.b="EWR6+B0/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 976 seconds by postgrey-1.36 at gabe;
 Mon, 08 Apr 2024 09:13:48 UTC
Received: from mx1.t-argos.ru (mx1.t-argos.ru [109.73.34.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F0E10EFE0;
 Mon,  8 Apr 2024 09:13:48 +0000 (UTC)
Received: from mx1.t-argos.ru (localhost [127.0.0.1])
 by mx1.t-argos.ru (Postfix) with ESMTP id 0270A100003;
 Mon,  8 Apr 2024 11:57:14 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-argos.ru; s=mail;
 t=1712566634; bh=tVaZQ82kV0U3VdjNP3qButkhjLghxD+YcZT09STBU0k=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=EWR6+B0/gNf41mL3w6lZmTV9X69uZetXhu7XTDGpVjECqaMntRrs8I03xbrIeGDvb
 xSR6EPy6HI9obNTSe2zvlXDKzikO5zq+Rm+3ek64f257mnNv4jh+1g9xIvnChEhU+Q
 fqUyVpBBwyk3NS+flimzDNcWZ0SrLr72HsxJ1n/2zS73uAbed1AzwMnLYY4Wa5Sc6H
 mkk7MaBQGoZxXYQMDam/uSM1zDLFJdbBAgAtD/eLCQB5Agiv4bgIsWHfclheA+BBO/
 /y4lKFaOd7T03nohLLQB4f5CCb0vOX7lsbnvIY5Glh3rApTXFplEwFa+ylZy+QSGyV
 Uxy26W+/Hm4jA==
Received: from mx1.t-argos.ru.ru (ta-mail-02.ta.t-argos.ru [172.17.13.212])
 by mx1.t-argos.ru (Postfix) with ESMTP;
 Mon,  8 Apr 2024 11:55:52 +0300 (MSK)
Received: from localhost.localdomain (172.17.215.6) by ta-mail-02
 (172.17.13.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 8 Apr 2024
 11:55:32 +0300
From: Aleksandr Mishin <amishin@t-argos.ru>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Aleksandr Mishin <amishin@t-argos.ru>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Neil Armstrong
 <neil.armstrong@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <lvc-project@linuxtesting.org>
Subject: [PATCH] drm/msm/dpu: Add callback function pointer check before its
 call
Date: Mon, 8 Apr 2024 11:55:23 +0300
Message-ID: <20240408085523.12231-1-amishin@t-argos.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.215.6]
X-ClientProxiedBy: ta-mail-02.ta.t-argos.ru (172.17.13.212) To ta-mail-02
 (172.17.13.212)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184614 [Apr 08 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: amishin@t-argos.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 15 0.3.15
 adb41f89e2951eb37b279104a7abb8e79494a5e7,
 {Tracking_from_domain_doesnt_match_to},
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; mx1.t-argos.ru.ru:7.1.1;
 127.0.0.199:7.1.2; t-argos.ru:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/04/08 07:15:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2024/04/08 06:53:00 #24704467
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Approved-At: Mon, 08 Apr 2024 13:23:04 +0000
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

In dpu_core_irq_callback_handler() callback function pointer is compared to NULL,
but then callback function is unconditionally called by this pointer.
Fix this bug by adding conditional return.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: c929ac60b3ed ("drm/msm/dpu: allow just single IRQ callback")
Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 946dd0135dff..03a16fbd4c99 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -223,9 +223,11 @@ static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, unsigned int
 
 	VERB("IRQ=[%d, %d]\n", DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 
-	if (!irq_entry->cb)
+	if (!irq_entry->cb) {
 		DRM_ERROR("no registered cb, IRQ=[%d, %d]\n",
 			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
+		return;
+	}
 
 	atomic_inc(&irq_entry->count);
 
-- 
2.30.2

