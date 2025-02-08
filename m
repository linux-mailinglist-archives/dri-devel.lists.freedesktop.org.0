Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ADBA2D4C1
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 09:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C1610E03A;
	Sat,  8 Feb 2025 08:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.213])
 by gabe.freedesktop.org (Postfix) with SMTP id E0B6110E03A
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 08:06:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [180.167.10.98])
 by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 6926D6019A503; 
 Sat,  8 Feb 2025 16:05:56 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: min.ma@amd.com,
	lizhi.hou@amd.com,
	ogabbay@kernel.org
Cc: Su Hui <suhui@nfschina.com>, quic_jhugo@quicinc.com, George.Yang@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] accel/amdxdna: Add missing include linux/slab.h
Date: Sat,  8 Feb 2025 16:05:49 +0800
Message-Id: <20250208080548.1062441-1-suhui@nfschina.com>
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

When compiling without CONFIG_IA32_EMULATION, there are some errors:

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
---
 drivers/accel/amdxdna/amdxdna_mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index 814b16bb1953..80b4b20addd6 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -12,6 +12,7 @@
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/amdxdna.h>
+#include <linux/slab.h>
 
 #include "amdxdna_mailbox.h"
 
-- 
2.30.2

