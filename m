Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADF0C25520
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 14:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C734610EB8E;
	Fri, 31 Oct 2025 13:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BukoC9gv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB56810EB8F
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 13:45:11 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-475dc0ed8aeso15411565e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 06:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761918310; x=1762523110; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KOlOmqRHN76msO6RGrvDtrbpjelQuT0RCQu/MYKK0XQ=;
 b=BukoC9gv8Dv42OnKCeDQuJqzANe524FOfrRtY0Pl3wQQ6pwjm7xfh/4qTArulFuClD
 p8wi1/zFMUN8qQ8l9uzq7SRYpYN2MXmUHFnm8814vwUgFCNuPcJxLTtn14E0Ub0TNIku
 Misk2SqxD8vQedXRUCBwufVscWeRECdh1MVUwYTa5H4N2Sp2LRkCFNED+KOIBKdhENqr
 x3ns8BZelCySn0GaSbTxWde858mc79moPQ6O7YaruxMETP/3csqrjtYhvtKV93XMlNvj
 GRX6oXrHoQT1tgQaGCJp6lmSbVhCTO/TFrp4TWLsATSikhgBbMQWAs5Ma/q4MedM8hh5
 Vniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761918310; x=1762523110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KOlOmqRHN76msO6RGrvDtrbpjelQuT0RCQu/MYKK0XQ=;
 b=QIQe5+rivnXA/jmuiL4z6+cd8p/aznaDtV64ES8ByekkWUArQoCWbk3M2Q9krLB6Ja
 EsYaPfyXUH+yIdTs8PBCHmNEBFVbjV676SIXsRpBFVLrAcH7iZfgfO1j0e8W85yQxciy
 HCD2uWaTKbySbsemW0oxf5o8agU3+KYtsbMZ1vvoAAprZ+tMhiqwMeojsAG5bnRH/yDz
 AJ75hA1rwxnKIbp+jLALo8o4c2ekH6IsPpOCJOuMU744m0VARWlNcTE/v30udle+bewm
 BUJlPHKQ3sdekCkqWgvdgoer4tvbGYymBVU0prJEjNqcbYHnwz2f3435LIFhpkMLrPh2
 iJ1w==
X-Gm-Message-State: AOJu0Yz9sAlvNHm/BJ2oW6BzydWk2gBPY5bSWlENJwaZhWaDMps6JbTT
 1fnKq1gGAgJ5/tZrTR0Acb42iYh5fjdgMJ26dW5cbHcxUWZALaMv+Zjs
X-Gm-Gg: ASbGncsjRcH7Vjhd5rOcemYasW7nxyZTlNcg/aCYGvhHM1P+St3w2kUoJtnIud9FBoI
 KQOczanWvhQLF8TRVD3K1zxBJu0cQ1UlwvA002KObm6bpjO88eOsm0gZOEwhqFJri7DWgclSayb
 19hj+IwFQKWR1rmIvz06LUHm6XL+b+gBdHTGmyODrgkGRqTd+qvPccdwPR8pZw9XBT+rnMYWb47
 m6t9dL38HEyKKQPaUzeojOOpOwYIeELzR2TQ/qjCr82K+agqIdCMICduqYYLX0iK4yhvqsetWHD
 yJTp1sHGdQoekfZmccVuKaYPqTNMG94ZrOFar/J3nvY9dLaprkgu/ElTjs36Sdo9a5IPyn1HM7m
 xWKSdYJ+mGabYBboJk1WNE2sS5tSxVukuyFFvTKA0gsaRhjkHRln4IxFKpN2HKjVbAmxiWfuJge
 kCyA0BDWfVMFR2rdmBbPDH+vB1/VStiQiJjb0=
X-Google-Smtp-Source: AGHT+IHlnv2fTY4fjsc9w/nk5RUsuImJ1PUsHeNvrc1Jr0wa0yIqxIsPy0JmrOK+TW6xR8vVjDZ2hA==
X-Received: by 2002:a05:600c:6389:b0:475:de05:6611 with SMTP id
 5b1f17b1804b1-47730793c68mr35813385e9.7.1761918310069; 
 Fri, 31 Oct 2025 06:45:10 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1599:7d00:73cb:d446:bf90:f1c0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732fe119bsm34502635e9.10.2025.10.31.06.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 06:45:08 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, airlied@gmail.com, felix.kuehling@amd.com,
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 13/20] drm/amdgpu: independence for the amdgpu_eviction_fence!
Date: Fri, 31 Oct 2025 14:16:47 +0100
Message-ID: <20251031134442.113648-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031134442.113648-1-christian.koenig@amd.com>
References: <20251031134442.113648-1-christian.koenig@amd.com>
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

This should allow amdgpu_fences to outlive the amdgpu module.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c | 3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
index 23d7d0b0d625..95ee22c43ceb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
@@ -167,9 +167,8 @@ amdgpu_eviction_fence_create(struct amdgpu_eviction_fence_mgr *evf_mgr)
 
 	ev_fence->evf_mgr = evf_mgr;
 	get_task_comm(ev_fence->timeline_name, current);
-	spin_lock_init(&ev_fence->lock);
 	dma_fence_init64(&ev_fence->base, &amdgpu_eviction_fence_ops,
-			 &ev_fence->lock, evf_mgr->ev_fence_ctx,
+			 NULL, evf_mgr->ev_fence_ctx,
 			 atomic_inc_return(&evf_mgr->ev_fence_seq));
 	return ev_fence;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h
index fcd867b7147d..fb70efb54338 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.h
@@ -27,7 +27,6 @@
 
 struct amdgpu_eviction_fence {
 	struct dma_fence base;
-	spinlock_t	 lock;
 	char		 timeline_name[TASK_COMM_LEN];
 	struct amdgpu_eviction_fence_mgr *evf_mgr;
 };
-- 
2.43.0

