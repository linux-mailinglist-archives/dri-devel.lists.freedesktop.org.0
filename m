Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2257B1E7717
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 09:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8B96E879;
	Fri, 29 May 2020 07:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5306E875;
 Fri, 29 May 2020 07:41:13 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id x11so758350plv.9;
 Fri, 29 May 2020 00:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BHxoRQ8DQnoY6+qppetqlnLxkIDVt5zoxa4p3m8u/9c=;
 b=ellji7MY/0WKhJlAA16EHnWZjBdP6GeHCBtzetRODnhtND5A8NpkX3XOiaZYxELI5o
 /EJZM5ufSJSD2GZA6salH4vhWRXNCQNgHKDguc8jsaJonKLKzu6TnQWArWKxJdbIKhVI
 Mc0/mX5kXZ1MExVuR9FCoMGrJPNsdh6YVdpUe/cKnZphE3E+rTxWTKaCvDrc7XEiFczs
 871TizEFU5Ok3lVcxit+8e0V/4XTg+7R143g2S3K9wqDiU/ZAdAHp0YChjRHKE3isyv3
 UpcDNMhZnZCBvsrUb6GUT/NczeBa7SuydKd0ToWH8ZE2lVqSujZ43/nO38VhiPj/CVHJ
 0gLw==
X-Gm-Message-State: AOAM531uxrh4OAUCR71aCSW6jRI3wKeaBDLe1yVvSm6SPoPK8ubkd7Ko
 76YMfCmmdP16mqkSVjjh7jg=
X-Google-Smtp-Source: ABdhPJz9K7PsnpIxJ4x5guwmAs1js3ue6vgA1iDyjZ0vgKrdY1ea32qFpSEMLF6sE+IfeMdGGrIA9g==
X-Received: by 2002:a17:90b:4c4b:: with SMTP id
 np11mr8141669pjb.58.1590738073301; 
 Fri, 29 May 2020 00:41:13 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id hb3sm7267617pjb.57.2020.05.29.00.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 00:41:12 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 3DF66422E5; Fri, 29 May 2020 07:41:10 +0000 (UTC)
From: Luis Chamberlain <mcgrof@kernel.org>
To: keescook@chromium.org, yzaikin@google.com, nixiaoming@huawei.com,
 ebiederm@xmission.com, axboe@kernel.dk, clemens@ladisch.de, arnd@arndb.de,
 gregkh@linuxfoundation.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, benh@kernel.crashing.org, rdna@fb.com,
 viro@zeniv.linux.org.uk, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com, vbabka@suse.cz, sfr@canb.auug.org.au,
 jack@suse.cz, amir73il@gmail.com, rafael@kernel.org, tytso@mit.edu
Subject: [PATCH 02/13] cdrom: use new sysctl subdir helper
 register_sysctl_subdir()
Date: Fri, 29 May 2020 07:40:57 +0000
Message-Id: <20200529074108.16928-3-mcgrof@kernel.org>
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

// pycocci sysctl-subdir.cocci drivers/cdrom/cdrom.c

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
 drivers/cdrom/cdrom.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
index a0a7ae705de8..3c638f464cef 100644
--- a/drivers/cdrom/cdrom.c
+++ b/drivers/cdrom/cdrom.c
@@ -3719,26 +3719,6 @@ static struct ctl_table cdrom_table[] = {
 	{ }
 };
 
-static struct ctl_table cdrom_cdrom_table[] = {
-	{
-		.procname	= "cdrom",
-		.maxlen		= 0,
-		.mode		= 0555,
-		.child		= cdrom_table,
-	},
-	{ }
-};
-
-/* Make sure that /proc/sys/dev is there */
-static struct ctl_table cdrom_root_table[] = {
-	{
-		.procname	= "dev",
-		.maxlen		= 0,
-		.mode		= 0555,
-		.child		= cdrom_cdrom_table,
-	},
-	{ }
-};
 static struct ctl_table_header *cdrom_sysctl_header;
 
 static void cdrom_sysctl_register(void)
@@ -3748,7 +3728,8 @@ static void cdrom_sysctl_register(void)
 	if (!atomic_add_unless(&initialized, 1, 1))
 		return;
 
-	cdrom_sysctl_header = register_sysctl_table(cdrom_root_table);
+	cdrom_sysctl_header = register_sysctl_subdir("dev", "cdrom",
+						     cdrom_table);
 
 	/* set the defaults */
 	cdrom_sysctl_settings.autoclose = autoclose;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
