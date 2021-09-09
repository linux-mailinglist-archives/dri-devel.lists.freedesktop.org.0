Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C574042C2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 03:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987DC6E417;
	Thu,  9 Sep 2021 01:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A076E415
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 01:37:26 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso255578pjh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 18:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P6h/AzjJX8XOg/F/r/wG18RWpAzgwfTHDR+lZB1mjt0=;
 b=DE/wHSL6/AVCA5fpYOhiKO1xu5/0n0I3P8R/W6Ur9yiWh6QMYRTFF9D+8jWIKcyau0
 dhNTDMuNsRcGxYChG8A0X836tL6+j1lsWbJ/c04V3iNLQ+wgRXizSwnCw7QjSWdXKQUR
 7FzL80JwH5TstwYJV01Gl0I7vD2N+GWULxr00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P6h/AzjJX8XOg/F/r/wG18RWpAzgwfTHDR+lZB1mjt0=;
 b=DsAx7NZKNorkfn0tQadcveZyARrim6jdnz8xq+1Od9f4n8AdXVy1oXIPS8+Z9BGhCj
 G/+mnm4Y326mCPP83B3ySviHot3rVixxoUUzF2RocUHsCT4j0vjhoklU6Cm04itkOdr3
 se3VPZ/2PISNSIeZDQtVDOmU7G/aT7SrJscCpajimxhKiBdXBVoNqZ7YiI02JUvs5JU9
 dJVuCHE+OiJR8CrNswcAG1GSuNnxSbQyT+E3Zm4mXoWRLqLV0aQ0knHPJ4/zd1/u0N3x
 BKLM8iUdKA3b22p/8zbMmcx+BrH8qg2PMkQP22R9n6owuovBHa4vuZCGaiM/PMCCmr3/
 uWaw==
X-Gm-Message-State: AOAM531fHXvTkpB2cRQYPpwOzNHyFixd2+Jhi8b80u6CsG3BuUig5W4t
 /PpEFwS624ERjhfqQwu7A6sJ6gjmcnltwfrK
X-Google-Smtp-Source: ABdhPJwKUx3RgHVS8F2A+LbGHMiRlMIwbS1D5DKyEIkP2c7vHU0XI2UvqUn2jir2pdbDQ8Pd1B86XA==
X-Received: by 2002:a17:902:e302:b0:138:f4e3:d010 with SMTP id
 q2-20020a170902e30200b00138f4e3d010mr534053plc.33.1631151445717; 
 Wed, 08 Sep 2021 18:37:25 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:b3e5:2f81:d686:bc91])
 by smtp.gmail.com with ESMTPSA id h9sm142488pjg.9.2021.09.08.18.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 18:37:25 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v1 06/12] drm/virtio: implement context init: track {ring_idx,
 emit_fence_info} in virtio_gpu_fence
Date: Wed,  8 Sep 2021 18:37:11 -0700
Message-Id: <20210909013717.861-7-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210909013717.861-1-gurchetansingh@chromium.org>
References: <20210909013717.861-1-gurchetansingh@chromium.org>
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
2.33.0.153.gba50c8fa24-goog

