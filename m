Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD19F25C89B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 20:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A656E204;
	Thu,  3 Sep 2020 18:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com
 [IPv6:2607:f8b0:4864:20::f49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1FE6E204
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 18:16:58 +0000 (UTC)
Received: by mail-qv1-xf49.google.com with SMTP id y32so2325275qve.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 11:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=l9dmc/8Gy2gfae1Oa9YnsHQ0v4BtDJdWSppLEszGZVI=;
 b=bK6BmvhNktIyP+Wd+taLi8BePFuV2NBvASVJ7pAmkhPgHWcCss+wH+I+qv9O5SDB4r
 EUXAOAv2wEw2IPDyjXZq2hTlQNIYrkdlFj/lAdaVqRM07SZe+sMvqk+40X677ubzreF3
 HkksBfzV7XNEIZmbK9pJCSQq9OjNP+pWje0yeWR8PYfYdEB0d+V7bLGxZ6LmD19o5uii
 5D/YmNZnM8Oax6xj0V7CZbu/tVT8EBcqn9YuPWimvJl3BRQgj/n4lECTaizmCXK5ZRrW
 QAsUtIiNNknRwoAOT+l/+rZw0BYAzhhTLoUABn8f6sW1m8hRA9WXEj8w9uNSmB95kRYS
 z6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=l9dmc/8Gy2gfae1Oa9YnsHQ0v4BtDJdWSppLEszGZVI=;
 b=fMaTIPqps4V0RJ2lneE859NSrF/4uU9zzqBNpNeDKkKu5jkNxISVpJXopZog9OHMDw
 Gr5ruKeXsw+t4b86k/ja7QaLDld++9Q0k2pkBe9fQjrdwmJm2w1JoUlwpWidKC1bS3Sx
 tFi7HGQz/ys/H85YCVMFU2tg7Wnyk7DAFT59MVrvnxhoi/yO6Li35Q9oi0ohvNDL451M
 EzG/BbdP8dwRJwsz3QPfylXJdxUq7xRobXV5r9Z7MC+5UKaDOiNb61Trmc3QnHZ1wG6C
 3RjK//+PiMNCbRJZC+neNMeOPBg9wETmXLTf50slhlNQpaIUu5yO2Wv/NZUaUyjew84G
 Ja6A==
X-Gm-Message-State: AOAM530XKsqJsFTHgSa2kTl6K1c4zxE1J6fFHGy8TaB92MglfCra6owf
 soEYg5Wrh8KuvupbxP3EkcpeXm6p3x2ycEAT0RGQHwykv7k5Bi4AV8PBxLa9u5kZ4ihT0Y9jTyv
 f+xtMfFQaXSFjZTWJ9qFfP4fcuTjsbE17iR2pcp92XV2RifwY9XkMnPtibrvfvyL5xxQhXAoHNk
 /Ja8dUFg==
X-Google-Smtp-Source: ABdhPJx2CxYzWkRMZ+Fk7PStUCx+GbKTUDCbMribS7VDriwzrbLElBpLQFDDYAuz+QrPvtb74mK0Iq/ZMYwW0Hc=
X-Received: from ikelos.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:5eca])
 (user=hoegsberg job=sendgmr) by 2002:a0c:a3e5:: with SMTP id
 v92mr3009691qvv.10.1599157017703; Thu, 03 Sep 2020 11:16:57 -0700 (PDT)
Date: Thu,  3 Sep 2020 18:16:52 +0000
Message-Id: <20200903181652.432067-1-hoegsberg@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
Subject: [PATCH] udmabuf: Add missing compact_ioctl
From: "Kristian H. Kristensen" <hoegsberg@google.com>
To: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
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
Cc: "Kristian H. Kristensen" <hoegsberg@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make sure we can use this on mixed systems.

Signed-off-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/dma-buf/udmabuf.c | 3 +++
 1 file changed, 3 insertions(+)

Sorry Gerd for all the spam. Once I finally got git send-email
working, I ended up sending a version with all ChromeOS decorations,
of course.  Here's a normal upstream version.

Email based workflow - the barrier is real.

Kristian

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 9635897458a0..6f4ff6ede050 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -270,6 +270,9 @@ static long udmabuf_ioctl(struct file *filp, unsigned int ioctl,
 static const struct file_operations udmabuf_fops = {
 	.owner		= THIS_MODULE,
 	.unlocked_ioctl = udmabuf_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl   = udmabuf_ioctl,
+#endif
 };
 
 static struct miscdevice udmabuf_misc = {
-- 
2.28.0.402.g5ffc5be6b7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
