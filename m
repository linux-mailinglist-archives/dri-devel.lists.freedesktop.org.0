Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 642241E771C
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 09:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94BE6E87D;
	Fri, 29 May 2020 07:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40E26E87B;
 Fri, 29 May 2020 07:41:16 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id d10so1018283pgn.4;
 Fri, 29 May 2020 00:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/vA3i/UOi3UGtI8x+kS8OZpNUo79BRU7m0khtdFXp1w=;
 b=RtH3pGw4aVr3DhineH3Lyc8JZqi7+fPS+5k3cYbgcug8s/dPrqcCjm50MwfL51sVBW
 X7M+SuJzmyXMS9Cu/Y4wzgt4/JhRIEIiW+G50xFYuRRZIdebSBZcdKc+uXiwt1jCJOZo
 Si6dmRA202cJkjrUsVHj3R9+XV9sb3rswpezLJSm3BpRidGqFgGml7uSgSzV+OCjyeDH
 oIzIbrIEiLhWQSOEqnh50k++/USaE185gJE+uhPsCxBNQqXp2m7gdQ/oznMk0t+HeCds
 c4C+7GOj0SVIzjZbT6N2ycLArq7b/w30G/cmZxuruqwjbNLuYFjqtt3+NvGBvm5VAH/e
 OFRQ==
X-Gm-Message-State: AOAM533Aj7GKfC1pR4su7HuKr2lBzdJpkSyUgfaFQxqp+1J1Rm9RQeVp
 iaxoP28kPi0SkRcnM3MqXKA=
X-Google-Smtp-Source: ABdhPJwVflgyvahnPxBVjITKozn64OGLurCkYnovebI0IemGuS43xiHECvCCud24IYthmkf9lnECTw==
X-Received: by 2002:aa7:8658:: with SMTP id a24mr7517245pfo.135.1590738076317; 
 Fri, 29 May 2020 00:41:16 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id q189sm6758936pfc.112.2020.05.29.00.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 00:41:12 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 916034230A; Fri, 29 May 2020 07:41:10 +0000 (UTC)
From: Luis Chamberlain <mcgrof@kernel.org>
To: keescook@chromium.org, yzaikin@google.com, nixiaoming@huawei.com,
 ebiederm@xmission.com, axboe@kernel.dk, clemens@ladisch.de, arnd@arndb.de,
 gregkh@linuxfoundation.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, benh@kernel.crashing.org, rdna@fb.com,
 viro@zeniv.linux.org.uk, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com, vbabka@suse.cz, sfr@canb.auug.org.au,
 jack@suse.cz, amir73il@gmail.com, rafael@kernel.org, tytso@mit.edu
Subject: [PATCH 04/13] i915: use new sysctl subdir helper
 register_sysctl_subdir()
Date: Fri, 29 May 2020 07:40:59 +0000
Message-Id: <20200529074108.16928-5-mcgrof@kernel.org>
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

// pycocci sysctl-subdir.cocci drivers/gpu/drm/i915/i915_perf.c

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
 drivers/gpu/drm/i915/i915_perf.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 665bb076e84d..52509b573794 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -4203,26 +4203,6 @@ static struct ctl_table oa_table[] = {
 	{}
 };
 
-static struct ctl_table i915_root[] = {
-	{
-	 .procname = "i915",
-	 .maxlen = 0,
-	 .mode = 0555,
-	 .child = oa_table,
-	 },
-	{}
-};
-
-static struct ctl_table dev_root[] = {
-	{
-	 .procname = "dev",
-	 .maxlen = 0,
-	 .mode = 0555,
-	 .child = i915_root,
-	 },
-	{}
-};
-
 /**
  * i915_perf_init - initialize i915-perf state on module bind
  * @i915: i915 device instance
@@ -4383,7 +4363,7 @@ static int destroy_config(int id, void *p, void *data)
 
 void i915_perf_sysctl_register(void)
 {
-	sysctl_header = register_sysctl_table(dev_root);
+	sysctl_header = register_sysctl_subdir("dev", "i915", oa_table);
 }
 
 void i915_perf_sysctl_unregister(void)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
