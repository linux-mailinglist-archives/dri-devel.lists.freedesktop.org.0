Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DAF44FA9E
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 20:37:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C019D6E898;
	Sun, 14 Nov 2021 19:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D746E88C
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 19:36:14 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id k2so23198891lji.4
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 11:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v6s6Y176eM92G3urbum9u/lfNUjhQPz0PnC0xf51/Fs=;
 b=kxmpEbZsrYeuGpqvbXc+Y8jZAlLJKCqpQBqiX14xcPNo7jWOif712vX9/s7aimAjhi
 YlY1eZBNNhv8sH07VxmpkcWoRB5FkOi2x7UH4ysKqiuo9ZeygWmjFchBWyl5IvdNe1x9
 W6/jLsjVHU9iNo6DImtU3xKQA7iA2/YLiZ85KxS7Js4K8lr3hA+Ubb7yvhmkDD67Gbya
 9iMutsmj2gnHivXOKQKOeIociZQX4TNmJFEEKOsORmG4OqPf5OJ5rLJ/r06qYwzkcW+W
 bXuDh2C/jegF+xaTP7aASTYY7QaqfViuvpE+tlPjWCX8Epa5nf9+PqjPZiddJVOFLAdW
 MjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v6s6Y176eM92G3urbum9u/lfNUjhQPz0PnC0xf51/Fs=;
 b=sj97euZDI1xz/3gmt4t6VDy50zSVNHxugVl/mUZDYsuLf6aYLyn7JNATtcr4lDXCCP
 JTlHpCy5dCVRDW+E9ddPGWKM/CCuftCPgqQtUtwfk5CPps6Lpdx6O1k/g3I3+dwoaHej
 155BO/HdqHOz+7qIRggL5/u9AV45KMc7BdgGb7YfmQ3K8oeUgYl7i6uMNFS1YqQlD+Rp
 j0WvmzJtKM0S0jRAWS2tudyJEzsL9tJNGAxmZRm/m8/JPRqm+3NT9XGxjm6TECClyv4n
 3CAxpR6PbfkX9ViErnmy9YHgXxzsuEvaTnm13RkWKcT+8aXIjV/0x52T6Obvt2mpXqbU
 780g==
X-Gm-Message-State: AOAM5301XFFFjYV3mBcqwt6dnNu+Z3skZBfI1E0csgkkRQsl9oNC8+EW
 2y/V0t9LJWfDrS2ixW6w7+w=
X-Google-Smtp-Source: ABdhPJzT77hE2tzcj0ks3igJnufShKNdn8bWLA/wWGFj5JjeIPuW5/f+fNS9AU9jzf3kemhW8YnJyg==
X-Received: by 2002:a2e:b058:: with SMTP id d24mr32403728ljl.237.1636918572975; 
 Sun, 14 Nov 2021 11:36:12 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id p18sm1191280lfu.127.2021.11.14.11.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 11:36:12 -0800 (PST)
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
Subject: [PATCH v15 17/39] drm/tegra: submit: Add missing
 pm_runtime_mark_last_busy()
Date: Sun, 14 Nov 2021 22:34:13 +0300
Message-Id: <20211114193435.7705-18-digetx@gmail.com>
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

Runtime PM auto-suspension doesn't work without pm_runtime_mark_last_busy(),
add it.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/submit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index 3bbd8de5711c..6d6dd8c35475 100644
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -504,6 +504,7 @@ static void release_job(struct host1x_job *job)
 	kfree(job_data->used_mappings);
 	kfree(job_data);
 
+	pm_runtime_mark_last_busy(client->base.dev);
 	pm_runtime_put_autosuspend(client->base.dev);
 }
 
-- 
2.33.1

