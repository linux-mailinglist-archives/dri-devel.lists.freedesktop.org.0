Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E618B461483
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC44D6FA5C;
	Mon, 29 Nov 2021 12:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156F36FA54
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 12:07:08 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id j3so36292505wrp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 04:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4CDt1ISjRTMYLH7FxvvLqp3He8TQZQtgj+2GfXtaN90=;
 b=mMBkEjAb2V9hwLba+xllKCVItFPWEMhA4xIys9tcDkl56iSm77cJAnwB4dnctg5CcS
 bDHTl/TeN4e44OGiNeuL3fQP3bKAc+15Fvm6/VXVULuMKqi6Le+8HmwVK8on4QVUb9nR
 IlIq7C+Pe61xHO1/fS5uRzcy+6Z55GNc6JxeutpGkYQ8SLsvSC8+bcyIKYBmnTuIUm3O
 Y/DA8Py9Zse3uX7SZiwzTnEZAqs5bhidFOBlUkA1B93/tFC18qiUfXrewljTv3K5Lk0U
 htU4haudwsxS3JZsBBm3gZEpLvbdQlQdh4xwObaczzccol9hd2hMfZz/UPydY1p1vAlf
 vsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4CDt1ISjRTMYLH7FxvvLqp3He8TQZQtgj+2GfXtaN90=;
 b=SAB6RcMjafyujhT+kqDeUwESfdG5tymppOF93ErUUvGrMP+YDwdVEqP59oIxZPSUHW
 /Y9hT+xC+CbPdiwrWei+0QogXJ1+b+/i0/xN4p9/Q2G0ehTAQrTUEf+RAbNaIgVBRIXO
 eu5SRJ93TSDLjrE3Sw0px2/W41GKsN4gQ65YUpRmkclXLxhu+/5/12mRLp/FRvVCX/Cw
 v326FzNHlW6RwCqLCOiRbA2EmLRZQuRIowz9pPZzNwbW3w2a0PTHqdtIn2eqO/M8FtZD
 +/0R2uSG2xiDoKgLTWDpGzc2eqETYTMgrACXyOp8mjegOgtM7vwXDFqcyT0nfvTqvMrW
 QAuQ==
X-Gm-Message-State: AOAM531KdM1zblChCc1l7+5hBR73i2UGo9kWuowvEuMKHGodtcWD76hF
 YwXqmHeqnuw0p6QI0MmWTxI=
X-Google-Smtp-Source: ABdhPJw5XzuStawRpnnCTuKzSotUgvYOfiiTDZQIfIOnFaHslSDTW7ESFD1Euk76wFZy2dibJ46q7w==
X-Received: by 2002:adf:d22a:: with SMTP id k10mr34327677wrh.80.1638187626698; 
 Mon, 29 Nov 2021 04:07:06 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:07:06 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch
Subject: [PATCH 04/28] drm/qxl: use iterator instead of dma_resv_shared_list
Date: Mon, 29 Nov 2021 13:06:35 +0100
Message-Id: <20211129120659.1815-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm not sure why it is useful to know the number of fences
in the reservation object, but we try to avoid exposing the
dma_resv_shared_list() function.

So use the iterator instead. If more information is desired
we could use dma_resv_describe() as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/qxl/qxl_debugfs.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
index 1f9a59601bb1..6a36b0fd845c 100644
--- a/drivers/gpu/drm/qxl/qxl_debugfs.c
+++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
@@ -57,13 +57,16 @@ qxl_debugfs_buffers_info(struct seq_file *m, void *data)
 	struct qxl_bo *bo;
 
 	list_for_each_entry(bo, &qdev->gem.objects, list) {
-		struct dma_resv_list *fobj;
-		int rel;
-
-		rcu_read_lock();
-		fobj = dma_resv_shared_list(bo->tbo.base.resv);
-		rel = fobj ? fobj->shared_count : 0;
-		rcu_read_unlock();
+		struct dma_resv_iter cursor;
+		struct dma_fence *fence;
+		int rel = 0;
+
+		dma_resv_iter_begin(&cursor, bo->tbo.base.resv, true);
+		dma_resv_for_each_fence_unlocked(&cursor, fence) {
+			if (dma_resv_iter_is_restarted(&cursor))
+				rel = 0;
+			++rel;
+		}
 
 		seq_printf(m, "size %ld, pc %d, num releases %d\n",
 			   (unsigned long)bo->tbo.base.size,
-- 
2.25.1

