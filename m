Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A72DC255543
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 09:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA516EB6B;
	Fri, 28 Aug 2020 07:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BE46E509
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 06:08:20 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id mt12so48474pjb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 23:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lRIVhEzHo1XPH6PloaXFLB5fbBAOJPEuMdhJUY10d78=;
 b=CTIi/VNBl7/pdFpj0PPc6Jc62F2DnJ6XScciqE9kRJen8nE772rxBpz923MEJxfdk9
 MgbVtiS+jpYfoJ+ZvIeA+dkNX2AIrrcyE93BwpLh2cwNAhXMkfr2YtxK0cNfi303+biB
 nCDNaoQjVIhU3+lAZAblQTmTRxnBZeXLabfuNwl4LMiuyXF2oUfhIbLZV+IYfAjOYUZV
 zdpaDr50LgZrzNxnSRodke3E0bfjjg4ujW5xGJVdRmm+8j4kmKus1AUsfp4BrR2vFBsA
 iDShADtfHP6F+y3GLtISaN/M/+Le6wxAS02wkU5Wa3duDsLZs0yMglkVA1XO8S6SCxIp
 0IhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lRIVhEzHo1XPH6PloaXFLB5fbBAOJPEuMdhJUY10d78=;
 b=UsgpuMHyZP6fO3RsNty9mOBXSzRrHf0ojbY4Jgl36oujjPeY/Ldw95DdT06H8WZ7Sy
 WMr4LNulRwVQXPT3qcgKNW222Y6YEW6rtt/mITsXmhJRkOI/goIf3dy5yT+9QF1vasiy
 CCaZhzpTviQ5zIApl5zRGPEahHAfEOr3pQrevGWTqGxQBJUVqRz/6oRX8t7+PcPYKgHa
 75x9SdcjcFMLNnFk+vkTFEknpjVEpnLD1lynlVpOvdvEJQirilSzLO6DEazLSbgNp7Wu
 HKnXAA8yzgG33qH6nsleB6qQczwb694mNCmCJO5Vu1il7Qm9V6BK5uogR2svN5xOyy1I
 AcOQ==
X-Gm-Message-State: AOAM530AV13bAOX9lesoKumOOztjtXXqtHQeNDz5OlkGTAiDQdnhc9Uw
 v4siZIWFdh0T2zuEKjwuq3SXxQ==
X-Google-Smtp-Source: ABdhPJxlrtIILPxQDoseqNvZPoHazbwPj8/mADx8Oc5ubEbeC4fFUVVOU5nNH/o5DwxLGPvdU7xhrw==
X-Received: by 2002:a17:90a:550e:: with SMTP id
 b14mr305609pji.64.1598594900324; 
 Thu, 27 Aug 2020 23:08:20 -0700 (PDT)
Received: from localhost ([122.167.135.199])
 by smtp.gmail.com with ESMTPSA id a10sm109294pfn.219.2020.08.27.23.08.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Aug 2020 23:08:19 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rnayak@codeaurora.org, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH V2 2/8] drm/lima: Unconditionally call
 dev_pm_opp_of_remove_table()
Date: Fri, 28 Aug 2020 11:37:47 +0530
Message-Id: <62d944bdac75ec696828daad49fc1ddb6c637bcf.1598594714.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1598594714.git.viresh.kumar@linaro.org>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 28 Aug 2020 07:29:10 +0000
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
 Naresh Kamboju <naresh.kamboju@linaro.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
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
