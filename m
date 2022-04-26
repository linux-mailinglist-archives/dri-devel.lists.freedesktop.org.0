Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B5250FD83
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952A310EABF;
	Tue, 26 Apr 2022 12:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C1110EABF
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:46:40 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id w4so25260397wrg.12
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 05:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QWJNebhjBBDPg0cwekMSjS6qePRn97Mj0N6BUIsgDy0=;
 b=fW/mKAflpo7RWGocl/TrgqYK1m+lv3D25HAHRiow7NSCHvmDEw+UGqV2sp0vpmTJ8b
 ZCsaSg/i2tVNLQzDOMcrbC1IlrgRYG1L3Qj9ucb4cWeM0NvJBSK2ywHMzha5g4HOCDv/
 fcgL1aVCu2bEs7rX8/GmOMOWRTK5GoOV8h0+2TnKzK9eRzwSudRRbMxekQ+33+CvHBIY
 FXZmw7yNFBqi2fEEWLSQZmzwaWmloOIm3jJCLspSRjb98vsXApoSm4YX5usHNb5CXP9V
 3ssUP1M+LXFMrcuIqq9ksmQrqAwg1ndl9JAiFncDiNF8kqfsuqQx8bcmrrzcM5LNSLII
 qzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QWJNebhjBBDPg0cwekMSjS6qePRn97Mj0N6BUIsgDy0=;
 b=lH83rR+QHFML8iWM1Mz/KitLlHZCN3YEG+lHcpm3cRYkGEjjwc+AHBL9G4x5ipIn/S
 pSoHjJ/adbm6GdiKzNa+opLj258bzjPCVwGcnAhLviyHU6JfFn5pb/RF4WlQOsr1H7T3
 xm3yO1ixfXrEmutkTfYnIDMTp9cba7j7CTER7eXSA4ly99o9RZMPi0IWqz/ty/9YmUUg
 HW6EANxB8NGhQJfivbXzdnTTe1INHvKNP+2Q3KVsQOB9M5GmCpOUzlS5lAVArHLSSGm8
 m3wLrEHYapbenMLJKrxI+5LbbtwULLpaWSZGFQCo1ixnsGBjMKd2HqqTVgkXRnfI8T3O
 b/pA==
X-Gm-Message-State: AOAM533mFXzI2VshmguKUMIIAp7bTiwVUiOTOkooJP0/UpZ8/vBt39ju
 iFR4VKVIne6+P8Wadndykfk=
X-Google-Smtp-Source: ABdhPJy3I6knemy6thzL7TvwKzDO8Xk8r+AeuQt3EcSrgvCK5597hs0se5nJF+0rP6gmxMaGGx9efQ==
X-Received: by 2002:adf:e112:0:b0:206:d12:9c3a with SMTP id
 t18-20020adfe112000000b002060d129c3amr17784718wrz.391.1650977199474; 
 Tue, 26 Apr 2022 05:46:39 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 s10-20020adf978a000000b0020ae0154f1esm3641025wrb.5.2022.04.26.05.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 05:46:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	gustavo@padovan.org,
	daniel.vetter@ffwll.ch
Subject: [PATCH 1/3] dma-buf/sync_file: cleanup fence merging a bit
Date: Tue, 26 Apr 2022 14:46:35 +0200
Message-Id: <20220426124637.329764-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

krealloc_array() ignores attempts to reduce the array size, so the attempt
to save memory is completely pointless here.

Also move testing for the no fence case into sync_file_set_fence(), this
way we don't even touch the fence array when we don't have any fences.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/sync_file.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index 514d213261df..0fe564539166 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -157,9 +157,15 @@ static int sync_file_set_fence(struct sync_file *sync_file,
 	 * we already own a new reference to the fence. For num_fence > 1
 	 * we own the reference of the dma_fence_array creation.
 	 */
-	if (num_fences == 1) {
+
+	if (num_fences == 0) {
+		sync_file->fence = dma_fence_get_stub();
+		kfree(fences);
+
+	} else if (num_fences == 1) {
 		sync_file->fence = fences[0];
 		kfree(fences);
+
 	} else {
 		array = dma_fence_array_create(num_fences, fences,
 					       dma_fence_context_alloc(1),
@@ -261,19 +267,6 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
 		}
 	}
 
-	if (index == 0)
-		fences[index++] = dma_fence_get_stub();
-
-	if (num_fences > index) {
-		struct dma_fence **tmp;
-
-		/* Keep going even when reducing the size failed */
-		tmp = krealloc_array(fences, index, sizeof(*fences),
-				     GFP_KERNEL);
-		if (tmp)
-			fences = tmp;
-	}
-
 	if (sync_file_set_fence(sync_file, fences, index) < 0)
 		goto err_put_fences;
 
-- 
2.25.1

