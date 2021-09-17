Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2661440EE99
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 03:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEA96EA99;
	Fri, 17 Sep 2021 01:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8E96EA99
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 01:08:51 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id f129so8005396pgc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 18:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F6536BzXgr3md2XEBD1rshEt0Z3opmm8yH9szMh9vwU=;
 b=lqOy2lifHrcAx90KKEOIet8ERLj3UYIsxz1R6VTGv1PL/RVVCanO8pGJCAChDvOzY1
 LLLBDLvm52OuA2ub4WdEpM6wkJkJykMy1ip6w77ob/ipnclveFr0RfoTX9YVyEH1xNKR
 E6IJZY7xRub5yuW+aUj4M+pnmT94gLRGDSmfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F6536BzXgr3md2XEBD1rshEt0Z3opmm8yH9szMh9vwU=;
 b=abrV0mqCQL0s1E6DJ33pq826p99Om5GBglilF3K1Qb2MwKZ6JGq8SINqPjt7QW3MGb
 g7494IK8q7h+/5pR65rCxzDZM1TG4V5hMngyPKh4SmMN34d6R4wkBA1ShQj9ZnivlFEc
 qIRzKMjSSNmJvJoqF/eibkBl93Mkvozmd7/zXcCTxEOnfMwVridnJJlkqum8BfEBuXtU
 QrLJngc/vdVkEmEEJPh07YGG+LxbG3k7GiVu9JI2RFygHnFgtZw3Qx/3r34bH/5gIGyA
 o03LsrPQaCHDTLGZNkNneQcreo/CEX4Swl1zxkaMCOh532JjOrIFh7sDHj77UZY4AEeu
 t9Jg==
X-Gm-Message-State: AOAM530BFG18kbK5QtROypdPQT6MscrbBp8wjVBi4BwoBxV4QwWUJBQ/
 dweOJHlIOERT9HURer+l7BmL3i9cYrqftk+c
X-Google-Smtp-Source: ABdhPJzZ9EfB4X4UmBni/jw//EG45Bl04gvIt7Qxa/28OHFM6Vyir/imF/QkySDFVvEOrp5X8koGhw==
X-Received: by 2002:a63:4b24:: with SMTP id y36mr7617820pga.230.1631840931037; 
 Thu, 16 Sep 2021 18:08:51 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:dc20:9a88:c41:f0dd])
 by smtp.gmail.com with ESMTPSA id v4sm4215812pff.11.2021.09.16.18.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 18:08:50 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v2 06/12] drm/virtio: implement context init: track {ring_idx,
 emit_fence_info} in virtio_gpu_fence
Date: Thu, 16 Sep 2021 18:08:36 -0700
Message-Id: <20210917010842.503-7-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210917010842.503-1-gurchetansingh@chromium.org>
References: <20210917010842.503-1-gurchetansingh@chromium.org>
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

Each fence should be associated with a [fence ID, fence_context,
seqno].  The seqno number is just the fence id.

To get the fence context, we add the ring_idx to the 3D context's
base_fence_ctx.  The ring_idx is between 0 and 31, inclusive.

Each 3D context will have it's own base_fence_ctx. The ring_idx will
be emitted to host userspace, when emit_fence_info is true.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Lingfeng Yang <lfy@google.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 9996abf60e3a..401aec1a5efb 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -139,7 +139,9 @@ struct virtio_gpu_fence_driver {
 
 struct virtio_gpu_fence {
 	struct dma_fence f;
+	uint32_t ring_idx;
 	uint64_t fence_id;
+	bool emit_fence_info;
 	struct virtio_gpu_fence_driver *drv;
 	struct list_head node;
 };
-- 
2.33.0.464.g1972c5931b-goog

