Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB994168C14
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 03:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 428946F5C2;
	Sat, 22 Feb 2020 02:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B34E6F5BC;
 Sat, 22 Feb 2020 02:43:29 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id b185so2253311pfb.7;
 Fri, 21 Feb 2020 18:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ull6T6F5hMcv/eMftiDtP/jzb7nzEx6T9MrULGR8Md0=;
 b=q4fTzOb5myY8NKXwr7Szd1XciCWBxkkp+hLjr8Wf551btH2uE/z7IlYQTr02eP8XwC
 66JezRBK4yJE9rbn61J05VvBbVZAg8sV53F7U/JYydcKFlJ7SjmBujSaR7O+rkqyy7NX
 UpDw074yhMKiVKvfKBafOQ67kgF8ewpxrbqxhprY0i8ya9oboYR/OXQsmnoo9o8iNunr
 1Qg/sL2lbE0jWI1K7mZCLzgZyRhg3BYAr4EG02ObLF3rxS8fT0K6OhxmBh+IY5nXTlmM
 36k1u6qS0iDTKKmbNF4v4DWFy3wKfnCNw0jxODg+/TLf6lUvmKBzEYKwXwuOYJAAaY1d
 +G4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ull6T6F5hMcv/eMftiDtP/jzb7nzEx6T9MrULGR8Md0=;
 b=dsh/P5fzXJeMDWnlhSc4RbwDmjdTgHDQe2pYgSCyF3PTpqf2jfz6/4A9XD+ZAtstJd
 rDCqLZ3Oh1ywWxjyXhXOMnJtqzENQQfMMhnzZlcMVOsJ6tNFmt5ZQgaZB2QA/AukEscs
 gd9EXfhA+giK8RlovpGyFBb41dTdIZ0ven0sAplvckQKhPRkjr7cLVRgCcCvv8jYMbge
 eKS3NlhYYS0tqE42MQYjnvCuNyDbAeIoVr5SA/Y/yJ9bvw4uKbdXUSuNHrm+bUmMUvHU
 MFhU7DCxv8gJMjXR0++MglYtAEx9OrjJeVnTmPVJ1Z4nB/dHUIxN+zT7EtcvmiLMQLHU
 AbBA==
X-Gm-Message-State: APjAAAU1fEcj7UGkH/vYFHiiRVxug1WCalssYpp+wvCzOwHSjjapWgTC
 kDqbGKg2j2sACC9DktYm4+i74WH5TVSE4g==
X-Google-Smtp-Source: APXvYqwFiQ2pZKbuX22NLexd25tTDsgsAcBgXdHjEn8QmzhXjxLRspHNAUj2eiKfKTAgNwC7IXg51g==
X-Received: by 2002:aa7:9359:: with SMTP id 25mr40704570pfn.188.1582339408774; 
 Fri, 21 Feb 2020 18:43:28 -0800 (PST)
Received: from localhost.localdomain ([103.219.195.110])
 by smtp.gmail.com with ESMTPSA id u13sm3797317pjn.29.2020.02.21.18.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 18:43:28 -0800 (PST)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/lima: add error sysfs to export error task dump
Date: Sat, 22 Feb 2020 10:42:09 +0800
Message-Id: <20200222024210.18697-5-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200222024210.18697-1-yuq825@gmail.com>
References: <20200222024210.18697-1-yuq825@gmail.com>
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
 Vasily Khoruzhick <anarsoul@gmail.com>, Andreas Baierl <ichgeh@imkreisrum.de>,
 Qiang Yu <yuq825@gmail.com>, Icenowy Zheng <icenowy@aosc.io>,
 Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Export /sys/class/drm/cardX/device/error sysfs for user read out
error task dump file.

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_drv.c | 93 +++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index e235d4545b6c..8c5adc025902 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -276,6 +276,92 @@ static struct drm_driver lima_drm_driver = {
 	.gem_prime_mmap = drm_gem_prime_mmap,
 };
 
+struct lima_block_reader {
+	void *dst;
+	size_t base;
+	size_t count;
+	size_t off;
+	ssize_t read;
+};
+
+static bool lima_read_block(struct lima_block_reader *reader, void *src, size_t src_size)
+{
+	size_t max_off = reader->base + src_size;
+
+	if (reader->off < max_off) {
+		size_t size = min_t(size_t, max_off - reader->off, reader->count);
+
+		memcpy(reader->dst, src + (reader->off - reader->base), size);
+
+		reader->dst += size;
+		reader->off += size;
+		reader->read += size;
+		reader->count -= size;
+	}
+
+	reader->base = max_off;
+
+	return !!reader->count;
+}
+
+static ssize_t lima_error_state_read(struct file *filp, struct kobject *kobj,
+				     struct bin_attribute *attr, char *buf,
+				     loff_t off, size_t count)
+{
+
+	struct device *dev = kobj_to_dev(kobj);
+	struct lima_device *ldev = dev_get_drvdata(dev);
+	struct lima_sched_error_task *et;
+	struct lima_block_reader reader = {
+		.dst = buf,
+		.count = count,
+		.off = off,
+	};
+
+	mutex_lock(&ldev->error_task_list_lock);
+
+	if (lima_read_block(&reader, &ldev->dump, sizeof(ldev->dump))) {
+		list_for_each_entry(et, &ldev->error_task_list, list) {
+			if (!lima_read_block(&reader, et->data, et->size))
+				break;
+		}
+	}
+
+	mutex_unlock(&ldev->error_task_list_lock);
+	return reader.read;
+}
+
+static ssize_t lima_error_state_write(struct file *file, struct kobject *kobj,
+				      struct bin_attribute *attr, char *buf,
+				      loff_t off, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct lima_device *ldev = dev_get_drvdata(dev);
+	struct lima_sched_error_task *et, *tmp;
+
+	mutex_lock(&ldev->error_task_list_lock);
+
+	list_for_each_entry_safe(et, tmp, &ldev->error_task_list, list) {
+		list_del(&et->list);
+		kvfree(et);
+	}
+
+	ldev->dump.size = 0;
+	ldev->dump.num_tasks = 0;
+
+	mutex_unlock(&ldev->error_task_list_lock);
+
+	return count;
+}
+
+static const struct bin_attribute lima_error_state_attr = {
+	.attr.name = "error",
+	.attr.mode = S_IRUSR | S_IWUSR,
+	.size = 0,
+	.read = lima_error_state_read,
+	.write = lima_error_state_write,
+};
+
 static int lima_pdev_probe(struct platform_device *pdev)
 {
 	struct lima_device *ldev;
@@ -318,6 +404,11 @@ static int lima_pdev_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto err_out2;
 
+	platform_set_drvdata(pdev, ldev);
+
+	if (sysfs_create_bin_file(&ldev->dev->kobj, &lima_error_state_attr))
+		dev_warn(ldev->dev, "fail to create error state sysfs\n");
+
 	return 0;
 
 err_out2:
@@ -334,6 +425,8 @@ static int lima_pdev_remove(struct platform_device *pdev)
 	struct lima_device *ldev = platform_get_drvdata(pdev);
 	struct drm_device *ddev = ldev->ddev;
 
+	sysfs_remove_bin_file(&ldev->dev->kobj, &lima_error_state_attr);
+	platform_set_drvdata(pdev, NULL);
 	drm_dev_unregister(ddev);
 	lima_device_fini(ldev);
 	drm_dev_put(ddev);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
