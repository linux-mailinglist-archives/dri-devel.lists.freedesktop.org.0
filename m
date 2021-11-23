Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFD545AD50
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 21:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D020A6E429;
	Tue, 23 Nov 2021 20:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBBE6E182;
 Tue, 23 Nov 2021 20:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Tu3sMtoeec1V5uRlOD2gDU/2pD2Jwl8iInc5PNCGP04=; b=BFHJcCQv7mGOljArSyGFVHBZ8x
 7ZlgghZfaVFgGQSiDoJya/lpj4pw4aqSAMfCuBjbXywaqYuXdqLGxxZP0balA6ipJG4qAwzntIIzA
 unOdunQHgouyH6Wwvr32fvMPjRxusAAs76Iei7mjnVLuoXKE0fOjudYgM3pGOEfNfggiNNWmDCBw9
 bbtOB23ZzpxYVBMMtiyFvu85NeV81ydyK98+Bw3NiAk7TZdlvWGJAxFdR2YH67J7JqSBZ3Oq5htan
 OR/xvGv2ToeokuFlU4yo2Pn+rR1gcbGUUdSQDr5EjLaitzsKQyzhsg3rsaNoUZJGisBPaWfXjGj9j
 U1GXmAog==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mpcL1-003R5L-Bf; Tue, 23 Nov 2021 20:24:23 +0000
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
Subject: [PATCH v2 5/8] test_sysctl: simplify subdirectory registration with
 register_sysctl()
Date: Tue, 23 Nov 2021 12:24:19 -0800
Message-Id: <20211123202422.819032-6-mcgrof@kernel.org>
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

// pycocci sysctl-subdir-register-sysctl-simplify.cocci lib/test_sysctl.c

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
 lib/test_sysctl.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/lib/test_sysctl.c b/lib/test_sysctl.c
index 3750323973f4..a5a3d6c27e1f 100644
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
@@ -155,7 +135,7 @@ static int __init test_sysctl_init(void)
 	test_data.bitmap_0001 = kzalloc(SYSCTL_TEST_BITMAP_SIZE/8, GFP_KERNEL);
 	if (!test_data.bitmap_0001)
 		return -ENOMEM;
-	test_sysctl_header = register_sysctl_table(test_sysctl_root_table);
+	test_sysctl_header = register_sysctl("debug/test_sysctl", test_table);
 	if (!test_sysctl_header) {
 		kfree(test_data.bitmap_0001);
 		return -ENOMEM;
-- 
2.33.0

