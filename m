Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1140D45AD58
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 21:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B347B6E440;
	Tue, 23 Nov 2021 20:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAE56E15A;
 Tue, 23 Nov 2021 20:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=2Kv6Hoi+4rCR0xeNRjHAEL5W0WSj9wKutSwhTDgIue0=; b=Qi+WT89v/gxTJXFJzgrSOMN/j4
 4rOnaodA9SoHPCBfgiqmeZiDb9Jip9L6gfN5zh0+xw5x4zfJ4tLm4LZ94MxfX4/cLHomKT0GwITKC
 9JKt82tHX3MTqRxl7aN/V4975++ctv4fIwYEPkqZkHvAHJfopfoEHsRYRiFgmyCHxgftAKWfdMF2/
 SmnjX2hTOKP+Oxfb6PzrLZBzoPt4nF4yxh8DXwEjGSb01g4HHQZ1Hn0j2YOj9Nxm9GIXwnXNhSyHW
 jKIKQ0iWXm4zNAWEvO+0EJlgTdTI2EhA8Cvgg6jItc3zff4jfmPQAZ8GwgHNOUzyk/a//6tVVHsr4
 E+oWRjRw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mpcL1-003R5D-7B; Tue, 23 Nov 2021 20:24:23 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: akpm@linux-foundation.org, keescook@chromium.org,
	yzaikin@google.com, nixiaoming@huawei.com, ebiederm@xmission.com,
	clemens@ladisch.de, arnd@arndb.de, gregkh@linuxfoundation.org,
	jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
	airlied@linux.ie, "daniel@ffwll.chairlied"@linux.ie,
	benh@kernel.crashing.org, mark@fasheh.com, jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com, jack@suse.cz, amir73il@gmail.com,
	phil@philpotter.co.uk, viro@zeniv.linux.org.uk, julia.lawall@inria.fr
Subject: [PATCH v2 1/8] hpet: simplify subdirectory registration with
 register_sysctl()
Date: Tue, 23 Nov 2021 12:24:15 -0800
Message-Id: <20211123202422.819032-2-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211123202422.819032-1-mcgrof@kernel.org>
References: <20211123202422.819032-1-mcgrof@kernel.org>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need to user boiler plate code to specify a set of base
directories we're going to stuff sysctls under. Simplify this by using
register_sysctl() and specifying the directory path directly.

// pycocci sysctl-subdir-register-sysctl-simplify.cocci drivers/char/hpet.c

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

@initialize:python@
@@

def make_my_fresh_expression(s1, s2):
  return '"' + s1.strip('"') + "/" + s2.strip('"') + '"'

@r3 depends on c1 && c2 && c3@
expression c1.E1;
identifier c1.sysctls;
expression c2.E2;
identifier c2.base;
identifier c3.header;
fresh identifier E3 = script:python(E2, E1) { make_my_fresh_expression(E2, E1) };
@@

header =
-register_sysctl_table(base);
+register_sysctl(E3, sysctls);

Generated-by: Coccinelle SmPL
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/char/hpet.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/char/hpet.c b/drivers/char/hpet.c
index 4e5431f01450..563dfae3b8da 100644
--- a/drivers/char/hpet.c
+++ b/drivers/char/hpet.c
@@ -746,26 +746,6 @@ static struct ctl_table hpet_table[] = {
 	{}
 };
 
-static struct ctl_table hpet_root[] = {
-	{
-	 .procname = "hpet",
-	 .maxlen = 0,
-	 .mode = 0555,
-	 .child = hpet_table,
-	 },
-	{}
-};
-
-static struct ctl_table dev_root[] = {
-	{
-	 .procname = "dev",
-	 .maxlen = 0,
-	 .mode = 0555,
-	 .child = hpet_root,
-	 },
-	{}
-};
-
 static struct ctl_table_header *sysctl_header;
 
 /*
@@ -1061,7 +1041,7 @@ static int __init hpet_init(void)
 	if (result < 0)
 		return -ENODEV;
 
-	sysctl_header = register_sysctl_table(dev_root);
+	sysctl_header = register_sysctl("dev/hpet", hpet_table);
 
 	result = acpi_bus_register_driver(&hpet_acpi_driver);
 	if (result < 0) {
-- 
2.33.0

