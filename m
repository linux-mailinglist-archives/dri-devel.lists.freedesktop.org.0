Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2319B5FEA46
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 10:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8736F10EA9B;
	Fri, 14 Oct 2022 08:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC0510EA96;
 Fri, 14 Oct 2022 08:15:58 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id s30so5848436eds.1;
 Fri, 14 Oct 2022 01:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zi3g0gUsoeReyu3M9Dd3IEc+zU79SSSBwTJbXIApLpg=;
 b=R6gVvB8anInV7lNdqB+ENmzugVdF686pFgLU5ufl0FN5l3OTFcnE/CWYXB84tZWN62
 s6QW8dEAhbSikwOJY0rGxepIzcU4RfQhQ3sdOtyLYwgbzPSXBjSUhKoGlPQ71P5895p1
 rJAjUNy4tk2fVD4LbYDT7qtLD57naKlhvMVoLV1EGACb6X4EcvivZTGcj6EBOhvqK0bq
 KbdFuCpRtU0LgfvGEv+zjrQsHYR+PmKRG38pZhcy0IV81KaJl9+FBbZhedHVdPJ9QRbA
 BOJKXfdptuyNjQ2FWqKjvaAPLj7/Pt3SkDR0ZGULOam1FdC+InCwIHCKa/5WH2TkPhne
 lYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zi3g0gUsoeReyu3M9Dd3IEc+zU79SSSBwTJbXIApLpg=;
 b=TRxUheUpILuvmliOpprEIOLA9/nouA6vs0tvO7J6C3dZiX0+kyiEjn/XpzpTiLUFQc
 jkNij+NhUPGszmhKi2y+fxi0fOOfaxsLD0huuhKn2K8GmcViLSsXsA/9R69eBbq2Z0iX
 7jk1unSFcZNpA3riowhFRDw8DUs8XZbYzDaCijlYGJ20z+AAQR6gmgB2pfwcp3eCR1J1
 ghUBQjKIG2VVnIizdXtioQ55gTUOnz6O7SdelVGXWfWF3ZbWns/dCsr42Qr16WlOi+7a
 yk5wiuNeN3U3rIjN4LF9DA2lfeSvv+Cp5mrMdyr3cBAJY215g9Gj7oKF6kY3h4DqmF0n
 U1ZA==
X-Gm-Message-State: ACrzQf0BtmBGw4sZ2CJhLZvvTxI47B670VM+wzcAxDLcx3mcz9JHRRIB
 +gZ1Dcd6Kvhjund8aDP9NSc=
X-Google-Smtp-Source: AMsMyM46Gt3+KeRKQ//eFjkr9Auam70HriXsymEnFt0GVzMbcHlD7zThEefdDu9I06HPHf9hJXFZ6A==
X-Received: by 2002:a05:6402:450c:b0:443:6279:774f with SMTP id
 ez12-20020a056402450c00b004436279774fmr3352022edb.11.1665735357051; 
 Fri, 14 Oct 2022 01:15:57 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 lb17-20020a170907785100b0078d886c871bsm1146188ejc.70.2022.10.14.01.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:15:56 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: use DRM_SCHED_FENCE_DONT_PIPELINE for VM
 updates
Date: Fri, 14 Oct 2022 10:15:53 +0200
Message-Id: <20221014081553.114899-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014081553.114899-1-christian.koenig@amd.com>
References: <20221014081553.114899-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make sure that we always have a CPU round trip to let the submission
code correctly decide if a TLB flush is necessary or not.

Signed-off-by: Christian König <christian.koenig@amd.com>
CC: stable@vger.kernel.org # 5.19+
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index 2b0669c464f6..69e105fa41f6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -116,8 +116,15 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
 				   DMA_RESV_USAGE_BOOKKEEP);
 	}
 
-	if (fence && !p->immediate)
+	if (fence && !p->immediate) {
+		/*
+		 * Most hw generations now have a separate queue for page table
+		 * updates, but when the queue is shared with userspace we need
+		 * the extra CPU round trip to correctly flush the TLB.
+		 */
+		set_bit(DRM_SCHED_FENCE_DONT_PIPELINE, &f->flags);
 		swap(*fence, f);
+	}
 	dma_fence_put(f);
 	return 0;
 
-- 
2.25.1

