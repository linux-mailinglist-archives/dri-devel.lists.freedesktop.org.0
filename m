Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CDA40686A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 10:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70B36E991;
	Fri, 10 Sep 2021 08:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A256E6E990
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 08:27:07 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 u19-20020a7bc053000000b002f8d045b2caso780037wmc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 01:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hvNXqtq5mdZJpJK7jpCUZ+hsh9G2TDoGYYpRx9Mul74=;
 b=A0kUPdgAC5+TWncOXFWh9Qfoaz4FqK6InBydLkzZ2x7lLAs7i9QFOntRXj7yX9qarp
 cUBcMzhKvr9jHJpHtBm+wJjchNGcL6IoCyzu9L483z8pzFqYV3B0KTH+6m9hAHIGKKtu
 0sgckvdf0Yj9lszW2BU2mwHEI+scDEg6bsDzdWehB+mB3EzrE6VcbsHrBHxYq4VFwR7v
 mYGnlldEKj2n5a/+SMQYOW/vloLUldESANOPycvU0UV/EFyvTlRYWZQqkEfmEORntF/m
 yXgusF9ccePSbKyYDC8ZP02wrj3GXK5P4bKvgooD7j9adhlK2j3q9aRhJUsWMqnKJ3Ph
 RHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hvNXqtq5mdZJpJK7jpCUZ+hsh9G2TDoGYYpRx9Mul74=;
 b=f9zIonz2UreA0AoRgSDrbea7eKe0Tass/5K2anXk7CxVX1nhH4P2f6F6lMG8fCFfEM
 5xibejDg6yETqRMdzREVPWFrQYQZe8yvxwZU3lZxKEqmgnsQR+7hE3zLaAgTzajd8U2P
 bBAx/4XKcd3mJtIeNRnaKLb9JwrA21/njBsO86JVwiOUjP8M1j4bWDEmbK4OCNzUVgyM
 xLcFsC3EsgEyts1AkoMGc+JGXMDM84X+OY2lQwmnTBXR+8iAkROIzWb6nJ0r4exP5QKy
 x0q9Bb4BTtzLGo2zfgKqxZ8xjwSUbPN4cVfZsH+61qdfHkZbSggZY4/AgkOlEakaKh7P
 F+Ng==
X-Gm-Message-State: AOAM530Rr8gFNODf52LSUCH2Ib7uidJIEJMsw380/kGBS6UdHiTVfcZ0
 rixl1EyS2Z9QzCG+ulWn368=
X-Google-Smtp-Source: ABdhPJzCx/DlccM/dfWL6V5U0asbK2EJmgwOciOgRAKzlNGULrLLN3jCgvQVAzCAfYglVTL5xpoYmw==
X-Received: by 2002:a1c:cc16:: with SMTP id h22mr7144408wmb.117.1631262426227; 
 Fri, 10 Sep 2021 01:27:06 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l10sm4429756wrg.50.2021.09.10.01.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 01:27:05 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch
Subject: [PATCH 10/14] drm/amdgpu: use the new iterator in amdgpu_sync_resv
Date: Fri, 10 Sep 2021 10:26:51 +0200
Message-Id: <20210910082655.82168-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910082655.82168-1-christian.koenig@amd.com>
References: <20210910082655.82168-1-christian.koenig@amd.com>
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

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 44 ++++++++----------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 862eb3c1c4c5..031ba20debb9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -252,41 +252,25 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 		     struct dma_resv *resv, enum amdgpu_sync_mode mode,
 		     void *owner)
 {
-	struct dma_resv_list *flist;
+	struct dma_resv_cursor cursor;
 	struct dma_fence *f;
-	unsigned i;
-	int r = 0;
+	int r;
 
 	if (resv == NULL)
 		return -EINVAL;
 
-	/* always sync to the exclusive fence */
-	f = dma_resv_excl_fence(resv);
-	dma_fence_chain_for_each(f, f) {
-		struct dma_fence_chain *chain = to_dma_fence_chain(f);
-
-		if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
-					   chain->fence : f)) {
-			r = amdgpu_sync_fence(sync, f);
-			dma_fence_put(f);
-			if (r)
-				return r;
-			break;
-		}
-	}
-
-	flist = dma_resv_shared_list(resv);
-	if (!flist)
-		return 0;
-
-	for (i = 0; i < flist->shared_count; ++i) {
-		f = rcu_dereference_protected(flist->shared[i],
-					      dma_resv_held(resv));
-
-		if (amdgpu_sync_test_fence(adev, mode, owner, f)) {
-			r = amdgpu_sync_fence(sync, f);
-			if (r)
-				return r;
+	dma_resv_for_each_fence(resv, &cursor, true, f) {
+		dma_fence_chain_for_each(f, f) {
+			struct dma_fence_chain *chain = to_dma_fence_chain(f);
+
+			if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
+						   chain->fence : f)) {
+				r = amdgpu_sync_fence(sync, f);
+				dma_fence_put(f);
+				if (r)
+					return r;
+				break;
+			}
 		}
 	}
 	return 0;
-- 
2.25.1

