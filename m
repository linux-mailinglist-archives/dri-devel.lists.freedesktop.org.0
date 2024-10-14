Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A88299D4C9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 18:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF69310E482;
	Mon, 14 Oct 2024 16:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bCsZwRNA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D54510E487
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 16:37:34 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-71e6f1a5a19so470793b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 09:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1728923854; x=1729528654;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Eq6RmtQgXylpaIuQSD/eFivfyV/YbUHAedXEkzzSSXc=;
 b=bCsZwRNARJo7zMvq3tqEgm4mdV+HuGFOlDnP0h6AO8R7daG+jKZWoEqEevHWE1oy0i
 FmXkOAEiLPjRocHMEXQbbPgJlFj0HTsAa6UZXhZUYww1RWQ3lUOmkIXZHw8CIuU2MrT2
 x7YkGQa6fvXSYrBbbC109ul6bGSQXfqT2omAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728923854; x=1729528654;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Eq6RmtQgXylpaIuQSD/eFivfyV/YbUHAedXEkzzSSXc=;
 b=E/0aIkO1NCFcjUewMp6AoV6m1HAG9lGXHvJlFpTqw0RCsQ2yHYGg43LWVLlUCN2BVJ
 fWmDwFyYLEVDU1YFIdiG0cQlafiupm8SPoTamMXca7Emgapip4rdItlB0WyE217VG45q
 cBBwlPO+tXxKUuDzTlUYsCnKzVS0UgrY6Q/tUOqxHcRe+6SrKbX0+qPqnzJ+R0GwGUdS
 sFnN7r3luexDsYMycZkctlbi9E8V0vSQRQ59A/rezkMtNVnhJSB6TUEKLlZi9+v7RLJ5
 3rLTAc1ULB7tT3apUBDWYk9Hd0ykwHu6rBLEqrphyKGytJef6EAi9I3nF5xycABqJQnR
 TlpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU16L1y3ZvEvYyEOzl1+yBBDP8DHj34Y5q4oNLZmU/P4xB8ybjAjo+QNtE4zl3RjIWgG54APqK4fN8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhgrbHwOixIdIW7aNNM4J9nbg7UcZug2kwUZVlOwjmN6uERPfh
 WTx2h2kUZ+AeSa2bR5mHA963lMkeJmQtYnOeEDTL7JUHV9s12nzEVsStdtPMbQ==
X-Google-Smtp-Source: AGHT+IFrI6AyFlAD+rPt6sq8RJjzjcPvxnHIHU5bh4fmZllt0MuEFWzqp3sZJTWGMBx/myacl4Lxew==
X-Received: by 2002:a05:6a00:9282:b0:717:9154:b5d6 with SMTP id
 d2e1a72fcca58-71e37f4ed89mr19746704b3a.22.1728923853741; 
 Mon, 14 Oct 2024 09:37:33 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:1e71:8a09:a3b:1e00])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71e51dc0617sm4383693b3a.165.2024.10.14.09.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 09:37:32 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/msm: Avoid NULL dereference in
 msm_disp_state_print_regs()
Date: Mon, 14 Oct 2024 09:36:08 -0700
Message-ID: <20241014093605.1.Ia1217cecec9ef09eb3c6d125360cc6c8574b0e73@changeid>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the allocation in msm_disp_state_dump_regs() failed then
`block->state` can be NULL. The msm_disp_state_print_regs() function
_does_ have code to try to handle it with:

  if (*reg)
    dump_addr = *reg;

...but since "dump_addr" is initialized to NULL the above is actually
a noop. The code then goes on to dereference `dump_addr`.

Make the function print "Registers not stored" when it sees a NULL to
solve this. Since we're touching the code, fix
msm_disp_state_print_regs() not to pointlessly take a double-pointer
and properly mark the pointer as `const`.

Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index add72bbc28b1..bb149281d31f 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -48,20 +48,21 @@ static void msm_disp_state_dump_regs(u32 **reg, u32 aligned_len, void __iomem *b
 	}
 }
 
-static void msm_disp_state_print_regs(u32 **reg, u32 len, void __iomem *base_addr,
-		struct drm_printer *p)
+static void msm_disp_state_print_regs(const u32 *dump_addr, u32 len,
+		void __iomem *base_addr, struct drm_printer *p)
 {
 	int i;
-	u32 *dump_addr = NULL;
 	void __iomem *addr;
 	u32 num_rows;
 
+	if (!dump_addr) {
+		drm_printf(p, "Registers not stored\n");
+		return;
+	}
+
 	addr = base_addr;
 	num_rows = len / REG_DUMP_ALIGN;
 
-	if (*reg)
-		dump_addr = *reg;
-
 	for (i = 0; i < num_rows; i++) {
 		drm_printf(p, "0x%lx : %08x %08x %08x %08x\n",
 				(unsigned long)(addr - base_addr),
@@ -89,7 +90,7 @@ void msm_disp_state_print(struct msm_disp_state *state, struct drm_printer *p)
 
 	list_for_each_entry_safe(block, tmp, &state->blocks, node) {
 		drm_printf(p, "====================%s================\n", block->name);
-		msm_disp_state_print_regs(&block->state, block->size, block->base_addr, p);
+		msm_disp_state_print_regs(block->state, block->size, block->base_addr, p);
 	}
 
 	drm_printf(p, "===================dpu drm state================\n");
-- 
2.47.0.rc1.288.g06298d1525-goog

