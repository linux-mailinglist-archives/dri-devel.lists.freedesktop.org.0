Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B86FB24CEA8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A4B6EAAD;
	Fri, 21 Aug 2020 07:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499056E937
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 10:44:22 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id d188so837866pfd.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 03:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x+bz+8kGVuMiMceaXT9LU2+tICSPMZ8W5Wbu/NfWx68=;
 b=VzvCfdlyX26OvPS41xgFNpLtuTf6bOsmYXDqUDx9yH9XJzJYFihRnNb+KnOPfI/CpD
 HsS2D8Z1KcpukEvEzHvPa6ZlcadJdK0VqPvJGPk7k5LiPLnzLHj/s84K670FPUWTA4QT
 8kz47EWrsP+qpsHgxuEg4qJpHBzyPKNUq/FQkZ80CzWc/UYpmMSUha+OVCbxZiDGQEFR
 OTLzfys4GCB+RzViJCKWQG+DhfRvuvI5bz/opYcl/sNOwqrGa4j+1F0IrE41gbUdQjB7
 sbBhIKkBOq5NyflTtNBSgFE92CPEdwfI02ZZ+wt068yTKeDDEuj67TxT0QXC+b3pvrPy
 n/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+bz+8kGVuMiMceaXT9LU2+tICSPMZ8W5Wbu/NfWx68=;
 b=HCVzORBj1+oRQtGWy32ir3lCcFw2l7duzOyXuK/AbXNbGw8WAusfWg0vkoBaK1y1CB
 WPoXwsMvy1kkuI10gpGCs5ysN86JJOzzvhZK/gz9b1fkUuRY8zOw78E5NFmI5PoebNb1
 Tomu7Wl+XXpiQTb2hxcwg2YfMb85nNKLOjWVortIYurX9KP4EEe2qbsKz6zVGVyigPVR
 S9KjFkuCGDTLqrINo8kVIQkOt2ruEq6LxFJYKmix76tvY54DtBG0/mhRIio96o4qsOAT
 q/mBJ/RDPwP+qsZGXFZgVnXwKU+bdU2gRG/0krGQO37clvPhfGJuMbnKCEV14QrRE/iF
 ZwcQ==
X-Gm-Message-State: AOAM533yLUbcOEMJgTx7AQgockOOKNSs+HVfDfbvLnYTMtuXZnry8G7n
 TRkOJAa/fGx96lZl2LGWPkFu6A==
X-Google-Smtp-Source: ABdhPJx204lll0F+uxJX2f3BtowduppAEc5fLKvYgPqeD1qYvO0Eqim+FaNlx2JCiLuDDd1kqUd5hA==
X-Received: by 2002:a63:b10a:: with SMTP id r10mr2053661pgf.431.1597920261940; 
 Thu, 20 Aug 2020 03:44:21 -0700 (PDT)
Received: from localhost ([122.172.43.13])
 by smtp.gmail.com with ESMTPSA id 144sm2333708pfu.114.2020.08.20.03.44.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Aug 2020 03:44:21 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rnayak@codeaurora.org, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/8] drm/lima: Unconditionally call
 dev_pm_opp_of_remove_table()
Date: Thu, 20 Aug 2020 16:13:51 +0530
Message-Id: <56f1c76a0061dc3ed2d6ea115a3ba8b2e2dee9fd.1597919647.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1597919647.git.viresh.kumar@linaro.org>
References: <cover.1597919647.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 21 Aug 2020 07:11:07 +0000
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
find the OPP table with error -ENODEV (i.e. OPP table not present for
the device). And we can call dev_pm_opp_of_remove_table()
unconditionally here.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/gpu/drm/lima/lima_devfreq.c | 6 +-----
 drivers/gpu/drm/lima/lima_devfreq.h | 1 -
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
index bbe02817721b..cd290d866a04 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.c
+++ b/drivers/gpu/drm/lima/lima_devfreq.c
@@ -105,10 +105,7 @@ void lima_devfreq_fini(struct lima_device *ldev)
 		devfreq->devfreq = NULL;
 	}
 
-	if (devfreq->opp_of_table_added) {
-		dev_pm_opp_of_remove_table(ldev->dev);
-		devfreq->opp_of_table_added = false;
-	}
+	dev_pm_opp_of_remove_table(ldev->dev);
 
 	if (devfreq->regulators_opp_table) {
 		dev_pm_opp_put_regulators(devfreq->regulators_opp_table);
@@ -162,7 +159,6 @@ int lima_devfreq_init(struct lima_device *ldev)
 	ret = dev_pm_opp_of_add_table(dev);
 	if (ret)
 		goto err_fini;
-	ldevfreq->opp_of_table_added = true;
 
 	lima_devfreq_reset(ldevfreq);
 
diff --git a/drivers/gpu/drm/lima/lima_devfreq.h b/drivers/gpu/drm/lima/lima_devfreq.h
index 5eed2975a375..2d9b3008ce77 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.h
+++ b/drivers/gpu/drm/lima/lima_devfreq.h
@@ -18,7 +18,6 @@ struct lima_devfreq {
 	struct opp_table *clkname_opp_table;
 	struct opp_table *regulators_opp_table;
 	struct thermal_cooling_device *cooling;
-	bool opp_of_table_added;
 
 	ktime_t busy_time;
 	ktime_t idle_time;
-- 
2.25.0.rc1.19.g042ed3e048af

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
