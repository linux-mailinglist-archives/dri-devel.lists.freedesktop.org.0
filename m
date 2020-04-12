Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8B41A64AE
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 11:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991D16E250;
	Mon, 13 Apr 2020 09:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 371 seconds by postgrey-1.36 at gabe;
 Sun, 12 Apr 2020 17:48:37 UTC
Received: from out1.migadu.com (out1.migadu.com [IPv6:2001:41d0:2:863f::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C85E89E63
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Apr 2020 17:48:37 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kl.wtf; s=default;
 t=1586713341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=QGTj9vacKFMe4KyrGZOKCTbV4bswudoVDUKoucM67y8=;
 b=qjzzKIFTCoUEqkc0DGzsUhIqN58i8tuW/sStNYiH4CjG9TbQ4WDzmF7EXJcvp+mhx+VsiR
 mUDd0w9MZj5fytBVT6iNwx8BIGgeV8iG+KPituHpcHAphUQLuzCBLh0ZFrj38LX7vzVAn0
 v7jNSrD3VsUQ6dgbQCPJugnx9W1/sgw=
From: Kenny Levinsen <kl@kl.wtf>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: make drm_file use keyed wakeups
Date: Sun, 12 Apr 2020 19:41:21 +0200
Message-Id: <20200412174121.5841-1-kl@kl.wtf>
MIME-Version: 1.0
X-Spam-Score: 4.90
X-Mailman-Approved-At: Mon, 13 Apr 2020 09:29:25 +0000
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
Cc: Kenny Levinsen <kl@kl.wtf>, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some processes, such as systemd, are only polling for EPOLLERR|EPOLLHUP.
As drm_file uses unkeyed wakeups, such a poll receives many spurious
wakeups from uninteresting events.

Use keyed wakeups to allow the wakeup target to more efficiently discard
these uninteresting events.

Signed-off-by: Kenny Levinsen <kl@kl.wtf>
---
 drivers/gpu/drm/drm_file.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index c4c704e01961..ec25b3d979d9 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -608,7 +608,8 @@ ssize_t drm_read(struct file *filp, char __user *buffer,
 				file_priv->event_space -= length;
 				list_add(&e->link, &file_priv->event_list);
 				spin_unlock_irq(&dev->event_lock);
-				wake_up_interruptible(&file_priv->event_wait);
+				wake_up_interruptible_poll(&file_priv->event_wait,
+					EPOLLIN | EPOLLRDNORM);
 				break;
 			}
 
@@ -804,7 +805,8 @@ void drm_send_event_locked(struct drm_device *dev, struct drm_pending_event *e)
 	list_del(&e->pending_link);
 	list_add_tail(&e->link,
 		      &e->file_priv->event_list);
-	wake_up_interruptible(&e->file_priv->event_wait);
+	wake_up_interruptible_poll(&e->file_priv->event_wait,
+		EPOLLIN | EPOLLRDNORM);
 }
 EXPORT_SYMBOL(drm_send_event_locked);
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
