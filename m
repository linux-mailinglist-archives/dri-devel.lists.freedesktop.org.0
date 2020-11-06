Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AC72A9190
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:36:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EDDF6EE2E;
	Fri,  6 Nov 2020 08:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505736E075
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 07:05:34 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id x13so228123pgp.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 23:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ehPUCc4BBH4w6xwbXHXZ9YzZ1LHDSwHspwqvBRHLfG8=;
 b=o5Zr52H5GnqwIwaEUT6XGHpZ+Rk+X0IvKQ47cS0hprikNcIhQd95tQWJJ9xoEnMC6a
 qq0CgW4B20Qmt6WOLolyORfkDV888lAdzgcGn74AVqm+Knjd7N42MMbPeXXOyU1tL0J4
 7GWqIJq+ACgU+jrTV5fuw+yggsYOAd9L/MAjYtgC1nzSfvtVI2U9LNiyJN2qZeqPGwJT
 kTg9vCMFltVucT2XqAblwjqtX1+OttYzVhENqzJfjyUNCk5Q0u9WKxarQa1qqwrWbPQC
 AB8UTDeC1bGUO/Eya7Tey2URIlSqyJuMquf4COHmuHqW+TX8lkHBRXwAhDKO1VIf9w9g
 W0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ehPUCc4BBH4w6xwbXHXZ9YzZ1LHDSwHspwqvBRHLfG8=;
 b=Ti0oXWT7uggSzt8T5wwsZulY/pKHfe6PdGo1oNs+wVOEXkaZQdVAEO3FIbTWvP/L4a
 ghUyz3ty//Soal1Pyx7BwpVDA+GxRl/LUofC68MSdvolcArMGm3EE6qV4OzgxpggyjPE
 3b+PHwojUX23njL0X7sxM3MqPekf03KXZdZrK/Z4BaBDjYxzHb6nPqPwjv3qglm0lWuz
 v+1TUV4YC7WUwE/0h5TWv2bpNgaq91XtG5XAQn0oB7ThNPtD9V6Ln/fEuOVxXX8OY/OP
 11nkJDqOr33nI/a3Ixe9civABi09ctLgcu8SdqbgJCx7AweyU2TztQ4unnVkpKcynd64
 m5XA==
X-Gm-Message-State: AOAM531Z/Le8/RrPMvDtY31g7n02ubOXh9Qo9GjuJB15zm53uDaSf+Fc
 vEoTMUKeVJvu6CfL/gty326ddA==
X-Google-Smtp-Source: ABdhPJxV4aG+pPSqQiArJqkvpC3VHdnMlXqz893y069PmwZUjFiCvQoM0e21aZD+0OKoStOt+zy0BQ==
X-Received: by 2002:a63:1212:: with SMTP id h18mr621177pgl.196.1604646333997; 
 Thu, 05 Nov 2020 23:05:33 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id m6sm793084pfa.61.2020.11.05.23.05.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Nov 2020 23:05:33 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 5/7] drm/lima: dev_pm_opp_put_*() accepts NULL argument
Date: Fri,  6 Nov 2020 12:33:25 +0530
Message-Id: <2518c14df2f16cc3c4fee35499895a32513c174b.1604646059.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1604646059.git.viresh.kumar@linaro.org>
References: <cover.1604646059.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: Nishanth Menon <nm@ti.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 lima@lists.freedesktop.org, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Rafael Wysocki <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, digetx@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dev_pm_opp_put_*() APIs now accepts a NULL opp_table pointer and so
there is no need for us to carry the extra check. Drop them.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/gpu/drm/lima/lima_devfreq.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
index bbe02817721b..e7b7b8dfd792 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.c
+++ b/drivers/gpu/drm/lima/lima_devfreq.c
@@ -110,15 +110,10 @@ void lima_devfreq_fini(struct lima_device *ldev)
 		devfreq->opp_of_table_added = false;
 	}
 
-	if (devfreq->regulators_opp_table) {
-		dev_pm_opp_put_regulators(devfreq->regulators_opp_table);
-		devfreq->regulators_opp_table = NULL;
-	}
-
-	if (devfreq->clkname_opp_table) {
-		dev_pm_opp_put_clkname(devfreq->clkname_opp_table);
-		devfreq->clkname_opp_table = NULL;
-	}
+	dev_pm_opp_put_regulators(devfreq->regulators_opp_table);
+	dev_pm_opp_put_clkname(devfreq->clkname_opp_table);
+	devfreq->regulators_opp_table = NULL;
+	devfreq->clkname_opp_table = NULL;
 }
 
 int lima_devfreq_init(struct lima_device *ldev)
-- 
2.25.0.rc1.19.g042ed3e048af

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
