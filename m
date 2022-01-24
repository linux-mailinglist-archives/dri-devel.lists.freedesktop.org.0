Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E17234979AC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 08:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E64010E74B;
	Mon, 24 Jan 2022 07:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6944610E504
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 07:40:54 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id r22so4193838wra.8
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 23:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=32x746+aqRVJfpOzq5mPUyMArnAKR0oshZjP3RNr6L8=;
 b=mG9CH90QC3I0Kyzw5y97iSNP9PKE/WVtuooRunf7nd6IStTMUWHcpXD6CBgFSAzYcc
 4nj0LnYyS4DS6WNAo7pgQp0P5OrOeTPnFgfGBFyIUgGqW/n9Nml/4rP6hhxrvPVIOWzT
 9kCfjaCTyxQPQrTBwvJzzfSvZvbS4cLWCtyfIqFA8jYs/coBp6zCUlsv5gEuhNMgZM85
 yctcg1vjOhrNtMASAKrp/iVmKCwmE4RYU8CYLR6OmR9JLXG7+qd4pMVIyf82yn0OjWPg
 gcdEJntMlPDJLPBBIQ648UZr5CVOorNM/aGKcXOHOdRTKHhAHt+CBeGRGmFA3w/T88C7
 aJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=32x746+aqRVJfpOzq5mPUyMArnAKR0oshZjP3RNr6L8=;
 b=qUUu348JYb2zckxZidh7ClDVrtBInmTDOdxqo94ddc1yf2+XaESEUmfBrfz10M7uxy
 OTW1YICFi8MkcqbhpVccLi6Yp7zjLAYp6EVwhTyzfVGSXdemmYdwciMMcxqB5/hwiIkk
 tADMu1AUhUwOv5D8epEEh87KtVDXl4zffrgN3kBkDmdj8TlZKJwe09Rv7xH3njcE6C3N
 yrjz9fDe9xbqOzGN1mFoRRWs/iDuVxepek6DtTbG+jeOXZlFGr7PiMSBMZdIGXD+g4r8
 JerNVCcvA3gQUh45gX4o1CdJePib5oldP5Fn7Tg4kBT4/Ak2YKSBM5jtjty9KWNmHIps
 OyvA==
X-Gm-Message-State: AOAM532UxImpKbp5Bcn+SI//w4mattC/VohffnuLQGonh/uRvYPv1m7y
 riqviNkU7S+vGTrufHevwRc=
X-Google-Smtp-Source: ABdhPJwMln34ByUlknX94Kfn4e2Z9+KJmZUiiAPAAQbyVgCnwUNiQ9kwRWOqrhxswOPyncTsQLoDAw==
X-Received: by 2002:a5d:6947:: with SMTP id r7mr13378665wrw.510.1643010052928; 
 Sun, 23 Jan 2022 23:40:52 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id u15sm516370wrs.17.2022.01.23.23.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 23:40:52 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 7/9] drm/amdgpu: use dma_fence_chain_contained
Date: Mon, 24 Jan 2022 08:40:44 +0100
Message-Id: <20220124074046.4865-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124074046.4865-1-christian.koenig@amd.com>
References: <20220124074046.4865-1-christian.koenig@amd.com>
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

