Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C32452DF5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 10:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2F46F393;
	Tue, 16 Nov 2021 09:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6607E6F388
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 09:25:23 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r8so36142063wra.7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 01:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Jq1qMxxOkTB6BAUlxTb+j7R5DDIPx83f5PMKuZe7ViI=;
 b=BGLh2p24RDjkKJ4QAm7yq7EysY7X0ETgLoO2OO4LbKtK8xMmWJqimcQyJj65CWEOwi
 bJRWlHqbhGaxWKASih7/qAm/0i9pL79WVAyxfrX0GJySNPrfLvb/3zHmU4ehkBFignlO
 3qdHHMBbVY5JIRg2qYjSIBDL+AxOMdZja2+ji2ro+QtxHTt7Pk1eLdUGWScEVl201Vhz
 4/QFwt4CaGQSPo9pABvPCJ/adtwB5lap4cHjzyvwayraICafBFkyxQ124ICdftSxoKcj
 qpE+hLfKdq3yIe9co9CkNcngEcKwxPCSSu5Ww0VSFIdQJiykB/iXIMGEMRAV+d08rXye
 Omog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jq1qMxxOkTB6BAUlxTb+j7R5DDIPx83f5PMKuZe7ViI=;
 b=MU0gmAl1oC1xmHEU0D5bPr7QzqCepaCqeUrlJ5ACtl1i1mb57zjEmeFsbaZ2ZDtOEC
 zbCCcr+J/HpJyV2YF/0N5Kce/C0LqPZ5+aZDe9WUaS+Y8+op4kumyrvhfsZtSkJ5aH7+
 r0lIDJivRj1GB/51QhVqnd/4eNRSKxldhUpwGFe1NdV4BHvVVs/9vR+q09f2/8l8KorR
 kfzm4DvMYk1h7lcQl5Pu+7x40UqVU/OivMvCY9JKWH1nntnGzvPUUGHvnvhUdKzGA7Na
 4/GjKXVMTKaRdsH1SJQRRR6ivpBMF/j3HxDfvcZca7/RcEB+Dv7PVo5r45SKqSypg2Kj
 f+XA==
X-Gm-Message-State: AOAM5306n5PXs8i+uozQZhYsLrSpyKiELagUnU7HRBdHWCZNf5PgQokG
 dTCt5qtLN9vYexwr7eprL5SK+cMPL6M=
X-Google-Smtp-Source: ABdhPJx4352vELFO2LT4DVIxex56gaSY44dpZRIQm0hy5Xn24XjGdVj8JMBoijJP99FaLWBoXuhzHg==
X-Received: by 2002:a5d:522e:: with SMTP id i14mr7597166wra.43.1637054722001; 
 Tue, 16 Nov 2021 01:25:22 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id e18sm16986736wrs.48.2021.11.16.01.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 01:25:21 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, daniel@ffwll.ch,
 frattaroli.nicolas@gmail.com, y.oudjana@protonmail.com
Subject: [PATCH 2/2] drm/sched: fix dropping the last fence ref
Date: Tue, 16 Nov 2021 10:25:19 +0100
Message-Id: <20211116092519.99206-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116092519.99206-1-christian.koenig@amd.com>
References: <20211116092519.99206-1-christian.koenig@amd.com>
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

We need to grab another ref before trying to add the fence to the sched
job and not after.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 94fe51b3caa2..400d201c3c28 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -704,12 +704,14 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 	int ret;
 
 	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
-		ret = drm_sched_job_add_dependency(job, fence);
-		if (ret)
-			return ret;
-
 		/* Make sure to grab an additional ref on the added fence */
 		dma_fence_get(fence);
+
+		ret = drm_sched_job_add_dependency(job, fence);
+		if (ret) {
+			dma_fence_put(fence);
+			return ret;
+		}
 	}
 	return 0;
 }
-- 
2.25.1

