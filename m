Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CF13F8053
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 04:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402306E49A;
	Thu, 26 Aug 2021 02:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92CA6E4A1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 02:05:05 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id t42so1311479pfg.12
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 19:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N16UwKCm73L0Dw3fehamBkjdWfgf5SKQ7wSO1tmr42Y=;
 b=Vbb/XazD74Mvs1s9YPS4HtEvJaC8FFSYDDIF2at4Zi1WXKwrBaEMTFOJrK/oNf5bxf
 kzE0OWf/U1Wa1pTnXzthQXpByFlJhVKRaZ5xHbrFR0R4YkkPyD6iJ8O5+BgStE/FDJSD
 IO7J586J2hRFbZBSKDK7LjhfDqQWDxvDyB5ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N16UwKCm73L0Dw3fehamBkjdWfgf5SKQ7wSO1tmr42Y=;
 b=W+idrD/VQaxAc1BiI48owxZu9W5jLnElGarJ6B4JrM5L9+PM7UuVASKJ+M6d7r8019
 NsLZ+JTaqTElYOiojXWYCGlwsV2CJcSdXKRRLTMNE5LR+zxkGyIaL7L2ebP/PfVPX5M/
 Fy+rgfSf1Tq2WANIcm/tp+i4G5vwMMB+7PQwAD+s0HurOAXfEmNTtX6MnZ/R5AIl4axo
 fvijhMmZO1C6llkKCDRcgL8VwcNPeu6ek4n6oWMRdthZjeN4d/0eQiBJwYhHaymRFUuf
 U4vz7d/4WpNRWQuAJtgOPieHxwhvOL/2p2AgE8Ok7/eahYhNUNaIV8PnBa/pgHnktf5N
 QQlA==
X-Gm-Message-State: AOAM532Y5P6bT0QwlDMJj8jWotgJqxM8jD9Bn0YSzDm+34i71CLi3T6f
 GEDgsVcqfxKb+zMrhSk3moI793d8vSJbfw==
X-Google-Smtp-Source: ABdhPJwJ75fsfov5Jq6J7zRF4VSmwPQu9iFO8c67Zgkwjs0ZTK0Ktg65daCjFTu/C0O5R9F85H3p4g==
X-Received: by 2002:aa7:8d46:0:b029:3cd:c2fd:fea5 with SMTP id
 s6-20020aa78d460000b02903cdc2fdfea5mr1272366pfe.31.1629943505340; 
 Wed, 25 Aug 2021 19:05:05 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:faed:1e29:6bf7:3354])
 by smtp.gmail.com with ESMTPSA id o10sm704987pjg.34.2021.08.25.19.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 19:05:05 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [RFC PATCH 06/12] drm/virtio: implement context init: track {ring_idx,
 emit_fence_info} in virtio_gpu_fence
Date: Wed, 25 Aug 2021 19:04:49 -0700
Message-Id: <20210826020455.1081-7-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210826020455.1081-1-gurchetansingh@chromium.org>
References: <20210826020455.1081-1-gurchetansingh@chromium.org>
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
2.33.0.259.gc128427fd7-goog

