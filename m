Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1481C70BBB9
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 13:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CDA10E02B;
	Mon, 22 May 2023 11:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9308E10E2D5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 11:25:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0B27661A28
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 11:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD97C433EF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 11:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684754758;
 bh=361gGao6ac3Vqb7eZUYFJ8CAIZIdjpvzLKR0VlUa/6k=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=AvgrlThYqqAReytJluQSC0Iohf/UnIOZHceMw9+3KRInQgFL7/V018wAWOik2WBsx
 M0T3Xk5wf5RXmc/84GMhEH6Zrbf9M7KdbpcshANY2uF3XIHAnIhEbK1hIKPJ4ByrSx
 mYjDOEx++o6MM/jdfh+/wnJSnjk/MdbaJcCATr36O7Pf7P9HJX+pg7wytPthGFJwew
 TtOzcpS9JDk7O45RzGerXt9t+QHCXIxcCxS0WJ9Ecm6zdhPOJ3sr+Iv0uJhcwagaxP
 8gj2s2nE+vfFYk62o/uk+mil8nN/UndqlYhkOTQrDTiGjh/XSXnP4iEOjMfzCPbf4Y
 ahAVPV7RpcCIg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] accel/habanalabs: move ioctl error print to debug level
Date: Mon, 22 May 2023 14:25:48 +0300
Message-Id: <20230522112548.1577359-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522112548.1577359-1-ogabbay@kernel.org>
References: <20230522112548.1577359-1-ogabbay@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We don't want to allow users to spam the kernel log and sending
ioctls with bad opcodes is a sure way to do it.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/habanalabs_ioctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
index 9a8be9395fb2..6a45a92344e9 100644
--- a/drivers/accel/habanalabs/common/habanalabs_ioctl.c
+++ b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
@@ -1195,7 +1195,7 @@ static long _hl_ioctl(struct file *filep, unsigned int cmd, unsigned long arg,
 
 out_err:
 	if (retcode)
-		dev_dbg(dev, "error in ioctl: pid=%d, cmd=0x%02x, nr=0x%02x\n",
+		dev_dbg_ratelimited(dev, "error in ioctl: pid=%d, cmd=0x%02x, nr=0x%02x\n",
 			  task_pid_nr(current), cmd, nr);
 
 	if (kdata != stack_kdata)
@@ -1219,7 +1219,7 @@ long hl_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	if ((nr >= HL_COMMAND_START) && (nr < HL_COMMAND_END)) {
 		ioctl = &hl_ioctls[nr];
 	} else {
-		dev_err(hdev->dev, "invalid ioctl: pid=%d, nr=0x%02x\n",
+		dev_dbg_ratelimited(hdev->dev, "invalid ioctl: pid=%d, nr=0x%02x\n",
 			task_pid_nr(current), nr);
 		return -ENOTTY;
 	}
@@ -1242,7 +1242,7 @@ long hl_ioctl_control(struct file *filep, unsigned int cmd, unsigned long arg)
 	if (nr == _IOC_NR(HL_IOCTL_INFO)) {
 		ioctl = &hl_ioctls_control[nr];
 	} else {
-		dev_err(hdev->dev_ctrl, "invalid ioctl: pid=%d, nr=0x%02x\n",
+		dev_dbg_ratelimited(hdev->dev_ctrl, "invalid ioctl: pid=%d, nr=0x%02x\n",
 			task_pid_nr(current), nr);
 		return -ENOTTY;
 	}
-- 
2.40.1

