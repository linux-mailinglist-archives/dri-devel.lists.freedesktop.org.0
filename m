Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E501E7723
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 09:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824816E87F;
	Fri, 29 May 2020 07:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086C96E87F;
 Fri, 29 May 2020 07:41:19 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id a13so766156pls.8;
 Fri, 29 May 2020 00:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GvzomajvqaDlmHgD5CFBW/9i29+5hKQDe8Dyx3XaSq4=;
 b=SZBEfcOqZQ2NiXdiP1Rh1N54Q4Yiv1pANs5qcWeA6T+cP1w2p7YoCeriF1iI2QrVwI
 eEZAZwZpB0PkdCv0nQs17d8ZiqPectF7qvqXR5PUaR17PHl81vtOSWDk7JWvbN6I2d1i
 wObieH7ANeRbw5GXaBITNt6MaSlGYpb9pEC2HH7I9ipWDT74nuYmTAZ4qVSW2JjKU1w8
 TRyWCFMEJVT/cltAz3iUkKfR2zP0qec9TVS74S7qgTPdeOjfLLAcB3RSAY5ozBUBL5u2
 4+XL5YeTAZ8szdAxjVKvqN3+5IxkIYHK4pBhq5xBeVf4IAQ9D8aKaNKprxTleHkQyYIc
 v2QA==
X-Gm-Message-State: AOAM53076kmH4s7de1AFY/FnXv+JNrb+SW+V4qOoU2kKO/jC7Uew9kUs
 FYoZy8J9E3GosNdHGUkHIZs=
X-Google-Smtp-Source: ABdhPJzaH+urrC8l82AOcunlppRYvCYY8eRn8tjh5bOS5g7bJ5viHl156VGCztJ4ox/+xnpOBndUZg==
X-Received: by 2002:a17:902:7001:: with SMTP id
 y1mr7344091plk.114.1590738078586; 
 Fri, 29 May 2020 00:41:18 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id gd1sm7404001pjb.14.2020.05.29.00.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 00:41:16 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id BDFF742340; Fri, 29 May 2020 07:41:10 +0000 (UTC)
From: Luis Chamberlain <mcgrof@kernel.org>
To: keescook@chromium.org, yzaikin@google.com, nixiaoming@huawei.com,
 ebiederm@xmission.com, axboe@kernel.dk, clemens@ladisch.de, arnd@arndb.de,
 gregkh@linuxfoundation.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, benh@kernel.crashing.org, rdna@fb.com,
 viro@zeniv.linux.org.uk, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com, vbabka@suse.cz, sfr@canb.auug.org.au,
 jack@suse.cz, amir73il@gmail.com, rafael@kernel.org, tytso@mit.edu
Subject: [PATCH 06/13] ocfs2: use new sysctl subdir helper
 register_sysctl_subdir()
Date: Fri, 29 May 2020 07:41:01 +0000
Message-Id: <20200529074108.16928-7-mcgrof@kernel.org>
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

This simplifies the code considerably. The following coccinelle
SmPL grammar rule was used to transform this code.

// pycocci sysctl-subdir.cocci fs/ocfs2/stackglue.c

@c1@
expression E1;
identifier subdir, sysctls;
@@

static struct ctl_table subdir[] = {
	{
		.procname = E1,
		.maxlen = 0,
		.mode = 0555,
		.child = sysctls,
	},
	{ }
};

@c2@
identifier c1.subdir;

expression E2;
identifier base;
@@

static struct ctl_table base[] = {
	{
		.procname = E2,
		.maxlen = 0,
		.mode = 0555,
		.child = subdir,
	},
	{ }
};

@c3@
identifier c2.base;
identifier header;
@@

header = register_sysctl_table(base);

@r1 depends on c1 && c2 && c3@
expression c1.E1;
identifier c1.subdir, c1.sysctls;
@@

-static struct ctl_table subdir[] = {
-	{
-		.procname = E1,
-		.maxlen = 0,
-		.mode = 0555,
-		.child = sysctls,
-	},
-	{ }
-};

@r2 depends on c1 && c2 && c3@
identifier c1.subdir;

expression c2.E2;
identifier c2.base;
@@
-static struct ctl_table base[] = {
-	{
-		.procname = E2,
-		.maxlen = 0,
-		.mode = 0555,
-		.child = subdir,
-	},
-	{ }
-};

@r3 depends on c1 && c2 && c3@
expression c1.E1;
identifier c1.sysctls;
expression c2.E2;
identifier c2.base;
identifier c3.header;
@@

header =
-register_sysctl_table(base);
+register_sysctl_subdir(E2, E1, sysctls);

Generated-by: Coccinelle SmPL

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 fs/ocfs2/stackglue.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/fs/ocfs2/stackglue.c b/fs/ocfs2/stackglue.c
index a191094694c6..addafced7f59 100644
--- a/fs/ocfs2/stackglue.c
+++ b/fs/ocfs2/stackglue.c
@@ -677,28 +677,8 @@ static struct ctl_table ocfs2_mod_table[] = {
 	},
 	{ }
 };
-
-static struct ctl_table ocfs2_kern_table[] = {
-	{
-		.procname	= "ocfs2",
-		.data		= NULL,
-		.maxlen		= 0,
-		.mode		= 0555,
-		.child		= ocfs2_mod_table
-	},
-	{ }
-};
-
-static struct ctl_table ocfs2_root_table[] = {
-	{
-		.procname	= "fs",
-		.data		= NULL,
-		.maxlen		= 0,
-		.mode		= 0555,
-		.child		= ocfs2_kern_table
-	},
-	{ }
-};
+	.data		= NULL,
+	.data		= NULL,
 
 static struct ctl_table_header *ocfs2_table_header;
 
@@ -711,7 +691,8 @@ static int __init ocfs2_stack_glue_init(void)
 {
 	strcpy(cluster_stack_name, OCFS2_STACK_PLUGIN_O2CB);
 
-	ocfs2_table_header = register_sysctl_table(ocfs2_root_table);
+	ocfs2_table_header = register_sysctl_subdir("fs", "ocfs2",
+						    ocfs2_mod_table);
 	if (!ocfs2_table_header) {
 		printk(KERN_ERR
 		       "ocfs2 stack glue: unable to register sysctl\n");
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
