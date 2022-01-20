Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23561494EF6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 14:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CB210E7FF;
	Thu, 20 Jan 2022 13:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6840C10E800
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 13:27:56 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id n8so12079195wmk.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 05:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=32x746+aqRVJfpOzq5mPUyMArnAKR0oshZjP3RNr6L8=;
 b=JB6DFT7fG55XAcBP0OpH10Gqzt7WQT8AwDJYXLHgPSdp5fcULgThwB66aca6ixgPFl
 8OCZPZh8swjc4+SOdWbQgKRJreT9q7vbCMQj1OPIOZi557SH0U4fwxzs01a724XMZ0vF
 nA5s20pHhMVs4ukENqvjHmD8Ju9TZa+vHN6PD2xYnyo1n0Btgv63Om6SjJ1ZuqwrNaMZ
 jVSX13Tc5ZBUHH1oVsNTvBLkcPIPzTX40mIWyS2CXcg/daA2a8gj74tPuQrOwtvLUiXa
 xC5yl3QyI1h6tPy+UxKTJe8pEHl9c6fHxgfAJx7ejbCW8MMAa5anwSZFgiBru4L8unHR
 Ss6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=32x746+aqRVJfpOzq5mPUyMArnAKR0oshZjP3RNr6L8=;
 b=YGdN2tB8vqkmr28JTV7YL94MUM8onmfRjXS7cJBA43R7ehJz++U7+Itw5QDDJoSSRC
 iDzbL7FdSTGFG516CrGamlvVRbNka46XyFJMjYZ7uwaok2YyTky5zDGchcCIJh9vj0lf
 qKpiDADOejyVKTsY8NgOGpA60CVa8RDgyzNiHsKo4TjFJFM92K9E5NB6IMW0YyCzKzoi
 kTbsRUXqXaBi8oHJaMGKspJWIpDceGlDWgWm/WsXe880QpSlrXjQSaEvjs0qC4cMiNOn
 1s0/LUIRwSGM0wpS3tEal2OsWfEMHXeloSZit902vpcXcJKdWNgUujI8hJOXbAJRhAgf
 hpCQ==
X-Gm-Message-State: AOAM532uohS0ipYl6XcnDJPbTXmqrCe2XyTjqHCBHZWDhmMB+WpwxcwX
 3xMjG0wAC1A2JPDOXdtCXN4=
X-Google-Smtp-Source: ABdhPJywJHgOVOLmBR5mzG5JMri0mseBaYfO5Sp+REkszykHT5ZEgC/018YsFmyAizxsvuQDoewpVA==
X-Received: by 2002:adf:904d:: with SMTP id h71mr33249269wrh.569.1642685275081; 
 Thu, 20 Jan 2022 05:27:55 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id a9sm2658454wmm.32.2022.01.20.05.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 05:27:54 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, gustavo@padovan.org, daniel.vetter@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 7/9] drm/amdgpu: use dma_fence_chain_contained
Date: Thu, 20 Jan 2022 14:27:45 +0100
Message-Id: <20220120132747.2348-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120132747.2348-1-christian.koenig@amd.com>
References: <20220120132747.2348-1-christian.koenig@amd.com>
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

