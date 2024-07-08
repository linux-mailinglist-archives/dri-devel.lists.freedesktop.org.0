Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCB0929F29
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 11:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A1210E11B;
	Mon,  8 Jul 2024 09:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="YnGjuv4H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 6493 seconds by postgrey-1.36 at gabe;
 Mon, 08 Jul 2024 09:35:20 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9B50610E11B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 09:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=2It8D
 mTGwndGT82w+4INHMD+j/7m75zAYwqpz4U8ZAI=; b=YnGjuv4HLXm0JU2HHEawW
 fKXbjMKD4nTiuiGXSGlZRD1v5jTyA/MOTLlRlev+8bwE9jbyAF84VBPE0GGkqHzN
 bKbbF2N0WGyQ6BmVYYEpFWl30Pf2O/5LJBeuwx33wuWp54BGZrfHGnKT5iOaaUKd
 PLI92HoqrYiK3+BxM2IYoY=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzga-smtp-mta-g2-3 (Coremail) with SMTP id _____wDX32rOsotmxHmWBw--.63198S2;
 Mon, 08 Jul 2024 17:35:14 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dri-devel@lists.freedesktop.org
Cc: Andy Yan <andyshrk@gmail.com>
Subject: [PATCH libdrm] modtest: print libdrm version
Date: Mon,  8 Jul 2024 17:35:08 +0800
Message-Id: <20240708093508.3908098-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDX32rOsotmxHmWBw--.63198S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFW5CrW8Zw48Jry3Zr48Xrb_yoWkWwcEg3
 42vrn7GF43Ar1UAFWjvwsrZrWjkw48ZF1furn7JFW3Ja4jgr1qgFn7CF98Way29rW3ZFW3
 tayDJry8Cr42kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU3kuDUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hIWXmWXy3kH8gAAs9
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andy Yan <andyshrk@gmail.com>

Signed-off-by: Andy Yan <andyshrk@gmail.com>
---
 meson.build               | 1 +
 tests/modetest/modetest.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meson.build b/meson.build
index 8fd0a196..fab61e09 100644
--- a/meson.build
+++ b/meson.build
@@ -45,6 +45,7 @@ dep_threads = dependency('threads')
 cc = meson.get_compiler('c')
 
 android = cc.compiles('''int func() { return __ANDROID__; }''')
+add_global_arguments('-DLIBDRM_VERSION="@0@"'.format(meson.project_version()), language : 'c')
 
 # Solaris / Illumos
 if host_machine.system() == 'sunos'
diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
index d9e761e6..8cfc7e08 100644
--- a/tests/modetest/modetest.c
+++ b/tests/modetest/modetest.c
@@ -2129,6 +2129,7 @@ static void parse_fill_patterns(char *arg)
 static void usage(char *name)
 {
 	fprintf(stderr, "usage: %s [-acDdefMoPpsCvrw]\n", name);
+	fprintf(stderr, "libdrm version: %s\n", LIBDRM_VERSION);
 
 	fprintf(stderr, "\n Query options:\n\n");
 	fprintf(stderr, "\t-c\tlist connectors\n");
-- 
2.34.1

