Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1421A2446C1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 11:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145FA6EB19;
	Fri, 14 Aug 2020 09:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1116EB19;
 Fri, 14 Aug 2020 09:05:38 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 184so7321420wmb.0;
 Fri, 14 Aug 2020 02:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Awajj0R47lm6sx57tIr1UrmZ8iRE0Zm6ScsJs7CwSFQ=;
 b=JXmQmEJMupkWHWGlNYPwlcrexoKuEmdGptmBbT5gBV/GOjX8tatJOc76QTr2x3v5HA
 TSdDeJmSJkwDeAkDKNFjlzClsETHNRLp0S/pDX7sypwGMN0tkX5MtrteI4dldDlanJSr
 pLHrUoKchuGY+mTV3SeYfSlPU4KRqPvz7oTP/6tr3LZqFEMsQmT+JA16tU6WkfMWFeEe
 pGM+cTQajkI5MSBfcdh/FLEO3m9jUuCgpFk1uh9aJbkt/iu+YHJ/98fAQ3Aya5gVqwMr
 ukR1Vy0mbrR9pgP82KZLcyiXPuRJ8pHoxHBEaa1X3g8IgMbjsWyKb6A3RVqj+502id0b
 m6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Awajj0R47lm6sx57tIr1UrmZ8iRE0Zm6ScsJs7CwSFQ=;
 b=pgXYqdUPPBiPWHM6P+fBcUZfci/m/AuaH2QjFJIV2s8fQ3YVVdQBUGmhqCdhiM6IT1
 HlizUvj92y2aLHT7Y9LlEXYgkrodM0ZoJHFOLQUddr0ZRUUYYP44FAZimKKW51DcFKwx
 3jGpLZ/nsRwOXOiofu0s7DxLWpI+7/VVzB2GzhVSKhyFpwqsxvbkFhgoq6iAMP/tK1i5
 xIVU6H858iAaQl4PYqq9/KC9ChBaPc8RUnMqjVGsrAStCbHc+ooBDwt8qCkKLiHLnTV4
 ES8XecMvhxrhjfao7nIdLQ9jsZDbPle8vnVFJpf/NNDtLl1yIgU6IQdKmlngOzkBM2vS
 itiQ==
X-Gm-Message-State: AOAM533zDmdCTLxIhWcK/X9GzAgVj8H00768a3ZhfQwHHHcRotBWFCbF
 6Cw2eUXISmW954aneqBaVks=
X-Google-Smtp-Source: ABdhPJxqi5bXP8Npuw6YVikeX86l73CGaSFxvFOB8f9irFOzcMaelqhYY2g9h8/LDa36mTZSvAYICg==
X-Received: by 2002:a1c:4d0d:: with SMTP id o13mr1730642wmh.118.1597395936789; 
 Fri, 14 Aug 2020 02:05:36 -0700 (PDT)
Received: from localhost.localdomain (62-178-82-229.cable.dynamic.surfer.at.
 [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id m14sm14046745wrx.76.2020.08.14.02.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 02:05:35 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] drm/etnaviv: add pipe_select(..) helper
Date: Fri, 14 Aug 2020 11:05:04 +0200
Message-Id: <20200814090512.151416-5-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200814090512.151416-1-christian.gmeiner@gmail.com>
References: <20200814090512.151416-1-christian.gmeiner@gmail.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 cphealy@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the open coded pixel pipe selection pattern with a function.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
index b37459f022d7..bafdfe49c1d8 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
@@ -46,6 +46,14 @@ static u32 perf_reg_read(struct etnaviv_gpu *gpu,
 	return gpu_read(gpu, domain->profile_read);
 }
 
+static inline void pipe_select(struct etnaviv_gpu *gpu, u32 clock, unsigned pipe)
+{
+	clock &= ~(VIVS_HI_CLOCK_CONTROL_DEBUG_PIXEL_PIPE__MASK);
+	clock |= VIVS_HI_CLOCK_CONTROL_DEBUG_PIXEL_PIPE(pipe);
+
+	gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, clock);
+}
+
 static u32 pipe_perf_reg_read(struct etnaviv_gpu *gpu,
 	const struct etnaviv_pm_domain *domain,
 	const struct etnaviv_pm_signal *signal)
@@ -55,16 +63,12 @@ static u32 pipe_perf_reg_read(struct etnaviv_gpu *gpu,
 	unsigned i;
 
 	for (i = 0; i < gpu->identity.pixel_pipes; i++) {
-		clock &= ~(VIVS_HI_CLOCK_CONTROL_DEBUG_PIXEL_PIPE__MASK);
-		clock |= VIVS_HI_CLOCK_CONTROL_DEBUG_PIXEL_PIPE(i);
-		gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, clock);
+		pipe_select(gpu, clock, i);
 		value += perf_reg_read(gpu, domain, signal);
 	}
 
 	/* switch back to pixel pipe 0 to prevent GPU hang */
-	clock &= ~(VIVS_HI_CLOCK_CONTROL_DEBUG_PIXEL_PIPE__MASK);
-	clock |= VIVS_HI_CLOCK_CONTROL_DEBUG_PIXEL_PIPE(0);
-	gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, clock);
+	pipe_select(gpu, clock, 0);
 
 	return value;
 }
@@ -78,16 +82,12 @@ static u32 pipe_reg_read(struct etnaviv_gpu *gpu,
 	unsigned i;
 
 	for (i = 0; i < gpu->identity.pixel_pipes; i++) {
-		clock &= ~(VIVS_HI_CLOCK_CONTROL_DEBUG_PIXEL_PIPE__MASK);
-		clock |= VIVS_HI_CLOCK_CONTROL_DEBUG_PIXEL_PIPE(i);
-		gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, clock);
+		pipe_select(gpu, clock, i);
 		value += gpu_read(gpu, signal->data);
 	}
 
 	/* switch back to pixel pipe 0 to prevent GPU hang */
-	clock &= ~(VIVS_HI_CLOCK_CONTROL_DEBUG_PIXEL_PIPE__MASK);
-	clock |= VIVS_HI_CLOCK_CONTROL_DEBUG_PIXEL_PIPE(0);
-	gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, clock);
+	pipe_select(gpu, clock, 0);
 
 	return value;
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
