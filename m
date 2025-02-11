Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143FBA3013C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 03:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499BF10E1B8;
	Tue, 11 Feb 2025 02:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.213])
 by gabe.freedesktop.org (Postfix) with SMTP id 7DCAA10E1B8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 02:01:22 +0000 (UTC)
Received: from localhost.localdomain (unknown [180.167.10.98])
 by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id A0DBA602A7271; 
 Tue, 11 Feb 2025 10:01:19 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: jacek.lawrynowicz@linux.intel.com, min.ma@amd.com, lizhi.hou@amd.com,
 ogabbay@kernel.org
Cc: Su Hui <suhui@nfschina.com>, quic_jhugo@quicinc.com, George.Yang@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH v2] accel/amdxdna: Add missing include linux/slab.h
Date: Tue, 11 Feb 2025 09:53:55 +0800
Message-Id: <20250211015354.3388171-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When compiling without CONFIG_IA32_EMULATION, there can be some errors:

drivers/accel/amdxdna/amdxdna_mailbox.c: In function ‘mailbox_release_msg’:
drivers/accel/amdxdna/amdxdna_mailbox.c:197:2: error: implicit declaration
of function ‘kfree’.
  197 |  kfree(mb_msg);
      |  ^~~~~
drivers/accel/amdxdna/amdxdna_mailbox.c: In function ‘xdna_mailbox_send_msg’:
drivers/accel/amdxdna/amdxdna_mailbox.c:418:11: error:implicit declaration
of function ‘kzalloc’.
  418 |  mb_msg = kzalloc(sizeof(*mb_msg) + pkg_size, GFP_KERNEL);
      |           ^~~~~~~

Add the missing include.

Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
Signed-off-by: Su Hui <suhui@nfschina.com>
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
---
v2:
 - move the header to the include block above and keep it sorted(Jacek Lawrynowicz).

 drivers/accel/amdxdna/amdxdna_mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index 814b16bb1953..e5301fac1397 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -8,6 +8,7 @@
 #include <linux/bitfield.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/slab.h>
 #include <linux/xarray.h>
 
 #define CREATE_TRACE_POINTS
-- 
2.30.2

