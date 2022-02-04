Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA894A976F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 11:04:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D9910F25E;
	Fri,  4 Feb 2022 10:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6752510F253;
 Fri,  4 Feb 2022 10:04:43 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id p7so11956379edc.12;
 Fri, 04 Feb 2022 02:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=32x746+aqRVJfpOzq5mPUyMArnAKR0oshZjP3RNr6L8=;
 b=Jz+HUiSG7XC9MjED/gcNv0zfCuUYFu9u04aTEsTpnY4EbHbkWKo9dESj6TOix/VqTZ
 a2WlPyfMfnWgCJDQKyGlhNmo1XcGuTynUbjhCrCLMvnyhcMFQA7EQgea2/zM5WfUtetv
 7LU75cwoXcDVBi0SEoMk18kcWX8gl0PfdBULxU7oeIYtgdu7YuYsMYiuaH6VOu+FnIAE
 tj5OSsML18o7A5+CgTltGSp/x1w7MO1OlrZpb+nc0nMwCZ7Y2gzG62hWXcZFAQsdDUHX
 QX5Cm+c6bL67tiep+HF5Fw14FBxfiTnkz52F+he6uyg/vKIVS6vepSKw4KE++z3lC9hw
 PDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=32x746+aqRVJfpOzq5mPUyMArnAKR0oshZjP3RNr6L8=;
 b=AdR93I3OqIaFm+zfWe2nP+iBufS9cmbROa+qpy3qjGoA1QW5f2ZW13UuleIwa1TCcf
 8oPPuNQIvak8P/aoa5A3S3KezyLyqzc7o/ejBDKuYseGYCQyV4ft27WjkO5g291YH8YQ
 ow+goF8sIqz1w1LuHlWp+5WFEi+k5RbwxYQre5iiumptc4cPSM/wBkV222mMedKVC0we
 vcHbhwMpmx1jTyJhrG8ZFsZYCSlKhV1rKPTPihuNSdJ05uT4y7u3iD16pkWtAqVZ5KIy
 qY0Cf43MR/afB4LQk2611ZFwzDNADJN+Qgtt3rSeOH5WHc5VSQRZfT1hqRkQozGdSSHH
 V73g==
X-Gm-Message-State: AOAM532H9ehxnptmsiEO9jlNyQHu8OILrkrwoDS1O8ERswdIGCccP/XB
 7+JZrN51WLOOb94EsQaT5Tc=
X-Google-Smtp-Source: ABdhPJyZWf/AMWiDhzdDt7PQoSdF8kB98XCNmcSmAiADBKdZzV3DJeepZ+hSzwe2wALWcX4P1fjOEw==
X-Received: by 2002:aa7:d944:: with SMTP id l4mr2239665eds.117.1643969082010; 
 Fri, 04 Feb 2022 02:04:42 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id z10sm633943edl.54.2022.02.04.02.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 02:04:41 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, thomas.hellstrom@linux.intel.com,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/6] drm/amdgpu: use dma_fence_chain_contained
Date: Fri,  4 Feb 2022 11:04:29 +0100
Message-Id: <20220204100429.2049-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204100429.2049-1-christian.koenig@amd.com>
References: <20220204100429.2049-1-christian.koenig@amd.com>
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

Instead of manually extracting the fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index f7d8487799b2..40e06745fae9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -261,10 +261,9 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 
 	dma_resv_for_each_fence(&cursor, resv, true, f) {
 		dma_fence_chain_for_each(f, f) {
-			struct dma_fence_chain *chain = to_dma_fence_chain(f);
+			struct dma_fence *tmp = dma_fence_chain_contained(f);
 
-			if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
-						   chain->fence : f)) {
+			if (amdgpu_sync_test_fence(adev, mode, owner, tmp)) {
 				r = amdgpu_sync_fence(sync, f);
 				dma_fence_put(f);
 				if (r)
-- 
2.25.1

