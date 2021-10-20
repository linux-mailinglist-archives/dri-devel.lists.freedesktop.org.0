Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C667B43514D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 19:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3244B6E32F;
	Wed, 20 Oct 2021 17:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0726E332
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 17:32:14 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 186-20020a1c01c3000000b0030d8315b593so3319537wmb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 10:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YrgDnP3wdFz9gcP9oR8IYN86QnIwG+X3Dhw9uAX4bJo=;
 b=Hgwsqum26OUzhU5PRoJNPiEtRf5LTN+Fv4ciDqsXjYMxvtNby8qaUHUfS7yR6dtk+G
 Dl9x92uULpXTF1BiVPGo2Scyx9/mSMj+8IKdNkJZZmkY3Ip9FCF+M9Quuh4py07EWya3
 +Up4oOjSTQdvqSRG8aNSh4cq1Kf/bp6OMTRqjMSsElyXExX0MuDdEWFWfn2MitUJ8SM/
 nPzRzdpzy1c/6PRSDcvM55QhQXi8dqQtw6p4CPdUg/mfmTJ9oRF3OzHUPsiY0b0nGkrD
 tZVZkOu5ABWvDJfijvRd763XULwnC5vG+eyCXcuEHPUVq1cKOLWrCgsCRnybctkc2zPG
 N1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YrgDnP3wdFz9gcP9oR8IYN86QnIwG+X3Dhw9uAX4bJo=;
 b=mAkPoOizdeXoXEAPQ0OT3/SqDdLNeh97uh08J2OFj2sPnAkN2GuMb2llFyH1+LW19G
 hHHsR3Wvvg3nf7Bgsga+BHlyJjgJyHV7xWqggimSAX2tZrvBonnN8Yjd3vs+1ID403Rm
 1HkfgDGSc6T41M6hn/8psbzJPAtvjCx8boAHo7qf+pQt1sALgZZ/FA7a3vShjq+CCRwc
 SUzr3y+jF+Ms/hlrlyEvIG4zcM/UfPL5v3KSw+L4oHnarqUezgG+g/KBzxghmtyKlzuD
 WG6OqMzsXgTWNKgvQTKmmd68yDnL9SDAfLQ0B7zt1Go8RxiQXzOK/M+L6hR7n/iVMgqd
 f4mg==
X-Gm-Message-State: AOAM532t6WfRNdKHQq4Hto1jGJOZXdbEdC3luy995RBm+kwuN2gqdefq
 uaNXsFmnIwzbdGtu1o72t47LxZRNU2c=
X-Google-Smtp-Source: ABdhPJxsJsM7PMa8+Jqqhm7WHygRLvhV/DWxgPuX3xA0V2srzqfGBD/xJg5iU9KRsNJexdiNoiGB5g==
X-Received: by 2002:a1c:4455:: with SMTP id r82mr689976wma.100.1634751132634; 
 Wed, 20 Oct 2021 10:32:12 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 d24sm2446662wmb.35.2021.10.20.10.32.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 10:32:12 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix memleak in ttm_transfered_destroy
Date: Wed, 20 Oct 2021 19:32:11 +0200
Message-Id: <20211020173211.2247-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We need to cleanup the fences for ghost objects as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
CC: <stable@vger.kernel.org>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 82af095f6b81..f37a8c53b35f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -190,6 +190,7 @@ static void ttm_transfered_destroy(struct ttm_buffer_object *bo)
 	struct ttm_transfer_obj *fbo;
 
 	fbo = container_of(bo, struct ttm_transfer_obj, base);
+	dma_resv_fini(&fbo->base.base._resv);
 	ttm_bo_put(fbo->bo);
 	kfree(fbo);
 }
-- 
2.25.1

