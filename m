Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AB499D4CE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 18:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C50010E48F;
	Mon, 14 Oct 2024 16:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="DrGK96AA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9230410E48C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 16:37:38 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-71e70c32cd7so395005b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 09:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1728923858; x=1729528658;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sVGl2ftbuqqnUqeIL1a1bElRQ/ry6hMTlQBnPSxP8Dk=;
 b=DrGK96AAtYnT7Ov0mWOFQVhsocHIYccTx0QgPZVBOqgwNsY4gi2A2zRB4r6nExildk
 covYrT5sYYkPHfmRBUoZa1ZKB+CCNlCYyDVdF9ToJ1D+V8esi+iriZpNn/A65xkYT748
 wilGFOLEh1kDs8cFY4Dh4NH7/Pijz1GLmqSfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728923858; x=1729528658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sVGl2ftbuqqnUqeIL1a1bElRQ/ry6hMTlQBnPSxP8Dk=;
 b=qyDbh3d6hCVj/3bFD3zvMc43b9ON8IPk8nLLHmrlDXnRgV58x/f2gYrL9ay3X5MnGQ
 HnGs/D6BPx8k42mHwEYb7WH5TeI1zyfiXWWih0J6mLZ8p0DUUFAXYeuJCul23QE5k1nR
 DUg5DmSZpcRW5aVAu4tg+WKWARFhra7SrwrhD4qSnKQ8a6hQPl9ZEyYJiCSJzU5WwHIy
 YeexoOnStA6joyIgYnKjXlmY2Uj7NoyoPN3xRx6pAQ5Yp3CX0iTSO4lAAcZiPPGbCSrs
 +c0NhVr89V0njVi9kG8pHiXM4bNtvp2LAvEoSAHmEwRxWE4hQUv+vH8ZRS3RWXpsKBXB
 S68w==
X-Forwarded-Encrypted: i=1;
 AJvYcCViTJp1G0DqPzMb1eVVFI724lRmtrL0H9LMOdIJWsV4aAdNrKxtGqXJ08aPsJfeC3utuyWR8cD+rHg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyThNCUAQG8cPdAUoDIjFppgGd8sb7UEEBNI2AqbIIBIwqpdeCC
 ZVzIl2F+NRmNDdDzvZpCTI3ts+dAfXZdbEGLc7Qjq856ulBZoYAK+MWnVBda6g==
X-Google-Smtp-Source: AGHT+IEguS+DYgfr50X3amlVgerOKKT45qvqYFP4etgOkkRvUpQ1dDg9fKu0+t5LQwDSWp3K3ICKxw==
X-Received: by 2002:a05:6a00:4652:b0:71e:4c86:659a with SMTP id
 d2e1a72fcca58-71e4c866d72mr13703071b3a.9.1728923858137; 
 Mon, 14 Oct 2024 09:37:38 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:1e71:8a09:a3b:1e00])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71e51dc0617sm4383693b3a.165.2024.10.14.09.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 09:37:37 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/msm: Simplify NULL checking in
 msm_disp_state_dump_regs()
Date: Mon, 14 Oct 2024 09:36:10 -0700
Message-ID: <20241014093605.3.I66049c2c17bd82767661f0ecd741b20453da02b2@changeid>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
In-Reply-To: <20241014093605.1.Ia1217cecec9ef09eb3c6d125360cc6c8574b0e73@changeid>
References: <20241014093605.1.Ia1217cecec9ef09eb3c6d125360cc6c8574b0e73@changeid>
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

The msm_disp_state_dump_regs():

- Doesn't allocate if the caller already allocated. ...but there's one
  caller and it doesn't allocate so we don't need this check.
- Checks for allocation failure over and over even though it could
  just do it once right after the allocation.

Clean this up.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index 4d55e3cf570f..07a2c1e87219 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -25,24 +25,21 @@ static void msm_disp_state_dump_regs(u32 **reg, u32 aligned_len, void __iomem *b
 	addr = base_addr;
 	end_addr = base_addr + aligned_len;
 
-	if (!(*reg))
-		*reg = kvzalloc(len_padded, GFP_KERNEL);
-
-	if (*reg)
-		dump_addr = *reg;
+	*reg = kvzalloc(len_padded, GFP_KERNEL);
+	if (!*reg)
+		return;
 
+	dump_addr = *reg;
 	for (i = 0; i < num_rows; i++) {
 		x0 = (addr < end_addr) ? readl_relaxed(addr + 0x0) : 0;
 		x4 = (addr + 0x4 < end_addr) ? readl_relaxed(addr + 0x4) : 0;
 		x8 = (addr + 0x8 < end_addr) ? readl_relaxed(addr + 0x8) : 0;
 		xc = (addr + 0xc < end_addr) ? readl_relaxed(addr + 0xc) : 0;
 
-		if (dump_addr) {
-			dump_addr[i * 4] = x0;
-			dump_addr[i * 4 + 1] = x4;
-			dump_addr[i * 4 + 2] = x8;
-			dump_addr[i * 4 + 3] = xc;
-		}
+		dump_addr[i * 4] = x0;
+		dump_addr[i * 4 + 1] = x4;
+		dump_addr[i * 4 + 2] = x8;
+		dump_addr[i * 4 + 3] = xc;
 
 		addr += REG_DUMP_ALIGN;
 	}
-- 
2.47.0.rc1.288.g06298d1525-goog

