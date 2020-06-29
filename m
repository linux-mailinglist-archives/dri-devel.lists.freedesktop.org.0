Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F44320CCD4
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 08:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D4E6E406;
	Mon, 29 Jun 2020 06:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8156E3F7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 03:18:56 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id y18so8225160lfh.11
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 20:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZqX/ziB/3PC8jQi/MNjK/OF3UvmP/IxboFt/kpaG6UI=;
 b=C3CLAnY+ijK+28R1W4aD4su9eW20nda3aXUS0bXEU/A5x8k44CPpWCMbh8DZ5DfYxR
 DP+IryDAr8W7plPjMA9y56zOwQbEdz5GgLdHHFU9dynoQxNkBnuGNoFmGB8qRDay8xED
 EtdZJpOT8EQnBsrRHjrj6y6ccAWiSMN3raiUQRapljYhciukD63uys3QJbRiUfBFqh+/
 9DNXMSJvdXBy5s9KFK7dWyBbL7jvt1mavps1p2oMraiPuIuTNmazLXo+6zZxMib2ksAe
 76n0SKyqhnNcX1cNZAmyIogP76CjyB6fLi1/T9mGxLhSKPOWExyd41gY8yKvbHZuASak
 q0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZqX/ziB/3PC8jQi/MNjK/OF3UvmP/IxboFt/kpaG6UI=;
 b=okdTMoaBq0Vwb6V43lWpLB6w4KfurWy1Mf3Z4FhxOcNVPNOzlsJSnpMlvohhnHx+l7
 aBzfsTNBuk/iF2U2jUD5XfDhU7L6HbJJWMd6qDngxuKO67ivhTH78JN0Pd6bozLTPT8b
 JJVRyOFch9JgjXH/lpz83W20ZWqGPRD28znFaJyOwzGa3Fx2ENDaUeJr9/ZS/XP+cWuk
 fCgWpUTjC1WZ2vxjtvJgY7cu+iJV3apumUjqVmu+fx/t0o/GPw/p+A4NVYzzU2fKnUUT
 6N4jLeRSkptq7CDA/xajj1Xi3QbQZuT/338DnSp2lRUwB5VarrWlnCHsYfVuWsChywP2
 IHtA==
X-Gm-Message-State: AOAM531PHUVN/5E/UJ7Q0sHERpHW6w4Nz/Ql/Jx57Q/M4qGU5NP37+hM
 PT798kKiENT5tgWwOkUksZk=
X-Google-Smtp-Source: ABdhPJwL8kdj2UBzyr36CG0IGwXDZbazR20iwjZcmzVY4OcOr8SPrDKDMCFosjThrJ4jcE1cuhzpKw==
X-Received: by 2002:ac2:5a5e:: with SMTP id r30mr8052760lfn.30.1593400734694; 
 Sun, 28 Jun 2020 20:18:54 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id m1sm2383295ljg.60.2020.06.28.20.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 20:18:54 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v2 3/6] gpu: host1x: Optimize BOs usage when firewall is
 enabled
Date: Mon, 29 Jun 2020 06:18:39 +0300
Message-Id: <20200629031842.32463-4-digetx@gmail.com>
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

We don't need to hold and pin original BOs of the gathers in a case of
enabled firewall because in this case gather's content is copied and the
copy is used by the executed job.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/job.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index a10643aa89aa..a954bd41aa79 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -27,10 +27,13 @@ struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
 				    u32 num_cmdbufs, u32 num_relocs)
 {
 	struct host1x_job *job = NULL;
-	unsigned int num_unpins = num_cmdbufs + num_relocs;
+	unsigned int num_unpins = num_relocs;
 	u64 total;
 	void *mem;
 
+	if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
+		num_unpins += num_cmdbufs;
+
 	/* Check that we're not going to overflow */
 	total = sizeof(struct host1x_job) +
 		(u64)num_relocs * sizeof(struct host1x_reloc) +
@@ -183,6 +186,13 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 		job->num_unpins++;
 	}
 
+	/*
+	 * We will copy gathers BO content later, so there is no need to
+	 * hold and pin them.
+	 */
+	if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
+		return 0;
+
 	for (i = 0; i < job->num_gathers; i++) {
 		struct host1x_job_gather *g = &job->gathers[i];
 		size_t gather_size = 0;
@@ -216,7 +226,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			goto unpin;
 		}
 
-		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && host->domain) {
+		if (host->domain) {
 			for_each_sg(sgt->sgl, sg, sgt->nents, j)
 				gather_size += sg->length;
 			gather_size = iova_align(&host->iova, gather_size);
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
