Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC671E7725
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 09:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78196E885;
	Fri, 29 May 2020 07:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3D06E893;
 Fri, 29 May 2020 07:41:21 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id m7so769833plt.5;
 Fri, 29 May 2020 00:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EMTldmiu4HpdS3+bhynB06GHRs/PyLwICOClb2SLlV8=;
 b=uRiv54n5lkeb16n660QJGl7g9go+q7pGXS9ZJXSyJhcI6+5Zy96ADWAnx3r63jg/04
 BaOtrxifw3gelDiglMwK1RN9b1qDS5EtH64RC7sfimPB0jMnoHL0vZaUKLlbNuDp+dzj
 JFmjlQz9y1JU+kH7/lD8BG/t10z5unrafCYDa8/04UlMFSzV9ohbl86OWVjGoygo3Bpi
 HpZTHJY1zlYftU0acKhTZNCNTxR7ZuML9jSfSbOQdI1/FivFwPDvkM22k+xVjJc4KgcJ
 JJT9xZD2n6jPPJ+XoMeOToSmRl/iFKGHW3yGhS5jK7enCZj0/5r8yssPiBFYdnL5P/zg
 xOGQ==
X-Gm-Message-State: AOAM533g5jG05m8VEcISnqiSX6dO46cu4PRNfSC9SOxJIfYoqUCsxS92
 5qu+4DKDrH/Xv+nB/UUx1qg=
X-Google-Smtp-Source: ABdhPJw+tLCz0Ai55w1J/TSc/SJ1hmAb/QR0nXrNQObS7m5mw2Mpybr+mAQiJMcxaaq1sxYWrYa58A==
X-Received: by 2002:a17:902:7281:: with SMTP id
 d1mr7887571pll.78.1590738081442; 
 Fri, 29 May 2020 00:41:21 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id gd8sm101244pjb.28.2020.05.29.00.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 00:41:16 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id E7F0642380; Fri, 29 May 2020 07:41:10 +0000 (UTC)
From: Luis Chamberlain <mcgrof@kernel.org>
To: keescook@chromium.org, yzaikin@google.com, nixiaoming@huawei.com,
 ebiederm@xmission.com, axboe@kernel.dk, clemens@ladisch.de, arnd@arndb.de,
 gregkh@linuxfoundation.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, benh@kernel.crashing.org, rdna@fb.com,
 viro@zeniv.linux.org.uk, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com, vbabka@suse.cz, sfr@canb.auug.org.au,
 jack@suse.cz, amir73il@gmail.com, rafael@kernel.org, tytso@mit.edu
Subject: [PATCH 10/13] eventpoll: simplify sysctl declaration with
 register_sysctl_subdir()
Date: Fri, 29 May 2020 07:41:05 +0000
Message-Id: <20200529074108.16928-11-mcgrof@kernel.org>
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

Move epoll_table sysctl to fs/eventpoll.c and remove the
clutter out of kernel/sysctl.c by using register_sysctl_subdir()..

Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 fs/eventpoll.c         | 10 +++++++++-
 include/linux/poll.h   |  2 --
 include/linux/sysctl.h |  1 -
 kernel/sysctl.c        |  7 -------
 4 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index 12eebcdea9c8..957ebc9700e3 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -299,7 +299,7 @@ static LIST_HEAD(tfile_check_list);
 static long long_zero;
 static long long_max = LONG_MAX;
 
-struct ctl_table epoll_table[] = {
+static struct ctl_table epoll_table[] = {
 	{
 		.procname	= "max_user_watches",
 		.data		= &max_user_watches,
@@ -311,6 +311,13 @@ struct ctl_table epoll_table[] = {
 	},
 	{ }
 };
+
+static void __init epoll_sysctls_init(void)
+{
+	register_sysctl_subdir("fs", "epoll", epoll_table);
+}
+#else
+#define epoll_sysctls_init() do { } while (0)
 #endif /* CONFIG_SYSCTL */
 
 static const struct file_operations eventpoll_fops;
@@ -2422,6 +2429,7 @@ static int __init eventpoll_init(void)
 	/* Allocates slab cache used to allocate "struct eppoll_entry" */
 	pwq_cache = kmem_cache_create("eventpoll_pwq",
 		sizeof(struct eppoll_entry), 0, SLAB_PANIC|SLAB_ACCOUNT, NULL);
+	epoll_sysctls_init();
 
 	return 0;
 }
diff --git a/include/linux/poll.h b/include/linux/poll.h
index 1cdc32b1f1b0..a9e0e1c2d1f2 100644
--- a/include/linux/poll.h
+++ b/include/linux/poll.h
@@ -8,12 +8,10 @@
 #include <linux/wait.h>
 #include <linux/string.h>
 #include <linux/fs.h>
-#include <linux/sysctl.h>
 #include <linux/uaccess.h>
 #include <uapi/linux/poll.h>
 #include <uapi/linux/eventpoll.h>
 
-extern struct ctl_table epoll_table[]; /* for sysctl */
 /* ~832 bytes of stack space used max in sys_select/sys_poll before allocating
    additional memory. */
 #ifdef __clang__
diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
index aa01f54d0442..e5364b69dd95 100644
--- a/include/linux/sysctl.h
+++ b/include/linux/sysctl.h
@@ -217,7 +217,6 @@ extern int no_unaligned_warning;
 
 extern struct ctl_table sysctl_mount_point[];
 extern struct ctl_table random_table[];
-extern struct ctl_table epoll_table[];
 
 #else /* CONFIG_SYSCTL */
 static inline struct ctl_table_header *register_sysctl_table(struct ctl_table * table)
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index e007375c8a11..5c116904feb7 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -3001,13 +3001,6 @@ static struct ctl_table fs_table[] = {
 		.proc_handler	= proc_dointvec,
 	},
 #endif
-#ifdef CONFIG_EPOLL
-	{
-		.procname	= "epoll",
-		.mode		= 0555,
-		.child		= epoll_table,
-	},
-#endif
 #endif
 	{
 		.procname	= "protected_symlinks",
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
