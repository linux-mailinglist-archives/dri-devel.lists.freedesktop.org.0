Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC26464284
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608756E802;
	Tue, 30 Nov 2021 23:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838736E5D1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:24:06 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id l22so57902967lfg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rbxS+czlvl4v2Ex+Hd7Oo4aKfN8xGGc3cJeJXZnVPgU=;
 b=HhEWquLQ1nSVC/e/vGlnslyaUjur7LLJIXBgEEdgcOwtHVYtU7j576qG3Nd8u0q4yT
 5Kc1fmoFvaz9J/yx2Jcm4eB1IeND5aJ+tQSjvEW+AXkpu9E7mYRQimIr3bdQ77ryelmt
 aYQB9pcnq9hqHZp4xL8bazBlrSIKEaEvGexN93349d36OOZeZRuZHH6+ewjqgeOhNWTi
 57pKRVQzSEjKzql9ubMSk1KGVFbksJAfPXOMyb1LpO7VIvyJQvf+EVnTo7MOgQW99rFJ
 YG8LsTEYiU60RLns4GP8tce8aJkTWG20ljC1thd1YisRvN75x9Q2wEKzq081Vndn4Of7
 fDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rbxS+czlvl4v2Ex+Hd7Oo4aKfN8xGGc3cJeJXZnVPgU=;
 b=VYby+90a1OM7NNIdBNcD29fIKO0o6b/D6kOiuCS1u/4vVEysCEnuhzv1Ryx35S6ZuO
 b9BsPjIKTbOloVmZKC4btOgARbpifocEosBRlAYZrTo+tJhIBgqroAyTiuUFOVJ/jAZY
 qsRFGLB7G+pwDosBHisFcuQCIT23bzjdCkCuvhokfLXyInVFPXriqpLRVQJOr8o8xZUx
 JE36F3qdT9exqGRtRRTiC5AEXUNUjQ1qIBY8UIz0UsTYjM6xRde7kFKmVmmVkbdK+COT
 UBBLh1TYNqQc8Eay0X0R560gMaojVMaIQeO8fDEiauw0GFw9W7Hs858yiMzxQ4InNIjw
 FZCw==
X-Gm-Message-State: AOAM530uAnFKBbLWqifx3mKIh2weA5KiTA3Pte/5b/ycphJpGbyw79px
 xbjq3hK5bkopXSdhEUVFs24=
X-Google-Smtp-Source: ABdhPJw5K2z1aIR5u0J91Op29NS99ZpT3qc+p0CSCPrgbki7rybvBaya2Vv6r2NRdWPQzzI5F4P6sg==
X-Received: by 2002:a05:6512:318f:: with SMTP id
 i15mr2082253lfe.341.1638314644917; 
 Tue, 30 Nov 2021 15:24:04 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:24:04 -0800 (PST)
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
Subject: [PATCH v16 10/40] drm/tegra: submit: Add missing
 pm_runtime_mark_last_busy()
Date: Wed,  1 Dec 2021 02:23:17 +0300
Message-Id: <20211130232347.950-11-digetx@gmail.com>
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

Runtime PM auto-suspension doesn't work without pm_runtime_mark_last_busy(),
add it.

Cc: <stable@vger.kernel.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/submit.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index c32698404e36..1ba4d539da06 100644
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -504,8 +504,10 @@ static void release_job(struct host1x_job *job)
 	kfree(job_data->used_mappings);
 	kfree(job_data);
 
-	if (pm_runtime_enabled(client->base.dev))
+	if (pm_runtime_enabled(client->base.dev)) {
+		pm_runtime_mark_last_busy(client->base.dev);
 		pm_runtime_put_autosuspend(client->base.dev);
+	}
 }
 
 int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
-- 
2.33.1

