Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C731E07AE
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED4289C1A;
	Mon, 25 May 2020 07:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A7E89DD5
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 17:52:47 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id z13so8732352ljn.7
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 10:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EidOYNDtTRNJ+8EWo2ihqYeWgFnIbrPaGzDz8MoTfPU=;
 b=hf0fkOh44Hz1GSlRaIJD2Q5yPM22PwrhY7QYVNciO9CJdlQngK5rMMI+qpN8ps0q/h
 TtQ2wlSbJQ1go+3USEETIMmOAs2xiaGTeFvrwiNgNEqEhxX/kP+GUGMZefD8YfKZgZ8d
 gqUka7iHYAoqQRR1atnI7lYpv4/Ot9TlKdF3xEl9h/58Th7yYiCdk++hrD5YN+P3FfF1
 w6GDQfeZMM8Vb7nMncdQt4TLHmVdwjkDeY5z9giU9yilvxMOWqiPFQjuYLWlZ1vHE1Cy
 bM/eD+0bzDaQ8n9ABFc4W3v8kRAqN0IMfDaSnC/fUQc834DKQU8XrCktfNJV64MavWB0
 DAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EidOYNDtTRNJ+8EWo2ihqYeWgFnIbrPaGzDz8MoTfPU=;
 b=XA0oZSYqBTSl/V1uZ/FyzCx5SpjFEnlhrTAJkOhS6GrRpT5PVZt+aKru6bm6qHLJXp
 PkEkusD44l+nmeXLAX7QUT+mneajvddTmN2GBUcCurXiUiX+U80aL4E1UzVF+g0paKfN
 NO8CGuWc8dV1+er1q99fo2G+Lz6lmioIYZYyAzsUh0FrF1JTfxS9bkfllzpO62VleXfh
 nhnuz4cV3abEAOFd2eWm6BtRW0h/XbILkkLkyJxxlIwQFTlTa5t/VxC3Gpbn42AdMmDr
 0Nsa4DofLQMwKzjFmBjGPIf7RwKP2C8auWB8u1fBL6pQojrqAMN93bnPMz/LevSHr/lk
 4+Fg==
X-Gm-Message-State: AOAM533slOUg2lHRh5Pea8Fif4IAUYblRN11iaSnYiXHkQqHJ8F0e4Vg
 W4zewqBcjEZ1htXCe6sNkH0=
X-Google-Smtp-Source: ABdhPJyGXNhwXDs66OdEMOiuakbEIOmA0CWoRIKacRnM5ybE3xnoSfUTfsadLaPdVerhtmq1Q4jLFg==
X-Received: by 2002:a2e:978d:: with SMTP id y13mr12899232lji.80.1590342766241; 
 Sun, 24 May 2020 10:52:46 -0700 (PDT)
Received: from localhost.localdomain (ppp91-76-17-204.pppoe.mtu-net.ru.
 [91.76.17.204])
 by smtp.gmail.com with ESMTPSA id 130sm4045350lfl.37.2020.05.24.10.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:52:45 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 2/4] gpu: host1x: Put gather's BO on pinning error
Date: Sun, 24 May 2020 20:50:58 +0300
Message-Id: <20200524175100.9334-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200524175100.9334-1-digetx@gmail.com>
References: <20200524175100.9334-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 May 2020 07:21:04 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch fixes gather's BO refcounting on a pinning error. Gather's BO
won't be leaked now if something goes wrong.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/job.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index a954bd41aa79..89b6c14b7392 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -105,6 +105,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 {
 	struct host1x_client *client = job->client;
 	struct device *dev = client->dev;
+	struct host1x_job_gather *g;
 	struct iommu_domain *domain;
 	unsigned int i;
 	int err;
@@ -194,7 +195,6 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 		return 0;
 
 	for (i = 0; i < job->num_gathers; i++) {
-		struct host1x_job_gather *g = &job->gathers[i];
 		size_t gather_size = 0;
 		struct scatterlist *sg;
 		struct sg_table *sgt;
@@ -204,6 +204,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 		dma_addr_t *phys;
 		unsigned int j;
 
+		g = &job->gathers[i];
 		g->bo = host1x_bo_get(g->bo);
 		if (!g->bo) {
 			err = -EINVAL;
@@ -223,7 +224,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 		sgt = host1x_bo_pin(host->dev, g->bo, phys);
 		if (IS_ERR(sgt)) {
 			err = PTR_ERR(sgt);
-			goto unpin;
+			goto put;
 		}
 
 		if (host->domain) {
@@ -236,7 +237,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 					   host->iova_end >> shift, true);
 			if (!alloc) {
 				err = -ENOMEM;
-				goto unpin;
+				goto put;
 			}
 
 			err = iommu_map_sg(host->domain,
@@ -245,7 +246,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			if (err == 0) {
 				__free_iova(&host->iova, alloc);
 				err = -EINVAL;
-				goto unpin;
+				goto put;
 			}
 
 			job->unpins[job->num_unpins].size = gather_size;
@@ -255,7 +256,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 					 DMA_TO_DEVICE);
 			if (!err) {
 				err = -ENOMEM;
-				goto unpin;
+				goto put;
 			}
 
 			job->unpins[job->num_unpins].dir = DMA_TO_DEVICE;
@@ -273,6 +274,8 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 
 	return 0;
 
+put:
+	host1x_bo_put(g->bo);
 unpin:
 	host1x_job_unpin(job);
 	return err;
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
