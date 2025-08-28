Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148F9B39E13
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 15:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D70E10E9A5;
	Thu, 28 Aug 2025 13:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="i2SWC5/z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DADA10E9A0;
 Thu, 28 Aug 2025 13:04:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756386276; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=oIDlUI4ZwzlEfkGiqanUfpsQVXG3mLX4NvcRnGm6w98te8xxPeesGKGm1JFwVBsEFf5Jg9+0sktkyKvFI7zcJYGBoN4wAyBJihQEKadf9VgjiCJ0pZkGgLWRkIyIRAv45DP8ESF7637YBkGCmguJDByQxzfISCcMlgZUvtJg6ZY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756386276;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Ie2H5VZp+VzajUmApq24wj3tHGgPG/tmk8ntNb7uUhc=; 
 b=Y7v6cMPiJYwmCnMIBSMdWE8xEZJ0/PJx53u2e3VXn7c/mDlFCEeErPzSOYIfX7b5CFpsCk+XHIRqBYS78Y6h8q5ZQwwv4cAeZcSdnTz2CS1HxTmsPjyOCARj5xvGvDMkXA/+UgV8geKacH7bo9BT+IOWtSyGUOIay/IjTakM0uI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756386276; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Ie2H5VZp+VzajUmApq24wj3tHGgPG/tmk8ntNb7uUhc=;
 b=i2SWC5/zk6dM9UHI5MnZRLgcZrtRG1Rd6N+2bCU5PE7+qyCpGfrwyhN3yuDC8ZDA
 PNB6NoJ0rYtIN+zQfibbq+RmSSAS4N30T8iR9PATSAD6qvh5f0WORSWU89TL42VeGnI
 AaG7kcRE01p5MHPpFgWYnjpK3qOrs7mfeGblIeGk=
Received: by mx.zohomail.com with SMTPS id 1756386274714591.3107495384984;
 Thu, 28 Aug 2025 06:04:34 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: adrinael@adrinael.net, arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com,
 boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH i-g-t 2/4] tests: panthor: add initial infrastructure
Date: Thu, 28 Aug 2025 10:03:58 -0300
Message-ID: <20250828130402.2549948-3-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250828130402.2549948-1-daniel.almeida@collabora.com>
References: <20250828130402.2549948-1-daniel.almeida@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Add the necessary code needed to compile panthor tests. The tests
themselves will be added in a subsequent patch.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 meson.build               |  8 ++++++++
 tests/meson.build         |  2 ++
 tests/panthor/meson.build | 11 +++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 tests/panthor/meson.build

diff --git a/meson.build b/meson.build
index aeed3b1d2..53098894e 100644
--- a/meson.build
+++ b/meson.build
@@ -288,6 +288,7 @@ libexecdir = join_paths(get_option('libexecdir'), 'igt-gpu-tools')
 amdgpudir = join_paths(libexecdir, 'amdgpu')
 msmdir = join_paths(libexecdir, 'msm')
 panfrostdir = join_paths(libexecdir, 'panfrost')
+panthordir = join_paths(libexecdir, 'panthor')
 v3ddir = join_paths(libexecdir, 'v3d')
 vc4dir = join_paths(libexecdir, 'vc4')
 vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
@@ -340,6 +341,12 @@ if get_option('use_rpath')
 	endforeach
 	panfrost_rpathdir = join_paths(panfrost_rpathdir, libdir)
 
+	panthor_rpathdir = '$ORIGIN'
+	foreach p : panthordir.split('/')
+		panthor_rpathdir = join_paths(panthor_rpathdir, '..')
+	endforeach
+	panthor_rpathdir = join_paths(panthor_rpathdir, libdir)
+
 	v3d_rpathdir = '$ORIGIN'
 	foreach p : v3ddir.split('/')
 		v3d_rpathdir = join_paths(v3d_rpathdir, '..')
@@ -363,6 +370,7 @@ else
 	amdgpudir_rpathdir = ''
 	msm_rpathdir = ''
 	panfrost_rpathdir = ''
+	panthor_rpathdir = ''
 	v3d_rpathdir = ''
 	vc4_rpathdir = ''
 	vmwgfx_rpathdir = ''
diff --git a/tests/meson.build b/tests/meson.build
index 5c01c64e9..38bedebd9 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -486,6 +486,8 @@ subdir('msm')
 
 subdir('panfrost')
 
+subdir('panthor')
+
 subdir('v3d')
 
 subdir('vc4')
diff --git a/tests/panthor/meson.build b/tests/panthor/meson.build
new file mode 100644
index 000000000..979ae91e0
--- /dev/null
+++ b/tests/panthor/meson.build
@@ -0,0 +1,11 @@
+panthor_progs = [
+]
+
+foreach prog : panthor_progs
+	test_executables += executable(prog, prog + '.c',
+				       dependencies : test_deps,
+				       install_dir : panthordir,
+				       install_rpath : panthor_rpathdir,
+				       install : true)
+	test_list += join_paths('panthor', prog)
+endforeach
-- 
2.50.1

