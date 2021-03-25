Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450033499DE
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 19:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C026EE13;
	Thu, 25 Mar 2021 18:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9106EE09;
 Thu, 25 Mar 2021 18:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hiler.eu;
 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
 :Message-Id:Date:Subject:Cc:To:From;
 bh=lvDALWSEjbkoQcnRdzPBtcWeaRAlUJzh/ORCBw1xP/k=; b=5ZMMnas1OQdW9yaGaoV3YJ3IEZ
 V3t3M7dcV+Fomli/KO7NgCJo1mfvhA1ugR8i5RKFYnBfCdvuCZLIHFnnhWAxXsrx3a1zkqvHdwOw0
 dvr83L9KfxqX/sZPh82xcXr3oFyfFZ0np5jgXE9VpyG+yTXdjXG+CSKAZVh8oLUwXkZTfPLTkyYXm
 KnbFHBr+C3IY13bnqWKlVLvCwC8Rla4/hnuYwgAG95Lb+IxfuASTItoXZ2Y2WwWAbMqi2hcCt2bTT
 0NCyvjj9ANpd0GkMgoAkLPaSP6cYu9fJuW2wcCXbD39bbX2pNeRVLBYwSe0wWoGlD/bdxzOpeDGUS
 CmG5IQpA==;
Received: from [10.9.9.73] (helo=submission02.runbox)
 by mailtransmit03.runbox with esmtp (Exim 4.86_2)
 (envelope-from <arek@hiler.eu>)
 id 1lPVCk-0001zB-7V; Thu, 25 Mar 2021 19:59:38 +0100
Received: by submission02.runbox with esmtpsa [Authenticated alias (933559)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1lPVCV-0006Jk-Hl; Thu, 25 Mar 2021 19:59:23 +0100
From: Arkadiusz Hiler <arek@hiler.eu>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/5] tests: Remove ddx_intel_after_fbdev
Date: Thu, 25 Mar 2021 20:59:13 +0200
Message-Id: <20210325185915.51590-3-arek@hiler.eu>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210325185915.51590-1-arek@hiler.eu>
References: <20210325185915.51590-1-arek@hiler.eu>
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
Cc: intel-gfx@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's not a even a proper test.

Suggested-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Arkadiusz Hiler <arek@hiler.eu>
---
 tests/Makefile.sources      |  4 --
 tests/ddx_intel_after_fbdev | 73 -------------------------------------
 2 files changed, 77 deletions(-)
 delete mode 100755 tests/ddx_intel_after_fbdev

diff --git a/tests/Makefile.sources b/tests/Makefile.sources
index 4f24fb3a..ffc7878a 100644
--- a/tests/Makefile.sources
+++ b/tests/Makefile.sources
@@ -550,10 +550,6 @@ kernel_tests_full = \
 	$(extra_kernel_tests) \
 	$(NULL)
 
-scripts = \
-	ddx_intel_after_fbdev \
-	$(NULL)
-
 IMAGES = pass.png 1080p-left.png 1080p-right.png
 
 testdisplay_SOURCES = \
diff --git a/tests/ddx_intel_after_fbdev b/tests/ddx_intel_after_fbdev
deleted file mode 100755
index f068209d..00000000
--- a/tests/ddx_intel_after_fbdev
+++ /dev/null
@@ -1,73 +0,0 @@
-#!/bin/bash
-#
-# Testcase: Load Intel DDX after fbdev was loaded
-#
-
-whoami | grep -q root || {
-	echo "ERROR: not running as root"
-	exit 1
-}
-
-# no other X session should be running
-find /tmp/ -name .X*lock 2>/dev/null | grep -q X && {
-	echo "ERROR: X session already running"
-	exit 1
-}
-
-TMPDIR=$(mktemp -d /tmp/igt.XXXX) || {
-	echo "ERROR: Failed to create temp dir"
-	exit 1
-}
-
-cat > $TMPDIR/xorg.conf.fbdev << EOF
-Section "Device"
-	Driver		"fbdev"
-	Identifier 	"Device[fbdev]"
-EndSection
-EOF
-
-cat > $TMPDIR/xorg.conf.intel << EOF
-Section "Device"
-	Driver		"intel"
-	Identifier 	"Device[intel]"
-EndSection
-EOF
-
-# log before fbdev
-dmesg -c > $TMPDIR/dmesg.1.before.fbdev
-cp /var/log/Xorg.0.log $TMPDIR/Xorg.0.log.1.before.fbdev
-
-# run fbdev
-xinit -- /usr/bin/X -config $TMPDIR/xorg.conf.fbdev & 
-sleep 5
-if [ -f `which intel_reg` ]; then
-`which intel_reg` dump > $TMPDIR/intel_reg_dump.1.fbdev
-fi
-killall X
-
-# log after fbdev & before intel
-dmesg -c > $TMPDIR/dmesg.2.after.fbdev.before.intel
-cp /var/log/Xorg.0.log $TMPDIR/Xorg.0.log.2.after.fbdev.before.intel
-
-sleep 5
-
-# run intel
-xinit -- /usr/bin/X -config $TMPDIR/xorg.conf.intel & 
-sleep 5 
-if [ -f `which intel_reg` ]; then
-`which intel_reg` dump > $TMPDIR/intel_reg_dump.2.intel
-fi
-killall X
-
-# log after intel
-dmesg -c > $TMPDIR/dmesg.3.after.intel
-cp /var/log/Xorg.0.log $TMPDIR/Xorg.0.log.3.after.intel
-
-cp $0 $TMPDIR/
-
-tar czf $TMPDIR.tar.gz $TMPDIR/*
-if [ -f $TMPDIR.tar.gz ]; then
-	echo $TMPDIR.tar.gz contains this script, all configs and logs generated on this tests
-fi
-
-exit 0
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
