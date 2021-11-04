Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CECE244528A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 12:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43126E110;
	Thu,  4 Nov 2021 11:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591A66E110
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 11:52:36 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id r8so5341069qkp.4
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Nov 2021 04:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iEj6bCr3w4Ms+m1RU60Hcm+FAOJ4d8yd2N73VNFTfd0=;
 b=mrQ6Of4s3v6Ccg2apzzdjspvbk4NPScYzDtabmQaAxEJC4iNw07qwda1qNANqY7KAP
 190e52AZEmBu6AEgJ3Z+CjLLNUkXu165GhxjZYEhrA0YQXcs82bQTLA9EaC+h0W5BkKi
 gxvo+nAxW+5GydXQjsDCm9VWwaPlx+VHVBW5AAKLyutWREknBPPCwjM8g8qIYvVTJzNr
 CdUdoGuZZtLKhoXvxZsDrG4DJsq4sCGMrlP2y0/jJF0G2xHl7sSUs2995xWilz7vf2EP
 tglOuG4jFfnp4TxHjnxUeFZbm6HzBSJXjMjhvh/E5+o610CgLRAwB8U+3LBFz7lvdKtt
 64Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iEj6bCr3w4Ms+m1RU60Hcm+FAOJ4d8yd2N73VNFTfd0=;
 b=7wjcMe74ZnTzZq2VrMFoy1cCrFeeQXfp6qf1Y/E3jbuRdV5segIo9Uckn9RJnxSBo3
 kQF0vsO2mxhbKkFcr1Vfn7n8hTuSFT4qw7eJ+zHmMxXcMbZOwFfIzyDCp8YMIbz4ZZQx
 bTElHj+Ui9L2zrU89And4FRqvTtF4e7bune+Z2R/cHHmjxQPcdxpsIhqL0omcccuH3MD
 B5lL6tvwtykm8YZUq4wCCcI+kCOjPhhNe/FetM9GRqMDUXcJYF1bOwoh4PBLA/canXlX
 3VaUEvVo6iIW+PP0V4zMCpCSexpCZS87jXCpiC9KRC2b6tipa3M7vcN+yGJmVMUn/EIr
 25TQ==
X-Gm-Message-State: AOAM533wDjw8Y76cLmCI3wcZavqICrrmzJsDN5o6wq1fNh4Od7+UIkUv
 iqWTRGwpnRrM67N/LVHHQRI=
X-Google-Smtp-Source: ABdhPJwNewhxjYRmZA4neTjQcNtlBxYfKrJlI3qVWNpGxig3My1dBO3r00nsSgxuR5nIx8p0PRZhSA==
X-Received: by 2002:a05:620a:4411:: with SMTP id
 v17mr39322514qkp.431.1636026755561; 
 Thu, 04 Nov 2021 04:52:35 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id o20sm3532718qkp.100.2021.11.04.04.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 04:52:35 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: yao.jing2@zte.com.cn
To: bernie@plugable.com
Subject: [PATCH] video: udlfb: replace snprintf in show functions with
 sysfs_emit
Date: Thu,  4 Nov 2021 11:52:29 +0000
Message-Id: <20211104115229.31821-1-yao.jing2@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-fbdev@vger.kernel.org, Jing Yao <yao.jing2@zte.com.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Zeal Robot <zealci@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jing Yao <yao.jing2@zte.com.cn>

coccicheck complains about the use of snprintf() in sysfs show
functions:
WARNING use scnprintf or sprintf

Use sysfs_emit instead of scnprintf, snprintf or sprintf makes more
sense.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jing Yao <yao.jing2@zte.com.cn>
---
 drivers/video/fbdev/udlfb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index b9cdd02c1000..90f48b71fd8f 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -1426,7 +1426,7 @@ static ssize_t metrics_bytes_rendered_show(struct device *fbdev,
 				   struct device_attribute *a, char *buf) {
 	struct fb_info *fb_info = dev_get_drvdata(fbdev);
 	struct dlfb_data *dlfb = fb_info->par;
-	return snprintf(buf, PAGE_SIZE, "%u\n",
+	return sysfs_emit(buf, "%u\n",
 			atomic_read(&dlfb->bytes_rendered));
 }
 
@@ -1434,7 +1434,7 @@ static ssize_t metrics_bytes_identical_show(struct device *fbdev,
 				   struct device_attribute *a, char *buf) {
 	struct fb_info *fb_info = dev_get_drvdata(fbdev);
 	struct dlfb_data *dlfb = fb_info->par;
-	return snprintf(buf, PAGE_SIZE, "%u\n",
+	return sysfs_emit(buf, "%u\n",
 			atomic_read(&dlfb->bytes_identical));
 }
 
@@ -1442,7 +1442,7 @@ static ssize_t metrics_bytes_sent_show(struct device *fbdev,
 				   struct device_attribute *a, char *buf) {
 	struct fb_info *fb_info = dev_get_drvdata(fbdev);
 	struct dlfb_data *dlfb = fb_info->par;
-	return snprintf(buf, PAGE_SIZE, "%u\n",
+	return sysfs_emit(buf, "%u\n",
 			atomic_read(&dlfb->bytes_sent));
 }
 
@@ -1450,7 +1450,7 @@ static ssize_t metrics_cpu_kcycles_used_show(struct device *fbdev,
 				   struct device_attribute *a, char *buf) {
 	struct fb_info *fb_info = dev_get_drvdata(fbdev);
 	struct dlfb_data *dlfb = fb_info->par;
-	return snprintf(buf, PAGE_SIZE, "%u\n",
+	return sysfs_emit(buf, "%u\n",
 			atomic_read(&dlfb->cpu_kcycles_used));
 }
 
-- 
2.25.1

