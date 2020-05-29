Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4390D1E772F
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 09:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD356E88F;
	Fri, 29 May 2020 07:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0876E88F;
 Fri, 29 May 2020 07:41:27 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id ci21so847533pjb.3;
 Fri, 29 May 2020 00:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1PG5LVb0n4wOO6VZREoyBILeBAzco+IYNIeDXsX/FzY=;
 b=kSTs3Y6jlaVPkUFuZMvKMWK2eQPYibhQn2DU5zzzacRDRavzhsc/OEAl6M47zUNRl0
 iljiBndswqbRR5z+uO08uk8EesorXpkDM1+bARnCpYRsJsQe365P4FfY+tQtoqSuiGU4
 LGZ5hlznXpYzJhzEo1LaH114rb0I61M8/nUvWFqKv/zaXiPU3ZNztkbLI9eIWbr5L74G
 VnOrxKF9nwNI24yhtld6hoTJN88vSRQFonkgdHwfK8O3wlJVa3SIARtnU4FsSzPa88CN
 Yf9nNhKHI9/ZFHIxTWvjDHIuSFq8vY4h6Dx/tOf2jujJIfIR9L13i35eYFgluFGdSnzf
 RDGQ==
X-Gm-Message-State: AOAM532OHWLa4nQUS2FAUXjCH6NZAJ+qQ/qEnBoYgcnw9X5R/z6wBQT/
 hcUYih7gICwHyRvqDZLtA18=
X-Google-Smtp-Source: ABdhPJxM98lxrupu0HzIVHkaILQ2GJoC5HA3ATmBk5nOeI56XgjTlxA112dIBe6io3Hl67zR6z+BjQ==
X-Received: by 2002:a17:90a:db0c:: with SMTP id
 g12mr7872171pjv.5.1590738086768; 
 Fri, 29 May 2020 00:41:26 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id q21sm919935pfn.209.2020.05.29.00.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 00:41:25 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 13BC8423BF; Fri, 29 May 2020 07:41:11 +0000 (UTC)
From: Luis Chamberlain <mcgrof@kernel.org>
To: keescook@chromium.org, yzaikin@google.com, nixiaoming@huawei.com,
 ebiederm@xmission.com, axboe@kernel.dk, clemens@ladisch.de, arnd@arndb.de,
 gregkh@linuxfoundation.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, benh@kernel.crashing.org, rdna@fb.com,
 viro@zeniv.linux.org.uk, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com, vbabka@suse.cz, sfr@canb.auug.org.au,
 jack@suse.cz, amir73il@gmail.com, rafael@kernel.org, tytso@mit.edu
Subject: [PATCH 13/13] fs: move binfmt_misc sysctl to its own file
Date: Fri, 29 May 2020 07:41:08 +0000
Message-Id: <20200529074108.16928-14-mcgrof@kernel.org>
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

This moves the binfmt_misc sysctl to its own file to help remove
clutter from kernel/sysctl.c.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 fs/binfmt_misc.c | 1 +
 kernel/sysctl.c  | 7 -------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
index f69a043f562b..656b3f5f3bbf 100644
--- a/fs/binfmt_misc.c
+++ b/fs/binfmt_misc.c
@@ -821,6 +821,7 @@ static int __init init_misc_binfmt(void)
 	int err = register_filesystem(&bm_fs_type);
 	if (!err)
 		insert_binfmt(&misc_format);
+	register_sysctl_empty_subdir("fs", "binfmt_misc");
 	return err;
 }
 
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 460532cd5ac8..7714e7b476c2 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -3042,13 +3042,6 @@ static struct ctl_table fs_table[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_TWO,
 	},
-#if defined(CONFIG_BINFMT_MISC) || defined(CONFIG_BINFMT_MISC_MODULE)
-	{
-		.procname	= "binfmt_misc",
-		.mode		= 0555,
-		.child		= sysctl_mount_point,
-	},
-#endif
 	{
 		.procname	= "pipe-max-size",
 		.data		= &pipe_max_size,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
