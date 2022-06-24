Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCE0559494
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 10:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D779F11223F;
	Fri, 24 Jun 2022 08:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2A810FB37;
 Fri, 24 Jun 2022 08:04:50 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id cf14so2302222edb.8;
 Fri, 24 Jun 2022 01:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ltQpZ7oW1QsVH1f1jCapXhBdDu/pMzI69BR3W0aWJiY=;
 b=BCLBGzCDM3dicFZ1OGIFkOsdf2V521mMysBEJ9iinveVKjuPTsLrqFdJi734Z1uZvp
 BrIl/Z9vn8vFkyDOHWmnKxo21xK+tLMDYTST34w4v8TV5nWFn9JLHMcOYZM1aHPYbEeD
 282A6fO+GqmoGy5VHzTzkXXC9jDOLaPtweOGDMSO0oqWtHIb7gpQJUaCuMu88rOwe2BD
 crWt+l2Vv9WpcgtJbnfxcqiFAzAJtXlpuRnoAfr2x/1dRrw8Nn1n/TUXtsDtfcmdgOF3
 YGwme/GeeP+MA8N7frvR6cGiLzhNFciaj5ku28X9lFYuS1JLv1ymQIO3PkoxpTVbMdZb
 ASwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ltQpZ7oW1QsVH1f1jCapXhBdDu/pMzI69BR3W0aWJiY=;
 b=lYbMKuRlrxopH5uARynrZSMJ1siUlyNnfPRPE29Z+PBBuSm8Ipn1qoSlCpfa4+u3yG
 NByaGocrWJxT2/SpEyBaUGV/lDvhy7t0nJNhNpEVHQgvkZK0nKBUjhfPZvMN/8eTKXug
 HSFBSduSxevcsvUAMSvAMC4JtAbL/c4iCqM1OBwDDGQBhNRcdEq+KsS15B35ZiNhXYFa
 4bIKmjif4Unnhh4LAgSrbkcu7XSC0zhWUvN8RZE4oTMExx5RuIInNMsSj9rWUHFKvd9H
 OxKAh3KJ5j4jDjtmvqpUIzn8HzhRqZYc/5grtRAPUurLF4SOhFEKEG1sMQqK5LEXwEEG
 kuYA==
X-Gm-Message-State: AJIora8x5GEt0VkmH7Fsbfcb9la3gSlpkR2xcI5PYAjlackvalwREHaE
 fhZAnQG/TBidpigu4sOweSs=
X-Google-Smtp-Source: AGRyM1vqTm2oWNscqLmlMW8s9dcXBhWIE7N6JaZpirobITGNlD2rMAul00q8pM0x95n+ay4p5Kh9SQ==
X-Received: by 2002:a05:6402:358c:b0:435:9daf:e825 with SMTP id
 y12-20020a056402358c00b004359dafe825mr16018406edc.375.1656057889076; 
 Fri, 24 Jun 2022 01:04:49 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a170906155300b006fea43db5c1sm697779ejd.21.2022.06.24.01.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:04:48 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 01/14] fs: add per file RSS
Date: Fri, 24 Jun 2022 10:04:31 +0200
Message-Id: <20220624080444.7619-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624080444.7619-1-christian.koenig@amd.com>
References: <20220624080444.7619-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: mhocko@suse.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Some files allocate large amounts of memory on behalf of userspace without
any on disk backing store. This memory isn't necessarily mapped into the
address space, but should still accounts towards the RSS of a process just
like mapped shared pages do.

That information can then be used by the OOM killer to make better
decisions which process to reap.

For easy debugging this also adds printing of the per file RSS to fdinfo.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
---
 fs/file.c               | 23 +++++++++++++++++++++++
 fs/proc/fd.c            |  3 +++
 include/linux/fdtable.h |  1 +
 include/linux/fs.h      |  1 +
 4 files changed, 28 insertions(+)

diff --git a/fs/file.c b/fs/file.c
index 3bcc1ecc314a..b58730a513be 100644
--- a/fs/file.c
+++ b/fs/file.c
@@ -1307,3 +1307,26 @@ int iterate_fd(struct files_struct *files, unsigned n,
 	return res;
 }
 EXPORT_SYMBOL(iterate_fd);
+
+static int sumup_file_rss(const void *sum, struct file *file, unsigned n)
+{
+	if (!file->f_op->file_rss)
+		return 0;
+
+	*((unsigned long *)sum) += file->f_op->file_rss(file);
+	return 0;
+}
+
+/**
+ * files_rss- how much resources are bound by opened files
+ * @files: opened files
+ *
+ * Returns sum of all resources bound by files not accounted in file systems.
+ */
+unsigned long files_rss(struct files_struct *files)
+{
+	unsigned long sum = 0;
+
+	iterate_fd(files, 0, sumup_file_rss, &sum);
+	return sum;
+}
diff --git a/fs/proc/fd.c b/fs/proc/fd.c
index 913bef0d2a36..9943bfca74f7 100644
--- a/fs/proc/fd.c
+++ b/fs/proc/fd.c
@@ -59,6 +59,9 @@ static int seq_show(struct seq_file *m, void *v)
 		   real_mount(file->f_path.mnt)->mnt_id,
 		   file_inode(file)->i_ino);
 
+	if (file->f_op->file_rss)
+		seq_printf(m, "rss:\t%lu\n", file->f_op->file_rss(file));
+
 	/* show_fd_locks() never deferences files so a stale value is safe */
 	show_fd_locks(m, file, files);
 	if (seq_has_overflowed(m))
diff --git a/include/linux/fdtable.h b/include/linux/fdtable.h
index e066816f3519..101770266f38 100644
--- a/include/linux/fdtable.h
+++ b/include/linux/fdtable.h
@@ -122,6 +122,7 @@ void do_close_on_exec(struct files_struct *);
 int iterate_fd(struct files_struct *, unsigned,
 		int (*)(const void *, struct file *, unsigned),
 		const void *);
+unsigned long files_rss(struct files_struct *files);
 
 extern int close_fd(unsigned int fd);
 extern int __close_range(unsigned int fd, unsigned int max_fd, unsigned int flags);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 9ad5e3520fae..edacbdce5e4c 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2003,6 +2003,7 @@ struct file_operations {
 				   loff_t len, unsigned int remap_flags);
 	int (*fadvise)(struct file *, loff_t, loff_t, int);
 	int (*uring_cmd)(struct io_uring_cmd *ioucmd, unsigned int issue_flags);
+	long (*file_rss)(struct file *);
 } __randomize_layout;
 
 struct inode_operations {
-- 
2.25.1

