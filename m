Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 319481AA914
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 15:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2886E9E2;
	Wed, 15 Apr 2020 13:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9E66E9E2;
 Wed, 15 Apr 2020 13:53:54 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id r20so1529482pfh.9;
 Wed, 15 Apr 2020 06:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=APD8naIxhIgzrQrp0S3J3+YjemTB4ReRwsyGwC+Q20E=;
 b=Rf8H7V6Ky/3QcXQkzOBLEIoKfF31DR/myN5wOLOoNe7AsinkMNIemTHpwPDHGkrN2m
 3Lr0ZzL/y2ldNsxOpD5aQsK0ZAmdlS+eJkC11c+aTSW8DQXchJh1Mgo4GL2DMuARLg5h
 4AzRBNKfM/HMbwAZzDSyndmz4OVDsSsxEt4HaYJ29nf3K76MqHo9DqE0U5vUU/ijZALf
 9Zn8H0wrnUhJB3+QRTtXwkMsldHnlCnwtLBlGEm4QA9L5UNywkG9d1qvXFYD9dEYBkuk
 44ukj4D4+UKaTokF6UnVazHAcka2Uk9xkThctNdpYKvL5VHUutfUhtI3c/oZLsgqjl8P
 hClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=APD8naIxhIgzrQrp0S3J3+YjemTB4ReRwsyGwC+Q20E=;
 b=rhymY01TkaHQNqVLkNrEzYU1B8Kjf1kZzmabx02dJuRnDWbBcR3AmC8ZuSRCv3jisz
 SE/CA7T/TWViSwHnKoFfjkxaBSREN6eipW5uyN5qLRtBqlty2fBaShw4dI/eDYKEtmXd
 e26ptUuEUmp2W2x5o4UoiMKOKET61NaRX4qXMyZ+ikeYTfIykoDs0JrUeNweiuaQ4rjt
 oFHgmTrWq6zrq2z0D9pJeUCo6LL6sJ7SnGZLSx50fUm8GHzyWwZWF3j0oAMzLcsLJxCt
 8Zzyta14Dm2JSwPTqSmkpZIPEuvt8APnjMU9edQm8yHubdrFmPP45Z55Z1Z1o+ZiOmvZ
 VF2w==
X-Gm-Message-State: AGi0PuYIdcuMexW1Q8SssVrHWaQLCclXcONRnNDPGnHxVjwq+Y5/Eriq
 VBCq6TaFP42jXHm/00GmxGW7917mMijptw==
X-Google-Smtp-Source: APiQypL8kq0dJNbt8OSn7TFiXbKTg+jj/ASY79ngDF1X/0/ru3Rmh5EUCx2/13rjAOrROdh0SFC6DQ==
X-Received: by 2002:a63:d40a:: with SMTP id a10mr25888822pgh.53.1586958834274; 
 Wed, 15 Apr 2020 06:53:54 -0700 (PDT)
Received: from yuq-Aspire-4738G.lan (li2017-195.members.linode.com.
 [172.105.124.195])
 by smtp.gmail.com with ESMTPSA id z1sm3331069pjt.42.2020.04.15.06.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 06:53:53 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/lima: add pm resume/suspend
Date: Wed, 15 Apr 2020 21:52:08 +0800
Message-Id: <20200415135208.8960-5-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200415135208.8960-1-yuq825@gmail.com>
References: <20200415135208.8960-1-yuq825@gmail.com>
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

Do hardware resume/suspend.

Tested-by: Bhushan Shah <bshah@kde.org>
Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_device.c | 65 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/lima/lima_device.h |  3 ++
 drivers/gpu/drm/lima/lima_drv.c    |  7 ++++
 3 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/lima_device.c
index e5f1f84ba85a..aca2cab9899b 100644
--- a/drivers/gpu/drm/lima/lima_device.c
+++ b/drivers/gpu/drm/lima/lima_device.c
@@ -213,6 +213,27 @@ static void lima_fini_ip(struct lima_device *ldev, int index)
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
@@ -408,3 +429,47 @@ void lima_device_fini(struct lima_device *ldev)
 
 	lima_clk_fini(ldev);
 }
+
+int lima_device_resume(struct device *dev)
+{
+	struct lima_device *ldev = dev_get_drvdata(dev);
+	int i, err;
+
+	for (i = 0; i < lima_ip_num; i++) {
+		err = lima_resume_ip(ldev, i);
+		if (err)
+			goto err_out;
+	}
+
+	err = lima_devfreq_resume(&ldev->devfreq);
+	if (err)
+		goto err_out;
+
+	return 0;
+
+err_out:
+	while (--i >= 0)
+		lima_suspend_ip(ldev, i);
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
+	if (err)
+		return err;
+
+	for (i = lima_ip_num - 1; i >= 0; i--)
+		lima_suspend_ip(ldev, i);
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
index bbbdc8455e2f..be66b448d44e 100644
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
