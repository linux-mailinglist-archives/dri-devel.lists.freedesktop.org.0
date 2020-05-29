Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611031E7727
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 09:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035316E886;
	Fri, 29 May 2020 07:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D016E886;
 Fri, 29 May 2020 07:41:23 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id d10so1018421pgn.4;
 Fri, 29 May 2020 00:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C2AME75dBsNApuZxoQz+ouSeETod/FSpHW6fOtIBoA8=;
 b=PEWN7nskrFm1xHJTzfS3cCzQJvIzCtHjQGFJfNuHszDw65yaXQ4ybACim4HoE4Ikym
 P9O0LSKY0cRX96/F1H05j4MsdnXT/9TSC+mZzOh/YPR/l6/RoNl56X2O2dIsl/5k/EHh
 H9DuB7k0/UIP6FX9n10NYRvKxIa2TTyuS+4t86GxfrMakG2gkFLDClXFOMy5Lg6pkMrv
 jh4W8zWms9fZ5P/fVHc0JeijyM/Y/VkYfS0B3o5txHG6zhT8Ey1WFA7AYJ6rF55YckLU
 d1aqs1LFQypiAmuDjbkQ4hMSj+wTFrEtov/varKEazD683gCciB6C2n3y/pMamTBHYqw
 u/aw==
X-Gm-Message-State: AOAM531mQ71XJSC0exTZVCPo7vPCJX9X47+tB0ddx+joYONCXW4AG/C6
 GAsy+yixInSrFD/OLszNAs4=
X-Google-Smtp-Source: ABdhPJxK/ukzZZOooA7TqKRX6aKFoBfWQ0FrPQYbK4i1DMtq53A2mx5D7MUo+TbjaMx4o+x/3KgfHw==
X-Received: by 2002:a63:711b:: with SMTP id m27mr6911712pgc.324.1590738082579; 
 Fri, 29 May 2020 00:41:22 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id a7sm6766024pfa.187.2020.05.29.00.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 00:41:16 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id F2CEA4238B; Fri, 29 May 2020 07:41:10 +0000 (UTC)
From: Luis Chamberlain <mcgrof@kernel.org>
To: keescook@chromium.org, yzaikin@google.com, nixiaoming@huawei.com,
 ebiederm@xmission.com, axboe@kernel.dk, clemens@ladisch.de, arnd@arndb.de,
 gregkh@linuxfoundation.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, benh@kernel.crashing.org, rdna@fb.com,
 viro@zeniv.linux.org.uk, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com, vbabka@suse.cz, sfr@canb.auug.org.au,
 jack@suse.cz, amir73il@gmail.com, rafael@kernel.org, tytso@mit.edu
Subject: [PATCH 11/13] random: simplify sysctl declaration with
 register_sysctl_subdir()
Date: Fri, 29 May 2020 07:41:06 +0000
Message-Id: <20200529074108.16928-12-mcgrof@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200529074108.16928-1-mcgrof@kernel.org>
References: <20200529074108.16928-1-mcgrof@kernel.org>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, julia.lawall@lip6.fr,
 Luis Chamberlain <mcgrof@kernel.org>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiaoming Ni <nixiaoming@huawei.com>

Move random_table sysctl from kernel/sysctl.c to drivers/char/random.c
and use register_sysctl_subdir() to help remove the clutter out of
kernel/sysctl.c.

Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/char/random.c  | 14 ++++++++++++--
 include/linux/sysctl.h |  1 -
 kernel/sysctl.c        |  5 -----
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index a7cf6aa65908..73fd4b6e9c18 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -2101,8 +2101,7 @@ static int proc_do_entropy(struct ctl_table *table, int write,
 }
 
 static int sysctl_poolsize = INPUT_POOL_WORDS * 32;
-extern struct ctl_table random_table[];
-struct ctl_table random_table[] = {
+static struct ctl_table random_table[] = {
 	{
 		.procname	= "poolsize",
 		.data		= &sysctl_poolsize,
@@ -2164,6 +2163,17 @@ struct ctl_table random_table[] = {
 #endif
 	{ }
 };
+
+/*
+ * rand_initialize() is called before sysctl_init(),
+ * so we cannot call register_sysctl_init() in rand_initialize()
+ */
+static int __init random_sysctls_init(void)
+{
+	register_sysctl_subdir("kernel", "random", random_table);
+	return 0;
+}
+device_initcall(random_sysctls_init);
 #endif 	/* CONFIG_SYSCTL */
 
 struct batched_entropy {
diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
index e5364b69dd95..33a471b56345 100644
--- a/include/linux/sysctl.h
+++ b/include/linux/sysctl.h
@@ -216,7 +216,6 @@ extern int unaligned_dump_stack;
 extern int no_unaligned_warning;
 
 extern struct ctl_table sysctl_mount_point[];
-extern struct ctl_table random_table[];
 
 #else /* CONFIG_SYSCTL */
 static inline struct ctl_table_header *register_sysctl_table(struct ctl_table * table)
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 5c116904feb7..f9a35325d5d5 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -2078,11 +2078,6 @@ static struct ctl_table kern_table[] = {
 		.mode		= 0644,
 		.proc_handler	= sysctl_max_threads,
 	},
-	{
-		.procname	= "random",
-		.mode		= 0555,
-		.child		= random_table,
-	},
 	{
 		.procname	= "usermodehelper",
 		.mode		= 0555,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
