Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68394750DA9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 18:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBC810E58D;
	Wed, 12 Jul 2023 16:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDCC10E58C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 16:11:26 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbc0609cd6so72749665e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689178284; x=1691770284;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D7rjo35UIzSXVZvg5cEHUOQSz9DEtkcx5oJGhm9KZwE=;
 b=lBNLMn7HVT8fTNlN4An+bJtVBswDAUOa+cgwnrKi7ykcJCX4En1Vy4pmGfR8Bnf9Qb
 eP/M7ygOZ72MEAT2ysEpCWi13UuWK3yM8CAhCAWdQd8fUk48TW47yapFzgThguOOuBae
 qjt6+Oa5WWn2exNaaQq2tVaSusLJFmlsCl2y1wGKIgWkKoEgwzn4vWNMlbEw7h0YiZ8t
 PBGszpP+JcGSgMyS8LXUqMWSU3r/6OlW0wcCfxgTOOM/HKD4o2FsSsp/YsiCxf+vs5xF
 xRBvczKu3zfy5g4QsNz9WFeSTcOXb32UWnZ3gRXtI6NhrgvzdHXaF26YCdXMNqMBWB6n
 J6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689178284; x=1691770284;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D7rjo35UIzSXVZvg5cEHUOQSz9DEtkcx5oJGhm9KZwE=;
 b=UtHFliR4Tl8IqBfQFZxOiQVVwifMRtjHczukz9Zfy+lx9w+PwbBvx6ycVkbBpTGJsj
 EGMfsOvEEGT2lfpcikmJVna+eGp5Ubq0Ke7YOnynpckL+NM8+P9syemWcVe9MTSKbKm+
 1bAJtO8XS76y4X3Qsm7OCU/5NCQ2fePy5LBoxhNXlw5IOqRebzRRFtJVJENXSIAj7E5u
 t7yIFfevtOIOstV9LiEH1e4p+azsgi6Gso+mIoY2kYgPEbPdQK2ZSfcKgV4ANzgVad9T
 BNyxYZ+Njo792NDxroDPQQt1gkIAfamd/5pZqwqkCfHRHLeacCCsUC3gG6Ww2DlI9ZZl
 N0IA==
X-Gm-Message-State: ABy/qLaKRXkpSprWnQiUwYV1zi//hvboE/LKJFGhm8ZoxknxHeXiaUfr
 iymZYrwfyahBuHOyBu747bY=
X-Google-Smtp-Source: APBJJlGRxOLC0PmFRbKVGnXl+kzSvEqYTfgQtUH9mpCaZI0BkH2j9sJDz1UI9UGbu7ZsPDru7YhrDA==
X-Received: by 2002:a5d:5603:0:b0:314:37e7:efb4 with SMTP id
 l3-20020a5d5603000000b0031437e7efb4mr15099694wrv.11.1689178284496; 
 Wed, 12 Jul 2023 09:11:24 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 f17-20020adffcd1000000b003140fff4f75sm5460604wrs.17.2023.07.12.09.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 09:11:23 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next][V2] video: fbdev: kyro: make some const read-only
 arrays static and reduce type size
Date: Wed, 12 Jul 2023 17:11:23 +0100
Message-Id: <20230712161123.465713-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't populate the const read-only arrays on the stack but instead
make them static const. Use smaller types to use less storage for
the arrays.  Also makes the object code a little smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---

V2: Use smaller int types, kudos to Helge Deller for suggesting this

---
 drivers/video/fbdev/kyro/STG4000InitDevice.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/kyro/STG4000InitDevice.c b/drivers/video/fbdev/kyro/STG4000InitDevice.c
index edfa0a04854d..79886a246638 100644
--- a/drivers/video/fbdev/kyro/STG4000InitDevice.c
+++ b/drivers/video/fbdev/kyro/STG4000InitDevice.c
@@ -83,11 +83,11 @@ volatile u32 i,count=0; \
 static u32 InitSDRAMRegisters(volatile STG4000REG __iomem *pSTGReg,
 			      u32 dwSubSysID, u32 dwRevID)
 {
-	u32 adwSDRAMArgCfg0[] = { 0xa0, 0x80, 0xa0, 0xa0, 0xa0 };
-	u32 adwSDRAMCfg1[] = { 0x8732, 0x8732, 0xa732, 0xa732, 0x8732 };
-	u32 adwSDRAMCfg2[] = { 0x87d2, 0x87d2, 0xa7d2, 0x87d2, 0xa7d2 };
-	u32 adwSDRAMRsh[] = { 36, 39, 40 };
-	u32 adwChipSpeed[] = { 110, 120, 125 };
+	static const u8 adwSDRAMArgCfg0[] = { 0xa0, 0x80, 0xa0, 0xa0, 0xa0 };
+	static const u16 adwSDRAMCfg1[] = { 0x8732, 0x8732, 0xa732, 0xa732, 0x8732 };
+	static const u16 adwSDRAMCfg2[] = { 0x87d2, 0x87d2, 0xa7d2, 0x87d2, 0xa7d2 };
+	static const u8 adwSDRAMRsh[] = { 36, 39, 40 };
+	static const u8 adwChipSpeed[] = { 110, 120, 125 };
 	u32 dwMemTypeIdx;
 	u32 dwChipSpeedIdx;
 
-- 
2.39.2

