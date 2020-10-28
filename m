Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB8D29CEC5
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE036EC9C;
	Wed, 28 Oct 2020 08:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F0C6E488
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 06:44:27 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id z1so564348plo.12
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 23:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lRIVhEzHo1XPH6PloaXFLB5fbBAOJPEuMdhJUY10d78=;
 b=iYOIaz1lxvCXYXcNu+M4bI10tLNyS4M9A6CZD5JmtScTgP2CA5ampy0XyQktbCzrM4
 ceakwVehkdY/LSqm0tglgrQrFLMxrSzd5TaJyZKvXoxWuCkMqFjxHRfXCvUmBxOEeBC4
 57vXFD6qCgSo0XOh4N70icprcdVJJu/U6FPp6uXalYDeubBNbKCFyhWyXlWYOhTrXmN9
 111vfz9NNBLBF7Gvxfc/9K/YkdW9/DtxWCkRM4yC8iaExAzHBgoBCqSQKPVxk1WH76am
 qq8qlPNy71RraDWoum8l5+HopRZsSa/Bw0h5Sj+YvUecZ8GJsT/tllUFSCBCz7Jp1CjQ
 mmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lRIVhEzHo1XPH6PloaXFLB5fbBAOJPEuMdhJUY10d78=;
 b=OjJcy3vVqK+a5pA16gjaCqEaj6FVsVnjg3HmeRO7TJHhOdSpyimJUb2xq25459gMcO
 K0CeaKJmiUx5buscwDGrmOTEUScokJEZyu8pbl1jgh4nFr3tPkTAQw9DGiTpsNlIxQHg
 o0fPi40hTxQS8Fsv0y02pOJAT8vsHcfx/nev16vzltMX1FNp/hLE4Kav3jtjqvWriZGG
 +fu98Kyp016jaZP6gXyBXpoSqFpwK/Hl2neQ9uK8GnjtZKTxJRUlY0RQo65fTnp+Sw4J
 ktVL6ZJ1mOOJ+sA/IHCadS3eueLFYqH9l+JIig5Qnr45OYulzBhwnTRMHQx+uWJYOtOC
 FY7g==
X-Gm-Message-State: AOAM532pwPPZAUYGISY+qCLv8dBLzlLNteuuoPj+aeIG/Ph7GCtS5faI
 JMvzqCvq+IjeR4aHcHKmXc4GTA==
X-Google-Smtp-Source: ABdhPJxsjXO4BzH/gTE1g7vUyycm0va7CGlKvoKvhDoyNRMPGXbtCie5OuI0yJ2/DOj01voeRbrUHg==
X-Received: by 2002:a17:90a:f3d4:: with SMTP id
 ha20mr5577064pjb.28.1603867467388; 
 Tue, 27 Oct 2020 23:44:27 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id t10sm3948706pjr.37.2020.10.27.23.44.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2020 23:44:26 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: robdclark@gmail.com, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH V2 Resend 1/2] drm/lima: Unconditionally call
 dev_pm_opp_of_remove_table()
Date: Wed, 28 Oct 2020 12:14:21 +0530
Message-Id: <c995335d16d8b4b4ff47b1273869c33e14782b32.1603867405.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:31 +0000
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, lima@lists.freedesktop.org,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
find the OPP table with error -ENODEV (i.e. OPP table not present for
the device). And we can call dev_pm_opp_of_remove_table()
unconditionally here.

Reviewed-by: Qiang Yu <yuq825@gmail.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

---
V2: Applied Reviewed by tag.
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
