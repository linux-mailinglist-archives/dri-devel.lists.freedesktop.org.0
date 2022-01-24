Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DEC498063
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 14:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4C510EC7F;
	Mon, 24 Jan 2022 13:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B2510EC02;
 Mon, 24 Jan 2022 13:03:42 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l25so13441364wrb.13;
 Mon, 24 Jan 2022 05:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=32x746+aqRVJfpOzq5mPUyMArnAKR0oshZjP3RNr6L8=;
 b=d7GdV3zrFFYVKk31SMgh4ZYGFlJFqcDxuu45uUfdQqmIpu6BoD/+/68mq9J+1fTVme
 PL30RKTL/FL+RA+y/j4gc4axOLMkl1kPB7Nnhd7jqCA2Es2Kuqb5MbOL51/dhebD9dBE
 2iqeY0IPGfcMahD3j8CdmBvITrq4EdnC83Ljj75bpiN6f9zam9x2HtK8fKahWPyrpw5j
 GCWRZcCTJqVHbqy/QyKUvAlY8cNPQVjx3AuB/B2mnQsbjLqhPQQosBCQduhjQQ99sRmx
 7ZI+Npxk11LDL39q775wx1nKvklgsow9cilzlWln0mMBJBC5L43bn6rwFmqibzN981kX
 3eJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=32x746+aqRVJfpOzq5mPUyMArnAKR0oshZjP3RNr6L8=;
 b=tdadE2wHb/11kLG1Gi3a26jv9XQMzkkiUXs1RmYSeQK52JXtwM6RPegl3Rk+sHRep9
 oi2T54Jp/oFBwH5nhJ976smn8evOV1/zf1im33sjvEdwe8CvoTOpl0sYHCxuiG4leeyW
 SWqP/dhoEQR4+bAP2Hl5MTLsOFlodojtQpKuGv3qjLtftYN2X+TzwdSkYn/HteqjJ0xN
 IFP4CJlesNWfnojjWcirbzvg18qHkLQME/iZPv5VlCXZz62TeDWRewoS7FUDCHrEK8fE
 fIrtQD7bQ3ZjWA9FWzDQThSjySxEHuZqaLE8wpFkQWxV6Ux2VwTV6hpA5cb900gt5si9
 yA/w==
X-Gm-Message-State: AOAM532v9aBxHEUpSMWGCg3NLDaMKMzj5sgsQ/BroUwI1QYBBcNti+3D
 Vh9bItQltjsOyfFAlvf2N/M=
X-Google-Smtp-Source: ABdhPJxvdjWU3RM8A6b76whKwGja3Vlgl4pegYkdp0qNNsZaMEJtD/HoOG09RzcoyFzY95O1xToLfA==
X-Received: by 2002:adf:e112:: with SMTP id t18mr8103522wrz.293.1643029420441; 
 Mon, 24 Jan 2022 05:03:40 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id g4sm16543554wrd.12.2022.01.24.05.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 05:03:40 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 09/11] drm/amdgpu: use dma_fence_chain_contained
Date: Mon, 24 Jan 2022 14:03:26 +0100
Message-Id: <20220124130328.2376-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124130328.2376-1-christian.koenig@amd.com>
References: <20220124130328.2376-1-christian.koenig@amd.com>
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

