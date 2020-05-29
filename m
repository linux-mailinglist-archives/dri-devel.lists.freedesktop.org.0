Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E794B1E7726
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 09:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D35B6E888;
	Fri, 29 May 2020 07:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA3C6E88C;
 Fri, 29 May 2020 07:41:21 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id d10so1018372pgn.4;
 Fri, 29 May 2020 00:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sBgsWCIFjc1dCALH3PIiiJW4ZW3ozJ7JvpAnInxDZto=;
 b=S5e1ZrAwMAVs57hU8O5zFmWC5Xq0baiDTVggd89Q2gpKUXEfupBiDvcwgIJckmJKfS
 dw27e5oMZ4R6CpbjYFjVcHb7ilifFs+gmqOek2porx27YABT7MKO8l5UPxDX09VQz5EN
 Dey2GKyiIovJSjWOpv0q01cDhOds5wOPBjsPMfEpWVAKh3s7fxZMYC2iuhkkNDWdknKz
 yzbyWkoDd/0gXiT5UmEl6Ci8T57gA4uZ4xBNN46nHV6IZIGlORoS7UFMpDwV0p8w+4hF
 vh07mMc0nMtsAQiOiNdw4YaExFQLgZthjscHcp9g0HrLO6mfN98h10GOlA1pa68bWn4V
 hF7g==
X-Gm-Message-State: AOAM531nnaFw5EqyOA23oHKfButbnXbMGzKmaUvbKV77RuPPxFPIva72
 y4yHOfh1g1zNj5ovNuUFOaU=
X-Google-Smtp-Source: ABdhPJzuX8lSSg8Aasn2k4DvlaVD+6USysUPj9KRkIoQC5Conauc3KXazu1gR/0/ORcChuqRpyUMwQ==
X-Received: by 2002:aa7:9f5a:: with SMTP id h26mr7127671pfr.51.1590738080556; 
 Fri, 29 May 2020 00:41:20 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id p19sm6115830pfn.216.2020.05.29.00.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 00:41:16 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id C929442341; Fri, 29 May 2020 07:41:10 +0000 (UTC)
From: Luis Chamberlain <mcgrof@kernel.org>
To: keescook@chromium.org, yzaikin@google.com, nixiaoming@huawei.com,
 ebiederm@xmission.com, axboe@kernel.dk, clemens@ladisch.de, arnd@arndb.de,
 gregkh@linuxfoundation.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, benh@kernel.crashing.org, rdna@fb.com,
 viro@zeniv.linux.org.uk, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com, vbabka@suse.cz, sfr@canb.auug.org.au,
 jack@suse.cz, amir73il@gmail.com, rafael@kernel.org, tytso@mit.edu
Subject: [PATCH 07/13] test_sysctl: use new sysctl subdir helper
 register_sysctl_subdir()
Date: Fri, 29 May 2020 07:41:02 +0000
Message-Id: <20200529074108.16928-8-mcgrof@kernel.org>
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

// pycocci sysctl-subdir.cocci lib/test_sysctl.c

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
 lib/test_sysctl.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/lib/test_sysctl.c b/lib/test_sysctl.c
index 84eaae22d3a6..b17581307756 100644
--- a/lib/test_sysctl.c
+++ b/lib/test_sysctl.c
@@ -128,26 +128,6 @@ static struct ctl_table test_table[] = {
 	{ }
 };
 
-static struct ctl_table test_sysctl_table[] = {
-	{
-		.procname	= "test_sysctl",
-		.maxlen		= 0,
-		.mode		= 0555,
-		.child		= test_table,
-	},
-	{ }
-};
-
-static struct ctl_table test_sysctl_root_table[] = {
-	{
-		.procname	= "debug",
-		.maxlen		= 0,
-		.mode		= 0555,
-		.child		= test_sysctl_table,
-	},
-	{ }
-};
-
 static struct ctl_table_header *test_sysctl_header;
 
 static int __init test_sysctl_init(void)
@@ -155,7 +135,8 @@ static int __init test_sysctl_init(void)
 	test_data.bitmap_0001 = kzalloc(SYSCTL_TEST_BITMAP_SIZE/8, GFP_KERNEL);
 	if (!test_data.bitmap_0001)
 		return -ENOMEM;
-	test_sysctl_header = register_sysctl_table(test_sysctl_root_table);
+	test_sysctl_header = register_sysctl_subdir("debug", "test_sysctl",
+						    test_table);
 	if (!test_sysctl_header) {
 		kfree(test_data.bitmap_0001);
 		return -ENOMEM;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
