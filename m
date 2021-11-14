Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E9E44FA75
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 20:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBE36E889;
	Sun, 14 Nov 2021 19:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E339D6E888
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 19:36:13 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id z34so37500833lfu.8
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 11:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pQQ64DHAwVUDK+O7zZPErxA1rL3KEtXVNyJE4UYdy5Q=;
 b=RRycqGZwIueXzgKSSOzpwNjNa6o/QJ+QS7jxDbxPJ+hGPatfo5zz8HTxHc2u9t62NH
 7JOaNBfaZj4waNTd+FUfABgSPWSlQCC2E5ejfGtAUYhhhDqRwCuRCjKc+Ajb9aGFQeNR
 DdsvjPwCmZltNAdZr0oYyOItqi/KK3HPfaLD6twSiLCuqvZQ4bxvjTQkDAgRY10tDQVT
 xaYLXs5Hn+Q1JoCQkbivp2aYQKkAt2KTeClhJDfRLWY5eE36FFYlyUQTZLHsA/V51KWL
 54Z/xObrEUu4htF7XcIWl74EZeRoJuAPh+T6wqIOBr/Fh/SG5+MdVYHSgicWWWKHPTrC
 R/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pQQ64DHAwVUDK+O7zZPErxA1rL3KEtXVNyJE4UYdy5Q=;
 b=YC6MGTLdBTTVXu4scPd7pg9YVtUiOP/h1glX3gdd3bwguNzlHt92xOGnt0T8nPQcWx
 i+fq+YobJEb5N+tFsR0NuNg28a5N8QtkV0niD7yIr7Imcn7WrpY6dYwG186FGbbLdV89
 dPTHDwl8LygryMmDm4igUDCMWf7yXwhLmAHLoYzEyQrAgMuP81p0jUVz4WKRpbrf+cM4
 M2Sg4pubyOGjP8bvJ9st6L/ofL0xKMKOY5LxrL799jBalZVT4fbX9avCAjnYh5D+jmyv
 87nML5LT9CZaJNCOXCixsPxdpwCdIocwjJTYht2kFIQ1863NN4XChy7aYnFmUWgJ3feo
 RHyA==
X-Gm-Message-State: AOAM5331pMvODOeNJ9VM5IVJC1BcFg5j7RAJ2PBevfMKANRSiifRi5D9
 BlY/atim1550sw9rnLW+jH8=
X-Google-Smtp-Source: ABdhPJx8rfbMoBXZQtumsweyBh+F01dCj6bDPAYPmXKgdBjuaP6k7Gj2NTx2ugCwz9uGwHNl7tiXxw==
X-Received: by 2002:a05:6512:3b90:: with SMTP id
 g16mr28888069lfv.216.1636918572036; 
 Sun, 14 Nov 2021 11:36:12 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id p18sm1191280lfu.127.2021.11.14.11.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 11:36:11 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v15 16/39] drm/tegra: submit: Remove pm_runtime_enabled()
 checks
Date: Sun, 14 Nov 2021 22:34:12 +0300
Message-Id: <20211114193435.7705-17-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114193435.7705-1-digetx@gmail.com>
References: <20211114193435.7705-1-digetx@gmail.com>
MIME-Version: 1.0
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
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Runtime PM is now universally available, make it mandatory by removing
the pm_runtime_enabled() checks.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/submit.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index c32698404e36..3bbd8de5711c 100644
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -504,8 +504,7 @@ static void release_job(struct host1x_job *job)
 	kfree(job_data->used_mappings);
 	kfree(job_data);
 
-	if (pm_runtime_enabled(client->base.dev))
-		pm_runtime_put_autosuspend(client->base.dev);
+	pm_runtime_put_autosuspend(client->base.dev);
 }
 
 int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
@@ -589,12 +588,10 @@ int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
 	}
 
 	/* Boot engine. */
-	if (pm_runtime_enabled(context->client->base.dev)) {
-		err = pm_runtime_resume_and_get(context->client->base.dev);
-		if (err < 0) {
-			SUBMIT_ERR(context, "could not power up engine: %d", err);
-			goto unpin_job;
-		}
+	err = pm_runtime_resume_and_get(context->client->base.dev);
+	if (err < 0) {
+		SUBMIT_ERR(context, "could not power up engine: %d", err);
+		goto unpin_job;
 	}
 
 	job->user_data = job_data;
-- 
2.33.1

