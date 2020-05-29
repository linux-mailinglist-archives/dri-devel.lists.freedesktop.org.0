Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1478B1E771B
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 09:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E911A6E87C;
	Fri, 29 May 2020 07:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97EE6E87B;
 Fri, 29 May 2020 07:41:14 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id z15so2903018pjb.0;
 Fri, 29 May 2020 00:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ztkbZyMAj8QAP+BJLtRR/lmTCR2M8J8E3LJknwjviqU=;
 b=rMefjZxgUBeXlN80OZ6jnne43tmd7cpRvwgnQExfhGhbgCh8JHVaftLGiNX5wTDKHm
 dVDdZMehl0+V4EhvdygtBzn0bppZz5W5scj/mUYPvT5pnj3MO925jWg+PJLfYsPaJK5i
 McediRVH3erC/E++o99+qvo/gCc1TQ4w1Wb9zL6Iy3YoBE5BvunoDLKPZzx6i6Kff5a4
 EpZb8S+EH56dKBMuiP8e1OSOnybd9oYI5sdmCTjv7xek8YZyz2ZJPK///DcwUJrUgy0a
 DQvc5NgI6jgC92X+Qg4ldpAXGp6zA4vgPOieu/kGCcb7O/tcqWuTd2MAHvQDel4+sF2y
 Dgxw==
X-Gm-Message-State: AOAM530PbLdj+JeBZU7vJeqxuHHGmpVn3KM06SAzKOLmLrSQ4Iewu/qF
 On5i4tK9sRC1bdl+GvO8y/Q=
X-Google-Smtp-Source: ABdhPJwef9VnxevTutof/OWjXxMen8nqP316VSHb8lndoYqWe0y1ALBADBIyXeEXdBPr/HgBfKduig==
X-Received: by 2002:a17:902:bd95:: with SMTP id
 q21mr7959305pls.238.1590738074446; 
 Fri, 29 May 2020 00:41:14 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id e26sm6189878pgl.27.2020.05.29.00.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 00:41:12 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 10D65418C0; Fri, 29 May 2020 07:41:10 +0000 (UTC)
From: Luis Chamberlain <mcgrof@kernel.org>
To: keescook@chromium.org, yzaikin@google.com, nixiaoming@huawei.com,
 ebiederm@xmission.com, axboe@kernel.dk, clemens@ladisch.de, arnd@arndb.de,
 gregkh@linuxfoundation.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, benh@kernel.crashing.org, rdna@fb.com,
 viro@zeniv.linux.org.uk, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com, vbabka@suse.cz, sfr@canb.auug.org.au,
 jack@suse.cz, amir73il@gmail.com, rafael@kernel.org, tytso@mit.edu
Subject: [PATCH 01/13] sysctl: add new register_sysctl_subdir() helper
Date: Fri, 29 May 2020 07:40:56 +0000
Message-Id: <20200529074108.16928-2-mcgrof@kernel.org>
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

Often enough all we need to do is create a subdirectory so that
we can stuff sysctls underneath it. However, *if* that directory
was already created early on the boot sequence we really have no
need to use the full boiler plate code for it, we can just use
local variables to help us guide sysctl to place the new leaf files.

So use a helper to do precisely this.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 include/linux/sysctl.h | 11 +++++++++++
 kernel/sysctl.c        | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/include/linux/sysctl.h b/include/linux/sysctl.h
index ddaa06ddd852..58bc978d4f03 100644
--- a/include/linux/sysctl.h
+++ b/include/linux/sysctl.h
@@ -205,6 +205,9 @@ void unregister_sysctl_table(struct ctl_table_header * table);
 extern int sysctl_init(void);
 extern void register_sysctl_init(const char *path, struct ctl_table *table,
 				 const char *table_name);
+extern struct ctl_table_header *register_sysctl_subdir(const char *base,
+						       const char *subdir,
+						       struct ctl_table *table);
 void do_sysctl_args(void);
 
 extern int pwrsw_enabled;
@@ -223,6 +226,14 @@ static inline struct ctl_table_header *register_sysctl_table(struct ctl_table *
 	return NULL;
 }
 
+static
+inline struct ctl_table_header *register_sysctl_subdir(const char *base,
+						       const char *subdir,
+						       struct ctl_table *table)
+{
+	return NULL;
+}
+
 static inline struct ctl_table_header *register_sysctl_paths(
 			const struct ctl_path *path, struct ctl_table *table)
 {
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 008ac0576ae5..04ff032f2863 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -3195,6 +3195,43 @@ void __init register_sysctl_init(const char *path, struct ctl_table *table,
 	}
 	kmemleak_not_leak(hdr);
 }
+
+struct ctl_table_header *register_sysctl_subdir(const char *base,
+						const char *subdir,
+						struct ctl_table *table)
+{
+	struct ctl_table_header *hdr = NULL;
+	struct ctl_table subdir_table[] = {
+		{
+			.procname	= subdir,
+			.mode		= 0555,
+			.child		= table,
+		},
+		{ }
+	};
+	struct ctl_table base_table[] = {
+		{
+			.procname	= base,
+			.mode		= 0555,
+			.child		= subdir_table,
+		},
+		{ }
+	};
+
+	if (!table->procname)
+		goto out;
+
+	hdr = register_sysctl_table(base_table);
+	if (unlikely(!hdr)) {
+		pr_err("failed when creating subdirectory sysctl %s/%s/%s\n",
+		       base, subdir, table->procname);
+		goto out;
+	}
+	kmemleak_not_leak(hdr);
+out:
+	return hdr;
+}
+EXPORT_SYMBOL_GPL(register_sysctl_subdir);
 #endif /* CONFIG_SYSCTL */
 /*
  * No sense putting this after each symbol definition, twice,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
