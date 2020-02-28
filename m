Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD405173570
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 11:38:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A096E159;
	Fri, 28 Feb 2020 10:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C216E159;
 Fri, 28 Feb 2020 10:37:59 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j16so2393508wrt.3;
 Fri, 28 Feb 2020 02:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zgj7mTEBOZhnEp92w6YeduSWhL7aAxaZ23Ij9QT6Fcc=;
 b=lDYpL4uNGZO9BvGkElG1ZZKiB6RvJvwsUSqj3oDNMloKBWG8fm7f5xfah7pgRVx/vS
 kn5yawm8At4+BwAIzsioR8eNmllav5mPIJrwkxN8fYzQjZf8jde8TB58ZOVKy+yNAgPY
 uE3vxyFFBYPDLTeVnW7vMgSQgjDrYY4ER+c5zpQpLNU/gricql9sKfFJCoYs84gABaaR
 q9I9rCG4g/8Gsz6GZ8qSKg1KVa6tFvu2z+ig0BNcIPgGXN/ThiqIdgkTJASL1l36VDFh
 Y5a0zld+pZ/94BdNivbeLXSr8KTnJ0RZOl3pTxSwUA8/18nWLYTM2mc8LgVo15Igbj1V
 iQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zgj7mTEBOZhnEp92w6YeduSWhL7aAxaZ23Ij9QT6Fcc=;
 b=oov1HGN562J1aVJ066TgcCY3q+gDDgPwd91/8bDJSUcPP43z8tmAgpOu9h4J75nNPb
 GBNpcXc+eZR5XrHtzlMCkYKVHPRT2/lBYbxHx/+GibO0y/rylHbxFP254oRsTPR/uelO
 JChtnsA4cChoEN5USEwUC42EbXHkDip65nA3DAsfdIv8G/DZ0yaMeBv6XeNjr0Ll1imR
 xT9eIx9gT+dihU0PmoaJQFVmTMKnkw8dVM/BciEiA5u0lrAYEsbEH5drlnMzCm31u6Wf
 63NM44dtv03n7PYcRYzLSqolYsjtBJ1I2D111A4SXFzJRFTt0wcpExM/fkIRdv8LPzRX
 mSew==
X-Gm-Message-State: APjAAAX9OcDV4TucvTDA9H0YVX3iRBHNJYBCHNNqQllWpcxzQJvlWIvR
 OPWogJBmSY48U+wAWdUYXV8=
X-Google-Smtp-Source: APXvYqw8f1DiLcW2DIjcpjJZpBiix4Ms4NoYtBEt2H6KG1bsFEVAD1D2iH6I52vH6vZYjWw1XxMhjQ==
X-Received: by 2002:a5d:4f89:: with SMTP id d9mr4216926wru.391.1582886278351; 
 Fri, 28 Feb 2020 02:37:58 -0800 (PST)
Received: from localhost.localdomain (62-178-82-229.cable.dynamic.surfer.at.
 [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id s22sm1550679wmc.16.2020.02.28.02.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 02:37:57 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/etnaviv: rework perfmon query infrastructure
Date: Fri, 28 Feb 2020 11:37:49 +0100
Message-Id: <20200228103752.1944629-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Report the correct perfmon domains and signals depending
on the supported feature flags.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: 9e2c2e273012 ("drm/etnaviv: add infrastructure to query perf counter")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>

---
Changes V1 -> V2:
  - Handle domain == NULL case better to get rid of BUG_ON(..) usage.
---
 drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 59 ++++++++++++++++++++---
 1 file changed, 52 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
index 8adbf2861bff..e6795bafcbb9 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
@@ -32,6 +32,7 @@ struct etnaviv_pm_domain {
 };
 
 struct etnaviv_pm_domain_meta {
+	unsigned int feature;
 	const struct etnaviv_pm_domain *domains;
 	u32 nr_domains;
 };
@@ -410,36 +411,78 @@ static const struct etnaviv_pm_domain doms_vg[] = {
 
 static const struct etnaviv_pm_domain_meta doms_meta[] = {
 	{
+		.feature = chipFeatures_PIPE_3D,
 		.nr_domains = ARRAY_SIZE(doms_3d),
 		.domains = &doms_3d[0]
 	},
 	{
+		.feature = chipFeatures_PIPE_2D,
 		.nr_domains = ARRAY_SIZE(doms_2d),
 		.domains = &doms_2d[0]
 	},
 	{
+		.feature = chipFeatures_PIPE_VG,
 		.nr_domains = ARRAY_SIZE(doms_vg),
 		.domains = &doms_vg[0]
 	}
 };
 
+static unsigned int num_pm_domains(const struct etnaviv_gpu *gpu)
+{
+	unsigned int num = 0, i;
+
+	for (i = 0; i < ARRAY_SIZE(doms_meta); i++) {
+		const struct etnaviv_pm_domain_meta *meta = &doms_meta[i];
+
+		if (gpu->identity.features & meta->feature)
+			num += meta->nr_domains;
+	}
+
+	return num;
+}
+
+static const struct etnaviv_pm_domain *pm_domain(const struct etnaviv_gpu *gpu,
+	unsigned int index)
+{
+	const struct etnaviv_pm_domain *domain = NULL;
+	unsigned int offset = 0, i;
+
+	for (i = 0; i < ARRAY_SIZE(doms_meta); i++) {
+		const struct etnaviv_pm_domain_meta *meta = &doms_meta[i];
+
+		if (!(gpu->identity.features & meta->feature))
+			continue;
+
+		if (meta->nr_domains < (index - offset)) {
+			offset += meta->nr_domains;
+			continue;
+		}
+
+		domain = meta->domains + (index - offset);
+	}
+
+	return domain;
+}
+
 int etnaviv_pm_query_dom(struct etnaviv_gpu *gpu,
 	struct drm_etnaviv_pm_domain *domain)
 {
-	const struct etnaviv_pm_domain_meta *meta = &doms_meta[domain->pipe];
+	const unsigned int nr_domains = num_pm_domains(gpu);
 	const struct etnaviv_pm_domain *dom;
 
-	if (domain->iter >= meta->nr_domains)
+	if (domain->iter >= nr_domains)
 		return -EINVAL;
 
-	dom = meta->domains + domain->iter;
+	dom = pm_domain(gpu, domain->iter);
+	if (!dom)
+		return -EINVAL;
 
 	domain->id = domain->iter;
 	domain->nr_signals = dom->nr_signals;
 	strncpy(domain->name, dom->name, sizeof(domain->name));
 
 	domain->iter++;
-	if (domain->iter == meta->nr_domains)
+	if (domain->iter == nr_domains)
 		domain->iter = 0xff;
 
 	return 0;
@@ -448,14 +491,16 @@ int etnaviv_pm_query_dom(struct etnaviv_gpu *gpu,
 int etnaviv_pm_query_sig(struct etnaviv_gpu *gpu,
 	struct drm_etnaviv_pm_signal *signal)
 {
-	const struct etnaviv_pm_domain_meta *meta = &doms_meta[signal->pipe];
+	const unsigned int nr_domains = num_pm_domains(gpu);
 	const struct etnaviv_pm_domain *dom;
 	const struct etnaviv_pm_signal *sig;
 
-	if (signal->domain >= meta->nr_domains)
+	if (signal->domain >= nr_domains)
 		return -EINVAL;
 
-	dom = meta->domains + signal->domain;
+	dom = pm_domain(gpu, signal->domain);
+	if (!dom)
+		return -EINVAL;
 
 	if (signal->iter >= dom->nr_signals)
 		return -EINVAL;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
