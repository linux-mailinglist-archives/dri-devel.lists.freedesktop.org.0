Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A410D604AB1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 17:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A69610EAF1;
	Wed, 19 Oct 2022 15:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35AD510EAF1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 15:09:23 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1666191375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yQcHjaE6CQfq7iO6zRmu96wMYI8aMwb9KZsnUEYxyHY=;
 b=uJxwQf34Ytc+E+xlVFr+QJdkNyrMOfUvwvaZcWKOsw0HPBVGrb4yMLRvikG5fD7cUCCc3C
 28HKnPfM+uG1Z5z4L56fxWXyrRIKTZSVZptsjItATwqm3Q4MhzYIPKqCJpyLB7fFVS0j6u
 /X9PqMg8IxzzFdciI7TDe8A+OYuDmG+ME1toyuS2fFqmqa1hTm+YBUxQV3oCJZHXuqalbQ
 QU8S/p/3lIK/8LUUToUovSXE4jfY76zMpDU7MTtRzM++2mNnVj7bKvcl8AgTMdYYD4YXz3
 z8y5puCaOyxnbNpSsfsdnnyyPts9YXiBFHfz2EsNyXbwpHaTQcRNqZA6iu/ZOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1666191375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yQcHjaE6CQfq7iO6zRmu96wMYI8aMwb9KZsnUEYxyHY=;
 b=FnIygPB0dsrSCCUyaFzWqQi5S8pnwh8nD/V378wLSKMrAbys4FHt9SsFaYaowHj8t+QBgh
 QwF/uqpaFI+ppICQ==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH printk v2 24/38] xen: fbfront: use srcu console list iterator
Date: Wed, 19 Oct 2022 17:01:46 +0206
Message-Id: <20221019145600.1282823-25-john.ogness@linutronix.de>
In-Reply-To: <20221019145600.1282823-1-john.ogness@linutronix.de>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
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
Cc: Juergen Gross <jgross@suse.com>, linux-fbdev@vger.kernel.org,
 Tom Rix <trix@redhat.com>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the console_lock is not being used for anything other than
safe console list traversal, use srcu console list iteration instead.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 drivers/video/fbdev/xen-fbfront.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
index 4d2694d904aa..2552c853c6c2 100644
--- a/drivers/video/fbdev/xen-fbfront.c
+++ b/drivers/video/fbdev/xen-fbfront.c
@@ -500,16 +500,18 @@ static int xenfb_probe(struct xenbus_device *dev,
 static void xenfb_make_preferred_console(void)
 {
 	struct console *c;
+	int cookie;
 
 	if (console_set_on_cmdline)
 		return;
 
-	console_lock();
-	for_each_console(c) {
+	cookie = console_srcu_read_lock();
+	for_each_console_srcu(c) {
 		if (!strcmp(c->name, "tty") && c->index == 0)
 			break;
 	}
-	console_unlock();
+	console_srcu_read_unlock(cookie);
+
 	if (c) {
 		unregister_console(c);
 		c->flags |= CON_CONSDEV;
-- 
2.30.2

