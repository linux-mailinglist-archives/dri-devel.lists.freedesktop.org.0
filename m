Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E6824D9A6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 18:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59636EB20;
	Fri, 21 Aug 2020 16:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6AF6EB20
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 16:15:19 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7347522B40;
 Fri, 21 Aug 2020 16:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598026519;
 bh=RirBJnGWSx+8SfHSLXWiXEKeGrvmh1KYf16yHJ8Ti0g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ywQ7HHt3Dm0WNTKlGHDwBVODV2IdaQ5sWE4y5wbrHhPsX05S+L6/6e+3UNaNXxXjC
 XSodAHXxVu6wQz00O+BjXlUi/tV77bDG/NPYnVXVUHgW0heqqOLJQWXlVcDe4+7FZY
 zRhdvTPFJlhUYcHvfgtmEZdFyzrB35TyTBlYW8EM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 43/62] gpu: host1x: Put gather's BO on pinning
 error
Date: Fri, 21 Aug 2020 12:14:04 -0400
Message-Id: <20200821161423.347071-43-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821161423.347071-1-sashal@kernel.org>
References: <20200821161423.347071-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <treding@nvidia.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmitry Osipenko <digetx@gmail.com>

[ Upstream commit fd323e9ef0a19112c0c85b85afc4848c0518174b ]

This patch fixes gather's BO refcounting on a pinning error. Gather's BO
won't be leaked now if something goes wrong.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/host1x/job.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index a10643aa89aa5..2ac5a99406d98 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -102,6 +102,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 {
 	struct host1x_client *client = job->client;
 	struct device *dev = client->dev;
+	struct host1x_job_gather *g;
 	struct iommu_domain *domain;
 	unsigned int i;
 	int err;
@@ -184,7 +185,6 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 	}
 
 	for (i = 0; i < job->num_gathers; i++) {
-		struct host1x_job_gather *g = &job->gathers[i];
 		size_t gather_size = 0;
 		struct scatterlist *sg;
 		struct sg_table *sgt;
@@ -194,6 +194,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 		dma_addr_t *phys;
 		unsigned int j;
 
+		g = &job->gathers[i];
 		g->bo = host1x_bo_get(g->bo);
 		if (!g->bo) {
 			err = -EINVAL;
@@ -213,7 +214,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 		sgt = host1x_bo_pin(host->dev, g->bo, phys);
 		if (IS_ERR(sgt)) {
 			err = PTR_ERR(sgt);
-			goto unpin;
+			goto put;
 		}
 
 		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && host->domain) {
@@ -226,7 +227,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 					   host->iova_end >> shift, true);
 			if (!alloc) {
 				err = -ENOMEM;
-				goto unpin;
+				goto put;
 			}
 
 			err = iommu_map_sg(host->domain,
@@ -235,7 +236,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			if (err == 0) {
 				__free_iova(&host->iova, alloc);
 				err = -EINVAL;
-				goto unpin;
+				goto put;
 			}
 
 			job->unpins[job->num_unpins].size = gather_size;
@@ -245,7 +246,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 					 DMA_TO_DEVICE);
 			if (!err) {
 				err = -ENOMEM;
-				goto unpin;
+				goto put;
 			}
 
 			job->unpins[job->num_unpins].dir = DMA_TO_DEVICE;
@@ -263,6 +264,8 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 
 	return 0;
 
+put:
+	host1x_bo_put(g->bo);
 unpin:
 	host1x_job_unpin(job);
 	return err;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
