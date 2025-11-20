Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BB5C74B57
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 16:00:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551A810E76F;
	Thu, 20 Nov 2025 15:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kGUmlvU5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A6F10E76C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 15:00:26 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-640aaa89697so1365276a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 07:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763650825; x=1764255625; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HahB4kD3BbuZGs8EfAIsMuTo8cWrmLD5FsSAsoTAP4w=;
 b=kGUmlvU51A3KWO1impeOv4FIFchNIUo7/IV76vVZNMjEAh3QDnTEq9DfUhbM+DKLPh
 GyBKhIgEBbkj/egv3GdWlinqq11Zb9Dg8vBN435bdUCPZCEE+rmnP2aGCua1bOChSfNP
 QG0RUOI6KT/Xv/No0R2SRZWSWHpdnPlTTSVCHXVqrnq3hnK22khn+sh9u3MAvYvmc9Kr
 ROQtOnfiAkG1yk+aMAFViMzPeoCqXFD/uBtxKpvCIkJYkqDiKRuoWCl3zBh8bfLTT8kf
 7DXiKPyggw6j/v5NlRoLHAmNtV+8fBhRN6Li+Kv0In48MMGdD1kv8hM4y9nXRh3i/Mg8
 dXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763650825; x=1764255625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HahB4kD3BbuZGs8EfAIsMuTo8cWrmLD5FsSAsoTAP4w=;
 b=Q7SjXZI30TbxgqEtGZENKQrZMoEsWSPUGqQ2ER+MiYb6wP4mN7nKim1CxBQI6n6MmG
 gxHjj3r5jEmqOQwcAkj+8E8MCbeyU00tqJOTeF7QnM2aTu7TcIW5u+/cVPL9dzSUFyEO
 oCke3/2wXOEAW+VPZTVRet+h8ur2DlojPiJRc3GxlOPFXHEVjWoXuqDEN65HhbbI0UYe
 lRk8cUwUD5FHOrJpNkW9m/GKMnbM2d4EUuMvjQO3eqOUM2eL+uuyS7whYRzvGR01ZLi4
 wdYmNXiUKKBI1WmdJdHCNqVlVXDx6sM3OIF1uBXW3ANwzHSujXsuEOAthmxt2wudQdsd
 nJkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpksH5x8bNQnznNsGIN2w5LvXlra+bRfTtdbyWl+RB4zX4x2JJIx9xRmdd0cHIDUoy2shzSTsYmpQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFeR2ONVnfztljTHdjbKkqLfonYBaupJLCvqAgZOYPNrnmn1R+
 m1XSL/XGi0nUbk113XOPdhwhRchR1CM+muxsq+DxlOv1YE2bVuh/Gmj+
X-Gm-Gg: ASbGncsHk1ItYiy1IMaBt9om2OAAJ5+mDQTgqnNiC8OX0wj/PIcayjywtFs+sBJo+Tp
 OcEDK/WESBsO3hK2vPV1PMHwhwjt9FJn+qzvorEucqapR5LoXWTnwRlJHQXCRx+YIcA85i//AQV
 sKEmo6V/LSqhjT72zHyU6kNqk79k0th085SuiyugUlufcmhOy21ubsYy8WozeAebmtgiWiuNLXX
 SPq2mEFxkQ50Fa/2paMGLLePCa1TZE4bpOOZ/FqhKrPWVzM1xPT3EavSpk2D7jgAk6DOGI1nSO3
 TdjE/D6iTrSGkJqcGG9j095/mK2zHZG0Xe64QN91lT+1l5bC+uPPJmzEdXMBozxZSWRuFfTMzYW
 nH9rIgUhXmcjDmR5pIpVMNttkbtSXUav7zXlXYqciJlwBTc4rhAUSV/veY8it6r4rXA/5/+yR9+
 d/yRmEcSjNKNCBumKXjjTZwUUG
X-Google-Smtp-Source: AGHT+IHaVtV04nY0hHwgE9GEibS+3Ol+3hkr8JW8/PTF7cVq791tImDU/k/bJ0L5LNcwQUakY//3kg==
X-Received: by 2002:a17:907:9801:b0:b73:d7dc:ddc5 with SMTP id
 a640c23a62f3a-b7655258118mr359301466b.2.1763650825086; 
 Thu, 20 Nov 2025 07:00:25 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:154c:c900:7aba:c4b7:a402:3cd2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6453645f2easm2205878a12.33.2025.11.20.07.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 07:00:24 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 faith@gfxstrand.net, sumit.semwal@linaro.org
Cc: linaro-mm-sig@lists.linaro.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/sched: warn and taint the kernel when maximum timeout
 is exceeded.
Date: Thu, 20 Nov 2025 15:41:10 +0100
Message-ID: <20251120150018.27385-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251120150018.27385-1-christian.koenig@amd.com>
References: <20251120150018.27385-1-christian.koenig@amd.com>
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

Exceeding the recommended maximum timeout should be noted in logs and
crash dumps.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 1d4f1b822e7b..88e24e140def 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1318,12 +1318,22 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 	sched->ops = args->ops;
 	sched->credit_limit = args->credit_limit;
 	sched->name = args->name;
-	sched->timeout = args->timeout;
 	sched->hang_limit = args->hang_limit;
 	sched->timeout_wq = args->timeout_wq ? args->timeout_wq : system_percpu_wq;
 	sched->score = args->score ? args->score : &sched->_score;
 	sched->dev = args->dev;
 
+	sched->timeout = args->timeout;
+	if (sched->timeout > DMA_FENCE_MAX_REASONABLE_TIMEOUT) {
+		dev_warn(sched->dev, "Timeout %ld exceeds the maximum recommended one!\n",
+			 sched->timeout);
+		/*
+		 * Make sure that exceeding the recommendation is noted in
+		 * logs and crash dumps.
+		 */
+		add_taint(TAINT_SOFTLOCKUP, LOCKDEP_STILL_OK);
+	}
+
 	if (args->num_rqs > DRM_SCHED_PRIORITY_COUNT) {
 		/* This is a gross violation--tell drivers what the  problem is.
 		 */
-- 
2.43.0

