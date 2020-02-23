Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C52416A1FD
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:21:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B4C6E2DA;
	Mon, 24 Feb 2020 09:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482376E126
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 05:37:27 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id d6so3262580pgn.5
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 21:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Jee2SBqk+0iCdDlNnaMTYkI5LIDo4uPuFdHmJKyhq4Y=;
 b=HmabNhD8fNO6NyV59b5ZxrZ3Od8PvSWC8dfeSBv5te9BSwvwc59NUWJ4OoU+PXcrMa
 0O+U2IQBA94HFQobMUaMNlYBNQNrUE+F5US1cyQwTPbrPAo0nCBZTl89hDMBEaWdkUJi
 WnuHSU3gjbI6gi9eHWSb7lA4HwWHUX+5ZGRufCo3j1FPcNMePE2R2uwe0uLsWMwULSFM
 aSs/zsibs4X6i3C3imypwUdizSjgKIhVAcz0XS16BNcGo1yctdWEvMoGkImZxYCS8aS1
 BpmmcwMTqgTgl0icEzht/AjS8//THed3Z4tUrJFWhPH4ELz4HntUaYswph1W02k7ccYF
 PGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Jee2SBqk+0iCdDlNnaMTYkI5LIDo4uPuFdHmJKyhq4Y=;
 b=h8aehpx3c5AUINPfMoyF7meqpQfPF+5EmnaJFnWl18lwZFP+HvIvmMfu9MpFNkN7Xn
 1GmcMWOWfT5cFSlM7N0n6/caEk2FAVAwmqiKLC+ea5emo5Pk6ltRUhJvzk86b0owumVw
 DpmCj6OLieA+66vxIk1/RIbqsdj/CsTa9zv+I+tL91blCiue7wO6Wuz/7iXVIRdDUwiO
 xRrzNW0T8Z/UAIGsrDu0IPpE0vqzluW0MSMyPFcgV95fFz/bN5WF8nxgcY9q2VLO2C9v
 VJEI6ATgS1vq27APhHVrm2Xou4FiI3LMWU5mcc522sWravPlAb+58c3wwspt2zj6zzqC
 m3lw==
X-Gm-Message-State: APjAAAXhCrRMWsXHtE1XkXJNwnB//u3EF8ukrYL7vfSahuhxoJZRMiUR
 Yb74mRpycdfscyqVgnUvMiE=
X-Google-Smtp-Source: APXvYqx7jzIVBLhwmGh1VmBYIQ/J0ZaUEYnGExuyOF/oezGiKz6+s6kEpzOVOMAXj94uFgcwFtIAHw==
X-Received: by 2002:a63:7207:: with SMTP id n7mr28082472pgc.253.1582436246780; 
 Sat, 22 Feb 2020 21:37:26 -0800 (PST)
Received: from localhost ([43.224.245.179])
 by smtp.gmail.com with ESMTPSA id h13sm7679357pjc.9.2020.02.22.21.37.25
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Sat, 22 Feb 2020 21:37:26 -0800 (PST)
From: qiwuchen55@gmail.com
To: sumit.semwal@linaro.org,
	gustavo@padovan.org
Subject: [PATCH] dma-buf/sync_debug: convert to list_for_each_entry()
Date: Sun, 23 Feb 2020 13:37:20 +0800
Message-Id: <1582436240-14113-1-git-send-email-qiwuchen55@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:20:26 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, chenqiwu <chenqiwu@xiaomi.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: chenqiwu <chenqiwu@xiaomi.com>

Convert list_for_each() to list_for_each_entry() to simplify code.

Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
---
 drivers/dma-buf/sync_debug.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
index 101394f..05cfeee 100644
--- a/drivers/dma-buf/sync_debug.c
+++ b/drivers/dma-buf/sync_debug.c
@@ -106,13 +106,12 @@ static void sync_print_fence(struct seq_file *s,
 
 static void sync_print_obj(struct seq_file *s, struct sync_timeline *obj)
 {
-	struct list_head *pos;
+	struct sync_pt *pt;
 
 	seq_printf(s, "%s: %d\n", obj->name, obj->value);
 
 	spin_lock_irq(&obj->lock);
-	list_for_each(pos, &obj->pt_list) {
-		struct sync_pt *pt = container_of(pos, struct sync_pt, link);
+	list_for_each_entry(pt, &obj->pt_list, link) {
 		sync_print_fence(s, &pt->base, false);
 	}
 	spin_unlock_irq(&obj->lock);
@@ -140,16 +139,13 @@ static void sync_print_sync_file(struct seq_file *s,
 
 static int sync_info_debugfs_show(struct seq_file *s, void *unused)
 {
-	struct list_head *pos;
+	struct sync_timeline *obj;
+	struct sync_file *sync_file;
 
 	seq_puts(s, "objs:\n--------------\n");
 
 	spin_lock_irq(&sync_timeline_list_lock);
-	list_for_each(pos, &sync_timeline_list_head) {
-		struct sync_timeline *obj =
-			container_of(pos, struct sync_timeline,
-				     sync_timeline_list);
-
+	list_for_each_entry(obj, &sync_timeline_list_head, sync_timeline_list) {
 		sync_print_obj(s, obj);
 		seq_putc(s, '\n');
 	}
@@ -158,10 +154,7 @@ static int sync_info_debugfs_show(struct seq_file *s, void *unused)
 	seq_puts(s, "fences:\n--------------\n");
 
 	spin_lock_irq(&sync_file_list_lock);
-	list_for_each(pos, &sync_file_list_head) {
-		struct sync_file *sync_file =
-			container_of(pos, struct sync_file, sync_file_list);
-
+	list_for_each_entry(sync_file, &sync_file_list_head, sync_file_list) {
 		sync_print_sync_file(s, sync_file);
 		seq_putc(s, '\n');
 	}
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
