Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B65C99D4CD
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 18:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A4F10E48D;
	Mon, 14 Oct 2024 16:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="D/8pQxyo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712A610E48C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 16:37:36 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-656d8b346d2so2800682a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 09:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1728923856; x=1729528656;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y0QDCUs/8D4jixu/KfGYmNxOa4c0mSZ3kXKt5t3/Xv8=;
 b=D/8pQxyonrcE1GsY+LFLmLTwfgaXaykjvXiBJ3Ck2ts15X24XRIh6qqQDJlh4pPMrO
 uUlmdFKO9ug1kI5tElr6MbADNwiu+Q1SiHqECOJu72JaBx6WwzNCuULjDK+7ZT1IAbAy
 MswMFb2ppTb/ix6EFyILbI0oBkcQjawQw23as=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728923856; x=1729528656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y0QDCUs/8D4jixu/KfGYmNxOa4c0mSZ3kXKt5t3/Xv8=;
 b=gyxdQNgc0cP4PYhKVhxVX2inatRJmfWq0hzGeD+cIxL7cLZNBw0nmdf6BZR8Jow7m+
 ACT5I/bTAfSkId5lX4PKEBuXoLjGMNQXGlDmu6/O+rysKwDxTo8G8QOx+flp1cYWXLzb
 rhDLMuZv0izp74uhHiuBdGRltsUv2lMMOVAuRV5cUq0wbvo0kIYn/TXCCxF9zzkJafQp
 sNtuGghUcuagkKn/rsRRW7F7JTR24E240O3BPHXADsCmN1klFobIz82HNgm4UfkcdTjm
 aMMzONmDCYBWQe6ohHoEwGztgRu8WUnC6bNtIS8wu27fJ+gk2kXLDw0WXopaocbSspFK
 Ae6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYbV1T6vg1KCazBH1EedkHRWvuXW7NAyfR8fnUAzAgYpOYLstuFviwsvU5s1EkwM8Tjd9uc6AMA5A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrcpPy+jyyIt2Wrpx8Fp62peqGekGAEfwu9ankPzAgz3lQIoyu
 ubd7DGsd4me8wWbqVrwcR4U3aUT1D92KRoqAYMJejS7kIY1wxUgAKYxw/AqOowTCfE6pNuFafcA
 =
X-Google-Smtp-Source: AGHT+IGux4tneH6GmBs7wM4quuJ0YGWj3+34YGtAX6dD/SdcV19l8y70Ofmfq5jY72pPsYNjcr0LjA==
X-Received: by 2002:a05:6a21:168d:b0:1d8:bbc9:37c7 with SMTP id
 adf61e73a8af0-1d8c969074dmr13073659637.36.1728923855948; 
 Mon, 14 Oct 2024 09:37:35 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:1e71:8a09:a3b:1e00])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71e51dc0617sm4383693b3a.165.2024.10.14.09.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 09:37:35 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/msm: Allocate memory for disp snapshot with kvzalloc()
Date: Mon, 14 Oct 2024 09:36:09 -0700
Message-ID: <20241014093605.2.I72441365ffe91f3dceb17db0a8ec976af8139590@changeid>
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

With the "drm/msm: add a display mmu fault handler" series [1] we saw
issues in the field where memory allocation was failing when
allocating space for registers in msm_disp_state_dump_regs().
Specifically we were seeing an order 5 allocation fail. It's not
surprising that order 5 allocations will sometimes fail after the
system has been up and running for a while.

There's no need here for contiguous memory. Change the allocation to
kvzalloc() which should make it much less likely to fail.

[1] https://lore.kernel.org/r/20240628214848.4075651-1-quic_abhinavk@quicinc.com/

Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index bb149281d31f..4d55e3cf570f 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -26,7 +26,7 @@ static void msm_disp_state_dump_regs(u32 **reg, u32 aligned_len, void __iomem *b
 	end_addr = base_addr + aligned_len;
 
 	if (!(*reg))
-		*reg = kzalloc(len_padded, GFP_KERNEL);
+		*reg = kvzalloc(len_padded, GFP_KERNEL);
 
 	if (*reg)
 		dump_addr = *reg;
@@ -162,7 +162,7 @@ void msm_disp_state_free(void *data)
 
 	list_for_each_entry_safe(block, tmp, &disp_state->blocks, node) {
 		list_del(&block->node);
-		kfree(block->state);
+		kvfree(block->state);
 		kfree(block);
 	}
 
-- 
2.47.0.rc1.288.g06298d1525-goog

