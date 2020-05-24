Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9B01E07B5
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF46E89D5E;
	Mon, 25 May 2020 07:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF4689DD5
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 17:52:46 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m12so16006168ljc.6
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 10:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZqX/ziB/3PC8jQi/MNjK/OF3UvmP/IxboFt/kpaG6UI=;
 b=jNSTgmjo7JlEJiRl4entQGAY/9K5w//iPKe7T/dmGV9JEa8Tnfk9pxlc3z1q72l2UI
 1aHWwA1qy7qFQBdXxPMlpvP4udhnvZ0nZvJBX7l6seLztMirVgP/FH0vxQGlGeV7+E9h
 dMcNpM+7nks/gVavzNJXv67F7mGHvyN3JT3TmU1VymyNvblKsCs9XeArZU6UCV8w/Hvu
 s5rQ74eHYc65EWgTmjENLjitWGq/xPu2HFbsy8Y8fGze3Tj7SlatqvTbVRjURaQj+Upy
 NxJoIPs5jlb9J7Sopemmx4UFBa0jCUskrdLfoWqjaWVK8J8TojIxXMqMqHftDrX9jdji
 H26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZqX/ziB/3PC8jQi/MNjK/OF3UvmP/IxboFt/kpaG6UI=;
 b=keUHk3pM1rLC+PJbW7TvKNyzGAw8CvKiFvrCjWl1mGz0hf1QehlYIM7pTuez4cHarm
 ITC7wLAVU+S59aLFppFkyubhVKuN+wEGsrU05y287rGAweyeEvQ/wOeJlYfAH+voFBKw
 aGjKmlBl7s9wIB1mVMw3T2BhRE0FvTK9eFOKEpU/7mcUtc0IdvcQeq7k8oBoib1qFWrt
 fTWrSPgjV4lUussvp819qdEpPRZXsZW4TIeKqFUZMWAa0JpVWM7r2i12yi6xTa00R8zN
 QldVWYpnZ1TjXw+CjtkGqhm4+yFH/bHf+EeGLwPESvQo4PZSLG4KRSYu+QHQ0pIijeZZ
 Umvg==
X-Gm-Message-State: AOAM531KhBm24FD38sHWzjFqnc3s5fsgQWh7xIpfKyha8BqBkxEy04cB
 /PF6lJHUUcelJx7GA/SE6dQ=
X-Google-Smtp-Source: ABdhPJwGLV7Yi1e8Sv66wz7A1qTYC1R8o08w7VEY7vL/P7EyDKWAgu+eTDBV8ZV9Plp7JJ7w3YhdPA==
X-Received: by 2002:a2e:958b:: with SMTP id w11mr12732072ljh.262.1590342765306; 
 Sun, 24 May 2020 10:52:45 -0700 (PDT)
Received: from localhost.localdomain (ppp91-76-17-204.pppoe.mtu-net.ru.
 [91.76.17.204])
 by smtp.gmail.com with ESMTPSA id 130sm4045350lfl.37.2020.05.24.10.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:52:44 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 1/4] gpu: host1x: Optimize BOs usage when firewall is
 enabled
Date: Sun, 24 May 2020 20:50:57 +0300
Message-Id: <20200524175100.9334-2-digetx@gmail.com>
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
