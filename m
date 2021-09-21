Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C92413DF6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 01:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2916D6E8FE;
	Tue, 21 Sep 2021 23:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B1E6E8FC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 23:20:33 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 nn5-20020a17090b38c500b0019af1c4b31fso833416pjb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 16:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F6536BzXgr3md2XEBD1rshEt0Z3opmm8yH9szMh9vwU=;
 b=L/paKdeUj0CtgWDfElhA3ZeqJkNN+9U1Y4mRoHKek0N3uwYkYE+EbNbb1Y/xq/V+yF
 cFi39Ai9KpPMaPVc/rsGmn+os/3UqYNDZpUCeTS98A+FqJo5hYLgfF4C0AwQkk63iYTt
 2as81n+niAZjggo0iFaVZMsqZX/Nq6zRqkDpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F6536BzXgr3md2XEBD1rshEt0Z3opmm8yH9szMh9vwU=;
 b=HNhaG8/adfTJkrO430WmI4s4TlykkLgohdIsM2ADX/tRtkKfzBQGQH56iCwNRab36f
 nBLbkiKzZmI5wdgPiRNofSTX975AYQ1q8qsJaTUWQPH3CMc9Nsk1a+SfpOCQcg4FFn5+
 IPpCkDM0YKVkmMznJBPQ7jQpVP/R+iL+lMsDK3suOjTwSlO7koGcNLrwb7m5cEYxhNwD
 /S/yFwuc9HDO/sBAuPJhShjx44UYNBkkXzVagvmzQleuZYwX2oAAfz0cQV9vKVQKB8EC
 x7+8z2EghB4iZTF4imisje2UO2GMfXoTGOkX/JrfwTC8EI445IV/smzCX0nwuWO/vhPH
 hHww==
X-Gm-Message-State: AOAM532uJZErqxcAVTfEDYszaFJCSgWnY7QwUhWLwRqm8wcqx9u54Cf7
 eaPj22jmG99AQeIGk1QE+YSjLwecwR87EQ==
X-Google-Smtp-Source: ABdhPJygesKKL+1vFBn+AlFEEyskpjNbkwvUrpaHSvFVrdGD4BHhIbn8q7sCeqS1ez1B9eweIrZiog==
X-Received: by 2002:a17:90a:ab94:: with SMTP id
 n20mr8166808pjq.146.1632266433147; 
 Tue, 21 Sep 2021 16:20:33 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:a5ff:11c:6401:fce])
 by smtp.gmail.com with ESMTPSA id e2sm201906pfn.141.2021.09.21.16.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 16:20:32 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v3 06/12] drm/virtio: implement context init: track {ring_idx,
 emit_fence_info} in virtio_gpu_fence
Date: Tue, 21 Sep 2021 16:20:18 -0700
Message-Id: <20210921232024.817-7-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210921232024.817-1-gurchetansingh@chromium.org>
References: <20210921232024.817-1-gurchetansingh@chromium.org>
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

