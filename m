Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFA64642F2
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57356E85A;
	Tue, 30 Nov 2021 23:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510C06E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:24:13 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id b40so57919079lfv.10
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aMqIRBx8bvkPqXq4sp0s4HdEiF5OdAJboSuvlHkSNzI=;
 b=IQ1LSQa2l3fz6yR41bKkuciUdRe4P2k8wXpBlg7eku9Ndz4H79S5f/NrETNLfmTx97
 RQ7G2o3fopgLto0kBSzMo2XifJ9jDu7yvqPOZKf5PyLtr83gMYuMZEFXzNWUGjH7hCH4
 lRQpJn3rrcQHTUGjiPqCxKDS6gQ5kI9HbD7mQMR2QdX2p4udgvXQd+kqH8A6MKqFjKAO
 iZ51QRTNwhSQWD0JsbWbNQUU3pOFgLyAWWu6zdYe63m8ZIdbNtn3Za1XGqjnliBdMo2K
 gnF4w+3q9H6NCcP/EoNdkQQIzPK5ifAoiCSxl4Musc6BMiUSoGNSYgyDB/EUxuJeYBUA
 ft3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aMqIRBx8bvkPqXq4sp0s4HdEiF5OdAJboSuvlHkSNzI=;
 b=7tlsPHpUyvByp5kNZheWCZe9usqfXjGF/yPOQyIo1FkDQiyet1SA0U+xjvOqfyt6td
 UMrzdR7E+bWiDlQfTIUDXIECdbG3jnYsg/DAAERYNRCKBTDTx438XelKD0UD/saCmrA0
 oudr56XXDn4xzke2WQkWyz6qxuLXPl0V0tCmTGljgTQ6owu8DiPnu0rv2TTPw9FGmPPM
 FodRXTyrZnDmXT4GdP0MeV210EIwUURVrQiyN1OuBPMAmAzoiWO1kdDIVRXTWa37bmDT
 8IyJ3U9t9/gfuFrgMr8ZkNtrkeZiyZm7vsKArldeQkvKVwrf2e8MkJm5KtJzOUzwosZ3
 2Diw==
X-Gm-Message-State: AOAM533bUbBSspTVCI5daE6VCRnrpRr15CH7MpjssQznACl7XciRALUz
 YL88lleSRkCFk/no+ZlzY1k=
X-Google-Smtp-Source: ABdhPJznxpBclm3/sH8WRVsvo5VSZBSQu2u3rPiZvJGH/S9kgZZYVPAFxr2PhYbtP/VwIQIW5Yf90w==
X-Received: by 2002:a19:dc51:: with SMTP id f17mr2296160lfj.555.1638314651720; 
 Tue, 30 Nov 2021 15:24:11 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:24:11 -0800 (PST)
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
Subject: [PATCH v16 17/40] drm/tegra: submit: Remove pm_runtime_enabled()
 checks
Date: Wed,  1 Dec 2021 02:23:24 +0300
Message-Id: <20211130232347.950-18-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130232347.950-1-digetx@gmail.com>
References: <20211130232347.950-1-digetx@gmail.com>
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
 drivers/gpu/drm/tegra/submit.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index 1ba4d539da06..6d6dd8c35475 100644
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -504,10 +504,8 @@ static void release_job(struct host1x_job *job)
 	kfree(job_data->used_mappings);
 	kfree(job_data);
 
-	if (pm_runtime_enabled(client->base.dev)) {
-		pm_runtime_mark_last_busy(client->base.dev);
-		pm_runtime_put_autosuspend(client->base.dev);
-	}
+	pm_runtime_mark_last_busy(client->base.dev);
+	pm_runtime_put_autosuspend(client->base.dev);
 }
 
 int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
@@ -591,12 +589,10 @@ int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
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

