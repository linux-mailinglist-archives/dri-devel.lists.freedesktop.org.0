Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF02C2552F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 14:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B72B10EB9C;
	Fri, 31 Oct 2025 13:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T5pQGM8+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495E710EB5E
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 13:45:01 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-475dc6029b6so23042105e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 06:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761918300; x=1762523100; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dcs5G3OnlnQFK9aYqll3CwX2/M7qzjpRhdjkxpesGLA=;
 b=T5pQGM8+xh5mRSx/oOe0F4n3l6ZTR8B+3CgPMvI4l7ykEmtXaInRw4G/bUSRpTFsIq
 suRXSPdzuF9IlKCyFaMihdHTi9DtxVZbH2idytBmSU3d+PYa+/1MiMO/P0J3lxZfHGSI
 6EZyEDlfGpBSmdMXHG1i3E5jEJuFpZIJCyyRayav/UGcP6muRRDr7Rq0nuAgnvAFbyI5
 +4bDcJw6K5ljG4/sHSNEz0lBxcpyLSxpmV2UVgb7+FkIZ3eBdOUaW0H0Uhjrh7fJzG1x
 1UPfLs5tu0BJFuAW04Yul0vrpTweftOB/wNBlRcXX4FQXmm/SBrEZ/Y97Yha4Nr4nKia
 7vxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761918300; x=1762523100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dcs5G3OnlnQFK9aYqll3CwX2/M7qzjpRhdjkxpesGLA=;
 b=ho7eKAtoAZT+MRDbsDu5fiKKXBbE8tnPWVCTkyBVTEzi7mKUgozm+cPnvo0Qm9Tmy9
 YjmLE8BzSEWd2Z7UaQ0I+E34l/6i9cIAwL2o1ixHY98RKpMhAD8jX52yTNJXzcLr0OVU
 +uFe5LmewTej2gYqPZ3x7hHFjix8dXskok56QlhsZQJKGuZk9z/fpoi0dq8VUnGXbPOa
 Tf1Q9zNcdjtMtyZ2fkIxCaJL2g/M33dlFVHsWmREQvaTcf91A3xqJu0lD5oUJGo7Dt+e
 CJXdXF1ByZGCYDzEFKIxzAvHGKJIdh985+A4VRXhycUZzWxQuC1YxG5DzLF+vxJRxhGe
 2TRw==
X-Gm-Message-State: AOJu0YyMdrs7HmhAhWmARg4oTHvoXuJv2lnfrucyFXiW9JvulIPoiYkx
 VGDWPq7VHA1qk7aV07LVaF0Yt6nainK49cevLb9XjF7OhKq3O5cwX40N
X-Gm-Gg: ASbGncvjICHKqNen6TzjkDGq8hAewTmjxEbRirJhphGcdxy22weAKA0Q9g/FFFRNN20
 lOfHIEEtw+Hi+S4qSRMyGhIVYpN/G+1nCgBoiitlTGN3I897k7uEYPbBdzUocjOEPE5Ml+5dFCw
 iQOHecKQziC3fc+x7Hsr8maUtwz/5So13jC0ZCx/0XLg6BIfPCFi2upVdBji5m2FKqyIz0AXW+Y
 /GbuTX7DS57pf8D0xlAt2OJM8xxPeE/5N2nqexasEjb2RXrarp9HPFyDIgV+Pa/MCjvnAnWDAWz
 Y8dtuWeArARDwD7oFgx4LD7prFohE06g7r5Qd/douYfdesZZ0VW2ig1pYXgtb0Emh3YctARNq1P
 JSwxEECesSzCsiRsUfGF1+LauLLqAjA5jXbLT9lbinBohvZky/PJwpvlplHwb28wp1AFBGz0eZP
 nIt7nygffbE04M8A==
X-Google-Smtp-Source: AGHT+IEeMawiv1AWBoc/CNasg45ysKOcunYStFH+uIR99FYt1fcC4OBFuND6mmh9bIRXBFr2NSMQ6g==
X-Received: by 2002:a05:600c:4710:b0:46f:b42e:e360 with SMTP id
 5b1f17b1804b1-477308a8972mr30699455e9.40.1761918299694; 
 Fri, 31 Oct 2025 06:44:59 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1599:7d00:73cb:d446:bf90:f1c0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732fe119bsm34502635e9.10.2025.10.31.06.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 06:44:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, airlied@gmail.com, felix.kuehling@amd.com,
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 07/20] dma-buf: use inline lock for the dma-fence-array
Date: Fri, 31 Oct 2025 14:16:41 +0100
Message-ID: <20251031134442.113648-8-christian.koenig@amd.com>
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

Just as proof of concept and minor cleanup.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 5 ++---
 include/linux/dma-fence-array.h   | 1 -
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 6657d4b30af9..c2119a8049fe 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -204,9 +204,8 @@ void dma_fence_array_init(struct dma_fence_array *array,
 
 	array->num_fences = num_fences;
 
-	spin_lock_init(&array->lock);
-	dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
-		       context, seqno);
+	dma_fence_init(&array->base, &dma_fence_array_ops, NULL, context,
+		       seqno);
 	init_irq_work(&array->work, irq_dma_fence_array_work);
 
 	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 079b3dec0a16..370b3d2bba37 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -38,7 +38,6 @@ struct dma_fence_array_cb {
 struct dma_fence_array {
 	struct dma_fence base;
 
-	spinlock_t lock;
 	unsigned num_fences;
 	atomic_t num_pending;
 	struct dma_fence **fences;
-- 
2.43.0

