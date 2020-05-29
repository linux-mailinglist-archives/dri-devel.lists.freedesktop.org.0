Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA4F1E771D
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 09:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F356E882;
	Fri, 29 May 2020 07:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D943D6E87D;
 Fri, 29 May 2020 07:41:17 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id n15so826583pjt.4;
 Fri, 29 May 2020 00:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iFuOAMMzx366XD73njtfa9qdyal/YI+SEog1dnntDeg=;
 b=Y4ZzVbd5WnR9Wy4G+3Eu5yHQIzf2oBFp8vR0NFaYAvPBptsv6yOYxE6nyxBtBxdjb0
 o6yCO1Q6eY4PgiVlxsjANt4Vzkp0t5AQZvLj7OIWibpHhoUtMMPbeuwWQgMdGT6w1TL0
 EvwGF54qFyXBtqGjTF/Dyj3nxuOSe1raQjiD5M6pPNhWw48f20GQoz6n2XfJ0IAVUJCE
 PImKf+PIkZn/Ic8aWLlo/Bo/J62HR8ixT1FGdaK3/Avk+w2p52T0+NfQGzktBrrNS2+M
 yZbeB5AP2mlQ/OFcKlA9uNEEw8/RjDYikWFcJBbquy18jHLPlZrJ9IntzypuQN9cYUYn
 378w==
X-Gm-Message-State: AOAM532IS4yJA2uJFH8UgLFLBghYr/++XNYpZwfdJux6p9fo/PxxkyRh
 5rw0iwfPw5mKgUGL/NwsQDI=
X-Google-Smtp-Source: ABdhPJyWq+uNBt+z7g4lF4BNt9x39LLqlR7x3RVbHVyGUC5VKz7sfj4vqnpPnSKalsV1vnr314j4sQ==
X-Received: by 2002:a17:902:82c9:: with SMTP id
 u9mr7568085plz.179.1590738077450; 
 Fri, 29 May 2020 00:41:17 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id 70sm6443717pfx.78.2020.05.29.00.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 00:41:16 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id B233242337; Fri, 29 May 2020 07:41:10 +0000 (UTC)
From: Luis Chamberlain <mcgrof@kernel.org>
To: keescook@chromium.org, yzaikin@google.com, nixiaoming@huawei.com,
 ebiederm@xmission.com, axboe@kernel.dk, clemens@ladisch.de, arnd@arndb.de,
 gregkh@linuxfoundation.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, benh@kernel.crashing.org, rdna@fb.com,
 viro@zeniv.linux.org.uk, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com, vbabka@suse.cz, sfr@canb.auug.org.au,
 jack@suse.cz, amir73il@gmail.com, rafael@kernel.org, tytso@mit.edu
Subject: [PATCH 05/13] macintosh/mac_hid.c: use new sysctl subdir helper
 register_sysctl_subdir()
Date: Fri, 29 May 2020 07:41:00 +0000
Message-Id: <20200529074108.16928-6-mcgrof@kernel.org>
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

// pycocci sysctl-subdir.cocci drivers/macintosh/mac_hid.c

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
 drivers/macintosh/mac_hid.c | 25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/drivers/macintosh/mac_hid.c b/drivers/macintosh/mac_hid.c
index 28b8581b44dd..736d0e151716 100644
--- a/drivers/macintosh/mac_hid.c
+++ b/drivers/macintosh/mac_hid.c
@@ -239,33 +239,12 @@ static struct ctl_table mac_hid_files[] = {
 	{ }
 };
 
-/* dir in /proc/sys/dev */
-static struct ctl_table mac_hid_dir[] = {
-	{
-		.procname	= "mac_hid",
-		.maxlen		= 0,
-		.mode		= 0555,
-		.child		= mac_hid_files,
-	},
-	{ }
-};
-
-/* /proc/sys/dev itself, in case that is not there yet */
-static struct ctl_table mac_hid_root_dir[] = {
-	{
-		.procname	= "dev",
-		.maxlen		= 0,
-		.mode		= 0555,
-		.child		= mac_hid_dir,
-	},
-	{ }
-};
-
 static struct ctl_table_header *mac_hid_sysctl_header;
 
 static int __init mac_hid_init(void)
 {
-	mac_hid_sysctl_header = register_sysctl_table(mac_hid_root_dir);
+	mac_hid_sysctl_header = register_sysctl_subdir("dev", "mac_hid",
+						       mac_hid_files);
 	if (!mac_hid_sysctl_header)
 		return -ENOMEM;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
