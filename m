Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEE41B2824
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 15:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D446E96E;
	Tue, 21 Apr 2020 13:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED12D6E96C;
 Tue, 21 Apr 2020 13:38:00 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id a5so594980pjh.2;
 Tue, 21 Apr 2020 06:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p1sZojRZuulpM3UISkxCmzN1CiQezNLcWyLy7dmd0bI=;
 b=BpHGErVzriwKJQa+iIem6oC2UgjjO3J8hDjKOFc1NuOuLnHMMiBhTttJe549egxj0p
 CraHOcdqzukBCRg1L8lMkzsxnHqUBdRQeje3OWiJgw/5XK4kJWu6m+1BAus3UsYOEYAI
 kgAeNaQMGySN8yFOKjbCzOfSf5DqmkNCFHjT77t3XfCkQKLVCPT9R/S+nz3YLLlQ/CJA
 /cJ8bPL/ZGcOHS4KiWkLq1WYK+07WohKryLSjcLBzaVddtV3vJnAVPtgXhBdv7KBgdOB
 IQfNvgRozXtqcSFb46xjU6fLTLNmuTYKPlVuokNWyjfPvl+4bEEWk0w138RqmTsA2FtO
 KX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=p1sZojRZuulpM3UISkxCmzN1CiQezNLcWyLy7dmd0bI=;
 b=gvt6fefi32Epgu/R5rYsdsvy2S7xqKYS4KX1cR4TmExUxAnYj/IRujQ+05FqUGEK7e
 bPbdoEKPQUkoIbXvwbPj4RRqNY4AFSHw9LhZhBFtnzGcSDNV/22xcOfyQYGTalfEXQIf
 9ZUNt6DtRByoMYlOvHxnFO/gGOA1tsH4EPrnpPnIiGKaDGvjtkBcH8TWFH0MgJT/mjKr
 Z9FOC+FHoQ+UUMbOt/cJ585EtHV2N/pYcQxSv+2nblp0oXz8IcqvMhfwXSzJYoTjauqS
 Y2ZwdzE0pG0t3X0tg9L9xKWmCc/VqA04C+EKqmCnft16A+OkaJ5elpVYUYv3v/q6edZW
 GPaw==
X-Gm-Message-State: AGi0PuZl125G8KDf1/tPydnoMylbEG9GGdM5SEJpL91/hYe7z47BPxlr
 LfzPUobTd2q7uHfvDh2DkSou+rRoIvLxbw==
X-Google-Smtp-Source: APiQypIwnbvGglR6uP7HqFJkcFO1y/SceXILfnf8ojcR1pSHjSuRbttBw/1HSWykkLJrO9p2F76dQQ==
X-Received: by 2002:a17:902:8a8f:: with SMTP id
 p15mr21837701plo.45.1587476279840; 
 Tue, 21 Apr 2020 06:37:59 -0700 (PDT)
Received: from yuq-Aspire-4738G.lan (li2017-195.members.linode.com.
 [172.105.124.195])
 by smtp.gmail.com with ESMTPSA id r23sm2551327pfr.64.2020.04.21.06.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:37:59 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 09/10] drm/lima: add pm resume/suspend ops
Date: Tue, 21 Apr 2020 21:35:50 +0800
Message-Id: <20200421133551.31481-10-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421133551.31481-1-yuq825@gmail.com>
References: <20200421133551.31481-1-yuq825@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Bhushan Shah <bshah@kde.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andreas Baierl <ichgeh@imkreisrum.de>, Qiang Yu <yuq825@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add driver pm system and runtime hardware resume/suspend ops.
Note this won't enable runtime pm of the device yet.

v2:
Do clock and power gating when suspend/resume.

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_device.c | 90 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/lima/lima_device.h |  3 +
 drivers/gpu/drm/lima/lima_drv.c    |  7 +++
 3 files changed, 100 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/lima_device.c
index 281e05a8cd4b..8604b7994943 100644
--- a/drivers/gpu/drm/lima/lima_device.c
+++ b/drivers/gpu/drm/lima/lima_device.c
@@ -244,6 +244,27 @@ static void lima_fini_ip(struct lima_device *ldev, int index)
 		desc->fini(ip);
 }
 
+static int lima_resume_ip(struct lima_device *ldev, int index)
+{
+	struct lima_ip_desc *desc = lima_ip_desc + index;
+	struct lima_ip *ip = ldev->ip + index;
+	int ret = 0;
+
+	if (ip->present)
+		ret = desc->resume(ip);
+
+	return ret;
+}
+
+static void lima_suspend_ip(struct lima_device *ldev, int index)
+{
+	struct lima_ip_desc *desc = lima_ip_desc + index;
+	struct lima_ip *ip = ldev->ip + index;
+
+	if (ip->present)
+		desc->suspend(ip);
+}
+
 static int lima_init_gp_pipe(struct lima_device *dev)
 {
 	struct lima_sched_pipe *pipe = dev->pipe + lima_pipe_gp;
@@ -439,3 +460,72 @@ void lima_device_fini(struct lima_device *ldev)
 
 	lima_clk_fini(ldev);
 }
+
+int lima_device_resume(struct device *dev)
+{
+	struct lima_device *ldev = dev_get_drvdata(dev);
+	int i, err;
+
+	err = lima_clk_enable(ldev);
+	if (err) {
+		dev_err(dev, "resume clk fail %d\n", err);
+		return err;
+	}
+
+	err = lima_regulator_enable(ldev);
+	if (err) {
+		dev_err(dev, "resume regulator fail %d\n", err);
+		goto err_out0;
+	}
+
+	for (i = 0; i < lima_ip_num; i++) {
+		err = lima_resume_ip(ldev, i);
+		if (err) {
+			dev_err(dev, "resume ip %d fail\n", i);
+			goto err_out1;
+		}
+	}
+
+	err = lima_devfreq_resume(&ldev->devfreq);
+	if (err) {
+		dev_err(dev, "devfreq resume fail\n");
+		goto err_out1;
+	}
+
+	return 0;
+
+err_out1:
+	while (--i >= 0)
+		lima_suspend_ip(ldev, i);
+	lima_regulator_disable(ldev);
+err_out0:
+	lima_clk_disable(ldev);
+	return err;
+}
+
+int lima_device_suspend(struct device *dev)
+{
+	struct lima_device *ldev = dev_get_drvdata(dev);
+	int i, err;
+
+	/* check any task running */
+	for (i = 0; i < lima_pipe_num; i++) {
+		if (atomic_read(&ldev->pipe[i].base.hw_rq_count))
+			return -EBUSY;
+	}
+
+	err = lima_devfreq_suspend(&ldev->devfreq);
+	if (err) {
+		dev_err(dev, "devfreq suspend fail\n");
+		return err;
+	}
+
+	for (i = lima_ip_num - 1; i >= 0; i--)
+		lima_suspend_ip(ldev, i);
+
+	lima_regulator_disable(ldev);
+
+	lima_clk_disable(ldev);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/lima/lima_device.h b/drivers/gpu/drm/lima/lima_device.h
index 095a0b5f1703..e06d1955f4a3 100644
--- a/drivers/gpu/drm/lima/lima_device.h
+++ b/drivers/gpu/drm/lima/lima_device.h
@@ -141,4 +141,7 @@ static inline int lima_poll_timeout(struct lima_ip *ip, lima_poll_func_t func,
 	return 0;
 }
 
+int lima_device_suspend(struct device *dev);
+int lima_device_resume(struct device *dev);
+
 #endif
diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 91bf5b305e9d..639d1cd3268a 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -5,6 +5,7 @@
 #include <linux/of_platform.h>
 #include <linux/uaccess.h>
 #include <linux/slab.h>
+#include <linux/pm_runtime.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_prime.h>
@@ -452,11 +453,17 @@ static const struct of_device_id dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, dt_match);
 
+static const struct dev_pm_ops lima_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(lima_device_suspend, lima_device_resume, NULL)
+};
+
 static struct platform_driver lima_platform_driver = {
 	.probe      = lima_pdev_probe,
 	.remove     = lima_pdev_remove,
 	.driver     = {
 		.name   = "lima",
+		.pm	= &lima_pm_ops,
 		.of_match_table = dt_match,
 	},
 };
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
