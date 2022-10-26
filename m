Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 923FD60E4ED
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCFB10E589;
	Wed, 26 Oct 2022 15:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502FC10E56E;
 Wed, 26 Oct 2022 15:36:13 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id r22so22579340ljn.10;
 Wed, 26 Oct 2022 08:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0CG3FwSUAOl1HMDb3efp7unHbFctLIwlHQeHnLl6gJo=;
 b=Az0il5YsiGJvyp6LViCh/r+njcwXdimfd7Ej0f/gkhZJcxuae+o8XN6PG5m9prIEJ7
 NU5QXeNtxk63wOKPvTtYvvPClT9oSgK2Hur4yHjilaM4sXKDCnph/cyHamfFW7I3GfX3
 WwC9lW1rsZ3MXj2EZ+JKuMIwRXKv3zIKlE94P3N6hh3J4IRPyOiQUOAXKrBAMpfM7PID
 Ok+lSXlsmhCTDKcu03MGFdSnGEGYf4vdh26s7SyjAqcyGTdvO/pYFiao/GrkMQ0Tcr0B
 Qlvwowy+wA/3IdAkdTDL2Qbtelv0qPtxS8b96E1G8sku36phf3PQps9do2uG37ypsnTm
 t6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0CG3FwSUAOl1HMDb3efp7unHbFctLIwlHQeHnLl6gJo=;
 b=o73E8EMwyf4na+ypr08uRaMlaavRdz5WzLJPpolrAEl+GLzlAhuCHDdxRgDkbQW/h1
 pVZ1NXUr9uMkiNXtMCGMemEAn/51S1dOLDO5OWWrNryM8SmM8ZGNqQYPVBgjCPO0N28H
 nA5CnAYLaIbB3gOYVnlLkaZmd6/kTlSEmkMrYXy5F0Q8/byQlSsaIBrxtmN16Zmup3Kl
 UjSc3Egs7tMp38y+B6Cfvk4Z4wQkI+01Ahuq5dnIHSnmgSbX2Igd58G2Za9wuat09+PY
 dfKSSgNd4qYPgYwpI6sGCT9adUSqB0mYwERqpzc19UsBWWuikbKqVhymVASvdjfsfXlY
 kHPw==
X-Gm-Message-State: ACrzQf2s9fBsuNOyGKNUAAxtSbSw87T4b/9WUA39Fin6SDruMQNzFeEu
 LI74i44nD3b3+qIDkh3aOzRjGF5mHeg=
X-Google-Smtp-Source: AMsMyM57bsSME4LPkvnmYeFsLvKhOqVlP5vcV+cfatpU8ZXfjvX2eC5EaB6AXqXzer9cx9CSKtMWDA==
X-Received: by 2002:a17:907:2c5b:b0:78d:3f8a:19d0 with SMTP id
 hf27-20020a1709072c5b00b0078d3f8a19d0mr37281305ejc.369.1666798561626; 
 Wed, 26 Oct 2022 08:36:01 -0700 (PDT)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 la3-20020a170907780300b007abafe43c3bsm3066715ejc.86.2022.10.26.08.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 08:36:01 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: luben.tuikov@amd.com, vprosyak@amd.com, Alexander.Deucher@amd.com,
 daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/amdgpu: stop resubmittting jobs in amdgpu_pci_resume
Date: Wed, 26 Oct 2022 17:35:55 +0200
Message-Id: <20221026153557.63541-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221026153557.63541-1-christian.koenig@amd.com>
References: <20221026153557.63541-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As far as I can see this is not really recoverable since a PCI reset
clears VRAM.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 39e94feba1ac..b1827e804363 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5745,8 +5745,6 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
 		if (!ring || !ring->sched.thread)
 			continue;
 
-
-		drm_sched_resubmit_jobs(&ring->sched);
 		drm_sched_start(&ring->sched, true);
 	}
 
-- 
2.25.1

