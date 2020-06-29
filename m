Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8682F20CCCF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 08:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D61B6E0EE;
	Mon, 29 Jun 2020 06:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB146E3F9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 03:18:57 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h19so16327974ljg.13
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 20:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EidOYNDtTRNJ+8EWo2ihqYeWgFnIbrPaGzDz8MoTfPU=;
 b=Y+YodDPux7QGmbop0JYWpFp0BOokiRnETh7u8XOIj59/zwhMKOyuD6ffbK1rlp+IYy
 tcBqK6n2xdr07S8OxbBHAgadJQY2cO8WwTzHmQG3zvevViS5Qn988RBdMlnTgJKP9uwg
 iWX7m4LqSWDgLnkEqb5t0wpsiX+JNpcWAdCsiONkvsI62m+1Phi7Jx86Z/2dUIC61oJE
 y7U5rySudAWbeUbpqaxfrc12bKJULjMcEM78OVKMJ/xLfjj1RC9JIJGE0mtfNa1eVjO3
 4xVmCrR0F+adH7AaQ6Ai5wImZ+ezRAEdrKFdnDLEPoNU3KIjsRXa4VpDyHIFwomFjE9u
 /Olw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EidOYNDtTRNJ+8EWo2ihqYeWgFnIbrPaGzDz8MoTfPU=;
 b=U5ViQLs8vTtTMQQCVQNZOMOgi70KgL8ySrkRKzfoFQ51cXsf73Jo9F8R0k1tqVftZE
 YUdRkQg2oBsJMnpTPuogGlvYFPOWQbbkGxRLntwcTDEsw4cVt004dvTfHxRDVsYWKVe9
 WI1E4HdbwFlMJHYYMaKHZKKgmvMnTz+/pBWL/9lKEMx2y3/lAmxpYmmR3dl5qPtZSsXk
 hkYK0T/zUP2VdasKQn34TZBEF4DyY5d5cp5PNNYeJi5e1TtaNRPhIqQdqDybz+/ZPIVo
 5miakb+5bev0YxImJP4X9wpxN2u2/Ma2QHKIkDlACrcisTZM3CS0gnb0wfayYb1W9bYi
 +oYw==
X-Gm-Message-State: AOAM530j1H2AdeKxG1vOsON+InInwGjJo8sP8wI+aIU6D1xA3drcF+op
 YuL/B929beOSBBwOzwhgEN8=
X-Google-Smtp-Source: ABdhPJxLj+BbmYAqjK/EWXvwIUBZLwM/VqsFenHGt/B8hEyulXm5SHltxo39BOFkianXSP/Vo3goeQ==
X-Received: by 2002:a2e:7f10:: with SMTP id a16mr7257364ljd.69.1593400735631; 
 Sun, 28 Jun 2020 20:18:55 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id m1sm2383295ljg.60.2020.06.28.20.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 20:18:55 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v2 4/6] gpu: host1x: Put gather's BO on pinning error
Date: Mon, 29 Jun 2020 06:18:40 +0300
Message-Id: <20200629031842.32463-5-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200629031842.32463-1-digetx@gmail.com>
References: <20200629031842.32463-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jun 2020 06:50:54 +0000
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
